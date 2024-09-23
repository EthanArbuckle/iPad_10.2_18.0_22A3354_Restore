@implementation ABGetCharacterSetWithPattern

uint64_t __ABGetCharacterSetWithPattern_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", uset_openPattern());
}

@end
