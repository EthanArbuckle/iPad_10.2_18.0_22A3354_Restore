@implementation MXMMachUtils

+ (mach_timebase_info)_timebase
{
  if (_timebase_onceToken != -1)
    dispatch_once(&_timebase_onceToken, &__block_literal_global_1);
  return (mach_timebase_info *)&_timebase_localTimebase;
}

uint64_t __25__MXMMachUtils__timebase__block_invoke()
{
  uint64_t result;
  id v1;

  result = mach_timebase_info(&_timebase_localTimebase);
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("MXMUtils"), CFSTR("Failed to retrieve local timebase info."), 0);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v1);
  }
  return result;
}

+ (double)_nanosecondsWithAbsoluteTime:(unint64_t)a3
{
  unsigned int v5;

  v5 = *(_DWORD *)objc_msgSend(a1, "_timebase");
  return (double)(v5 / *(_DWORD *)(objc_msgSend(a1, "_timebase") + 4) * a3);
}

+ (double)_nanosecondsWithContinuousTime:(unint64_t)a3
{
  unsigned int v5;

  v5 = *(_DWORD *)objc_msgSend(a1, "_timebase");
  return (double)(v5 / *(_DWORD *)(objc_msgSend(a1, "_timebase") + 4) * a3);
}

+ (unint64_t)_absoluteTimeWithNanoseconds:(double)a3
{
  unsigned int v5;

  v5 = *(_DWORD *)objc_msgSend(a1, "_timebase");
  return (unint64_t)(a3 / (double)(v5 / *(_DWORD *)(objc_msgSend(a1, "_timebase") + 4)));
}

+ (id)_processNameWithBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleExecutable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

@end
