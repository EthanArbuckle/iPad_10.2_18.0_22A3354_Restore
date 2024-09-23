@implementation MCLogCategoryVolume

void __MCLogCategoryVolume_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediacontrols", "Volume");
  v1 = (void *)MCLogCategoryVolume__log;
  MCLogCategoryVolume__log = (uint64_t)v0;

}

@end
