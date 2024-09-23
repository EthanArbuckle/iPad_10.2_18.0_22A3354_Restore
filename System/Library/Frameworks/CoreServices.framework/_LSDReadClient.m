@implementation _LSDReadClient

- (void)getWhetherTypeIdentifier:(id)a3 conformsToTypeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _BOOL8);
  _BOOL8 v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = (void (**)(id, _BOOL8))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getWhetherTypeIdentifier:conformsToTypeIdentifier:completionHandler:]");
  v9 = 0;
  if (v10 && v7)
    v9 = +[UTTypeRecord _typeIdentifier:conformsToTypeIdentifier:](UTTypeRecord, "_typeIdentifier:conformsToTypeIdentifier:", v10, v7);
  v8[2](v8, v9);

}

- (void)getBundleProxyForCurrentProcessWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]");
  v13 = 0u;
  v14 = 0u;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }

  v12[0] = v13;
  v12[1] = v14;
  v11 = 0;
  +[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v12, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v7, "compatibilityObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[_LSDReadClient getBundleProxyForCurrentProcessWithCompletionHandler:]", 510, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v8 = (id)v10;
    }
  }
  else
  {
    v9 = 0;
  }

  v4[2](v4, v9, v8);
}

- (void)getRedactedAppexRecordForSystemAppexWithUUID:(id)a3 node:(id)a4 bundleIdentifier:(id)a5 platform:(unsigned int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, id, id);
  _LSDServiceDomain *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _LSDServiceDomain *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void **v30;
  id v31;
  char v32;
  id v33;

  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, id, id))a7;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v15, 0);

  if (v16)
  {
    v29 = 0;
    LOBYTE(v28) = 0;
    v17 = -[LSApplicationExtensionRecord _initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:]([LSApplicationExtensionRecord alloc], "_initWithUUID:node:bundleIdentifier:platform:context:requireValid:allowRedacted:error:", v11, v12, v13, v8, v16, 1, v28, &v29);
    v18 = v29;
    if (objc_msgSend(v17, "eligibleForRedaction"))
    {
      v19 = v17;
      objc_msgSend(v19, "extensionPointRecord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_resolveAllProperties");

      objc_msgSend(v19, "containingBundleRecord");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_resolveAllProperties");

      objc_msgSend(v19, "containingBundleRecord");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "redact");

      objc_msgSend(v19, "containingBundleRecord");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "detach");

      objc_msgSend(v19, "_resolveAllProperties");
      objc_msgSend(v19, "redact");
      objc_msgSend(v19, "detach");
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[_LSDReadClient getRedactedAppexRecordForSystemAppexWithUUID:node:bundleIdentifier:platform:completionHandler:]", 1006, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v18 = (id)v25;
    }

  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v19 = (id)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v30, v24, 0);

    if (v19)
    {
      v18 = 0;
      v19 = 0;
    }
    else
    {
      v18 = v33;
    }
  }
  v14[2](v14, v19, v18);
  if (v30 && v32)
    _LSContextDestroy(v30);
  v26 = v31;
  v30 = 0;
  v31 = 0;

  v32 = 0;
  v27 = v33;
  v33 = 0;

}

- (void)getBundleRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCurrentProcessWithCompletionHandler:]");
  v21 = 0u;
  v22 = 0u;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }

  v20[0] = v21;
  v20[1] = v22;
  v19 = 0;
  +[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v20, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "applicationExtensionRecords");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "_resolveAllProperties", (_QWORD)v15);
          objc_msgSend(v13, "extensionPointRecord");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_resolveAllProperties");

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v10);
    }

  }
  v4[2](v4, v7, v8);

}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  id v5;
  os_unfair_lock_s *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v7 = v5;
  if (a4)
  {
    objc_msgSend(v5, "invoke", v5);
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50___LSDReadClient_invokeServiceInvocation_isReply___block_invoke;
    v8[3] = &unk_1E103FC48;
    v9 = v7;
    -[LSDBExecutionContext syncRead:](v6, v8);

  }
}

