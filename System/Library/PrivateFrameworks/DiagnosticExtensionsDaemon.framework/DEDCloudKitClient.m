@implementation DEDCloudKitClient

- (DEDCloudKitClient)initWithBugSession:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  DEDCloudKitClient *v8;
  void *v9;
  os_log_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DEDCloudKitClient;
  v8 = -[DEDCloudKitClient init](&v23, sel_init);
  if (v8)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create((const char *)objc_msgSend(v9, "loggingSubsystem"), "ded-cloudkit-client");
    -[DEDCloudKitClient setLog:](v8, "setLog:", v10);

    -[DEDCloudKitClient setBugSession:](v8, "setBugSession:", v6);
    -[DEDCloudKitClient setBugSessionConfig:](v8, "setBugSessionConfig:", v7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitClient setRecordsQueue:](v8, "setRecordsQueue:", v11);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitClient setPreviousRecordsQueue:](v8, "setPreviousRecordsQueue:", v12);

    objc_msgSend(v7, "cloudkitData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDCloudKitClient log](v8, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        objc_msgSend(v7, "cloudkitData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v16;
        _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "cloudkitData: %{public}@", buf, 0xCu);

      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "No additional CloudKit data was provided", buf, 2u);
    }

    if (objc_msgSend(v7, "cloudkitUseDevelopmentEnvironment"))
      v17 = 2;
    else
      v17 = 1;
    v18 = objc_alloc(MEMORY[0x24BDB9038]);
    objc_msgSend(v7, "cloudkitContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithContainerIdentifier:environment:", v19, v17);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v20);
    -[DEDCloudKitClient setContainer:](v8, "setContainer:", v21);

  }
  return v8;
}

- (void)addRawRecordToQueueFromModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DEDCloudKitClient recordsQueue](self, "recordsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitClient setPreviousRecordsQueue:](self, "setPreviousRecordsQueue:", v6);

}

- (void)flushQueue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[DEDCloudKitClient recordsQueue](self, "recordsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_4;
  -[DEDCloudKitClient previousRecordsQueue](self, "previousRecordsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[DEDCloudKitClient recordsQueue](self, "recordsQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "copy");
    -[DEDCloudKitClient setPreviousRecordsQueue:](self, "setPreviousRecordsQueue:", v6);

LABEL_4:
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DEDCloudKitClient setRecordsQueue:](self, "setRecordsQueue:", v7);

}

- (void)restoreQueue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[DEDCloudKitClient recordsQueue](self, "recordsQueue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    -[DEDCloudKitClient previousRecordsQueue](self, "previousRecordsQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      return;
    -[DEDCloudKitClient previousRecordsQueue](self, "previousRecordsQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[DEDCloudKitClient setRecordsQueue:](self, "setRecordsQueue:", v6);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[DEDCloudKitClient setPreviousRecordsQueue:](self, "setPreviousRecordsQueue:");
  }

}

- (void)executeOperationsAtomicallyWithProgressHandler:(id)a3 completionHandler:(id)a4 finalHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD handler[5];
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDCloudKitClient bugSession](self, "bugSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd.commit-file-%@-%@"), v12, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  v19 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __99__DEDCloudKitClient_executeOperationsAtomicallyWithProgressHandler_completionHandler_finalHandler___block_invoke;
  handler[3] = &unk_24D1E64F8;
  handler[4] = self;
  v25 = v17;
  v26 = v8;
  v27 = v9;
  v28 = v10;
  v20 = v10;
  v21 = v9;
  v22 = v8;
  v23 = v17;
  xpc_activity_register(v18, v19, handler);

}

void __99__DEDCloudKitClient_executeOperationsAtomicallyWithProgressHandler_completionHandler_finalHandler___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  NSObject *v6;
  xpc_activity_state_t v7;
  NSObject *v8;
  xpc_object_t v9;
  void *v10;
  NSObject *v11;
  xpc_activity_state_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  NSObject *v41;
  _BOOL4 v42;
  xpc_activity_state_t v43;
  const char *v44;
  uint64_t v45;
  xpc_activity_state_t v46;
  _xpc_activity_s *activity;
  void *v48;
  id obj;
  NSObject *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  xpc_activity_state_t v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v60 = v12;
      _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_RUN [%{public}@]", buf, 0xCu);
    }

    v13 = objc_alloc_init(MEMORY[0x24BDB9188]);
    -[NSObject setQualityOfService:](v13, "setQualityOfService:", 17);
    -[NSObject setAllowsCellularAccess:](v13, "setAllowsCellularAccess:", 1);
    -[NSObject setAllowsExpensiveNetworkAccess:](v13, "setAllowsExpensiveNetworkAccess:", 1);
    v50 = v13;
    activity = v3;
    -[NSObject setXPCActivity:](v13, "setXPCActivity:", v3);
    v14 = (void *)objc_opt_new();
    v48 = (void *)objc_opt_new();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "recordsQueue");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v20 = objc_alloc(MEMORY[0x24BDB9158]);
          objc_msgSend(v19, "cloudKitModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v21;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v20, "initWithRecordsToSave:recordIDsToDelete:", v22, 0);

          objc_msgSend(v23, "setConfiguration:", v50);
          v24 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
          objc_msgSend(v23, "setPerRecordProgressBlock:", v24);

          v25 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
          objc_msgSend(v23, "setPerRecordSaveBlock:", v25);

          v26 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
          objc_msgSend(v23, "setCompletionBlock:", v26);

          objc_msgSend(v19, "cloudKitModel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "recordID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            objc_msgSend(v48, "addObject:", v23);
            objc_msgSend(v19, "cloudKitModel");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "recordID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v19, v31);

          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v16);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v32 = v48;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 32), "container");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "publicCloudDatabase");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addOperation:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v34);
    }

    objc_msgSend(*(id *)(a1 + 32), "flushQueue");
    v3 = activity;
    v40 = xpc_activity_set_state(activity, 4);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v40)
    {
      v8 = v50;
      if (v42)
      {
        v43 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v60 = v43;
        v44 = "XPC_ACTIVITY_STATE_CONTINUE is set for [%{public}@]";
LABEL_34:
        _os_log_impl(&dword_21469E000, v41, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);
      }
    }
    else
    {
      v8 = v50;
      if (v42)
      {
        v46 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v60 = v46;
        v44 = "Failed to set XPC_ACTIVITY_STATE_CONTINUE for [%{public}@]";
        goto LABEL_34;
      }
    }

    goto LABEL_36;
  }
  v5 = state;
  if (state)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v60 = v5;
      v61 = 2114;
      v62 = v45;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "[%lu] not handled for activity [%{public}@]", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v60 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_CHECK_IN [%{public}@]", buf, 0xCu);
    }

    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    v9 = xpc_activity_copy_criteria(v3);
    v10 = v9;
    if (!v9 || !xpc_equal(v9, v8))
      xpc_activity_set_criteria(v3, v8);

  }
