@implementation PNCopyStrippedNumberWithoutPauses

CFCharacterSetRef ___PNCopyStrippedNumberWithoutPauses_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR(",;"));
  _PNCopyStrippedNumberWithoutPauses_pauses = (uint64_t)result;
  return result;
}

@end
