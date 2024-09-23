@implementation DiagnosticsServiceImpl

- (DiagnosticsServiceImpl)initWithQueue:(id)a3
{
  id v5;
  DiagnosticsServiceImpl *v6;
  DiagnosticsServiceImpl *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *allowanceCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DiagnosticsServiceImpl;
  v6 = -[DiagnosticsServiceImpl init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allowanceCache = v7->allowanceCache;
    v7->allowanceCache = v8;

  }
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v5, CFSTR("com.apple.symptom_diagnostics.report"), 0);
  if (v6)
  {
    if (listener_shouldAcceptNewConnection__onceToken != -1)
      dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global_1);
    objc_msgSend(v5, "setExportedInterface:", listener_shouldAcceptNewConnection__diagnosticsServiceInterface);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
  }
  else
  {
    xpcLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "DiagnosticsService: connection (%@) lacks proper entitlements", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (BOOL)assertEntitlement:(void *)a3 entitlement:(int)a4 private:
{
  id v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a1 != 0;
  if (a1 && a4)
  {
    objc_msgSend(v7, "valueForEntitlement:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "BOOLValue") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      xpcLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v8;
        v16 = 1024;
        v17 = objc_msgSend(v7, "processIdentifier");
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "SymptomAnalytics DiagnosticsService: entitlement %@ is missing (%d)", (uint8_t *)&v14, 0x12u);
      }

      v9 = 0;
    }

  }
  return v9;
}

void __61__DiagnosticsServiceImpl_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F030D828);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listener_shouldAcceptNewConnection__diagnosticsServiceInterface;
  listener_shouldAcceptNewConnection__diagnosticsServiceInterface = v0;

}

- (void)_checkRateLimitForConnection:(void *)a3 signature:(void *)a4 reply:
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, double);
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  id v26;
  void *v27;
  RateLimitAllowance *v28;
  id v29;
  void *v30;
  int v31;
  double v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  void (**v51)(_QWORD, _QWORD, double);
  double v52;
  _QWORD v53[4];
  id v54;
  id v55;
  double v56;
  double v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, _QWORD, double))v9;
  if (!a1 || !v9)
    goto LABEL_28;
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "disableAPIRateLimit");

  if (v13)
  {
    v10[2](v10, 0, 0.0);
    goto LABEL_28;
  }
  v14 = objc_msgSend(v7, "processIdentifier");
  v15 = a1[2];
  objc_sync_enter(v15);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "apiRateLimit");
  v20 = v19;

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "apiLimitWindow");
  v24 = v23;

  xpcLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v59 = v14;
    v60 = 2112;
    v61 = v8;
    _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limit check for client: %d signature:%@", buf, 0x12u);
  }

  v26 = a1[2];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v27);
  v28 = (RateLimitAllowance *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v28 = objc_alloc_init(RateLimitAllowance);
    -[RateLimitAllowance setAllowance:](v28, "setAllowance:", v20);
    v29 = a1[2];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

  }
  v31 = objc_msgSend(a1, "_checkRateLimitForAllowance:time:", v28, v16);
  if (!_checkRateLimitForConnection_signature_reply__lastCleanedAt)
    goto LABEL_17;
  objc_msgSend(v16, "timeIntervalSinceDate:");
  if (v32 > 3600.0)
  {
    xpcLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_INFO, "DiagnosticsService: Cleaning API rate limit cache", buf, 2u);
    }

    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = a1[2];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke;
    v53[3] = &unk_1EA3B4D60;
    v54 = v16;
    v56 = v24;
    v57 = v20;
    v36 = v34;
    v55 = v36;
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v53);
    if (objc_msgSend(v36, "count"))
      objc_msgSend(a1[2], "removeObjectsForKeys:", v36);
    objc_storeStrong((id *)&_checkRateLimitForConnection_signature_reply__lastCleanedAt, v16);

    goto LABEL_18;
  }
  if (!_checkRateLimitForConnection_signature_reply__lastCleanedAt)
  {
LABEL_17:
    v37 = v16;
    v36 = (id)_checkRateLimitForConnection_signature_reply__lastCleanedAt;
    _checkRateLimitForConnection_signature_reply__lastCleanedAt = (uint64_t)v37;
LABEL_18:

  }
  v38 = 0.0;
  if ((v31 & 1) == 0)
  {
    -[RateLimitAllowance allowance](v28, "allowance");
    v40 = 1.0 - v39;
    v41 = v24 / v20;
    if (v20 <= 0.0)
      v41 = 0.0;
    v42 = v41 * v40;
    v38 = ceilf(v42);
  }

  objc_sync_exit(v15);
  if (v31)
  {
    v10[2](v10, 0, 0.0);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groupID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "caseManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("domain"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtype"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detected"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke_124;
      v50[3] = &unk_1EA3B4D88;
      v51 = v10;
      v52 = v38;
      objc_msgSend(v45, "countOfCasesMatchingDomain:type:subtype:process:groupCaseIDIsPresent:withinLast:reply:", v46, v47, v48, v49, 1, v50, 3600.0);

    }
    else
    {
      v10[2](v10, 1, v38);
    }
  }
LABEL_28:

}

void __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "lastCheckedAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = *(double *)(a1 + 48);
  v12 = 0.0;
  if (v11 > 0.0)
    v12 = *(double *)(a1 + 56) / v11;
  objc_msgSend(v6, "allowance");
  objc_msgSend(v6, "setAllowance:", v13 + v10 * v12);
  objc_msgSend(v6, "setLastCheckedAt:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "allowance");
  if (v14 >= *(double *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    xpcLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "allowance");
      v17 = 138412546;
      v18 = v5;
      v19 = 2048;
      v20 = v16;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit allowance for client %@ has fully recovered (%.1f). Cleaning out.", (uint8_t *)&v17, 0x16u);
    }

  }
}

