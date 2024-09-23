@implementation PHImportConcurrencyLimit

double __PHImportConcurrencyLimit_block_invoke()
{
  void *v0;
  double result;
  unint64_t v2;
  size_t v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PHImportConcurrencyLimit_concurrencyLimit = objc_msgSend(v0, "integerForKey:", CFSTR("DebugImportConcurrency"));

  if (!PHImportConcurrencyLimit_concurrencyLimit)
  {
    v3 = 8;
    v4 = 0;
    if (!sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0))
    {
      v2 = v4;
      if (!v4)
        v2 = 2;
      result = (double)v2 * 0.5 + (double)v2;
      PHImportConcurrencyLimit_concurrencyLimit = (uint64_t)result;
    }
  }
  return result;
}

@end
