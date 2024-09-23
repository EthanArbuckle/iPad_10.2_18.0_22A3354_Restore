@implementation DRSTaskingCloudKitHelper

- (DRSTaskingCloudKitHelper)initWithContainer:(id)a3
{
  id v5;
  DRSTaskingCloudKitHelper *v6;
  DRSTaskingCloudKitHelper *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DRSTaskingCloudKitHelper;
  v6 = -[DRSTaskingCloudKitHelper init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__targetContainer, a3);
    v8 = dispatch_queue_create("TaskingCloudKitHelper work queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

+ (id)sandboxContainerHelper
{
  if (sandboxContainerHelper_onceToken_0 != -1)
    dispatch_once(&sandboxContainerHelper_onceToken_0, &__block_literal_global_12);
  return (id)sandboxContainerHelper_helper_0;
}

void __50__DRSTaskingCloudKitHelper_sandboxContainerHelper__block_invoke()
{
  DRSTaskingCloudKitHelper *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [DRSTaskingCloudKitHelper alloc];
  DRSSandboxContainer();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[DRSTaskingCloudKitHelper initWithContainer:](v0, "initWithContainer:", v3);
  v2 = (void *)sandboxContainerHelper_helper_0;
  sandboxContainerHelper_helper_0 = v1;

}

+ (id)prodContainerHelper
{
  if (prodContainerHelper_onceToken_0 != -1)
    dispatch_once(&prodContainerHelper_onceToken_0, &__block_literal_global_54_0);
  return (id)prodContainerHelper_helper_0;
}

void __47__DRSTaskingCloudKitHelper_prodContainerHelper__block_invoke()
{
  DRSTaskingCloudKitHelper *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [DRSTaskingCloudKitHelper alloc];
  DRSProductionContainer();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[DRSTaskingCloudKitHelper initWithContainer:](v0, "initWithContainer:", v3);
  v2 = (void *)prodContainerHelper_helper_0;
  prodContainerHelper_helper_0 = v1;

}

- (id)_operationWithFunctionName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C94C18];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithServiceName:functionName:responseClass:", kDRSCloudKitDecisionServerName, v5, objc_opt_class());

  -[DRSTaskingCloudKitHelper _targetContainer](self, "_targetContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DRSConfigureOperation(v7, v8, 0);

  return v7;
}

- (void)_submitOperationWithName:(id)a3 requestObject:(id)a4 completionBlock:(id)a5
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DRSTaskingCloudKitHelper workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke;
  v15[3] = &unk_1EA3D2D38;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_operationWithFunctionName:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRequest:", *(_QWORD *)(a1 + 48));
  v3 = (void *)os_transaction_create();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke_2;
  v11 = &unk_1EA3D2D10;
  v4 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = v4;
  v5 = v3;
  objc_msgSend(v2, "setCodeOperationCompletionBlock:", &v8);
  objc_msgSend(*(id *)(a1 + 32), "_targetContainer", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicCloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v2);

}

uint64_t __83__DRSTaskingCloudKitHelper__submitOperationWithName_requestObject_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)taskingDeviceMetadata
{
  if (taskingDeviceMetadata_onceToken != -1)
    dispatch_once(&taskingDeviceMetadata_onceToken, &__block_literal_global_59);
  return (id)taskingDeviceMetadata_taskingDeviceMetadata;
}

void __49__DRSTaskingCloudKitHelper_taskingDeviceMetadata__block_invoke()
{
  DRSProtoTaskingDeviceMetadata *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
  v1 = (void *)taskingDeviceMetadata_taskingDeviceMetadata;
  taskingDeviceMetadata_taskingDeviceMetadata = (uint64_t)v0;

  DRSDeviceMetadata();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)taskingDeviceMetadata_taskingDeviceMetadata, "setDeviceMetadata:", v2);

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)taskingDeviceMetadata_taskingDeviceMetadata, "setBuild:", v3);

}

- (void)_recordPBMessage:(id)a3 forFunction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "dataWithJSONObject:options:error:", v7, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
  {
    DPLogHandle_TaskingDSTelemetry();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoBuffMessageJSONFailed", "%{public}@", buf, 0xCu);
    }
  }
  else
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
    DPLogHandle_TaskingDSTelemetry();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoBuffMessage", "%{public}@:\n%{public}@", buf, 0x16u);
    }

  }
}

