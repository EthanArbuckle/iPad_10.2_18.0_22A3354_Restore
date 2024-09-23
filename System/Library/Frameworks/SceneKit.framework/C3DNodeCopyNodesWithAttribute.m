@implementation C3DNodeCopyNodesWithAttribute

uint64_t __C3DNodeCopyNodesWithAttribute_block_invoke_3(uint64_t a1, const void *a2)
{
  if (C3DEntityHasAttribute((uint64_t)a2, *(void **)(a1 + 32))
    && (CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2), *(_BYTE *)(a1 + 48)))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

uint64_t __C3DNodeCopyNodesWithAttribute_block_invoke(uint64_t a1, const void *a2)
{
  if (C3DNodeGetGeometry((uint64_t)a2) && (CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2), *(_BYTE *)(a1 + 40)))
    return 2;
  else
    return 0;
}

uint64_t __C3DNodeCopyNodesWithAttribute_block_invoke_2(uint64_t a1, const void *a2)
{
  if (C3DNodeGetDeformerStack((uint64_t)a2)
    && (CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2), *(_BYTE *)(a1 + 40)))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

@end
