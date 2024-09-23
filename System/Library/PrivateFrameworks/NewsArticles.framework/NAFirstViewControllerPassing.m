@implementation NAFirstViewControllerPassing

void __NAFirstViewControllerPassing_block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = v8;
  if ((v5 & 1) == 0)
    v7 = *(void **)(v6 + 40);
  objc_storeStrong((id *)(v6 + 40), v7);
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;

}

@end
