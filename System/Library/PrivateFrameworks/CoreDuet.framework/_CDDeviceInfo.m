@implementation _CDDeviceInfo

+ (BOOL)isRunningOnInternalBuild
{
  if (isRunningOnInternalBuild_onceToken != -1)
    dispatch_once(&isRunningOnInternalBuild_onceToken, &__block_literal_global_82);
  return isRunningOnInternalBuild_isInternalBuild;
}

@end