- (void)getSystemContentStoreWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, void *, _QWORD);
  void *v5;
  void *v6;
  int MayMapDatabase;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, _QWORD))a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    v15 = 0;
    v8 = _LSDatabaseCreateSystemContentDatabaseFromPersistentStore(&v15);
    v9 = v15;
    if (v8)
    {
      v10 = v8[1];
      _LSDatabaseGetNode((uint64_t)v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, v11, 0);

    }
    else
    {
      _LSDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "processIdentifier");
        *(_DWORD *)buf = 67109378;
        v19 = v14;
        v20 = 2112;
        v21 = v9;
        _os_log_error_impl(&dword_182882000, v12, OS_LOG_TYPE_ERROR, "could not fetch system content store for %d: %@", buf, 0x12u);

      }
      ((void (**)(id, uint64_t, void *, id))v4)[2](v4, 0, 0, v9);
    }
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2938];
    v17 = CFSTR("process may not map database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getSystemContentStoreWithCompletionHandler:]", 975, v9);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *, _QWORD *))v4)[2](v4, 0, 0, v8);
  }

}

- (void)getServerStoreNonBlockingWithCompletionHandler:(id)a3
{
  id v4;
  unsigned int SessionStatus;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  SessionStatus = _LSDatabaseGetSessionStatus();
  if ((SessionStatus & 0x80) != 0)
  {
    +[LSDatabaseBlockingFetchServer sharedInstance](LSDatabaseBlockingFetchServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (SessionStatus >> 10) & 1;
    objc_msgSend(v7, "setBlockingIsForManualRebuild:", v8);

    +[LSDatabaseBlockingFetchServer sharedInstance](LSDatabaseBlockingFetchServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getEndpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *, uint64_t, _QWORD))v4 + 2))(v4, 0, 0, v10, v8, 0);

  }
  else
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65___LSDReadClient_getServerStoreNonBlockingWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E1042CE0;
    v12 = v4;
    _LSServer_GetServerStoreForConnectionWithCompletionHandler(v6, v11);

  }
}

- (void)getResourceValuesForKeys:(id)a3 mimic:(id)a4 preferredLocalizations:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *, void *, id);
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, void *, id))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]");
  if (!v9)
    goto LABEL_13;
  _LSURLPropertyProviderAllKeys();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isSubsetOfSet:", v13) ^ 1;
  if (!v10)
    LOBYTE(v14) = 1;
  if ((v14 & 1) != 0 || (objc_msgSend(v10, "URL"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_13;
  }
  objc_msgSend(v10, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isFileURL");

  if (!v17)
  {
LABEL_13:
    v37 = *MEMORY[0x1E0CB2938];
    v38[0] = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient getResourceValuesForKeys:mimic:preferredLocalizations:completionHandler:]", 748, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    goto LABEL_14;
  }
  v18 = (void *)objc_opt_class();
  v19 = _LSIsSetWithValuesOfClass(v9, v18);
  v20 = v19 ^ 1;
  if (!v11)
    v20 = 1;
  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = _LSIsArrayWithValuesOfClasses(v11, v21);

    if ((v22 & 1) != 0)
      goto LABEL_17;
    goto LABEL_13;
  }
  if (!v19)
    goto LABEL_13;
LABEL_17:
  v36 = 0;
  _LSResolveRemoteURLPropertiesWithMimic(v10, v11, v9, (uint64_t)&v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v36;
  if (!v27)
  {
    v25 = 0;
    v26 = 0;
    goto LABEL_15;
  }
  v28 = (void *)objc_msgSend(v9, "mutableCopy");
  v29 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v27, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minusSet:", v31);

  v23 = v28;
  if (_LSURLPropertiesNeedReplacement(v27))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v27, "count"));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __90___LSDReadClient_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler___block_invoke;
    v34[3] = &unk_1E1042020;
    v33 = v32;
    v35 = v33;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v34);
    v25 = (void *)objc_msgSend(v33, "copy");

  }
  else
  {
    v25 = v27;
  }
  v26 = v23;
LABEL_14:

LABEL_15:
  v12[2](v12, v25, v26, v24);

}

- (void)resolveQueries:(id)a3 legacySPI:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]");
  v10 = (void *)objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v8, v10))
  {
    v28 = *MEMORY[0x1E0CB2938];
    v29 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]", 471, v11);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _LSIsXPCConnectionPlatformBinary(v13);

    if (v14)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18++), "setLegacy:", 1);
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v16);
      }

      goto LABEL_12;
    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient resolveQueries:legacySPI:completionHandler:]", 447, 0);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = (id)v22;
    v20 = 0;
    goto LABEL_15;
  }
