@implementation DRSCloudKitHelper

+ (id)helperForCKConfig:(id)a3
{
  id v3;
  DRSCloudKitHelper *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = [DRSCloudKitHelper alloc];
  v5 = objc_msgSend(v3, "ckContainerEnvironment");
  v6 = objc_msgSend(v3, "ckRapidEnvironment");

  return -[DRSCloudKitHelper initWithContainerEnvironment:rapidEnvironment:](v4, "initWithContainerEnvironment:rapidEnvironment:", v5, v6);
}

- (DRSCloudKitHelper)initWithEnvironment:(int64_t)a3
{
  return -[DRSCloudKitHelper initWithContainerEnvironment:rapidEnvironment:](self, "initWithContainerEnvironment:rapidEnvironment:", a3, a3);
}

- (DRSCloudKitHelper)initWithContainerEnvironment:(int64_t)a3 rapidEnvironment:(int64_t)a4
{
  DRSCloudKitHelper *v6;
  DRSCloudKitHelper *v7;
  uint64_t v8;
  CKContainer *targetContainer;
  uint64_t v10;
  DRSRapidCloudKitHelper *rapidHelper;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DRSCloudKitHelper;
  v6 = -[DRSCloudKitHelper init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_environment = a3;
    v6->_rapidEnvironment = a4;
    if (-[DRSCloudKitHelper environment](v6, "environment") == 1)
      DRSProductionContainer();
    else
      DRSSandboxContainer();
    v8 = objc_claimAutoreleasedReturnValue();
    targetContainer = v7->__targetContainer;
    v7->__targetContainer = (CKContainer *)v8;

    if (-[DRSCloudKitHelper rapidEnvironment](v7, "rapidEnvironment") == 1)
      +[DRSRapidCloudKitHelper prodHelper](DRSRapidCloudKitHelper, "prodHelper");
    else
      +[DRSRapidCloudKitHelper devHelper](DRSRapidCloudKitHelper, "devHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    rapidHelper = v7->_rapidHelper;
    v7->_rapidHelper = (DRSRapidCloudKitHelper *)v10;

  }
  return v7;
}

+ (id)sandboxContainerHelper
{
  if (sandboxContainerHelper_onceToken != -1)
    dispatch_once(&sandboxContainerHelper_onceToken, &__block_literal_global_191);
  return (id)sandboxContainerHelper_helper;
}

void __43__DRSCloudKitHelper_sandboxContainerHelper__block_invoke()
{
  DRSCloudKitHelper *v0;
  void *v1;

  v0 = -[DRSCloudKitHelper initWithEnvironment:]([DRSCloudKitHelper alloc], "initWithEnvironment:", 2);
  v1 = (void *)sandboxContainerHelper_helper;
  sandboxContainerHelper_helper = (uint64_t)v0;

}

+ (id)prodContainerHelper
{
  if (prodContainerHelper_onceToken != -1)
    dispatch_once(&prodContainerHelper_onceToken, &__block_literal_global_192);
  return (id)prodContainerHelper_helper;
}

void __40__DRSCloudKitHelper_prodContainerHelper__block_invoke()
{
  DRSCloudKitHelper *v0;
  void *v1;

  v0 = -[DRSCloudKitHelper initWithEnvironment:]([DRSCloudKitHelper alloc], "initWithEnvironment:", 1);
  v1 = (void *)prodContainerHelper_helper;
  prodContainerHelper_helper = (uint64_t)v0;

}

- (void)_configureOperation:(id)a3 container:(id)a4 xpcActivity:(id)a5
{
  DRSConfigureOperation(a3, a4, a5);
}

- (void)_uploadRecords:(id)a3 containerName:(id)a4 xpcActivity:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  os_signpost_id_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C94F10];
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend([v12 alloc], "initWithRecordsToSave:recordIDsToDelete:", v14, 0);

  if (objc_msgSend(v10, "isEqualToString:", kDRSCloudKitContainerName))
  {
    -[DRSCloudKitHelper _targetContainer](self, "_targetContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", v10, -[DRSCloudKitHelper environment](self, "environment"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v17);

  }
  -[DRSCloudKitHelper _configureOperation:container:xpcActivity:](self, "_configureOperation:container:xpcActivity:", v15, v16, v13);

  objc_msgSend(v15, "operationID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __80__DRSCloudKitHelper__uploadRecords_containerName_xpcActivity_completionHandler___block_invoke;
  v29 = &unk_1EA3D1328;
  v19 = v18;
  v30 = v19;
  v31 = v11;
  v20 = v11;
  v21 = _Block_copy(&v26);
  objc_msgSend(v15, "setModifyRecordsCompletionBlock:", v21, v26, v27, v28, v29);
  DPLogHandle_CKRecordUpload();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "hash");
  if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v19;
      v34 = 2114;
      v35 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CKRecordUpload", "Upload operation ID: %{public}@, target container: %{public}@", buf, 0x16u);
    }
  }

  objc_msgSend(v16, "publicCloudDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addOperation:", v15);

}

