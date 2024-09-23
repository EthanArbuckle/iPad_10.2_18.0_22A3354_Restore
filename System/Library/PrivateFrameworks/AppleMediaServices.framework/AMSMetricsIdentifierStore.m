@implementation AMSMetricsIdentifierStore

+ (id)_accountIdentifierForAccount:(id)a3
{
  void *v3;
  __CFString *v4;

  objc_msgSend(a3, "ams_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4 || -[__CFString integerValue](v4, "integerValue") <= 0)
  {

    v4 = &stru_1E2548760;
  }
  return v4;
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (id)_generateEventFieldsForKeys:(id)a3 date:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AMSMetricsIdentifierStore _identifiersForKeys:currentDate:](self, "_identifiersForKeys:currentDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "populateDictionary:", v5, (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_identifiersForKeys:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD block[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__47;
  v32 = __Block_byref_object_dispose__47;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AMSMetricsIdentifierStore__identifiersForKeys_currentDate___block_invoke;
  block[3] = &unk_1E2543CB0;
  block[4] = self;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  v22 = &v24;
  v23 = &v28;
  dispatch_sync(v8, block);

  if (*((_BYTE *)v25 + 24))
    v11 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync");
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29[5];
    *(_DWORD *)buf = 138544130;
    v35 = v14;
    v36 = 2114;
    v37 = v15;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = v16;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -_identifiersForKeys:currentDate: Providing for keys %{public}@: %{public}@", buf, 0x2Au);

  }
  v17 = (id)v29[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

+ (id)_sharedQueue
{
  if (qword_1ECEAD6F8 != -1)
    dispatch_once(&qword_1ECEAD6F8, &__block_literal_global_62);
  return (id)qword_1ECEAD700;
}

- (id)identifierForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMetricsIdentifierStore _identifiersForKeys:currentDate:](self, "_identifiersForKeys:currentDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __61__AMSMetricsIdentifierStore__identifiersForKeys_currentDate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  AMSMetricsIdentifierInfo *v43;
  void *v44;
  int v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  os_log_t log;
  NSObject *loga;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v3);
  v54 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetInterval");
  v65 = 0;
  v58 = v2;
  objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v7, v2, v5, v6, v8, v9, v10, &v65);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v65;

  if (v12 || !v11)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v54;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      loga = v32;
      v34 = objc_opt_class();
      AMSLogKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v67 = v34;
      v32 = loga;
      v68 = 2114;
      v69 = v35;
      v70 = 2112;
      v71 = v54;
      v72 = 2114;
      v73 = v37;
      v74 = 2114;
      v75 = v38;
      v76 = 2114;
      v77 = v39;
      _os_log_impl(&dword_18C849000, loga, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

    }
  }
  else
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "resetInterval");
    v15 = v14;
    v55 = v11;
    objc_msgSend(v11, "started");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "_periodFrom:storeInfoStarted:now:", v16, *(_QWORD *)(a1 + 48), v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v18 = *(id *)(a1 + 40);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v62;
      while (2)
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v62 != v22)
            objc_enumerationMutation(v18);
          v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v23);
          v26 = *(void **)(a1 + 32);
          v60 = v24;
          v27 = objc_msgSend(v26, "isAccountValidForKey:activeItunesAccountDSID:", v25, &v60);
          v21 = v60;

          if (v27)
          {
            v28 = *(void **)(a1 + 32);
            v29 = *(_QWORD *)(a1 + 48);
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
            v59 = 0;
            objc_msgSend(v28, "_identifierInfoForKey:storeInfo:period:inDatabase:date:setValue:lastSyncDate:needsToSync:error:", v25, v55, v17, v58, v29, 0, 0, v30, &v59);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v59;
            if (v12 || !v31)
            {
              +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v40)
              {
                +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v40, "OSLogObject");
              v41 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v54;
              v11 = v55;
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v50 = objc_opt_class();
                AMSLogKey();
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "clientInfo");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "bundleIdentifier");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "domain");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "name");
                v52 = v41;
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                AMSLogableError(v12);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544898;
                v67 = v50;
                v68 = 2114;
                v69 = v53;
                v70 = 2112;
                v71 = v54;
                v72 = 2114;
                v73 = v48;
                v74 = 2114;
                v75 = v47;
                v76 = 2114;
                v77 = v42;
                v78 = 2114;
                v79 = v49;
                _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

                v41 = v52;
              }

              v32 = log;
              goto LABEL_32;
            }
            -[NSObject addObject:](log, "addObject:", v31);

          }
          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v21 = 0;
    }

    v32 = log;
    if (objc_msgSend(*(id *)(a1 + 32), "includeAccountMatchStatus") && -[NSObject count](log, "count"))
    {
      v43 = objc_alloc_init(AMSMetricsIdentifierInfo);
      -[AMSMetricsIdentifierInfo setName:](v43, "setName:", CFSTR("xpAccountsMatch"));
      -[AMSMetricsIdentifierInfo setCrossDeviceSync:](v43, "setCrossDeviceSync:", 0);
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "ams_isActiveAccountCombined");

      if (v45)
        v46 = CFSTR("true");
      else
        v46 = CFSTR("false");
      -[AMSMetricsIdentifierInfo setValue:](v43, "setValue:", v46);
      -[NSObject addObject:](log, "addObject:", v43);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), log);
    v11 = v55;
    objc_msgSend(*(id *)(a1 + 32), "_generateFutureIdentifiersIfNeededForKeys:storeInfo:afterPeriod:inDatabase:date:", *(_QWORD *)(a1 + 40), v55, v17, v58, *(_QWORD *)(a1 + 48));
    v12 = 0;
    v33 = (void *)v54;
  }
