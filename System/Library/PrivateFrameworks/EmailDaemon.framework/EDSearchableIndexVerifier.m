@implementation EDSearchableIndexVerifier

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EDSearchableIndexVerifier_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_82 != -1)
    dispatch_once(&log_onceToken_82, block);
  return (OS_os_log *)(id)log_log_82;
}

void __32__EDSearchableIndexVerifier_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_82;
  log_log_82 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__EDSearchableIndexVerifier_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_9 != -1)
    dispatch_once(&signpostLog_onceToken_9, block);
  return (OS_os_log *)(id)signpostLog_log_9;
}

void __40__EDSearchableIndexVerifier_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_9;
  signpostLog_log_9 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDSearchableIndexVerifier)initWithDataSource:(id)a3
{
  id v4;
  EDSearchableIndexVerifier *v5;
  EDSearchableIndexVerifier *v6;
  os_activity_t v7;
  OS_os_activity *indexVerificationActivity;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDSearchableIndexVerifier;
  v5 = -[EDSearchableIndexVerifier init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = _os_activity_create(&dword_1D2F2C000, "verifying searchable index", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
    indexVerificationActivity = v6->_indexVerificationActivity;
    v6->_indexVerificationActivity = (OS_os_activity *)v7;

  }
  return v6;
}

- (id)_verifyDataSamples:(id)a3 usingTester:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  _QWORD aBlock[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _BYTE buf[24];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v29 = v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke;
  v41[3] = &unk_1E94A1440;
  v9 = v28;
  v42 = v9;
  v10 = v7;
  v43 = v10;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v41);
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionFromDataSamples:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isValid"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v45) = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_2;
    v38[3] = &unk_1E94A1468;
    v14 = v27;
    v39 = v14;
    v15 = v12;
    v40 = v15;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v38);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v16, "BOOLForKey:", CFSTR("EDSearchableIndexPostFakeCorruptSearchableIndexErrors"));

    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_3;
    aBlock[3] = &unk_1E94A14B8;
    aBlock[4] = self;
    v31 = v9;
    v36 = buf;
    v32 = v11;
    v17 = v14;
    v33 = v17;
    v34 = v10;
    v37 = (char)v13;
    v18 = v15;
    v35 = v18;
    v19 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D1E310], "queryWithExpression:builder:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "start");

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (id)objc_opt_class();
      v23 = objc_msgSend(v29, "count");
      v24 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      v45 = v23;
      v46 = 2048;
      v47 = v24;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> did not return a spotlight query. dataSamples.count=%lu transformedDataSamples.count=%lu", buf, 0x2Au);

    }
    objc_msgSend(v11, "finishWithResult:", MEMORY[0x1E0C9AA70]);
  }
  objc_msgSend(v11, "future");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transformDataForVerification:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 40), "queryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);

}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIDForSearchableIndexVerifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v5);

  objc_msgSend(*(id *)(a1 + 40), "fetchAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v6);

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_4;
  v16[3] = &unk_1E949BE18;
  v19 = *(_QWORD *)(a1 + 80);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v3, "setCompletionBlock:", v16);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_5;
  v9[3] = &unk_1E94A1490;
  v14 = *(_QWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 40);
  v15 = *(_BYTE *)(a1 + 88);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 72);
  objc_msgSend(v3, "setResultsBlock:", v9);
  objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailureBlock:", v8);

}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_4(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kEDSearchableIndexVerifierErrorDomain"), 1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", 0);

  }
}

void __60__EDSearchableIndexVerifier__verifyDataSamples_usingTester___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        objc_msgSend(v7, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = objc_msgSend(v8, "integerValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 40), "verifySearchableItem:matchesDataSample:", v7, v12))
          {
            if (*(_BYTE *)(a1 + 72))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FAKED: %@"), *(_QWORD *)(a1 + 56));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v11);

            }
            else
            {
              objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v11);
            }
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (void)_addFailingSamples:(id)a3 toResultDictionary:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__EDSearchableIndexVerifier__addFailingSamples_toResultDictionary___block_invoke;
  v7[3] = &unk_1E94A14E0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __67__EDSearchableIndexVerifier__addFailingSamples_toResultDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v6, "addObject:", v5);

}