void __80__DRSCloudKitHelper__uploadRecords_containerName_xpcActivity_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a2;
  DPLogHandle_CKRecordUpload();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "hash");
  v10 = v9;
  if (v6)
  {
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      objc_msgSend(v6, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CKRecordUpload", "Failed due to error: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_INTERVAL_END, v10, "CKRecordUpload", "Completed successfully", (uint8_t *)&v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_handleRAPIDRequests:(id)a3 xpcActivity:(id)a4 errorsOut:(id)a5
{
  id v8;
  _xpc_activity_s *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (_xpc_activity_s *)a4;
  v22 = a5;
  DPLogHandle_CKCFUpload();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134349056;
    v31 = objc_msgSend(v8, "count", v22);
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Beginning upload session of %{public}llu requests", buf, 0xCu);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v9 && xpc_activity_should_defer(v9))
        {
          DPLogHandle_CKCFUpload();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v20))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Ending upload session due to deferral request", buf, 2u);
          }

          v19 = 0;
          v18 = v11;
          goto LABEL_18;
        }
        -[DRSCloudKitHelper rapidHelper](self, "rapidHelper", v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __64__DRSCloudKitHelper__handleRAPIDRequests_xpcActivity_errorsOut___block_invoke;
        v23[3] = &unk_1EA3D1350;
        v24 = v22;
        objc_msgSend(v17, "submitRapidPayload:replyHandler:", v16, v23);

      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
        continue;
      break;
    }
  }

  DPLogHandle_CKCFUpload();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsUploadSession", "Successful!", buf, 2u);
  }
  v19 = 1;
LABEL_18:

  return v19;
}

uint64_t __64__DRSCloudKitHelper__handleRAPIDRequests_xpcActivity_errorsOut___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a4);
  return result;
}

- (id)_requestsPassingUploadSizeCap:(id)a3 remainingQuota:(unint64_t)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_199);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138543874;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "totalLogSizeBytes", v20, (_QWORD)v21);
        if (v14)
        {
          v15 = v14;
          v16 = a4 - v14;
          if (a4 >= v14)
          {
            objc_msgSend(v6, "addObject:", v13);
            a4 = v16;
          }
          else
          {
            DPLogHandle_CKRecordUpload();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v17))
            {
              objc_msgSend(v13, "requestID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v26 = v18;
              v27 = 2048;
              v28 = v15;
              v29 = 2048;
              v30 = a4;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSkippedDueToSizeLimits", "Skipping upload of request %{public}@ due to upload size limits: %zu (size B) > %llu (remaining quota B)", buf, 0x20u);

            }
          }
        }
        else
        {
          objc_msgSend(v13, "makeTerminalDueToMissingLog");
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);
  }

  return v6;
}

