@implementation C3DNodeCreateCopy

void __C3DNodeCreateCopy_block_invoke(uint64_t a1, uint64_t a2)
{
  float32x4_t *Copy;

  Copy = (float32x4_t *)C3DNodeCreateCopy(a2, *(unsigned __int8 *)(a1 + 40));
  C3DNodeAddChildNode(*(_QWORD *)(a1 + 32), Copy);
  CFRelease(Copy);
}

@end
