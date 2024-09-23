@implementation CloudKitUploadController

- (CloudKitUploadController)initWithWorkspace:(id)a3
{
  id v4;
  CloudKitUploadController *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD v11[4];
  CloudKitUploadController *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CloudKitUploadController;
  v5 = -[CloudKitUploadController init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.autobugcapture.CKUpload", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = v5->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__CloudKitUploadController_initWithWorkspace___block_invoke;
    v11[3] = &unk_1EA3B5010;
    v12 = v5;
    v13 = v4;
    dispatch_sync(v9, v11);

  }
  return v5;
}

uint64_t __46__CloudKitUploadController_initWithWorkspace___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureWorkspace:", *(_QWORD *)(a1 + 40));
}

- (void)configureWorkspace:(id)a3
{
  id v4;
  NSObject *v5;
  AnalyticsWorkspace *v6;
  AnalyticsWorkspace *workspace;
  DiagnosticCaseStorageAnalytics *v8;
  DiagnosticCaseStorageAnalytics *caseStorageAnalytics;
  DiagnosticCaseSummaryAnalytics *v10;
  DiagnosticCaseSummaryAnalytics *caseSummaryAnalytics;
  UploadRecordAnalytics *v12;
  UploadRecordAnalytics *uploadRecordAnalytics;
  uint8_t v14[16];

  v4 = a3;
  uploadLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "Configuring CoreData workspace", v14, 2u);
  }

  v6 = (AnalyticsWorkspace *)objc_msgSend(v4, "copy");
  workspace = self->_workspace;
  self->_workspace = v6;

  v8 = -[DiagnosticCaseStorageAnalytics initWithWorkspace:withCache:]([DiagnosticCaseStorageAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
  caseStorageAnalytics = self->_caseStorageAnalytics;
  self->_caseStorageAnalytics = v8;

  v10 = -[DiagnosticCaseSummaryAnalytics initWithWorkspace:withCache:]([DiagnosticCaseSummaryAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  self->_caseSummaryAnalytics = v10;

  v12 = -[UploadRecordAnalytics initWithWorkspace:withCache:]([UploadRecordAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
  uploadRecordAnalytics = self->_uploadRecordAnalytics;
  self->_uploadRecordAnalytics = v12;

}

- (id)_fetchCasesInternal:(id)a3 limit:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DiagnosticCaseStorageAnalytics *caseStorageAnalytics;
  void *v18;
  void *v19;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uploadState == %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("timeStamp >= %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDampeningType == %d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseClosureType == %d OR caseClosureType == %d OR caseClosureType == %d"), 1, 5, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseAttachments != nil"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("attachmentsIncomplete != %@"), MEMORY[0x1E0C9AAB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, v10, v11, v12, v13, v14, v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  caseStorageAnalytics = self->_caseStorageAnalytics;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timeStamp"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:limit:](caseStorageAnalytics, "fetchEntitiesFreeForm:sortDesc:limit:", v16, v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)fetchRecentCasesPendingUpload:(unint64_t)a3
{
  return -[CloudKitUploadController _fetchCasesInternal:limit:](self, "_fetchCasesInternal:limit:", 0, a3);
}

- (id)fetchCasesWithIdentifiers:(id)a3 limit:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[CloudKitUploadController _fetchCasesInternal:limit:](self, "_fetchCasesInternal:limit:", v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_save
{
  NSObject *v3;
  uint8_t v4[16];

  uploadLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Saving...", v4, 2u);
  }

  -[AnalyticsWorkspace save](self->_workspace, "save");
}

- (void)save
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD handler[6];
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  uploadLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Scheduling delayed save", buf, 2u);
  }

  v4 = v17[5];
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = (void *)v17[5];
    v17[5] = 0;

  }
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v7 = (void *)v17[5];
  v17[5] = (uint64_t)v6;

  v8 = v17[5];
  v9 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  v10 = v17[5];
  v11 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __32__CloudKitUploadController_save__block_invoke;
  handler[3] = &unk_1EA3B54A8;
  handler[4] = self;
  handler[5] = &v16;
  dispatch_source_set_event_handler(v10, handler);
  v12 = v17[5];
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __32__CloudKitUploadController_save__block_invoke_2;
  v13[3] = &unk_1EA3B7370;
  v13[4] = &v16;
  dispatch_source_set_cancel_handler(v12, v13);
  dispatch_activate((dispatch_object_t)v17[5]);
  _Block_object_dispose(&v16, 8);

}

uint64_t __32__CloudKitUploadController_save__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __32__CloudKitUploadController_save__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  uploadLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cancelling delay timer", v5, 2u);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)locallyFilterCases:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    uploadLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "Locally filtering cases ineligible for uploading...", buf, 2u);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v7)
    {
      v8 = v7;
      obj = v6;
      v26 = v4;
      v9 = 0;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v12, "uploadRecord");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            uploadLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "caseID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v34 = v15;
              _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Creating new upload record for case %@", buf, 0xCu);

            }
            -[ObjectAnalytics createEntity](self->_uploadRecordAnalytics, "createEntity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setCaseStorage:", v12);
            v9 = 1;
          }
          v16 = (int)objc_msgSend(v13, "uploadState") >= 1 && objc_msgSend(v13, "uploadState") != 4;
          objc_msgSend(v13, "operationID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 || v17)
          {
            uploadLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "caseID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                v20 = "Yes";
              else
                v20 = "No";
              v21 = objc_msgSend(v13, "uploadState");
              *(_DWORD *)buf = 138544130;
              v22 = "No";
              if (v17)
                v22 = "Yes";
              v34 = v19;
              v35 = 2080;
              v36 = v20;
              v37 = 1024;
              v38 = v21;
              v39 = 2080;
              v40 = v22;
              _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "Skipping case %{public}@ as it's already uploading, or has been uploaded. (alreadyScheduled: %s(%d), hasOperation: %s)", buf, 0x26u);

            }
          }
          else if (-[CloudKitUploadController validateCaseAttachmentsForDiagnosticCaseStorage:record:](self, "validateCaseAttachmentsForDiagnosticCaseStorage:record:", v12, v13))
          {
            objc_msgSend(v27, "addObject:", v12);
          }
          else
          {
            objc_msgSend(v12, "setUploadState:", 3);
            objc_msgSend(v13, "setUploadState:", 1);
            uploadLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "caseID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v34 = v24;
              _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEFAULT, "Case %{public}@ is missing required files. Marked as ineligible for upload.)", buf, 0xCu);

            }
            v9 = 1;
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v8);

      if ((v9 & 1) != 0)
        -[CloudKitUploadController save](self, "save");
      v4 = v26;
    }
    else
    {

    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)filterCasesPendingUpload:(id)a3 activity:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  CloudKitUploadController *v17;
  id v18;
  void (**v19)(id, _QWORD);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    -[CloudKitUploadController locallyFilterCases:](self, "locallyFilterCases:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      if (v9 && xpc_activity_should_defer((xpc_activity_t)v9))
      {
        uploadLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "Stopping before decision server check due to activity deferral", buf, 2u);
        }

        -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v9);
        v10[2](v10, 0);
      }
      else
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke;
        v15[3] = &unk_1EA3B7398;
        v16 = v9;
        v17 = self;
        v19 = v10;
        v18 = v11;
        -[CloudKitUploadController filterCasesViaCloudkitDecisionService:activity:response:](self, "filterCasesViaCloudkitDecisionService:activity:response:", v18, v16, v15);

      }
    }
    else
    {
      uploadLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Skipping decision service check since the pruned cases list is empty", buf, 2u);
      }

      ((void (**)(id, void *))v10)[2](v10, v11);
    }

  }
  else
  {
    uploadLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Skipping decision service check since we received an empty case list", buf, 2u);
    }

    ((void (**)(id, id))v10)[2](v10, v8);
  }

}