uint64_t __66__DRSCloudKitHelper__requestsPassingUploadSizeCap_remainingQuota___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "requestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)uploadRequests:(id)a3 contactDecisionServer:(BOOL)a4 xpcActivity:(id)a5 remainingUploadQuota:(unint64_t)a6 backingPersistentContainer:(id)a7 completionHandler:(id)a8
{
  id v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD aBlock[5];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD *v55;
  uint64_t *v56;
  _QWORD v57[3];
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v40 = a4;
  v77 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v42 = a5;
  v44 = a7;
  v41 = a8;
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isLogUploadEnabled");

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v70 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if (objc_msgSend(v20, "requestState") == 1)
        {
          if ((objc_msgSend(v20, "hasUploadableContent") & 1) != 0)
          {
            if ((v14 & 1) != 0)
              objc_msgSend(v15, "addObject:", v20);
            else
              objc_msgSend(v20, "updateToState:errorDescription:errorOut:", 4103, 0, 0);
          }
          else
          {
            objc_msgSend(v20, "makeTerminalDueToMissingLog");
          }
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v17);
  }

  -[DRSCloudKitHelper _requestsPassingUploadSizeCap:remainingQuota:](self, "_requestsPassingUploadSizeCap:remainingQuota:", v15, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        if (objc_msgSend(v27, "uploadStarted"))
          objc_msgSend(v22, "addObject:", v27);
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v24);
  }

  if (v44)
  {
    v28 = (void *)objc_msgSend(v44, "newBackgroundContext");
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__0;
    v63 = __Block_byref_object_dispose__0;
    v64 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v58 = 0;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke;
    v52[3] = &unk_1EA3D13B8;
    v29 = v23;
    v53 = v29;
    v30 = v28;
    v54 = v30;
    v55 = v57;
    v56 = &v59;
    objc_msgSend(v30, "performBlockAndWait:", v52);
    if (v60[5])
    {
      DPLogHandle_CKRecordUpload();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        objc_msgSend((id)v60[5], "localizedDescription");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v34 = CFSTR("Unknown");
        if (v32)
          v34 = (const __CFString *)v32;
        *(_DWORD *)buf = 138543362;
        v74 = (uint64_t)v34;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreDPDSAndUploadSaveFailed", "Failed to save records prior to DPDS submission due to error: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      DPLogHandle_CKRecordUpload();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        v35 = objc_msgSend(v29, "count");
        *(_DWORD *)buf = 134349056;
        v74 = v35;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreDPDSAndUploadSaveSuccess", "Successfully saved updated state for %{public}llu requests that will be passed along to the DPDPS", buf, 0xCu);
      }
    }

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(&v59, 8);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_202;
  aBlock[3] = &unk_1EA3D1430;
  v36 = v41;
  v51 = v36;
  aBlock[4] = self;
  v37 = v42;
  v50 = v37;
  v38 = _Block_copy(aBlock);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v40)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_211;
    v45[3] = &unk_1EA3D1458;
    v46 = v22;
    v47 = v39;
    v48 = v38;
    -[DRSCloudKitHelper shouldUploadRequests:xpcActivity:replyHandler:](self, "shouldUploadRequests:xpcActivity:replyHandler:", v46, v37, v45);

  }
  else
  {
    (*((void (**)(void *, id, _QWORD))v38 + 2))(v38, v22, 0);
  }

}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "updateContextWithRequest_ON_MOC_QUEUE:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "save:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_202(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  dispatch_semaphore_t v29;
  void *v30;
  dispatch_semaphore_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  os_signpost_id_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  os_signpost_id_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  _QWORD v59[4];
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    v57 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v53 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    v54 = v6;
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v69 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v12, "targetContainerName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "recordRepresentation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v12, "targetContainerName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "targetContainerName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);

              }
              objc_msgSend(v16, "addObject:", v14);
              objc_msgSend(v14, "recordID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setObject:forKeyedSubscript:", v12, v18);

              DPLogHandle_CKRecord();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v19))
              {
                objc_msgSend(v14, "recordID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "recordName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "debugDescription");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v74 = (uint64_t)v21;
                v75 = 2112;
                v76 = v22;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKRecordGenerated", "Generated CK record with name %{public}@ for request %@", buf, 0x16u);

                v6 = v54;
              }

            }
            else
            {
              DPLogHandle_CKRecordError();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v23))
              {
                objc_msgSend(v12, "debugDescription");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v74 = (uint64_t)v24;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CouldNotCreateCKRecord", "Failed to generate CKRecord for request %{public}@", buf, 0xCu);

              }
              objc_msgSend(v12, "updateToState:errorDescription:errorOut:", 4355, CFSTR("Could not create CKRecord for request"), 0);
            }

          }
          else
          {
            objc_msgSend(v55, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v55;
    if (objc_msgSend(v55, "count"))
    {
      v27 = v57;
      v28 = objc_msgSend(*(id *)(v57 + 32), "_handleRAPIDRequests:xpcActivity:errorsOut:", v55, *(_QWORD *)(v57 + 40), v25);
      if (objc_msgSend(v25, "count"))
      {
        if ((v28 & 1) == 0)
          goto LABEL_48;
      }
      else
      {

        v25 = 0;
        if ((v28 & 1) == 0)
        {
LABEL_48:
          (*(void (**)(void))(*(_QWORD *)(v57 + 48) + 16))();
          DPLogHandle_CKRecordUpload();
          v51 = objc_claimAutoreleasedReturnValue();
          v5 = v53;
          if (os_signpost_enabled(v51))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v51, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKCFUploadDeferred", (const char *)&unk_1DBC04191, buf, 2u);
          }

LABEL_52:
          goto LABEL_53;
        }
      }
    }
    else
    {
      v27 = v57;
    }
    if (!objc_msgSend(v25, "count"))
    {

      v25 = 0;
    }
    v5 = v53;
    if (objc_msgSend(v6, "count"))
    {
      v52 = v25;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = dispatch_semaphore_create(0);
      v30 = v6;
      v31 = v29;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v32 = v30;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v65 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_msgSend(v32, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            DPLogHandle_CKRecordUpload();
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v37, "hash");
            if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v41 = v40;
              if (os_signpost_enabled(v39))
              {
                v42 = objc_msgSend(v38, "count");
                *(_DWORD *)buf = 134218242;
                v74 = v42;
                v75 = 2114;
                v76 = v37;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v41, "PerContainerUploadSession", "Starting upload session for %lu requests for container %{public}@", buf, 0x16u);
              }
            }

            v43 = *(void **)(v57 + 32);
            v44 = *(_QWORD *)(v57 + 40);
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_206;
            v59[3] = &unk_1EA3D1408;
            v60 = v58;
            v45 = v31;
            v61 = v45;
            v46 = v38;
            v62 = v46;
            v63 = v56;
            objc_msgSend(v43, "_uploadRecords:containerName:xpcActivity:completionHandler:", v46, v37, v44, v59);
            dispatch_semaphore_wait(v45, 0xFFFFFFFFFFFFFFFFLL);
            DPLogHandle_CKRecordUpload();
            v47 = objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v37, "hash");
            if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v49 = v48;
              if (os_signpost_enabled(v47))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1DBB92000, v47, OS_SIGNPOST_INTERVAL_END, v49, "PerContainerUploadSession", (const char *)&unk_1DBC04191, buf, 2u);
              }
            }

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v34);
      }

      if (objc_msgSend(v56, "count"))
        v50 = v56;
      else
        v50 = 0;
      v25 = v52;
      (*(void (**)(_QWORD, _QWORD, void *, void *))(*(_QWORD *)(v57 + 48) + 16))(*(_QWORD *)(v57 + 48), 0, v52, v50);

      v5 = v53;
      v6 = v54;
      v26 = v55;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(v27 + 48) + 16))();
    }
    goto LABEL_52;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_53:

}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recordID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uploadCompleteWithError:ckRecordID:", 0, v16);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v8);
  }
  if (!v6)
    goto LABEL_20;
  if (objc_msgSend(v6, "code") != 2)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = *(id *)(a1 + 48);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "recordID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uploadCompleteWithError:ckRecordID:", v6, 0);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v21);
    }

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
LABEL_20:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    goto LABEL_32;
  }
  objc_msgSend(v6, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_207;
    v36[3] = &unk_1EA3D13E0;
    v37 = *(id *)(a1 + 32);
    v38 = *(id *)(a1 + 56);
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v36);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  }
  else
  {
    DPLogHandle_CKRecordError();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingPartialErrorInfo", "Upload encountered partial error, but no partial error dict was provided", buf, 2u);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v28 = *(id *)(a1 + 48);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "recordID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "uploadCompleteWithError:ckRecordID:", v6, 0);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v30);
    }

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

