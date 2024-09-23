@implementation DSLogSessionAvailability

void __DSLogSessionAvailability_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DiagnosticsSessionAvailability", "client");
  v1 = (void *)DSLogSessionAvailability_log;
  DSLogSessionAvailability_log = (uint64_t)v0;

}

@end