uint64_t __71__DiagnosticsServiceImpl__checkRateLimitForConnection_signature_reply___block_invoke_124(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t result;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "";
    if (a2)
      v5 = " Not";
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "DiagnosticsService:%s overriding rate limit for group case", (uint8_t *)&v7, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, double))(result + 16))(result, a2 != 0, *(double *)(a1 + 40));
  return result;
}

- (BOOL)_checkRateLimitForAllowance:(id)a3 time:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  _BYTE v39[22];
  __int16 v40;
  double v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "apiRateLimit");
  v10 = v9;

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "apiLimitWindow");
  v14 = v13;

  xpcLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "allowance");
    v17 = v16;
    objc_msgSend(v5, "lastCheckedAt");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = "last checked at: ";
    else
      v19 = "(no previous checks)";
    objc_msgSend(v5, "lastCheckedAt");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    *(_DWORD *)v39 = 134219010;
    v22 = &stru_1EA3B8F58;
    *(_QWORD *)&v39[4] = v17;
    if (v20)
      v22 = (const __CFString *)v20;
    *(_WORD *)&v39[12] = 2048;
    *(double *)&v39[14] = v10;
    v40 = 2048;
    v41 = v14;
    v42 = 2080;
    v43 = v19;
    v44 = 2112;
    v45 = v22;
    _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit check - allowance: %.1f  current rate: %.0f calls per %.0f seconds. %s%@", v39, 0x34u);

  }
  objc_msgSend(v5, "lastCheckedAt");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v5, "lastCheckedAt");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v24);
    v26 = v25;

    objc_msgSend(v5, "allowance");
    objc_msgSend(v5, "setAllowance:", v27 + v26 * (v10 / v14));
    objc_msgSend(v5, "allowance");
    if (v28 > v10)
      objc_msgSend(v5, "setAllowance:", v10);
    xpcLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "allowance");
      *(_DWORD *)v39 = 134217984;
      *(_QWORD *)&v39[4] = v30;
      _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_DEBUG, "DiagnosticsService: API rate limit allowance recovered to %.1f", v39, 0xCu);
    }

  }
  objc_msgSend(v5, "allowance", *(_OWORD *)v39);
  v32 = v31;
  if (v31 < 1.0)
  {
    xpcLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "allowance");
      *(_DWORD *)v39 = 134217984;
      *(_QWORD *)&v39[4] = v37;
      v36 = "DiagnosticsService: API rate limit allowance is insufficient (%.1f), disallowed";
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(v5, "allowance");
    objc_msgSend(v5, "setAllowance:", v33 + -1.0);
    xpcLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "allowance");
      *(_DWORD *)v39 = 134217984;
      *(_QWORD *)&v39[4] = v35;
      v36 = "DiagnosticsService: API rate limit allowance reduced to %.1f, allowing";
LABEL_19:
      _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_INFO, v36, v39, 0xCu);
    }
  }

  objc_msgSend(v5, "setLastCheckedAt:", v6);
  return v32 >= 1.0;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:(void *)a7 expiresIn:
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (a1)
  {
    v17 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, CFSTR("success"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v19, "addEntriesFromDictionary:", v15);
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v19, "setObject:forKey:", v13, CFSTR("session"));
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v19, "setObject:forKey:", v14, CFSTR("groupID"));
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("reason"));

      diagnosticErrorStringForCode(a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("reasonStr"));

    }
    if (v16)
      objc_msgSend(v19, "setObject:forKey:", v16, CFSTR("expiresIn"));
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)responseDictWithSuccess:(uint64_t)a3 reasonCode:
{
  if (a1)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, 0, 0, 0, a3, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)responseDictWithSuccess:(uint64_t)a1 reasonCode:(uint64_t)a2 expiresIn:(uint64_t)a3
{
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:](a1, a2, 0, 0, 0, a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:
{
  if (a1)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, a3, 0, 0, 0, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)responseDictWithSuccess:(void *)a3 sessionId:(void *)a4 groupId:(void *)a5 additionalDict:(uint64_t)a6 reasonCode:
{
  if (a1)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:expiresIn:]((uint64_t)a1, a2, a3, a4, a5, a6, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)validateSignature:(_BOOL8)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    a1 = v3 != 0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = CFSTR("domain");
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: signature validation failed! '%@' must be specified: %@", (uint8_t *)&v12, 0x16u);

      }
      a1 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      xpcLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = CFSTR("type");
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: signature validation failed! '%@' must be specified: %@", (uint8_t *)&v12, 0x16u);

      }
      a1 = 0;
    }
  }

  return a1;
}

