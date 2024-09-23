@implementation NPKAccountUserCollectionWithCompletion

uint64_t __NPKAccountUserCollectionWithCompletion_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE6E978];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithAccountUsers:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