void __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _xpc_activity_s *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint8_t v44[4];
  uint64_t v45;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_xpc_activity_s **)(a1 + 32);
  if (v7 && xpc_activity_should_defer(v7))
  {
    uploadLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Stopping log uploads due to activity deferral", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "deferXPCActivity:", *(_QWORD *)(a1 + 32));
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_78;
    block[3] = &unk_1EA3B4A28;
    v10 = *(id *)(a1 + 56);
    v42 = 0;
    v43 = v10;
    dispatch_async(v9, block);

    v11 = v43;
    goto LABEL_30;
  }
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v13 = objc_msgSend(v6, "code");

      if (v13 == 89)
      {
        uploadLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, "CloudKit cancelled the decision service operation. Ending upload task.", (uint8_t *)&buf, 2u);
        }
        v15 = 0;
LABEL_22:

        v26 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_80;
        v38[3] = &unk_1EA3B4A28;
        v27 = *(id *)(a1 + 56);
        v39 = v15;
        v40 = v27;
        v11 = v15;
        dispatch_async(v26, v38);

        goto LABEL_30;
      }
    }
    else
    {

    }
    uploadLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "Decision service responded with an error: %@", (uint8_t *)&buf, 0xCu);
    }

    v21 = *(void **)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "configurationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "randomlySelectCasesFrom:maximum:", v22, objc_msgSend(v24, "cloudKitFallbackMaximumLogCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    uploadLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v15, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, "Proceeding to upload %ld cases with only local filtering", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_22;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("summary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "BOOLValue"))
    {
      v18 = *(id *)(a1 + 48);
      uploadLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, "Decision service permitted upload for ALL cases.", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      uploadLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_DEFAULT, "Decision service declined upload for ALL cases.", (uint8_t *)&buf, 2u);
      }

      v18 = 0;
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__6;
    v49 = __Block_byref_object_dispose__6;
    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_2;
    v37[3] = &unk_1EA3B5A60;
    v37[4] = &buf;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v37);
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v28);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    uploadLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v18, "count");
      *(_DWORD *)v44 = 134217984;
      v45 = v30;
      _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_DEFAULT, "Decision service permitted upload for %ld cases.", v44, 0xCu);
    }

    _Block_object_dispose(&buf, 8);
  }
  v32 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_86;
  v34[3] = &unk_1EA3B4A28;
  v33 = *(id *)(a1 + 56);
  v35 = v18;
  v36 = v33;
  v11 = v18;
  dispatch_async(v32, v34);

LABEL_30:
}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "isEqualToString:", CFSTR("summary")) & 1) == 0)
    {
      if (objc_msgSend(v6, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), v5);
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
        uploadLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v5;
          _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, " Adding predicate for caseID == %@", buf, 0xCu);
        }

      }
      else
      {
        uploadLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v5;
          _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, " Skipping caseID %@ (server denied)", buf, 0xCu);
        }
      }

    }
  }

}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)logUploadRequiresConsent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  v3 = a3;
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autoBugCaptureUploadPreapproved");

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "hasSuffix:", CFSTR(".pcapng"));

  return v7;
}

- (id)randomlySelectCasesFrom:(id)a3 maximum:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  uint32_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
  {
    if (objc_msgSend(v5, "count") >= a4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "count");
      uploadLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v20 = a4;
        v21 = 1024;
        v22 = v8;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Randomly choosing %ld out of %d cases for upload", buf, 0x12u);
      }

      if (objc_msgSend(v7, "count") < a4)
      {
        v10 = 3 * v8 + 2;
        while (1)
        {
          objc_msgSend(v6, "objectAtIndex:", arc4random_uniform(v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v7, "containsObject:", v11);
          uploadLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
          if (v12)
          {
            if (v14)
            {
              objc_msgSend(v11, "caseID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v20 = (unint64_t)v15;
              _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Already chose case %@, skipping...", buf, 0xCu);

            }
          }
          else
          {
            if (v14)
            {
              objc_msgSend(v11, "caseID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v20 = (unint64_t)v16;
              _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Selecting case %@ for upload", buf, 0xCu);

            }
            objc_msgSend(v7, "addObject:", v11);
          }
          if (!--v10)
            break;

          if (objc_msgSend(v7, "count") >= a4)
            goto LABEL_22;
        }
        uploadLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v20 = 3 * v8;
          _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "Randomization retry count exceeded reasonable threshold (%ld). Bailing out!", buf, 0xCu);
        }

      }
    }
    else
    {
      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_22:

  return v7;
}

- (BOOL)validateCaseAttachmentsForDiagnosticCaseStorage:(id)a3 record:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  CloudKitUploadController *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  void *context;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  uploadLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "caseID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = (uint64_t)v10;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Preflighting attachments for case %@", buf, 0xCu);

    }
    context = (void *)MEMORY[0x1DF0B6314]();
    objc_msgSend(v6, "caseAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v6;
    if (v13)
    {
      objc_msgSend(v7, "fileURLs");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "setFileURLs:", v14);
    }

    objc_msgSend(v7, "setTotalBytes:", 0);
    v50 = v7;
    objc_msgSend(v7, "setNumberOfFiles:", 0);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      v51 = *MEMORY[0x1E0C99998];
      v20 = 0x1E0C99000uLL;
      v52 = v16;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(v20 + 3736), "URLWithString:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[CloudKitUploadController logUploadRequiresConsent:](self, "logUploadRequiresConsent:", v23))
          {
            v25 = self;
            objc_msgSend(v22, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v53, "fileExistsAtPath:", v26);

            uploadLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            v24 = v28;
            if (v27)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v22, "absoluteString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v62 = (uint64_t)v29;
                _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_INFO, "  Attachment file exists: %@", buf, 0xCu);

              }
              v54 = 0;
              v55 = 0;
              v30 = objc_msgSend(v22, "getResourceValue:forKey:error:", &v55, v51, &v54);
              v24 = v55;
              v31 = v54;
              uploadLogHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v30)
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v34 = -[NSObject integerValue](v24, "integerValue");
                  *(_DWORD *)buf = 134217984;
                  v62 = v34;
                  _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_INFO, "  File size is: %ld", buf, 0xCu);
                }

                if (-[NSObject integerValue](v24, "integerValue"))
                {
                  objc_msgSend(v50, "setTotalBytes:", objc_msgSend(v50, "totalBytes") + -[NSObject unsignedIntegerValue](v24, "unsignedIntegerValue"));
                  objc_msgSend(v50, "setNumberOfFiles:", (__int16)(objc_msgSend(v50, "numberOfFiles") + 1));
                  v35 = v50;
                  goto LABEL_31;
                }
                uploadLogHandle();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DBAE1000, v37, OS_LOG_TYPE_INFO, "  Ignoring attachment with zero file size.", buf, 2u);
                }
              }
              else
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v62 = (uint64_t)v31;
                  _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEFAULT, "  Error getting file size: %@", buf, 0xCu);
                }

                objc_msgSend(v50, "setNumberOfFiles:", (__int16)(objc_msgSend(v50, "numberOfFiles") + 1));
                v35 = v50;