- (void)abcEnabledAndReadyWithReply:(uint64_t)a1
{
  void (**v3)(id, uint64_t, BOOL);
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "autoBugCaptureEnabled");

    if ((v6 & 1) == 0)
    {
      xpcLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "DiagnosticsService: AutoBugCapture is disabled", buf, 2u);
      }

    }
    objc_msgSend(v4, "caseManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (!v3)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      xpcLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "DiagnosticsService: AutoBugCapture is not ready yet", v10, 2u);
      }

      if (!v3)
        goto LABEL_9;
    }
    v3[2](v3, v6, v8 != 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)snapshotWithSignature:(id)a3 delay:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
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
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  BOOL v32;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v25[3] = &unk_1EA3B4E00;
  v25[4] = self;
  v26 = v15;
  v30 = v19;
  v31 = a4;
  v27 = v17;
  v28 = v16;
  v29 = v18;
  v32 = a8;
  v20 = v18;
  v21 = v16;
  v22 = v17;
  v23 = v15;
  v24 = v19;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v25);

}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    if ((a3 & 1) != 0)
    {
      v4 = *(id **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_135;
      v18[3] = &unk_1EA3B4DD8;
      v7 = *(id *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v23 = v7;
      v18[4] = v8;
      v19 = v9;
      v10 = *(id *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 80);
      v20 = v10;
      v24 = v11;
      v21 = *(id *)(a1 + 56);
      v22 = *(id *)(a1 + 64);
      v25 = *(_BYTE *)(a1 + 88);
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v18);

      v12 = v23;
LABEL_13:

      return;
    }
    xpcLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: snapshotWithSignature - ABC is not ready", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      v16 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_12;
    }
  }
  else
  {
    xpcLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: snapshotWithSignature - ABC is not enabled", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      v16 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_12:
      -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v15, 0, *v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
      goto LABEL_13;
    }
  }
}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_135(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v14 = -[DiagnosticsServiceImpl validateSignature:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sandbox_ext_token_dict"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v16, "removeObjectForKey:", CFSTR("sandbox_ext_token_dict"));

      xpcLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEBUG, "> DiagnosticsService: redacting sandbox extension token", buf, 2u);
      }

      v13 = v16;
    }
    xpcLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 80);
      v21 = *(_QWORD *)(a1 + 56);
      v22 = *(_QWORD *)(a1 + 64);
      v23 = "invalid";
      if (v14)
        v23 = "valid";
      v24 = "(trigger remote diags)";
      if (!*(_BYTE *)(a1 + 88))
        v24 = "";
      *(_DWORD *)buf = 138413826;
      v40 = v19;
      v41 = 2048;
      v42 = v20;
      v43 = 2112;
      v44 = v13;
      v45 = 2112;
      v46 = v21;
      v47 = 2112;
      v48 = v22;
      v49 = 2080;
      v50 = v23;
      v51 = 2080;
      v52 = v24;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to SNAPSHOT with signature: %@, for Delay: %ld, payload: %@, events: %@, actions: %@ (signature %s) %s", buf, 0x48u);
    }

    if (v14)
    {
      if (*(_BYTE *)(a1 + 88))
      {
        v25 = 5;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("groupID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          v25 = 3;
        else
          v25 = 1;
      }
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "caseManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (double)*(unint64_t *)(a1 + 80);
      v32 = *(_QWORD *)(a1 + 40);
      v33 = *(_QWORD *)(a1 + 48);
      v34 = *(_QWORD *)(a1 + 56);
      v35 = *(_QWORD *)(a1 + 64);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_139;
      v37[3] = &unk_1EA3B4DB0;
      v36 = *(id *)(a1 + 72);
      v37[4] = *(_QWORD *)(a1 + 32);
      v38 = v36;
      objc_msgSend(v30, "startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:", v32, v25, v34, v33, v35, v37, v31);

      v27 = v38;
    }
    else
    {
      v26 = *(_QWORD *)(a1 + 72);
      if (!v26)
        goto LABEL_26;
      -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, 20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
    }

    goto LABEL_26;
  }
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apiRateLimit");
  v6 = v5;

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "apiLimitWindow");
  v10 = v9;

  xpcLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v40 = v6;
    v41 = 2048;
    v42 = v10;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limited. (Allowed limit is %.0f calls per %.0f second window)", buf, 0x16u);
  }

  v12 = *(_QWORD *)(a1 + 72);
  if (v12)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:expiresIn:](*(_QWORD *)(a1 + 32), 0, 41);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
LABEL_26:

  }
}

void __99__DiagnosticsServiceImpl_snapshotWithSignature_delay_events_payload_actions_wantsRemoteCase_reply___block_invoke_139(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a5 == 0, a2, a3, a4, a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

- (void)startSessionWithSignature:(id)a3 duration:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 wantsRemoteCase:(BOOL)a8 reply:(id)a9
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
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  BOOL v32;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke;
  v25[3] = &unk_1EA3B4E00;
  v25[4] = self;
  v26 = v15;
  v30 = v19;
  v31 = a4;
  v27 = v17;
  v28 = v16;
  v29 = v18;
  v32 = a8;
  v20 = v18;
  v21 = v16;
  v22 = v17;
  v23 = v15;
  v24 = v19;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v25);

}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    if ((a3 & 1) != 0)
    {
      v4 = *(id **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_143;
      v18[3] = &unk_1EA3B4DD8;
      v7 = *(id *)(a1 + 72);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v23 = v7;
      v18[4] = v8;
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 80);
      v19 = v10;
      v24 = v11;
      v20 = *(id *)(a1 + 48);
      v21 = *(id *)(a1 + 56);
      v22 = *(id *)(a1 + 64);
      v25 = *(_BYTE *)(a1 + 88);
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v18);

      v12 = v23;
