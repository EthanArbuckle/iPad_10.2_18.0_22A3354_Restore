@implementation ARLogGeneral

void ___ARLogGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral_logObj;
  _ARLogGeneral_logObj = (uint64_t)v0;

}

@end