LABEL_12:
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "_resolveQueries:XPCConnection:error:", v8, v19, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;

LABEL_15:
  v9[2](v9, v20, v21);

}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSDReadClient;
  -[_LSDClient willHandleInvocation:isReply:](&v7, sel_willHandleInvocation_isReply_, v6, v4);
  if (!v4
    && (char *)objc_msgSend(v6, "selector") != sel_getServerStatusWithCompletionHandler_
    && (char *)objc_msgSend(v6, "selector") != sel_getServerStoreNonBlockingWithCompletionHandler_)
  {
    __LAUNCH_SERVICES_IS_WAITING_FOR_THE_DATABASE_TO_FINISH_SEEDING__();
  }

}

- (void)getServerStatusWithCompletionHandler:(id)a3
{
  uint64_t SessionStatus;
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getServerStatusWithCompletionHandler:]");
  SessionStatus = _LSDatabaseGetSessionStatus();
  v4[2](v4, SessionStatus);

}

- (void)getKernelPackageExtensionsWithCompletionHandler:(id)a3
{
  const __CFArray *v3;
  const __CFArray *v4;
  void *v5;
  void (**v6)(id, const void *, _QWORD);

  v6 = (void (**)(id, const void *, _QWORD))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]");
  v3 = _LSCopyKernelPackageExtensionsAsLSD();
  v4 = v3;
  if (v3 && CFArrayGetCount(v3) >= 1)
  {
    v6[2](v6, v4, 0);
LABEL_5:
    CFRelease(v4);
    goto LABEL_6;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[_LSDReadClient getKernelPackageExtensionsWithCompletionHandler:]", 373, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, const void *, void *))v6)[2](v6, 0, v5);

  if (v4)
    goto LABEL_5;
LABEL_6:

}

- (void)getDiskUsage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _LSDReadClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getDiskUsage:completionHandler:]");
  MEMORY[0x186DAF208]();
  +[_LSDiskUsage _serverQueue](_LSDiskUsage, "_serverQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___LSDReadClient_getDiskUsage_completionHandler___block_invoke;
  block[3] = &unk_1E10401F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, id);
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int MayMapDatabase;
  uint64_t v11;
  id v12;
  id v13;

  v4 = (void (**)(id, id, id))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getKnowledgeUUIDAndSequenceNumberWithCompletionHandler:]");
  +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  objc_msgSend(v5, "getKnowledgeUUID:andSequenceNumber:", &v13, &v12);
  v6 = v13;
  v7 = v12;

  -[_LSDClient XPCConnection](self, "XPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MayMapDatabase = _LSXPCConnectionMayMapDatabase(v9);

  if (!MayMapDatabase)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_nullUUID");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  v4[2](v4, v6, v7);

}

- (void)getBundleRecordForCoreTypesWithCompletionHandler:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBundleRecordForCoreTypesWithCompletionHandler:]");
  +[LSBundleRecord coreTypesBundleRecord](LSBundleRecord, "coreTypesBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_realRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v4);
}

- (void)getExtensionPointRecordWithIdentifier:(id)a3 platform:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v7;
  void (**v8)(id, LSExtensionPointRecord *, id);
  LSExtensionPointRecord *v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void (**)(id, LSExtensionPointRecord *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordWithIdentifier:platform:completionHandler:]");
  v11 = 0;
  v9 = -[LSExtensionPointRecord initWithIdentifier:platform:error:]([LSExtensionPointRecord alloc], "initWithIdentifier:platform:error:", v7, v6, &v11);
  v10 = v11;
  v8[2](v8, v9, v10);

}

- (void)getExtensionPointRecordForCurrentProcessWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getExtensionPointRecordForCurrentProcessWithCompletionHandler:]");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80___LSDReadClient_getExtensionPointRecordForCurrentProcessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E1043AD8;
  v5 = v4;
  v7 = v5;
  -[_LSDReadClient getBundleRecordForCurrentProcessWithCompletionHandler:](self, "getBundleRecordForCurrentProcessWithCompletionHandler:", v6);

}