LABEL_31:
                objc_msgSend(v35, "fileURLs");
                v37 = objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v37, "addObject:", v22);
              }

              v16 = v52;
            }
            else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v22, "absoluteString");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v62 = (uint64_t)v36;
              _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_ERROR, "Attachment file at path %@ does not exist.", buf, 0xCu);

            }
            self = v25;
            v20 = 0x1E0C99000;
            goto LABEL_34;
          }
          uploadLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEFAULT, "Privacy sensitive log content cannot be uploaded.", buf, 2u);
          }
LABEL_34:

          ++v21;
        }
        while (v18 != v21);
        v38 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        v18 = v38;
      }
      while (v38);
    }

    v7 = v50;
    objc_msgSend(v50, "fileURLs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");
    v41 = objc_msgSend(v16, "count");

    v15 = v40 == v41;
    if (v40 == v41)
    {
      objc_msgSend(v50, "setPreflightResult:", 1);
      uploadLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v53;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v42, OS_LOG_TYPE_INFO, "Preflight successful: all files for this case are available", buf, 2u);
      }
      v6 = v49;
      goto LABEL_50;
    }
    objc_msgSend(v50, "fileURLs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    v43 = v53;
    if (v45)
    {
      objc_msgSend(v50, "setPreflightResult:", 2);
      uploadLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      v6 = v49;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v46 = "Preflight failed: some files for this case are unavailable";
LABEL_49:
        _os_log_impl(&dword_1DBAE1000, v42, OS_LOG_TYPE_ERROR, v46, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v50, "setPreflightResult:", 3);
      uploadLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      v6 = v49;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v46 = "Preflight failed: all files for this case are unavailable";
        goto LABEL_49;
      }
    }
LABEL_50:

    objc_autoreleasePoolPop(context);
    goto LABEL_51;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Cannot validate attachments for a nil caseStorage!", buf, 2u);
  }

  v15 = 0;
LABEL_51:

  return v15;
}

- (void)recordOperationCompleteForOperationID:(id)a3 completionTime:(id)a4 success:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  UploadRecordAnalytics *uploadRecordAnalytics;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE *v18;
  BOOL v19;
  _BYTE buf[24];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("operationID == %@"), v8);
    v10 = objc_claimAutoreleasedReturnValue();
    uploadRecordAnalytics = self->_uploadRecordAnalytics;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startTime"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:limit:](uploadRecordAnalytics, "fetchEntitiesFreeForm:sortDesc:limit:", v10, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    uploadLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v13, "count");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Found %ld records with matching operationID %@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__CloudKitUploadController_recordOperationCompleteForOperationID_completionTime_success___block_invoke;
    v15[3] = &unk_1EA3B73C0;
    v19 = a5;
    v16 = v9;
    v18 = buf;
    v17 = v8;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      -[CloudKitUploadController save](self, "save");

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uploadLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Not expecting a nil operation ID!", buf, 2u);
    }
  }

}

void __89__CloudKitUploadController_recordOperationCompleteForOperationID_completionTime_success___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[NSObject setOperationID:](v4, "setOperationID:", 0);
    if (*(_BYTE *)(a1 + 56))
      v5 = 3;
    else
      v5 = 4;
    -[NSObject setUploadState:](v4, "setUploadState:", v5);
    if (*(_BYTE *)(a1 + 56))
    {
      -[NSObject caseStorage](v4, "caseStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUploadState:", 4);

    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = v4;
    }
    else
    {
      -[NSObject setStartTime:](v4, "setStartTime:");
      v8 = v4;
      v7 = 0;
    }
    -[NSObject setFinishTime:](v8, "setFinishTime:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    uploadLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "Recording completion for upload record %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    uploadLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "Unexpected class %@ for object with operationID %@ (expecting UploadRecord)", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (id)currentCloudKitContainerForEnvironment:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudKitContainerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", v6, a3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v7);
  uploadLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = "Production";
    if (a3 == 2)
      v10 = "Sandbox";
    v12 = 138412546;
    v13 = v6;
    v14 = 2080;
    v15 = v10;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Returning CKContainer with identifier \"%@\" in the %s environment", (uint8_t *)&v12, 0x16u);
  }

  return v8;
}