LABEL_32:
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_207(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uploadCompleteWithError:ckRecordID:", v5, 0);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else
  {
    DPLogHandle_CKRecordError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingRequestForError", "Could not find request that was reported to have errored", v9, 2u);
    }

  }
}

void __136__DRSCloudKitHelper_uploadRequests_contactDecisionServer_xpcActivity_remainingUploadQuota_backingPersistentContainer_completionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  const __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    DPLogHandle_CKInvernessError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvernessDecisionServerError", "Encountered decision server error: %{public}@", buf, 0xCu);

    }
  }
  v28 = v6;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = *(id *)(a1 + 32);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    v15 = CFSTR("Missing reply");
    v29 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v17, "decisionServerDecision", v28) == 2)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
        }
        else
        {
          objc_msgSend(v17, "requestID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            if ((objc_msgSend(v19, "requestAccepted") & 1) != 0)
            {
              objc_msgSend(v17, "setDecisionServerDecision:", 2);
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
            }
            else
            {
              objc_msgSend(v19, "rejectionReason");
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v25;
              if (v25)
                v27 = (const __CFString *)v25;
              else
                v27 = CFSTR("Unknown");
              objc_msgSend(v17, "uploadDeniedByDecisionServerWithReason:", v27);

              objc_msgSend(v17, "setDecisionServerDecision:", 1);
            }
          }
          else
          {
            DPLogHandle_CKInvernessError();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v20))
            {
              objc_msgSend(v17, "debugDescription");
              v21 = a1;
              v22 = v5;
              v23 = v15;
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v36 = v24;
              _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingReply", "Missing reply from DS for %{public}@", buf, 0xCu);

              v15 = v23;
              v5 = v22;
              a1 = v21;
              v11 = v29;
            }

            objc_msgSend(v17, "uploadDeniedByDecisionServerWithReason:", v15);
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)shouldUploadRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v17, "decisionServerDecision", (_QWORD)v18))
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  -[DRSCloudKitHelper _sendDecisionServerRequests:xpcActivity:replyHandler:](self, "_sendDecisionServerRequests:xpcActivity:replyHandler:", v11, v9, v10);
}

