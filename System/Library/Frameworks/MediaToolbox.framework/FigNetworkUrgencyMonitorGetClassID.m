@implementation FigNetworkUrgencyMonitorGetClassID

uint64_t __FigNetworkUrgencyMonitorGetClassID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  sFigNetworkUrgencyMonitorID = result;
  return result;
}

@end
