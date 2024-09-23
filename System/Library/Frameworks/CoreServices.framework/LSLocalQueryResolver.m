@implementation LSLocalQueryResolver

BOOL __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x186DAE7A0]();
  v8 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(v8 + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = *(_QWORD *)(a1 + 40);
  }
  if (!v5 && v6)
  {
    *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
    v8 = *(_QWORD *)(a1 + 40);
  }
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 + 8) + 24);
  objc_autoreleasePoolPop(v7);

  return v9 == 0;
}

void __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  if (v8)
  {
    objc_msgSend(v7, "addObject:", v8);
  }
  else
  {
    *(_QWORD *)(v6 + 40) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

@end
