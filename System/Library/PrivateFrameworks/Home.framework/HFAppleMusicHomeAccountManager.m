@implementation HFAppleMusicHomeAccountManager

+ (id)sharedInstance
{
  if (qword_1ED378EA0 != -1)
    dispatch_once(&qword_1ED378EA0, &__block_literal_global_38);
  return (id)_MergedGlobals_231;
}

- (id)_fetchMediaAccountForHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;
  id v12[2];
  id location;

  v5 = a3;
  if (!objc_msgSend(v5, "isMultiUserEnabled")
    || (-[HFAppleMusicHomeAccountManager _futureForQueryLimitForHome:](self, "_futureForQueryLimitForHome:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0D519C0];
    v10 = MEMORY[0x1E0C809B0];
    objc_copyWeak(v12, &location);
    v11 = v5;
    v12[1] = (id)a2;
    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v10, 3221225472, __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke, &unk_1EA72B098);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithBlock:scheduler:", &v10, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = objc_msgSend(v6, "isMultiUserEnabled");
    HFLogForCategory(5uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((v7 & 1) != 0)
    {
      if (v9)
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v53 = v10;
        v54 = 2112;
        v55 = v11;
        v56 = 1024;
        LODWORD(v57) = objc_msgSend(v11, "isMultiUserEnabled");
        _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@ Now Fetching ams_iTunesAccount for Home [%@] MU enabled = %d", buf, 0x1Cu);

      }
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ams_mediaAccountForHomeWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0;
      objc_msgSend(v13, "resultWithTimeout:error:", &v49, 2.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v49;
      v16 = v15;
      if (!v14 || v15)
      {
        if (v15)
        {
          if (objc_msgSend(v15, "code") == 13)
          {
            objc_msgSend(WeakRetained, "concurrentQueryQueue");
            v33 = objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_2;
            v44[3] = &unk_1EA7270A0;
            v44[4] = WeakRetained;
            v45 = *(id *)(a1 + 32);
            v46 = v3;
            dispatch_sync(v33, v44);

            HFLogForCategory(5uLL);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(*(SEL *)(a1 + 48));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v53 = v35;
              v54 = 2112;
              v55 = v36;
              _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "%@ams_iTunesAccount migration is in flight for Home [%@]. We will finish the promise later when the information is available. Right now, returning...", buf, 0x16u);

            }
            v24 = 0;
            goto LABEL_26;
          }
          v43 = v13;
          objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "UUIDString");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v38;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          HFLogForCategory(5uLL);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            v53 = v41;
            v54 = 2112;
            v55 = v42;
            v56 = 2112;
            v57 = v16;
            _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "%@ Failed to fetch ams_iTunesAccount for Home [%@] - [%@]", buf, 0x20u);

          }
          objc_msgSend(v3, "finishWithResult:", v24);
          v13 = v43;
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v18;
        v59 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        HFLogForCategory(5uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v53 = v21;
          v54 = 2112;
          v55 = v19;
          v56 = 2112;
          v57 = v22;
          _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "%@ Successfully fetched ams_iTunesAccount [%@] for Home [%@]", buf, 0x20u);

        }
        objc_msgSend(WeakRetained, "dataModelUpdateQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_17;
        block[3] = &unk_1EA727188;
        block[4] = WeakRetained;
        v24 = v19;
        v48 = v24;
        dispatch_barrier_sync(v23, block);

        objc_msgSend(v3, "finishWithResult:", v24);
      }
      objc_msgSend(WeakRetained, "_finishPendingPromisesWithMediaAccountInfo:forHome:", v24, *(_QWORD *)(a1 + 32));
LABEL_26:

      goto LABEL_27;
    }
    if (v9)
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v53 = v27;
      v54 = 2112;
      v55 = v28;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@ This Home [%@] does NOT have Multi-User enabled, returning", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 57);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v29);

    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v31;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "finishWithResult:", v24);
  }
  else
  {
    HFLogForCategory(5uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v26;
      _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "%@ This Home no longer exists, returning", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 59);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v24);
  }
LABEL_27:

}

