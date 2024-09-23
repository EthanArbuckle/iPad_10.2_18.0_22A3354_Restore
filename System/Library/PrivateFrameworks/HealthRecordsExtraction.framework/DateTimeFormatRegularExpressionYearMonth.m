@implementation DateTimeFormatRegularExpressionYearMonth

void ___DateTimeFormatRegularExpressionYearMonth_block_invoke()
{
  uint64_t v0;
  void *v1;

  _RegularExpressionFromPattern((uint64_t)CFSTR("^([0-9]{4})-([0-9]{2})$"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DateTimeFormatRegularExpressionYearMonth_regex;
  _DateTimeFormatRegularExpressionYearMonth_regex = v0;

}

@end