LABEL_32:

}

- (ACAccount)account
{
  return self->_account;
}

- (BOOL)isAccountValidForKey:(id)a3 activeItunesAccountDSID:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (-[AMSMetricsIdentifierStore isActiveITunesAccountRequired](self, "isActiveITunesAccountRequired")
    || objc_msgSend(v6, "isActiveITunesAccountRequired"))
  {
    -[AMSMetricsIdentifierStore account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    if (v8)
    {
      -[AMSMetricsIdentifierStore account](self, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "ams_isiTunesAccount") & 1) == 0)
      {

        if (!a4)
          goto LABEL_12;
LABEL_10:
        if (*a4)
        {
          v13 = *a4;
          goto LABEL_13;
        }
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ams_activeiTunesAccount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_DSID");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!a4)
        {
LABEL_14:
          if (v13)
            v9 = objc_msgSend(v8, "isEqualToNumber:", v13);
          else
            v9 = 0;

          goto LABEL_18;
        }
LABEL_13:
        v13 = objc_retainAutorelease(v13);
        *a4 = v13;
        goto LABEL_14;
      }
      -[AMSMetricsIdentifierStore account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isActive");

      if ((v12 & 1) == 0)
      {
        if (!a4)
          goto LABEL_12;
        goto LABEL_10;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = 1;
LABEL_19:

  return v9;
}

- (BOOL)isActiveITunesAccountRequired
{
  return self->_isActiveITunesAccountRequired;
}

- (id)_identifierInfoForKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 inDatabase:(id)a6 date:(id)a7 setValue:(id)a8 lastSyncDate:(id)a9 needsToSync:(BOOL *)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  BOOL *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  AMSMetricsIdentifierStore *v48;
  BOOL *v49;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a6;
  -[AMSMetricsIdentifierStore resetInterval](self, "resetInterval");
  if (v22 == 0.0)
  {
    v26 = 0;
    v27 = a10;
  }
  else
  {
    objc_msgSend(v17, "started");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v17, "started");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetricsIdentifierStore resetInterval](self, "resetInterval");
      objc_msgSend(v24, "dateByAddingTimeInterval:", v25 * (double)(a5 + 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
    v27 = a10;

  }
  v28 = (void *)objc_opt_class();
  -[AMSMetricsIdentifierStore resetInterval](self, "resetInterval");
  objc_msgSend(v28, "_generateIdentifierKey:storeInfo:period:resetInterval:", v16, v17, a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __124__AMSMetricsIdentifierStore__identifierInfoForKey_storeInfo_period_inDatabase_date_setValue_lastSyncDate_needsToSync_error___block_invoke;
  v40[3] = &unk_1E2543C88;
  v41 = v18;
  v42 = v16;
  v43 = v29;
  v44 = v26;
  v45 = v17;
  v46 = v19;
  v47 = v20;
  v48 = self;
  v49 = v27;
  v30 = v20;
  v31 = v19;
  v32 = v17;
  v33 = v26;
  v34 = v29;
  v35 = v16;
  v36 = v18;
  objc_msgSend(v21, "identifierForKey:updateMaybe:error:", v34, v40, a11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (double)resetInterval
{
  return self->_resetInterval;
}

+ (id)_database
{
  return +[AMSMetricsDatabase sharedDatabaseWithContainerId:](AMSMetricsDatabase, "sharedDatabaseWithContainerId:", CFSTR("com.apple.AppleMediaServices.meta"));
}

uint64_t __124__AMSMetricsIdentifierStore__identifierInfoForKey_storeInfo_period_inDatabase_date_setValue_lastSyncDate_needsToSync_error___block_invoke(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "deleted") & 1) != 0
    || (objc_msgSend(v5, "expires"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = v6, v8 = objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 32)), v7, v8 != 1))
  {
    v10 = (void *)objc_opt_new();

    objc_msgSend(v10, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 40), "crossDeviceSync"));
    objc_msgSend(v10, "setIdKey:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v10, "setExpires:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "storeUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStoreUUID:", v11);

    objc_msgSend(*(id *)(a1 + 40), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v12);

    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(v10, "setValue:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ams_base62String");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:", v14);

    }
    objc_msgSend(v10, "setLastSync:", *(_QWORD *)(a1 + 80));
    v5 = objc_retainAutorelease(v10);
    *a2 = v5;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v15 = *(void **)(a1 + 72);
  if (v15)
  {
    objc_msgSend(v5, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v5, "setValue:", *(_QWORD *)(a1 + 72));
      v9 = 1;
    }
  }
  v18 = *(void **)(a1 + 80);
  if (v18)
  {
    objc_msgSend(v5, "lastSync");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToDate:", v19);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v5, "setLastSync:", *(_QWORD *)(a1 + 80));
      v9 = 1;
    }
  }
  v21 = objc_msgSend(v5, "crossDeviceSync");
  if (v21 == objc_msgSend(*(id *)(a1 + 40), "crossDeviceSync"))
  {
    v30 = (id *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 56))
    {
      if ((v9 & 1) == 0)
        goto LABEL_30;
LABEL_32:
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setModified:", v40);

      **(_BYTE **)(a1 + 96) |= objc_msgSend(v5, "crossDeviceSync");
      v39 = 1;
      goto LABEL_33;
    }
  }
  else
  {
    objc_msgSend(v5, "setCrossDeviceSync:", objc_msgSend(*(id *)(a1 + 40), "crossDeviceSync"));
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v42 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(*(id *)(a1 + 40), "crossDeviceSync");
      objc_msgSend(*(id *)(a1 + 40), "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "clientInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v42;
      v45 = 2114;
      v46 = v24;
      v47 = 1026;
      v48 = v25;
      v49 = 2114;
      v50 = v26;
      v51 = 2114;
      v52 = v28;
      v53 = 2114;
      v54 = v29;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier cross device sync (sync: %{public}d, key: %{public}@, client: %{public}@, domain: %{public}@)", buf, 0x3Au);

    }
    v30 = (id *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_32;
    v9 = 1;
  }
  objc_msgSend(v5, "expires");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_36;
  v32 = (void *)v31;
  objc_msgSend(*v30, "timeIntervalSinceReferenceDate");
  v34 = v33;
  objc_msgSend(v5, "expires");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSinceReferenceDate");
  v37 = v36;

  if (v34 < v37)
  {
LABEL_36:
    objc_msgSend(v5, "serverProvidedAt");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      objc_msgSend(v5, "setExpires:", *v30);
      goto LABEL_32;
    }
  }
  if (v9)
    goto LABEL_32;
