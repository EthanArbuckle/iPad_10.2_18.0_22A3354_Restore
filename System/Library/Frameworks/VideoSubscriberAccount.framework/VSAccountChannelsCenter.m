@implementation VSAccountChannelsCenter

- (VSAccountChannelsCenter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSAccountChannelsCenter)initWithAccountStore:(id)a3
{
  id v5;
  VSAccountChannelsCenter *v6;
  VSAccountChannelsCenter *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialQueue;
  objc_super v11;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accountStore parameter must not be nil."));
  v11.receiver = self;
  v11.super_class = (Class)VSAccountChannelsCenter;
  v6 = -[VSAccountChannelsCenter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = dispatch_queue_create("VSAccountChannelsCenter Serial Queue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

+ (id)sharedCenter
{
  if (sharedCenter___vs_lazy_init_predicate_0 != -1)
    dispatch_once(&sharedCenter___vs_lazy_init_predicate_0, &__block_literal_global_34);
  return (id)sharedCenter___vs_lazy_init_variable_0;
}

void __39__VSAccountChannelsCenter_sharedCenter__block_invoke()
{
  VSAccountChannelsCenter *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VSAccountChannelsCenter alloc];
  +[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VSAccountChannelsCenter initWithAccountStore:](v0, "initWithAccountStore:", v3);
  v2 = (void *)sharedCenter___vs_lazy_init_variable_0;
  sharedCenter___vs_lazy_init_variable_0 = v1;

}

- (void)_snapshotPreviousChannels
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VSAccountChannelsCenter *v9;
  _QWORD v10[4];
  id v11;
  VSAccountChannelsCenter *v12;

  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[VSAccountChannelsCenter undoManager](self, "undoManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VSAccountChannelsCenter _savedAccountChannels](self, "_savedAccountChannels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke;
    v10[3] = &unk_1E93A05C0;
    v11 = v6;
    v12 = self;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke_2;
    v7[3] = &unk_1E93A05E8;
    v8 = v11;
    v9 = self;
    objc_msgSend(v4, "unwrapObject:error:", v10, v7);

  }
}

void __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "prepareWithInvocationTarget:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_enqueueSaveAccountChannelsAndWait:", v4);

}

void __52__VSAccountChannelsCenter__snapshotPreviousChannels__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "prepareWithInvocationTarget:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_enqueueRemoveSavedAccountChannelsAndWait");

}