- (id)uploadOperationWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 allowCellular:(BOOL)a5 activity:(id)a6
{
  _BOOL8 v6;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v6 = a5;
  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0C94F10];
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithRecordsToSave:recordIDsToDelete:", v12, v11);

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "cloudKitPrefersAnonymous");
  objc_msgSend(v13, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferAnonymousRequests:", v16);

  objc_msgSend(v13, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsCellularAccess:", v6);

  objc_msgSend(v13, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAutomaticallyRetryNetworkFailures:", 1);

  objc_msgSend(v13, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDiscretionaryNetworkBehavior:", 0);

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cloudKitTimeoutIntervalForResource");
  v24 = v23;
  objc_msgSend(v13, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTimeoutIntervalForResource:", v24);

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configurationManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cloudKitTimeoutIntervalForRequest");
  v29 = v28;
  objc_msgSend(v13, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTimeoutIntervalForRequest:", v29);

  if (v9)
  {
    objc_msgSend(v13, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setXpcActivity:", v9);

  }
  return v13;
}

- (void)uploadToCloudKitContainer:(id)a3 withRecords:(id)a4 activity:(id)a5
{
  id v7;
  _xpc_activity_s *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  __int128 v87;
  id obj;
  void *v89;
  void *v90;
  _xpc_activity_s *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v96;
  void *v97;
  unsigned int v98;
  id v99;
  uint64_t v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[5];
  id v107;
  _xpc_activity_s *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t v117[128];
  uint8_t buf[4];
  uint64_t v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v94 = a3;
  v7 = a4;
  v8 = (_xpc_activity_s *)a5;
  uploadLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "Resetting outstanding operation count to zero", buf, 2u);
  }

  self->_outstandingOperationCount = 0;
  self->_aggregateOperationResult = 1;
  uploadLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v119 = v11;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Ready to upload %ld cases", buf, 0xCu);
  }

  v115 = 0u;
  v116 = 0u;
  v114 = 0u;
  v113 = 0u;
  obj = v7;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
  if (v93)
  {
    v13 = 0x1E0C99000uLL;
    v92 = *(_QWORD *)v114;
    *(_QWORD *)&v12 = 134217984;
    v87 = v12;
    v91 = v8;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v114 != v92)
          objc_enumerationMutation(obj);
        v105 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v14);
        if (v8 && xpc_activity_should_defer(v8))
        {
          uploadLogHandle();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v86, OS_LOG_TYPE_DEFAULT, "Stopping log uploads due to activity defer", buf, 2u);
          }

          -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v8);
          goto LABEL_57;
        }
        v100 = v14;
        v102 = objc_alloc_init(*(Class *)(v13 + 3560));
        +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v15, "npiDevice");

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("ABCCase"));
        +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc_init(*(Class *)(v13 + 3560));
        objc_msgSend(v105, "caseStorage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "caseID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("caseID"));

        objc_msgSend(v105, "caseStorage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "caseGroupID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("caseGroupID"));

        objc_msgSend(v105, "caseStorage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeStamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("caseDetectionTime"));

        objc_msgSend(v105, "caseStorage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "caseDomain");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("caseDomain"));

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseDomain"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v103 = v17;
        if (v26)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseDomain"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v27);

        }
        else
        {
          objc_msgSend(v17, "addObject:", &stru_1EA3B8F58);
        }
        objc_msgSend(v105, "caseStorage", v87);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "caseType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, CFSTR("caseType"));

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseType"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseType"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v31);

        }
        else
        {
          objc_msgSend(v17, "addObject:", &stru_1EA3B8F58);
        }
        objc_msgSend(v105, "caseStorage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "caseSubtype");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v33, CFSTR("caseSubtype"));

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseSubtype"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseSubtype"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v17;
          objc_msgSend(v17, "addObject:", v35);

        }
        else
        {
          v36 = v17;
          objc_msgSend(v17, "addObject:", &stru_1EA3B8F58);
        }
        objc_msgSend(v105, "caseStorage");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "caseSubtypeContext");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v38, CFSTR("caseSubtypeContext"));

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseSubtypeContext"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseSubtypeContext"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v40);

        }
        else
        {
          objc_msgSend(v36, "addObject:", &stru_1EA3B8F58);
        }
        objc_msgSend(v105, "caseStorage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "caseDetectedProcess");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v42, CFSTR("caseProcess"));

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseProcess"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("caseProcess"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v44);

        }
        else
        {
          objc_msgSend(v36, "addObject:", &stru_1EA3B8F58);
        }
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("^"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v45, CFSTR("caseSignature"));

        objc_msgSend(v105, "caseStorage");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "buildVersion");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v47)
        {
          v49 = v47;
        }
        else
        {
          objc_msgSend(v101, "buildVersion");
          v49 = (id)objc_claimAutoreleasedReturnValue();
        }
        v50 = v49;

        objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CFSTR("build"));
        if ((unint64_t)objc_msgSend(v50, "length") >= 4)
        {
          objc_msgSend(v50, "substringToIndex:", 3);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, CFSTR("buildPrefix"));

        }
        objc_msgSend(v105, "caseStorage");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "buildVariant");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v16;
        v97 = v50;
        if (v53)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, CFSTR("buildVariant"));
        }
        else
        {
          objc_msgSend(v101, "buildVariant");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "setObject:forKeyedSubscript:", v54, CFSTR("buildVariant"));

          v16 = v104;
        }

        objc_msgSend(v101, "buildPlatform");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v55, CFSTR("buildPlatform"));

        objc_msgSend(v101, "productType");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v56, CFSTR("deviceModel"));

        objc_msgSend(v101, "deviceClassString");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v57, CFSTR("deviceCategory"));

        uploadLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseID"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseDomain"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseType"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseSubtype"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseSubtypeContext"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("caseProcess"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("build"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("buildVariant"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("deviceModel"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414338;
          v119 = (uint64_t)v90;
          v120 = 2112;
          v121 = v96;
          v122 = 2112;
          v123 = v59;
          v124 = 2112;
          v125 = v60;
          v126 = 2112;
          v127 = v61;
          v128 = 2112;
          v129 = v89;
          v130 = 2112;
          v131 = v62;
          v132 = 2112;
          v133 = v63;
          v134 = 2112;
          v135 = v64;
          _os_log_impl(&dword_1DBAE1000, v58, OS_LOG_TYPE_DEBUG, "Creating case record for %@ : [%@/%@/%@/%@/%@] (%@/%@/%@)", buf, 0x5Cu);

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        objc_msgSend(v105, "fileURLs");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v110;
          do
          {
            for (i = 0; i != v69; ++i)
            {
              if (*(_QWORD *)v110 != v70)
                objc_enumerationMutation(v67);
              v72 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
              uploadLogHandle();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v119 = (uint64_t)v72;
                _os_log_impl(&dword_1DBAE1000, v73, OS_LOG_TYPE_INFO, "Creating asset for attachment %@", buf, 0xCu);
              }

              v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v72);
              objc_msgSend(v65, "addObject:", v74);
              objc_msgSend(v72, "lastPathComponent");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "addObject:", v75);

            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
          }
          while (v69);
        }

        uploadLogHandle();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          v77 = objc_msgSend(v65, "count");
          *(_DWORD *)buf = v87;
          v119 = v77;
          _os_log_impl(&dword_1DBAE1000, v76, OS_LOG_TYPE_DEBUG, "Adding %ld assets to case record", buf, 0xCu);
        }

        objc_msgSend(v104, "setObject:forKeyedSubscript:", v65, CFSTR("attachments"));
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v66, CFSTR("attachmentFilenames"));
        objc_msgSend(v102, "addObject:", v104);
        -[CloudKitUploadController uploadOperationWithRecordsToSave:recordIDsToDelete:allowCellular:activity:](self, "uploadOperationWithRecordsToSave:recordIDsToDelete:allowCellular:activity:", v102, 0, v98, v91);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "operationID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "setOperationID:", v79);

        objc_msgSend(v105, "setAllowsCellular:", v98);
        objc_msgSend(v78, "operationID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __75__CloudKitUploadController_uploadToCloudKitContainer_withRecords_activity___block_invoke;
        v106[3] = &unk_1EA3B73E8;
        v106[4] = self;
        v107 = v80;
        v108 = v91;
        v99 = v80;
        objc_msgSend(v78, "setModifyRecordsCompletionBlock:", v106);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "setStartTime:", v81);

        objc_msgSend(v105, "setUploadState:", 2);
        +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "configurationManager");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v83, "cloudKitSandboxEnvironment"))
          v84 = 2;
        else
          v84 = 1;
        v8 = v91;
        objc_msgSend(v105, "setEnvironment:", v84);

        ++self->_outstandingOperationCount;
        objc_msgSend(v94, "publicCloudDatabase");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "addOperation:", v78);

        v14 = v100 + 1;
        v13 = 0x1E0C99000;
      }
      while (v100 + 1 != v93);
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
      if (v93)
        continue;
      break;
    }
  }
LABEL_57:

  -[CloudKitUploadController save](self, "save");
}

void __75__CloudKitUploadController_uploadToCloudKitContainer_withRecords_activity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a4;
  v8 = a3;
  v9 = a2;
  uploadLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Completion callback for CloudKit upload operations", v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "operationCompletedWithID:savedRecords:deletedRecords:error:activity:", *(_QWORD *)(a1 + 40), v9, v8, v7, *(_QWORD *)(a1 + 48));
}

- (void)operationCompletedWithID:(id)a3 savedRecords:(id)a4 deletedRecords:(id)a5 error:(id)a6 activity:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *queue;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  _QWORD block[5];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  NSObject *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uploadLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v40 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "Upload operation complete for %ld records", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v18 = "alwaysonpcap" + 3;
  if (v13)
  {
    objc_msgSend(v13, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v37[0] = v17;
      v37[1] = 3221225472;
      v37[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke;
      v37[3] = &unk_1EA3B5900;
      v38 = v11;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v37);
      v21 = v38;
    }
    else
    {
      uploadLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v40 = (uint64_t)v11;
        v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "Failed upload operation %@ with error: %@", buf, 0x16u);
      }
    }
    v22 = v12;

    v23 = -[CloudKitUploadController shouldDeferFromCloudKitError:](self, "shouldDeferFromCloudKitError:", v13);
    v18 = "aysonpcap";
  }
  else
  {
    v22 = v12;
    v23 = 0;
  }
  queue = self->_queue;
  block[0] = v17;
  v25 = *((_QWORD *)v18 + 123);
  block[1] = v25;
  block[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_148;
  block[3] = &unk_1EA3B7410;
  block[4] = self;
  v34 = v11;
  v35 = v15;
  v36 = v13 == 0;
  v26 = v15;
  v27 = v11;
  dispatch_async(queue, block);
  if (v14 && v23)
    -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v14);
  v28 = self->_queue;
  v30[0] = v17;
  v30[1] = v25;
  v30[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_2;
  v30[3] = &unk_1EA3B6068;
  v32 = v13 == 0;
  v30[4] = self;
  v31 = v14;
  v29 = v14;
  dispatch_async(v28, v30);

}

