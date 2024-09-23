@implementation UIImage

void ___ef_log_UIImage_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "UIImage");
  v1 = (void *)_ef_log_UIImage_log;
  _ef_log_UIImage_log = (uint64_t)v0;

}

@end