LABEL_13:

      return;
    }
    xpcLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: startSessionWithSignature - ABC is not ready", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      v16 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_12;
    }
  }
  else
  {
    xpcLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: startSessionWithSignature - ABC is not enabled", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 72);
    if (v14)
    {
      v15 = *(void **)(a1 + 32);
      v16 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_12:
      -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v15, 0, *v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v12);
      goto LABEL_13;
    }
  }
}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_143(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v7 = -[DiagnosticsServiceImpl validateSignature:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    xpcLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 80);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = "invalid";
      if (v7)
        v14 = "valid";
      *(_DWORD *)buf = 138413570;
      v30 = v10;
      v31 = 2048;
      v32 = v9;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v13;
      v39 = 2080;
      v40 = v14;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to START logging session with signature: %@, duration: %ld, payload: %@, events: %@, actions: %@ (signature %s)", buf, 0x3Eu);
    }

    if (v7)
    {
      if (*(_BYTE *)(a1 + 88))
      {
        v15 = 4;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("groupID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 != 0;

        v15 = 2 * v18;
      }
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "caseManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (double)*(unint64_t *)(a1 + 80);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(_QWORD *)(a1 + 48);
      v24 = *(_QWORD *)(a1 + 56);
      v25 = *(_QWORD *)(a1 + 64);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_144;
      v27[3] = &unk_1EA3B4DB0;
      v26 = *(id *)(a1 + 72);
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v26;
      objc_msgSend(v20, "startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:", v22, v15, v24, v23, v25, v27, v21);

      v16 = v28;
      goto LABEL_18;
    }
    v4 = *(_QWORD *)(a1 + 72);
    if (!v4)
      return;
    v5 = *(void **)(a1 + 32);
    v6 = &kSymptomDiagnosticErrorInvalidParameters;
LABEL_15:
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v5, 0, *v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v16);
LABEL_18:

    return;
  }
  xpcLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "DiagnosticsService: API rate limited.", buf, 2u);
  }

  v4 = *(_QWORD *)(a1 + 72);
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = &kSymptomDiagnosticErrorRequestThrottled;
    goto LABEL_15;
  }
}

void __106__DiagnosticsServiceImpl_startSessionWithSignature_duration_events_payload_actions_wantsRemoteCase_reply___block_invoke_144(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a5 == 0, a2, a3, a4, a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v15 = a4;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = a4;
    objc_msgSend(v13, "arrayWithObjects:count:", &v15, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[DiagnosticsServiceImpl addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v10, a4, v11, v12, v15, v16);

}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke;
  v18[3] = &unk_1EA3B4E50;
  v21 = v12;
  v22 = v13;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v18);

}

void __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      v8 = *(const char **)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request ADD EVENTS to session: %@. events: %@ payload: %@", buf, 0x20u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke_148;
    v21[3] = &unk_1EA3B4E28;
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v16;
    objc_msgSend(v12, "addToSession:events:payload:reply:", v13, v14, v15, v21);

    v17 = v22;
LABEL_14:

    return;
  }
  if (v7)
  {
    v18 = "enabled";
    if (a2)
      v18 = "ready";
    *(_DWORD *)buf = 136446210;
    v24 = v18;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: addToSession - ABC is not %{public}s", buf, 0xCu);
  }

  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
  {
    v20 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2)
      v20 = &kSymptomDiagnosticErrorServiceNotReady;
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v17);
    goto LABEL_14;
  }
}

void __60__DiagnosticsServiceImpl_addToSession_events_payload_reply___block_invoke_148(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), a2 == 0, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke;
  v18[3] = &unk_1EA3B4E50;
  v21 = v12;
  v22 = v13;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v18);

}

void __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      v8 = *(const char **)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request APPEND SIGNATURE to session: %@. key: %@ content: %@", buf, 0x20u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke_150;
    v21[3] = &unk_1EA3B4E28;
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v16;
    objc_msgSend(v12, "addSignatureContentForSession:key:content:reply:", v13, v14, v15, v21);

    v17 = v22;
LABEL_14:

    return;
  }
  if (v7)
  {
    v18 = "enabled";
    if (a2)
      v18 = "ready";
    *(_DWORD *)buf = 136446210;
    v24 = v18;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: addSignatureContentForSession - ABC is not %{public}s", buf, 0xCu);
  }

  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
  {
    v20 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2)
      v20 = &kSymptomDiagnosticErrorServiceNotReady;
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v17);
    goto LABEL_14;
  }
}

void __74__DiagnosticsServiceImpl_addSignatureContentForSession_key_content_reply___block_invoke_150(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), a2 == 0, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)endSession:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__DiagnosticsServiceImpl_endSession___block_invoke;
  v6[3] = &unk_1EA3B4E78;
  v7 = v4;
  v5 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v6);

}

void __37__DiagnosticsServiceImpl_endSession___block_invoke(uint64_t a1, int a2, char a3)
{
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      v8 = *(const char **)(a1 + 32);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to END logging session: %@", (uint8_t *)&v11, 0xCu);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject caseManager](v6, "caseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endSessionWithIdentifier:forced:", *(_QWORD *)(a1 + 32), 0);

  }
  else if (v7)
  {
    v10 = "enabled";
    if (a2)
      v10 = "ready";
    v11 = 136446210;
    v12 = v10;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: endSession - ABC is not %{public}s", (uint8_t *)&v11, 0xCu);
  }

}

- (void)cancelSession:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__DiagnosticsServiceImpl_cancelSession___block_invoke;
  v6[3] = &unk_1EA3B4E78;
  v7 = v4;
  v5 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v6);

}

