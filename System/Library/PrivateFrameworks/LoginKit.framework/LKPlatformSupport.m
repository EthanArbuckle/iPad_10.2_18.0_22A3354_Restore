@implementation LKPlatformSupport

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_2);
  return isInternalBuild_isInternalBuild;
}

void __36__LKPlatformSupport_isInternalBuild__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isInternalBuild_isInternalBuild = CFEqual(v0, CFSTR("Internal")) != 0;
    CFRelease(v1);
  }
}

@end
