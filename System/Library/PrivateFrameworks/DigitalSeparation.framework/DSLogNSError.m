@implementation DSLogNSError

void __DSLogNSError_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DigitalSeparation", "DSLogNSError");
  v1 = (void *)DSLogNSError_log;
  DSLogNSError_log = (uint64_t)v0;

}

@end
