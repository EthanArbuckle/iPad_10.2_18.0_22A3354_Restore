@implementation _LSDOpenClient

- (void)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, uint64_t, id);
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v7 = a5;
  v8 = a4;
  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, uint64_t, id))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient canOpenURL:publicSchemes:privateSchemes:completionHandler:]");
  if (v10 && (objc_msgSend(v10, "scheme"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    +[_LSCanOpenURLManager sharedManager](_LSCanOpenURLManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v15 = objc_msgSend(v13, "canOpenURL:publicSchemes:privateSchemes:XPCConnection:error:", v10, v8, v7, v14, &v17);
    v16 = v17;

    v11[2](v11, v15, v16);
  }
  else
  {
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient canOpenURL:publicSchemes:privateSchemes:completionHandler:]", 349, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v16);
  }

}

- (void)getURLOverrideForURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  _LSURLOverride *v7;
  _LSURLOverride *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient getURLOverrideForURL:completionHandler:]");
  if (v5)
  {
    v7 = -[_LSURLOverride initWithOriginalURL:]([_LSURLOverride alloc], "initWithOriginalURL:", v5);
    v8 = v7;
    if (v7)
    {
      -[_LSURLOverride overrideURL](v7, "overrideURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    v6[2](v6, v9, 0);
  }
  else
  {
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("invalid input URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient getURLOverrideForURL:completionHandler:]", 367, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);

  }
}

- (void)invokeServiceInvocation:(id)a3 isReply:(BOOL)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  os_unfair_lock_s *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = v6;
  v10 = v6;
  if (a4
    || (v8 = -[_LSDOpenClient serviceSelectorRequiresDatabaseContext:](self, "serviceSelectorRequiresDatabaseContext:", objc_msgSend(v6, "selector")), v7 = v10, !v8))
  {
    objc_msgSend(v7, "invoke", v10);
  }
  else
  {
    _LSServer_DatabaseExecutionContext();
    v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50___LSDOpenClient_invokeServiceInvocation_isReply___block_invoke;
    v11[3] = &unk_1E103FC48;
    v12 = v10;
    -[LSDBExecutionContext syncRead:](v9, v11);

  }
}

- (BOOL)serviceSelectorRequiresDatabaseContext:(SEL)a3
{
  return sel_updateRestrictionKnowledgeWithCompletionHandler_ != a3;
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LSDOpenClient;
  -[_LSDClient willHandleInvocation:isReply:](&v8, sel_willHandleInvocation_isReply_, v6, v4);
  if (!v4)
  {
    _LSDatabaseGetSeedingGroup();
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (void)performOpenOperationWithURL:(id)a3 fileHandle:(id)a4 bundleIdentifier:(id)a5 documentIdentifier:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8 userInfo:(id)a9 options:(id)a10 delegate:(id)a11 completionHandler:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  __int128 v25;
  pid_t v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  audit_token_t atoken;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v36 = a4;
  v38 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v37 = a11;
  v21 = a12;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIde"
                                    "ntifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:]");
  _LSOpenLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "processIdentifier");
    if (a8)
    {
      v25 = *(_OWORD *)&a8->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a8->var0;
      *(_OWORD *)&atoken.val[4] = v25;
      v26 = audit_token_to_pid(&atoken);
    }
    else
    {
      v26 = 0;
    }
    *(_DWORD *)buf = 134219010;
    v43 = v24;
    v44 = 2112;
    v45 = v17;
    v46 = 2112;
    v47 = v38;
    v48 = 2112;
    v49 = v18;
    v50 = 2048;
    v51 = v26;
    _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_DEFAULT, "pid %ld issuing open of %@ by %@, doc %@ on behalf of %ld", buf, 0x34u);

  }
  if (!v17)
    goto LABEL_14;
  objc_msgSend(v17, "scheme");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 != 0;

  v29 = v28 ^ 1;
  if (!v19)
    v29 = 1;
  if ((v29 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = _LSIsDictionaryWithKeysAndValuesOfClasses(v19, v30, 0);

  }
  if (!v20 || !v28)
  {
    if (!v28)
      goto LABEL_14;
LABEL_16:
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _LSServer_PerformOpenOperation(v17, v36, v38, a7, (__int128 *)a8, v18, v19, v20, v37, v33, v21);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = _LSIsDictionaryWithKeysAndValuesOfClasses(v20, v31, 0);

  if ((v32 & 1) != 0)
    goto LABEL_16;
LABEL_14:
  v40 = *MEMORY[0x1E0CB2938];
  v41 = CFSTR("invalid input parameters");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient performOpenOperationWithURL:fileHandle:bundleIdentifier:documentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:completionHandler:]", 213, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v34);

LABEL_17:
}

