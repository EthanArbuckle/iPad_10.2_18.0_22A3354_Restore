@implementation AXInternalRemoveFromElementCache

void ___AXInternalRemoveFromElementCache_block_invoke(uint64_t a1)
{
  NSMapRemove((NSMapTable *)_ElementCache, (const void *)~*(_QWORD *)(a1 + 32));
}

@end
