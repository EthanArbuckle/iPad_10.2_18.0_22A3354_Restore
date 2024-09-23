@implementation AXGSEventConvertFromMachTime

double ___AXGSEventConvertFromMachTime_block_invoke()
{
  double result;
  unint64_t v1;
  unint64_t v2;
  unint64_t denom;
  unint64_t numer;
  unint64_t v5;
  mach_timebase_info info;

  info = 0;
  if (mach_timebase_info(&info))
  {
    LODWORD(v1) = 1;
    LODWORD(v2) = 1;
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.numer;
    if (info.numer != info.denom)
    {
      if (info.numer >= info.denom)
        denom = info.denom;
      else
        denom = info.numer;
      if (info.numer <= info.denom)
        numer = info.denom;
      else
        numer = info.numer;
      if ((_DWORD)denom)
      {
        do
        {
          v5 = denom;
          denom = numer % denom;
          numer = v5;
        }
        while (denom);
      }
      else
      {
        v5 = numer;
      }
      v2 = info.numer / v5;
      v1 = info.denom / v5;
    }
  }
  if ((_DWORD)v2)
  {
    if ((_DWORD)v1)
    {
      result = (double)v2 / (double)v1 * *(double *)&_AXGSEventConvertFromMachTime___scale;
      *(double *)&_AXGSEventConvertFromMachTime___scale = result;
    }
  }
  return result;
}

@end
