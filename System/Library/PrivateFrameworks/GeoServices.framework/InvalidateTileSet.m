@implementation InvalidateTileSet

uint64_t __InvalidateTileSet_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = *(unsigned int *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v3, "bindIntParameter:toValue:inStatement:error:", "@tileset", v2, a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

@end