- (void)openApplicationWithIdentifier:(id)a3 options:(id)a4 useClientProcessHandle:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openApplicationWithIdentifier:options:useClientProcessHandle:completionHandler:]");
  _LSOpenLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v23 = (int)objc_msgSend(v14, "processIdentifier");
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "pid %ld requests to open application with identifier %@", buf, 0x16u);

  }
  v15 = _os_feature_enabled_impl();
  v16 = v15 | v7;
  if (v15 && !v7)
  {
    _LSOpenLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_INFO, "using client process handle even though the client asked not to", buf, 2u);
    }

    v16 = 1;
  }
  if (v10)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSServer_OpenApplication(v10, v11, v18, v16, v12);
  }
  else
  {
    v20 = *MEMORY[0x1E0CB2938];
    v21 = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient openApplicationWithIdentifier:options:useClientProcessHandle:completionHandler:]", 237, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v19);

  }
}

- (void)openURL:(id)a3 fileHandle:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]");
  _LSOpenLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "processIdentifier");
    objc_msgSend(v10, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349315;
    v36 = (id)v16;
    v37 = 2113;
    v38 = v17;
    _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "pid %{public}ld requests to open URL with scheme %{private}@", buf, 0x16u);

  }
  if (!v10)
    goto LABEL_8;
  objc_msgSend(v10, "scheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18 == 0;
  if (!v12)
    v19 = 1;
  if (v19)
  {
    if (!v18)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _LSIsDictionaryWithKeysAndValuesOfClasses(v12, v20, 0);

    if ((v21 & 1) == 0)
    {
LABEL_8:
      _LSOpenLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_DEFAULT, "ERROR: paramError, cannot open URL %@", buf, 0xCu);
      }

      v33 = *MEMORY[0x1E0CB2938];
      v34 = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]", 284, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v24);
      goto LABEL_23;
    }
  }
  v25 = objc_opt_class();
  objc_msgSend(v12, "objectForKey:", CFSTR("LSOpenSensitiveURLOption"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v25 && v26 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v27 = 0;
  }
  v28 = objc_msgSend(v27, "BOOLValue");

  +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = objc_msgSend(v29, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", v10, v28, 0);

  objc_msgSend(v10, "scheme");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;
  if ((v28 & 1) == 0
    && objc_msgSend(v30, "caseInsensitiveCompare:", CFSTR("search"))
    && objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("com-apple-audiounit")))
  {
    _LSOpenLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "scheme");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v32;
      _os_log_impl(&dword_182882000, v31, OS_LOG_TYPE_DEFAULT, "ERROR: There is no registered handler for URL scheme %@", buf, 0xCu);

    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[_LSDOpenClient openURL:fileHandle:options:completionHandler:]", 279, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v24);
  }
  else
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _LSServer_PerformOpenOperation(v10, v11, 0, 0, 0, 0, 0, v12, 0, v24, v13);
  }
LABEL_23:

}

- (void)openUserActivityWithUniqueIdentifier:(id)a3 activityData:(id)a4 activityType:(id)a5 bundleIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  NSObject *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  const __CFString *v31;
  unint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = (unint64_t)a3;
  v32 = (unint64_t)a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, void *))a8;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bund"
                                    "leIdentifier:options:completionHandler:]");
  _LSOpenLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v38 = (int)objc_msgSend(v20, "processIdentifier");
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "pid %ld opening user activity %@ of type %@", buf, 0x20u);

  }
  if (v14 | v32)
    v21 = v15 == 0;
  else
    v21 = 1;
  v22 = v21 || v16 == 0;
  v23 = !v22;
  if (v22 || !v17)
  {
    if (!v23)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = _LSIsDictionaryWithKeysAndValuesOfClasses(v17, v24, 0);

    if ((v25 & 1) == 0)
    {
LABEL_15:
      v33 = *MEMORY[0x1E0CB2938];
      v34 = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bundleIdentifier:options:completionHandler:]", 329, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v27);
LABEL_23:

      goto LABEL_24;
    }
  }
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_xpcConnection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = _LSCheckEntitlementForXPCConnection(v29, CFSTR("com.apple.private.coreservices.canopenactivity")) == 0;

  if (v30)
  {
    if (CFSTR("com.apple.private.coreservices.canopenactivity"))
      v31 = CFSTR("com.apple.private.coreservices.canopenactivity");
    else
      v31 = CFSTR("unknown entitlement");
    v35 = *MEMORY[0x1E0CB2938];
    v36 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDOpenClient openUserActivityWithUniqueIdentifier:activityData:activityType:bundleIdentifier:options:completionHandler:]", 325, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 0, v27);
    goto LABEL_23;
  }
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _LSServer_OpenUserActivity((void *)v14, (void *)v32, v15, 0, v16, 0, 0, v17, v26, v18);
LABEL_24:

}

