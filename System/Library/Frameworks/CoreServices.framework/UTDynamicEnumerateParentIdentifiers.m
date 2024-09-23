@implementation UTDynamicEnumerateParentIdentifiers

void ___UTDynamicEnumerateParentIdentifiers_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", *(_QWORD *)a5, *(unsigned int *)(a5 + 8), 4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