LABEL_30:
  v39 = 0;
LABEL_33:

  return v39;
}

- (BOOL)includeAccountMatchStatus
{
  return self->_includeAccountMatchStatus;
}

- (NSString)domain
{
  return self->_domain;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)_generateFutureIdentifiersIfNeededForKeys:(id)a3 storeInfo:(id)a4 afterPeriod:(int64_t)a5 inDatabase:(id)a6 date:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  AMSMetricsIdentifierStore *v22;
  id v23;
  id v24;
  int64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[AMSMetricsIdentifierStore resetInterval](self, "resetInterval");
  if (v16 != 0.0)
  {
    objc_msgSend(v13, "started");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke;
      v19[3] = &unk_1E2543C60;
      v20 = v15;
      v21 = v13;
      v22 = self;
      v25 = a5;
      v23 = v12;
      v24 = v14;
      dispatch_async(v18, v19);

    }
  }

}

void __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  BOOL v29;
  int v30;
  id v32;
  void *v33;
  id obj;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", 604800.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "started");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 48), "resetInterval");
  v7 = (uint64_t)(v5 / v6);

  if (*(_QWORD *)(a1 + 72) + 7 >= (v7 & ~(v7 >> 63)))
    v8 = v7 & ~(v7 >> 63);
  else
    v8 = *(_QWORD *)(a1 + 72) + 7;
  if (qword_1ECEAD6E8 != -1)
    dispatch_once(&qword_1ECEAD6E8, &__block_literal_global_32_3);
  objc_storeStrong((id *)&_MergedGlobals_130, (id)qword_1ECEAD6F0);
  v9 = (void *)_MergedGlobals_130;
  objc_msgSend(*(id *)(a1 + 40), "storeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  if (!v12)
    v12 = *(_QWORD *)(a1 + 72);

  if (v8 > v12)
  {
    v13 = (void *)_MergedGlobals_130;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v15);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = *(id *)(a1 + 56);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = v17;
      v33 = v2;
      v19 = 0;
      v20 = *(_QWORD *)v38;
      obj = v16;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v22, "crossDeviceSync"))
          {
            v23 = v8;
            do
            {
              v36 = 0;
              v25 = *(_QWORD *)(a1 + 40);
              v24 = *(void **)(a1 + 48);
              v26 = *(_QWORD *)(a1 + 64);
              v27 = *(_QWORD *)(a1 + 32);
              v35 = 0;
              v28 = (id)objc_msgSend(v24, "_identifierInfoForKey:storeInfo:period:inDatabase:date:setValue:lastSyncDate:needsToSync:error:", v22, v25, v23, v26, v27, 0, 0, &v36, &v35);
              if (v35)
                v29 = 1;
              else
                v29 = v36 == 0;
              v30 = !v29;
              v19 |= v30;
              --v23;
            }
            while (v30 == 1 && v23 > v12);
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v18);

      v2 = v33;
      if ((v19 & 1) != 0)
        v32 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync");
    }
    else
    {

    }
  }

}

