@implementation SWCHLogElementNav

void __SWCHLogElementNav_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "SWCHElementNav");
  v1 = (void *)SWCHLogElementNav___logObj;
  SWCHLogElementNav___logObj = (uint64_t)v0;

}

@end