void __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  uploadLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to upload record %@ with error %@", (uint8_t *)&v9, 0x20u);
  }

}

uint64_t __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_148(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recordOperationCompleteForOperationID:completionTime:success:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 56);
  if (v3)
    v3 = *(_BYTE *)(a1 + 48) != 0;
  *(_BYTE *)(v2 + 56) = v3;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  uploadLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
    {
LABEL_7:

      return;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v17 = 134217984;
    v18 = v7;
    v8 = "Waiting for %ld outstanding operations...";
    v9 = v5;
    v10 = 12;
LABEL_6:
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, v10);
    goto LABEL_7;
  }
  if (v6)
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "No more outstanding CKOperations remaining", (uint8_t *)&v17, 2u);
  }

  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  uploadLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (!v13)
      goto LABEL_16;
    LOWORD(v17) = 0;
    v14 = "All upload operations completed successfully.";
  }
  else
  {
    if (!v13)
      goto LABEL_16;
    LOWORD(v17) = 0;
    v14 = "All upload operations completed, but one or more operations failed with an error.";
  }
  _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 2u);
LABEL_16:

  v15 = *(_QWORD *)(a1 + 40);
  uploadLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (!v15)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v17) = 0;
    v8 = "XPC activity not set for this CKOperation";
    v9 = v5;
    v10 = 2;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "Ready to set activity state to Done", (uint8_t *)&v17, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishXPCActivity:", *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldDeferFromCloudKitError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v16;
  __int16 v17;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 == 20)
    {
      objc_msgSend(v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v5);

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      v11 = objc_msgSend(v8, "code");
      LOBYTE(v10) = v11 != 130;
      if (v11 == 130)
      {
        uploadLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v17 = 0;
        v13 = "Activity passed to CloudKit is not in the expected Continue state";
        v14 = (uint8_t *)&v17;
      }
      else
      {
        if (objc_msgSend(v8, "code") != 131)
        {
          LOBYTE(v10) = 0;
          goto LABEL_13;
        }
        uploadLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v16 = 0;
        v13 = "CloudKit informed us to defer the current activity";
        v14 = (uint8_t *)&v16;
      }
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
LABEL_9:

      goto LABEL_13;
    }
  }
  else
  {

  }
  LOBYTE(v10) = 0;
LABEL_14:

  return v10;
}

- (void)deferXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  _xpc_activity_s *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      uploadLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = v4;
        v6 = "Activity state is already set to defer (%p)";
        v7 = v5;
        v8 = OS_LOG_TYPE_INFO;
LABEL_10:
        _os_log_impl(&dword_1DBAE1000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = xpc_activity_set_state(v4, 3);
      uploadLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v5 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 134217984;
          v12 = v4;
          v6 = "Set activity state to DEFER (%p)";
          v7 = v5;
          v8 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_10;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 134217984;
        v12 = v4;
        v6 = "Unable to set activity state to DEFER! (%p)";
        v7 = v5;
        v8 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }

  }
}

- (void)finishXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  _xpc_activity_s *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 4)
    {
      v5 = xpc_activity_set_state(v4, 5);
      uploadLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134217984;
          v13 = v4;
          v8 = "Set activity state to DONE (%p)";
          v9 = v7;
          v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
          v11 = 12;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = 134217984;
        v13 = v4;
        v8 = "Unable to set activity state to DONE! (%p)";
        v9 = v7;
        v10 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }
    else
    {
      uploadLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v8 = "XPC activity is not in Continue state. Will not change the state to DONE";
        v9 = v7;
        v10 = OS_LOG_TYPE_DEFAULT;
        v11 = 2;
LABEL_11:
        _os_log_impl(&dword_1DBAE1000, v9, v10, v8, (uint8_t *)&v12, v11);
      }
    }

  }
}

- (void)uploadDiagnosticCases:(id)a3 activity:(id)a4
{
  id v6;
  _xpc_activity_s *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (_xpc_activity_s *)a4;
  if (objc_msgSend(v6, "count"))
  {
    if (v7 && xpc_activity_should_defer(v7))
    {
      uploadLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Will not start log uploads due to activity defer", buf, 2u);
      }

      -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v7);
    }
    else
    {
      uploadLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = objc_msgSend(v6, "count");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "Will attempt to upload %ld cases: %@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v17 = __Block_byref_object_copy__6;
      v18 = __Block_byref_object_dispose__6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__CloudKitUploadController_uploadDiagnosticCases_activity___block_invoke;
      v15[3] = &unk_1EA3B5C40;
      v15[4] = self;
      v15[5] = buf;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "cloudKitSandboxEnvironment"))
        v12 = 2;
      else
        v12 = 1;
      -[CloudKitUploadController currentCloudKitContainerForEnvironment:](self, "currentCloudKitContainerForEnvironment:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[CloudKitUploadController uploadToCloudKitContainer:withRecords:activity:](self, "uploadToCloudKitContainer:withRecords:activity:", v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v7);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    uploadLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "No cases were requested to be uploaded (empty list)", buf, 2u);
    }

    if (v7)
      -[CloudKitUploadController finishXPCActivity:](self, "finishXPCActivity:", v7);
  }

}

void __59__CloudKitUploadController_uploadDiagnosticCases_activity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "uploadRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "createEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCaseStorage:", v6);
  }
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v6, "uploadRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)performUploadForCaseIdentifiers:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CloudKitUploadController fetchCasesWithIdentifiers:limit:](self, "fetchCasesWithIdentifiers:limit:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__CloudKitUploadController_performUploadForCaseIdentifiers___block_invoke;
  v5[3] = &unk_1EA3B6560;
  v5[4] = self;
  -[CloudKitUploadController filterCasesPendingUpload:activity:reply:](self, "filterCasesPendingUpload:activity:reply:", v4, 0, v5);

}

uint64_t __60__CloudKitUploadController_performUploadForCaseIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadDiagnosticCases:activity:", a2, 0);
}

- (void)performUploadForRecentCases:(unint64_t)a3
{
  void *v4;
  _QWORD v5[5];

  -[CloudKitUploadController fetchRecentCasesPendingUpload:](self, "fetchRecentCasesPendingUpload:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CloudKitUploadController_performUploadForRecentCases___block_invoke;
  v5[3] = &unk_1EA3B6560;
  v5[4] = self;
  -[CloudKitUploadController filterCasesPendingUpload:activity:reply:](self, "filterCasesPendingUpload:activity:reply:", v4, 0, v5);

}

uint64_t __56__CloudKitUploadController_performUploadForRecentCases___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadDiagnosticCases:activity:", a2, 0);
}

- (void)performUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CloudKitUploadController fetchCasesWithIdentifiers:limit:](self, "fetchCasesWithIdentifiers:limit:", a3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CloudKitUploadController filterCasesViaCloudkitDecisionService:activity:response:](self, "filterCasesViaCloudkitDecisionService:activity:response:", v7, 0, v6);

}

- (void)performSubmissionOfRecentCaseSummaries:(unint64_t)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  -[CloudKitUploadController fetchRecentPendingCaseSummaries:](self, "fetchRecentPendingCaseSummaries:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudKitUploadController submitCaseSummaries:activity:](self, "submitCaseSummaries:activity:", v6, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sent submit request for %ld case summaries"), objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7);

  }
}