void __40__DiagnosticsServiceImpl_cancelSession___block_invoke(uint64_t a1, int a2, char a3)
{
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 && (a3 & 1) != 0)
  {
    if (v7)
    {
      v8 = *(const char **)(a1 + 32);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to CANCEL logging session: %@", (uint8_t *)&v11, 0xCu);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject caseManager](v6, "caseManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelSessionWithIdentifier:", *(_QWORD *)(a1 + 32));

  }
  else if (v7)
  {
    v10 = "enabled";
    if (a2)
      v10 = "ready";
    v11 = 136446210;
    v12 = v10;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: cancelSession - ABC is not %{public}s", (uint8_t *)&v11, 0xCu);
  }

}

- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke;
  v10[3] = &unk_1EA3B4EF0;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v10);

}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, char a2, char a3)
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    if ((a3 & 1) != 0)
    {
      if (!*(_QWORD *)(a1 + 48))
        return;
      v4 = *(id **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_151;
      v16[3] = &unk_1EA3B4EC8;
      v6 = *(void **)(a1 + 40);
      v7 = *(id *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v18 = v7;
      v16[4] = v8;
      v17 = v9;
      -[DiagnosticsServiceImpl _checkRateLimitForConnection:signature:reply:](v4, v5, v6, v16);

      v10 = v18;
      goto LABEL_14;
    }
    xpcLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: groupCaseIdentifierForSignature - ABC is not ready", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      v14 = &kSymptomDiagnosticErrorServiceNotReady;
      goto LABEL_13;
    }
  }
  else
  {
    xpcLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: groupCaseIdentifierForSignature - ABC is not enabled", buf, 2u);
    }

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v13 = *(void **)(a1 + 32);
      v14 = &kSymptomDiagnosticErrorServiceUnavailable;
LABEL_13:
      -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v13, 0, *v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
LABEL_14:

    }
  }
}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_151(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int *v14;
  _BOOL4 v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "apiRateLimit");
    v6 = v5;

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "apiLimitWindow");
    v10 = v9;

    xpcLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v27 = v6;
      v28 = 2048;
      v29 = v10;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: API rate limited. (Allowed limit is %.0f calls per %.0f second window)", buf, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(a1 + 32);
    v14 = &kSymptomDiagnosticErrorRequestThrottled;
    goto LABEL_12;
  }
  v15 = -[DiagnosticsServiceImpl validateSignature:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  xpcLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "invalid";
    v18 = *(_QWORD *)(a1 + 40);
    if (v15)
      v17 = "valid";
    *(_DWORD *)buf = 138412546;
    v27 = v18;
    v28 = 2080;
    v29 = v17;
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request for a group case identifier with signature: %@ (signature %s)", buf, 0x16u);
  }

  if (!v15)
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(a1 + 32);
    v14 = &kSymptomDiagnosticErrorInvalidParameters;
LABEL_12:
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](v13, 0, *v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v23);
    goto LABEL_13;
  }
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "caseManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_152;
  v24[3] = &unk_1EA3B4EA0;
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v22;
  objc_msgSend(v20, "requestGroupCaseIdentifierForSignature:reply:", v21, v24);

  v23 = v25;
LABEL_13:

}

void __71__DiagnosticsServiceImpl_requestGroupCaseIdentifierForSignature_reply___block_invoke_152(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  int v8;
  uint64_t v9;
  id v10;

  v7 = a4;
  v8 = +[DiagnosticCaseManager symptomDiagnosticErrorForDiagnosticCaseDampeningType:](DiagnosticCaseManager, "symptomDiagnosticErrorForDiagnosticCaseDampeningType:", a3);
  v9 = *(_QWORD *)(a1 + 40);
  -[DiagnosticsServiceImpl responseDictWithSuccess:sessionId:groupId:additionalDict:reasonCode:](*(void **)(a1 + 32), a2, 0, v7, 0, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
}

- (void)triggerRemoteSessionForSignature:(id)a3 groupIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  xpcLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v9;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to trigger remote session with group identifier %@ and signature %@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke;
  v15[3] = &unk_1EA3B4F18;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v15);

}

void __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(_QWORD *)(a1 + 32), v5, CFSTR("com.apple.symptom_diagnostics.private"), 1);
    xpcLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: remote trigger authorized", buf, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "diagnosticLiaison");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke_157;
      v20[3] = &unk_1EA3B4B68;
      v13 = *(_QWORD *)(a1 + 48);
      v21 = *(id *)(a1 + 56);
      objc_msgSend(v10, "remotelyTriggerSessionForSignature:groupIdentifier:event:queue:reply:", v11, v13, 0, v12, v20);

      v14 = v21;
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: not entitled to access private API", buf, 2u);
      }

      v19 = *(_QWORD *)(a1 + 56);
      if (!v19)
        goto LABEL_20;
      v22 = CFSTR("success");
      v23 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);
    }

LABEL_20:
    return;
  }
  xpcLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "enabled";
    if (a2)
      v16 = "ready";
    *(_DWORD *)buf = 136446210;
    v25 = v16;
    _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): triggerRemoteSessionForSignature - ABC is not %{public}s", buf, 0xCu);
  }

  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
  {
    v18 = &kSymptomDiagnosticErrorServiceUnavailable;
    if (a2)
      v18 = &kSymptomDiagnosticErrorServiceNotReady;
    -[DiagnosticsServiceImpl responseDictWithSuccess:reasonCode:](*(void **)(a1 + 32), 0, *v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v5);
    goto LABEL_20;
  }
}

