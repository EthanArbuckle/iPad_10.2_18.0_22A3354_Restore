@implementation ARConvertTicksToSeconds

double __ARConvertTicksToSeconds_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    ARConvertTicksToSeconds_ticksToSecond = *(_QWORD *)&result;
  }
  return result;
}

@end
