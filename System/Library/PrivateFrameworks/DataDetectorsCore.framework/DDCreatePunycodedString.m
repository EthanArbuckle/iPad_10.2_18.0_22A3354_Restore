@implementation DDCreatePunycodedString

CFCharacterSetRef __DDCreatePunycodedString_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/?#"));
  DDCreatePunycodedString_componentSeparatorSet = (uint64_t)result;
  return result;
}

@end