- (void)getiCloudHostNamesWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient getiCloudHostNamesWithCompletionHandler:]");
  _LSServer_GetIOQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___LSDOpenClient_getiCloudHostNamesWithCompletionHandler___block_invoke;
  block[3] = &unk_1E1043AB0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)openAppLink:(id)a3 state:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  void (**v26)(id, _QWORD, void *);
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]");
  _LSOpenLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v32 = (int)objc_msgSend(v12, "processIdentifier");
    v33 = 2112;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "pid %ld opening app link %@ %@", buf, 0x20u);

  }
  if (v8
    && (-[_LSDClient XPCConnection](self, "XPCConnection"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "_xpcConnection"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = _LSXPCConnectionMayMapDatabase(v14) == 0,
        v14,
        v13,
        v15))
  {
    v29 = *MEMORY[0x1E0CB2938];
    v30 = CFSTR("process may not map database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]", 394, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v22);

  }
  else if (!v9
         || (objc_msgSend(v9, "URL"),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             v17 = v16 == 0,
             v16,
             v17))
  {
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("openState");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDOpenClient openAppLink:state:completionHandler:]", 406, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

  }
  else
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setXPCConnection:", v18);

    +[LSAppLink _dispatchQueue](LSAppLink, "_dispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___LSDOpenClient_openAppLink_state_completionHandler___block_invoke;
    block[3] = &unk_1E10401F0;
    v24 = v8;
    v25 = v9;
    v26 = v10;
    dispatch_async(v19, block);

    v20 = v24;
  }

}

- (void)failedToOpenApplication:(id)a3 withURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int MayMapDatabase;
  _LSDServiceDomain *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _LSDServiceDomain *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void **v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MayMapDatabase = _LSXPCConnectionMayMapDatabase(v12);

  if (MayMapDatabase)
  {
    v28 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v14, 0);

    if (v15)
    {
      _LSServer_DisplayRemovedAppPrompt(v15, v8, v9, v10);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v20, 0);

      if (v21)
        v22 = 0;
      else
        v22 = v28;
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v22);

    }
    if (v25 && v27)
      _LSContextDestroy(v25);
    v23 = v26;
    v25 = 0;
    v26 = 0;

    v27 = 0;
    v24 = v28;
    v28 = 0;

  }
  else
  {
    _LSOpenLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:].cold.1(objc_msgSend(v17, "processIdentifier"), (uint64_t)&v25, v16, v17);
    }

    v29 = *MEMORY[0x1E0CB2938];
    v30[0] = CFSTR("process may not map database");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDOpenClient failedToOpenApplication:withURL:completionHandler:]", 418, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v19);

  }
}

- (void)updateRestrictionKnowledgeWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  int v6;
  os_unfair_lock_s *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LSCheckEntitlementForNSXPCConnection(v5, CFSTR("com.apple.lsapplicationworkspace.restrictions"));

  if (v6)
  {
    +[LSDBExecutionContext sharedServerInstance]();
    v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertNotActiveForThisThread](v7);

    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v18 = (int)objc_msgSend(v9, "processIdentifier");
      _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Pid %ld is forcing restriction knowledge update!", buf, 0xCu);

    }
    +[LSApplicationRestrictionsManager sharedInstance]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[LSApplicationRestrictionsManager forceUpdateRestrictionKnowledgeWithError:](v10);
    v12 = 0;

    if (v11)
    {
      v13 = 0;
    }
    else
    {
      _LSDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_LSDOpenClient updateRestrictionKnowledgeWithCompletionHandler:].cold.1((uint64_t)v12, v15, v16);

      v13 = v12;
    }
    ((void (**)(id, _BOOL8, id))v4)[2](v4, v11, v13);

  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDOpenClient updateRestrictionKnowledgeWithCompletionHandler:]", 447, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, _BOOL8, void *))v4)[2](v4, 0, v14);

  }
}

- (void)failedToOpenApplication:(NSObject *)a3 withURL:(void *)a4 completionHandler:.cold.1(int a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "**ERROR** process MAY NOT MAP DATABASE! Ignoring failed URL from pid %llu", (uint8_t *)a2);

}

- (void)updateRestrictionKnowledgeWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "error forcing restriction knowledge update: %@", (uint8_t *)&v3);
}

@end
