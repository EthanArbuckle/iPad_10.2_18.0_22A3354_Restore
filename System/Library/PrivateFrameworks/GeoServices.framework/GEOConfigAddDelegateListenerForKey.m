@implementation GEOConfigAddDelegateListenerForKey

id *___GEOConfigAddDelegateListenerForKey_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, BOOL *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v8 = a2;
  v9 = a3;
  v10 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v10;
  v13 = v8;
  v14 = (id *)objc_alloc((Class)objc_opt_self());
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v17;
  v19 = 0;
  if (v14 && v15 && v16 && v17)
  {
    v24.receiver = v14;
    v24.super_class = (Class)_GEOConfigChangedDelegateListener;
    v20 = (id *)objc_msgSendSuper2(&v24, sel_init);
    v19 = v20;
    if (v20)
    {
      objc_storeWeak(v20 + 1, v15);
      objc_storeStrong(v19 + 2, v10);
      objc_storeWeak(v19 + 3, v18);
      v14 = v19;
      v19 = v14;
    }
    else
    {
      v14 = 0;
    }
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v15);
  }
  objc_msgSend(v22, "addObject:", v19);
  *a5 = v21 == 0;

  return v19;
}

@end