- (void)getTypeRecordWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithIdentifier:allowUndeclared:completionHandler:]");
  if (v9)
  {
    if (v6)
      +[UTTypeRecord typeRecordWithPotentiallyUndeclaredIdentifier:](UTTypeRecord, "typeRecordWithPotentiallyUndeclaredIdentifier:");
    else
      +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v7[2](v7, v8);

}

- (void)getTypeRecordsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithIdentifiers:completionHandler:]");
  if (v8 && (v6 = (void *)objc_opt_class(), _LSIsSetWithValuesOfClass(v8, v6)))
  {
    +[UTTypeRecord typeRecordsWithIdentifiers:](UTTypeRecord, "typeRecordsWithIdentifiers:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v5[2](v5, v7);

}

- (void)getTypeRecordWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  v12 = 0;
  if (v13 && v9)
  {
    +[UTTypeRecord typeRecordWithTag:ofClass:conformingToIdentifier:](UTTypeRecord, "typeRecordWithTag:ofClass:conformingToIdentifier:", v13, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v12);

}

- (void)getTypeRecordsWithTag:(id)a3 ofClass:(id)a4 conformingToIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordsWithTag:ofClass:conformingToIdentifier:completionHandler:]");
  v12 = 0;
  if (v13 && v9)
  {
    +[UTTypeRecord typeRecordsWithTag:ofClass:conformingToIdentifier:](UTTypeRecord, "typeRecordsWithTag:ofClass:conformingToIdentifier:", v13, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, v12);

}

- (void)getTypeRecordForImportedTypeWithIdentifier:(id)a3 conformingToIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getTypeRecordForImportedTypeWithIdentifier:conformingToIdentifier:c"
                                    "ompletionHandler:]");
  if (v10)
  {
    +[UTTypeRecord typeRecordForImportedTypeWithIdentifier:conformingToIdentifier:](UTTypeRecord, "typeRecordForImportedTypeWithIdentifier:conformingToIdentifier:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v8[2](v8, v9);

}

- (void)getRelatedTypesOfTypeWithIdentifier:(id)a3 maximumDegreeOfSeparation:(int64_t)a4 completionHandler:(id)a5
{
  void (**v7)(id, id, id);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a3;
  v7 = (void (**)(id, id, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getRelatedTypesOfTypeWithIdentifier:maximumDegreeOfSeparation:completionHandler:]");
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __98___LSDReadClient_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler___block_invoke;
    v14[3] = &unk_1E1043B00;
    v11 = v9;
    v15 = v11;
    v12 = v10;
    v16 = v12;
    objc_msgSend(v8, "_enumerateRelatedTypesWithMaximumDegreeOfSeparation:block:", a4, v14);
    v7[2](v7, v11, v12);

  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)getBoundIconInfoForDocumentProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (IconServicesLibrary(void)::frameworkLibrary
    || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]");
    if (v6)
    {
      objc_msgSend(v6, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_11;
      -[_LSDClient XPCConnection](self, "XPCConnection", 0, 0, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "auditToken");
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
      }

      if (!+[FSNode canReadURL:fromSandboxWithAuditToken:](FSNode, "canReadURL:fromSandboxWithAuditToken:", v8, &v16))
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 671, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v14);
      }
      else
      {
LABEL_11:
        objc_msgSend(v6, "_boundIconInfo", v16, v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
        }
        else
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 667, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v15);

        }
      }

    }
    else
    {
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("documentProxy");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 675, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v12);

    }
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSDReadClient getBoundIconInfoForDocumentProxy:completionHandler:]", 678, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);

  }
}

- (void)getAllUserActivityTypesAndDomainNamesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int MayMapDatabase;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CFTypeRef v12;
  void (*v13)(id, void *, CFTypeRef, _QWORD);
  CFTypeRef cf;
  CFTypeRef v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    cf = 0;
    v15 = 0;
    v8 = _LSCopyClaimedActivityIdentifiersAndDomains(&v15, &cf);
    if (v8)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v8, (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]", 697, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);
    }
    else
    {
      v12 = cf;
      v13 = (void (*)(id, void *, CFTypeRef, _QWORD))*((_QWORD *)v4 + 2);
      v9 = (id)v15;
      v13(v4, v9, v12, 0);
    }

    if (cf)
      CFRelease(cf);
    if (v15)
      CFRelease(v15);
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = CFSTR("process may not map database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getAllUserActivityTypesAndDomainNamesWithCompletionHandler:]", 701, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v11);

  }
}

