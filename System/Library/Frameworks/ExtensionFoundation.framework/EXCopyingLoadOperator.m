@implementation EXCopyingLoadOperator

void __42___EXCopyingLoadOperator_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  _EXItemProviderItem *v13;
  uint64_t v14;
  _EXItemProviderItem *v15;
  _EXItemProviderItem *v16;
  void *v17;
  void *v18;
  _OWORD v19[2];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v20 = 0;
    v9 = *(_OWORD *)(v8 + 40);
    v19[0] = *(_OWORD *)(v8 + 24);
    v19[1] = v9;
    objc_msgSend((id)v8, "_sandboxedResourceForItemIfNeeded:auditToken:error:", v5, v19, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v7 = v11;
    if (v10 && !v11)
    {
      v12 = v10;

      v5 = v12;
    }

  }
  v13 = [_EXItemProviderItem alloc];
  v14 = *(_QWORD *)(a1 + 40);
  if (v7)
    v15 = -[_EXItemProviderItem initWithTypeIdentifier:error:](v13, "initWithTypeIdentifier:error:", v14, v7);
  else
    v15 = -[_EXItemProviderItem initWithTypeIdentifier:payload:](v13, "initWithTypeIdentifier:payload:", v14, v5);
  v16 = v15;
  if (v15)
  {
    v17 = *(void **)(a1 + 48);
    -[_EXItemProviderItem typeIdentifier](v15, "typeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v18);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

@end
