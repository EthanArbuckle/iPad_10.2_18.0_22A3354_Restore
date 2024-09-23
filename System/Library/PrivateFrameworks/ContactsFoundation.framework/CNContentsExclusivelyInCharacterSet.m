@implementation CNContentsExclusivelyInCharacterSet

id __CNContentsExclusivelyInCharacterSet_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", uset_containsAllCodePoints());
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
