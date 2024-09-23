@implementation CFDateGetTypeID

double __CFDateGetTypeID_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info v3[2];

  v3[1] = *(mach_timebase_info *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  mach_timebase_info(v3);
  LODWORD(v1) = v3[0].denom;
  LODWORD(v0) = v3[0].numer;
  *(double *)&__CFTSRRate = 1000000000.0 / (double)v0 * (double)v1;
  result = 1.0 / *(double *)&__CFTSRRate;
  *(double *)&__CF1_TSRRate = 1.0 / *(double *)&__CFTSRRate;
  return result;
}

@end