- (id)_storeIdentityProviderForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(void);
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identityProviderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v8 = VSLoadInterfaceFramework((uint64_t)&v24);
  v9 = v24;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)CFSTR("VSIdentityProviderFetchOperation"))), "initWithIdentityProviderID:", v7);
    -[NSObject setFetchFromStoreOnly:](v10, "setFetchFromStoreOnly:", 1);
    -[VSAccountChannelsCenter identityProviderFetchOperationBlock](self, "identityProviderFetchOperationBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[VSAccountChannelsCenter identityProviderFetchOperationBlock](self, "identityProviderFetchOperationBlock");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = v13;
    }
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1D2419000, v14, OS_LOG_TYPE_DEFAULT, "Fetching store identity provider for ID: %@", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_startOperationAndWaitForCompletion:", v10);
    -[NSObject result](v10, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "forceUnwrapObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "object");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        v20 = "Successfully fetched identity provider for ID: %@";
        v21 = v18;
        v22 = 12;
LABEL_14:
        _os_log_impl(&dword_1D2419000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else if (v19)
    {
      *(_WORD *)buf = 0;
      v20 = "Unable to fetch store identity provider for provider ID. Adam ID will be set to nil";
      v21 = v18;
      v22 = 2;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  VSErrorLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[VSAccountChannelsCenter _storeIdentityProviderForAccount:].cold.1();
  v17 = 0;
LABEL_16:

  return v17;
}

- (id)_savedAccountChannelsForIdentityProviderID:(id)a3 storeIdentityProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  VSAccountChannelsCenter *v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  VSAccountChannelsCenter *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__10;
  v36 = __Block_byref_object_dispose__10;
  v37 = 0;
  -[VSAccountChannelsCenter _savedAccountChannels](self, "_savedAccountChannels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke;
  v28[3] = &unk_1E93A0610;
  v30 = self;
  v31 = &v32;
  v29 = v6;
  v21 = v10;
  v22 = 3221225472;
  v23 = __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_15;
  v24 = &unk_1E93A0638;
  v25 = self;
  v27 = &v32;
  v11 = v29;
  v26 = v11;
  objc_msgSend(v9, "unwrapObject:error:", v28, &v21);
  v12 = (void *)v33[5];
  objc_msgSend(v7, "uniqueID", v21, v22, v23, v24, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceUnwrapObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdamID:", v14);

  v15 = (void *)v33[5];
  objc_msgSend(v7, "providerInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "forceUnwrapObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProviderInfo:", v17);

  v18 = (void *)v33[5];
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accountChannels parameter must not be nil."));
    v18 = (void *)v33[5];
  }
  v19 = v18;

  _Block_object_dispose(&v32, 8);
  return v19;
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "channelIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Serialized account channels successfuly loaded and the provider matches the account provider. Channels: %@", (uint8_t *)&v14, 0xCu);

    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v3;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v4, v10);

    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "_removeSavedAccountChannels");
    objc_msgSend((id)objc_opt_class(), "_accountChannelsWithProviderID:", *(_QWORD *)(a1 + 32));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_15_cold_1();

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_removeSavedAccountChannels");
  objc_msgSend((id)objc_opt_class(), "_accountChannelsWithProviderID:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_savedAccountChannels
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VSFileReadOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t v32[4];
  void *v33;
  __int128 buf;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VSAccountChannelsCenter _savedAccountChannels]";
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  v38 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__10;
  v30 = __Block_byref_object_dispose__10;
  v31 = 0;
  -[VSAccountChannelsCenter accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[VSAccountChannelsCenter accountStore](self, "accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "channelsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke;
    v25[3] = &unk_1E93A0660;
    v25[4] = self;
    v25[5] = &buf;
    objc_msgSend(v11, "conditionallyUnwrapObject:", v25);

  }
  v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (!v12)
  {
    -[VSAccountChannelsCenter fileURL](self, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(VSFileReadOperation);
    -[VSFileReadOperation setSource:](v14, "setSource:", v13);
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "Reading account channels archive at: %@", v32, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_startOperationAndWaitForCompletion:", v14);
    -[VSFileReadOperation result](v14, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "forceUnwrapObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v24[1] = 3221225472;
    v24[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_21;
    v24[3] = &unk_1E93A0688;
    v24[4] = &buf;
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2;
    v23[3] = &unk_1E939EF00;
    v23[4] = &v26;
    v24[0] = v7;
    objc_msgSend(v17, "unwrapObject:error:", v24, v23);

    v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  }
  v22[1] = 3221225472;
  v22[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_23;
  v22[3] = &unk_1E93A0688;
  v22[4] = &v26;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_27;
  v21[3] = &unk_1E939FF78;
  v21[4] = &v26;
  v22[0] = v7;
  objc_msgSend(v12, "conditionallyUnwrapObject:otherwise:", v22, v21);
  v18 = (void *)v27[5];
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
    v18 = (void *)v27[5];
  }
  v19 = v18;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&buf, 8);
  return v19;
}

id __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (id)objc_msgSend(*(id *)(a1 + 32), "_removeLocallySavedAccountChannels");
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_21(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_cold_1();

  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_23(uint64_t a1, uint64_t a2)
{
  id v3;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;

  +[VSAccountChannels deserializationResultWithData:](VSAccountChannels, "deserializationResultWithData:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_25;
  v5[3] = &unk_1E93A06B0;
  v6 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26;
  v4[3] = &unk_1E939EF00;
  v4[4] = v6;
  objc_msgSend(v3, "unwrapObject:error:", v5, v4);

}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read and deserialized account channels: %@", (uint8_t *)&v8, 0xCu);
  }

  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26_cold_1();

  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_27_cold_1();

  VSPrivateError(-24, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_enqueueRemoveSavedAccountChannelsAndWait
{
  NSObject *v3;
  NSObject *v4;
  VSSemaphore *v5;
  NSObject *v6;
  VSSemaphore *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  VSAccountChannelsCenter *v12;
  VSSemaphore *v13;
  uint8_t buf[16];

  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will enqueue removing saved account channels.", buf, 2u);
  }

  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v5 = objc_alloc_init(VSSemaphore);
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __68__VSAccountChannelsCenter__enqueueRemoveSavedAccountChannelsAndWait__block_invoke;
  v11 = &unk_1E939F138;
  v12 = self;
  v13 = v5;
  v7 = v5;
  dispatch_async(v6, &v8);

  -[VSSemaphore wait](v7, "wait", v8, v9, v10, v11, v12);
}

uint64_t __68__VSAccountChannelsCenter__enqueueRemoveSavedAccountChannelsAndWait__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_removeSavedAccountChannels");
  return objc_msgSend(*(id *)(a1 + 40), "signal");
}

- (id)_removeSavedAccountChannels
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[VSAccountChannelsCenter _removeSavedAccountChannels]";
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v10, 0xCu);
  }

  -[VSAccountChannelsCenter _snapshotPreviousChannels](self, "_snapshotPreviousChannels");
  -[VSAccountChannelsCenter accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VSAccountChannelsCenter accountStore](self, "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setChannelsData:", 0);

  }
  -[VSAccountChannelsCenter _removeLocallySavedAccountChannels](self, "_removeLocallySavedAccountChannels");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_removeLocallySavedAccountChannels
{
  void *v2;
  VSFileRemoveOperation *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[VSAccountChannelsCenter fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(VSFileRemoveOperation);
  -[VSFileRemoveOperation setFileURL:](v3, "setFileURL:", v2);
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Removing account channels archive at: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "_startOperationAndWaitForCompletion:", v3);
  -[VSFileRemoveOperation error](v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VSAccountChannelsCenter _removeLocallySavedAccountChannels].cold.1();
  }
  else
  {
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Account channels archive successfully removed", (uint8_t *)&v8, 2u);
    }
  }

  return v5;
}

