@implementation DRSRapidCloudKitHelper

- (id)_initWithEnvironment:(int64_t)a3
{
  DRSRapidCloudKitHelper *v4;
  DiagnosticPipelineRapidServiceFunctionsClientObjc *v5;
  DRSRapidCloudKitHelper *v6;
  DRSRapidCloudKitHelper *v7;
  objc_super v9;

  if (a3 == 3)
  {
    v4 = 0;
  }
  else
  {
    v5 = -[DiagnosticPipelineRapidServiceFunctionsClientObjc initWithEnvironment:]([DiagnosticPipelineRapidServiceFunctionsClientObjc alloc], "initWithEnvironment:", a3);
    if (v5)
    {
      v9.receiver = self;
      v9.super_class = (Class)DRSRapidCloudKitHelper;
      v6 = -[DRSRapidCloudKitHelper init](&v9, sel_init);
      v7 = v6;
      if (v6)
        objc_storeStrong((id *)&v6->_objcClient, v5);
      self = v7;
      v4 = self;
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)devHelper
{
  if (devHelper_onceToken != -1)
    dispatch_once(&devHelper_onceToken, &__block_literal_global_13);
  return (id)devHelper_devHelper;
}

void __35__DRSRapidCloudKitHelper_devHelper__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DRSRapidCloudKitHelper _initWithEnvironment:]([DRSRapidCloudKitHelper alloc], "_initWithEnvironment:", 1);
  v1 = (void *)devHelper_devHelper;
  devHelper_devHelper = (uint64_t)v0;

}

+ (id)prodHelper
{
  if (prodHelper_onceToken != -1)
    dispatch_once(&prodHelper_onceToken, &__block_literal_global_15);
  return (id)prodHelper_prodHelper;
}

void __36__DRSRapidCloudKitHelper_prodHelper__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DRSRapidCloudKitHelper _initWithEnvironment:]([DRSRapidCloudKitHelper alloc], "_initWithEnvironment:", 2);
  v1 = (void *)prodHelper_prodHelper;
  prodHelper_prodHelper = (uint64_t)v0;

}

- (void)submitRapidPayload:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  intptr_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  dispatch_semaphore_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  os_log_t loga;
  NSObject *log;
  _QWORD block[4];
  id v54;
  id v55;
  _QWORD *v56;
  __int128 *v57;
  intptr_t v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  __int128 *p_buf;
  _QWORD *v65;
  _QWORD v66[3];
  char v67;
  __int128 buf;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DPLogHandle_CKCFUpload();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Upload for %{public}@", (uint8_t *)&buf, 0xCu);

  }
  if (objc_msgSend(v6, "requestState") == 1)
  {
    if ((objc_msgSend(v6, "uploadStarted") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v10);

      DPLogHandle_CKCFUpload();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        LOWORD(buf) = 0;
LABEL_18:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", v12, (uint8_t *)&buf, 2u);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else if (objc_msgSend(v6, "requestState") != 2)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "requestStateString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Unexpected request state: %@"), v32);
    v11 = objc_claimAutoreleasedReturnValue();

    DRSRapidErrorWithDescription(v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v33);

    DPLogHandle_CKCFUpload();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v34))
    {
      objc_msgSend(v6, "requestStateString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v35;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Request in unexpected state: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    if (!objc_msgSend(v6, "requestOutcome"))
      objc_msgSend(v6, "updateToState:errorDescription:errorOut:", 4355, CFSTR("Attempted to upload while in unexpected state"), 0);
    goto LABEL_25;
  }
  if ((objc_msgSend(v6, "hasUploadableContent") & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v6, "logs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithContentsOfFile:", v16);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "logs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "requestDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        v22 = v21;

        v23 = dispatch_queue_create("DRSRapidCloudKitHelper sync queue", 0);
        v42 = dispatch_semaphore_create(0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v69 = 0x2020000000;
        v70 = 0;
        v66[0] = 0;
        v66[1] = v66;
        v66[2] = 0x2020000000;
        v67 = 0;
        -[DRSRapidCloudKitHelper objcClient](self, "objcClient");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject buildVariant](loga, "buildVariant");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject deviceCategory](loga, "deviceCategory");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject deviceModel](loga, "deviceModel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject platformString](loga, "platformString");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "teamID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "issueCategory");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "contextDictionaryData");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "build");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logType");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NSObject length](v11, "length");
        LODWORD(v20) = objc_msgSend(v6, "uploadAttemptCount");
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke;
        v59[3] = &unk_1EA3D10C8;
        v27 = v23;
        v60 = v27;
        p_buf = &buf;
        v65 = v66;
        v41 = v6;
        v61 = v41;
        v40 = v7;
        v63 = v40;
        v28 = v42;
        v62 = v28;
        LODWORD(v39) = (_DWORD)v20;
        objc_msgSend(v50, "submitRapidPayloadWithBuildVariant:deviceCategory:deviceModel:platform:teamID:issueCategory:contextDictionaryData:requestTime:build:logType:logSize:fileName:uploadAttempts:payload:completionHandler:", v49, v44, v48, v47, v46, v43, v45, (unint64_t)v22, v24, v25, v26, v19, v39, v11, v59);

        v29 = dispatch_time(0, 120000000000);
        v30 = dispatch_semaphore_wait(v28, v29);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_37;
        block[3] = &unk_1EA3D10F0;
        v56 = v66;
        v58 = v30;
        v54 = v41;
        v55 = v40;
        v57 = &buf;
        dispatch_sync(v27, block);

        _Block_object_dispose(v66, 8);
        _Block_object_dispose(&buf, 8);

      }
      else
      {
        DRSRapidErrorWithDescription(CFSTR("Could not determine file name"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v38);

        DPLogHandle_CKCFUpload();
        log = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(log))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, log, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Could not determine file name", (uint8_t *)&buf, 2u);
        }

      }
    }
    else
    {
      DRSRapidErrorWithDescription(CFSTR("Invalid payload"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v37);

      DPLogHandle_CKCFUpload();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Invalid payload", (uint8_t *)&buf, 2u);
      }
    }

  }
  else
  {
    DRSRapidErrorWithDescription(CFSTR("File not available"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v36);

    DPLogHandle_CKCFUpload();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      v12 = "Failed due to missing payload file.";
      goto LABEL_18;
    }
  }
