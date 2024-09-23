@implementation SWGeneralTelemetryLogHandle

void __SWGeneralTelemetryLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SharedWithYou.telemetry", "General");
  v1 = (void *)SWGeneralTelemetryLogHandle_osLog;
  SWGeneralTelemetryLogHandle_osLog = (uint64_t)v0;

}

@end
