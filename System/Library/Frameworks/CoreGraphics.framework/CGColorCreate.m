@implementation CGColorCreate

void __CGColorCreate_block_invoke()
{
  uint64_t v0;

  v0 = *MEMORY[0x1E0DE7C50];
  if (*MEMORY[0x1E0DE7C50])
    LOBYTE(v0) = _objc_getClassForTag() != 0;
  CGColorCreate_supportsTaggedPointers = v0;
}

@end
