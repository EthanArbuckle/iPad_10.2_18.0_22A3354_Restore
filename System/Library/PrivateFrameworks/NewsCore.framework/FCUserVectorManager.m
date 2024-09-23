@implementation FCUserVectorManager

- (FCUserVectorManager)initWithContext:(id)a3
{
  id v5;
  FCUserVectorManager *v6;
  FCUserVectorManager *v7;
  FCAsyncSerialQueue *v8;
  FCAsyncSerialQueue *queue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCUserVectorManager;
  v6 = -[FCUserVectorManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 17);
    queue = v7->_queue;
    v7->_queue = v8;

    objc_msgSend(v5, "appActivityMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v7);

  }
  return v7;
}

- (void)_cacheGSToken
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[FCUserVectorManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "newsletterManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "enabled"))
    v4 = (id)objc_msgSend(v3, "getGSToken");

}

- (FCCloudContext)context
{
  return self->_context;
}

- (void)setAggregateStoreProvider:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStoreProvider, a3);
}

- (void)_applicationDidEnterBackground
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserVectorManager _submitPersonalizationVector](self, "_submitPersonalizationVector");
}

- (void)_submitPersonalizationVector
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  FCUserVectorManager *v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[16];

  -[FCUserVectorManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "newsletterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldSubmitPersonalizationVector");

  if (v5)
  {
    -[FCUserVectorManager context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appConfigurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "possiblyUnfetchedAppConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personalizationTreatment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCUserVectorManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundTaskable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2;
    v39[3] = &unk_1E463DF90;
    v13 = v11;
    v40 = v13;
    v41 = &v42;
    v14 = objc_msgSend(v13, "fc_beginBackgroundTaskWithName:expirationHandler:", CFSTR("User Vector Upload"), v39);
    v43[3] = v14;
    aBlock[0] = v12;
    aBlock[1] = 3221225472;
    aBlock[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3;
    aBlock[3] = &unk_1E463DF90;
    v15 = v13;
    v37 = v15;
    v38 = &v42;
    v16 = _Block_copy(aBlock);
    if ((objc_msgSend(v9, "computeUserVectorWithTabi") & 1) != 0)
    {
      -[FCUserVectorManager tabiBasedAggregateVectorProvider](self, "tabiBasedAggregateVectorProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v17;
        dispatch_get_global_queue(17, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_17;
        v27[3] = &unk_1E4646E50;
        v27[4] = self;
        v28 = v18;
        v29 = v9;
        v30 = v16;
        v20 = v18;
        dispatch_async(v19, v27);

LABEL_7:
LABEL_12:

        _Block_object_dispose(&v42, 8);
        return;
      }
      v25 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Not submitting personalization vector due to missing tabi based aggregate vector provider";
LABEL_15:
        _os_log_fault_impl(&dword_1A1B90000, v25, OS_LOG_TYPE_FAULT, v26, buf, 2u);
      }
    }
    else
    {
      -[FCUserVectorManager aggregateStoreProvider](self, "aggregateStoreProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v20 = v21;
        objc_msgSend(v20, "aggregateStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_global_queue(17, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = v12;
        block[1] = 3221225472;
        block[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_6;
        block[3] = &unk_1E46464B0;
        v32 = v22;
        v33 = v9;
        v34 = self;
        v35 = v16;
        v24 = v22;
        dispatch_async(v23, block);

        goto LABEL_7;
      }
      v25 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v26 = "Not submitting personalization vector due to missing aggregate store provider";
        goto LABEL_15;
      }
    }
    v20 = 0;
    goto LABEL_12;
  }
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_4;
  v4[3] = &unk_1E463DF90;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  FCPerformBlockOnMainThread(v4);

}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_7;
  v4[3] = &unk_1E46464B0;
  v5 = v2;
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  objc_msgSend(v5, "prepareAggregatesForUseWithCompletionHandler:", v4);

}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_7(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[6];

  objc_msgSend(*(id *)(a1 + 32), "baselineAggregateWithConfigurableValues:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventCount");
  if (v3 <= objc_msgSend(*(id *)(a1 + 40), "minBaselineEventsToSubmitUserVector"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_8;
    v14[3] = &unk_1E463B790;
    v8 = *(_QWORD *)(a1 + 56);
    v14[4] = v2;
    v14[5] = v8;
    v7 = v2;
    __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_8((uint64_t)v14);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_9;
    v9[3] = &unk_1E4646E78;
    v4 = *(void **)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v4, "_fetchUserVector:", v9);

    v7 = v13;
  }

}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_3_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEBUG, "Not submitting personalization vector due to insufficient baseline events: %@.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[6];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_10;
    v19[3] = &unk_1E463B790;
    v8 = *(_QWORD *)(a1 + 56);
    v19[4] = v6;
    v19[5] = v8;
    __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_10((uint64_t)v19);
  }
  else
  {
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_11;
    block[3] = &unk_1E4643F50;
    v14 = v5;
    v15 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(a1 + 56);
    v16 = v10;
    v17 = v11;
    v18 = v12;
    dispatch_async(v9, block);

  }
}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error in retrieving user vector provider: %@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_11(uint64_t a1)
{
  void *v2;
  FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider initWithReadonlyPersonalizationAggregateStore:personalizationTreatment:]([FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider alloc], "initWithReadonlyPersonalizationAggregateStore:personalizationTreatment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedPersonalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "newsletterManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "computePersonalizationVectorWithAggregateVectorProvider:personalizationTreatment:tagRanker:options:", v3, v4, v6, objc_msgSend(v8, "includeOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "personalizationVector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "version");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleSubscribedVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleSubscribedVectorVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "Generated personalization vector %@ with version %@, and bundle subscribed vector %@ with version %@.", buf, 0x2Au);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_13;
  v17[3] = &unk_1E4646E50;
  v17[4] = *(_QWORD *)(a1 + 56);
  v18 = v9;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 64);
  v16 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "newsletterManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "subscribedBundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitPersonalizationVector:subscribedBundleChannelIDs:", v4, v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_17(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_18;
  v5[3] = &unk_1E4646E78;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_fetchUserVector:", v5);

}

