@implementation DateTimeFormatRegularExpressionYearMonthDayTime

void ___DateTimeFormatRegularExpressionYearMonthDayTime_block_invoke()
{
  uint64_t v0;
  void *v1;

  _RegularExpressionFromPattern((uint64_t)CFSTR("^([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})(?:.(?:[0-9]+))?(Z|[+-](?:2[0-3]|[01][0-9]):[0-5][0-9])$"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DateTimeFormatRegularExpressionYearMonthDayTime_regex;
  _DateTimeFormatRegularExpressionYearMonthDayTime_regex = v0;

}

@end
