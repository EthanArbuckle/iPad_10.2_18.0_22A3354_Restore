@implementation MCLogCategoryDefault

void __MCLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediacontrols", "Default");
  v1 = (void *)MCLogCategoryDefault__log;
  MCLogCategoryDefault__log = (uint64_t)v0;

}

@end