- (void)performSubmissionOfCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  -[CloudKitUploadController fetchCaseSummariesWithIdentifiers:](self, "fetchCaseSummariesWithIdentifiers:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudKitUploadController submitCaseSummaries:activity:](self, "submitCaseSummaries:activity:", v6, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sent submit request for %ld case summaries"), objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7);

  }
}

- (void)startPeriodicUploadTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CloudKitUploadController fetchRecentCasesPendingUpload:](self, "fetchRecentCasesPendingUpload:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CloudKitUploadController_startPeriodicUploadTask___block_invoke;
  v7[3] = &unk_1EA3B64E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CloudKitUploadController filterCasesPendingUpload:activity:reply:](self, "filterCasesPendingUpload:activity:reply:", v5, v6, v7);

}

uint64_t __52__CloudKitUploadController_startPeriodicUploadTask___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "uploadDiagnosticCases:activity:", a2, *(_QWORD *)(a1 + 40));
}

- (void)startPeriodicSummaryTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudKitUploadController fetchRecentPendingCaseSummaries:](self, "fetchRecentPendingCaseSummaries:", objc_msgSend(v6, "maxCaseSummaryPerSubmission"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CloudKitUploadController submitCaseSummaries:activity:](self, "submitCaseSummaries:activity:", v7, v4);
}

- (void)ckcodeDecisionService:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[ObjectAnalytics createTemporaryEntity](self->_caseStorageAnalytics, "createTemporaryEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCaseDomain:", CFSTR("TestDomain"));
  objc_msgSend(v6, "setCaseType:", CFSTR("TestType"));
  objc_msgSend(v6, "setCaseSubtypeContext:", CFSTR("TestSubType"));
  objc_msgSend(v6, "setCaseSubtypeContext:", CFSTR("TestSubtypeContext"));
  objc_msgSend(v6, "setCaseDetectedProcess:", CFSTR("symptomsd"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCaseID:", v8);

  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CloudKitUploadController_ckcodeDecisionService_response___block_invoke;
  v11[3] = &unk_1EA3B7320;
  v12 = v5;
  v10 = v5;
  -[CloudKitUploadController filterCasesViaCloudkitDecisionService:activity:response:](self, "filterCasesViaCloudkitDecisionService:activity:response:", v9, 0, v11);

}

uint64_t __59__CloudKitUploadController_ckcodeDecisionService_response___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)filterCasesViaCloudkitDecisionService:(id)a3 activity:(id)a4 response:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  ABCPbSigGrantRequest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id obj;
  const __CFString *v71;
  ABCPbSigGrantRequest *v72;
  _QWORD v73[5];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  const __CFString *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  uploadLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v81 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "CloudkitDecisionService request for %ld cases", buf, 0xCu);
  }

  uploadLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v81 = (uint64_t)v7;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "  Cases: %{private}@", buf, 0xCu);
  }

  if (objc_msgSend(v7, "count"))
  {
    v63 = v9;
    v64 = v8;
    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(ABCPbSigGrantRequest);
    -[ABCPbSigGrantRequest setVer:](v13, "setVer:", 1);
    objc_msgSend(v12, "productType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABCPbSigGrantRequest setDeviceModel:](v13, "setDeviceModel:", v14);

    objc_msgSend(v12, "buildPlatform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v13;
    -[ABCPbSigGrantRequest setBuildPlatform:](v13, "setBuildPlatform:", v15);

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v65 = v7;
    obj = v7;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v77;
      v19 = &OBJC_IVAR___AWDSymptomsDiagnosticRemoteUpload__expectedFileCount;
      v67 = *(_QWORD *)v77;
      v68 = v12;
      do
      {
        v20 = 0;
        v69 = v17;
        do
        {
          if (*(_QWORD *)v77 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v20);
          v22 = objc_alloc_init((Class)(v19 + 974));
          objc_msgSend(v21, "caseDomain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setDomain:", v23);

          objc_msgSend(v21, "caseType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setType:", v24);

          objc_msgSend(v21, "caseSubtype");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtype:", v25);

          objc_msgSend(v21, "caseSubtypeContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtypeContext:", v26);

          objc_msgSend(v21, "caseDetectedProcess");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setProcess:", v27);

          objc_msgSend(v21, "caseID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setCaseIdentifier:", v28);

          objc_msgSend(v12, "buildVariant");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBuildVariant:", v29);

          objc_msgSend(v12, "buildVersion");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBuild:", v30);

          objc_msgSend(v21, "caseGroupID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "length");

          if (v32)
          {
            objc_msgSend(v21, "caseGroupID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setCaseGroupIdentifier:", v33);

          }
          objc_msgSend(v21, "uploadRecord");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "totalBytes");

          if (v35 >= 1)
          {
            objc_msgSend(v21, "uploadRecord");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setLogSizeTotal:", objc_msgSend(v36, "totalBytes") >> 10);

          }
          -[ABCPbSigGrantRequest addSigRequest:](v72, "addSigRequest:", v22);
          uploadLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v21, "caseID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "caseGroupID");
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v39;
            v41 = CFSTR("(no grpID)");
            if (v39)
              v41 = (const __CFString *)v39;
            v71 = v41;
            objc_msgSend(v21, "caseDomain");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "caseType");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "caseSubtype");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "caseSubtypeContext");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "caseDetectedProcess");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138479363;
            v81 = (uint64_t)v38;
            v82 = 2113;
            v83 = v71;
            v84 = 2113;
            v85 = v42;
            v86 = 2113;
            v87 = v43;
            v88 = 2113;
            v89 = v44;
            v90 = 2113;
            v91 = v45;
            v92 = 2113;
            v93 = v46;
            _os_log_impl(&dword_1DBAE1000, v37, OS_LOG_TYPE_DEBUG, "Processed case: %{private}@/%{private}@ {%{private}@/%{private}@/%{private}@/%{private}@/%{private}@}", buf, 0x48u);

            v18 = v67;
            v19 = &OBJC_IVAR___AWDSymptomsDiagnosticRemoteUpload__expectedFileCount;

            v17 = v69;
            v12 = v68;

          }
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
      }
      while (v17);
    }

    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "configurationManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "cloudKitSandboxEnvironment"))
      v49 = 2;
    else
      v49 = 1;

    -[CloudKitUploadController currentCloudKitContainerForEnvironment:](self, "currentCloudKitContainerForEnvironment:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1DF0B6314]();
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "configurationManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cloudKitInvernessService");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C18]), "initWithServiceName:functionName:responseClass:", v54, CFSTR("grantRequest"), objc_opt_class());
    objc_msgSend(v55, "setRequest:", v72);
    objc_msgSend(v55, "setDestinationServer:", 0);
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "configurationManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "cloudKitPrefersAnonymous");
    objc_msgSend(v55, "configuration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setPreferAnonymousRequests:", v58);

    objc_msgSend(v55, "configuration");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setAllowsCellularAccess:", 1);

    v8 = v64;
    if (v64)
    {
      objc_msgSend(v55, "configuration");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setXpcActivity:", v64);

    }
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __84__CloudKitUploadController_filterCasesViaCloudkitDecisionService_activity_response___block_invoke;
    v73[3] = &unk_1EA3B7438;
    v73[4] = self;
    v74 = v64;
    v9 = v63;
    v75 = v63;
    objc_msgSend(v55, "setCodeOperationCompletionBlock:", v73);
    objc_msgSend(v50, "publicCloudDatabase");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addOperation:", v55);

    objc_autoreleasePoolPop(v51);
    v7 = v65;
    goto LABEL_29;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, MEMORY[0x1E0C9AA70], v12);
