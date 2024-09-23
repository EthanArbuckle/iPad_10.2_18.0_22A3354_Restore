@implementation SGSuggestionsService

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7
{
  -[SGSuggestionsService namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:](self, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:", a3, a4, a5, a6, 0, a7);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:found:", *(_QWORD *)(a1 + 40), &v16);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v16)
  {
    ++_entitlements_block_invoke_foundCount;
    if (v2)
    {
      +[SGKeyValueCacheFile fullNameForEncodedContact:](SGKeyValueCacheFile, "fullNameForEncodedContact:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (*(_BYTE *)(a1 + 64) && *(_QWORD *)(a1 + 48) && objc_msgSend(v4, "length"))
      {
        _PASValidatedFormat(*(void **)(a1 + 48), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
        v13 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v13;
      }
    }
    else
    {
      v5 = 0;
    }
    v14 = *(_QWORD *)(a1 + 56);
    if (objc_msgSend(v5, "length"))
    {
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, MEMORY[0x1E0C9AA60], 0);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    ++_entitlements_block_invoke_notFoundCount;
  }

}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  uint64_t v23;
  _BOOL4 v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *log;
  os_log_t loga;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  SGSuggestionsService *v42;
  id v43;
  id v44;
  unint64_t v45;
  char v46;
  BOOL v47;
  BOOL v48;
  char v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  _BOOL4 v61;
  uint64_t v62;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detail"));

  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219008;
    v53 = objc_msgSend(v15, "length");
    v54 = 2048;
    v55 = a4;
    v56 = 1024;
    v57 = v11;
    v58 = 1024;
    v59 = v10;
    v60 = 1024;
    v61 = v9;
    _os_log_impl(&dword_1A2267000, v17, OS_LOG_TYPE_INFO, "namesForDetail: %lu length -limitTo: %lu -prependMaybe: %d -onlySignificant: %d -supportsInfoLookup: %d", buf, 0x28u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", &stru_1E4762D08))
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v18, OS_LOG_TYPE_DEFAULT, "Suggestions namesForDetail either queried before first unlock or with an empty parameter", buf, 2u);
    }

    if (v16)
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, MEMORY[0x1E0C9AA60], 0);
    goto LABEL_25;
  }
  if (!v10 && !v9)
  {
    LODWORD(v19) = +[SGDaemonConnection usingSyncXPC](SGDaemonConnection, "usingSyncXPC");
    -[SGSuggestionsService cacheSnapshotFuture](self, "cacheSnapshotFuture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v19)
    {
LABEL_24:
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_487;
      v40[3] = &unk_1E4760DB8;
      v46 = (char)v19;
      v41 = v15;
      v47 = v11;
      v42 = self;
      v43 = v20;
      v44 = v16;
      v45 = a4;
      v48 = v10;
      v49 = 0;
      v32 = v20;
      objc_msgSend(v32, "wait:", v40);

      goto LABEL_25;
    }
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A2267000, v21, OS_LOG_TYPE_DEBUG, "namesForDetail: (sync) will synchronously wait for cache snapshot future with timeout", buf, 2u);
    }

    -[SGSuggestionsService syncTimeout](self, "syncTimeout");
    objc_msgSend(v20, "waitWithTimeout:", v22 * 0.5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "second");
    v23 = objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    log = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
    v39 = (void *)v23;
    v38 = (char)v19;
    v37 = v20;
    if (v23)
    {
      v25 = log;
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v39;
        v26 = "namesForDetail: (sync) cache snapshot future wait failed with error %@";
        v27 = log;
        v28 = 12;
LABEL_27:
        _os_log_debug_impl(&dword_1A2267000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);
      }
    }
    else
    {
      v25 = log;
      if (v24)
      {
        *(_WORD *)buf = 0;
        v26 = "namesForDetail: (sync) cache snapshot future succeeded";
        v27 = log;
        v28 = 2;
        goto LABEL_27;
      }
    }

    objc_msgSend(v36, "first");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "second");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGFuture createWithImmediateResult:error:](SGFuture, "createWithImmediateResult:error:", v31, v19);
    loga = (os_log_t)objc_claimAutoreleasedReturnValue();

    v20 = loga;
    LOBYTE(v19) = v38;
    goto LABEL_24;
  }
  sgLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A2267000, v29, OS_LOG_TYPE_DEBUG, "namesForDetail: Bypassing cache because significance checking is required", buf, 2u);
  }

  v30 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke;
  v50[3] = &unk_1E4762728;
  v51 = v16;
  objc_msgSend(v30, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:", v15, a4, v11, v10, v9, v50);

LABEL_25:
}

- (id)cacheSnapshotFuture
{
  void *v3;
  SGSuggestionsService *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke;
  v6[3] = &unk_1E4760C68;
  v6[4] = self;
  +[SGFuture futureForObject:withKey:onCreate:](SGFuture, "futureForObject:withKey:onCreate:", self, a2, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  objc_storeStrong((id *)&v4->_snapshotFuture, v3);
  objc_sync_exit(v4);

  return v3;
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, _QWORD *);
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  if (objc_msgSend(*(id *)(a1 + 32), "containsString:", CFSTR("@")))
  {
    v2 = *(id *)(a1 + 40);
    SGNormalizeEmailAddress(*(void **)(a1 + 32));
  }
  else
  {
    v2 = *(id *)(a1 + 48);
    SGNormalizePhoneNumber(*(void **)(a1 + 32));
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_5;
  v9[3] = &unk_1E4760D68;
  v10 = v2;
  v11 = v3;
  v14 = *(_BYTE *)(a1 + 88);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 80);
  v6 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v8 = v2;
  v6(v5, v4, v9);

}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_3(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (*(_BYTE *)(a1 + 32))
    dispatch_sync(queue, block);
  else
    dispatch_async(queue, block);
}

- (id)_daemonConnection
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A8583A40](self, a2);
  v4 = -[SGFuture wait](self->_daemonConnectionFuture, "wait");
  -[SGFuture result](self->_daemonConnectionFuture, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v5;
}

void __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke_2;
    block[3] = &unk_1E47628A8;
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v14 = v11;
    v16 = v12;
    v15 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

void __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke_2(_QWORD *a1)
{
  void *v2;
  SGDaemonConnection *v3;
  id v4;

  +[SGDSuggestManagerInterface xpcInterfaceForProtocol:](SGDSuggestManagerInterface, "xpcInterfaceForProtocol:", a1[4]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = -[SGDaemonConnection initWithMachServiceName:xpcInterface:]([SGDaemonConnection alloc], "initWithMachServiceName:xpcInterface:", a1[5], v4);
  objc_msgSend(v2, "succeed:", v3);

}

+ (id)serviceForContacts
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.contacts"), &unk_1EE669E98);
}

- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  SGSuggestionsService *v11;
  uint64_t v12;
  SGFuture *daemonConnectionFuture;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v22;
  void *v23;
  int v24;
  objc_super v25;
  uint8_t buf[4];
  _DWORD v27[7];

  v5 = a5;
  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SGSuggestionsService;
  v11 = -[SGSuggestionsService init](&v25, sel_init);
  if (v11)
  {
    +[SGSuggestionsService _daemonConnectionFutureForMachServiceName:protocol:useCache:](SGSuggestionsService, "_daemonConnectionFutureForMachServiceName:protocol:useCache:", v9, v10, v5);
    v12 = objc_claimAutoreleasedReturnValue();
    daemonConnectionFuture = v11->_daemonConnectionFuture;
    v11->_daemonConnectionFuture = (SGFuture *)v12;

    objc_storeStrong((id *)&v11->_machServiceName, a3);
    v11->_syncTimeout = 100.0;
    pthread_mutex_init(&v11->_syncTimeoutLock, 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.suggestd.suggestionmanager")))
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v27 = v15;
      v17 = "Process using old entitlement (%@)";
    }
    else
    {
      objc_msgSend(&unk_1E4781690, "objectForKeyedSubscript:", v9);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        if (!v15 || +[SGSuggestionsService hasEntitlement:](SGSuggestionsService, "hasEntitlement:", v18))
          goto LABEL_11;
        sgLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          v22 = -[SGSuggestionsService _daemonConnection](v11, "_daemonConnection");
          objc_msgSend(v22, "xpcConnection");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "processIdentifier");
          *(_DWORD *)buf = 67109378;
          v27[0] = v24;
          LOWORD(v27[1]) = 2112;
          *(_QWORD *)((char *)&v27[1] + 2) = v19;
          _os_log_fault_impl(&dword_1A2267000, v20, OS_LOG_TYPE_FAULT, "Rejecting connection missing Suggestions entitlement; pid: %d, entitlementKey: %@",
            buf,
            0x12u);

        }
        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
        {
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
LABEL_18:
        abort();
      }
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
LABEL_13:

        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          goto LABEL_14;
        goto LABEL_18;
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v27 = v9;
      v17 = "Mach service %@ attempting to establish XPC connection with unknown entitlement";
    }
    _os_log_fault_impl(&dword_1A2267000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    goto LABEL_13;
  }
LABEL_15:

  return v11;
}

+ (BOOL)hasEntitlement:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL8 v9;
  int v10;
  __SecTask *v11;
  __SecTask *v12;
  CFTypeRef v13;
  CFTypeID v14;
  NSObject *v15;
  CFErrorRef v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  CFErrorRef v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (hasEntitlement__onceToken == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_31:
    LOBYTE(v9) = 0;
LABEL_32:
    v8 = v9;
    goto LABEL_33;
  }
  dispatch_once(&hasEntitlement__onceToken, &__block_literal_global_373);
  if (!v4)
    goto LABEL_31;
LABEL_3:
  v5 = (id)hasEntitlement__cache;
  objc_sync_enter(v5);
  objc_msgSend((id)hasEntitlement__cache, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLValue");
LABEL_5:
    LOBYTE(v9) = 0;
    v10 = 1;
    goto LABEL_28;
  }
  v11 = SecTaskCreateFromSelf(0);
  v12 = v11;
  if (!v11)
  {
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v15, OS_LOG_TYPE_INFO, "SecTaskCreateFromSelf returned NULL", buf, 2u);
    }

    v8 = 0;
    goto LABEL_5;
  }
  error = 0;
  v13 = SecTaskCopyValueForEntitlement(v11, v4, &error);
  CFRelease(v12);
  if (v13)
  {
    v14 = CFGetTypeID(v13);
    v9 = v14 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v13) != 0;
    CFRelease(v13);
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("NO");
      if (v9)
        v20 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = (CFErrorRef)v20;
      _os_log_impl(&dword_1A2267000, v19, OS_LOG_TYPE_INFO, "Found \"%@\" entitlement, value: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)hasEntitlement__cache, "setObject:forKeyedSubscript:", v21, v4);

    v10 = 0;
  }
  else
  {
    v16 = error;
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v4;
        v26 = 2112;
        v27 = error;
        _os_log_error_impl(&dword_1A2267000, v18, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_debug_impl(&dword_1A2267000, v18, OS_LOG_TYPE_DEBUG, "Couldn't find the \"%@\" entitlement", buf, 0xCu);
    }

    if (error)
      CFRelease(error);
    LOBYTE(v9) = 0;
    v10 = 1;
  }
  v8 = 0;
LABEL_28:

  objc_sync_exit(v5);
  if (!v10)
    goto LABEL_32;
LABEL_33:

  return v8;
}