- (id)_futureForQueryLimitForHome:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_initWeak(&location, self);
  -[HFAppleMusicHomeAccountManager concurrentQueryQueue](self, "concurrentQueryQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke;
  block[3] = &unk_1EA72B0C0;
  objc_copyWeak(&v22, &location);
  v8 = v5;
  v20 = v8;
  v21 = &v24;
  dispatch_sync(v6, block);

  if (*((_BYTE *)v25 + 24))
  {
    -[HFAppleMusicHomeAccountManager homeIdentifierToFuturePromiseMapping](self, "homeIdentifierToFuturePromiseMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      v11 = (void *)objc_opt_new();
      -[HFAppleMusicHomeAccountManager setHomeIdentifierToFuturePromiseMapping:](self, "setHomeIdentifierToFuturePromiseMapping:", v11);

    }
    HFLogForCategory(5uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@ Unable to query Home Media Account for Home [%@] query limit reached.\nWe will callback the request later when the information is available.", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0D519C0];
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_22;
    v17[3] = &unk_1EA729F18;
    v17[4] = self;
    v18 = v8;
    objc_msgSend(v14, "futureWithBlock:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (void)_finishPendingPromisesWithMediaAccountInfo:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HFAppleMusicHomeAccountManager concurrentQueryQueue](self, "concurrentQueryQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke;
  block[3] = &unk_1EA7270A0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)concurrentQueryQueue
{
  return self->_concurrentQueryQueue;
}

void __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "homeIdentifierToActiveAMSQueriesMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  objc_msgSend(a1[4], "homeIdentifierToActiveAMSQueriesMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
  {
    objc_msgSend(a1[5], "uniqueIdentifier", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue", v5) - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v10);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1[4], "homeIdentifierToFuturePromiseMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(a1[4], "homeIdentifierToFuturePromiseMapping");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v22[0] = v15;
        v22[1] = 3221225472;
        v22[2] = __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke_2;
        v22[3] = &unk_1EA728A78;
        v23 = a1[6];
        objc_msgSend(v19, "na_each:", v22);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(a1[4], "homeIdentifierToFuturePromiseMapping");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

}

- (NSMutableDictionary)homeIdentifierToFuturePromiseMapping
{
  return self->_homeIdentifierToFuturePromiseMapping;
}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "homeIdentifierToActiveAMSQueriesMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "setHomeIdentifierToActiveAMSQueriesMapping:", v3);

  }
  objc_msgSend(WeakRetained, "homeIdentifierToActiveAMSQueriesMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "unsignedIntegerValue") > 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "homeIdentifierToActiveAMSQueriesMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v11);

  }
}

- (NSMutableDictionary)homeIdentifierToActiveAMSQueriesMapping
{
  return self->_homeIdentifierToActiveAMSQueriesMapping;
}

- (void)setHomeIdentifierToActiveAMSQueriesMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToActiveAMSQueriesMapping, a3);
}

void __64__HFAppleMusicHomeAccountManager_mediaAccountForHomeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToMediaAccountMapping");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)homeIdentifierToMediaAccountMapping
{
  return self->_homeIdentifierToMediaAccountMapping;
}

void __48__HFAppleMusicHomeAccountManager_sharedInstance__block_invoke()
{
  HFAppleMusicHomeAccountManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFAppleMusicHomeAccountManager);
  v1 = (void *)_MergedGlobals_231;
  _MergedGlobals_231 = (uint64_t)v0;

}

