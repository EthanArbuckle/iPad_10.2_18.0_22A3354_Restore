@implementation FMAPSHandler

+ (id)constantForEnvironmentString:(id)a3
{
  id v3;
  uint64_t v4;
  id *v5;
  id v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "compare:options:", CFSTR("production"), 1);
  v5 = (id *)MEMORY[0x1E0CFE130];
  if (v4)
  {
    if (objc_msgSend(v3, "compare:options:", CFSTR("development"), 1))
    {
      if (!objc_msgSend(v3, "compare:options:", CFSTR("demo"), 1))
        v5 = (id *)MEMORY[0x1E0CFE120];
    }
    else
    {
      v5 = (id *)MEMORY[0x1E0CFE128];
    }
  }
  v6 = *v5;

  return v6;
}

- (FMAPSHandler)init
{
  return -[FMAPSHandler initWithEnvironmentName:launchOnDemandPort:](self, "initWithEnvironmentName:launchOnDemandPort:", *MEMORY[0x1E0CFE130], 0);
}

- (FMAPSHandler)initWithEnvironmentName:(id)a3
{
  return -[FMAPSHandler initWithEnvironmentName:launchOnDemandPort:](self, "initWithEnvironmentName:launchOnDemandPort:", a3, 0);
}

- (FMAPSHandler)initWithEnvironmentName:(id)a3 launchOnDemandPort:(id)a4
{
  id v6;
  id v7;
  FMAPSHandler *v8;
  FMAPSHandler *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FMAPSHandler;
  v8 = -[FMAPSHandler init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FMAPSHandler setEnvironmentName:](v8, "setEnvironmentName:", v6);
    v10 = objc_alloc(MEMORY[0x1E0CFE148]);
    if (v7)
      v11 = objc_msgSend(v10, "initWithEnvironmentName:namedDelegatePort:queue:", v6, v7, MEMORY[0x1E0C80D38]);
    else
      v11 = objc_msgSend(v10, "initWithEnvironmentName:queue:", v6, MEMORY[0x1E0C80D38]);
    v12 = (void *)v11;
    -[FMAPSHandler setApsConnection:](v9, "setApsConnection:", v11);

    -[FMAPSHandler apsConnection](v9, "apsConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v9);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAPSHandler setRegisteredDelegates:](v9, "setRegisteredDelegates:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMAPSHandler setPendingPushes:](v9, "setPendingPushes:", v15);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[FMAPSHandler invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FMAPSHandler;
  -[FMAPSHandler dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[FMAPSHandler apsConnection](self, "apsConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[FMAPSHandler _setEnabledTopics:](self, "_setEnabledTopics:", 0);
  -[FMAPSHandler apsConnection](self, "apsConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");

}

- (void)suspendRegistrations
{
  -[FMAPSHandler setRegistrationsSuspended:](self, "setRegistrationsSuspended:", 1);
}

- (void)resumeRegistrations
{
  -[FMAPSHandler setRegistrationsSuspended:](self, "setRegistrationsSuspended:", 0);
  -[FMAPSHandler _registrationsWereResumed](self, "_registrationsWereResumed");
}

- (void)registerDelegate:(id)a3 forTopic:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FMAPSHandler_registerDelegate_forTopic___block_invoke;
  block[3] = &unk_1E82AA710;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __42__FMAPSHandler_registerDelegate_forTopic___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  FMAPSDelegateInfo *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  NSObject *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "registeredDelegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (!v4)
  {

LABEL_13:
    v12 = objc_alloc_init(FMAPSDelegateInfo);
    -[FMAPSDelegateInfo setTopic:](v12, "setTopic:", *(_QWORD *)(a1 + 48));
    -[FMAPSDelegateInfo setDelegate:](v12, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "registeredDelegates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);

    goto LABEL_14;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v9, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 40);

      if (v10 == v11)
      {
        objc_msgSend(v9, "setTopic:", *(_QWORD *)(a1 + 48));
        v6 = 1;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  }
  while (v5);

  if ((v6 & 1) == 0)
    goto LABEL_13;
LABEL_14:
  if ((objc_msgSend(*v2, "registrationsSuspended") & 1) != 0)
  {
    LogCategory_APS();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __42__FMAPSHandler_registerDelegate_forTopic___block_invoke_cold_1(a1, v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*v2, "registeredDelegates", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "topic");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v17);
    }

    LogCategory_APS();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v24 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "environmentName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      v38 = 2112;
      v39 = v14;
      _os_log_debug_impl(&dword_1C9967000, v21, OS_LOG_TYPE_DEBUG, "Registering for topic %@ in environment %@. Total topics : %@", buf, 0x20u);

    }
    v22 = *v2;
    -[NSObject allObjects](v14, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setEnabledTopics:", v23);

  }
}

- (void)deregisterDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  FMAPSHandler *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__FMAPSHandler_deregisterDelegate___block_invoke;
  v6[3] = &unk_1E82AA4B8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __35__FMAPSHandler_deregisterDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_APS();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_2(a1);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "registeredDelegates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);

        if (v10 != v11)
          objc_msgSend(v2, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "registeredDelegates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v2, "count");

  if (v13 != v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setRegisteredDelegates:", v2);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "registeredDelegates", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "topic");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    LogCategory_APS();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_1((uint64_t)v15, v22, v23);

    v24 = *(void **)(a1 + 40);
    objc_msgSend(v15, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setEnabledTopics:", v25);

  }
}

- (NSString)apsToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;

  -[FMAPSHandler apsConnection](self, "apsConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fm_hexString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)_registrationsWereResumed
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__FMAPSHandler__registrationsWereResumed__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__FMAPSHandler__registrationsWereResumed__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registeredDelegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "topic");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v5);
  }

  LogCategory_APS();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __41__FMAPSHandler__registrationsWereResumed__block_invoke_cold_1((uint64_t)v2, v9, v10);

  v11 = *(void **)(a1 + 32);
  v23 = v2;
  objc_msgSend(v2, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setEnabledTopics:", v12);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "pendingPushes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("topic"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("message"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LogCategory_APS();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v19;
          v34 = 2112;
          v35 = v20;
          _os_log_debug_impl(&dword_1C9967000, v21, OS_LOG_TYPE_DEBUG, "Replaying APS message on topic %@: %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_handleMessage:onTopic:", v20, v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPendingPushes:", v22);

}

- (void)_handleMessage:(id)a3 onTopic:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FMAPSHandler__handleMessage_onTopic___block_invoke;
  block[3] = &unk_1E82AA710;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __39__FMAPSHandler__handleMessage_onTopic___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "registrationsSuspended") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_APS();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_INFO, "Registrations are suspended. Queueing the APS message for later use", buf, 2u);
    }

    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("topic"));
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("message"));
    objc_msgSend(*(id *)(a1 + 32), "pendingPushes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v2);

  }
  else
  {
    LogCategory_APS();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "registeredDelegates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v25 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1C9967000, v6, OS_LOG_TYPE_INFO, "Checking for a handler for the APS message from %lu registered delegates", buf, 0xCu);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "registeredDelegates");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v20;
      *(_QWORD *)&v9 = 138412290;
      v18 = v9;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v2);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "topic", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v15)
          {
            objc_msgSend(v13, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LogCategory_APS();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v18;
              v25 = (uint64_t)v16;
              _os_log_impl(&dword_1C9967000, v17, OS_LOG_TYPE_INFO, "Found delegate with matching topic %@", buf, 0xCu);
            }

            objc_msgSend(v16, "didReceiveAPSMessage:", *(_QWORD *)(a1 + 48));
          }
        }
        v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
  }

}