LABEL_25:

}

void __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_2;
  block[3] = &unk_1EA3D10A0;
  v21 = *(_OWORD *)(a1 + 64);
  v15 = v9;
  v10 = *(NSObject **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = v8;
  v18 = v7;
  v20 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_sync(v10, block);

}

_QWORD *__58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_2(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result[10] + 8) + 24))
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(result[11] + 8) + 24) = 1;
    v2 = result[4];
    DPLogHandle_CKCFUpload();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_enabled(v3);
    if (v2)
    {
      if (v4)
      {
        objc_msgSend((id)v1[4], "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5;
        v7 = CFSTR("Unknown");
        if (v5)
          v7 = (const __CFString *)v5;
        v11 = 138543362;
        v12 = v7;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Failed to upload due to CK layer error: %{public}@", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend((id)v1[5], "uploadCompleteWithError:ckRecordID:", v1[4], 0);
    }
    else
    {
      if (v4)
      {
        v8 = (const __CFString *)v1[6];
        if (!v8)
          v8 = CFSTR("<None>");
        v11 = 138543362;
        v12 = v8;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Reached CF endpoint successfully! Failure reason: %{public, name=failureReason}@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend((id)v1[5], "uploadCompleteWithError:ckRecordID:", 0, 0);
      if (v1[6])
        v9 = MEMORY[0x1E0C9AAA0];
      else
        v9 = MEMORY[0x1E0C9AAB0];
      objc_msgSend((id)v1[5], "setCfDidSucceed:", v9);
      objc_msgSend((id)v1[5], "setCfFailureReason:", v1[6]);
      v10 = (void *)v1[7];
      if (v10 && objc_msgSend(v10, "length"))
        objc_msgSend((id)v1[5], "setCfReplyPayload:", v1[7]);
    }
    (*(void (**)(void))(v1[9] + 16))();
    return (_QWORD *)dispatch_semaphore_signal((dispatch_semaphore_t)v1[8]);
  }
  return result;
}

void __58__DRSRapidCloudKitHelper_submitRapidPayload_replyHandler___block_invoke_37(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 64))
  {
    DRSRapidErrorWithDescription(CFSTR("Timed out waiting for CF response"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uploadCompleteWithError:ckRecordID:", v2, 0);
    DPLogHandle_CKCFUpload();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v4 = 134217984;
      v5 = 120000000000;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudFunctionsRequestUpload", "Request to CKCF hit %llu second timeout", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)objcClient
{
  return self->_objcClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcClient, 0);
}

@end
