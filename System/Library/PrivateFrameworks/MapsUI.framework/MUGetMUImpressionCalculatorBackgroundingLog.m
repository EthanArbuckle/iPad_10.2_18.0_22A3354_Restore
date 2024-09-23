@implementation MUGetMUImpressionCalculatorBackgroundingLog

void __MUGetMUImpressionCalculatorBackgroundingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MUImpressionCalculatorBackgrounding");
  v1 = (void *)qword_1ED01B600;
  qword_1ED01B600 = (uint64_t)v0;

}

@end
