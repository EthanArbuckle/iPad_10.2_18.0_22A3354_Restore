@implementation AXLogValidations

void __AXLogValidations_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXValidations");
  v1 = (void *)AXLogValidations___logObj;
  AXLogValidations___logObj = (uint64_t)v0;

}

@end