+ (id)_daemonConnectionFutureForMachServiceName:(id)a3 protocol:(id)a4 useCache:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2051;
  v24 = __Block_byref_object_dispose__2052;
  v25 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__SGSuggestionsService__daemonConnectionFutureForMachServiceName_protocol_useCache___block_invoke;
  v16[3] = &unk_1E47608D8;
  v19 = &v20;
  v9 = v7;
  v17 = v9;
  v10 = v8;
  v18 = v10;
  v11 = MEMORY[0x1A8583BFC](v16);
  v12 = (void *)v11;
  if (v5)
  {
    +[SGSuggestionsService daemonConnections](SGSuggestionsService, "daemonConnections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "runWithLockAcquired:", v12);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (id)daemonConnections
{
  if (daemonConnections__pasOnceToken10 != -1)
    dispatch_once(&daemonConnections__pasOnceToken10, &__block_literal_global_315);
  return (id)daemonConnections__pasExprOnceResult;
}

- (SGSuggestionsService)initWithMachServiceName:(id)a3 protocol:(id)a4
{
  return -[SGSuggestionsService initWithMachServiceName:protocol:useCache:](self, "initWithMachServiceName:protocol:useCache:", a3, a4, 1);
}

- (id)_remoteSuggestionManager
{
  void *v3;
  SGDSuggestManagerAllProtocol *managerForTesting;
  SGRemoteObjectProxy *v5;
  void *v6;
  NSObject *v7;
  SGRemoteObjectProxy *v8;
  id v9;
  uint8_t v11[16];

  v3 = (void *)MEMORY[0x1A8583A40](self, a2);
  managerForTesting = self->_managerForTesting;
  if (managerForTesting)
  {
    v5 = managerForTesting;
  }
  else
  {
    +[SGSuggestionsService inProcessSuggestManager](SGSuggestionsService, "inProcessSuggestManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v11 = 0;
        _os_log_debug_impl(&dword_1A2267000, v7, OS_LOG_TYPE_DEBUG, "_remoteSuggestionManager using in-process suggest manager", v11, 2u);
      }

      v5 = -[SGRemoteObjectProxy initWithInProcessSuggestManager:]([SGRemoteObjectProxy alloc], "initWithInProcessSuggestManager:", v6);
    }
    else
    {
      v8 = [SGRemoteObjectProxy alloc];
      v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
      v5 = -[SGRemoteObjectProxy initWithConnection:queuesRequestsIfBusy:](v8, "initWithConnection:queuesRequestsIfBusy:", v9, self->_queuesRequestsIfBusy);

    }
  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

+ (id)inProcessSuggestManager
{
  id v2;

  pthread_mutex_lock(&_inProcessSuggestManagerLock);
  v2 = (id)_inProcessSuggestManager;
  pthread_mutex_unlock(&_inProcessSuggestManagerLock);
  return v2;
}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 withCompletion:(id)a6
{
  -[SGSuggestionsService namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:](self, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", a3, a4, a5, !a5, a6);
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)syncTimeout
{
  _opaque_pthread_mutex_t *p_syncTimeoutLock;
  double syncTimeout;

  p_syncTimeoutLock = &self->_syncTimeoutLock;
  pthread_mutex_lock(&self->_syncTimeoutLock);
  syncTimeout = self->_syncTimeout;
  pthread_mutex_unlock(p_syncTimeoutLock);
  return syncTimeout;
}

void __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "contactMatchesWithContactIdentifier:limitTo:withCompletion:", v5, v6, v8);

}

- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 713, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifier"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E4762728;
    v16 = v10;
    objc_msgSend(v13, "contactMatchesWithContactIdentifier:limitTo:withCompletion:", v9, a4, v15);

  }
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v9 = *(_QWORD *)&a8;
  v10 = a7;
  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1A2267000, v21, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v20)
      (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v23 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __137__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion___block_invoke;
    v24[3] = &unk_1E4762728;
    v25 = v20;
    objc_msgSend(v23, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:withCompletion:", v16, v17, v18, v19, v10, v9, v24);

  }
}

void __41__SGSuggestionsService_daemonConnections__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)daemonConnections__pasExprOnceResult;
  daemonConnections__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

- (id)registerContactsChangeObserver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SGNotificationListener *v7;
  SGNotificationListener *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  SGSuggestionsService *v14;
  id v15;

  v4 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__SGSuggestionsService_registerContactsChangeObserver___block_invoke;
  v13 = &unk_1E4760AB0;
  v14 = self;
  v15 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A8583BFC](&v10);
  v7 = [SGNotificationListener alloc];
  v8 = -[SGNotificationListener initWithNotification:callback:](v7, "initWithNotification:callback:", CFSTR("com.apple.suggestions.contactsDidChange"), v6, v10, v11, v12, v13, v14);

  return v8;
}

void __137__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __83__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

uint64_t __74__SGSuggestionsService_contactMatchesWithContactIdentifier_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setQueuesRequestsIfBusy:(BOOL)a3
{
  self->_queuesRequestsIfBusy = a3;
}

- (void)setSyncTimeout:(double)a3
{
  _opaque_pthread_mutex_t *p_syncTimeoutLock;

  p_syncTimeoutLock = &self->_syncTimeoutLock;
  pthread_mutex_lock(&self->_syncTimeoutLock);
  self->_syncTimeout = a3;
  pthread_mutex_unlock(p_syncTimeoutLock);
}

void __39__SGSuggestionsService_hasEntitlement___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(&unk_1E47816B8, "count"));
  v1 = (void *)hasEntitlement__cache;
  hasEntitlement__cache = v0;

}

+ (id)serviceForURLs
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.urls"), &unk_1EE66A020);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_2()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A8583A40]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("namesForUnknownDetail-lookup", v1);
  v3 = (void *)_entitlements_block_invoke__pasExprOnceResult_491;
  _entitlements_block_invoke__pasExprOnceResult_491 = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A2267000, v4, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: will request new snapshot from suggestd", buf, 2u);
  }

  objc_msgSend(v3, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_475;
  v7[3] = &unk_1E47607F8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

- (void)setManagerForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_managerForTesting, a3);
}

- (BOOL)isEnabledWithError:(id *)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[5];

  v4 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SGSuggestionsService_isEnabledWithError___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = self;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v4, "waitUntilReturn:withTimeout:error:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)queuesRequestsIfBusy
{
  return self->_queuesRequestsIfBusy;
}

- (BOOL)prepareForRealtimeExtraction:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)prepareForRealtimeExtractionWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SGSuggestionsService_prepareForRealtimeExtractionWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "prepareForRealtimeExtraction:", v7);

}

- (BOOL)resetConfirmationAndRejectionHistory:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)resetConfirmationAndRejectionHistoryWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__SGSuggestionsService_resetConfirmationAndRejectionHistoryWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resetConfirmationAndRejectionHistory:", v7);

}

- (BOOL)rebuildNamesForDetailCache:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)rebuildNamesForDetailCacheWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SGSuggestionsService_rebuildNamesForDetailCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "rebuildNamesForDetailCache:", v7);

}

- (BOOL)clearCachesFully:(BOOL)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  LOBYTE(v12) = a3;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __47__SGSuggestionsService_clearCachesFully_error___block_invoke, &unk_1E4760998, self, v12);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SGSuggestionsService_clearCachesFully_withCompletion___block_invoke;
  v9[3] = &unk_1E4760970;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "clearCachesFully:withCompletion:", v4, v9);

}

- (id)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = v10;
  v19 = v11;
  v20 = a5;
  v13 = v11;
  v14 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v17, 3221225472, __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke, &unk_1E47609E8, self);
  objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 664, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rfc822Data"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 665, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceId"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v14 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke;
  v20[3] = &unk_1E4760A10;
  v20[4] = self;
  v21 = v11;
  v23 = v13;
  v24 = a5;
  v22 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v14, "clearCachesFully:withCompletion:", 1, v20);

}

- (id)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = v10;
  v19 = v11;
  v20 = a5;
  v13 = v11;
  v14 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v17, 3221225472, __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke, &unk_1E47609E8, self);
  objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 680, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headers"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v14 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke;
  v20[3] = &unk_1E4760A10;
  v20[4] = self;
  v21 = v11;
  v23 = v13;
  v24 = a5;
  v22 = v12;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v14, "clearCachesFully:withCompletion:", 1, v20);

}

- (id)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 694, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke;
  v14[3] = &unk_1E4762728;
  v15 = v10;
  v12 = v10;
  objc_msgSend(v11, "dissectAttachmentsFromSearchableItem:options:withCompletion:", v9, a4, v14);

}

- (id)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__SGSuggestionsService_contactMatchesWithContact_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E4762728;
    v16 = v10;
    objc_msgSend(v13, "contactMatchesWithContact:limitTo:withCompletion:", v9, a4, v15);

  }
}

- (id)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifiers"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E4762728;
    v16 = v10;
    objc_msgSend(v13, "contactMatchesWithContactIdentifiers:limitTo:withCompletion:", v9, a4, v15);

  }
}

- (id)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)suggestContactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 733, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E4762728;
    v16 = v10;
    objc_msgSend(v13, "contactMatchesWithFullTextSearch:limitTo:withCompletion:", v9, a4, v15);

  }
}

- (id)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)suggestContactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 743, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_withCompletion___block_invoke;
    v15[3] = &unk_1E4762728;
    v16 = v10;
    objc_msgSend(v13, "contactMatchesWithMessagingPrefix:limitTo:withCompletion:", v9, a4, v15);

  }
}

- (id)allContactsLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)allContactsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SGSuggestionsService_allContactsLimitedTo_withCompletion___block_invoke;
    v11[3] = &unk_1E4762728;
    v12 = v7;
    objc_msgSend(v10, "allContactsWithSnippets:limitTo:withCompletion:", 1, a3, v11);

  }
}

- (id)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  _QWORD v12[6];
  BOOL v13;

  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke;
  v12[3] = &unk_1E4760A88;
  v13 = a3;
  v12[4] = self;
  v12[5] = a4;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v6 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__SGSuggestionsService_allContactsWithSnippets_limitTo_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v9;
    objc_msgSend(v12, "allContactsWithSnippets:limitTo:withCompletion:", v6, a4, v13);

  }
}

- (void)_clearHarvestStoreCache
{
  SGSuggestionsService *v2;
  SGFuture *snapshotFuture;
  SGFuture *v4;
  SGSuggestionsService *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  snapshotFuture = obj->_snapshotFuture;
  if (snapshotFuture)
  {
    -[SGFuture disassociateFromParentObject](snapshotFuture, "disassociateFromParentObject");
    v4 = obj->_snapshotFuture;
    obj->_snapshotFuture = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (BOOL)deregisterContactsChangeObserverWithToken:(id)a3
{
  return objc_msgSend(a3, "unsubscribe");
}

- (id)registerEventsChangeObserver:(id)a3
{
  id v3;
  SGNotificationListener *v4;

  v3 = a3;
  v4 = -[SGNotificationListener initWithNotification:callback:]([SGNotificationListener alloc], "initWithNotification:callback:", CFSTR("com.apple.suggestions.eventsDidChange"), v3);

  return v4;
}

- (BOOL)deregisterEventsChangeObserverWithToken:(id)a3
{
  return objc_msgSend(a3, "unsubscribe");
}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 810, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__SGSuggestionsService_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke;
  v15[3] = &unk_1E4762728;
  v16 = v11;
  v13 = v11;
  objc_msgSend(v12, "waitForEventWithIdentifier:toAppearInEventStoreWithLastModificationDate:completion:", v9, v10, v15);

}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = v11;
  v9 = v7;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 820, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    v8 = 0;
  }
  -[SGSuggestionsService waitForEventWithIdentifier:toAppearInEventStoreWithLastModificationDate:completion:](self, "waitForEventWithIdentifier:toAppearInEventStoreWithLastModificationDate:completion:", v8, 0, v9);

}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;

  v12 = a3;
  v13 = a4;
  v14 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke;
  v19[3] = &unk_1E4760AD8;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v22 = a5;
  v23 = a6;
  v15 = v13;
  v16 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v14, "waitUntilReturn:withTimeout:error:", v19, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v8 = *(_QWORD *)&a6;
  v25 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 827, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));

LABEL_3:
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_1A2267000, v16, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v15)
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v18 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_withCompletion___block_invoke;
    v21[3] = &unk_1E4762728;
    v22 = v15;
    objc_msgSend(v18, "eventsStartingAt:endingAt:limitTo:options:withCompletion:", v13, v14, a5, v8, v21);

  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  unsigned int v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v23 = MEMORY[0x1E0C809B0];
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v27 = a6;
  v28 = a7;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v23, 3221225472, __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke, &unk_1E4760B00, self);
  objc_msgSend(v17, "waitUntilReturn:withTimeout:error:", &v23, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v9 = *(_QWORD *)&a7;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 838, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));

    if (v17)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));

  if (!v16)
    goto LABEL_12;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 839, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

LABEL_4:
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_1A2267000, v19, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v18)
      (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v21 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_withCompletion___block_invoke;
    v25[3] = &unk_1E4762728;
    v26 = v18;
    objc_msgSend(v21, "eventsStartingAt:endingAt:prefix:limitTo:options:withCompletion:", v15, v16, v17, a6, v9, v25);

  }
}

- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 error:(id *)a5
{
  id v9;
  void *v10;
  _QWORD v12[6];
  unsigned int v13;

  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke;
  v12[3] = &unk_1E4760B28;
  v12[4] = self;
  v12[5] = a3;
  v13 = a4;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5
{
  uint64_t v5;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v5 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__SGSuggestionsService_suggestEventsInFutureLimitTo_options_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v9;
    objc_msgSend(v12, "eventsInFutureLimitTo:options:withCompletion:", a3, v5, v13);

  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = v10;
  v19 = v11;
  v20 = a5;
  v13 = v11;
  v14 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v17, 3221225472, __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke, &unk_1E47609E8, self);
  objc_msgSend(v12, "waitUntilReturn:withTimeout:error:", &v17, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 858, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 859, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));

LABEL_3:
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_1A2267000, v14, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v13)
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v16 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_withCompletion___block_invoke;
    v19[3] = &unk_1E4762728;
    v20 = v13;
    objc_msgSend(v16, "eventsStartingAt:endingAt:limitTo:options:withCompletion:", v11, v12, a5, 0, v19);

  }
}

- (id)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke;
  v21[3] = &unk_1E4760B50;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)suggestEventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));

    if (v15)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));

  if (!v14)
    goto LABEL_12;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 871, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

LABEL_4:
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1A2267000, v17, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v16)
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v19 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __87__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_withCompletion___block_invoke;
    v23[3] = &unk_1E4762728;
    v24 = v16;
    objc_msgSend(v19, "eventsStartingAt:endingAt:prefix:limitTo:options:withCompletion:", v13, v14, v15, a6, 0, v23);

  }
}

- (id)suggestEventsInFutureLimitTo:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)suggestEventsInFutureLimitTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SGSuggestionsService_suggestEventsInFutureLimitTo_withCompletion___block_invoke;
    v11[3] = &unk_1E4762728;
    v12 = v7;
    objc_msgSend(v10, "eventsInFutureLimitTo:options:withCompletion:", a3, 0, v11);

  }
}

- (id)allEventsLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__SGSuggestionsService_allEventsLimitedTo_withCompletion___block_invoke;
    v11[3] = &unk_1E4762728;
    v12 = v7;
    objc_msgSend(v10, "allEventsLimitedTo:withCompletion:", a3, v11);

  }
}

- (BOOL)confirmReminderByRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmReminderByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 898, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SGSuggestionsService_confirmReminderByRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "confirmReminderByRecordId:completion:", v7, v12);

}

- (BOOL)confirmRealtimeReminder:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmRealtimeReminder:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 906, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reminder"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SGSuggestionsService_confirmRealtimeReminder_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "confirmRealtimeReminder:completion:", v7, v12);

}

- (BOOL)rejectReminderByRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectReminderByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 914, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SGSuggestionsService_rejectReminderByRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "rejectReminderByRecordId:completion:", v7, v12);

}

- (BOOL)rejectRealtimeReminder:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectRealtimeReminder:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 922, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reminder"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_rejectRealtimeReminder_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "rejectRealtimeReminder:completion:", v7, v12);

}

- (BOOL)reminderAlarmTriggeredForRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)reminderAlarmTriggeredForRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 930, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__SGSuggestionsService_reminderAlarmTriggeredForRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "reminderAlarmTriggeredForRecordId:completion:", v7, v12);

}

- (id)allRemindersLimitedTo:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    sgRemindersLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEFAULT, "SuggestionsService getting all reminders", buf, 2u);
    }

    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SGSuggestionsService_allRemindersLimitedTo_withCompletion___block_invoke;
    v12[3] = &unk_1E4762728;
    v13 = v7;
    objc_msgSend(v11, "allRemindersLimitedTo:withCompletion:", a3, v12);

  }
}

- (id)reminderTitleForContent:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  sgRemindersLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsService detecting reminder for content", buf, 2u);
  }

  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SGSuggestionsService_reminderTitleForContent_withCompletion___block_invoke;
  v11[3] = &unk_1E4762728;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "reminderTitleForContent:withCompletion:", v7, v11);

}

- (BOOL)logUserCreatedReminderTitle:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  sgRemindersLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsService logging user created reminder title", buf, 2u);
  }

  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SGSuggestionsService_logUserCreatedReminderTitle_withCompletion___block_invoke;
  v11[3] = &unk_1E4760970;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "logUserCreatedReminderTitle:withCompletion:", v7, v11);

}

- (id)allDeliveriesWithLimit:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsService getting all Deliveries", buf, 2u);
    }

    v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__SGSuggestionsService_allDeliveriesWithLimit_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v7;
    objc_msgSend(v12, "allDeliveriesWithLimit:withCompletion:", a3, v13);

  }
}

- (id)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke;
  v21[3] = &unk_1E4760B50;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("htmlContent"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceId"));

      if (a6)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 983, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rfc822Headers"));

  if (!v15)
    goto LABEL_15;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 985, CFSTR("Passing 0 for options would return nothing"));

LABEL_5:
  if ((unint64_t)objc_msgSend(v13, "length") <= 0xC8000)
  {
    v19 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __90__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke;
    v24[3] = &unk_1E4762728;
    v25 = v16;
    objc_msgSend(v19, "suggestionsFromEmailContent:headers:source:options:withCompletion:", v13, v14, v15, a6, v24);

    v18 = v25;
    goto LABEL_11;
  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v27 = objc_msgSend(v13, "length");
    v28 = 2048;
    v29 = 819200;
    _os_log_impl(&dword_1A2267000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 8, &unk_1E4781708);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v18);
LABEL_11:

  }
}

- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1007, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1008, CFSTR("Passing 0 for options would return nothing"));

LABEL_3:
  objc_msgSend(v9, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBundleID:", v13);

  }
  objc_msgSend(v9, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "HTMLContentDataNoCopy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16 <= 0xC8000)
  {
    v19 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__SGSuggestionsService_suggestionsFromSearchableItem_options_withCompletion___block_invoke;
    v22[3] = &unk_1E4762728;
    v23 = v10;
    objc_msgSend(v19, "suggestionsFromSearchableItem:options:withCompletion:", v9, a4, v22);

    v18 = v23;
    goto LABEL_11;
  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v25 = v16;
    v26 = 2048;
    v27 = 819200;
    _os_log_impl(&dword_1A2267000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 8, &unk_1E4781730);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);
LABEL_11:

  }
}

- (id)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  v10 = a3;
  v11 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v15 = MEMORY[0x1E0C809B0];
  v16 = v10;
  v17 = a4;
  v18 = a5;
  v12 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v15, 3221225472, __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke, &unk_1E4760BC8, self);
  objc_msgSend(v11, "waitUntilReturn:withTimeout:error:", &v15, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (v11)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1033, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1034, CFSTR("Passing 0 for options would return nothing"));

LABEL_3:
  objc_msgSend(v11, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBundleID:", v15);

  }
  objc_msgSend(v11, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "HTMLContentDataNoCopy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18 <= 0xC8000)
  {
    v21 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __92__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_withCompletion___block_invoke;
    v24[3] = &unk_1E4762728;
    v25 = v12;
    objc_msgSend(v21, "suggestionsFromSearchableItem:options:processingType:withCompletion:", v11, a4, a5, v24);

    v20 = v25;
    goto LABEL_11;
  }
  sgLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v27 = v18;
    v28 = 2048;
    v29 = 819200;
    _os_log_impl(&dword_1A2267000, v19, OS_LOG_TYPE_DEFAULT, "Rejecting email with HTML length %lu (max: %lu)", buf, 0x16u);
  }

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 8, &unk_1E4781758);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v20);
LABEL_11:

  }
}

- (id)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1061, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1062, CFSTR("Passing 0 for options would return nothing"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_withCompletion___block_invoke;
  v15[3] = &unk_1E4762728;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "harvestedSuggestionsFromSearchableItem:options:withCompletion:", v9, a4, v15);

}

- (id)contactMatchesByPhoneNumber:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1072, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumber"));

  }
  -[SGSuggestionsService contactMatchesByPhoneNumber:error:](self, "contactMatchesByPhoneNumber:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactMatchesByPhoneNumber:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1078, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumber"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SGSuggestionsService_contactMatchesByPhoneNumber_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "contactMatchesByPhoneNumber:withCompletion:", v7, v13);

  }
}

- (id)contactMatchesByEmailAddress:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1088, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  -[SGSuggestionsService contactMatchesByEmailAddress:error:](self, "contactMatchesByEmailAddress:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactMatchesByEmailAddress:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1094, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__SGSuggestionsService_contactMatchesByEmailAddress_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "contactMatchesByEmailAddress:withCompletion:", v7, v13);

  }
}

- (id)contactMatchesBySocialProfile:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("socialProfile"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__SGSuggestionsService_contactMatchesBySocialProfile_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "contactMatchesBySocialProfile:withCompletion:", v7, v13);

  }
}

- (id)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E4760BF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)contactMatchesBySocialProfile:(id)a3 bundleIdentifier:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  SGSocialProfile *v14;
  void *v15;
  void *v16;
  SGSocialProfile *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_1A2267000, v12, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v14 = [SGSocialProfile alloc];
    +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGRecordId recordIdWithNumericValue:](SGRecordId, "recordIdWithNumericValue:", -1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SGSocialProfile initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:label:extractionInfo:recordId:](v14, "initWithUsername:userIdentifier:bundleIdentifier:displayName:service:teamIdentifier:label:extractionInfo:recordId:", 0, v9, v10, 0, 0, 0, 0, v15, v16);

    v18 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_withCompletion___block_invoke;
    v21[3] = &unk_1E4762728;
    v22 = v11;
    objc_msgSend(v18, "contactMatchesBySocialProfile:withCompletion:", v17, v21);

  }
}

- (id)birthdayExtractionsForInterval:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interval"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__SGSuggestionsService_birthdayExtractionsForInterval_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "birthdayExtractionsForInterval:withCompletion:", v7, v13);

  }
}

- (id)celebrationExtractionsForInterval:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interval"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__SGSuggestionsService_celebrationExtractionsForInterval_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "celebrationExtractionsForInterval:withCompletion:", v7, v13);

  }
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  unint64_t v17;
  BOOL v18;

  v10 = a3;
  v11 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v15 = MEMORY[0x1E0C809B0];
  v16 = v10;
  v17 = a4;
  v18 = a5;
  v12 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v15, 3221225472, __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke, &unk_1E4760C90, self);
  objc_msgSend(v11, "waitUntilReturn:withTimeout:error:", &v15, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;

  v12 = a3;
  v13 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v17 = MEMORY[0x1E0C809B0];
  v18 = v12;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v14 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v17, 3221225472, __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke, &unk_1E4760CB8, self);
  objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v17, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  id v20;
  unint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  v14 = a3;
  v15 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v19 = MEMORY[0x1E0C809B0];
  v20 = v14;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v16 = v14;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v19, 3221225472, __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke, &unk_1E4760CE0, self);
  objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", &v19, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)interactionStoreLookupForDetail:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detail"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else if (objc_msgSend(v7, "isEqualToString:", &stru_1E4762D08))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "Suggestions interactionStoreLookupForDetail with an empty parameter", buf, 2u);
    }

    if (v8)
      (*((void (**)(id, const __CFString *, _QWORD))v8 + 2))(v8, &stru_1E4762D08, 0);
  }
  else
  {
    v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__SGSuggestionsService_interactionStoreLookupForDetail_withCompletion___block_invoke;
    v14[3] = &unk_1E4762728;
    v15 = v8;
    objc_msgSend(v12, "interactionStoreLookupForDetail:withCompletion:", v7, v14);

  }
}

- (id)contactFromRecordID:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  -[SGSuggestionsService contactFromRecordID:error:](self, "contactFromRecordID:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactFromRecordID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __50__SGSuggestionsService_contactFromRecordID_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)contactFromRecordID:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SGSuggestionsService_contactFromRecordID_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "contactFromRecordId:withCompletion:", v7, v13);

  }
}

- (id)cnContactMatchesForRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SGSuggestionsService_cnContactMatchesForRecordId_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "cnContactMatchesForRecordId:withCompletion:", v7, v13);

  }
}

- (id)cnContactMatchesForRecordIds:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordIds"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__SGSuggestionsService_cnContactMatchesForRecordIds_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "cnContactMatchesForRecordIds:withCompletion:", v7, v13);

  }
}

