@implementation GEOMachAbsoluteTimeGetCurrent

double __GEOMachAbsoluteTimeGetCurrent_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  result = (double)v0 / (double)v1 * 0.000000001;
  qword_1ECE244A8 = *(_QWORD *)&result;
  return result;
}

@end