- (id)_verifySamples:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v19;
  void *v20;
  EDSearchableIndexSubjectTester *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(EDSearchableIndexSubjectTester);
  v34[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v22;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        -[EDSearchableIndexVerifier _verifyDataSamples:usingTester:](self, "_verifyDataSamples:usingTester:", v4, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D1EEC0], "join:", v6);
  v27 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "result:", &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  if (v13)
  {
    v14 = v5;
    v5 = 0;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v15)
    {
      v19 = v12;
      v16 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          -[EDSearchableIndexVerifier _addFailingSamples:toResultDictionary:](self, "_addFailingSamples:toResultDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), v5, v19);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v15);
      v12 = v19;
    }
  }

  return v5;
}

- (void)verifyDataSamplesWithCompletionHandler:(id)a3 scheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[2];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[4];
  _QWORD v40[2];
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  unint64_t v48;
  os_activity_scope_state_s state;
  _QWORD v50[4];
  id v51;
  uint8_t v52[4];
  double v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((EFProtectedDataAvailable() & 1) != 0)
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter((os_activity_t)self->_indexVerificationActivity, &state);
    -[EDSearchableIndexVerifier dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = -[EDSearchableIndexVerifier _findMissingTransactionIDs:dataSource:](self, "_findMissingTransactionIDs:dataSource:", v9, v8);
    if (v10 - 1 <= 1)
    {
      os_activity_scope_leave(&state);
      if (!v6)
      {
LABEL_35:

        goto LABEL_36;
      }
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2;
      v45[3] = &unk_1E94A1508;
      v47 = v6;
      v48 = v10;
      v9 = v9;
      v46 = v9;
      objc_msgSend(v7, "performSyncBlock:", v45);

      v11 = v47;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v8, "searchableIndexForSearchableIndexVerifier:", self);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x2020000000;
    v44 = 0xAAAAAAAAAAAAAAAALL;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "valueForKey:", CFSTR("kDefaultsKeyLastVerifiedMessageID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");

    v44 = v14;
    objc_msgSend(v8, "dataSamplesForSearchableIndexVerifier:searchableIndex:count:lastVerifiedMessageID:", self, v33, 64, *((_QWORD *)v42 + 3));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v15, "count");
    if (!objc_msgSend(v15, "count"))
    {
      +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "No data samples fetched from database. Resetting kDefaultsKeyLastVerifiedMessageID to 0", v52, 2u);
      }

      objc_msgSend(v32, "setInteger:forKey:", 0, CFSTR("kDefaultsKeyLastVerifiedMessageID"));
      os_activity_scope_leave(&state);
      if (!v6)
        goto LABEL_33;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_28;
      v39[3] = &unk_1E94A1530;
      v40[0] = v6;
      v40[1] = v10;
      objc_msgSend(v7, "performSyncBlock:", v39);
      v29 = (id *)v40;
      goto LABEL_31;
    }
    -[EDSearchableIndexVerifier _verifyDataSamples:](self, "_verifyDataSamples:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2_29;
    v38[3] = &unk_1E94A1558;
    v38[4] = buf;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v38);
    v17 = objc_msgSend(v16, "count");
    v18 = (double)v17 / (double)(unint64_t)objc_msgSend(v15, "count");
    if (objc_msgSend(v16, "count") && v18 < 0.5)
    {
      +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[EDSearchableIndexVerifier verifyDataSamplesWithCompletionHandler:scheduler:].cold.1(v19, v18, v20, v21);

      objc_msgSend(v8, "dataSamplesForSearchableIndexVerifier:searchableIndex:count:lastVerifiedMessageID:", self, v33, 512, *((_QWORD *)v42 + 3));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_30;
      v37[3] = &unk_1E94A1558;
      v37[4] = buf;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v37);
      v23 = objc_msgSend(v22, "count");
      -[EDSearchableIndexVerifier _verifyDataSamples:](self, "_verifyDataSamples:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v24);
      v25 = objc_msgSend(v16, "count");

      v18 = (double)v25 / (double)(unint64_t)(v23 + v31);
    }
    if (v16)
    {
      if (!objc_msgSend(v16, "count"))
      {
        v27 = 2;
        goto LABEL_29;
      }
      +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v52 = 134218240;
        v53 = v18;
        v54 = 2048;
        v55 = 0x3FE0000000000000;
        _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Verification failed at ratio: %f. threshold: %f", v52, 0x16u);
      }
      v27 = 1;
    }
    else
    {
      +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Verification query results empty", v52, 2u);
      }
      v27 = 0;
    }

LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)v42 + 3));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forKey:", v30, CFSTR("kDefaultsKeyLastVerifiedMessageID"));

    os_activity_scope_leave(&state);
    if (!v6)
    {
      v9 = v16;
      goto LABEL_33;
    }
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_31;
    v34[3] = &unk_1E94A1508;
    v36[0] = v6;
    v36[1] = v27;
    v9 = v16;
    v35 = v9;
    objc_msgSend(v7, "performSyncBlock:", v34);

    v29 = (id *)v36;
LABEL_31:

LABEL_33:
    _Block_object_dispose(buf, 8);

    v11 = (void *)v33;
    goto LABEL_34;
  }
  +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Skipping verifyDataSamplesWithCompletionHandler. Protected data unavailable.", buf, 2u);
  }

  if (v6)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke;
    v50[3] = &unk_1E949BDA0;
    v51 = v6;
    objc_msgSend(v7, "performSyncBlock:", v50);

  }
LABEL_36:

}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 2, 0);

}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 48);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v1, 0);

}

uint64_t __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_2_29(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "longLongValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v3 > v5)
  {
    v5 = objc_msgSend(v6, "longLongValue");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v4 + 24) = v5;

}

void __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "longLongValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v3 > v5)
  {
    v5 = objc_msgSend(v6, "longLongValue");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v4 + 24) = v5;

}

uint64_t __78__EDSearchableIndexVerifier_verifyDataSamplesWithCompletionHandler_scheduler___block_invoke_31(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

- (id)_verifyDataSamples:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v27;
  os_signpost_id_t spid;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDSearchableIndexVerifier signpostLog](EDSearchableIndexVerifier, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  +[EDSearchableIndexVerifier signpostLog](EDSearchableIndexVerifier, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  spid = v6;
  v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "EDSearchableIndexVerifier", ", buf, 2u);
  }

  -[EDSearchableIndexVerifier _verifySamples:](self, "_verifySamples:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v10)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (objc_msgSend(v10, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke;
      aBlock[3] = &unk_1E949B300;
      v30 = v4;
      v27 = v12;
      v31 = v27;
      v13 = v11;
      v32 = v13;
      v14 = _Block_copy(aBlock);
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
      v15 = objc_msgSend(v13, "length");
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Searchable Index Verification failed\n%@"), v13, v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Searchable Index verification found missing rowids: %@"), v19, v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          -[EDSearchableIndexVerifier _verifyDataSamples:].cold.1((uint64_t)v17, v20);

      }
    }
    v18 = objc_msgSend(v10, "count");
  }
  else
  {
    v12 = 0;
    v18 = -1;
  }
  v21 = objc_msgSend(v10, "count");
  v22 = objc_msgSend(v4, "count");
  +[EDSearchableIndexVerifier signpostLog](EDSearchableIndexVerifier, "signpostLog");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134349568;
    v34 = v25;
    v35 = 2050;
    v36 = v18;
    v37 = 2050;
    v38 = (double)v21 / (double)v22;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v24, OS_SIGNPOST_INTERVAL_END, spid, "EDSearchableIndexVerifier", "SpotlightVerificationSamples=%{public,signpost.telemetry:number1}lu SpotlightVerificationResultFailures=%{public,signpost.telemetry:number2}ld SpotlightVerificationFailingRatio=%{public,signpost.description:attribute}f enableTelemetry=YES ", buf, 0x20u);
  }

  return v12;
}