- (id)emailAddressIsSignificant:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      v8[2](v8, &unk_1E4781358, 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__SGSuggestionsService_emailAddressIsSignificant_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "emailAddressIsSignificant:withCompletion:", v7, v13);

  }
}

- (id)eventFromRecordID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __48__SGSuggestionsService_eventFromRecordID_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)eventFromRecordID:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__SGSuggestionsService_eventFromRecordID_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "eventFromRecordId:withCompletion:", v7, v13);

  }
}

- (id)eventFromUniqueId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)eventFromUniqueId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__SGSuggestionsService_eventFromUniqueId_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "eventFromUniqueId:completion:", v7, v13);

  }
}

- (id)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v19 = MEMORY[0x1E0C809B0];
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v19, 3221225472, __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke, &unk_1E4760E80, self);
  objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v19, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_1A2267000, v15, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v14)
      (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }
  else
  {
    v17 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __110__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_withCompletion___block_invoke;
    v19[3] = &unk_1E4762728;
    v20 = v14;
    objc_msgSend(v17, "launchInfoForSuggestedEventWithUniqueIdentifier:sourceURL:clientLocale:ignoreUserActivitySupport:ignoreMailCheck:completion:", v11, v12, v13, 0, 0, v19);

  }
}

- (BOOL)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchInfo"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "launchAppForSuggestedEventUsingLaunchInfo:completion:", v7, v12);

}

- (id)originFromRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __49__SGSuggestionsService_originFromRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)originFromRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v8)
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SGSuggestionsService_originFromRecordId_withCompletion___block_invoke;
    v13[3] = &unk_1E4762728;
    v14 = v8;
    objc_msgSend(v11, "originFromRecordId:completion:", v7, v13);

  }
}

- (BOOL)confirmEvent:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __43__SGSuggestionsService_confirmEvent_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmEvent:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-confirmEvent", buf, 2u);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__SGSuggestionsService_confirmEvent_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "confirmEvent:completion:", v7, v13);

}

- (BOOL)rejectEvent:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __42__SGSuggestionsService_rejectEvent_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectEvent:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-rejectEvent", buf, 2u);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SGSuggestionsService_rejectEvent_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "rejectEvent:completion:", v7, v13);

}

- (int)_confirmRejectUI
{
  void *v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CoreSuggestions.suggest_tool")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 4;
  }
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_1A2267000, v5, OS_LOG_TYPE_INFO, "SGSuggestionsServiceContactsConfirmRejectProtocol-_confirmRejectUI setting ui to %td", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)confirmContact:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __45__SGSuggestionsService_confirmContact_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmContact:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContact", buf, 2u);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SGSuggestionsService_confirmContact_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "confirmContact:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)confirmRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __44__SGSuggestionsService_confirmRecord_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmRecord:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmRecord %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__SGSuggestionsService_confirmRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "confirmRecord:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)confirmContactDetailRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmContactDetailRecord:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContactDetailRecord", buf, 2u);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__SGSuggestionsService_confirmContactDetailRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "confirmContactDetailRecord:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke;
  v13[3] = &unk_1E4760ED0;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)confirmContactDetailRecord:(id)a3 confirmationUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v6;
    _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-confirmContactDetailRecord: %td", buf, 0xCu);
  }

  if ((_DWORD)v6 == 1)
    v6 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_withCompletion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v12, "confirmContactDetailRecord:confirmRejectUI:completion:", v9, v6, v15);

}

- (BOOL)confirmEventByRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)confirmEventByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-confirmEventByRecordId: %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_confirmEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "confirmEventByRecordId:completion:", v7, v13);

}

- (BOOL)rejectEventByRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectEventByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-rejectEventByRecordId: %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_rejectEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "rejectEventByRecordId:completion:", v7, v13);

}

- (BOOL)deleteEventByRecordId:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)deleteEventByRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceEventsConfirmRejectProtocol-deleteEventByRecordId: %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_deleteEventByRecordId_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "deleteEventByRecordId:completion:", v7, v13);

}

- (BOOL)rejectContact:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E4760ED0;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)rejectContact:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v6;
    _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContact: %td", buf, 0xCu);
  }

  if ((_DWORD)v6 == 1)
    v6 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__SGSuggestionsService_rejectContact_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v12, "rejectContact:confirmRejectUI:completion:", v9, v6, v15);

}

- (BOOL)rejectContact:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __44__SGSuggestionsService_rejectContact_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectContact:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContact", buf, 2u);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__SGSuggestionsService_rejectContact_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "rejectContact:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)rejectRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __43__SGSuggestionsService_rejectRecord_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectRecord:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1610, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectRecord %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__SGSuggestionsService_rejectRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "rejectRecord:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)rejectRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E4760ED0;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)rejectRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1621, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2048;
    v20 = v6;
    _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectRecord: %@ %td", buf, 0x16u);
  }

  if ((_DWORD)v6 == 1)
    v6 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__SGSuggestionsService_rejectRecord_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v12, "rejectRecord:confirmRejectUI:completion:", v9, v6, v15);

}

- (BOOL)rejectContactDetailRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)rejectContactDetailRecord:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContactDetailRecord %@", buf, 0xCu);
  }

  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SGSuggestionsService_rejectContactDetailRecord_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v10, "rejectContactDetailRecord:confirmRejectUI:completion:", v7, v11, v14);

}

- (BOOL)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke;
  v13[3] = &unk_1E4760ED0;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)rejectContactDetailRecord:(id)a3 rejectionUI:(int)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1645, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2048;
    v20 = v6;
    _os_log_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestionsServiceContactsConfirmRejectProtocol-rejectContactDetailRecord: %@ %td", buf, 0x16u);
  }

  if ((_DWORD)v6 == 1)
    v6 = -[SGSuggestionsService _confirmRejectUI](self, "_confirmRejectUI");
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_withCompletion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v12, "rejectContactDetailRecord:confirmRejectUI:completion:", v9, v6, v15);

}

- (id)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v25 = MEMORY[0x1E0C809B0];
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v30 = a6;
  v29 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v25, 3221225472, __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke, &unk_1E4760EF8, self);
  objc_msgSend(v18, "waitUntilReturn:withTimeout:error:", &v25, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1663, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAddresses"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1665, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAddress"));

      if (v18)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1666, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bounds"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1664, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ccAddresses"));

  if (!v17)
    goto LABEL_8;
LABEL_4:
  if (!v18)
    goto LABEL_9;
LABEL_5:
  v20 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __116__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke;
  v26[3] = &unk_1E4762728;
  v27 = v19;
  v21 = v19;
  objc_msgSend(v20, "predictedToEmailAddressesWithToAddresses:ccAddresses:fromAddress:date:bounds:completion:", v15, v16, v17, v18, v26, a6);

}

- (id)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v25 = MEMORY[0x1E0C809B0];
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v30 = a6;
  v29 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v25, 3221225472, __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke, &unk_1E4760EF8, self);
  objc_msgSend(v18, "waitUntilReturn:withTimeout:error:", &v25, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1684, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAddresses"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1686, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromAddress"));

      if (v18)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1687, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bounds"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ccAddresses"));

  if (!v17)
    goto LABEL_8;
LABEL_4:
  if (!v18)
    goto LABEL_9;
LABEL_5:
  v20 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __116__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke;
  v26[3] = &unk_1E4762728;
  v27 = v19;
  v21 = v19;
  objc_msgSend(v20, "predictedCCEmailAddressesWithToAddresses:ccAddresses:fromAddress:date:bounds:completion:", v15, v16, v17, v18, v26, a6);

}

- (BOOL)addSearchableItems:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __49__SGSuggestionsService_addSearchableItems_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)addSearchableItems:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_1A2267000, v7, OS_LOG_TYPE_FAULT, "Unexpected call to obsolete addSearchableItems method.", v8, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    abort();
  if (v6)
    v6[2](v6, 0);

}

- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__SGSuggestionsService_addSearchableItemMetadata_htmlData_completion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "addSearchableItemMetadata:htmlData:completion:", v10, v9, v13);

}

- (BOOL)addInteractions:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke;
  v15[3] = &unk_1E4760BF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v13, "BOOLValue");

  return (char)self;
}

- (void)addInteractions:(id)a3 bundleId:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactions"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1724, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__SGSuggestionsService_addInteractions_bundleId_withCompletion___block_invoke;
  v16[3] = &unk_1E4760970;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "addInteractions:bundleId:completion:", v9, v10, v16);

}

- (BOOL)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke;
  v23[3] = &unk_1E4760F20;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v16, "waitUntilReturn:withTimeout:error:", v23, a7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v21, "BOOLValue");

  return (char)self;
}

- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v18 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __105__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_withCompletion___block_invoke;
  v21[3] = &unk_1E4760970;
  v22 = v17;
  v19 = v17;
  objc_msgSend(v18, "spotlightReimportFromIdentifier:forPersonHandle:startDate:endDate:completion:", v13, v14, v15, v16, v21);

}

- (id)messagesToRefreshWithError:(id *)a3
{
  id v5;
  void *v6;
  _QWORD v8[5];

  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = self;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)messagesToRefreshWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_messagesToRefreshWithCompletion___block_invoke;
  v7[3] = &unk_1E4762728;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "messagesToRefreshWithCompletion:", v7);

}

- (BOOL)reportMessagesFound:(id)a3 lost:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke;
  v15[3] = &unk_1E4760BF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v10, "waitUntilReturn:withTimeout:error:", v15, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v13, "BOOLValue");

  return (char)self;
}

- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SGSuggestionsService_reportMessagesFound_lost_withCompletion___block_invoke;
  v13[3] = &unk_1E4760970;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "reportMessagesFound:lost:withCompletion:", v10, v9, v13);

}

- (BOOL)updateMessages:(id)a3 state:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SGSuggestionsService_updateMessages_state_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)updateMessages:(id)a3 state:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1760, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messages"));

  }
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SGSuggestionsService_updateMessages_state_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v10;
  v12 = v10;
  objc_msgSend(v11, "updateMessages:state:completion:", v9, a4, v14);

}

- (id)fullDownloadRequestBatch:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke, &unk_1E4760A60, self, a3);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SGSuggestionsService_fullDownloadRequestBatch_withCompletion___block_invoke;
  v9[3] = &unk_1E4762728;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "fullDownloadRequestBatch:withCompletion:", a3, v9);

}

- (BOOL)resolveFullDownloadRequests:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "BOOLValue");

  return (char)self;
}

- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1778, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requests"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__SGSuggestionsService_resolveFullDownloadRequests_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "resolveFullDownloadRequests:withCompletion:", v7, v12);

}

- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1791, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payload"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SGSuggestionsService_planReceivedFromServerWithPayload_completion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "planReceivedFromServerWithPayload:completion:", v7, v12);

}

- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipe"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attachments"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__SGSuggestionsService_evaluateRecipe_attachments_completion___block_invoke;
  v16[3] = &unk_1E4762728;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "evaluateRecipe:attachments:completion:", v9, v10, v16);

}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1813, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifiers"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__SGSuggestionsService_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E4760970;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "purgeSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v9, v10, v16);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1822, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1823, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifiers"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E4760970;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v9, v10, v16);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1836, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainIdentifiers"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E4760970;
  v17 = v11;
  v13 = v11;
  objc_msgSend(v12, "deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:completion:", v9, v10, v16);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "deleteSpotlightReferencesWithBundleIdentifier:completion:", v7, v12);

}

- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1856, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SGSuggestionsService_deleteInteractionsWithBundleId_completion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "deleteInteractionsWithBundleId:completion:", v7, v12);

}

- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__SGSuggestionsService_deleteInteractionsWithBundleId_identifiers_completion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v11;
  v13 = v11;
  objc_msgSend(v12, "deleteInteractionsWithBundleId:identifiers:completion:", v9, v10, v15);

}

- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1879, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v12 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__SGSuggestionsService_deleteInteractionsWithBundleId_groupIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E4760970;
  v16 = v11;
  v13 = v11;
  objc_msgSend(v12, "deleteInteractionsWithBundleId:groupIdentifiers:completion:", v9, v10, v15);

}

- (void)keysForSchemas:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1892, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schemas"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__SGSuggestionsService_keysForSchemas_completion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "schemaOrgToEvents:completion:", v7, v12);

}

