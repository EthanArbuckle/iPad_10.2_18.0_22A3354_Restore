@implementation DateTimeFormatRegularExpressionYear

void ___DateTimeFormatRegularExpressionYear_block_invoke()
{
  uint64_t v0;
  void *v1;

  _RegularExpressionFromPattern((uint64_t)CFSTR("^([0-9]{4})$"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DateTimeFormatRegularExpressionYear_regex;
  _DateTimeFormatRegularExpressionYear_regex = v0;

}

@end
