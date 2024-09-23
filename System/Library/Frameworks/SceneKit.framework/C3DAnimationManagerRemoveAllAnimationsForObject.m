@implementation C3DAnimationManagerRemoveAllAnimationsForObject

void __C3DAnimationManagerRemoveAllAnimationsForObject_block_invoke(uint64_t a1, void *key)
{
  _C3DAnimationManagerRemoveAnimationsForKey(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40), key, *(CFDictionaryRef *)(a1 + 48));
}

@end
