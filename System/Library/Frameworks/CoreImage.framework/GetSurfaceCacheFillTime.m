@implementation GetSurfaceCacheFillTime

float __GetSurfaceCacheFillTime_block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  float result;
  mach_timebase_info info;

  mach_timebase_info(&info);
  LODWORD(v2) = info.numer;
  LODWORD(v3) = info.denom;
  result = (double)CI::gTimeFilling * (double)v2 / ((double)v3 * 1000000000.0);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
