@implementation AttemptToSetupInhibitMultichannelTimer

uint64_t __fpfsi_AttemptToSetupInhibitMultichannelTimer_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  fpfsi_AttemptToSetupInhibitMultichannelTimer_inhibitMultichannelPeriodSeconds = (int)result;
  return result;
}

@end