- (void)_enqueueSaveAccountChannelsAndWait:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  VSSemaphore *v7;
  NSObject *v8;
  VSSemaphore *v9;
  id v10;
  _QWORD block[5];
  id v12;
  VSSemaphore *v13;
  uint8_t buf[16];

  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will enqueue saving account channels.", buf, 2u);
  }

  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  v7 = objc_alloc_init(VSSemaphore);
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VSAccountChannelsCenter__enqueueSaveAccountChannelsAndWait___block_invoke;
  block[3] = &unk_1E939F400;
  block[4] = self;
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  dispatch_async(v8, block);

  -[VSSemaphore wait](v9, "wait");
}

uint64_t __62__VSAccountChannelsCenter__enqueueSaveAccountChannelsAndWait___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_saveAccountChannels:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "signal");
}

- (id)_saveAccountChannels:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VSAccountChannelsCenter _saveAccountChannels:]";
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&buf, 0xCu);
  }

  -[VSAccountChannelsCenter _snapshotPreviousChannels](self, "_snapshotPreviousChannels");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  objc_msgSend(v4, "serializationResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = &buf;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke;
  v11[3] = &unk_1E939FCD8;
  v11[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_35;
  v10[3] = &unk_1E939EF00;
  objc_msgSend(v7, "unwrapObject:error:", v11, v10);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstAccount");
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject setChannelsData:](v7, "setChannelsData:", v3);
    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveAccounts:withCompletionHandler:", v9, &__block_literal_global_34);

    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "_removeLocallySavedAccountChannels");
  }
  else
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_cold_1();
  }

}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "VSAccountChannels save to keychain: success %d, error %@", (uint8_t *)v6, 0x12u);
  }

}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_35(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSURL)fileURL
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", self->_fileURL);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)v8[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__VSAccountChannelsCenter_fileURL__block_invoke_2;
  v6[3] = &unk_1E93A0758;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionallyUnwrapObject:otherwise:", &__block_literal_global_37, v6);
  objc_msgSend((id)v8[5], "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

void __34__VSAccountChannelsCenter_fileURL__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "directoryURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (void)_startOperationAndWaitForCompletion:(id)a3
{
  id v3;
  VSSemaphore *v4;
  VSSemaphore *v5;
  _QWORD v6[4];
  VSSemaphore *v7;

  v3 = a3;
  v4 = objc_alloc_init(VSSemaphore);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__VSAccountChannelsCenter__startOperationAndWaitForCompletion___block_invoke;
  v6[3] = &unk_1E939EE88;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "setCompletionBlock:", v6);
  objc_msgSend(v3, "start");

  -[VSSemaphore wait](v5, "wait");
}

uint64_t __63__VSAccountChannelsCenter__startOperationAndWaitForCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

