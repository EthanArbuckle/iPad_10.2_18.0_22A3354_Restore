@implementation ABContentsExclusivelyInCharacterSet

uint64_t __ABContentsExclusivelyInCharacterSet_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", uset_containsAllCodePoints());
  else
    return MEMORY[0x1E0C9AAB0];
}

@end