- (void)reportTaskingSystemMessageReceipt:(id)a3 messageType:(id)a4 channelType:(id)a5 channelEnvironment:(id)a6 dateBroadcast:(id)a7 dateReceived:(id)a8 transaction:(id)a9 completionHandler:(id)a10
{
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  DRSProtoTaskingSystemMessageReceipt *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  os_signpost_id_t v42;
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v16 = (__CFString *)a3;
  v17 = (__CFString *)a4;
  v38 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34 = a9;
  v35 = a10;
  v37 = v19;
  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "timeIntervalSinceDate:", v19);
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = &unk_1EA3E3A70;
  }
  v36 = v20;
  if (v16)
    v23 = v16;
  else
    v23 = CFSTR("Unknown");
  if (v17)
    v24 = v17;
  else
    v24 = CFSTR("Unknown");
  DPLogHandle_TaskingDSTelemetry();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_signpost_id_generate(v25);

  DPLogHandle_TaskingDSTelemetry();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 138544386;
    v44 = v23;
    v45 = 2114;
    v46 = v24;
    v47 = 2114;
    v48 = v38;
    v49 = 2114;
    v50 = v18;
    v51 = 2114;
    v52 = v22;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "TaskingSystemMessageReceipt", "\tUUID: %{public}@\n\tmessageType: %{public}@\n\tchannelType: %{public}@\n\tchannelEnvironment: %{public}@\n\tlatency: %{public}@", buf, 0x34u);
  }

  v29 = objc_alloc_init(DRSProtoTaskingSystemMessageReceipt);
  objc_msgSend((id)objc_opt_class(), "taskingDeviceMetadata");
  v30 = v18;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingSystemMessageReceipt setTaskingDeviceMetadata:](v29, "setTaskingDeviceMetadata:", v31);

  -[DRSProtoTaskingSystemMessageReceipt setUuid:](v29, "setUuid:", v23);
  -[DRSProtoTaskingSystemMessageReceipt setMessageType:](v29, "setMessageType:", v24);
  -[DRSProtoTaskingSystemMessageReceipt setChannelType:](v29, "setChannelType:", v38);
  -[DRSProtoTaskingSystemMessageReceipt setChannelEnvironment:](v29, "setChannelEnvironment:", v30);
  objc_msgSend(v22, "floatValue");
  -[DRSProtoTaskingSystemMessageReceipt setReceiptDelay:](v29, "setReceiptDelay:");
  -[DRSTaskingCloudKitHelper _recordPBMessage:forFunction:](self, "_recordPBMessage:forFunction:", v29, CFSTR("reportTaskingSystemMessageReceipt"));
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __162__DRSTaskingCloudKitHelper_reportTaskingSystemMessageReceipt_messageType_channelType_channelEnvironment_dateBroadcast_dateReceived_transaction_completionHandler___block_invoke;
  v39[3] = &unk_1EA3D2D80;
  v41 = v35;
  v42 = v26;
  v40 = v34;
  v32 = v34;
  v33 = v35;
  -[DRSTaskingCloudKitHelper _submitOperationWithName:requestObject:completionBlock:](self, "_submitOperationWithName:requestObject:completionBlock:", CFSTR("reportTaskingSystemMessageReceipt"), v29, v39);

}

void __162__DRSTaskingCloudKitHelper_reportTaskingSystemMessageReceipt_messageType_channelType_channelEnvironment_dateBroadcast_dateReceived_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const char *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DPLogHandle_TaskingDSTelemetry();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v12 = 138543362;
      v13 = v4;
      v8 = "Failed with error: %{public}@";
      v9 = v6;
      v10 = v7;
      v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingSystemMessageReceipt", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    v8 = "Succeeded";
    v9 = v6;
    v10 = v7;
    v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
}

- (id)_taskingConfigMetadataForTeamID:(id)a3 uuidString:(id)a4
{
  id v5;
  id v6;
  DRSProtoTaskingConfigMetadata *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
  objc_msgSend((id)objc_opt_class(), "taskingDeviceMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigMetadata setTaskingDeviceMetadata:](v7, "setTaskingDeviceMetadata:", v8);

  -[DRSProtoTaskingConfigMetadata setTeamId:](v7, "setTeamId:", v6);
  -[DRSProtoTaskingConfigMetadata setUuid:](v7, "setUuid:", v5);

  return v7;
}

- (void)reportTaskingConfigReceipt:(id)a3 uuidString:(id)a4 receiptResult:(id)a5 transaction:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  DRSProtoTaskingConfigReceipt *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  DPLogHandle_TaskingDSTelemetry();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);

  DPLogHandle_TaskingDSTelemetry();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138543874;
    v30 = v13;
    v31 = 2114;
    v32 = v12;
    v33 = 2114;
    v34 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "TaskingConfigReceipt", "\tUUID: %{public}@\n\tteamID: %{public}@\n\treceiptResult: %{public}@\n", buf, 0x20u);
  }

  v21 = objc_alloc_init(DRSProtoTaskingConfigReceipt);
  -[DRSTaskingCloudKitHelper _taskingConfigMetadataForTeamID:uuidString:](self, "_taskingConfigMetadataForTeamID:uuidString:", v12, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigReceipt setTaskingConfigMetadata:](v21, "setTaskingConfigMetadata:", v22);

  -[DRSProtoTaskingConfigReceipt setReceiptResult:](v21, "setReceiptResult:", v14);
  -[DRSTaskingCloudKitHelper _recordPBMessage:forFunction:](self, "_recordPBMessage:forFunction:", v21, CFSTR("reportTaskingConfigReceipt"));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __110__DRSTaskingCloudKitHelper_reportTaskingConfigReceipt_uuidString_receiptResult_transaction_completionHandler___block_invoke;
  v25[3] = &unk_1EA3D2D80;
  v27 = v16;
  v28 = v18;
  v26 = v15;
  v23 = v15;
  v24 = v16;
  -[DRSTaskingCloudKitHelper _submitOperationWithName:requestObject:completionBlock:](self, "_submitOperationWithName:requestObject:completionBlock:", CFSTR("reportTaskingConfigReceipt"), v21, v25);

}