- (void)shouldEnableDataGathering:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v18, "submitQuery"))
          v19 = v12;
        else
          v19 = v11;
        objc_msgSend(v19, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __72__DRSCloudKitHelper_shouldEnableDataGathering_xpcActivity_replyHandler___block_invoke;
  v26 = &unk_1EA3D1480;
  v27 = v11;
  v28 = v10;
  v20 = v10;
  v21 = v11;
  v22 = _Block_copy(&v23);
  -[DRSCloudKitHelper _sendDecisionServerRequests:xpcActivity:replyHandler:](self, "_sendDecisionServerRequests:xpcActivity:replyHandler:", v12, v9, v22, v23, v24, v25, v26);

}

void __72__DRSCloudKitHelper_shouldEnableDataGathering_xpcActivity_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  DRSDecisionServerRequestReply *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "queryFinishedWithDecision:error:", v12, v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = a1;
  v14 = *(id *)(a1 + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        v20 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:]([DRSDecisionServerRequestReply alloc], "initWithOriginalRequest:requestAccepted:rejectionReason:", v19, 0, CFSTR("Invalid query state"));
        objc_msgSend(v19, "queryID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  (*(void (**)(void))(*(_QWORD *)(v22 + 40) + 16))();
}

- (void)_sendDecisionServerRequests:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  DRSDecisionServerRequestReply *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  DRSDecisionServerRequestReply *v35;
  void *v36;
  id v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  DRSDecisionServerRequestReply *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const __CFString **v60;
  uint64_t *v61;
  void *v62;
  DRSCloudKitHelper *v63;
  void *v64;
  id v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  id v67;
  void *v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  void (**v74)(_QWORD, _QWORD, _QWORD);
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  _BYTE v91[128];
  uint64_t v92;
  const __CFString *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v66 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
    v67 = v9;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isLogUploadEnabled");

    if ((v13 & 1) != 0)
    {
      v63 = self;
      v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v65 = v8;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      v68 = v14;
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v80 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            objc_msgSend(v20, "pbRequest", v63);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(v69, "addObject:", v21);
              objc_msgSend(v14, "addObject:", v20);
            }
            else
            {
              v22 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:]([DRSDecisionServerRequestReply alloc], "initWithOriginalRequest:requestAccepted:rejectionReason:", v20, 0, CFSTR("Invalid upload request"));
              objc_msgSend(v20, "uniqueID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v23);

              v14 = v68;
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
        }
        while (v17);
      }

      v24 = objc_msgSend(v11, "count");
      if (v24 == objc_msgSend(v15, "count"))
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v92 = *MEMORY[0x1E0CB2D50];
        v93 = CFSTR("Could not create any valid upload requests");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelineInvernessError"), 0, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v66;
        ((void (**)(_QWORD, id, void *))v66)[2](v66, v11, v27);
        v9 = v67;
      }
      else
      {
        v37 = objc_alloc(MEMORY[0x1E0C94C18]);
        v38 = kDRSCloudKitDecisionServerName;
        objc_msgSend(v68, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "functionName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v37, "initWithServiceName:functionName:responseClass:", v38, v40, objc_msgSend(v41, "pbBatchResponseClass"));

        if (v27)
        {
          -[DRSCloudKitHelper _targetContainer](v63, "_targetContainer");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v67;
          -[DRSCloudKitHelper _configureOperation:container:xpcActivity:](v63, "_configureOperation:container:xpcActivity:", v27, v42, v67);

          objc_msgSend(v68, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "pbBatchInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          DRSDeviceMetadata();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setClientMetadata:", v45);

          objc_msgSend(v44, "setRequests:", v69);
          objc_msgSend(v27, "setRequest:", v44);
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __74__DRSCloudKitHelper__sendDecisionServerRequests_xpcActivity_replyHandler___block_invoke;
          v70[3] = &unk_1EA3D14A8;
          v71 = v68;
          v72 = v11;
          v73 = v15;
          v10 = v66;
          v74 = v66;
          objc_msgSend(v27, "setCodeOperationCompletionBlock:", v70);
          -[DRSCloudKitHelper _targetContainer](v63, "_targetContainer");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "publicCloudDatabase");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addOperation:", v27);

        }
        else
        {
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v48 = v68;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v76;
            do
            {
              for (j = 0; j != v50; ++j)
              {
                if (*(_QWORD *)v76 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                v54 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:]([DRSDecisionServerRequestReply alloc], "initWithOriginalRequest:requestAccepted:rejectionReason:", v53, 0, CFSTR("Could not create upload request operation"));
                objc_msgSend(v53, "uniqueID");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKeyedSubscript:", v54, v55);

              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
            }
            while (v50);
          }

          v56 = objc_msgSend(v11, "count");
          v57 = objc_msgSend(v15, "count");
          v58 = (void *)MEMORY[0x1E0CB35C8];
          if (v56 == v57)
          {
            v87 = *MEMORY[0x1E0CB2D50];
            v88 = CFSTR("Failed to create CKCodeOperation instance to query DS");
            v59 = (void *)MEMORY[0x1E0C99D80];
            v60 = &v88;
            v61 = &v87;
          }
          else
          {
            v89 = *MEMORY[0x1E0CB2D50];
            v90 = CFSTR("Didn't have a error reply for every request after failing to create upload request operation");
            v59 = (void *)MEMORY[0x1E0C99D80];
            v60 = &v90;
            v61 = &v89;
          }
          objc_msgSend(v59, "dictionaryWithObjects:forKeys:count:", v60, v61, 1, 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v67;
          v27 = v64;
          objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelineInvernessError"), 0, v62);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v66;
          ((void (**)(_QWORD, id, void *))v66)[2](v66, v11, v44);
        }

      }
      v8 = v65;
    }
    else
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v29 = v8;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v84 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
            v35 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:]([DRSDecisionServerRequestReply alloc], "initWithOriginalRequest:requestAccepted:rejectionReason:", v34, 0, CFSTR("Log upload is disabled"));
            objc_msgSend(v34, "uniqueID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, v36);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
        }
        while (v31);
      }

      v10 = v66;
      ((void (**)(_QWORD, id, _QWORD))v66)[2](v66, v11, 0);
    }

  }
  else
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v28, 0);

  }
}

