@implementation UTDynamicGetFirstTag

void ___UTDynamicGetFirstTag_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", *(_QWORD *)a5, *(unsigned int *)(a5 + 8), 4);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  *a6 = 1;
}

@end
