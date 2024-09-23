@implementation ARConvertSecondsToTicks

double __ARConvertSecondsToTicks_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(result) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 1000000000.0;
    ARConvertSecondsToTicks_secondsToTick = *(_QWORD *)&result;
  }
  return result;
}

@end