void __81__DiagnosticsServiceImpl_triggerRemoteSessionForSignature_groupIdentifier_reply___block_invoke_157(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = CFSTR("success");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

- (void)getSessionStatisticsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to get statistics", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__DiagnosticsServiceImpl_getSessionStatisticsWithReply___block_invoke;
  v7[3] = &unk_1EA3B4F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v7);

}

void __56__DiagnosticsServiceImpl_getSessionStatisticsWithReply___block_invoke(uint64_t a1, int a2, char a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(_QWORD *)(a1 + 32), v5, CFSTR("com.apple.symptom_diagnostics.private"), 1))
    {
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: statistics authorized", (uint8_t *)&v14, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "caseManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "statsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getDiagnosticCaseUsageStatistics:", *(_QWORD *)(a1 + 40));

    }
    else if (*(_QWORD *)(a1 + 40))
    {
      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to access private API", (uint8_t *)&v14, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    xpcLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "enabled";
      if (a2)
        v11 = "ready";
      v14 = 136446210;
      v15 = v11;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getSessionStatisticsWithReply - ABC is not %{public}s", (uint8_t *)&v14, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }
}

- (void)getCasesListFromIdentifier:(id)a3 count:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  xpcLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a4;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): request to get list of %ld cases from identifier %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__DiagnosticsServiceImpl_getCasesListFromIdentifier_count_reply___block_invoke;
  v13[3] = &unk_1EA3B4F68;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v13);

}

void __65__DiagnosticsServiceImpl_getCasesListFromIdentifier_count_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, CFSTR("com.apple.symptom_diagnostics.private"), 1))
    {
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: incremental case listing authorized", (uint8_t *)&v13, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "caseManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getHistoricalDiagnosicCaseDictionaryFromIdentifier:withEvents:count:reply:", a1[5], 0, a1[7], a1[6]);

    }
    else if (a1[6])
    {
      xpcLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to access private API", (uint8_t *)&v13, 2u);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }

  }
  else
  {
    xpcLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "enabled";
      if (a2)
        v10 = "ready";
      v13 = 136446210;
      v14 = v10;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getCasesListFromIdentifier - ABC is not %{public}s", (uint8_t *)&v13, 0xCu);
    }

    v11 = a1[6];
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
}

- (void)resetDiagnosticCaseStorageWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = (void (**)(id, id))a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reqeust to reset DiagnosticCaseStorage backing store", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, CFSTR("com.apple.symptom_diagnostics.reset"), 1);
  xpcLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset case storage authorized", v14, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetDiagnosticCaseStorage");

    if (!v4)
      goto LABEL_12;
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v13, 2u);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  if (v4)
    goto LABEL_11;
LABEL_12:

}

- (void)resetDiagnosticCaseUsageWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = (void (**)(id, id))a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to reset DiagnosticCaseUsage backing store", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, CFSTR("com.apple.symptom_diagnostics.reset"), 1);
  xpcLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset case usage authorized", v15, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resetDiagnosticCaseUsage");

    if (!v4)
      goto LABEL_12;
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v14, 2u);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  if (v4)
    goto LABEL_11;
LABEL_12:

}

- (void)resetAllWithReply:(id)a3
{
  void (**v4)(id, id);
  NSObject *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = (void (**)(id, id))a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request to reset DiagnosticCaseStorage and DiagnosticCaseUsage backing store", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v7, CFSTR("com.apple.symptom_diagnostics.reset"), 1);
  xpcLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: reset all authorized", v14, 2u);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetAll");

    if (!v4)
      goto LABEL_12;
LABEL_11:
    v4[2](v4, v6);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "DiagnosticsService: no entitlement to execute reset", v13, 2u);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  if (v4)
    goto LABEL_11;
LABEL_12:

}

- (void)getExpertSystemsStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: requesting service status", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__DiagnosticsServiceImpl_getExpertSystemsStatus___block_invoke;
  v7[3] = &unk_1EA3B4F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v7);

}

void __49__DiagnosticsServiceImpl_getExpertSystemsStatus___block_invoke(uint64_t a1, char a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[8];
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](*(_QWORD *)(a1 + 32), v4, CFSTR("com.apple.symptom_diagnostics.private"), 1);
    xpcLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request service status authorized", v12, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject internalStateDictionary](v7, "internalStateDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AutoBugCaptureAdministrator"));

    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to request service status", v12, 2u);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

    goto LABEL_15;
  }
  xpcLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService(PRIVATE): getExpertSystemsStatus - ABC is not enabled", v12, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v15 = CFSTR("AutoBugCaptureAdministrator");
    v13 = CFSTR("serviceEnabled");
    v14 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_15:

  }
}

- (void)getDiagnosticPayloadsForSignatures:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request collected payloads for the given signatures: %@", buf, 0xCu);
  }

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "caseManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke;
  v12[3] = &unk_1EA3B4FB8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "payloadsForSignatures:reply:", v6, v12);

}

void __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke_2;
    block[3] = &unk_1EA3B4F90;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __67__DiagnosticsServiceImpl_getDiagnosticPayloadsForSignatures_reply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)homeKitResidentDevicesIDSIdentifiersWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request IDS identifiers of HomeKit resident devices", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, CFSTR("com.apple.symptom_diagnostics.private"), 1);
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized request for IDS identifiers of HomeKit resident devices", buf, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "diagnosticLiaison");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__DiagnosticsServiceImpl_homeKitResidentDevicesIDSIdentifiersWithReply___block_invoke;
    v12[3] = &unk_1EA3B4B90;
    v13 = v4;
    objc_msgSend(v11, "residentDevicesIDSIdentifiersWithReply:", v12);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to request IDS identifiers of HomeKit resident devices", buf, 2u);
    }

    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __72__DiagnosticsServiceImpl_homeKitResidentDevicesIDSIdentifiersWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getAutoBugCaptureConfiguration:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request current AutoBugCapture configuration", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, CFSTR("com.apple.symptom_diagnostics.private"), 1);
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized request for current AutoBugCapture configuration", v13, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationManager");
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject getAutoBugCaptureConfiguration](v9, "getAutoBugCaptureConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to retrive current AutoBugCapture configuration", v12, 2u);
    }
    v11 = 0;
  }

  if (v4)
    v4[2](v4, v11);

}