- (HFAppleMusicHomeAccountManager)init
{
  HFAppleMusicHomeAccountManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dataModelUpdateQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *concurrentQueryQueue;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *homeIdentifierToMediaAccountMapping;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFAppleMusicHomeAccountManager;
  v2 = -[HFAppleMusicHomeAccountManager init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create((const char *)kHomeMediaAccountsDataModelUpdateQueue, 0);
    dataModelUpdateQueue = v2->_dataModelUpdateQueue;
    v2->_dataModelUpdateQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create((const char *)kHomeMediaAccountsQueriesQueue, 0);
    concurrentQueryQueue = v2->_concurrentQueryQueue;
    v2->_concurrentQueryQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_applicationWillEnterForeground, *MEMORY[0x1E0CEB350], 0);

    v8 = objc_opt_new();
    homeIdentifierToMediaAccountMapping = v2->_homeIdentifierToMediaAccountMapping;
    v2->_homeIdentifierToMediaAccountMapping = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (id)mediaAccountForHomeIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[HFAppleMusicHomeAccountManager dataModelUpdateQueue](self, "dataModelUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HFAppleMusicHomeAccountManager_mediaAccountForHomeIdentifier___block_invoke;
  block[3] = &unk_1EA72B020;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)dataModelUpdateQueue
{
  return self->_dataModelUpdateQueue;
}

- (void)executeHomeMediaAccountFetchForAllHomes
{
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HFLogForCategory(5uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Fetching Media Accounts for All Homes", buf, 0xCu);

  }
  -[HFAppleMusicHomeAccountManager homeIdentifierToMediaAccountMapping](self, "homeIdentifierToMediaAccountMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    -[HFAppleMusicHomeAccountManager setHomeIdentifierToMediaAccountMapping:](self, "setHomeIdentifierToMediaAccountMapping:", v8);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HFAppleMusicHomeAccountManager_executeHomeMediaAccountFetchForAllHomes__block_invoke;
  v12[3] = &unk_1EA72AFF8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  objc_msgSend(v11, "na_each:", v12);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __73__HFAppleMusicHomeAccountManager_executeHomeMediaAccountFetchForAllHomes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Fetching ams_iTunesAccount for Home  %@", (uint8_t *)&v8, 0x16u);

  }
  v7 = (id)objc_msgSend(WeakRetained, "executeHomeMediaAccountFetchForHome:", v3);

}

- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HFAppleMusicHomeAccountManager *v20;
  id v21;
  id v22;
  SEL v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke;
  v18[3] = &unk_1EA72B070;
  v22 = v11;
  v23 = a2;
  v19 = v10;
  v20 = self;
  v21 = v9;
  v15 = v9;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "addFinishBlock:", v18);

}

void __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@ Error setting amsMediaAccount for home %@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke_11;
    v13[3] = &unk_1EA72B048;
    v8 = *(void **)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v15 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 56);
    v16 = 0;
    v17 = v9;
    v10 = (id)objc_msgSend(v7, "futureWithBlock:", v13);

  }
}

void __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToMediaAccountMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v6);

  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, "finishWithNoResult");

}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToMediaAccountMapping");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToFuturePromiseMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setHomeIdentifierToFuturePromiseMapping:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToFuturePromiseMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v18 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v18;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_opt_new();
  v13 = v12;

  objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToFuturePromiseMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, v17);

}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "concurrentQueryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_2;
  block[3] = &unk_1EA7270A0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_sync(v4, block);

}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToFuturePromiseMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v16 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v16;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifierToFuturePromiseMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, v15);

}

uint64_t __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke_2(uint64_t result, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "finishWithResult:", *(_QWORD *)(result + 32));
  return result;
}

- (void)getHomeMediaAccountForHome:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, void *);
  SEL v17;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAppleMusicHomeAccountManager mediaAccountForHomeIdentifier:](self, "mediaAccountForHomeIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v8[2](v8, v11);
  }
  else
  {
    -[HFAppleMusicHomeAccountManager executeHomeMediaAccountFetchForHome:](self, "executeHomeMediaAccountFetchForHome:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__HFAppleMusicHomeAccountManager_getHomeMediaAccountForHome_withCompletion___block_invoke;
    v14[3] = &unk_1EA72B0E8;
    v17 = a2;
    v14[4] = self;
    v15 = v7;
    v16 = v8;
    v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v14);

  }
}

void __76__HFAppleMusicHomeAccountManager_getHomeMediaAccountForHome_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount [%@]", (uint8_t *)&v18, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v10;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Home Media Account [%@]", (uint8_t *)&v18, 0x20u);

    goto LABEL_6;
  }

  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);

}

- (void)setHomeIdentifierToMediaAccountMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToMediaAccountMapping, a3);
}

- (void)setDataModelUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, a3);
}

- (void)setConcurrentQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueryQueue, a3);
}

- (void)setHomeIdentifierToFuturePromiseMapping:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifierToFuturePromiseMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifierToFuturePromiseMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToActiveAMSQueriesMapping, 0);
  objc_storeStrong((id *)&self->_concurrentQueryQueue, 0);
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToMediaAccountMapping, 0);
}

@end