LABEL_29:

  }
}

void __84__CloudKitUploadController_filterCasesViaCloudkitDecisionService_activity_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    uploadLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "CKCode Error: %@", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "shouldDeferFromCloudKitError:", v6) && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "deferXPCActivity:");
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2FE0];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("CloudKit cancelled the operation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 89, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
    }
    v12 = 0;
  }
  else
  {
    uploadLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Received response from Decision Server", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "processCloudkitDecisionServiceResponse:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Received a nil response from CKCode", buf, 2u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2FE0];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("CKCode responded with a nil payload");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 91, v17);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = &unk_1EA3CFA28;
    }
  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v12, v11);

}

- (id)processCloudkitDecisionServiceResponse:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  uploadLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v34 = v3;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "grantResponse: %{private}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "globalDecision");
  if (!v6)
  {
    v7 = MEMORY[0x1E0C9AAA0];
    goto LABEL_7;
  }
  if (v6 == 1)
  {
    v7 = MEMORY[0x1E0C9AAB0];
LABEL_7:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("summary"));
    goto LABEL_25;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = v3;
  objc_msgSend(v3, "sigResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
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
        uploadLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v34 = v13;
          _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "  sigResponse: %{private}@", buf, 0xCu);
        }

        objc_msgSend(v13, "caseIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15 && (v16 = (void *)v15, v17 = objc_msgSend(v13, "hasDecision"), v16, v17))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "decision"));
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "caseIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v19);

        }
        else
        {
          uploadLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "caseIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v13, "hasDecision");
            *(_DWORD *)buf = 138478083;
            v22 = "missing";
            if (v21)
              v22 = "present";
            v34 = v20;
            v35 = 2080;
            v36 = v22;
            _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, " sigResponse is missing an identifier (%{private}@) and/or decision (%s)", buf, 0x16u);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v10);
  }

  v3 = v28;
LABEL_25:
  objc_msgSend(v3, "status");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    objc_msgSend(v3, "status");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("status"));

  }
  return v5;
}

- (id)fetchCaseSummariesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CloudKitUploadController _fetchRecentPendingCaseSummariesInternal:limit:](self, "_fetchRecentPendingCaseSummariesInternal:limit:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)fetchRecentPendingCaseSummaries:(unint64_t)a3
{
  return -[CloudKitUploadController _fetchRecentPendingCaseSummariesInternal:limit:](self, "_fetchRecentPendingCaseSummariesInternal:limit:", 0, a3);
}

- (id)_fetchRecentPendingCaseSummariesInternal:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  DiagnosticCaseSummaryAnalytics *caseSummaryAnalytics;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseSummaryState == %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v6;
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("caseCreatedTime"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:limit:](caseSummaryAnalytics, "fetchEntitiesFreeForm:sortDesc:limit:", v11, v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)submitCaseSummaries:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *context;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  summaryLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Submission request for %ld cases", buf, 0xCu);
  }

  summaryLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v38 = (uint64_t)v6;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Cases: %{private}@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    if (v7 && xpc_activity_should_defer((xpc_activity_t)v7))
    {
      summaryLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: xpc deferral, cannot prepare request", buf, 2u);
      }

      -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v7);
    }
    else
    {
      +[DiagnosticCaseSummaryAnalytics pbRequestForCases:](DiagnosticCaseSummaryAnalytics, "pbRequestForCases:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "cloudKitSandboxEnvironment"))
        v14 = 2;
      else
        v14 = 1;

      -[CloudKitUploadController currentCloudKitContainerForEnvironment:](self, "currentCloudKitContainerForEnvironment:", v14);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x1DF0B6314]();
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cloudKitInvernessService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      summaryLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = (uint64_t)v17;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Inverness Service: %@", buf, 0xCu);
      }

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C18]), "initWithServiceName:functionName:responseClass:", v17, CFSTR("submitCaseSummary"), objc_opt_class());
      v20 = (void *)v11;
      objc_msgSend(v19, "setRequest:", v11);
      objc_msgSend(v19, "setDestinationServer:", 0);
      +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configurationManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "cloudKitPrefersAnonymous");
      objc_msgSend(v19, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPreferAnonymousRequests:", v23);

      objc_msgSend(v19, "configuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAllowsCellularAccess:", 1);

      if (v7)
      {
        objc_msgSend(v19, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setXpcActivity:", v7);

      }
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke;
      v34[3] = &unk_1EA3B7460;
      v34[4] = self;
      v27 = v7;
      v35 = v27;
      v36 = v6;
      objc_msgSend(v19, "setCodeOperationCompletionBlock:", v34);
      v28 = v20;
      if (v7 && xpc_activity_should_defer((xpc_activity_t)v27))
      {
        summaryLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: xpc deferral, cannot schedule CK operation", buf, 2u);
        }

        -[CloudKitUploadController deferXPCActivity:](self, "deferXPCActivity:", v27);
        v28 = v20;
        v30 = v33;
      }
      else
      {
        v30 = v33;
        objc_msgSend(v33, "publicCloudDatabase");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addOperation:", v19);

      }
      objc_autoreleasePoolPop(context);

    }
  }
  else if (v7)
  {
    -[CloudKitUploadController finishXPCActivity:](self, "finishXPCActivity:", v7);
  }

}

void __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint32_t v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    summaryLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: CKCode Error: %@", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "shouldDeferFromCloudKitError:", v6) && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "deferXPCActivity:");
      summaryLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "DiagnosticCaseSummaryLog: CloudKit cancelled the operation";
LABEL_15:
        v15 = v8;
        v16 = 2;
LABEL_18:
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_ERROR, v9, buf, v16);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (!v5)
    {
      summaryLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "DiagnosticCaseSummaryLog: Received a nil response from CKCode";
        goto LABEL_15;
      }
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v5, "status");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SUCCESS"));

    summaryLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v20 = v5;
        v9 = "DiagnosticCaseSummaryLog: Unsuccessful response: %{private}@";
        v15 = v8;
        v16 = 12;
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v20 = v5;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Successful response: %{private}@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 8);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke_196;
    v17[3] = &unk_1EA3B5010;
    v17[4] = v13;
    v18 = *(id *)(a1 + 48);
    dispatch_async(v14, v17);

  }
LABEL_20:
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "finishXPCActivity:");

}

uint64_t __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke_196(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  summaryLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Ready to update submitted case summary records", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateSubmittedCases:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "save");
}

- (void)configureLogUploadDiscretionaryActivityCriteria:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  BOOL v9;
  int64_t v10;
  uint8_t v11[16];

  v3 = a3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80760], 300);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80828], (const char *)*MEMORY[0x1E0C80838]);
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "npiDevice");

  if (v5)
  {
    uploadLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Applying NPI scheduling criteria for log upload activity", v11, 2u);
    }

    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807C0]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807D0]);
    v7 = (const char *)*MEMORY[0x1E0C80738];
    v8 = v3;
    v9 = 1;
  }
  else
  {
    v10 = *MEMORY[0x1E0C807B8];
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], v10);
    v7 = (const char *)*MEMORY[0x1E0C80738];
    v8 = v3;
    v9 = 0;
  }
  xpc_dictionary_set_BOOL(v8, v7, v9);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80850], 20971520);

}

