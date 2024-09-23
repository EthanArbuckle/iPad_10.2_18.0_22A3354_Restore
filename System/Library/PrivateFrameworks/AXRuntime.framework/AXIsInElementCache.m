@implementation AXIsInElementCache

void ___AXIsInElementCache_block_invoke(uint64_t a1)
{
  _QWORD *v2;

  NSMapGet((NSMapTable *)_ElementCache, (const void *)~*(_QWORD *)(a1 + 40));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2[2];

}

@end
