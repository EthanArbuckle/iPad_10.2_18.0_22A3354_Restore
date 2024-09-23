@implementation CFSocketGetTypeID

uint64_t __CFSocketGetTypeID_block_invoke()
{
  int v0;
  uint64_t result;
  rlim_t v2;
  rlimit v3;
  size_t v4;
  int rlim_max;
  rlimit v6;
  int v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6.rlim_cur = 0;
  v6.rlim_max = 0;
  v0 = getrlimit(8, &v6);
  *(_QWORD *)v7 = 0x1D00000001;
  rlim_max = 0;
  v4 = 4;
  result = sysctl(v7, 2u, &rlim_max, &v4, 0, 0);
  if (result | v0)
  {
    if (v0)
      return result;
    LODWORD(v2) = rlim_max;
  }
  else
  {
    LODWORD(v2) = rlim_max;
    if (v6.rlim_max < rlim_max)
    {
      rlim_max = v6.rlim_max;
      LODWORD(v2) = v6.rlim_max;
    }
  }
  if (v6.rlim_cur < (int)v2)
  {
    v2 = (int)v2;
    v3 = v6;
    if (v6.rlim_cur + 2304 < (int)v2)
      v2 = v6.rlim_cur + 2304;
    v3.rlim_cur = v2;
    return setrlimit(8, &v3);
  }
  return result;
}

@end
