#!/bin/bash

#SBATCH --account=k1056
#SBATCH --job-name=ASOFI
#SBATCH --time=00:20:00
#SBATCH --hint=nomultithread
#SBATCH --ntasks-per-node=32
#SBATCH --ntasks-per-socket=16
#SBATCH	--threads-per-core=1
#SBATCH --ntasks=4096
#SBATCH	--nodes=128


#----excecute with LAMMPI
#lamboot -v mpihosts
#lamboot

#mpirun -np 8 nice -19 ../bin/sofi3D_acoustic ./in_and_out/sofi3D.json | tee ./in_and_out/sofi3D.jout
#mpirun -np 8 nice -19 ../bin/sofi3D ./in_and_out/sofi3D.inp | tee ./in_and_out/sofi3D.out

# profiling with nvprof
#mpirun -np 8 nice -19 nvprof --cpu-profiling on ../bin/sofi3D ./in_and_out/sofi3D.json | tee ./in_and_out/sofi3D.jout


#----execute with OPENMPI2

mpirun -np 24 nice -19 ../bin/sofi3D ./in_and_out/sofi3D.json | tee ./in_and_out/sofi3D.jout


#mpirun --hostfile mpihosts -np 8 nice -19 ../bin/sofi3D ./in_and_out/sofi3D.json | tee ./in_and_out/sofi3D.jout

#merge snapshots
#../bin/snapmerge ./in_and_out/sofi3D.json