void __74__DRSCloudKitHelper__sendDecisionServerRequests_xpcActivity_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  DRSDecisionServerRequestReply *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  DRSDecisionServerRequestReply *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void (*v25)(void);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  DRSDecisionServerRequestReply *v30;
  void *v31;
  void *v32;
  void *v33;
  DRSDecisionServerRequestReply *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  DRSDecisionServerRequestReply *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id obj;
  id obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  v9 = a1;
  if (!v6)
  {
    objc_msgSend(v7, "decisionResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    v28 = objc_msgSend(*(id *)(a1 + 32), "count");

    if (v27 == v28)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v29 = 0;
        do
        {
          v30 = [DRSDecisionServerRequestReply alloc];
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "decisionResults");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[DRSDecisionServerRequestReply initWithOriginalRequest:reply:](v30, "initWithOriginalRequest:reply:", v31, v33);

          v35 = *(void **)(a1 + 40);
          -[DRSDecisionServerRequestReply request](v34, "request");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uniqueID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v37);

          ++v29;
        }
        while (v29 < objc_msgSend(*(id *)(a1 + 32), "count"));
      }
      v38 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v38 == objc_msgSend(*(id *)(a1 + 48), "count"))
        goto LABEL_33;
      DPLogHandle_CKInvernessError();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v39))
      {
LABEL_32:

LABEL_33:
        v25 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      v40 = "Didn't have reply for every request on successful reply";
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obja = *(id *)(a1 + 32);
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v55 != v43)
              objc_enumerationMutation(obja);
            v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            v46 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:]([DRSDecisionServerRequestReply alloc], "initWithOriginalRequest:requestAccepted:rejectionReason:", v45, 0, CFSTR("Reply from decision server did not properly map to request array"));
            v47 = *(void **)(v9 + 40);
            objc_msgSend(v45, "uniqueID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v47;
            a1 = v9;
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v46, v48);

          }
          v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        }
        while (v42);
      }

      v50 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v50 == objc_msgSend(*(id *)(a1 + 48), "count"))
        goto LABEL_33;
      DPLogHandle_CKInvernessError();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v39))
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v40 = "Didn't have reply for every request when confusing answer from DS received";
    }
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InconsistentReplyCount", v40, buf, 2u);
    goto LABEL_32;
  }
  v51 = v7;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = *(id *)(a1 + 32);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v60 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        v15 = [DRSDecisionServerRequestReply alloc];
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v6, "localizedDescription");
        v17 = v6;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("CKOperationError: %@"), v18);
        v20 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:](v15, "initWithOriginalRequest:requestAccepted:rejectionReason:", v14, 0, v19);
        v21 = *(void **)(v9 + 40);
        objc_msgSend(v14, "uniqueID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

        v6 = v17;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v11);
  }

  v23 = objc_msgSend(*(id *)(v9 + 40), "count");
  v8 = v51;
  if (v23 != objc_msgSend(*(id *)(v9 + 48), "count"))
  {
    DPLogHandle_CKInvernessError();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InconsistentReplyCount", "Didn't have reply for every request when CKOperation error encountered", buf, 2u);
    }

  }
  v25 = *(void (**)(void))(*(_QWORD *)(v9 + 56) + 16);