+ (id)_sync
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  AMSEngagement *v9;
  uint64_t v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] CloudKit Syncing", buf, 0x16u);

  }
  if (qword_1ECEAD708 != -1)
    dispatch_once(&qword_1ECEAD708, &__block_literal_global_64_0);
  if (qword_1ECEAD710)
  {
    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
    objc_sync_enter(v8);
    if (!qword_1ECEAD718)
    {
      v9 = objc_alloc_init(AMSEngagement);
      -[AMSEngagement syncMetricsIdentifiers](v9, "syncMetricsIdentifiers");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)qword_1ECEAD718;
      qword_1ECEAD718 = v10;

      v12 = dispatch_time(0, 1000000000);
      objc_msgSend(v8, "_sharedQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __34__AMSMetricsIdentifierStore__sync__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v8;
      dispatch_after(v12, v13, block);

    }
    objc_sync_exit(v8);

    v7 = (id)qword_1ECEAD718;
  }
  return v7;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (void)setIsActiveITunesAccountRequired:(BOOL)a3
{
  self->_isActiveITunesAccountRequired = a3;
}

- (void)setIncludeAccountMatchStatus:(BOOL)a3
{
  self->_includeAccountMatchStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)generateEventFieldsForKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierStore _generateEventFieldsForKeys:date:](self, "_generateEventFieldsForKeys:date:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateEventFieldsForKeys:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  -[AMSMetricsIdentifierStore resetInterval](self, "resetInterval");
  if (fabs(v10) > v11 + v11)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Date is out of bounds, using the current date.", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v16;
  }
  -[AMSMetricsIdentifierStore _generateEventFieldsForKeys:date:](self, "_generateEventFieldsForKeys:date:", v6, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __41__AMSMetricsIdentifierStore__sharedQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AMSMetricsIdentifierStore", 0);
  v1 = (void *)qword_1ECEAD700;
  qword_1ECEAD700 = (uint64_t)v0;

}

void __109__AMSMetricsIdentifierStore__generateFutureIdentifiersIfNeededForKeys_storeInfo_afterPeriod_inDatabase_date___block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend(v0, "setCountLimit:", 100);
  v1 = (void *)qword_1ECEAD6F0;
  qword_1ECEAD6F0 = (uint64_t)v0;

}

void __34__AMSMetricsIdentifierStore__sync__block_invoke()
{
  uint64_t v0;
  void *v1;

  NSClassFromString(CFSTR("XCTest"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD710;
  qword_1ECEAD710 = v0;

}

- (AMSMetricsIdentifierStore)init
{
  AMSMetricsIdentifierStore *v2;
  uint64_t v3;
  AMSMetricsDatabase *database;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSMetricsIdentifierStore;
  v2 = -[AMSMetricsIdentifierStore init](&v6, sel_init);
  if (v2)
  {
    +[AMSMetricsIdentifierStore _database](AMSMetricsIdentifierStore, "_database");
    v3 = objc_claimAutoreleasedReturnValue();
    database = v2->_database;
    v2->_database = (AMSMetricsDatabase *)v3;

  }
  return v2;
}

+ (void)cleanupIdentifiers
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "_sharedQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AMSMetricsIdentifierStore_cleanupIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

void __47__AMSMetricsIdentifierStore_cleanupIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cleaning up identifiers", buf, 0x16u);

  }
  v13 = 0;
  objc_msgSend(v2, "cleanupInvalidIdentifiersWithError:", &v13);
  v7 = v13;
  if (v7)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cleanup identifiers. %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "_sync");
  }

}