void __110__DRSTaskingCloudKitHelper_reportTaskingConfigReceipt_uuidString_receiptResult_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const char *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DPLogHandle_TaskingDSTelemetry();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v12 = 138543362;
      v13 = v4;
      v8 = "Failed with error: %{public}@";
      v9 = v6;
      v10 = v7;
      v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingConfigReceipt", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    v8 = "Succeeded";
    v9 = v6;
    v10 = v7;
    v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
}

- (void)reportTaskingConfigCompletion:(id)a3 uuidString:(id)a4 completionType:(id)a5 completionDescription:(id)a6 activeDuration:(double)a7 transaction:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  DRSProtoTaskingConfigCompletion *v26;
  void *v27;
  double v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  os_signpost_id_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  DPLogHandle_TaskingDSTelemetry();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_generate(v22);

  DPLogHandle_TaskingDSTelemetry();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138544386;
    v36 = v17;
    v37 = 2114;
    v38 = v16;
    v39 = 2114;
    v40 = v18;
    v41 = 2114;
    v42 = v19;
    v43 = 2050;
    v44 = a7;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, v23, "TaskingConfigCompletion", "\tUUID: %{public}@\n\tteamID: %{public}@\n\tcompletionType: %{public}@\n\tcompletionDescription: %{public}@\n\tactiveDuration: %{public}f\n", buf, 0x34u);
  }

  v26 = objc_alloc_init(DRSProtoTaskingConfigCompletion);
  -[DRSTaskingCloudKitHelper _taskingConfigMetadataForTeamID:uuidString:](self, "_taskingConfigMetadataForTeamID:uuidString:", v16, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigCompletion setTaskingConfigMetadata:](v26, "setTaskingConfigMetadata:", v27);

  -[DRSProtoTaskingConfigCompletion setCompletionType:](v26, "setCompletionType:", v18);
  -[DRSProtoTaskingConfigCompletion setCompletionDescription:](v26, "setCompletionDescription:", v19);
  *(float *)&v28 = a7;
  -[DRSProtoTaskingConfigCompletion setActiveDuration:](v26, "setActiveDuration:", v28);
  -[DRSTaskingCloudKitHelper _recordPBMessage:forFunction:](self, "_recordPBMessage:forFunction:", v26, CFSTR("reportTaskingConfigCompletion"));
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __151__DRSTaskingCloudKitHelper_reportTaskingConfigCompletion_uuidString_completionType_completionDescription_activeDuration_transaction_completionHandler___block_invoke;
  v31[3] = &unk_1EA3D2D80;
  v33 = v21;
  v34 = v23;
  v32 = v20;
  v29 = v20;
  v30 = v21;
  -[DRSTaskingCloudKitHelper _submitOperationWithName:requestObject:completionBlock:](self, "_submitOperationWithName:requestObject:completionBlock:", CFSTR("reportTaskingConfigCompletion"), v26, v31);

}

void __151__DRSTaskingCloudKitHelper_reportTaskingConfigCompletion_uuidString_completionType_completionDescription_activeDuration_transaction_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const char *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DPLogHandle_TaskingDSTelemetry();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v12 = 138543362;
      v13 = v4;
      v8 = "Failed with error: %{public}@";
      v9 = v6;
      v10 = v7;
      v11 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_INTERVAL_END, v10, "TaskingConfigCompletion", v8, (uint8_t *)&v12, v11);
    }
  }
  else if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v12) = 0;
    v8 = "Succeeded";
    v9 = v6;
    v10 = v7;
    v11 = 2;
    goto LABEL_8;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
}

- (CKContainer)_targetContainer
{
  return self->__targetContainer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->__targetContainer, 0);
}

@end