+ (id)_accountChannelsWithProviderID:(id)a3
{
  id v3;
  VSAccountChannels *v4;

  v3 = a3;
  v4 = objc_alloc_init(VSAccountChannels);
  -[VSAccountChannels setProviderID:](v4, "setProviderID:", v3);

  return v4;
}

- (void)_saveAccountChannels:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSAccountChannelsCenter _saveAccountChannels:withCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke;
  block[3] = &unk_1E939F1F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_saveAccountChannels:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E939F1A8;
    v6 = v3;
    v5 = v2;
    VSPerformCompletionHandler(v4);

  }
}

uint64_t __70__VSAccountChannelsCenter__saveAccountChannels_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_removeSavedAccountChannelsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSAccountChannelsCenter _removeSavedAccountChannelsWithCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E939F3B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_removeSavedAccountChannels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E939F1A8;
    v6 = v3;
    v5 = v2;
    VSPerformCompletionHandler(v4);

  }
}

uint64_t __76__VSAccountChannelsCenter__removeSavedAccountChannelsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSURL)directoryURL
{
  VSAccountChannelsCenter *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_directoryURL;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultDirectoryURL");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_directoryURL, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (NSString)fileName
{
  VSAccountChannelsCenter *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fileName;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultFileName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_fileName, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

+ (id)_defaultDirectoryURL
{
  return +[VSPersistentStorage defaultStorageDirectoryURL](VSPersistentStorage, "defaultStorageDirectoryURL");
}

+ (id)_defaultFileName
{
  return CFSTR("VideoSubscriberAccountChannels.data");
}

- (NSUndoManager)undoManager
{
  void *v2;
  void *v3;

  -[VSAccountChannelsCenter accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v3;
}

- (void)setUndoManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSAccountChannelsCenter accountStore](self, "accountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUndoManager:", v4);

}

- (void)fetchAccountChannelsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSAccountChannelsCenter fetchAccountChannelsWithCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  -[VSAccountChannelsCenter serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E939F3B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E939F338;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchAccountsWithCompletionHandler:", v4);

}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E939F1F8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E939F310;
  v3 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_48;
  v4[3] = &unk_1E939F2C0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "unwrapObject:error:", v6, v4);

}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityProviderID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_5;
    v14[3] = &unk_1E93A0780;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v4;
    v16 = v7;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_44;
    v12[3] = &unk_1E939F2E8;
    v13 = *(id *)(a1 + 40);
    v8 = v4;
    objc_msgSend(v5, "conditionallyUnwrapObject:otherwise:", v14, v12);

  }
  else
  {
    VSErrorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4_cold_1();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_46;
    v10[3] = &unk_1E939F2E8;
    v11 = *(id *)(a1 + 40);
    VSPerformCompletionHandler(v10);
    v8 = v11;
  }

}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_storeIdentityProviderForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_savedAccountChannelsForIdentityProviderID:storeIdentityProvider:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_6;
  v9[3] = &unk_1E939F3B0;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v8 = v7;
  VSPerformCompletionHandler(v9);

}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning account channels: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_44_cold_1();

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_45;
  v3[3] = &unk_1E939F2E8;
  v4 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v3);

}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to no identity provider ID.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to no first account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_48_cold_1();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_49;
  v5[3] = &unk_1E939F2E8;
  v6 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v5);

}

uint64_t __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Fetch returning nil account channels due to error.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)identityProviderFetchOperationBlock
{
  return self->_identityProviderFetchOperationBlock;
}

- (void)setIdentityProviderFetchOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identityProviderFetchOperationBlock, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_storeIdentityProviderForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to load interface framework: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Serialized account channels successfuly loaded but provider IDs (%@ vs %@) do not match those expected. Removing serialized account channels file and returning account channels object containing just the provider ID.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __92__VSAccountChannelsCenter__savedAccountChannelsForIdentityProviderID_storeIdentityProvider___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Error deserializing account channels. Removing serialized account channels file and returning account channels object containing just the provider ID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to read account channels archive. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to deserialize account channels archive. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VSAccountChannelsCenter__savedAccountChannels__block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Serialized account channels data was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_removeLocallySavedAccountChannels
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error removing archived account channels: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VSAccountChannelsCenter__saveAccountChannels___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "No account found, cannot save channels.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Unable to fetch channels as there is no account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_44_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Unable to fetch channels as there is an account with a nil provider ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __69__VSAccountChannelsCenter_fetchAccountChannelsWithCompletionHandler___block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to fetch channels:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