void __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedPersonalizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "newsletterManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computePersonalizationVectorWithAggregateVectorProvider:personalizationTreatment:tagRanker:options:", v4, v5, v7, objc_msgSend(v9, "includeOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v10, "personalizationVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleSubscribedVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleSubscribedVectorVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "Generated personalization vector %@ with version %@, and bundle subscribed vector %@ with version %@.", buf, 0x2Au);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_19;
  v20[3] = &unk_1E4646E50;
  v17 = *(void **)(a1 + 56);
  v20[4] = *(_QWORD *)(a1 + 48);
  v21 = v10;
  v22 = v3;
  v23 = v17;
  v18 = v3;
  v19 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

uint64_t __51__FCUserVectorManager__submitPersonalizationVector__block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "newsletterManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "subscribedBundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitPersonalizationVector:subscribedBundleChannelIDs:", v4, v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_fetchUserVector:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  _QWORD v18[6];

  v4 = a3;
  -[FCUserVectorManager userVector](self, "userVector");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[FCUserVectorManager userVector](self, "userVector");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserVectorManager lastUpdated](self, "lastUpdated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 <= 86400.0)
  {
LABEL_6:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke;
    v18[3] = &unk_1E463B2D0;
    v18[4] = self;
    v18[5] = v4;
    __40__FCUserVectorManager__fetchUserVector___block_invoke((uint64_t)v18);
    goto LABEL_7;
  }
LABEL_4:
  objc_initWeak(&location, self);
  -[FCUserVectorManager queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2;
  v14[3] = &unk_1E4646F68;
  objc_copyWeak(&v16, &location);
  v14[4] = self;
  v15 = v4;
  objc_msgSend(v13, "enqueueBlock:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_7:

}

void __40__FCUserVectorManager__fetchUserVector___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "userVector");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_3;
  v9[3] = &unk_1E4646F40;
  v10 = *(id *)(a1 + 40);
  v8 = v3;
  v11 = v8;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "fetchSubscribedTagsWithCallbackQueue:preferCache:completion:", v7, 1, v9);

  objc_destroyWeak(&v12);
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[6];
  id v26;
  id v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_4;
  aBlock[3] = &unk_1E4646EA0;
  v34 = *(id *)(a1 + 40);
  v35 = *(id *)(a1 + 48);
  v4 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v23 = WeakRetained;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = v3;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v13, "asSports", v23);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "insertObject:atIndex:", v15, objc_msgSend(v7, "count"));

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v10);
    }

    v16 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Attempting a user vector resource fetch", buf, 2u);
    }
    v17 = v23;
    objc_msgSend(v23, "context", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appConfigurationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_23;
    v25[3] = &unk_1E4646F18;
    v21 = v4;
    v25[4] = *(_QWORD *)(a1 + 32);
    v25[5] = v17;
    v26 = v7;
    v27 = v21;
    v22 = v7;
    objc_msgSend(v19, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", v20, v25);

    v3 = v24;
  }
  else if (v4)
  {
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  FCResourcesFetchOperation *v17;
  void *v18;
  void *v19;
  FCResourcesFetchOperation *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[6];
  _QWORD v39[2];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_24;
    v38[3] = &unk_1E463B790;
    v8 = *(_QWORD *)(a1 + 56);
    v38[4] = v6;
    v38[5] = v8;
    __40__FCUserVectorManager__fetchUserVector___block_invoke_2_24((uint64_t)v38);
  }
  else
  {
    objc_msgSend(v5, "userVectorWhitelistResourceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      v12 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v11;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "Found userVectorWhitelistResourceId: %@, building fetch operation", buf, 0xCu);
      }
      objc_msgSend(v5, "userVectorModelResourceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
        v16 = FCPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v11;
          _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Found userVectorModelResourceId: %@, building fetch operation", buf, 0xCu);
        }
        v17 = [FCResourcesFetchOperation alloc];
        objc_msgSend(*(id *)(a1 + 32), "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v11;
        v39[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v17, "initWithContext:resourceIDs:downloadAssets:", v18, v19, 1);

        -[FCFetchOperation setCachePolicy:](v20, "setCachePolicy:", 4);
        -[FCFetchOperation setMaximumCachedAge:](v20, "setMaximumCachedAge:", 86400.0);
        -[FCOperation setQualityOfService:](v20, "setQualityOfService:", 9);
        -[FCOperation setRelativePriority:](v20, "setRelativePriority:", 0);
        -[FCOperation shortOperationDescription](v20, "shortOperationDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_35;
        v26[3] = &unk_1E4646EF0;
        v27 = v21;
        v28 = 0;
        v35 = *(id *)(a1 + 56);
        v29 = v11;
        v30 = v15;
        v31 = *(_QWORD *)(a1 + 40);
        v22 = v5;
        v23 = *(_QWORD *)(a1 + 32);
        v32 = v22;
        v33 = v23;
        v34 = *(id *)(a1 + 48);
        v24 = v15;
        v25 = v21;
        -[FCFetchOperation setFetchCompletionBlock:](v20, "setFetchCompletionBlock:", v26);
        -[FCOperation start](v20, "start");

      }
      else
      {
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_30;
        v36[3] = &unk_1E463B598;
        v36[4] = *(_QWORD *)(a1 + 56);
        __40__FCUserVectorManager__fetchUserVector___block_invoke_30((uint64_t)v36);
      }

    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_25;
      v37[3] = &unk_1E463B598;
      v37[4] = *(_QWORD *)(a1 + 56);
      __40__FCUserVectorManager__fetchUserVector___block_invoke_25((uint64_t)v37);
    }

  }
}