- (void)eventsForSchemas:(id)a3 usingStore:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schemas"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

LABEL_3:
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    v22 = objc_msgSend(v9, "count");
    v23 = 2117;
    v24 = v9;
    _os_log_impl(&dword_1A2267000, v12, OS_LOG_TYPE_DEFAULT, "eventsForSchemas count=%tu %{sensitive}@", buf, 0x16u);
  }

  v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke;
  v18[3] = &unk_1E4760FB0;
  v19 = v10;
  v20 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v13, "schemaOrgToEvents:completion:", v9, v18);

}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 withCompletion:(id)a5
{
  -[SGSuggestionsService isEventCandidateForURL:andTitle:containsSchemaOrg:withCompletion:](self, "isEventCandidateForURL:andTitle:containsSchemaOrg:withCompletion:", a3, a4, 0, a5);
}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SGSuggestionsService_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke;
  v15[3] = &unk_1E4762728;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "isEventCandidateForURL:andTitle:containsSchemaOrg:withCompletion:", v12, v11, v6, v15);

}

- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11 && v12)
  {
    v14 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__SGSuggestionsService_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke;
    v18[3] = &unk_1E4762728;
    v19 = v13;
    objc_msgSend(v14, "suggestionsFromURL:title:HTMLPayload:withCompletion:", v10, v11, v12, v18);

    v15 = v19;
LABEL_9:

    goto LABEL_10;
  }
  sgLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_1A2267000, v16, OS_LOG_TYPE_ERROR, "suggestionsFromURL called with nil arguments", v17, 2u);
  }

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v15);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1971, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HTMLPayload"));

      if (v16)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1972, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extractionDate"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 1970, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  if (!v15)
    goto LABEL_8;
LABEL_4:
  if (!v16)
    goto LABEL_9;
LABEL_5:
  v18 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__SGSuggestionsService_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke;
  v24[3] = &unk_1E4762728;
  v25 = v17;
  v19 = v17;
  objc_msgSend(v18, "realtimeSuggestionsFromURL:title:HTMLPayload:extractionDate:withCompletion:", v13, v14, v15, v16, v24);

}

- (BOOL)removeAllStoredPseudoContacts:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SGSuggestionsService_removeAllStoredPseudoContactsWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeAllStoredPseudoContactsWithCompletion:", v7);

}

- (BOOL)sendRTCLogs:(id *)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  id *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__SGSuggestionsService_sendRTCLogs___block_invoke;
  v14[3] = &unk_1E4760FD8;
  v16 = &v18;
  v17 = a3;
  v7 = v5;
  v15 = v7;
  v8 = (void *)MEMORY[0x1A8583BFC](v14);
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __36__SGSuggestionsService_sendRTCLogs___block_invoke_2;
  v12[3] = &unk_1E4762728;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "sendRTCLogsWithCompletion:", v12);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v9) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v9;
}

- (void)deleteCloudKitZoneWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SGSuggestionsService_deleteCloudKitZoneWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "deleteCloudKitZoneWithCompletion:", v7);

}

- (id)powerState
{
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2051;
  v15 = __Block_byref_object_dispose__2052;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__SGSuggestionsService_powerState__block_invoke;
  v8[3] = &unk_1E4761000;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "powerStateWithCompletion:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)namesForDetailCaches
{
  dispatch_semaphore_t v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2051;
  v15 = __Block_byref_object_dispose__2052;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SGSuggestionsService_namesForDetailCaches__block_invoke;
  v8[3] = &unk_1E4761028;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "namesForDetailCacheSnapshotsWithCompletion:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v13, "logMetricAutocompleteResult:recordId:contactIdentifier:bundleId:", v8, v12, v11, v10);

}

- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v13, "logMetricContactSearchResult:recordId:contactIdentifier:bundleId:", v8, v12, v11, v10);

}

- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v11, "logMetricAutocompleteUserSelectedRecordId:contactIdentifier:bundleId:", v10, v9, v8);

}

- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v11, "logMetricContactSearchResultSelected:contactIdentifier:bundleId:", v10, v9, v8);

}

- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v11, "logMetricSuggestedContactDetailUsed:contactIdentifier:bundleId:", v10, v9, v8);

}

- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v11, "logMetricSuggestedContactDetailShown:contactIdentifier:bundleId:", v10, v9, v8);

}

- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v11, "logMetricContactCreated:contactIdentifier:bundleId:", v10, v9, v8);

}

- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v5, "logMetricSearchResultsIncludedPureSuggestionWithBundleId:", v4);

}

- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2097, CFSTR("uniqueKey can't be nil"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v9, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v11, v6, v5);

}

- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    objc_msgSend(v9, "logEventInteractionForEventWithExternalIdentifier:interface:actionType:", v8, v6, v5);

  }
  else
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEFAULT, "Called logEventInteractionForEventWithExternalIdentifier with nil externalIdentifier. Rejecting.", v11, 2u);
    }

  }
}

- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v9, "logSuggestionInteractionForRecordId:interface:actionType:", v11, v6, v5);

}

- (void)keepDirty:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  objc_msgSend(v4, "keepDirty:", v3);

}

- (BOOL)daemonExit:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SGSuggestionsService_daemonExit___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)daemonExitWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_daemonExitWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "daemonExitWithCompletion:", v7);

}

- (BOOL)sleep:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__SGSuggestionsService_sleep___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)sleepWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_sleepWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "sleepWithCompletion:", v7);

}

- (BOOL)ping:(id *)a3
{
  SGSuggestionsService *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = self;
  v5 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__SGSuggestionsService_ping___block_invoke;
  v8[3] = &unk_1E4760920;
  v8[4] = v4;
  -[SGSuggestionsService syncTimeout](v4, "syncTimeout");
  objc_msgSend(v5, "waitUntilReturn:withTimeout:error:", v8, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  return (char)v4;
}

- (void)pingWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_pingWithCompletion___block_invoke;
  v7[3] = &unk_1E4760970;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "pingWithCompletion:", v7);

}

- (id)ipsosMessagesFromSearchableItems:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SGSuggestionsService_ipsosMessagesFromSearchableItems_withCompletion___block_invoke;
  v10[3] = &unk_1E4762728;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "ipsosMessagesFromSearchableItems:withCompletion:", v7, v10);

}

- (id)titleSuggestionForMessage:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SGSuggestionsService_titleSuggestionForMessage_withCompletion___block_invoke;
  v10[3] = &unk_1E4762728;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "titleSuggestionForMessage:withCompletion:", v7, v10);

}

- (id)saliencyFromRFC822Data:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rfc822Data"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SGSuggestionsService_saliencyFromRFC822Data_withCompletion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "saliencyFromRFC822Data:withCompletion:", v7, v12);

}

- (id)saliencyFromEmailHeaders:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v8 = v6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v11, 3221225472, __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke, &unk_1E4760B78, self);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v11, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headers"));

  }
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SGSuggestionsService_saliencyFromEmailHeaders_withCompletion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "saliencyFromEmailHeaders:withCompletion:", v7, v12);

}

- (id)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = a3;
  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_topSalienciesForMailboxId_limit_withCompletion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "topSalienciesForMailboxId:limit:withCompletion:", v9, a4, v12);

}

- (id)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  BOOL v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v23 = MEMORY[0x1E0C809B0];
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v28 = a6;
  v27 = a7;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v23, 3221225472, __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke, &unk_1E4761078, self);
  objc_msgSend(v17, "waitUntilReturn:withTimeout:error:", &v23, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a6;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __130__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion___block_invoke;
  v20[3] = &unk_1E4762728;
  v21 = v14;
  v19 = v14;
  objc_msgSend(v18, "sortedSaliencyResultsRestrictedToMailboxTypes:mailboxIds:receivedOnOrAfter:ascending:limit:withCompletion:", v17, v16, v15, v9, a7, v20);

}

- (BOOL)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v14 = v8;
  v15 = a3;
  v13[4] = self;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values"));

  }
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_withCompletion___block_invoke;
  v14[3] = &unk_1E4760970;
  v15 = v10;
  v12 = v10;
  objc_msgSend(v11, "preventUnsubscriptionOpportunitiesSuggestionsForField:toValues:withCompletion:", a3, v9, v14);

}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v13;
  void *v14;
  _QWORD v16[9];

  v13 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke;
  v16[3] = &unk_1E47610A0;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  *(double *)&v16[7] = a5;
  v16[8] = a6;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", v16, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a7;
  v13 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion___block_invoke;
  v15[3] = &unk_1E4762728;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "sortedUnsubscriptionOpportunitiesForField:minCount:minScore:limit:withCompletion:", a3, a4, a6, v15, a5);

}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  _QWORD v12[7];

  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke;
  v12[3] = &unk_1E47610C8;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion___block_invoke;
  v11[3] = &unk_1E4762728;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "sortedUnsubscriptionOpportunitiesForField:limit:withCompletion:", a3, a4, v11);

}

- (id)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v35 = a3;
  v34 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke;
  v40[3] = &unk_1E47610F0;
  v40[4] = self;
  v41 = v35;
  v42 = v34;
  v43 = v17;
  v44 = v18;
  v45 = v19;
  v46 = v20;
  v47 = v21;
  v48 = v22;
  v49 = v23;
  v38 = v23;
  v37 = v22;
  v36 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v34;
  v30 = v35;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  v31 = v24;
  objc_msgSend(v24, "waitUntilReturn:withTimeout:error:", v40, a12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v18 = a12;
  v30 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __187__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion___block_invoke;
  v31[3] = &unk_1E4762728;
  v32 = v18;
  v29 = v18;
  objc_msgSend(v27, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:withCompletion:", v26, v25, v24, v23, v22, v21, v20, v19, v30, v31);

}

- (id)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v19 = MEMORY[0x1E0C809B0];
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v19, 3221225472, __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke, &unk_1E4760E80, self);
  objc_msgSend(v13, "waitUntilReturn:withTimeout:error:", &v19, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_withCompletion___block_invoke;
  v16[3] = &unk_1E4762728;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "identifyFollowUpWarningFromSubject:body:date:withCompletion:", v13, v12, v11, v16);

}

- (id)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke;
  v13[3] = &unk_1E4761140;
  v15 = a3;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_reportUserEngagement_forWarning_withCompletion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "reportUserEngagement:forWarning:withCompletion:", v6, v9, v12);

}

- (id)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  _QWORD v12[6];
  BOOL v13;

  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke;
  v12[3] = &unk_1E4760A88;
  v13 = a3;
  v12[4] = self;
  v12[5] = a4;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v8 = a5;
  v9 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__SGSuggestionsService_reportValue_forFeatureSetting_withCompletion___block_invoke;
  v11[3] = &unk_1E4762728;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "reportValue:forFeatureSetting:withCompletion:", v6, a4, v11);

}

- (id)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke;
  v13[3] = &unk_1E4760A38;
  v14 = v8;
  v15 = a3;
  v13[4] = self;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __113__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion___block_invoke;
  v12[3] = &unk_1E4762728;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "reportMailIntelligenceFollowUpUserEngagement:forStringFromFollowUpWarning:withCompletion:", a3, v9, v12);

}

- (id)recentURLsWithLimit:(unsigned int)a3 error:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;

  v7 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  LODWORD(v11) = a3;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", MEMORY[0x1E0C809B0], 3221225472, __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke, &unk_1E4761168, self, v11);
  objc_msgSend(v7, "waitUntilReturn:withTimeout:error:", &v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__SGSuggestionsService_recentURLsWithLimit_withCompletion___block_invoke;
    v11[3] = &unk_1E4762728;
    v12 = v7;
    objc_msgSend(v10, "recentURLsWithLimit:withCompletion:", v4, v11);

  }
}

- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unsigned int v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke;
  v21[3] = &unk_1E4761190;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v15, "waitUntilReturn:withTimeout:error:", v21, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v8 = *(_QWORD *)&a6;
  v24 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1A2267000, v17, OS_LOG_TYPE_DEFAULT, "Cannot query Suggestions (%@) before first unlock.", buf, 0xCu);

    }
    if (v16)
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    v19 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __106__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion___block_invoke;
    v20[3] = &unk_1E4762728;
    v21 = v16;
    objc_msgSend(v19, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:withCompletion:", v13, v14, v15, 0, 0, v8, v20);

  }
}

