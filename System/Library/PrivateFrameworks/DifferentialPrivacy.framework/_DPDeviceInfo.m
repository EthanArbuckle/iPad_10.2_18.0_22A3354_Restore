@implementation _DPDeviceInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  return isInternalBuild_isInternalBuild;
}

+ (id)osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = (__CFString *)MGCopyAnswer();
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("???");
  v5 = v4;
  if (v3)
    v6 = v3;
  else
    v6 = CFSTR("???");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@)"), CFSTR("iPhone OS"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);

  return v8;
}

+ (BOOL)isDataCollectionEnabled
{
  if (isDataCollectionEnabled_onceToken != -1)
    dispatch_once(&isDataCollectionEnabled_onceToken, &__block_literal_global_12);
  return isDataCollectionEnabled_dataCollectionEnabled;
}

+ (BOOL)isDisabledByTaskingForTransport:(unint64_t)a3
{
  if (a3 == 4)
    return objc_msgSend(a1, "isDisabledByTaskingForDedisco");
  if (a3 == 1)
    return objc_msgSend(a1, "isDisabledByTaskingForCrashCopier");
  return 0;
}

+ (BOOL)isDisabledByTaskingForCrashCopier
{
  void *v3;
  void *v4;
  char v5;

  if ((objc_msgSend((id)objc_opt_class(), "isRunningUnitTests") & 1) != 0)
    return 0;
  v3 = (void *)MEMORY[0x1D8256B78]();
  OSAGetDATaskingValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_autoreleasePoolPop(v3);
  return v5;
}

+ (BOOL)isDisabledByTaskingForDedisco
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)MEMORY[0x1D8256B78](a1, a2);
  OSAGetDATaskingValue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_autoreleasePoolPop(v2);
  return v4;
}

+ (BOOL)isRunningUnitTests
{
  if (isRunningUnitTests_onceToken != -1)
    dispatch_once(&isRunningUnitTests_onceToken, &__block_literal_global_17);
  return isRunningUnitTests_runningTests;
}

+ (BOOL)isRunningAsLaunchDaemon
{
  return 0;
}

@end
