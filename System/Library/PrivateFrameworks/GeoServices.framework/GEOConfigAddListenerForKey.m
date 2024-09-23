@implementation GEOConfigAddListenerForKey

void ___GEOConfigAddListenerForKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void ___GEOConfigAddListenerForKey_block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a1[4];
  v12 = a3;
  v13 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v14)
    objc_storeStrong(v15, v14);
  else
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *v15, a1[4]);

  (*(void (**)(void))(a1[5] + 16))();
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1[7] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

@end
