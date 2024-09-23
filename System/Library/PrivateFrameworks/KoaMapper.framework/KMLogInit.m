@implementation KMLogInit

void __KMLogInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.vocabulary", "KoaMapper");
  v1 = (void *)KMLogContextCore;
  KMLogContextCore = (uint64_t)v0;

}

@end