- (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unsigned int v31;
  unsigned __int8 v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v26 = MEMORY[0x1E0C809B0];
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v32 = a7;
  v31 = a8;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout", v26, 3221225472, __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke, &unk_1E47611B8, self);
  objc_msgSend(v19, "waitUntilReturn:withTimeout:error:", &v26, a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unsigned __int8 v15;

  v8 = a4;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke;
  v13[3] = &unk_1E4761140;
  v15 = a3;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "BOOLValue");

  return (char)self;
}

- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SGSuggestionsService_registerURLFeedback_absoluteURL_withCompletion___block_invoke;
  v12[3] = &unk_1E4760970;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "registerURLFeedback:absoluteURL:withCompletion:", v6, v9, v12);

}

- (id)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  unsigned __int8 v15;

  v8 = a3;
  v9 = -[SGSuggestionsService _daemonConnection](self, "_daemonConnection");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke;
  v13[3] = &unk_1E4761140;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  -[SGSuggestionsService syncTimeout](self, "syncTimeout");
  objc_msgSend(v9, "waitUntilReturn:withTimeout:error:", v13, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSuggestionsService.m"), 2370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  v11 = -[SGSuggestionsService _remoteSuggestionManager](self, "_remoteSuggestionManager");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__SGSuggestionsService_foundInStringForRecordId_style_withCompletion___block_invoke;
  v14[3] = &unk_1E4762728;
  v15 = v10;
  v12 = v10;
  objc_msgSend(v11, "foundInStringForRecordId:style:withCompletion:", v9, v6, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotFuture, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_managerForTesting, 0);
  objc_storeStrong((id *)&self->_daemonConnectionFuture, 0);
}

void __70__SGSuggestionsService_foundInStringForRecordId_style_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke_2;
  v8[3] = &unk_1E4760BA0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "foundInStringForRecordId:style:withCompletion:", v5, v6, v8);

}

uint64_t __61__SGSuggestionsService_foundInStringForRecordId_style_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__SGSuggestionsService_registerURLFeedback_absoluteURL_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "registerURLFeedback:absoluteURL:withCompletion:", v4, v5, v8);

}

uint64_t __62__SGSuggestionsService_registerURLFeedback_absoluteURL_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 76);
  v10 = *(unsigned int *)(a1 + 72);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke_2;
  v12[3] = &unk_1E47609C0;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v4, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:withCompletion:", v5, v6, v7, v8, v9, v10, v12);

}

uint64_t __128__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(unsigned int *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:limit:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __97__SGSuggestionsService_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__SGSuggestionsService_recentURLsWithLimit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "recentURLsWithLimit:withCompletion:", v5, v7);

}

uint64_t __50__SGSuggestionsService_recentURLsWithLimit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = a1 + 40;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v7 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke_2;
  v9[3] = &unk_1E4760E08;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "reportMailIntelligenceFollowUpUserEngagement:forStringFromFollowUpWarning:withCompletion:", v6, v5, v9);

}

uint64_t __104__SGSuggestionsService_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__SGSuggestionsService_reportValue_forFeatureSetting_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke_2;
  v8[3] = &unk_1E4760E08;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "reportValue:forFeatureSetting:withCompletion:", v4, v5, v8);

}

uint64_t __60__SGSuggestionsService_reportValue_forFeatureSetting_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__SGSuggestionsService_reportUserEngagement_forWarning_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke_2;
  v8[3] = &unk_1E4760E08;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "reportUserEngagement:forWarning:withCompletion:", v4, v5, v8);

}

uint64_t __62__SGSuggestionsService_reportUserEngagement_forWarning_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke_2;
  v9[3] = &unk_1E4761118;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "identifyFollowUpWarningFromSubject:body:date:withCompletion:", v5, v7, v6, v9);

}

uint64_t __75__SGSuggestionsService_identifyFollowUpWarningFromSubject_body_date_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __187__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 104);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke_2;
  v14[3] = &unk_1E47609C0;
  v15 = v3;
  v12 = v3;
  objc_msgSend(v4, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:withCompletion:", v5, v6, v7, v8, v9, v10, v13, v11, v14);

}

uint64_t __178__SGSuggestionsService_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "sortedUnsubscriptionOpportunitiesForField:limit:withCompletion:", v5, v6, v8);

}

uint64_t __78__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke(double *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *((_QWORD *)a1 + 6);
  v7 = a1[7];
  v8 = *((_QWORD *)a1 + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "sortedUnsubscriptionOpportunitiesForField:minCount:minScore:limit:withCompletion:", v5, v6, v8, v10, v7);

}

uint64_t __96__SGSuggestionsService_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = a1 + 40;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v7 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke_2;
  v9[3] = &unk_1E47626D8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "preventUnsubscriptionOpportunitiesSuggestionsForField:toValues:withCompletion:", v6, v5, v9);

}

uint64_t __93__SGSuggestionsService_preventUnsubscriptionOpportunitiesSuggestionsForField_toValues_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __130__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke_2;
  v11[3] = &unk_1E47609C0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v4, "sortedSaliencyResultsRestrictedToMailboxTypes:mailboxIds:receivedOnOrAfter:ascending:limit:withCompletion:", v5, v6, v7, v8, v9, v11);

}

uint64_t __121__SGSuggestionsService_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__SGSuggestionsService_topSalienciesForMailboxId_limit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "topSalienciesForMailboxId:limit:withCompletion:", v5, v6, v8);

}

uint64_t __62__SGSuggestionsService_topSalienciesForMailboxId_limit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_saliencyFromEmailHeaders_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke_2;
  v7[3] = &unk_1E4761050;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "saliencyFromEmailHeaders:withCompletion:", v4, v7);

}

uint64_t __55__SGSuggestionsService_saliencyFromEmailHeaders_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SGSuggestionsService_saliencyFromRFC822Data_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke_2;
  v7[3] = &unk_1E4761050;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "saliencyFromRFC822Data:withCompletion:", v4, v7);

}

uint64_t __53__SGSuggestionsService_saliencyFromRFC822Data_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_titleSuggestionForMessage_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke_2;
  v7[3] = &unk_1E4760BA0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "titleSuggestionForMessage:withCompletion:", v4, v7);

}

uint64_t __56__SGSuggestionsService_titleSuggestionForMessage_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__SGSuggestionsService_ipsosMessagesFromSearchableItems_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "ipsosMessagesFromSearchableItems:withCompletion:", v4, v7);

}

uint64_t __63__SGSuggestionsService_ipsosMessagesFromSearchableItems_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__SGSuggestionsService_pingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __29__SGSuggestionsService_ping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SGSuggestionsService_ping___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "pingWithCompletion:", v6);

}

uint64_t __29__SGSuggestionsService_ping___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__SGSuggestionsService_sleepWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __30__SGSuggestionsService_sleep___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SGSuggestionsService_sleep___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sleepWithCompletion:", v6);

}

uint64_t __30__SGSuggestionsService_sleep___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__SGSuggestionsService_daemonExitWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __35__SGSuggestionsService_daemonExit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SGSuggestionsService_daemonExit___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "daemonExitWithCompletion:", v6);

}

uint64_t __35__SGSuggestionsService_daemonExit___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __44__SGSuggestionsService_namesForDetailCaches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(v3, "response2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __34__SGSuggestionsService_powerState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "response1");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SGSuggestionsService_deleteCloudKitZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __36__SGSuggestionsService_sendRTCLogs___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD **)(a1 + 48);
  v7 = v5;
  if (v7)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1A2267000, v8, OS_LOG_TYPE_ERROR, "Error! %@", (uint8_t *)&v9, 0xCu);
    }

  }
  if (v6)
    *v6 = objc_retainAutorelease(v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __36__SGSuggestionsService_sendRTCLogs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
  }
}

void __68__SGSuggestionsService_removeAllStoredPseudoContactsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "removeAllStoredPseudoContactsWithCompletion:", v6);

}

uint64_t __54__SGSuggestionsService_removeAllStoredPseudoContacts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__SGSuggestionsService_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __76__SGSuggestionsService_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __89__SGSuggestionsService_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "response1");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "BOOLValue"));

  }
}

void __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "response1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke_2;
    v8[3] = &unk_1E4760F88;
    v9 = *(id *)(a1 + 32);
    +[SGFn map:f:](SGFn, "map:f:", v4, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);

}

uint64_t __63__SGSuggestionsService_eventsForSchemas_usingStore_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toEKEventWithStore:", *(_QWORD *)(a1 + 32));
}

void __50__SGSuggestionsService_keysForSchemas_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "response1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SGFn map:f:](SGFn, "map:f:", v3, &__block_literal_global_550);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v6);

}

uint64_t __50__SGSuggestionsService_keysForSchemas_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "opaqueKey");
}

void __83__SGSuggestionsService_deleteInteractionsWithBundleId_groupIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __78__SGSuggestionsService_deleteInteractionsWithBundleId_identifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __66__SGSuggestionsService_deleteInteractionsWithBundleId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __81__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __99__SGSuggestionsService_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __98__SGSuggestionsService_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __62__SGSuggestionsService_evaluateRecipe_attachments_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __69__SGSuggestionsService_planReceivedFromServerWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __67__SGSuggestionsService_resolveFullDownloadRequests_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resolveFullDownloadRequests:withCompletion:", v4, v7);

}

uint64_t __58__SGSuggestionsService_resolveFullDownloadRequests_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_fullDownloadRequestBatch_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fullDownloadRequestBatch:withCompletion:", v4, v7);

}

uint64_t __55__SGSuggestionsService_fullDownloadRequestBatch_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__SGSuggestionsService_updateMessages_state_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __51__SGSuggestionsService_updateMessages_state_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGSuggestionsService_updateMessages_state_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "updateMessages:state:withCompletion:", v5, v6, v8);

}

uint64_t __51__SGSuggestionsService_updateMessages_state_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_reportMessagesFound_lost_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "reportMessagesFound:lost:withCompletion:", v5, v6, v8);

}

uint64_t __55__SGSuggestionsService_reportMessagesFound_lost_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__SGSuggestionsService_messagesToRefreshWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke_2;
  v6[3] = &unk_1E47609C0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "messagesToRefreshWithCompletion:", v6);

}

uint64_t __51__SGSuggestionsService_messagesToRefreshWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke_2;
  v10[3] = &unk_1E47626D8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "spotlightReimportFromIdentifier:forPersonHandle:startDate:endDate:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __96__SGSuggestionsService_spotlightReimportFromIdentifier_forPersonHandle_startDate_endDate_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_addInteractions_bundleId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "addInteractions:bundleId:withCompletion:", v5, v6, v8);

}

uint64_t __55__SGSuggestionsService_addInteractions_bundleId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__SGSuggestionsService_addSearchableItemMetadata_htmlData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __49__SGSuggestionsService_addSearchableItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_addSearchableItems_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "addSearchableItems:withCompletion:", v4, v7);

}

uint64_t __49__SGSuggestionsService_addSearchableItems_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke(double *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *((_QWORD *)a1 + 6);
  v7 = *((_QWORD *)a1 + 7);
  v8 = a1[9];
  v9 = *((_QWORD *)a1 + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2;
  v11[3] = &unk_1E47609C0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v4, "predictedCCEmailAddressesWithToAddresses:ccAddresses:fromAddress:date:bounds:withCompletion:", v5, v6, v7, v9, v11, v8);

}

uint64_t __107__SGSuggestionsService_predictedCCEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke(double *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *((_QWORD *)a1 + 6);
  v7 = *((_QWORD *)a1 + 7);
  v8 = a1[9];
  v9 = *((_QWORD *)a1 + 8);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2;
  v11[3] = &unk_1E47609C0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v4, "predictedToEmailAddressesWithToAddresses:ccAddresses:fromAddress:date:bounds:withCompletion:", v5, v6, v7, v9, v11, v8);

}

uint64_t __107__SGSuggestionsService_predictedToEmailAddressesWithToAddresses_ccAddresses_fromAddress_date_bounds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "rejectContactDetailRecord:rejectionUI:withCompletion:", v5, v6, v8);

}

uint64_t __68__SGSuggestionsService_rejectContactDetailRecord_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_rejectContactDetailRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectContactDetailRecord:withCompletion:", v4, v7);

}

uint64_t __56__SGSuggestionsService_rejectContactDetailRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_rejectRecord_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "rejectRecord:rejectionUI:withCompletion:", v5, v6, v8);

}