void __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("row:%@ cid:%@\n"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "appendString:", v6);
  +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke_cold_1((uint64_t)v3, (uint64_t)v8, objc_msgSend(v5, "longLongValue"), v7);

}

- (unint64_t)_findMissingTransactionIDs:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "knownTransactionIDsForSearchableIndexVerifier:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[EDSearchableIndexVerifier _missingTransactionIDsFromTransactionIDs:](self, "_missingTransactionIDsFromTransactionIDs:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[NSObject result:](v9, "result:", &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (objc_msgSend(v10, "count"))
    {
      +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v19 = v13;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Found %lu missing transaction(s)", buf, 0xCu);
      }

      objc_msgSend(v6, "unionSet:", v10);
      v14 = 1;
    }
    else
    {
      if (v11)
      {
        +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[EDSearchableIndexVerifier _findMissingTransactionIDs:dataSource:].cold.1(v15);
      }
      else
      {
        +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Found all expected transaction identifiers", buf, 2u);
        }
      }

      v14 = 0;
    }

  }
  else
  {
    +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = 2;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "No transactionIDs were fetched from the database, which implies nothing has been indexed yet. Skipping further verification.", buf, 2u);
    }
    else
    {
      v14 = 2;
    }
  }

  return v14;
}

- (id)_missingTransactionIDsFromTransactionIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t aBlock;
  uint64_t v18;
  void (*v19)(id *, void *);
  void *v20;
  EDSearchableIndexVerifier *v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v4 = a3;
  if ((EFProtectedDataAvailable() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke;
    v20 = &unk_1E94A15A8;
    v21 = self;
    v7 = v6;
    v22 = v7;
    v8 = v5;
    v23 = v8;
    v9 = _Block_copy(&aBlock);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=*"), CFSTR("com_apple_mail_transaction"), aBlock, v18, v19, v20, v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E318], "expressionWithQueryString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E310], "queryWithExpression:builder:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");
    objc_msgSend(v7, "future");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[EDSearchableIndexVerifier log](EDSearchableIndexVerifier, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Skipping transaction ID verification. Protected data unavailable", buf, 2u);
    }

    v15 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_temporarilyUnavailableError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIDForSearchableIndexVerifier:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v5);

  v15[0] = CFSTR("com_apple_mail_transaction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v6);

  objc_msgSend(v3, "setAttribute:", 1);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_2;
  v12[3] = &unk_1E949B6D0;
  v13 = a1[5];
  v14 = a1[6];
  objc_msgSend(v3, "setCompletionBlock:", v12);
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_3;
  aBlock[3] = &unk_1E94A1580;
  v11 = a1[6];
  v8 = _Block_copy(aBlock);
  objc_msgSend(v3, "setFoundAttributeResultsBlock:", v8);
  objc_msgSend(v3, "setChangedAttributeResultsBlock:", v8);
  objc_msgSend(a1[5], "errorOnlyCompletionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFailureBlock:", v9);

}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "finishWithResult:");

}

void __70__EDSearchableIndexVerifier__missingTransactionIDsFromTransactionIDs___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("com_apple_mail_transaction")) & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(*(id *)(a1 + 32), "removeObject:", v10, (_QWORD)v11);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (EDSearchableIndexVerifierDataSource)dataSource
{
  return (EDSearchableIndexVerifierDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (OS_os_activity)indexVerificationActivity
{
  return self->_indexVerificationActivity;
}

- (void)setIndexVerificationActivity:(id)a3
{
  objc_storeStrong((id *)&self->_indexVerificationActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexVerificationActivity, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)verifyDataSamplesWithCompletionHandler:(uint64_t)a3 scheduler:(uint64_t)a4 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = 512;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a1, a4, "Verification failed at ratio %f. Performing verification with a larger sample of size %lu", (uint8_t *)&v4);
}

- (void)_verifyDataSamples:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void __48__EDSearchableIndexVerifier__verifyDataSamples___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a4, a3, "Failed verification for row:%@ citd:%lld", (uint8_t *)a2);
}

- (void)_findMissingTransactionIDs:(os_log_t)log dataSource:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to query for transaction identifiers", v1, 2u);
}

@end
