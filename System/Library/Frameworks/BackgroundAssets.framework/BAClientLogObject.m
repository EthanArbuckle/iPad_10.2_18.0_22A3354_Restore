@implementation BAClientLogObject

void __BAClientLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.backgroundassets", "client");
  v1 = (void *)BAClientLogObject_obj;
  BAClientLogObject_obj = (uint64_t)v0;

}

@end
