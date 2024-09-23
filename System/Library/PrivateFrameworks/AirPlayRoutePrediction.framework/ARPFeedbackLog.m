@implementation ARPFeedbackLog

void __ARPFeedbackLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AirPlayRoutePrediction", "feedback");
  v1 = (void *)ARPFeedbackLog_log;
  ARPFeedbackLog_log = (uint64_t)v0;

}

@end