+ (id)identifierForAccount:(id)a3 bag:(id)a4 bagNamespace:(id)a5 keyName:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a1, "_parametersForBag:bagNamespace:", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AMSMetricsIdentifierStore_identifierForAccount_bag_bagNamespace_keyName___block_invoke;
  v17[3] = &unk_1E2543B78;
  v19 = v11;
  v20 = a1;
  v18 = v10;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "thenWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __75__AMSMetricsIdentifierStore_identifierForAccount_bag_bagNamespace_keyName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 48), "_identifierStoreWithAccount:parameters:", *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("crossDeviceKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  +[AMSMetricsIdentifierKey keyWithName:crossDeviceSync:](AMSMetricsIdentifierKey, "keyWithName:crossDeviceSync:", *(_QWORD *)(a1 + 40), objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keysThatRequireActiveITunesAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v7, "setIsActiveITunesAccountRequired:", objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v4, "identifierForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (AMSMetricsIdentifierStore)identifierStoreWithAccount:(id)a3 bagNamespace:(id)a4 bag:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a3;
  objc_msgSend(a1, "_parametersForBag:bagNamespace:", a5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__AMSMetricsIdentifierStore_identifierStoreWithAccount_bagNamespace_bag___block_invoke;
  v13[3] = &unk_1E25430A0;
  v14 = v8;
  v15 = a1;
  v10 = v8;
  objc_msgSend(v9, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSMetricsIdentifierStore *)v11;
}

id __73__AMSMetricsIdentifierStore_identifierStoreWithAccount_bagNamespace_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "_identifierStoreWithAccount:parameters:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)removeIdentifiersForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AMSMetricsIdentifierStore_removeIdentifiersForAccount___block_invoke;
  v7[3] = &unk_1E2540A40;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__AMSMetricsIdentifierStore_removeIdentifiersForAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "_accountIdentifierForAccount:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    v20 = 2112;
    v21 = v2;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing identifiers for account: %@", buf, 0x20u);

  }
  v15 = 0;
  objc_msgSend(v3, "removeIdentifiersForAccount:error:", v2, &v15);
  v8 = v15;
  if (v8)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2112;
      v21 = v2;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove identifiers for account: %@. %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v14 = (id)objc_msgSend(*(id *)(a1 + 40), "_sync");
  }

}

+ (void)removeIdentifiersForStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AMSMetricsIdentifierStore_removeIdentifiersForStore___block_invoke;
  v7[3] = &unk_1E2540A40;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__AMSMetricsIdentifierStore_removeIdentifiersForStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "_database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing identifiers for store: %@", buf, 0x20u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  objc_msgSend(v2, "removeIdentifiersForStore:error:", v8, &v17);
  v9 = v17;
  if (v9)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      AMSLogableError(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove identifiers for store: %@. %{public}@", buf, 0x2Au);

    }
  }
  else
  {
    v16 = (id)objc_msgSend(*(id *)(a1 + 40), "_sync");
  }

}

- (void)reset
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__AMSMetricsIdentifierStore_reset__block_invoke;
  v6[3] = &unk_1E253E2B0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __34__AMSMetricsIdentifierStore_reset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_generateStoreKeyForAccount:domain:clientInfo:", v3, v4, v5);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject", v28);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v10;
    v40 = 2114;
    v41 = v11;
    v42 = 2112;
    v43 = v7;
    v44 = 2114;
    v45 = v13;
    v46 = 2114;
    v47 = v14;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resetting identifiers (dsid: %@, client: %{public}@, domain: %{public}@)", buf, 0x34u);

  }
  v15 = *(void **)(a1 + 40);
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __34__AMSMetricsIdentifierStore_reset__block_invoke_23;
  v31[3] = &unk_1E2543BA0;
  v32 = v15;
  v33 = &v34;
  v30 = 0;
  v17 = (id)objc_msgSend(v16, "identifierStoreForKey:updateMaybe:error:", v29, v31, &v30);
  v18 = v30;
  if (v18)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_opt_class();
      AMSLogKey();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      v42 = 2112;
      v43 = v7;
      v44 = 2114;
      v45 = v24;
      v46 = 2114;
      v47 = v25;
      v48 = 2114;
      v49 = v26;
      _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to reset identifiers (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

    }
  }
  else if (*((_BYTE *)v35 + 24))
  {
    v27 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync");
  }

  _Block_object_dispose(&v34, 8);
}

BOOL __34__AMSMetricsIdentifierStore_reset__block_invoke_23(uint64_t a1, void **a2)
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = *a2;
  if (*a2)
  {
    v4 = (void *)MEMORY[0x1E0CB3A28];
    v5 = v2;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStoreUUID:", v7);

    objc_msgSend(v5, "setStarted:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setModified:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v5, "crossDeviceSync");

  }
  return v2 != 0;
}

- (void)setIdentifier:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_opt_class();
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting identifier: %@ (key: %{public}@)", (uint8_t *)&v13, 0x2Au);

  }
  -[AMSMetricsIdentifierStore _setIdentifier:withStartedDate:lastSyncDate:forKey:](self, "_setIdentifier:withStartedDate:lastSyncDate:forKey:", v6, v8, 0, v7);

}

- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v11 = a4;
  v9 = a3;
  if (objc_msgSend(v8, "crossDeviceSync"))
    v10 = v11;
  else
    v10 = 0;
  -[AMSMetricsIdentifierStore _setIdentifier:withStartedDate:lastSyncDate:forKey:](self, "_setIdentifier:withStartedDate:lastSyncDate:forKey:", v9, v11, v10, v8);

}

- (void)_setIdentifier:(id)a3 withStartedDate:(id)a4 lastSyncDate:(id)a5 forKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  AMSMetricsIdentifierStore *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __80__AMSMetricsIdentifierStore__setIdentifier_withStartedDate_lastSyncDate_forKey___block_invoke;
  v23 = &unk_1E2543BC8;
  v24 = self;
  v15 = v13;
  v25 = v15;
  v16 = v11;
  v26 = v16;
  v29 = &v30;
  v17 = v10;
  v27 = v17;
  v18 = v12;
  v28 = v18;
  dispatch_sync(v14, &v20);

  if (*((_BYTE *)v31 + 24))
    v19 = +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync", v20, v21, v22, v23, v24, v25, v26, v27);

  _Block_object_dispose(&v30, 8);
}