uint64_t __55__SGSuggestionsService_rejectRecord_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__SGSuggestionsService_rejectRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __43__SGSuggestionsService_rejectRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_rejectRecord_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectRecord:withCompletion:", v4, v7);

}

uint64_t __43__SGSuggestionsService_rejectRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__SGSuggestionsService_rejectContact_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __44__SGSuggestionsService_rejectContact_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_rejectContact_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectContact:withCompletion:", v4, v7);

}

uint64_t __44__SGSuggestionsService_rejectContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_rejectContact_rejectionUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "rejectContact:rejectionUI:withCompletion:", v5, v6, v8);

}

uint64_t __56__SGSuggestionsService_rejectContact_rejectionUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__SGSuggestionsService_deleteEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "deleteEventByRecordId:withCompletion:", v4, v7);

}

uint64_t __52__SGSuggestionsService_deleteEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__SGSuggestionsService_rejectEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectEventByRecordId:withCompletion:", v4, v7);

}

uint64_t __52__SGSuggestionsService_rejectEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SGSuggestionsService_confirmEventByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmEventByRecordId:withCompletion:", v4, v7);

}

uint64_t __53__SGSuggestionsService_confirmEventByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke_2;
  v8[3] = &unk_1E47626D8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "confirmContactDetailRecord:confirmationUI:withCompletion:", v5, v6, v8);

}

uint64_t __72__SGSuggestionsService_confirmContactDetailRecord_confirmationUI_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__SGSuggestionsService_confirmContactDetailRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmContactDetailRecord:withCompletion:", v4, v7);

}

uint64_t __57__SGSuggestionsService_confirmContactDetailRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__SGSuggestionsService_confirmRecord_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __44__SGSuggestionsService_confirmRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGSuggestionsService_confirmRecord_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmRecord:withCompletion:", v4, v7);

}

uint64_t __44__SGSuggestionsService_confirmRecord_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__SGSuggestionsService_confirmContact_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __45__SGSuggestionsService_confirmContact_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SGSuggestionsService_confirmContact_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmContact:withCompletion:", v4, v7);

}

uint64_t __45__SGSuggestionsService_confirmContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__SGSuggestionsService_rejectEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __42__SGSuggestionsService_rejectEvent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SGSuggestionsService_rejectEvent_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectEvent:withCompletion:", v4, v7);

}

uint64_t __42__SGSuggestionsService_rejectEvent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__SGSuggestionsService_confirmEvent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __43__SGSuggestionsService_confirmEvent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SGSuggestionsService_confirmEvent_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmEvent:withCompletion:", v4, v7);

}

uint64_t __43__SGSuggestionsService_confirmEvent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SGSuggestionsService_originFromRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __49__SGSuggestionsService_originFromRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_originFromRecordId_error___block_invoke_2;
  v7[3] = &unk_1E4760EA8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "originFromRecordId:withCompletion:", v4, v7);

}

uint64_t __49__SGSuggestionsService_originFromRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "launchAppForSuggestedEventUsingLaunchInfo:withCompletion:", v4, v7);

}

uint64_t __72__SGSuggestionsService_launchAppForSuggestedEventUsingLaunchInfo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke_2;
  v9[3] = &unk_1E4760E58;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "launchInfoForSuggestedEventWithUniqueIdentifier:sourceURL:clientLocale:withCompletion:", v5, v7, v6, v9);

}

uint64_t __101__SGSuggestionsService_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__SGSuggestionsService_eventFromUniqueId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke_2;
  v7[3] = &unk_1E4760E30;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "eventFromUniqueId:withCompletion:", v4, v7);

}

uint64_t __48__SGSuggestionsService_eventFromUniqueId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__SGSuggestionsService_eventFromRecordID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __48__SGSuggestionsService_eventFromRecordID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGSuggestionsService_eventFromRecordID_error___block_invoke_2;
  v7[3] = &unk_1E4760E30;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "eventFromRecordID:withCompletion:", v4, v7);

}

uint64_t __48__SGSuggestionsService_eventFromRecordID_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_emailAddressIsSignificant_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke_2;
  v7[3] = &unk_1E4760E08;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "emailAddressIsSignificant:withCompletion:", v4, v7);

}

uint64_t __56__SGSuggestionsService_emailAddressIsSignificant_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SGSuggestionsService_cnContactMatchesForRecordIds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "cnContactMatchesForRecordIds:withCompletion:", v4, v7);

}

uint64_t __59__SGSuggestionsService_cnContactMatchesForRecordIds_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SGSuggestionsService_cnContactMatchesForRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "cnContactMatchesForRecordId:withCompletion:", v4, v7);

}

uint64_t __58__SGSuggestionsService_cnContactMatchesForRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__SGSuggestionsService_contactFromRecordID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __50__SGSuggestionsService_contactFromRecordID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SGSuggestionsService_contactFromRecordID_error___block_invoke_2;
  v7[3] = &unk_1E4760DE0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "contactFromRecordID:withCompletion:", v4, v7);

}

uint64_t __50__SGSuggestionsService_contactFromRecordID_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__SGSuggestionsService_interactionStoreLookupForDetail_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke_2;
  v7[3] = &unk_1E4760BA0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "interactionStoreLookupForDetail:withCompletion:", v4, v7);

}

uint64_t __62__SGSuggestionsService_interactionStoreLookupForDetail_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "response1");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_487(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  id v17;
  id v18;
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  _QWORD v39[4];
  char v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A2267000, v4, OS_LOG_TYPE_DEBUG, "namesForDetail: in [cacheFuture wait:] callback", buf, 2u);
  }

  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A2267000, v5, OS_LOG_TYPE_DEBUG, "namesForDetail: got a snapshot in [cacheFuture wait:] callback", buf, 2u);
    }

    v7 = v3[1];
    v8 = v3[2];
    v9 = v3[3];
    if (_entitlements_block_invoke__pasOnceToken65 != -1)
      dispatch_once(&_entitlements_block_invoke__pasOnceToken65, &__block_literal_global_489);
    v10 = (id)_entitlements_block_invoke__pasExprOnceResult;
    if (_entitlements_block_invoke__pasOnceToken66 != -1)
      dispatch_once(&_entitlements_block_invoke__pasOnceToken66, &__block_literal_global_492);
    v11 = (id)_entitlements_block_invoke__pasExprOnceResult_491;
    v12 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_3;
    v39[3] = &__block_descriptor_33_e46_v24__0__NSObject_OS_dispatch_queue__8___v___16l;
    v40 = *(_BYTE *)(a1 + 72);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8583BFC](v39);
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_4;
    v30[3] = &unk_1E4760D90;
    v31 = *(id *)(a1 + 32);
    v14 = v8;
    v32 = v14;
    v15 = v7;
    v33 = v15;
    v16 = v13;
    v36 = v16;
    v17 = v11;
    v34 = v17;
    v38 = *(_BYTE *)(a1 + 73);
    v18 = v9;
    v35 = v18;
    v37 = *(id *)(a1 + 56);
    ((void (**)(_QWORD, id, _QWORD *))v13)[2](v16, v10, v30);
    do
      v19 = __ldaxr(_entitlements_block_invoke_reportingFlag);
    while (__stlxr(1u, _entitlements_block_invoke_reportingFlag));
    if ((v19 & 1) == 0)
    {
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_6;
      v29[3] = &unk_1E47627A0;
      v29[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", v17, v29, 10.0);
    }

  }
  else
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v26;
      _os_log_debug_impl(&dword_1A2267000, v5, OS_LOG_TYPE_DEBUG, "namesForDetail: falling back to asking for detail individually because we failed to get a snapshot in [cacheFuture wait:] callback (error: %@)", buf, 0xCu);

    }
    v20 = (void *)objc_msgSend(*(id *)(a1 + 40), "_remoteSuggestionManager");
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(unsigned __int8 *)(a1 + 73);
    v23 = *(unsigned __int8 *)(a1 + 74);
    v24 = *(unsigned __int8 *)(a1 + 75);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_502;
    v27[3] = &unk_1E4762728;
    v25 = *(_QWORD *)(a1 + 64);
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v20, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:", v21, v25, v22, v23, v24, v27);

    v15 = v28;
  }

}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_6(uint64_t a1)
{
  void *v1;

  atomic_store(0, _entitlements_block_invoke_reportingFlag);
  if (__PAIR128__(_entitlements_block_invoke_foundCount, _entitlements_block_invoke_notFoundCount) != 0)
  {
    v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "_remoteSuggestionManager");
    objc_msgSend(v1, "logUnknownContactInformationShownCount:notShownCount:bundleId:", _entitlements_block_invoke_foundCount, _entitlements_block_invoke_notFoundCount, 0);

    _entitlements_block_invoke_foundCount = 0;
    _entitlements_block_invoke_notFoundCount = 0;
  }
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_502(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "response1");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __110__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_488()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A8583A40]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("namesForUnknownDetail-norm", v1);
  v3 = (void *)_entitlements_block_invoke__pasExprOnceResult;
  _entitlements_block_invoke__pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 57);
  v9 = *(unsigned __int8 *)(a1 + 58);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke_2;
  v11[3] = &unk_1E47609C0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v4, "namesForDetail:limitTo:prependMaybe:onlySignificant:supportsInfoLookup:withCompletion:", v5, v6, v7, v8, v9, v11);

}

uint64_t __101__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 57);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __82__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_onlySignificant_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke_2;
  v9[3] = &unk_1E47609C0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "namesForDetail:limitTo:prependMaybe:withCompletion:", v5, v6, v7, v9);

}

uint64_t __66__SGSuggestionsService_namesForDetail_limitTo_prependMaybe_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_475(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2051;
  v32 = __Block_byref_object_dispose__2052;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2051;
  v26 = __Block_byref_object_dispose__2052;
  v27 = 0;
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A2267000, v2, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: now on future work queue", buf, 2u);
  }

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_daemonConnection");
  v4 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_476;
  v21[3] = &unk_1E4760C18;
  v21[4] = &v22;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_2;
  v20[3] = &unk_1E4760C40;
  v20[4] = &v28;
  objc_msgSend(v5, "namesForDetailCacheSnapshotsWithCompletion:", v20);

  v6 = v29[5];
  if (v23[5])
  {
    if (v6)
      __assert_rtn("-[SGSuggestionsService cacheSnapshotFuture]_block_invoke_3", "SGSuggestionsService.m", 1170, "error == nil || response == nil");
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v18 = v23[5];
      *(_DWORD *)buf = 138412290;
      v35 = v18;
      _os_log_debug_impl(&dword_1A2267000, v7, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: got xpc response with error %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "disassociateFromParentObject");
    objc_msgSend(*(id *)(a1 + 40), "fail:", v23[5]);
  }
  else if (v6)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A2267000, v8, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: got xpc response with snapshot", buf, 2u);
    }

    v9 = (_QWORD *)objc_opt_new();
    objc_msgSend((id)v29[5], "response1");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v9[2];
    v9[2] = v10;

    objc_msgSend((id)v29[5], "response2");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9[1];
    v9[1] = v12;

    objc_msgSend((id)v29[5], "response3");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v9[3];
    v9[3] = v14;

    objc_msgSend(*(id *)(a1 + 40), "succeed:", v9);
    v16 = (void *)MEMORY[0x1E0D81598];
    dispatch_get_global_queue(17, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_481;
    v19[3] = &unk_1E47627A0;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "runAsyncOnQueue:afterDelaySeconds:block:", v17, v19, 10.0);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_476(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __43__SGSuggestionsService_cacheSnapshotFuture__block_invoke_481(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1A2267000, v2, OS_LOG_TYPE_DEBUG, "namesForDetail: cacheSnapshot: expired the snapshot", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_clearHarvestStoreCache");
}

void __73__SGSuggestionsService_celebrationExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "celebrationExtractionsForInterval:withCompletion:", v4, v7);

}

uint64_t __64__SGSuggestionsService_celebrationExtractionsForInterval_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__SGSuggestionsService_birthdayExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "birthdayExtractionsForInterval:withCompletion:", v4, v7);

}

uint64_t __61__SGSuggestionsService_birthdayExtractionsForInterval_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "contactMatchesBySocialProfile:bundleIdentifier:withCompletion:", v5, v6, v8);

}

