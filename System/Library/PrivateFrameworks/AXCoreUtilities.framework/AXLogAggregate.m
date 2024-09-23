@implementation AXLogAggregate

void __AXLogAggregate_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXAggregate");
  v1 = (void *)AXLogAggregate___logObj;
  AXLogAggregate___logObj = (uint64_t)v0;

}

@end
