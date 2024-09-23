@implementation FileLogDateFormatter

void __FileLogDateFormatter_block_invoke()
{
  qword_1ECFFA950 = (uint64_t)CFDateFormatterCreate(0, 0, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  CFDateFormatterSetFormat((CFDateFormatterRef)qword_1ECFFA950, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

@end
