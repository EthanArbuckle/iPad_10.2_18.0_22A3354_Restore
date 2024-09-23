@implementation ASKFamilyPurchases

+ (ASKFamilyPurchases)shared
{
  if (shared_sOnce != -1)
    dispatch_once(&shared_sOnce, &__block_literal_global_3);
  return (ASKFamilyPurchases *)(id)shared_sInstance;
}

void __28__ASKFamilyPurchases_shared__block_invoke()
{
  ASKFamilyPurchases *v0;
  void *v1;

  v0 = objc_alloc_init(ASKFamilyPurchases);
  v1 = (void *)shared_sInstance;
  shared_sInstance = (uint64_t)v0;

}

- (ASKFamilyPurchases)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASKFamilyPurchases;
  return -[ASKFamilyPurchases init](&v3, sel_init);
}

- (void)reloadDataWithBag:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke;
  v10[3] = &unk_1E9DC2050;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDAC8]), "initWithBag:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "performFamilyInfoLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_13;
  v18[3] = &unk_1E9DC1FD8;
  v20 = v28;
  v21 = v26;
  v7 = v2;
  v19 = v7;
  objc_msgSend(v5, "addFinishBlock:", v18);
  v8 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend(v8, "setQualityOfService:", 17);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_2;
  v14[3] = &unk_1E9DC2000;
  v16 = v24;
  v17 = v22;
  v9 = v3;
  v15 = v9;
  objc_msgSend(v8, "startRequestWithCompletionHandler:", v14);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_3;
  block[3] = &unk_1E9DC2028;
  v12 = v24;
  v13 = v28;
  v11 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "members", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "isMe"))
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
LABEL_13:
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      v12 = v7 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      objc_msgSend(v7, "iTunesAccountDSID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v7, "iTunesAccountDSID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "ams_DSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if (v22)
          v13 = 0;
        else
          v13 = 2;
      }
      else
      {
        v13 = 3;
      }
      goto LABEL_30;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "members");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      goto LABEL_18;
    goto LABEL_13;
  }
  objc_msgSend(v7, "iTunesAccountDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_DSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (v18)
    v13 = 3;
  else
    v13 = 1;
LABEL_30:
  v23 = a1[4];
  v24 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(v7, "appleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v23 + 16))(v23, v24, v13, v25);

}

@end
