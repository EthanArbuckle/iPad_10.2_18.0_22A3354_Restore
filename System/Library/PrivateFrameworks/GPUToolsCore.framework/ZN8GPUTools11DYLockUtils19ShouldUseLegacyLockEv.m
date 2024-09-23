@implementation ZN8GPUTools11DYLockUtils19ShouldUseLegacyLockEv

void *___ZN8GPUTools11DYLockUtils19ShouldUseLegacyLockEv_block_invoke()
{
  void *result;

  GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock = 1;
  result = dlsym((void *)0xFFFFFFFFFFFFFFFELL, "os_unfair_lock_lock");
  GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock = result == 0;
  return result;
}

@end