void __80__AMSMetricsIdentifierStore__setIdentifier_withStartedDate_lastSyncDate_forKey___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v3);
  v42 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_class();
  v60[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetInterval");
  v45 = 0;
  v43 = v2;
  objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v5, v2, v6, v7, v8, v9, v10, &v45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v45;

  if (v12 || !v11)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      AMSLogKey();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v47 = v28;
      v48 = 2114;
      v49 = v29;
      v50 = 2112;
      v26 = (void *)v42;
      v51 = v42;
      v52 = 2114;
      v53 = v31;
      v54 = 2114;
      v55 = v32;
      v56 = 2114;
      v57 = v33;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

      v24 = v43;
LABEL_17:

      goto LABEL_18;
    }
    v24 = v2;
LABEL_16:
    v26 = (void *)v42;
    goto LABEL_17;
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "resetInterval");
  v15 = v14;
  objc_msgSend(v11, "started");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "_periodFrom:storeInfoStarted:now:", v16, *(_QWORD *)(a1 + 48), v15);

  v18 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v22 = *(_QWORD *)(a1 + 64);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
  v44 = 0;
  v24 = v43;
  objc_msgSend(v18, "_identifierInfoForKey:storeInfo:period:inDatabase:date:setValue:lastSyncDate:needsToSync:error:", v19, v11, v17, v43, v20, v21, v22, v23, &v44);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v44;
  if (v12 || !v25)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v27, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      AMSLogKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v47 = v40;
      v48 = 2114;
      v49 = v35;
      v50 = 2112;
      v51 = v42;
      v52 = 2114;
      v53 = v36;
      v54 = 2114;
      v55 = v37;
      v56 = 2114;
      v57 = v38;
      v58 = 2114;
      v59 = v39;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

      v24 = v43;
    }

    goto LABEL_16;
  }
  v12 = 0;
  v26 = (void *)v42;
LABEL_18:

}

- (id)identifierIfExistsForKey:(id)a3
{
  id v4;
  void *v5;
  AMSMutablePromise *v6;
  void *v7;
  uint64_t v8;
  AMSMutablePromise *v9;
  id v10;
  id v11;
  AMSMutablePromise *v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  AMSMutablePromise *v19;
  _QWORD *v20;
  _QWORD v21[4];
  AMSMutablePromise *v22;
  _QWORD v23[3];
  char v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v6 = objc_alloc_init(AMSMutablePromise);
  +[AMSMetricsIdentifierStore _sync](AMSMetricsIdentifierStore, "_sync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke;
  v21[3] = &unk_1E253E120;
  v9 = v6;
  v22 = v9;
  objc_msgSend(v7, "addErrorBlock:", v21);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_2;
  v16[3] = &unk_1E2543C38;
  v16[4] = self;
  v10 = v4;
  v17 = v10;
  v11 = v5;
  v18 = v11;
  v20 = v23;
  v12 = v9;
  v19 = v12;
  objc_msgSend(v7, "addFinishBlock:", v16);
  v13 = v19;
  v14 = v12;

  _Block_object_dispose(v23, 8);
  return v14;
}

uint64_t __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  id v7;
  id v8;
  __int128 v9;

  +[AMSMetricsIdentifierStore _sharedQueue](AMSMetricsIdentifierStore, "_sharedQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_3;
  block[3] = &unk_1E2543C10;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v9 = v5;
  dispatch_async(v2, block);

}

void __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_class();
  v72[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetInterval");
  v57 = 0;
  objc_msgSend(v4, "_identifierStoreInfoForKeys:inDatabase:date:needsToSync:account:clientInfo:domain:resetInterval:error:", v5, v2, v6, v7, v8, v9, v10, &v57);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v57;

  v54 = v11;
  if (v12 || !v11)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v37, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_opt_class();
      AMSLogKey();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bundleIdentifier");
      v53 = v2;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v12);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v59 = v39;
      v60 = 2114;
      v61 = v40;
      v62 = 2112;
      v63 = v55;
      v64 = 2114;
      v65 = v42;
      v66 = 2114;
      v67 = v43;
      v68 = 2114;
      v69 = v44;
      _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch/insert identifier store (dsid: %@, client: %{public}@, domain: %{public}@) %{public}@", buf, 0x3Eu);

      v2 = v53;
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v12);
  }
  else
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "resetInterval");
    v15 = v14;
    objc_msgSend(v11, "started");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "_periodFrom:storeInfoStarted:now:", v16, *(_QWORD *)(a1 + 48), v15);

    v18 = (void *)objc_opt_class();
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "resetInterval");
    objc_msgSend(v18, "_generateIdentifierKey:storeInfo:period:resetInterval:", v19, v11, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v2, "identifierForKey:updateMaybe:error:", v20, &__block_literal_global_91, &v56);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v56;
    if (v12)
    {
      +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v49 = objc_opt_class();
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "clientInfo");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "bundleIdentifier");
        v51 = v20;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "domain");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v12);
        v52 = v2;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v59 = v49;
        v60 = 2114;
        v61 = v24;
        v62 = 2112;
        v63 = v55;
        v64 = 2114;
        v65 = v25;
        v66 = 2114;
        v67 = v26;
        v68 = 2114;
        v69 = v27;
        v70 = 2114;
        v71 = v28;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Database failure while searching for record (dsid: %@, client: %{public}@, domain: %{public}@, key: %{public}@) %{public}@", buf, 0x48u);

        v20 = v51;
        v2 = v52;

      }
    }
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v21)
    {
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = objc_opt_class();
        AMSLogKey();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v59 = v32;
        v60 = 2114;
        v61 = v33;
        v62 = 2114;
        v63 = v34;
        v64 = 2114;
        v65 = v21;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -identifierIfExistsForKey: Providing for key: %{public}@, ID: %{public}@", buf, 0x2Au);

      }
      v35 = *(void **)(a1 + 56);
      objc_msgSend(v21, "value");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "finishWithResult:", v36);

    }
    else
    {
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v46 = objc_opt_class();
        AMSLogKey();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v59 = v46;
        v60 = 2114;
        v61 = v47;
        v62 = 2114;
        v63 = v48;
        _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] -identifierIfExistsForKey: Providing empty string ID for key %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", &stru_1E2548760);
    }

  }
}

