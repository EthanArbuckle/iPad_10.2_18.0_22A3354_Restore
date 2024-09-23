@implementation CarDiagnosticsLogging

void __CarDiagnosticsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "Diagnostics");
  v1 = (void *)CarDiagnosticsLogging_facility;
  CarDiagnosticsLogging_facility = (uint64_t)v0;

}

@end
