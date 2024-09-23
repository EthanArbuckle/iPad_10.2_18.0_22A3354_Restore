@implementation MSVGetProcessLaunchTime

void __MSVGetProcessLaunchTime_block_invoke()
{
  int *v0;
  size_t v1;
  int v2[2];
  int v3;
  pid_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0xE00000001;
  v3 = 1;
  v4 = getpid();
  v1 = 0;
  if (!sysctl(v2, 4u, 0, &v1, 0, 0))
  {
    v0 = (int *)malloc_type_calloc(1uLL, 0x288uLL, 0x10B2040B74D5165uLL);
    if (!sysctl(v2, 4u, v0, &v1, 0, 0))
      *(double *)&MSVGetProcessLaunchTime___processLaunchTime = (double)v0[2] / 1000000.0 + (double)*(uint64_t *)v0;
    free(v0);
  }
}

@end
