@implementation EXItemProviderCopyingLoadOperator

void __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  dispatch_semaphore_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  v18 = *MEMORY[0x1E0CB2CA8];
  v19[0] = *MEMORY[0x1E0CB2CA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke_2;
  v12[3] = &unk_1E2CFD5D8;
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 72);
  v16 = *(_OWORD *)(a1 + 56);
  v17 = v8;
  v9 = *(_QWORD *)(a1 + 48);
  v12[4] = v6;
  v13 = v3;
  v14 = v4;
  v15 = v9;
  v10 = v4;
  v11 = v3;
  objc_msgSend(v7, "loadItemForTypeIdentifier:options:completionHandler:", v11, v5, v12);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

}

void __91___EXItemProviderCopyingLoadOperator__loadItemsForTypeIdentifiers_auditToken_itemProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _OWORD v14[2];
  id v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v8 = *(void **)(a1 + 32);
    v15 = 0;
    v9 = *(_OWORD *)(a1 + 80);
    v14[0] = *(_OWORD *)(a1 + 64);
    v14[1] = v9;
    objc_msgSend(v8, "_sandboxedResourceForItemIfNeeded:auditToken:error:", v5, v14, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v7 = v11;
    if (v10 && !v11)
    {
      v12 = v10;

      v5 = v12;
    }

  }
  if (v7)
  {
    v18 = CFSTR("error");
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_13;
  }
  else
  {
    v13 = 0;
  }
  if (v5)
  {
    v16 = CFSTR("item");
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  if (v13)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

@end