LABEL_36:

}

- (BOOL)stillHaveOperationsInQueue
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[DEDCloudKitClient container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "operationCount") != 0;

  return v5;
}

- (void)executeRecord:(id)a3 atomicallyWithProgressHandler:(id)a4 completionHandler:(id)a5 finalHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD handler[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DEDCloudKitClient bugSession](self, "bugSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%f"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd.commit-record-%@-%@"), v15, v19);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (const char *)objc_msgSend(v20, "UTF8String");
  v22 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __96__DEDCloudKitClient_executeRecord_atomicallyWithProgressHandler_completionHandler_finalHandler___block_invoke;
  handler[3] = &unk_24D1E6520;
  handler[4] = self;
  v29 = v20;
  v30 = v10;
  v31 = v11;
  v32 = v12;
  v33 = v13;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  v26 = v10;
  v27 = v20;
  xpc_activity_register(v21, v22, handler);

}

void __96__DEDCloudKitClient_executeRecord_atomicallyWithProgressHandler_completionHandler_finalHandler___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  NSObject *v6;
  xpc_activity_state_t v7;
  NSObject *v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  xpc_activity_state_t v18;
  const char *v19;
  uint64_t v20;
  xpc_activity_state_t v21;
  int v22;
  xpc_activity_state_t v23;
  __int16 v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDB9188]);
    -[NSObject setQualityOfService:](v8, "setQualityOfService:", 17);
    -[NSObject setAllowsCellularAccess:](v8, "setAllowsCellularAccess:", 1);
    -[NSObject setAllowsExpensiveNetworkAccess:](v8, "setAllowsExpensiveNetworkAccess:", 1);
    -[NSObject setXPCActivity:](v8, "setXPCActivity:", v3);
    v11 = objc_alloc(MEMORY[0x24BDB9158]);
    v26[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithRecordsToSave:recordIDsToDelete:", v12, 0);

    objc_msgSend(v13, "setConfiguration:", v8);
    objc_msgSend(v13, "setPerRecordProgressBlock:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v13, "setPerRecordSaveBlock:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v13, "setCompletionBlock:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "container");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "publicCloudDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v13);

    LODWORD(v15) = xpc_activity_set_state(v3, 4);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v15)
    {
      if (v17)
      {
        v18 = *(_QWORD *)(a1 + 40);
        v22 = 138543362;
        v23 = v18;
        v19 = "XPC_ACTIVITY_STATE_CONTINUE is set for [%{public}@]";
LABEL_16:
        _os_log_impl(&dword_21469E000, v16, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 0xCu);
      }
    }
    else if (v17)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = 138543362;
      v23 = v21;
      v19 = "Failed to set XPC_ACTIVITY_STATE_CONTINUE for [%{public}@]";
      goto LABEL_16;
    }

    goto LABEL_18;
  }
  v5 = state;
  if (state)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v22 = 134218242;
      v23 = v5;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "[%lu] not handled for activity [%{public}@]", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v22 = 138543362;
      v23 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_CHECK_IN [%{public}@]", (uint8_t *)&v22, 0xCu);
    }

    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    v9 = xpc_activity_copy_criteria(v3);
    v10 = v9;
    if (!v9 || !xpc_equal(v9, v8))
      xpc_activity_set_criteria(v3, v8);

  }
LABEL_18:

}

- (DEDBugSession)bugSession
{
  return self->_bugSession;
}

- (void)setBugSession:(id)a3
{
  objc_storeStrong((id *)&self->_bugSession, a3);
}

- (DEDBugSessionConfiguration)bugSessionConfig
{
  return self->_bugSessionConfig;
}

- (void)setBugSessionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_bugSessionConfig, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSMutableArray)recordsQueue
{
  return self->_recordsQueue;
}

- (void)setRecordsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recordsQueue, a3);
}

- (NSArray)previousRecordsQueue
{
  return self->_previousRecordsQueue;
}

- (void)setPreviousRecordsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_previousRecordsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRecordsQueue, 0);
  objc_storeStrong((id *)&self->_recordsQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bugSessionConfig, 0);
  objc_storeStrong((id *)&self->_bugSession, 0);
}

@end
