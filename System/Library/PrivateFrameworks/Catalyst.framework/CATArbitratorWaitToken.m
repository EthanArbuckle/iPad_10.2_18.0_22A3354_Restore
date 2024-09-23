@implementation CATArbitratorWaitToken

void __33___CATArbitratorWaitToken_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "performCompletionBlock");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __49___CATArbitratorWaitToken_performCompletionBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  objc_msgSend(v7, "resourceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  objc_msgSend(v7, "invalidate");
}

@end