uint64_t __54__AMSMetricsIdentifierStore_identifierIfExistsForKey___block_invoke_28()
{
  return 0;
}

+ (id)_identifierStoreInfoForKeys:(id)a3 inDatabase:(id)a4 date:(id)a5 needsToSync:(BOOL *)a6 account:(id)a7 clientInfo:(id)a8 domain:(id)a9 resetInterval:(double)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  BOOL *v42;
  BOOL v43;

  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  +[AMSMetricsIdentifierStore _accountIdentifierForAccount:](AMSMetricsIdentifierStore, "_accountIdentifierForAccount:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_generateStoreKeyForAccount:domain:clientInfo:", v20, v19, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "ac_firstObjectPassingTest:", &__block_literal_global_43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2;
  v34[3] = &unk_1E2543CF8;
  v35 = v23;
  v36 = v24;
  v43 = v25 != 0;
  v37 = v17;
  v38 = v18;
  v39 = v19;
  v40 = a1;
  v41 = a10;
  v42 = a6;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v24;
  v30 = v23;
  objc_msgSend(v21, "identifierStoreForKey:updateMaybe:error:", v29, v34, a11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

uint64_t __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "crossDeviceSync");
}

uint64_t __131__AMSMetricsIdentifierStore__identifierStoreInfoForKeys_inDatabase_date_needsToSync_account_clientInfo_domain_resetInterval_error___block_invoke_2(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  double v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _BYTE v35[28];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "deleted"))
  {
    v9 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();

    objc_msgSend(v6, "setAccount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setStoreKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStoreUUID:", v8);

    objc_msgSend(v6, "setStarted:", *(_QWORD *)(a1 + 48));
    v5 = objc_retainAutorelease(v6);
    *a2 = v5;
    v9 = 1;
  }
  v10 = objc_msgSend(v5, "crossDeviceSync");
  v11 = *(unsigned __int8 *)(a1 + 96);
  if (v11 != v10)
  {
    objc_msgSend(v5, "setCrossDeviceSync:", v11 != 0);
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(unsigned __int8 *)(a1 + 96);
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 64);
      v30 = 138544386;
      v31 = v16;
      v32 = 2114;
      v33 = v17;
      v34 = 1026;
      *(_DWORD *)v35 = v18;
      *(_WORD *)&v35[4] = 2114;
      *(_QWORD *)&v35[6] = v19;
      *(_WORD *)&v35[14] = 2114;
      *(_QWORD *)&v35[16] = v20;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store cross device sync (sync: %{public}d, client: %{public}@, domain: %{public}@)", (uint8_t *)&v30, 0x30u);

    }
    objc_msgSend(v5, "resetInterval");
    if (v21 == *(double *)(a1 + 80))
      goto LABEL_19;
    goto LABEL_14;
  }
  objc_msgSend(v5, "resetInterval");
  if (v12 != *(double *)(a1 + 80))
  {
LABEL_14:
    objc_msgSend(v5, "setResetInterval:");
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 64);
      v30 = 138544386;
      v31 = v24;
      v32 = 2114;
      v33 = v25;
      v34 = 2050;
      *(_QWORD *)v35 = v26;
      *(_WORD *)&v35[8] = 2114;
      *(_QWORD *)&v35[10] = v27;
      *(_WORD *)&v35[18] = 2114;
      *(_QWORD *)&v35[20] = v28;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Updating identifier store reset interval (interval: %{public}f, client: %{public}@, domain: %{public}@)", (uint8_t *)&v30, 0x34u);

    }
    goto LABEL_19;
  }
  if (v9)
  {
LABEL_19:
    objc_msgSend(v5, "setModified:", *(_QWORD *)(a1 + 48));
    **(_BYTE **)(a1 + 88) |= objc_msgSend(v5, "crossDeviceSync");
    v13 = 1;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

+ (id)_generateStoreKeyForAccount:(id)a3 domain:(id)a4 clientInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "ams_DSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "ams_DSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v12);

  }
  if (v9)
  {
    v13 = v9;
  }
  else
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v13, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v14, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v16);

  }
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v10, "appendFormat:", CFSTR(".%@"), v8);
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "processName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v18);

  }
  return v10;
}

