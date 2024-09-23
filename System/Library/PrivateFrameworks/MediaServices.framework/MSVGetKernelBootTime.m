@implementation MSVGetKernelBootTime

double __MSVGetKernelBootTime_block_invoke()
{
  double result;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = 0;
  v2 = 16;
  *(_QWORD *)v5 = 0x1500000001;
  if (sysctl(v5, 2u, &v3, &v2, 0, 0) != -1 && v3 != 0)
  {
    result = (double)(int)v4 / 1000000.0 + (double)v3;
    *(double *)&MSVGetKernelBootTime___kernelBootTime = result;
  }
  return result;
}

@end