- (void)mapBundleIdentifiers:(id)a3 orMachOUUIDs:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  _LSDServiceDomain *v15;
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  _LSDServiceDomain *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(id, void *, void *, id);
  id v36;
  id v37;
  id obj;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  void **v51;
  _QWORD v52[4];
  id v53;
  void **v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  void **v59;
  void **v60;
  id v61;
  char v62;
  id v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a4;
  v35 = (void (**)(id, void *, void *, id))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = _LSCheckEntitlementForXPCConnection(v9, CFSTR("com.apple.private.coreservices.canmapbundleidtouuid"));

  if (!(_DWORD)a5)
  {
    v64 = *MEMORY[0x1E0CB2938];
    v65 = CFSTR("Caller is not allowed to map bundleIDs/UUIDs, required entitlement missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]", 849, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    v26 = 0;
    v27 = 0;
    goto LABEL_32;
  }
  if (v37)
  {
    v10 = (void *)objc_opt_class();
    v11 = _LSIsSetWithValuesOfClass(v37, v10);
  }
  else
  {
    v11 = 1;
  }
  if (v36 && v11)
  {
    v14 = (void *)objc_opt_class();
    v11 = _LSIsSetWithValuesOfClass(v36, v14);
  }
  if (!v11)
  {
    v66 = *MEMORY[0x1E0CB2938];
    v67 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient mapBundleIdentifiers:orMachOUUIDs:completionHandler:]", 845, v25);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v63 = 0;
  v61 = 0;
  v60 = 0;
  v62 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v16 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v15, 0);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke;
    v55[3] = &unk_1E1043B28;
    v59 = v16;
    v56 = v36;
    v34 = v17;
    v57 = v34;
    v33 = v18;
    v58 = v33;
    v19 = (void *)MEMORY[0x186DAE9BC](v55);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_2;
    v52[3] = &unk_1E1043B78;
    v54 = v16;
    v20 = v19;
    v53 = v20;
    v39 = (void *)MEMORY[0x186DAE9BC](v52);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_4;
    v49[3] = &unk_1E1043BA0;
    v51 = v16;
    v32 = v20;
    v50 = v32;
    v40 = (void *)MEMORY[0x186DAE9BC](v49);
    if (v37)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v21 = v37;
      obj = v21;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(obj);
            _LSDatabaseGetStringForCFString(*v16, *(const __CFString **)(*((_QWORD *)&v45 + 1) + 8 * i), 0);
            v44 = v40;
            _LSDatabaseEnumeratingBindingMap();
            v43 = v39;
            _LSDatabaseEnumeratingBindingMap();

          }
          v21 = obj;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
        }
        while (v22);
      }
    }
    else
    {
      v42 = v40;
      _CSStoreEnumerateUnits();
      v41 = v39;
      _CSStoreEnumerateUnits();

      v21 = v42;
    }

    v13 = 0;
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v28 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v29 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v60, v28, 0);

    if (v29)
      v13 = 0;
    else
      v13 = v63;
    v33 = 0;
    v34 = 0;
  }
  if (v60 && v62)
    _LSContextDestroy(v60);
  v30 = v61;
  v61 = 0;
  v60 = 0;

  v62 = 0;
  v31 = v63;
  v63 = 0;

  v26 = v33;
  v27 = v34;
LABEL_32:
  v35[2](v35, v27, v26, v13);

}

