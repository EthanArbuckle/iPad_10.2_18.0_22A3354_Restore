@implementation CopyFoldString

CFLocaleRef __CopyFoldString_block_invoke()
{
  CFLocaleRef result;

  result = CFLocaleCreate(0, CFSTR("C"));
  CopyFoldString_locale = (uint64_t)result;
  return result;
}

@end
