@implementation NSCharacterSet

+ (id)unicodeDirectionalCharactersSet
{
  return +[NSCharacterSet characterSetWithRange:](NSCharacterSet, "characterSetWithRange:", 8234, 4);
}

+ (id)pauseCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(";,"));
}

+ (id)starAndOctothorpeCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("*#"));
}

@end
