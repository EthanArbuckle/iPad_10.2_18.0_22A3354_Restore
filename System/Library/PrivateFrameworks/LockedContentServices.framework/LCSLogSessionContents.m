@implementation LCSLogSessionContents

void __LCSLogSessionContents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LockedContentServices", "SessionContents");
  v1 = (void *)LCSLogSessionContents___logObj;
  LCSLogSessionContents___logObj = (uint64_t)v0;

}

@end