- (void)purgeAutoBugCaptureFilesWithSubPaths:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *context;
  void *v31;
  void *v32;
  void (**v33)(id, _QWORD);
  id v34;
  char v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request purge AutoBugCapture files with subpaths: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, CFSTR("com.apple.symptom_diagnostics.private"), 1);
  xpcLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v32 = v9;
    v33 = v7;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized purging of AutoBugCapture files", buf, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v14;
    objc_msgSend(v14, "logArchivePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1DF0B6314]();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v6;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v38;
      v35 = 1;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v17);
          v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v25 = (void *)objc_msgSend(v15, "copy");

          objc_msgSend(v25, "stringByAppendingPathComponent:", v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "fileExistsAtPath:", v20))
          {
            v36 = v21;
            v26 = objc_msgSend(v16, "removeItemAtPath:error:", v20, &v36);
            v27 = v36;

            if ((v26 & 1) == 0)
            {
              xpcLogHandle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v42 = v20;
                v43 = 2112;
                v44 = v27;
                _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_ERROR, "DiagnosticsService: Couldn't delete file: %@ because %@", buf, 0x16u);
              }

              v35 = 0;
            }
            v21 = v27;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v35 = 1;
    }

    objc_autoreleasePoolPop(context);
    v29 = v35 & 1;
    v7 = v33;
    v6 = v34;
    v9 = v32;
    if (v33)
LABEL_26:
      v7[2](v7, v29);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "DiagnosticsService: not entitled to purge AutoBugCapture files", buf, 2u);
    }

    v29 = 0;
    if (v7)
      goto LABEL_26;
  }

}

- (void)uploadCasesWithIdentifiersToCloudKit:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload for case identifiers %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, CFSTR("com.apple.symptom_diagnostics.private"), 1))
  {
    xpcLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit upload of ABC cases", (uint8_t *)&v18, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cloudKitEnabled");

    if (v10)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ckUploadController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject ckUploadController](v13, "ckUploadController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uploadCasesWithIdentifiers:", v4);

LABEL_14:
        goto LABEL_15;
      }
      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      LOWORD(v18) = 0;
      v15 = "CloudKit upload controller is not instantiated!";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
    }
    else
    {
      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      LOWORD(v18) = 0;
      v15 = "CloudKit upload is disabled";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_1DBAE1000, v16, v17, v15, (uint8_t *)&v18, 2u);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)uploadRecentCases:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  xpcLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload for recent %ld cases", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v6, CFSTR("com.apple.symptom_diagnostics.private"), 1))
  {
    xpcLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit upload of recent ABC cases", (uint8_t *)&v18, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cloudKitEnabled");

    if (v10)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ckUploadController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject ckUploadController](v13, "ckUploadController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uploadMostRecentCases:", a3);

LABEL_14:
        goto LABEL_15;
      }
      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      LOWORD(v18) = 0;
      v15 = "CloudKit upload controller is not instantiated!";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
    }
    else
    {
      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      LOWORD(v18) = 0;
      v15 = "CloudKit upload is disabled";
      v16 = v13;
      v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_1DBAE1000, v16, v17, v15, (uint8_t *)&v18, 2u);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)cloudKitUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: request CloudKit upload decision for case identifiers %@", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, CFSTR("com.apple.symptom_diagnostics.private"), 1))
  {
    xpcLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticsService: authorized CloudKit Upload Decision of ABC cases", (uint8_t *)&v20, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "cloudKitEnabled");

    if (v13)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ckUploadController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ckUploadController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uploadDecisionWithIdentifiers:reply:", v6, v7);

LABEL_17:
        goto LABEL_18;
      }
      xpcLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_INFO, "CloudKit upload controller is not instantiated!", (uint8_t *)&v20, 2u);
      }

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, &unk_1EA3CF9B0, v16);
        goto LABEL_17;
      }
    }
    else
    {
      xpcLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "CloudKit upload is disabled", (uint8_t *)&v20, 2u);
      }

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, &unk_1EA3CF9D8, v16);
        goto LABEL_17;
      }
    }
  }
LABEL_18:

}

- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: list case summaries with identifiers %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__DiagnosticsServiceImpl_listCaseSummariesWithIdentifiers_reply___block_invoke;
  v11[3] = &unk_1EA3B4EF0;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v11);

}

