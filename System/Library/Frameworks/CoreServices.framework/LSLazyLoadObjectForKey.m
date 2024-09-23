@implementation LSLazyLoadObjectForKey

void ___LSLazyLoadObjectForKey_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void ___LSLazyLoadObjectForKey_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