uint64_t __40__FCUserVectorManager__fetchUserVector___block_invoke_2_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "App config returned error: %@", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "App config contained no userVectorWhitelistResourceId", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Didn't find a userVectorWhitelistResourceId in the News app config");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "App config contained no userVectorModelResourceId", v7, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Didn't find a userVectorModelResourceId in the News app config");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v6);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  FCUserVector *v27;
  FCUserVector *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  FCUserVector *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[4];
  id v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  void *v65;
  uint64_t v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_36;
    v63[3] = &unk_1E463CCB8;
    v5 = *(void **)(a1 + 40);
    v64 = *(id *)(a1 + 32);
    v65 = v5;
    v66 = *(_QWORD *)(a1 + 96);
    v6 = v5;
    v7 = v64;
    __40__FCUserVectorManager__fetchUserVector___block_invoke_2_36(v63);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_37;
    v61[3] = &unk_1E463AA78;
    v62 = v3;
    objc_msgSend(v8, "fc_dictionary:", v61);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v50 = v14;
        v16 = FCPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v68 = v13;
          v69 = 2112;
          v70 = v50;
          _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Got resources: %@, %@", buf, 0x16u);
        }
        objc_msgSend(v13, "fileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v17;
        if (v17)
        {
          v48 = v17;
          v18 = v50;
          objc_msgSend(v50, "fileURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v19;
          if (v19)
          {
            v37 = v13;
            v20 = v19;
            v21 = FCPersonalizationLog;
            if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v68 = v48;
              v69 = 2112;
              v70 = v20;
              _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "Got file URLs: %@, %@", buf, 0x16u);
            }
            v44 = [FCUserVector alloc];
            objc_msgSend(*(id *)(a1 + 72), "personalizationTreatment");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 80), "context");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "bundleSubscriptionManager");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "bundleSubscription");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "bundleChannelIDs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 80), "context");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "bundleSubscriptionManager");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "bundleSubscription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "bundleChannelIDsVersion");
            v23 = v20;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 80), "context");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "subscriptionController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v44;
            v45 = v23;
            v28 = -[FCUserVector initWithWhitelistURL:modelURL:personalizationTreatment:bundleChannelIDs:bundleChannelIDsVersion:subscriptionController:sportsTagIDs:](v27, "initWithWhitelistURL:modelURL:personalizationTreatment:bundleChannelIDs:bundleChannelIDsVersion:subscriptionController:sportsTagIDs:", v48, v23, v46, v22, v24, v26, *(_QWORD *)(a1 + 88));
            objc_msgSend(*(id *)(a1 + 64), "setUserVector:", v28);

            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "setLastUpdated:", v29);

            v30 = *(_QWORD *)(a1 + 96);
            if (v30)
            {
              objc_msgSend(*(id *)(a1 + 64), "userVector");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *, _QWORD))(v30 + 16))(v30, v31, 0);

            }
            v18 = v50;
            v32 = v45;
            v13 = v37;
          }
          else
          {
            v51[0] = v9;
            v51[1] = 3221225472;
            v51[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_53;
            v51[3] = &unk_1E463B2D0;
            v36 = *(void **)(a1 + 96);
            v51[4] = v50;
            v51[5] = v36;
            v32 = v36;
            __40__FCUserVectorManager__fetchUserVector___block_invoke_53((uint64_t)v51);
          }

          v35 = v48;
        }
        else
        {
          v52[0] = v9;
          v52[1] = 3221225472;
          v52[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_50;
          v52[3] = &unk_1E463B2D0;
          v34 = *(void **)(a1 + 96);
          v52[4] = v13;
          v52[5] = v34;
          v35 = v34;
          __40__FCUserVectorManager__fetchUserVector___block_invoke_50((uint64_t)v52);
          v18 = v50;
        }

        v33 = v49;
      }
      else
      {
        v53[0] = v9;
        v53[1] = 3221225472;
        v53[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_49;
        v53[3] = &unk_1E463DC60;
        v18 = *(id *)(a1 + 96);
        v55 = v10;
        v56 = v18;
        v54 = *(id *)(a1 + 56);
        v33 = v54;
        __40__FCUserVectorManager__fetchUserVector___block_invoke_49((uint64_t)v53);
      }

    }
    else
    {
      v57[0] = v9;
      v57[1] = 3221225472;
      v57[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_46;
      v57[3] = &unk_1E463DC60;
      v13 = *(id *)(a1 + 96);
      v59 = v10;
      v60 = v13;
      v58 = *(id *)(a1 + 48);
      v15 = v58;
      __40__FCUserVectorManager__fetchUserVector___block_invoke_46((uint64_t)v57);
    }

    v7 = v62;
  }

}

