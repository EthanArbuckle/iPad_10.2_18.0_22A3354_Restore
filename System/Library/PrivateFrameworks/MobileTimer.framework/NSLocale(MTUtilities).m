@implementation NSLocale(MTUtilities)

- (BOOL)mtIsIn24HourTime
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v1, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end
