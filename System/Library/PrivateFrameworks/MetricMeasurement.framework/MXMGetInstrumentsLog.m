@implementation MXMGetInstrumentsLog

void ___MXMGetInstrumentsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.metricmeasurement", "PointsOfInterest");
  v1 = (void *)_MXMGetInstrumentsLog__instrumentsLogger;
  _MXMGetInstrumentsLog__instrumentsLogger = (uint64_t)v0;

}

@end
