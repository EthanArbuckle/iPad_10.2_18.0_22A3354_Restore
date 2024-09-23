@implementation NSString

uint64_t __70__NSString_CoreRecentsUtilities__cr_lowercaseStringWithStandardLocale__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  cr_lowercaseStringWithStandardLocale__someLocale = result;
  return result;
}

@end
