@implementation MCLogCategoryRouting

void __MCLogCategoryRouting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediacontrols", "Routing");
  v1 = (void *)MCLogCategoryRouting__log;
  MCLogCategoryRouting__log = (uint64_t)v0;

}

@end