+ (id)_generateIdentifierKey:(id)a3 storeInfo:(id)a4 period:(int64_t)a5 resetInterval:(double)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "storeKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "storeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:", v12))
  {

    goto LABEL_5;
  }
  v13 = objc_msgSend(v9, "crossDeviceSync");

  if ((v13 & 1) != 0)
  {
LABEL_5:
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "storeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_%@_%llx_%lx"), v15, v16, (uint64_t)a6, a5);
    goto LABEL_6;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "storeUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@"), v15, v16, v20, v21);
LABEL_6:
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_identifierStoreWithAccount:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  AMSMetricsIdentifierStore *v13;
  AMSProcessInfo *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resetInterval"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  v13 = objc_alloc_init(AMSMetricsIdentifierStore);
  -[AMSMetricsIdentifierStore setAccount:](v13, "setAccount:", v6);

  if (v8)
  {
    v14 = -[AMSProcessInfo initWithBundleIdentifier:]([AMSProcessInfo alloc], "initWithBundleIdentifier:", v8);
    -[AMSMetricsIdentifierStore setClientInfo:](v13, "setClientInfo:", v14);

  }
  -[AMSMetricsIdentifierStore setDomain:](v13, "setDomain:", v10);
  -[AMSMetricsIdentifierStore setResetInterval:](v13, "setResetInterval:", (double)objc_msgSend(v12, "integerValue"));

  return v13;
}

+ (id)_parametersForBag:(id)a3 bagNamespace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  objc_msgSend(a3, "dictionaryForKey:", CFSTR("metrics-identifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__AMSMetricsIdentifierStore__parametersForBag_bagNamespace___block_invoke;
  v11[3] = &unk_1E2540030;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __60__AMSMetricsIdentifierStore__parametersForBag_bagNamespace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AMSErrorWithFormat(2, CFSTR("Metrics Identifier Store Failure"), CFSTR("Failed to find metrics identifiers parameters for namespace: %@"), v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __34__AMSMetricsIdentifierStore__sync__block_invoke_2(uint64_t a1)
{
  void *v1;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v1 = (void *)qword_1ECEAD718;
  qword_1ECEAD718 = 0;

  objc_sync_exit(obj);
}

+ (int64_t)_periodFrom:(double)a3 storeInfoStarted:(id)a4 now:(id)a5
{
  double v7;
  uint64_t v8;

  if (a3 == 0.0 || a4 == 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a5, "timeIntervalSinceDate:", a4);
    v8 = (uint64_t)(v7 / a3);
  }
  return v8 & ~(v8 >> 63);
}

+ (void)_setConsumerIdentifier:(id)a3 forKey:(id)a4 inNamespace:(id)a5 accountID:(id)a6 bag:(id)a7 at:(id)a8 serverProvidedAt:(id)a9
{
  +[AMSMetricsIdentifierStoreConsumerID _setConsumerIdentifier:forKey:inNamespace:accountID:bag:at:serverProvidedAt:](AMSMetricsIdentifierStoreConsumerID, "_setConsumerIdentifier:forKey:inNamespace:accountID:bag:at:serverProvidedAt:", a3, a4, a5, a6, a7, a8);
}

+ (void)_removeStoreForNamespace:(id)a3 accountID:(id)a4 bag:(id)a5
{
  +[AMSMetricsIdentifierStoreConsumerID _removeStoreForNamespace:accountID:bag:](AMSMetricsIdentifierStoreConsumerID, "_removeStoreForNamespace:accountID:bag:", a3, a4, a5);
}

+ (id)_applyExpiryForKey:(id)a3 inNamespace:(id)a4 accountID:(id)a5 bag:(id)a6 at:(id)a7 consumerIDResetInterval:(double)a8
{
  return +[AMSMetricsIdentifierStoreConsumerID _applyExpiryForKey:inNamespace:accountID:bag:at:consumerIDResetInterval:](AMSMetricsIdentifierStoreConsumerID, "_applyExpiryForKey:inNamespace:accountID:bag:at:consumerIDResetInterval:", a3, a4, a5, a6, a7, a8);
}

@end