LABEL_34:
  v25();

}

- (void)reportTerminalRequestStats:(id)a3 xpcActivity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    +[DRSRequestAllStats statsForRequests:](DRSRequestAllStats, "statsForRequests:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "generateCoreAnalyticsEvents:", 1);
    DPLogHandle_Telemetry();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134349056;
      v30 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchCoreAnalyticsEvents", "Reported %{public}llu CA events", buf, 0xCu);
    }

    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInternal");

    if (v15)
    {
      objc_msgSend(v11, "terminalRequestProtobufRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0C94C18]);
        v18 = (void *)objc_msgSend(v17, "initWithServiceName:functionName:responseClass:", kDRSCloudKitDecisionServerName, CFSTR("reportDiagnosticRequestStatsBatch"), objc_opt_class());
        -[DRSCloudKitHelper _targetContainer](self, "_targetContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSCloudKitHelper _configureOperation:container:xpcActivity:](self, "_configureOperation:container:xpcActivity:", v18, v19, v9);

        objc_msgSend(v18, "setRequest:", v16);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __73__DRSCloudKitHelper_reportTerminalRequestStats_xpcActivity_replyHandler___block_invoke;
        v25[3] = &unk_1EA3D14D0;
        v26 = v10;
        objc_msgSend(v18, "setCodeOperationCompletionBlock:", v25);
        -[DRSCloudKitHelper _targetContainer](self, "_targetContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "publicCloudDatabase");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addOperation:", v18);

      }
      else
      {
        DPLogHandle_CKInvernessError();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchProtobufError", "Could not create stats batch protobuf object", buf, 2u);
        }

        v23 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        v28 = CFSTR("Failed to create protobuf object to report stats to DecisionServer");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelineRequestStatsBatchError"), 0, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *))v10 + 2))(v10, v18);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __73__DRSCloudKitHelper_reportTerminalRequestStats_xpcActivity_replyHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    DPLogHandle_CKInvernessError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = 138543362;
      v7 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStatsBatchError", "Inverness error for 'reportDiagnosticRequestStatsBatch': %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)environment
{
  return self->_environment;
}

- (int64_t)rapidEnvironment
{
  return self->_rapidEnvironment;
}

- (CKContainer)_targetContainer
{
  return self->__targetContainer;
}

- (void)set_targetContainer:(id)a3
{
  objc_storeStrong((id *)&self->__targetContainer, a3);
}

- (DRSRapidCloudKitHelper)rapidHelper
{
  return self->_rapidHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapidHelper, 0);
  objc_storeStrong((id *)&self->__targetContainer, 0);
}

@end