uint64_t __40__FCUserVectorManager__fetchUserVector___block_invoke_2_36(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = a1[4];
    v5 = a1[5];
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Fetch operation: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, a1[5]);
  return result;
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fetchedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__FCUserVectorManager__fetchUserVector___block_invoke_2_38;
  v6[3] = &unk_1E4646EC8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_2_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "resourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "resourceIdentifier");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCUserVectorManager _fetchUserVector:]_block_invoke_2";
    v8 = 2080;
    v9 = "FCUserVectorManager.m";
    v10 = 1024;
    v11 = 292;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "fc_safelySetObjectAllowingNil:forKeyAllowingNil:", v3, v4);

}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "No whitelist resource provided back from fetch operation", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to find a resource for ID: %@, got back: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v9);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "No model resource provided back from fetch operation", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to find a resource for ID: %@, got back: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_missingResourceErrorWithDescription:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v9);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Whitelist resource had no fileURL", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a nil fileURL for resource: %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

  }
}

void __40__FCUserVectorManager__fetchUserVector___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Model resource had no fileURL", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a nil fileURL for resource: %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 19, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

  }
}

- (FCUserVectorAggregateVectorProvider)tabiBasedAggregateVectorProvider
{
  return self->_tabiBasedAggregateVectorProvider;
}

- (void)setTabiBasedAggregateVectorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_tabiBasedAggregateVectorProvider, a3);
}

- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider
{
  return self->_aggregateStoreProvider;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (FCAsyncSerialQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FCUserVector)userVector
{
  return self->_userVector;
}

- (void)setUserVector:(id)a3
{
  objc_storeStrong((id *)&self->_userVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_aggregateStoreProvider, 0);
  objc_storeStrong((id *)&self->_tabiBasedAggregateVectorProvider, 0);
}

@end
