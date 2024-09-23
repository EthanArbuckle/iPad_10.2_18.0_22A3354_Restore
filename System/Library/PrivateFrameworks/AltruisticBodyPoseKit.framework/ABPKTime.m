@implementation ABPKTime

+ (double)nowInSeconds
{
  double result;

  +[ABPKTime machAbsoluteTimeToSeconds:](ABPKTime, "machAbsoluteTimeToSeconds:", mach_absolute_time());
  return result;
}

+ (double)machAbsoluteTimeToSeconds:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v5) = info.denom;
  LODWORD(v4) = info.numer;
  return (double)v4 / ((double)v5 * 1000000000.0) * (double)a3;
}

+ (double)CMTimeToSeconds:(id *)a3
{
  return (double)a3->var0 / (double)a3->var1;
}

@end