void __65__DiagnosticsServiceImpl_listCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, CFSTR("com.apple.symptom_diagnostics.private"), 1))
    {
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized for CloudKit ABC activities", (uint8_t *)&v22, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "cloudKitEnabled");

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "caseSummaryEnabled");

      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("disabled");
        if (v9)
          v15 = CFSTR("enabled");
        else
          v15 = CFSTR("disabled");
        if (v12)
          v14 = CFSTR("enabled");
        v22 = 138412546;
        v23 = (void *)v15;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v22, 0x16u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "caseManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "listCaseSummariesWithIdentifiers:reply:", a1[5], a1[6]);

    }
    else if (a1[6])
    {
      xpcLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v22, 2u);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }

  }
  else
  {
    xpcLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "enabled";
      if (a2)
        v19 = "ready";
      v22 = 136446210;
      v23 = (void *)v19;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService(PRIVATE): listCaseSummariesWithIdentifiers - ABC is not %{public}s", (uint8_t *)&v22, 0xCu);
    }

    v20 = a1[6];
    if (v20)
      (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);
  }
}

- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  xpcLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: list '%@' case summaries", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__DiagnosticsServiceImpl_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke;
  v17[3] = &unk_1EA3B4FE0;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  -[DiagnosticsServiceImpl abcEnabledAndReadyWithReply:]((uint64_t)self, v17);

}

void __77__DiagnosticsServiceImpl_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke(uint64_t *a1, int a2, char a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:](a1[4], v5, CFSTR("com.apple.symptom_diagnostics.private"), 1))
    {
      xpcLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized for CloudKit ABC activities", (uint8_t *)&v22, 2u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "cloudKitEnabled");

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "caseSummaryEnabled");

      xpcLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("disabled");
        if (v9)
          v15 = CFSTR("enabled");
        else
          v15 = CFSTR("disabled");
        if (v12)
          v14 = CFSTR("enabled");
        v22 = 138412546;
        v23 = (void *)v15;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v22, 0x16u);
      }

      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "caseManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "listCaseSummariesOfType:fromIdentifier:count:reply:", a1[5], a1[6], a1[8], a1[7]);

    }
    else if (a1[7])
    {
      xpcLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v22, 2u);
      }

      (*(void (**)(void))(a1[7] + 16))();
    }

  }
  else
  {
    xpcLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "enabled";
      if (a2)
        v19 = "ready";
      v22 = 136446210;
      v23 = (void *)v19;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService(PRIVATE): listCaseSummariesOfType - ABC is not %{public}s", (uint8_t *)&v22, 0xCu);
    }

    v20 = a1[7];
    if (v20)
      (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);
  }
}

- (void)submitRecentCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  __CFString *v6;
  void (**v7)(id, const __CFString *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, const __CFString *))a4;
  xpcLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: request CloudKit submission for identifiers %@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v9, CFSTR("com.apple.symptom_diagnostics.private"), 1))
  {
    xpcLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized CloudKit submission for ABC case summaries", (uint8_t *)&v25, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "cloudKitEnabled");

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "caseSummaryEnabled");

    if (v13 && v16)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ckUploadController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject ckUploadController](v19, "ckUploadController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "submitCaseSummariesWithIdentifiers:reply:", v6, v7);

      }
      else
      {
        xpcLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: CloudKit upload controller is not instantiated!", (uint8_t *)&v25, 2u);
        }
      }

    }
    else
    {
      xpcLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = CFSTR("disabled");
        if (v13)
          v24 = CFSTR("enabled");
        else
          v24 = CFSTR("disabled");
        if (v16)
          v23 = CFSTR("enabled");
        v25 = 138412546;
        v26 = v24;
        v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: cannot submit! CloudKitUpload is %@, CaseSummary is %@", (uint8_t *)&v25, 0x16u);
      }

    }
  }
  else if (v7)
  {
    xpcLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v25, 2u);
    }

    v7[2](v7, CFSTR("No access to private API"));
  }

}

- (void)submitRecentCaseSummariesWithCount:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, const __CFString *);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  int v28;
  unint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, const __CFString *))a4;
  xpcLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 134217984;
    v29 = a3;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: request CloudKit submission for recent %ld case summaries", (uint8_t *)&v28, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DiagnosticsServiceImpl assertEntitlement:entitlement:private:]((uint64_t)self, v8, CFSTR("com.apple.symptom_diagnostics.private"), 1))
  {
    xpcLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: DiagnosticsService: authorized CloudKit submission for recent ABC case summaries", (uint8_t *)&v28, 2u);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "cloudKitEnabled");

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "caseSummaryEnabled");

    if (v12 && v15)
    {
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ckUploadController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ckUploadController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "submitRecentCaseSummaries:reply:", a3, v6);

        goto LABEL_25;
      }
      xpcLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        v24 = "DiagnosticCaseSummaryLog: CloudKit upload controller is not instantiated!";
        v25 = v21;
        v26 = OS_LOG_TYPE_INFO;
        v27 = 2;
LABEL_23:
        _os_log_impl(&dword_1DBAE1000, v25, v26, v24, (uint8_t *)&v28, v27);
      }
    }
    else
    {
      xpcLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = CFSTR("disabled");
        if (v12)
          v23 = CFSTR("enabled");
        else
          v23 = CFSTR("disabled");
        if (v15)
          v22 = CFSTR("enabled");
        v28 = 138412546;
        v29 = (unint64_t)v23;
        v30 = 2112;
        v31 = v22;
        v24 = "DiagnosticCaseSummaryLog: cannot submit! CloudKitUpload is %@, CaseSummary is %@";
        v25 = v21;
        v26 = OS_LOG_TYPE_DEFAULT;
        v27 = 22;
        goto LABEL_23;
      }
    }

    goto LABEL_25;
  }
  if (v6)
  {
    xpcLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: DiagnosticsService: not entitled to access private API", (uint8_t *)&v28, 2u);
    }

    v6[2](v6, CFSTR("No access to private API"));
  }
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allowanceCache, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