- (void)_setEnabledTopics:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMAPSHandler apsConnection](self, "apsConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setEnabledTopics:", v4);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FMAPSHandler *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "fm_hexString", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_APS();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[FMAPSHandler environmentName](self, "environmentName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1C9967000, v6, OS_LOG_TYPE_INFO, "Received updated APS token %@ for environment %@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke;
  v9[3] = &unk_1E82AA4B8;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  int8x16_t v4;
  _QWORD activity_block[4];
  int8x16_t v6;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    LogCategory_APS();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_cold_1(a1, v2);

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_32;
    activity_block[3] = &unk_1E82AA4B8;
    v4 = *(int8x16_t *)(a1 + 32);
    v3 = (id)v4.i64[0];
    v6 = vextq_s8(v4, v4, 8uLL);
    _os_activity_initiate(&dword_1C9967000, "APS token changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_32(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "registeredDelegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "didReceiveAPSToken:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  LogCategory_APS();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1C9967000, v9, OS_LOG_TYPE_INFO, "Received APS message on topic %@: %@", buf, 0x16u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __62__FMAPSHandler_connection_didReceiveMessageForTopic_userInfo___block_invoke;
  activity_block[3] = &unk_1E82AA710;
  activity_block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  _os_activity_initiate(&dword_1C9967000, "APS message received", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __62__FMAPSHandler_connection_didReceiveMessageForTopic_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMessage:onTopic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)registerForDarkWake
{
  return self->_registerForDarkWake;
}

- (void)setRegisterForDarkWake:(BOOL)a3
{
  self->_registerForDarkWake = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_apsConnection, a3);
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (void)setRegisteredDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDelegates, a3);
}

- (NSMutableArray)pendingPushes
{
  return self->_pendingPushes;
}

- (void)setPendingPushes:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPushes, a3);
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
  objc_storeStrong((id *)&self->_environmentName, a3);
}

- (BOOL)registrationsSuspended
{
  return self->_registrationsSuspended;
}

- (void)setRegistrationsSuspended:(BOOL)a3
{
  self->_registrationsSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pendingPushes, 0);
  objc_storeStrong((id *)&self->_registeredDelegates, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

void __42__FMAPSHandler_registerDelegate_forTopic___block_invoke_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "environmentName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1C9967000, v3, v4, "Not registering for topic %@ in environment %@ right now because registrations are suspended. Queueing it up.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1C9967000, a2, a3, "Updating list of topics after deregister: %@", (uint8_t *)&v3);
}

void __35__FMAPSHandler_deregisterDelegate___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "environmentName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1C9967000, v2, v3, "Attempting to deregister delegate %@ in environment %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __41__FMAPSHandler__registrationsWereResumed__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1C9967000, a2, a3, "Updating list of topics after suspension was removed: %@", (uint8_t *)&v3);
}

void __49__FMAPSHandler_connection_didReceivePublicToken___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "registeredDelegates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_0_1(&dword_1C9967000, a2, v4, "Notifying %lu delegates about the updated APS token", (uint8_t *)&v5);

}

@end
