@implementation TimeFormatRegularExpressionTimeSinceMidnight

void ___TimeFormatRegularExpressionTimeSinceMidnight_block_invoke()
{
  uint64_t v0;
  void *v1;

  _RegularExpressionFromPattern((uint64_t)CFSTR("^([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])(?:.([0-9]+))?$"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_TimeFormatRegularExpressionTimeSinceMidnight_regex;
  _TimeFormatRegularExpressionTimeSinceMidnight_regex = v0;

}

@end