uint64_t __77__SGSuggestionsService_contactMatchesBySocialProfile_bundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__SGSuggestionsService_contactMatchesBySocialProfile_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "contactMatchesBySocialProfile:withCompletion:", v4, v7);

}

uint64_t __60__SGSuggestionsService_contactMatchesBySocialProfile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SGSuggestionsService_contactMatchesByEmailAddress_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "contactMatchesByEmailAddress:withCompletion:", v4, v7);

}

uint64_t __59__SGSuggestionsService_contactMatchesByEmailAddress_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SGSuggestionsService_contactMatchesByPhoneNumber_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "contactMatchesByPhoneNumber:withCompletion:", v4, v7);

}

uint64_t __58__SGSuggestionsService_contactMatchesByPhoneNumber_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "harvestedSuggestionsFromSearchableItem:options:withCompletion:", v5, v6, v8);

}

uint64_t __77__SGSuggestionsService_harvestedSuggestionsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke_2;
  v9[3] = &unk_1E47609C0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "suggestionsFromSearchableItem:options:processingType:withCompletion:", v5, v7, v6, v9);

}

uint64_t __83__SGSuggestionsService_suggestionsFromSearchableItem_options_processingType_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__SGSuggestionsService_suggestionsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "suggestionsFromSearchableItem:options:withCompletion:", v5, v6, v8);

}

uint64_t __68__SGSuggestionsService_suggestionsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "suggestionsFromEmailContent:headers:source:options:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __81__SGSuggestionsService_suggestionsFromEmailContent_headers_source_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SGSuggestionsService_allDeliveriesWithLimit_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "allDeliveriesWithLimit:withCompletion:", v4, v7);

}

uint64_t __53__SGSuggestionsService_allDeliveriesWithLimit_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SGSuggestionsService_logUserCreatedReminderTitle_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "logUserCreatedReminderTitle:withCompletion:", v4, v7);

}

uint64_t __58__SGSuggestionsService_logUserCreatedReminderTitle_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__SGSuggestionsService_reminderTitleForContent_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke_2;
  v7[3] = &unk_1E4760BA0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "reminderTitleForContent:withCompletion:", v4, v7);

}

uint64_t __54__SGSuggestionsService_reminderTitleForContent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__SGSuggestionsService_allRemindersLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "allRemindersLimitedTo:withCompletion:", v4, v7);

}

uint64_t __52__SGSuggestionsService_allRemindersLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SGSuggestionsService_reminderAlarmTriggeredForRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "reminderAlarmTriggeredForRecordId:withCompletion:", v4, v7);

}

uint64_t __64__SGSuggestionsService_reminderAlarmTriggeredForRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SGSuggestionsService_rejectRealtimeReminder_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectRealtimeReminder:withCompletion:", v4, v7);

}

uint64_t __53__SGSuggestionsService_rejectRealtimeReminder_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SGSuggestionsService_rejectReminderByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "rejectReminderByRecordId:withCompletion:", v4, v7);

}

uint64_t __55__SGSuggestionsService_rejectReminderByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__SGSuggestionsService_confirmRealtimeReminder_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmRealtimeReminder:withCompletion:", v4, v7);

}

uint64_t __54__SGSuggestionsService_confirmRealtimeReminder_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_confirmReminderByRecordId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "confirmReminderByRecordId:withCompletion:", v4, v7);

}

uint64_t __56__SGSuggestionsService_confirmReminderByRecordId_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SGSuggestionsService_allEventsLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "allEventsLimitedTo:withCompletion:", v4, v7);

}

uint64_t __49__SGSuggestionsService_allEventsLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SGSuggestionsService_suggestEventsInFutureLimitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "suggestEventsInFutureLimitTo:withCompletion:", v4, v7);

}

uint64_t __59__SGSuggestionsService_suggestEventsInFutureLimitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a1[8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "suggestEventsStartingAt:endingAt:prefix:limitTo:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __78__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke_2;
  v9[3] = &unk_1E47609C0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "suggestEventsStartingAt:endingAt:limitTo:withCompletion:", v5, v7, v6, v9);

}

uint64_t __71__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__SGSuggestionsService_suggestEventsInFutureLimitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned int *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "suggestEventsInFutureLimitTo:options:withCompletion:", v5, v6, v8);

}

uint64_t __67__SGSuggestionsService_suggestEventsInFutureLimitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(unsigned int *)(a1 + 72);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke_2;
  v11[3] = &unk_1E47609C0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v4, "suggestEventsStartingAt:endingAt:prefix:limitTo:options:withCompletion:", v5, v6, v7, v8, v9, v11);

}

uint64_t __86__SGSuggestionsService_suggestEventsStartingAt_endingAt_prefix_limitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(unsigned int *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke_2;
  v10[3] = &unk_1E47609C0;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v4, "suggestEventsStartingAt:endingAt:limitTo:options:withCompletion:", v5, v6, v7, v8, v10);

}

uint64_t __79__SGSuggestionsService_suggestEventsStartingAt_endingAt_limitTo_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__SGSuggestionsService_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "response1");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
}

void __55__SGSuggestionsService_registerContactsChangeObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_clearHarvestStoreCache");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__SGSuggestionsService_allContactsWithSnippets_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "allContactsWithSnippets:limitTo:withCompletion:", v4, v5, v8);

}

uint64_t __62__SGSuggestionsService_allContactsWithSnippets_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__SGSuggestionsService_allContactsLimitedTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke_2;
  v7[3] = &unk_1E47609C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "allContactsLimitedTo:withCompletion:", v4, v7);

}

uint64_t __51__SGSuggestionsService_allContactsLimitedTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "suggestContactMatchesWithMessagingPrefix:limitTo:withCompletion:", v5, v6, v8);

}

uint64_t __79__SGSuggestionsService_suggestContactMatchesWithMessagingPrefix_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "suggestContactMatchesWithFullTextSearch:limitTo:withCompletion:", v5, v6, v8);

}

uint64_t __78__SGSuggestionsService_suggestContactMatchesWithFullTextSearch_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "contactMatchesWithContactIdentifiers:limitTo:withCompletion:", v5, v6, v8);

}

uint64_t __75__SGSuggestionsService_contactMatchesWithContactIdentifiers_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SGSuggestionsService_contactMatchesWithContact_limitTo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "contactMatchesWithContact:limitTo:withCompletion:", v5, v6, v8);

}

uint64_t __64__SGSuggestionsService_contactMatchesWithContact_limitTo_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke_2;
  v8[3] = &unk_1E47609C0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "dissectAttachmentsFromSearchableItem:options:withCompletion:", v5, v6, v8);

}

uint64_t __75__SGSuggestionsService_dissectAttachmentsFromSearchableItem_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_remoteSuggestionManager");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2;
  v6[3] = &unk_1E4762728;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "suggestionsFromSimpleMailMessage:headers:options:withCompletion:", v3, v4, v5, v6);

}

void __88__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke_2;
  v9[3] = &unk_1E47609C0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "suggestionsFromSimpleMailMessage:headers:options:withCompletion:", v5, v7, v6, v9);

}

uint64_t __79__SGSuggestionsService_suggestionsFromSimpleMailMessage_headers_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_remoteSuggestionManager");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke_2;
  v6[3] = &unk_1E4762728;
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "suggestionsFromRFC822Data:source:options:withCompletion:", v3, v4, v5, v6);

}

void __80__SGSuggestionsService_suggestionsFromRFC822Data_source_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke_2;
  v9[3] = &unk_1E47609C0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "suggestionsFromRFC822Data:source:options:withCompletion:", v5, v7, v6, v9);

}

uint64_t __71__SGSuggestionsService_suggestionsFromRFC822Data_source_options_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__SGSuggestionsService_clearCachesFully_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __47__SGSuggestionsService_clearCachesFully_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SGSuggestionsService_clearCachesFully_error___block_invoke_2;
  v7[3] = &unk_1E47626D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "clearCachesFully:withCompletion:", v5, v7);

}

uint64_t __47__SGSuggestionsService_clearCachesFully_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SGSuggestionsService_rebuildNamesForDetailCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "rebuildNamesForDetailCacheWithCompletion:", v6);

}

uint64_t __51__SGSuggestionsService_rebuildNamesForDetailCache___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__SGSuggestionsService_resetConfirmationAndRejectionHistoryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "resetConfirmationAndRejectionHistoryWithCompletion:", v6);

}

uint64_t __61__SGSuggestionsService_resetConfirmationAndRejectionHistory___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SGSuggestionsService_prepareForRealtimeExtractionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke_2;
  v6[3] = &unk_1E47626D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "prepareForRealtimeExtractionWithCompletion:", v6);

}

uint64_t __53__SGSuggestionsService_prepareForRealtimeExtraction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__SGSuggestionsService_isEnabledWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_remoteSuggestionManager");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SGSuggestionsService_isEnabledWithError___block_invoke_2;
  v6[3] = &unk_1E4762728;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "isEnabledWithCompletion:", v6);

}

void __43__SGSuggestionsService_isEnabledWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1A2267000, v5, OS_LOG_TYPE_ERROR, "Error! %@", (uint8_t *)&v10, 0xCu);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "response1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

}

+ (void)setInProcessSuggestManager:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  pthread_mutex_lock(&_inProcessSuggestManagerLock);
  v4 = (void *)_inProcessSuggestManager;
  _inProcessSuggestManager = (uint64_t)v3;

  pthread_mutex_unlock(&_inProcessSuggestManagerLock);
}

+ (id)serviceForMail
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.mail"), &unk_1EE669A00);
}

+ (id)serviceForEvents
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.events"), &unk_1EE66A250);
}

+ (id)serviceForReminders
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.reminders"), &unk_1EE66A400);
}

+ (id)serviceForDeliveries
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.deliveries"), &unk_1EE66A488);
}

+ (id)serviceForIpsos
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.ipsos"), &unk_1EE66A550);
}

+ (id)serviceForInternal
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.internal"), &unk_1EE66ACC8);
}

+ (id)serviceForFides
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:protocol:", CFSTR("com.apple.suggestd.fides"), &unk_1EE66AF08);
}

+ (id)serviceForMessages
{
  return (id)objc_opt_new();
}

+ (void)prepareForQuery
{
  NSObject *v2;
  uint8_t v3[8];
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  notify_post((const char *)objc_msgSend(CFSTR("com.apple.suggestions.prepareForQuery"), "UTF8String"));
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SGSuggestionsService_prepareForQuery__block_invoke;
  v4[3] = &unk_1E4760948;
  v4[4] = &v5;
  objc_msgSend(&unk_1E47816E0, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (!*((_BYTE *)v6 + 24))
  {
    sgLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1A2267000, v2, OS_LOG_TYPE_ERROR, "Unable to boost for prepareForQuery due to no suitable entitlement being available", v3, 2u);
    }

  }
  _Block_object_dispose(&v5, 8);
}

+ (BOOL)isHarvestingSupported
{
  return 1;
}

void __39__SGSuggestionsService_prepareForQuery__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  SGSuggestionsService *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SGSuggestionsService *v12;
  _QWORD v13[4];
  SGSuggestionsService *v14;
  uint8_t buf[16];

  v7 = a2;
  if (+[SGSuggestionsService hasEntitlement:](SGSuggestionsService, "hasEntitlement:", a3))
  {
    v8 = -[SGSuggestionsService initWithMachServiceName:protocol:useCache:]([SGSuggestionsService alloc], "initWithMachServiceName:protocol:useCache:", v7, &unk_1EE66B368, 0);
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A2267000, v9, OS_LOG_TYPE_DEBUG, "prepareForQuery -- beginning keepDirty", buf, 2u);
    }

    -[SGSuggestionsService keepDirty:](v8, "keepDirty:", 1);
    v10 = (void *)MEMORY[0x1E0D81598];
    dispatch_get_global_queue(-2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__SGSuggestionsService_prepareForQuery__block_invoke_400;
    v13[3] = &unk_1E47627A0;
    v14 = v8;
    v12 = v8;
    objc_msgSend(v10, "runAsyncOnQueue:afterDelaySeconds:block:", v11, v13, 5.0);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;

  }
}

uint64_t __39__SGSuggestionsService_prepareForQuery__block_invoke_400(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1A2267000, v2, OS_LOG_TYPE_DEBUG, "prepareForQuery -- ending keepDirty", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "keepDirty:", 0);
}

@end
