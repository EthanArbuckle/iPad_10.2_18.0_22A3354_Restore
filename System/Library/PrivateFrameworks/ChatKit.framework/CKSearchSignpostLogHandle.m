@implementation CKSearchSignpostLogHandle

void __CKSearchSignpostLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "CKSearchSignpost");
  v1 = (void *)CKSearchSignpostLogHandle_osLog;
  CKSearchSignpostLogHandle_osLog = (uint64_t)v0;

}

@end
