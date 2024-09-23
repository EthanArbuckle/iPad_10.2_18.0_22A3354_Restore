@implementation AXTTSLogKona

void __AXTTSLogKona_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTTSKona");
  v1 = (void *)AXTTSLogKona___logObj;
  AXTTSLogKona___logObj = (uint64_t)v0;

}

@end