- (void)mapPlugInBundleIdentifiersToContainingBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _LSDServiceDomain *v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _LSDServiceDomain *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(id, void *, id);
  id obj;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void **v31;
  id v32;
  char v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = (void (**)(id, void *, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = _LSCheckEntitlementForXPCConnection(v7, CFSTR("com.apple.private.coreservices.canmapbundleidtouuid"));

  if (!(_DWORD)self)
  {
    v35 = *MEMORY[0x1E0CB2938];
    v36 = CFSTR("Caller is not allowed to map pluginIDs/bundleIDs, required entitlement missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]", 902, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v17 = 0;
    goto LABEL_22;
  }
  v8 = (void *)objc_opt_class();
  if (!_LSIsSetWithValuesOfClass(v22, v8))
  {
    v37 = *MEMORY[0x1E0CB2938];
    v38 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient mapPlugInBundleIdentifiersToContainingBundleIdentifiers:completionHandler:]", 898, v16);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v34 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v10 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v9, 0);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v22;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          _LSDatabaseGetStringForCFString(*v10, *(const __CFString **)(*((_QWORD *)&v27 + 1) + 8 * i), 0);
          v26 = v25;
          _LSDatabaseEnumeratingBindingMap();

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v11);
    }

    goto LABEL_17;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v31, v18, 0);

  if (v19)
  {
    v25 = 0;
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  v15 = v34;
  v25 = 0;
LABEL_18:
  if (v31 && v33)
    _LSContextDestroy(v31);
  v20 = v32;
  v31 = 0;
  v32 = 0;

  v33 = 0;
  v21 = v34;
  v34 = 0;

  v17 = v25;
LABEL_22:
  v23[2](v23, v17, v15);

}

- (void)getPreferencesWithCompletionHandler:(id)a3
{
  LaunchServices::PrefsStorage *Shared;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  LaunchServices::PrefsStorage *v8;

  v8 = (LaunchServices::PrefsStorage *)a3;
  Shared = (LaunchServices::PrefsStorage *)LaunchServices::PrefsStorage::GetShared(v8);
  LaunchServices::PrefsStorage::getAllPreferences(Shared);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA70];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  (*((void (**)(LaunchServices::PrefsStorage *, id, _QWORD))v8 + 2))(v8, v7, 0);
}

- (void)getSettingsStoreConfigurationWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }

  +[LSSettingsStore sharedInstance](LSSettingsStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(v6, "settingsStoreConfigurationForProcessWithAuditToken:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v3[2](v3, v7, 0);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getSettingsStoreConfigurationWithCompletionHandler:]", 923, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v8);

  }
}

- (void)getSystemModeWithCompletionHandler:(id)a3
{
  os_unfair_lock_s *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  +[LSApplicationRestrictionsManager sharedInstance]();
  v3 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationRestrictionsManager systemMode](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v4, 0);
}

- (void)getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  int MayMapDatabase;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MayMapDatabase = _LSXPCConnectionMayMapDatabase(v6);

  if (MayMapDatabase)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isSystemServer"))
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = 67109120;
        v13[1] = objc_msgSend(v12, "processIdentifier");
        _os_log_error_impl(&dword_182882000, v8, OS_LOG_TYPE_ERROR, "Warning: process %d asking for session langauges from the root lsd. It will only get a backstop result.", (uint8_t *)v13, 8u);

      }
    }
    v9 = 0;
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferredLocalizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = CFSTR("process is not entitled to get language list");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:]", 949, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }
  v4[2](v4, v10, v9);

}

- (void)getApplicationCategoryIdentifiersSetWithCompletionHandler:(id)a3
{
  void *v3;
  void (**v4)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  _LSGetValidApplicationCategoryTypeSet();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3, 0);

}

- (void)getEligibilityAnswerForDomain:(unint64_t)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  LaunchServices::EligibilityCache *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (!_LSServer_AcquiesceToDeputizationForDomain(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't ask to evaluate domain %llu"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDReadClient getEligibilityAnswerForDomain:withCompletionHandler:]", 1020, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _LSXPCConnectionMayMapDatabase(v11) == 0;

  if (v12)
  {
    v21 = *MEMORY[0x1E0CB2938];
    v22 = CFSTR("process may not map database, so it may not get eligibility");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDReadClient getEligibilityAnswerForDomain:withCompletionHandler:]", 1026, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v19);
  }
  else
  {
    v14 = LaunchServices::EligibilityCache::shared(v13);
    v20 = 0;
    v15 = LaunchServices::EligibilityCache::cachedAnswerForDomain(v14, a3, &v20);
    v17 = v16;
    v18 = v20;
    if (!v17)
    {
      v6[2](v6, 0, v18);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, v19, 0);
  }

LABEL_9:
}

@end