- (void)configureCaseSummaryDiscretionaryActivityCriteria:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int64_t v8;
  uint8_t v9[16];

  v3 = a3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80760], 90);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808C8], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80850], 10240);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80828], (const char *)*MEMORY[0x1E0C80838]);
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "npiDevice");

  if (v5)
  {
    uploadLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Applying NPI scheduling criteria for case summary activity", v9, 2u);
    }

    v7 = (const char *)*MEMORY[0x1E0C807A8];
    v8 = *MEMORY[0x1E0C807C0];
  }
  else
  {
    v7 = (const char *)*MEMORY[0x1E0C807A8];
    v8 = 6 * *MEMORY[0x1E0C807C0];
  }
  xpc_dictionary_set_int64(v3, v7, v8);

}

- (void)registerCloudKitUploadActivities
{
  void *v3;
  void *v4;
  int v5;

  -[CloudKitUploadController registerLogUploadActivities](self, "registerLogUploadActivities");
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseSummaryEnabled");

  if (v5)
    -[CloudKitUploadController registerCaseSummaryActivities](self, "registerCaseSummaryActivities");
}

- (void)registerLogUploadActivities
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  uploadLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Registering periodic CloudKit upload activity", buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55__CloudKitUploadController_registerLogUploadActivities__block_invoke;
  handler[3] = &unk_1EA3B6208;
  handler[4] = self;
  xpc_activity_register("com.apple.autobugcapture.logupload.discretionary", v4, handler);
}

void __55__CloudKitUploadController_registerLogUploadActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  xpc_object_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  _QWORD v18[5];
  _xpc_activity_s *v19;
  uint8_t buf[4];
  xpc_object_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (!state)
  {
    uploadLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Checking in to discretionary CloudKit upload activity", buf, 2u);
    }

    v9 = xpc_activity_copy_criteria(v3);
    uploadLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Activty already has criteria set %@", buf, 0xCu);
      }

      v12 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "configureLogUploadDiscretionaryActivityCriteria:", v12);
      if (xpc_equal(v9, v12))
        goto LABEL_23;
      uploadLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        xpc_activity_set_criteria(v3, v12);
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v14 = "Existing activity criteria was different from the default criteria. Replacing with defaults";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 2;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Setting activity criteria to defaults", buf, 2u);
      }

      v12 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "configureLogUploadDiscretionaryActivityCriteria:", v12);
      uploadLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      v14 = "Activity criteria set to %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEBUG;
      v17 = 12;
    }
    _os_log_impl(&dword_1DBAE1000, v15, v16, v14, buf, v17);
    goto LABEL_22;
  }
  if (state == 2)
  {
    uploadLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Ready to run discretionary CloudKit upload activity (%p)", buf, 0xCu);
    }

    if (xpc_activity_set_state(v3, 4))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(NSObject **)(v6 + 8);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__CloudKitUploadController_registerLogUploadActivities__block_invoke_199;
      v18[3] = &unk_1EA3B5010;
      v18[4] = v6;
      v19 = v3;
      dispatch_async(v7, v18);

      goto LABEL_25;
    }
    uploadLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Unable to set activity state to CONTINUE!", buf, 2u);
    }
LABEL_24:

  }
LABEL_25:

}

uint64_t __55__CloudKitUploadController_registerLogUploadActivities__block_invoke_199(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPeriodicUploadTask:", *(_QWORD *)(a1 + 40));
}

- (void)registerCaseSummaryActivities
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  summaryLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Registering periodic submission activity", buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke;
  handler[3] = &unk_1EA3B6208;
  handler[4] = self;
  xpc_activity_register("com.apple.autobugcapture.caseSummary.discretionary", v4, handler);
}

void __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  xpc_object_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  _QWORD v18[5];
  _xpc_activity_s *v19;
  uint8_t buf[4];
  xpc_object_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (!state)
  {
    summaryLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Checking in to discretionary submission activity", buf, 2u);
    }

    v9 = xpc_activity_copy_criteria(v3);
    summaryLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: submission activity already has criteria set %@", buf, 0xCu);
      }

      v12 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "configureCaseSummaryDiscretionaryActivityCriteria:", v12);
      if (xpc_equal(v9, v12))
        goto LABEL_23;
      summaryLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        xpc_activity_set_criteria(v3, v12);
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v14 = "DiagnosticCaseSummaryLog: Existing submission activity criteria was different from the default criteria. Rep"
            "lacing with defaults";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 2;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Setting submission activity criteria to defaults", buf, 2u);
      }

      v12 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "configureCaseSummaryDiscretionaryActivityCriteria:", v12);
      summaryLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      v14 = "DiagnosticCaseSummaryLog: Submission activity criteria set to %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEBUG;
      v17 = 12;
    }
    _os_log_impl(&dword_1DBAE1000, v15, v16, v14, buf, v17);
    goto LABEL_22;
  }
  if (state == 2)
  {
    summaryLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v3;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Ready to run discretionary submission activity (%p)", buf, 0xCu);
    }

    if (xpc_activity_set_state(v3, 4))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(NSObject **)(v6 + 8);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke_202;
      v18[3] = &unk_1EA3B5010;
      v18[4] = v6;
      v19 = v3;
      dispatch_async(v7, v18);

      goto LABEL_25;
    }
    summaryLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: Unable to set activity state to CONTINUE!", buf, 2u);
    }
LABEL_24:

  }
LABEL_25:

}

uint64_t __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke_202(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPeriodicSummaryTask:", *(_QWORD *)(a1 + 40));
}

+ (void)unregisterCloudKitUploadActivities
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  uploadLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering periodic CloudKit upload activity", buf, 2u);
  }

  xpc_activity_unregister("com.apple.autobugcapture.logupload.discretionary");
  summaryLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Unregistering CloudKit submission activity", v4, 2u);
  }

  xpc_activity_unregister("com.apple.autobugcapture.caseSummary.discretionary");
}

- (void)uploadMostRecentCases:(unint64_t)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  uploadLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "received request to upload recent %ld cases", buf, 0xCu);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CloudKitUploadController_uploadMostRecentCases___block_invoke;
  v7[3] = &unk_1EA3B4D18;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

uint64_t __50__CloudKitUploadController_uploadMostRecentCases___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUploadForRecentCases:", *(_QWORD *)(a1 + 40));
}

- (void)uploadCasesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  uploadLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "received request to upload cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CloudKitUploadController_uploadCasesWithIdentifiers___block_invoke;
  v8[3] = &unk_1EA3B5010;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

uint64_t __55__CloudKitUploadController_uploadCasesWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUploadForCaseIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (void)uploadDecisionWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  uploadLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, "received request to request upload decision for cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CloudKitUploadController_uploadDecisionWithIdentifiers_reply___block_invoke;
  block[3] = &unk_1EA3B4AC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __64__CloudKitUploadController_uploadDecisionWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUploadDecisionForCaseIdentifiers:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)submitCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  uploadLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: received request to submit cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CloudKitUploadController_submitCaseSummariesWithIdentifiers_reply___block_invoke;
  block[3] = &unk_1EA3B4AC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __69__CloudKitUploadController_submitCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSubmissionOfCaseSummariesWithIdentifiers:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)submitRecentCaseSummaries:(unint64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  uploadLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: received request to submit recent %ld cases", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CloudKitUploadController_submitRecentCaseSummaries_reply___block_invoke;
  block[3] = &unk_1EA3B7488;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(queue, block);

}

uint64_t __60__CloudKitUploadController_submitRecentCaseSummaries_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSubmissionOfRecentCaseSummaries:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRecordAnalytics, 0);
  objc_storeStrong((id *)&self->_caseSummaryAnalytics, 0);
  objc_storeStrong((id *)&self->_caseStorageAnalytics, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
