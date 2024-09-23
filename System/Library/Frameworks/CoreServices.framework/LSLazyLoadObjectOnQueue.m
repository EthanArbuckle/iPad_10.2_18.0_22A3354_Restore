@implementation LSLazyLoadObjectOnQueue

void ___LSLazyLoadObjectOnQueue_block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), **(id **)(a1 + 40));
}

void ___LSLazyLoadObjectOnQueue_block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = **(id **)(a1 + 48);
  if (!v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void ***)(a1 + 48);
    v2 = v3;
    v5 = *v4;
    *v4 = v2;

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v2;

}

@end
