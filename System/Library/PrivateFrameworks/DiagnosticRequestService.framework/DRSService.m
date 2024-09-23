@implementation DRSService

+ (BOOL)serviceIsEnabled
{
  if (serviceIsEnabled_onceToken_0 != -1)
    dispatch_once(&serviceIsEnabled_onceToken_0, &__block_literal_global_4);
  return serviceIsEnabled_isEnabled_0;
}

void __30__DRSService_serviceIsEnabled__block_invoke()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint8_t v3[16];

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isCarrier");

  if (v1)
  {
    serviceIsEnabled_isEnabled_0 = 0;
    DPLogHandle_ServiceLifecycle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceDisabled", "Service is disabled due to being Carrier", v3, 2u);
    }

  }
  else
  {
    serviceIsEnabled_isEnabled_0 = 1;
  }
}

+ (unint64_t)uploadSessionUploadCapBytes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DRSService_uploadSessionUploadCapBytes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (uploadSessionUploadCapBytes_onceToken != -1)
    dispatch_once(&uploadSessionUploadCapBytes_onceToken, block);
  return uploadSessionUploadCapBytes_cap;
}

void __41__DRSService_uploadSessionUploadCapBytes__block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "serviceIsEnabled") & 1) != 0)
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    uploadSessionUploadCapBytes_cap = objc_msgSend(v1, "uploadSessionUploadCapBytes");

  }
  else
  {
    uploadSessionUploadCapBytes_cap = 0;
  }
}

- (unint64_t)_remainingSessionUploadQuotaBytesWithContext:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[DRSService maxSingleSessionUploadSizeInBytes](self, "maxSingleSessionUploadSizeInBytes");
  v6 = -[DRSService _remainingMonthlyUploadQuotaBytesWithContext:](self, "_remainingMonthlyUploadQuotaBytesWithContext:", v4);

  if (v5 >= v6)
    return v6;
  else
    return v5;
}

- (unint64_t)monthlyUploadQuotaBytes
{
  return 8 * -[DRSService maxSingleSessionUploadSizeInBytes](self, "maxSingleSessionUploadSizeInBytes");
}

- (unint64_t)_remainingMonthlyUploadQuotaBytesWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "dateWithTimeIntervalSinceNow:", -2592000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[DRSRequest uploadedBytesSinceDate:context:errorOut:](DRSRequest, "uploadedBytesSinceDate:context:errorOut:", v6, v5, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v19;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    DPLogHandle_CoreDataError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend(v8, "localizedDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("Unknown");
      if (v11)
        v13 = (const __CFString *)v11;
      *(_DWORD *)buf = 138543362;
      v21 = (unint64_t)v13;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemainingQuotaCalculationError", "Encountered error while trying to calculate remaining monthly quota: %{public}@", buf, 0xCu);

    }
    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(v7, "unsignedLongLongValue");
    if (v15 >= -[DRSService monthlyUploadQuotaBytes](self, "monthlyUploadQuotaBytes"))
    {
      v14 = 0;
      goto LABEL_16;
    }
    v16 = -[DRSService monthlyUploadQuotaBytes](self, "monthlyUploadQuotaBytes");
    v14 = v16 - objc_msgSend(v7, "unsignedLongLongValue");
    DPLogHandle_ServiceLifecycle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v17 = -[DRSService monthlyUploadQuotaBytes](self, "monthlyUploadQuotaBytes");
      *(_DWORD *)buf = 134218240;
      v21 = v14;
      v22 = 2048;
      v23 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemainingMonthlyQuotaCalculated", "%lluB remain out of monthly upload quota of %lluB", buf, 0x16u);
    }
  }

LABEL_16:
  return v14;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_42);
  return (id)sharedInstance_sharedInstance_0;
}

void __28__DRSService_sharedInstance__block_invoke()
{
  DRSService *v0;
  void *v1;

  DRSRegisterForDeviceUnlockNotification();
  v0 = objc_alloc_init(DRSService);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (void)_initializeServiceContainer
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1DBB92000, a2, a3, "DATA LOSS ERROR: Could not migrate DB due to error: %{public}@", (uint8_t *)&v3);
}

- (void)_waitForDeviceUnlockAndInitializeServiceState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  if (_waitForDeviceUnlockAndInitializeServiceState_onceToken_0 != -1)
    dispatch_once(&_waitForDeviceUnlockAndInitializeServiceState_onceToken_0, block);
}

uint64_t __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DRSDampeningManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  DRSCKConfigStore *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v47;
  NSObject *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  DRSWaitForDeviceUnlock();
  objc_msgSend((id)objc_opt_class(), "databaseDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceLifecycle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceLifecycleError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DRSConfirmDirectoryIsInitialized(v2, v3, v4);

  objc_msgSend((id)objc_opt_class(), "fileDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceLifecycle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DPLogHandle_ServiceLifecycleError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DRSConfirmDirectoryIsInitialized(v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "_initializeServiceContainer");
  v8 = [DRSDampeningManager alloc];
  objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "deviceTeamConfigurationDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DRSDampeningManager initWithPersistentContainer:teamConfigurationDirectory:](v8, "initWithPersistentContainer:teamConfigurationDirectory:", v9, v10);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 96);
  *(_QWORD *)(v12 + 96) = v11;

  objc_msgSend(*(id *)(a1 + 32), "dampeningManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    DPLogHandle_ServiceLifecycleError();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerCreationFailure", "FATAL ERROR: Failed to create dampening manager for service", buf, 2u);
    }

    DPLogHandle_ServiceLifecycleError();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(v48);

    exit(1);
  }
  v15 = [DRSCKConfigStore alloc];
  objc_msgSend((id)objc_opt_class(), "databaseDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v17 = -[DRSCKConfigStore initWithWorkingDirectory:isReadOnly:errorOut:](v15, "initWithWorkingDirectory:isReadOnly:errorOut:", v16, 0, &v50);
  v18 = v50;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 120);
  *(_QWORD *)(v19 + 120) = v17;

  objc_msgSend(*(id *)(a1 + 32), "ckConfigStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "ckConfigStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v22, "currentConfig:", &v49);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v49;

    if (v23)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v23);
      DPLogHandle_ServiceLifecycleError();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigFetchSuccess", (const char *)&unk_1DBC04191, buf, 2u);
      }
    }
    else
    {
      DPLogHandle_ServiceLifecycleError();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v33))
      {
        objc_msgSend(v24, "localizedDescription");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        v36 = CFSTR("Unknown");
        if (v34)
          v36 = (const __CFString *)v34;
        *(_DWORD *)buf = 138543362;
        v52 = v36;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigFetchFailure", "ERROR: Failed to fetch current CK config due to error: %{public}@. Will fallback to default.", buf, 0xCu);

      }
      +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1 + 32);
      v25 = *(NSObject **)(v38 + 128);
      *(_QWORD *)(v38 + 128) = v37;
    }

  }
  else
  {
    DPLogHandle_ServiceLifecycleError();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v26))
    {
      objc_msgSend(v18, "localizedDescription");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      v29 = CFSTR("Unknown");
      if (v27)
        v29 = (const __CFString *)v27;
      *(_DWORD *)buf = 138543362;
      v52 = v29;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigStoreCreationFailure", "ERROR: Failed to create CK config store for service due to error: %{public}@. Will fallback to default.", buf, 0xCu);

    }
    DPLogHandle_ServiceLifecycleError();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(v18, v30);

    +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 32);
    v24 = *(id *)(v32 + 128);
    *(_QWORD *)(v32 + 128) = v31;
  }

  DPLogHandle_ServiceLifecycle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v39))
  {
    objc_msgSend(*(id *)(a1 + 32), "ckConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "debugDescription");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v41;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigApplied", "Applied config %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "ckConfig");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSCloudKitHelper helperForCKConfig:](DRSCloudKitHelper, "helperForCKConfig:", v42);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = *(_QWORD *)(a1 + 32);
  v45 = *(void **)(v44 + 112);
  *(_QWORD *)(v44 + 112) = v43;

  return objc_msgSend(*(id *)(a1 + 32), "_getConfiguration");
}

+ (id)databaseDirectory
{
  return CFSTR("/private/var/mobile/Library/DiagnosticPipeline");
}

+ (id)configurationDirectory
{
  return CFSTR("/System/Library/DiagnosticPipeline/Configuration");
}

+ (id)deviceTeamConfigurationDirectory
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrier");

  if (v4)
  {
    objc_msgSend(a1, "carrierConfigurationDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInternal");

    if (v7)
    {
      objc_msgSend(a1, "internalConfigurationDirectory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isSeed");

      if (v9)
        objc_msgSend(a1, "seedConfigurationDirectory");
      else
        objc_msgSend(a1, "customerConfigurationDirectory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

+ (id)carrierConfigurationDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "configurationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("TeamConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Carrier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)internalConfigurationDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "configurationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("TeamConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Internal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)seedConfigurationDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "configurationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("TeamConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Seed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)customerConfigurationDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "configurationDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("TeamConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Customer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fileDirectory
{
  return CFSTR("/private/var/mobile/Library/Logs/DiagnosticPipeline");
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  BOOL v9;
  int v11;
  pid_t pid;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_connection_s *)a3;
  v4 = xpc_connection_copy_entitlement_value();
  v5 = (void *)v4;
  if (!v4)
  {
    DPLogHandle_ServiceXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v11 = 67109120;
      pid = xpc_connection_get_pid(v3);
      v7 = "ClientConnectionMissingEntitlement";
      v8 = "Client connection from [%d] missing entitlement 'com.apple.diagnosticpipeline.request'";
      goto LABEL_11;
    }
LABEL_12:

    v9 = 0;
    goto LABEL_13;
  }
  if (MEMORY[0x1DF0B73D0](v4) != MEMORY[0x1E0C812D0])
  {
    DPLogHandle_ServiceXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v11 = 67109120;
      pid = xpc_connection_get_pid(v3);
      v7 = "ClientConnectionBadEntitlementType";
      v8 = "Client connection from [%d] has wrong type for entitlement 'com.apple.diagnosticpipeline.request'";
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v7, v8, (uint8_t *)&v11, 8u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!xpc_BOOL_get_value(v5))
  {
    DPLogHandle_ServiceXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      v11 = 67109120;
      pid = xpc_connection_get_pid(v3);
      v7 = "ClientConnectionFalseEntitlement";
      v8 = "Client connection from [%d] has a 'false' value for entitlement 'com.apple.diagnosticpipeline.request'";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (void)_sendRejectionMessage:(id)a3 rejectionReason:(unint64_t)a4 state:(id)a5
{
  _xpc_connection_s *v6;
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  v7 = a5;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "ServiceMessageType", 1uLL);
  xpc_dictionary_set_uint64(v8, "RejectionType", 1uLL);
  xpc_connection_send_message(v6, v8);
  DPLogHandle_ServiceXPCError();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    objc_msgSend(v7, "stateDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = CFSTR("Missing entitlement 'com.apple.diagnosticpipeline.request'");
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingClientConnection", "Rejecting client connection from %{public}@ due to reason: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  xpc_connection_cancel(v6);

}

- (DRSService)init
{
  DRSService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *messageQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *cloudKitQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *postReceiptWorkQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *uploadRequestLookupQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *configurationSyncQueue;
  NSObject *v13;
  xpc_connection_t mach_service;
  OS_xpc_object *serviceConnection;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *serviceDeactivatedSem;
  void *v18;
  _xpc_connection_s *v19;
  NSObject *v20;
  DRSService *v21;
  NSObject *v22;
  _QWORD v24[4];
  DRSService *v25;
  id v26;
  id location[2];
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)DRSService;
  v2 = -[DRSService init](&v28, sel_init);
  if (!v2)
    goto LABEL_4;
  v3 = dispatch_queue_create("com.apple.diagnosticpipeline service message queue", 0);
  messageQueue = v2->_messageQueue;
  v2->_messageQueue = (OS_dispatch_queue *)v3;

  v5 = dispatch_queue_create("com.apple.diagnosticpipeline service CloudKit work queue", 0);
  cloudKitQueue = v2->_cloudKitQueue;
  v2->_cloudKitQueue = (OS_dispatch_queue *)v5;

  v7 = dispatch_queue_create("com.apple.diagnosticpipeline server post-receipt work queue", 0);
  postReceiptWorkQueue = v2->_postReceiptWorkQueue;
  v2->_postReceiptWorkQueue = (OS_dispatch_queue *)v7;

  v9 = dispatch_queue_create("com.apple.diagnosticpipeline server outstanding upload lookup queue", 0);
  uploadRequestLookupQueue = v2->_uploadRequestLookupQueue;
  v2->_uploadRequestLookupQueue = (OS_dispatch_queue *)v9;

  v11 = dispatch_queue_create("com.apple.diagnosticpipeline server configuration queue", 0);
  configurationSyncQueue = v2->_configurationSyncQueue;
  v2->_configurationSyncQueue = (OS_dispatch_queue *)v11;

  -[DRSService messageQueue](v2, "messageQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.service", v13, 1uLL);
  serviceConnection = v2->_serviceConnection;
  v2->_serviceConnection = mach_service;

  v16 = dispatch_semaphore_create(0);
  serviceDeactivatedSem = v2->_serviceDeactivatedSem;
  v2->_serviceDeactivatedSem = (OS_dispatch_semaphore *)v16;

  v2->_maxSingleSessionUploadSizeInBytes = objc_msgSend((id)objc_opt_class(), "uploadSessionUploadCapBytes");
  v2->_state = 0;
  v2->_isEnabled = objc_msgSend((id)objc_opt_class(), "serviceIsEnabled");
  -[DRSService serviceConnection](v2, "serviceConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_initWeak(location, v2);
    -[DRSService serviceConnection](v2, "serviceConnection");
    v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __18__DRSService_init__block_invoke;
    v24[3] = &unk_1EA3D1608;
    v25 = v2;
    objc_copyWeak(&v26, location);
    xpc_connection_set_event_handler(v19, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
LABEL_4:
    DPLogHandle_ServiceLifecycle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      LOWORD(location[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_1DBC04191, (uint8_t *)location, 2u);
    }

    v21 = v2;
    goto LABEL_10;
  }
  DPLogHandle_ServiceLifecycle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedServiceLaunch", "Could not create connection for mach service", (uint8_t *)location, 2u);
  }

  v21 = 0;
LABEL_10:

  return v21;
}

void __18__DRSService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  DRSClientConnectionState *WeakRetained;
  char v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1DF0B73D0]() == MEMORY[0x1E0C812E0])
  {
    WeakRetained = -[DRSClientConnectionState initWithConnection:service:]([DRSClientConnectionState alloc], "initWithConnection:service:", v3, *(_QWORD *)(a1 + 32));
    v7 = objc_msgSend(*(id *)(a1 + 32), "_connectionHasEntitlement:", v3);
    v8 = *(void **)(a1 + 32);
    if ((v7 & 1) != 0)
      objc_msgSend(v8, "_handleNewEntitledConnection:state:", v3, WeakRetained);
    else
      objc_msgSend(v8, "_sendRejectionMessage:rejectionReason:state:", v3, 1, WeakRetained);
LABEL_15:

    goto LABEL_16;
  }
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ServiceLifecycle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceConnectionInvalidated", (const char *)&unk_1DBC04191, (uint8_t *)&v12, 2u);
    }

    WeakRetained = (DRSClientConnectionState *)objc_loadWeakRetained((id *)(a1 + 40));
    WeakRetained->_hasAdminEntitlement = 2;
    objc_msgSend(*(id *)(a1 + 32), "serviceDeactivatedSem");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v10);

    goto LABEL_15;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    DPLogHandle_ServiceLifecycle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceConnectionInterrupted", (const char *)&unk_1DBC04191, (uint8_t *)&v12, 2u);
    }

  }
  else if (MEMORY[0x1DF0B73D0](v3) != MEMORY[0x1E0C812F8])
  {
    v4 = (void *)MEMORY[0x1DF0B72BC](v3);
    DPLogHandle_ServiceLifecycle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v12 = 136446210;
      v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidMessageType", "Invalid message type unexpected: %{public}s", (uint8_t *)&v12, 0xCu);
    }

    if (v4)
      free(v4);
  }
LABEL_16:

}

- (BOOL)_saveDampeningManagerErrorOut:(id *)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[DRSService dampeningManager](self, "dampeningManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "saveToPersistentContainerWithErrorOut:", a3);

  if ((v6 & 1) != 0)
  {
    DPLogHandle_DampeningManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      -[DRSService dampeningManager](self, "dampeningManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationUpdated", "Saved updated dampening configuration: %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    DPLogHandle_CoreDataError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      v10 = *a3;
      v12 = 138543362;
      v13 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationSaveFailed", "Saving updated configuration failed due to error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v6;
}

- (void)_handleDampeningConfigurationGlobalEnablementMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const char *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "hasAdminEntitlement") & 1) != 0)
  {
    v9 = xpc_dictionary_get_BOOL(v7, "DampeningEnabled");
    DPLogHandle_ServiceXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend(v8, "stateDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("Disabled");
      if (v9)
        v13 = CFSTR("Enabled");
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2114;
      v27 = v13;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationGlobalEnablement", "Accepting global enablement request from %{public}@. Dampening will be %{public}@", buf, 0x16u);

    }
    -[DRSService dampeningManager](self, "dampeningManager");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "enforcementSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllEnforcement:", v9);

    v23 = 0;
    LOBYTE(v14) = -[DRSService _saveDampeningManagerErrorOut:](self, "_saveDampeningManagerErrorOut:", &v23);
    v16 = v23;
    v17 = v16;
    if ((v14 & 1) != 0)
    {
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v7);
    }
    else
    {
      objc_msgSend(v16, "localizedDescription");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "UTF8String");
      if (v21)
        v22 = (const char *)v21;
      else
        v22 = "Unknown save error";
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, v22, v7);

    }
  }
  else
  {
    DPLogHandle_ServiceXPCError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      objc_msgSend(v8, "stateDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = (uint64_t)v19;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationGlobalEnablementRejected", "Rejecting global enablement request from %{public}@ due to missing entitlement", buf, 0xCu);

    }
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Client missing entitlement", v7);
  }

}

- (void)_handleDampeningConfigurationReset:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  DRSDampeningManager *v13;
  void *v14;
  void *v15;
  DRSDampeningManager *v16;
  DRSDampeningManager *dampeningManager;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  id v49;
  id v50;
  uint64_t *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  id v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "hasAdminEntitlement") & 1) != 0)
  {
    DPLogHandle_ServiceXPC();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(v9, "stateDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationReset", "Dampening configuration will be reset to defaults due to request from %{public}@", buf, 0xCu);

    }
    v13 = [DRSDampeningManager alloc];
    -[DRSService serviceContainer](self, "serviceContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "deviceTeamConfigurationDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DRSDampeningManager initWithPersistentContainer:teamConfigurationDirectory:](v13, "initWithPersistentContainer:teamConfigurationDirectory:", v14, v15);
    dampeningManager = self->_dampeningManager;
    self->_dampeningManager = v16;

    -[DRSService serviceContainer](self, "serviceContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "newBackgroundContext");

    -[DRSService dampeningManager](self, "dampeningManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v21 = objc_msgSend((id)objc_opt_class(), "removeExistingDampeningManagerStateFromManagedObjectContext:errorOut:", v19, &v57);
    v22 = v57;

    if ((v21 & 1) != 0)
    {

      v53 = 0;
      v54 = &v53;
      v55 = 0x2020000000;
      v56 = 1;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy__2;
      v60 = __Block_byref_object_dispose__2;
      v61 = 0;
      v45 = MEMORY[0x1E0C809B0];
      v46 = 3221225472;
      v47 = __67__DRSService__handleDampeningConfigurationReset_state_transaction___block_invoke;
      v48 = &unk_1EA3D1630;
      v51 = &v53;
      v49 = v19;
      v52 = buf;
      v50 = v9;
      objc_msgSend(v49, "performBlockAndWait:", &v45);
      v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "localizedDescription");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("Unknown");
        if (v25)
          v27 = (const __CFString *)v25;
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed save dampening manager due to error: %@"), v27, v45, v46, v47, v48, v49);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = *((unsigned __int8 *)v54 + 24);
        if (v28)
        {
          v30 = objc_retainAutorelease(v28);
          v31 = objc_msgSend(v30, "UTF8String");
        }
        else
        {
          v30 = 0;
          v31 = 0;
        }
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v29 = *((unsigned __int8 *)v54 + 24);
      }
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", v29 != 0, v31, v8);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v53, 8);
    }
    else
    {
      DPLogHandle_CoreDataError();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v34))
      {
        objc_msgSend(v9, "stateDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedDescription");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v36)
          v38 = (const __CFString *)v36;
        else
          v38 = CFSTR("Unknown");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v38;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetPersistenceFailure", "Failed to cleanup dampening manager state for reset request from %{public}@ due to error: %{public}@", buf, 0x16u);

      }
      v39 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v22, "localizedDescription");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (v40)
        v42 = (const __CFString *)v40;
      else
        v42 = CFSTR("Unknown");
      objc_msgSend(v39, "stringWithFormat:", CFSTR("Failed to cleanup dampening manager state due to error: %@"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_retainAutorelease(v43);
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, objc_msgSend(v44, "UTF8String"), v8);

    }
  }
  else
  {
    DPLogHandle_ServiceXPCError();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v32))
    {
      objc_msgSend(v9, "stateDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetRejected", "Rejecting reset request from %{public}@ due to missing entitlement", buf, 0xCu);

    }
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Client missing entitlement", v8);
  }

}

void __67__DRSService__handleDampeningConfigurationReset_state_transaction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v11 = 0;
  v3 = objc_msgSend(v2, "save:", &v11);
  v4 = v11;
  v5 = v11;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    DPLogHandle_CoreDataError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "stateDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "localizedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationResetPersistenceFailure", "Failed to save cleaned state for reset request from %{public}@ due to error: %@", buf, 0x16u);

    }
  }

}

- (void)_handleDampeningConfigurationDictMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t uint64;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  DRSDampeningConfiguration *v54;
  void *v55;
  BOOL v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  const char *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "hasAdminEntitlement") & 1) != 0)
  {
    xpc_dictionary_get_value(v7, "EnforceResourceHysteresis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = xpc_dictionary_get_BOOL(v7, "EnforceResourceHysteresis");
      -[DRSService dampeningManager](self, "dampeningManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enforcementSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnforcesResourceHysteresis:", v10);

    }
    xpc_dictionary_get_value(v7, "EnforceResourceCap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = xpc_dictionary_get_BOOL(v7, "EnforceResourceCap");
      -[DRSService dampeningManager](self, "dampeningManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enforcementSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEnforcesResourceCap:", v14);

    }
    xpc_dictionary_get_value(v7, "EnforceResourceDownsampling");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = xpc_dictionary_get_BOOL(v7, "EnforceResourceDownsampling");
      -[DRSService dampeningManager](self, "dampeningManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enforcementSettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEnforcesResourceDownsampling:", v18);

    }
    xpc_dictionary_get_value(v7, "EnforceSignatureHysteresis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureHysteresis");
      -[DRSService dampeningManager](self, "dampeningManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enforcementSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setEnforcesSignatureHysteresis:", v22);

    }
    xpc_dictionary_get_value(v7, "EnforceSignatureCap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureCap");
      -[DRSService dampeningManager](self, "dampeningManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "enforcementSettings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setEnforcesSignatureCap:", v26);

    }
    xpc_dictionary_get_value(v7, "EnforceSignatureDownsampling");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = xpc_dictionary_get_BOOL(v7, "EnforceSignatureDownsampling");
      -[DRSService dampeningManager](self, "dampeningManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "enforcementSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setEnforcesSignatureDownsampling:", v30);

    }
    xpc_dictionary_get_value(v7, "EnforceTotalCap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = xpc_dictionary_get_BOOL(v7, "EnforceTotalCap");
      -[DRSService dampeningManager](self, "dampeningManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "enforcementSettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setEnforcesTotalCap:", v34);

    }
    -[DRSService dampeningManager](self, "dampeningManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "defaultSignatureConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64 = objc_msgSend(v38, "countCap");

    -[DRSService dampeningManager](self, "dampeningManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "defaultSignatureConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hysteresis");
    v43 = v42;

    -[DRSService dampeningManager](self, "dampeningManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "defaultSignatureConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "acceptanceRate");
    v47 = v46;

    xpc_dictionary_get_value(v7, "DefaultSignatureHysteresis");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v48 != 0;
    if (v48)
      v43 = xpc_dictionary_get_double(v7, "DefaultSignatureHysteresis");
    xpc_dictionary_get_value(v7, "DefaultSignatureCap");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      uint64 = xpc_dictionary_get_uint64(v7, "DefaultSignatureCap");
      v49 = 1;
    }
    xpc_dictionary_get_value(v7, "AcceptanceRate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v47 = xpc_dictionary_get_double(v7, "AcceptanceRate");
    }
    else if (!v49)
    {
      goto LABEL_26;
    }
    v54 = -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", uint64, v43, v47);
    -[DRSService dampeningManager](self, "dampeningManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDefaultSignatureConfiguration:", v54);

LABEL_26:
    v61 = 0;
    v56 = -[DRSService _saveDampeningManagerErrorOut:](self, "_saveDampeningManagerErrorOut:", &v61);
    v57 = v61;
    v52 = v57;
    if (v56)
    {
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v7);
    }
    else
    {
      -[NSObject localizedDescription](v57, "localizedDescription");
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v59 = objc_msgSend(v58, "UTF8String");
      if (v59)
        v60 = (const char *)v59;
      else
        v60 = "Unknown save error";
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, v60, v7);

    }
    goto LABEL_32;
  }
  DPLogHandle_ServiceXPCError();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v52))
  {
    objc_msgSend(v8, "stateDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v63 = v53;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v52, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationDictionaryRejected", "Rejecting dampening configuration dictionary request from %{public}@ due to missing entitlement", buf, 0xCu);

  }
LABEL_32:

}

- (void)_handleRefreshDampeningConfigMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  DRSDampeningManager *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  DRSService *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "hasAdminEntitlement") & 1) != 0)
  {
    v9 = [DRSDampeningManager alloc];
    -[DRSService serviceContainer](self, "serviceContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "deviceTeamConfigurationDirectory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DRSDampeningManager initWithPersistentContainer:teamConfigurationDirectory:](v9, "initWithPersistentContainer:teamConfigurationDirectory:", v10, v11);

    if (v12)
    {
      objc_storeStrong((id *)&self->_dampeningManager, v12);
      DPLogHandle_ServiceXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        objc_msgSend(v8, "stateDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v14;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationSucceeded", "Request from %{public}@ succeeded", (uint8_t *)&v21, 0xCu);

      }
      v15 = self;
      v16 = 1;
      v17 = 0;
    }
    else
    {
      DPLogHandle_ServiceXPCError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        objc_msgSend(v8, "stateDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v20;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationFailed", "Request from %{public}@ failed: we could not instantiate a new dampening manager...", (uint8_t *)&v21, 0xCu);

      }
      v17 = "Could not instantiate refreshed dampening manager";
      v15 = self;
      v16 = 0;
    }
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](v15, "_sendAdminRequestReply:rejectionReason:requestMessage:", v16, v17, v7);
  }
  else
  {
    DPLogHandle_ServiceXPCError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v8, "stateDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefreshDampeningConfigurationMessageRejected", "Rejecting refresh dampening configuration request from %{public}@ due to missing entitlement", (uint8_t *)&v21, 0xCu);

    }
  }

}

- (void)_addRequestToDAFileList:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "requestOutcome"))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "teamID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "issueCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("DiagnosticRequest_%@_%@"), v5, v6);

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1EA3D37D0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v3;
    v10 = v9;
    if ((OSAWriteLogForSubmission() & 1) != 0)
    {
      DPLogHandle_DAReporting();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        v12 = "OSAWriteLogForSubmissionSuccess";
        v13 = "Wrote DA log using 'OSAWriteLogForSubmission' for %{public}@";
LABEL_7:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      DPLogHandle_DAReportingError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        v12 = "OSAWriteLogForSubmissionFailed";
        v13 = "Failed to write log using 'OSAWriteLogForSubmission' for %{public}@";
        goto LABEL_7;
      }
    }

  }
}

void __38__DRSService__addRequestToDAFileList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "jsonCompatibleDictionaryRepresentationVerbose:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    objc_msgSend(v3, "writeData:", v5);

  }
  else
  {
    DPLogHandle_DAReportingError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "localizedDescription");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("Unknown");
      if (v9)
        v11 = (const __CFString *)v9;
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONSerializationFailure", "Failed to serialize %{public}@ due to: %{public}@", buf, 0x16u);

    }
  }

}

- (void)_postReceiptProcessingWork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DRSService serviceContainer](self, "serviceContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newBackgroundContext");

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __41__DRSService__postReceiptProcessingWork___block_invoke;
  v20[3] = &unk_1EA3D13B8;
  v8 = v4;
  v21 = v8;
  v9 = v6;
  v22 = v9;
  v23 = &v25;
  v24 = &v29;
  objc_msgSend(v9, "performBlockAndWait:", v20);
  if (*((_BYTE *)v26 + 24))
  {
    DPLogHandle_CoreData();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend(v8, "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestRecordSave", "Saved request %{public}@", buf, 0xCu);

    }
  }
  else
  {
    DPLogHandle_CoreDataError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend(v8, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30[5], "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138412546;
      v36 = v12;
      v37 = 2114;
      v38 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestRecordSaveFailure", "Failed to save request %@ due to error: %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  -[DRSService postReceiptWorkQueue](self, "postReceiptWorkQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __41__DRSService__postReceiptProcessingWork___block_invoke_82;
  v18[3] = &unk_1EA3D1680;
  v18[4] = self;
  v19 = v8;
  v17 = v8;
  dispatch_async(v16, v18);

}

void __41__DRSService__postReceiptProcessingWork___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "updateContextWithRequest_ON_MOC_QUEUE:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  obj = 0;
  v3 = objc_msgSend(v2, "save:", &obj);
  v4 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
}

uint64_t __41__DRSService__postReceiptProcessingWork___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_addRequestToDAFileList:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "isExpedited");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_registerPermissiveExpeditedUploadXPCActivity:", objc_msgSend(*(id *)(a1 + 32), "_randomDelaySecWithCap:", 3600));
  return result;
}

- (void)_handleDRSRequestMessage:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t uint64;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _xpc_connection_s *v26;
  int v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[DRSRequest requestForMessage:](DRSRequest, "requestForMessage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "addAutomatedDeviceGroupContext");
    objc_msgSend((id)objc_opt_class(), "fileDirectory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DPLogHandle_ServiceLifecycle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DPLogHandle_ServiceLifecycleError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DRSConfirmDirectoryIsInitialized(v11, v12, v13);

    uint64 = xpc_dictionary_get_uint64(v7, "ClientMessageType");
    DPLogHandle_ServiceXPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      switch(uint64)
      {
        case 'd':
          v16 = CFSTR("Dampening Global Enablement");
          break;
        case 'e':
          v16 = CFSTR("Dampening Config Reset");
          break;
        case 'f':
          v16 = CFSTR("Dampening Configuration Dictionary");
          break;
        case 'g':
          v16 = CFSTR("CloudKit Work Trigger");
          break;
        case 'h':
          v16 = CFSTR("EnableLogGatheringRequest Result Injection");
          break;
        case 'i':
          v16 = CFSTR("Request Clean Trigger");
          break;
        case 'j':
          v16 = CFSTR("Refresh Dampening Configuration");
          break;
        case 'k':
          v16 = CFSTR("Update CK Config");
          break;
        case 'l':
          v16 = CFSTR("Get CK Config");
          break;
        case 'm':
          v16 = CFSTR("Reset CK Config");
          break;
        case 'n':
          v16 = CFSTR("Schedule Permissive Upload Message");
          break;
        case 'o':
          v16 = CFSTR("Cancel Scheduled Permissive Upload Message");
          break;
        case 'p':
          v16 = CFSTR("Get 'Ignore AutomatedDeviceGroup' setting");
          break;
        case 'q':
          v16 = CFSTR("Set 'Ignore AutomatedDeviceGroup' setting");
          break;
        default:
          v16 = CFSTR("Tailspin request");
          switch(uint64)
          {
            case 0uLL:
              v16 = CFSTR("Invalid");
              break;
            case 1uLL:
              goto LABEL_27;
            case 2uLL:
              v16 = CFSTR("Log Donation request");
              break;
            case 3uLL:
              v16 = CFSTR("Enable Log Gathering request");
              break;
            case 4uLL:
              v16 = CFSTR("Submit Log to CK Container request");
              break;
            case 5uLL:
              v16 = CFSTR("RAPID Log Donation request");
              break;
            default:
              v16 = CFSTR("Unknown");
              break;
          }
          break;
      }
LABEL_27:
      objc_msgSend(v8, "stateDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "teamID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "issueCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "issueDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413314;
      v28 = v16;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v21;
      v35 = 2114;
      v36 = v22;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRequest", "Received '%@' from client %{public}@: %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=issueDescription}@", (uint8_t *)&v27, 0x34u);

    }
    if (-[DRSService isEnabled](self, "isEnabled"))
    {
      -[DRSService dampeningManager](self, "dampeningManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "dampeningOutcomeForRequest:", v10);

    }
    else
    {
      v24 = 8;
    }
    objc_msgSend((id)objc_opt_class(), "fileDirectory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performOnReceiptWork:dampeningOutcome:", v25, v24);

    objc_msgSend(v10, "replyForMessage:", v7);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      xpc_dictionary_get_remote_connection(v7);
      v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v26, v17);

    }
    -[DRSService _postReceiptProcessingWork:](self, "_postReceiptProcessingWork:", v10);
  }
  else
  {
    DPLogHandle_ServiceXPCError();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      objc_msgSend(v8, "stateDescription");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequest", "Received invalid request from client %{public}@", (uint8_t *)&v27, 0xCu);

    }
  }

}

- (void)_finishUploadSessionWithActivity:(id)a3 withState:(int64_t)a4 isExpedited:(BOOL)a5 transaction:(id)a6 completedSuccessfully:(BOOL)a7 endResultString:(id)a8 completionBlock:(id)a9
{
  _BOOL8 v10;
  _xpc_activity_s *v15;
  id v16;
  __CFString *v17;
  void (**v18)(id, _BOOL8, id);
  NSObject *v19;
  const __CFString *v20;
  const char *v21;
  int64_t v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  NSObject *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;

  v10 = a7;
  v39 = *MEMORY[0x1E0C80C00];
  v15 = (_xpc_activity_s *)a3;
  v16 = a6;
  v17 = (__CFString *)a8;
  v18 = (void (**)(id, _BOOL8, id))a9;
  if (a5)
  {
    if (!v15)
      goto LABEL_21;
    DPLogHandle_ServiceLifecycle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v19))
      goto LABEL_20;
    v20 = CFSTR("Success!");
    if (v17)
      v20 = v17;
    *(_DWORD *)buf = 138543362;
    v38 = v20;
    v21 = "CloudKitExpeditedUploadXPCActivity";
    goto LABEL_19;
  }
  v35 = v16;
  v22 = a4;
  v23 = v10;
  -[DRSService serviceContainer](self, "serviceContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v26 = +[DRSRequest cullOldRequestRecordsFromPersistentContainer:currentDate:errorOut:](DRSRequest, "cullOldRequestRecordsFromPersistentContainer:currentDate:errorOut:", v24, v25, &v36);
  v27 = v36;

  DPLogHandle_ServiceLifecycle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_enabled(v28);
  if (v26)
  {
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ContainerCullingSuccess", (const char *)&unk_1DBC04191, buf, 2u);
    }
  }
  else if (v29)
  {
    objc_msgSend(v27, "localizedDescription");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("Unknown");
    if (v30)
      v32 = (const __CFString *)v30;
    *(_DWORD *)buf = 138543362;
    v38 = v32;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ContainerCullingFailure", "Failed to clean container due to error: %{public}@", buf, 0xCu);

  }
  v10 = v23;
  a4 = v22;
  v16 = v35;
  if (v15)
  {
    DPLogHandle_ServiceLifecycle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v19))
    {
LABEL_20:

      xpc_activity_set_state(v15, a4);
      goto LABEL_21;
    }
    v33 = CFSTR("Success!");
    if (v17)
      v33 = v17;
    *(_DWORD *)buf = 138543362;
    v38 = v33;
    v21 = "CloudKitUploadXPCActivity";
LABEL_19:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v21, "Ended with reason: %{public}@", buf, 0xCu);
    goto LABEL_20;
  }
LABEL_21:
  DPLogHandle_ServiceLifecycle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKUploadSession", "Upload session finished with result: %@", buf, 0xCu);
  }

  if (v18)
    v18[2](v18, v10, v17);

}

- (void)_finishReportingStatsSessionWithActivity:(id)a3 withState:(int64_t)a4 transaction:(id)a5 endResultString:(id)a6
{
  __CFString *v8;
  _xpc_activity_s *v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a6;
  if (a3)
  {
    v9 = (_xpc_activity_s *)a3;
    DPLogHandle_ServiceLifecycle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = CFSTR("Success!");
      if (v8)
        v11 = v8;
      v12 = 138543362;
      v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", "Ended with reason: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    xpc_activity_set_state(v9, a4);
  }

}

- (void)_ckQueueDownstreamOnly_uploadInFlightWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 isExpedited:(BOOL)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[DRSService uploadRequestLookupQueue](self, "uploadRequestLookupQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke;
  block[3] = &unk_1EA3D16F0;
  v26 = a6;
  block[4] = self;
  v22 = v13;
  v24 = v14;
  v25 = v15;
  v23 = v12;
  v17 = v14;
  v18 = v15;
  v19 = v12;
  v20 = v13;
  dispatch_sync(v16, block);

}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceLifecycle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    if (*(_BYTE *)(a1 + 72))
      v3 = "YES";
    else
      v3 = "NO";
    *(_DWORD *)buf = 136315138;
    v33 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceCKUploadSession", "isExpedited = %s", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newBackgroundContext");

  if (kDABugTypeString_block_invoke_onceToken != -1)
    dispatch_once(&kDABugTypeString_block_invoke_onceToken, &__block_literal_global_88);
  +[DRSRequest leastRecentDateFirstSortDescriptor](DRSRequest, "leastRecentDateFirstSortDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate;
  if (!*(_BYTE *)(a1 + 72))
    v7 = &kDABugTypeString_block_invoke_waitingForUploadPredicate;
  v8 = (id)*v7;
  v31 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  +[DRSRequest requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:](DRSRequest, "requestsForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v8, v5, v9, 0, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "localizedDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("Unknown");
    if (v13)
      v15 = (const __CFString *)v13;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Request fetch error: %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", *(_QWORD *)(a1 + 40), 5, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), 0, v16, *(_QWORD *)(a1 + 64));
  }
  else if (v10 && objc_msgSend(v10, "count"))
  {
    v17 = *(void **)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 40);
    v18 = objc_msgSend(*(id *)(a1 + 32), "_remainingSessionUploadQuotaBytesWithContext:", v5);
    objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_2;
    v23[3] = &unk_1EA3D16C8;
    v20 = *(id *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 32);
    v24 = v20;
    v25 = v21;
    v26 = v10;
    v29 = *(_BYTE *)(a1 + 72);
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 64);
    objc_msgSend(v17, "uploadRequests:contactDecisionServer:xpcActivity:remainingUploadQuota:backingPersistentContainer:completionHandler:", v26, 1, v22, v18, v19, v23);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", *(_QWORD *)(a1 + 40), 5, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), 1, CFSTR("Success (no outstanding requests)!"), *(_QWORD *)(a1 + 64));
  }

}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_87()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestState == %llu"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kDABugTypeString_block_invoke_waitingForUploadPredicate;
  kDABugTypeString_block_invoke_waitingForUploadPredicate = v0;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestState == %llu AND isExpedited == YES"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate;
  kDABugTypeString_block_invoke_waitingForExpeditedUploadPredicate = v2;

}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  _xpc_activity_s *v7;
  _BOOL4 should_defer;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v46 = a2;
  v45 = a3;
  v44 = a4;
  v7 = *(_xpc_activity_s **)(a1 + 32);
  if (v7)
  {
    should_defer = xpc_activity_should_defer(v7);
    v9 = 5;
    if (should_defer)
      v9 = 3;
  }
  else
  {
    v9 = 5;
  }
  v43 = v9;
  objc_msgSend(*(id *)(a1 + 40), "serviceContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newBackgroundContext");

  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_3;
  v55[3] = &unk_1EA3D13B8;
  v56 = *(id *)(a1 + 48);
  v57 = v11;
  v58 = &v60;
  v59 = &v64;
  v42 = v57;
  objc_msgSend(v57, "performBlockAndWait:", v55);
  if (*((_BYTE *)v61 + 24))
  {
    if (v46)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v46, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Decision server error: %@"), v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v45)
      {
        v17 = (void *)objc_msgSend(CFSTR("CF error(s):\n"), "mutableCopy");
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v26 = v45;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v52 != v28)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "localizedDescription");
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = (void *)v30;
              if (v30)
                v32 = (const __CFString *)v30;
              else
                v32 = CFSTR("Unknown");
              objc_msgSend(v17, "appendFormat:", CFSTR("%@\n"), v32);

            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
          }
          while (v27);
        }

      }
      else
      {
        v17 = 0;
      }
      if (!v44)
        goto LABEL_13;
      v14 = (void *)objc_msgSend(CFSTR("Upload error(s):\n"), "mutableCopy");
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v34 = v44;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v70, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "localizedDescription");
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = (void *)v38;
            if (v38)
              v40 = (const __CFString *)v38;
            else
              v40 = CFSTR("Unknown");
            objc_msgSend(v14, "appendFormat:", CFSTR("%@\n"), v40);

          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v70, 16);
        }
        while (v35);
      }

      if (v17)
      {
        v41 = (id)objc_msgSend(v17, "stringByAppendingString:", v14);
        goto LABEL_12;
      }
      v16 = v14;
      v14 = v16;
    }
    v17 = v16;
LABEL_12:

LABEL_13:
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v20 = *(unsigned __int8 *)(a1 + 72);
    v21 = *(_QWORD *)(a1 + 56);
    if (v17)
    {
      objc_msgSend(v18, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v19, v43, v20 != 0, v21, 0, v17, *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Successfully uploaded %llu requests!"), objc_msgSend(*(id *)(a1 + 48), "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v19, v43, v20 != 0, v21, 1, v33, *(_QWORD *)(a1 + 64));

    }
    goto LABEL_31;
  }
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)v65[5], "localizedDescription");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = CFSTR("Unknown");
  if (v23)
    v25 = (const __CFString *)v23;
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Request upload request state update error: %@"), v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", *(_QWORD *)(a1 + 32), v43, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), 0, v17, *(_QWORD *)(a1 + 64));
LABEL_31:

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

}

void __116__DRSService__ckQueueDownstreamOnly_uploadInFlightWithTransaction_xpcActivity_ckHelper_isExpedited_completionBlock___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
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
  obj = 0;
  v8 = objc_msgSend(v7, "save:", &obj);
  v9 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
}

- (void)_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction:(id)a3 xpcActivity:(id)a4 ckHelper:(id)a5 followupWorkBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  DPLogHandle_ServiceLifecycle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", (const char *)&unk_1DBC04191, buf, 2u);
  }

  -[DRSService serviceContainer](self, "serviceContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newBackgroundContext");

  if (_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__onceToken != -1)
    dispatch_once(&_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__onceToken, &__block_literal_global_112);
  +[DRSEnableDataGatheringQuery leastRecentDateFirstSortDescriptor](DRSEnableDataGatheringQuery, "leastRecentDateFirstSortDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  +[DRSEnableDataGatheringQuery enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:](DRSEnableDataGatheringQuery, "enableDataGatheringQueriesForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", _ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate, v16, v18, 0, &v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v30;
  if (v20)
  {
    DPLogHandle_ServiceLifecycle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      objc_msgSend(v20, "localizedDescription");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = CFSTR("Unknown");
      if (v22)
        v24 = (const __CFString *)v22;
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "ERROR: Failed to look up outstanding queries due to error: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    if (v19 && objc_msgSend(v19, "count"))
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_116;
      v25[3] = &unk_1EA3D1738;
      v25[4] = self;
      v26 = v19;
      v29 = v13;
      v27 = v10;
      v28 = v11;
      objc_msgSend(v12, "shouldEnableDataGathering:xpcActivity:replyHandler:", v26, v28, v25);

      goto LABEL_17;
    }
    DPLogHandle_ServiceLifecycle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "No outstanding queries so no need to contact decision server", buf, 2u);
    }
  }

  if (v13)
    (*((void (**)(id, id, id))v13 + 2))(v13, v10, v11);
LABEL_17:

}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("response == %llu"), 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate;
  _ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock__outstandingQueryPredicate = v0;

}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBackgroundContext");

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_2;
  v20 = &unk_1EA3D13B8;
  v21 = *(id *)(a1 + 40);
  v9 = v8;
  v22 = v9;
  v23 = &v25;
  v24 = &v29;
  objc_msgSend(v9, "performBlockAndWait:", &v17);
  if (*((_BYTE *)v26 + 24))
  {
    DPLogHandle_ServiceLifecycle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "count", v17, v18, v19, v20, v21);
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "Successfully processed %u outstanding queries", buf, 8u);
    }
  }
  else
  {
    DPLogHandle_ServiceLifecycle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend((id)v30[5], "localizedDescription", v17, v18, v19, v20, v21);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown");
      if (v12)
        v14 = (const __CFString *)v12;
      *(_DWORD *)buf = 138543362;
      v36 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ServiceCKEnableDataGatheringQueriesSession", "ERROR: Failed to save updated queries due to error: %{public}@", buf, 0xCu);

    }
  }

  v15 = *(_QWORD *)(a1 + 64);
  if (v15)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    DPLogHandle_ServiceLifecycle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FollowUpBlockMissing", (const char *)&unk_1DBC04191, buf, 2u);
    }

  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

void __125__DRSService__ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction_xpcActivity_ckHelper_followupWorkBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "updateContextWithDataGatheringQuery_ON_MOC_QUEUE:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v7 = *(void **)(a1 + 40);
  obj = 0;
  v8 = objc_msgSend(v7, "save:", &obj);
  v9 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
}

- (void)_runCloudKitUploadWorkSessionWithTransaction:(id)a3 xpcActivity:(id)a4 isExpedited:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[DRSService _updateUploadDate](self, "_updateUploadDate");
  if (v11 && !xpc_activity_set_state((xpc_activity_t)v11, 4))
  {
    -[DRSService _finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:](self, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v11, 5, v7, v10, 0, CFSTR("Failed to mark activity as continued, so bailing on activity"), v12);
  }
  else
  {
    -[DRSService cloudKitQueue](self, "cloudKitQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke;
    block[3] = &unk_1EA3D1788;
    block[4] = self;
    v18 = v7;
    v17 = v12;
    v15 = v10;
    v16 = v11;
    dispatch_async(v13, block);

  }
}

void __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  id v9;
  char v10;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke_2;
  aBlock[3] = &unk_1EA3D1760;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  v2 = _Block_copy(aBlock);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 64))
  {
    (*((void (**)(void *, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "ckHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ckQueueOnly_submitOutstandingEnableDataGatheringQueriesWithTransaction:xpcActivity:ckHelper:followupWorkBlock:", v4, v5, v7, v3);

  }
}

void __99__DRSService__runCloudKitUploadWorkSessionWithTransaction_xpcActivity_isExpedited_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _xpc_activity_s *v5;
  _xpc_activity_s *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && xpc_activity_should_defer(v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v6, 3, *(unsigned __int8 *)(a1 + 48), v9, 0, CFSTR("Deferral before upload work"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "ckHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ckQueueDownstreamOnly_uploadInFlightWithTransaction:xpcActivity:ckHelper:isExpedited:completionBlock:", v9, v6, v8, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

- (void)_runReportingSessionWithTransaction:(id)a3 xpcActivity:(id)a4
{
  id v6;
  _xpc_activity_s *v7;
  _xpc_activity_s *v8;
  NSObject *v9;
  _QWORD block[5];
  _xpc_activity_s *v11;
  id v12;

  v6 = a3;
  v7 = (_xpc_activity_s *)a4;
  v8 = v7;
  if (v7 && !xpc_activity_set_state(v7, 4))
  {
    -[DRSService _finishReportingStatsSessionWithActivity:withState:transaction:endResultString:](self, "_finishReportingStatsSessionWithActivity:withState:transaction:endResultString:", v8, 5, v6, CFSTR("Failed to mark activity as continued, so bailing on activity"));
  }
  else
  {
    -[DRSService cloudKitQueue](self, "cloudKitQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke;
    block[3] = &unk_1EA3D17D8;
    block[4] = self;
    v11 = v8;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  v13 = 0;
  +[DRSRequest unreportedTerminalRequestsFromContext:sortDescriptors:fetchLimit:errorOut:](DRSRequest, "unreportedTerminalRequestsFromContext:sortDescriptors:fetchLimit:errorOut:", v3, 0, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  objc_msgSend(*(id *)(a1 + 32), "ckHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_2;
  v9[3] = &unk_1EA3D17B0;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v4;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v8 = v4;
  objc_msgSend(v6, "reportTerminalRequestStats:xpcActivity:replyHandler:", v8, v7, v9);

}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a2;
  if (v12)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(v12, "localizedDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("Unknown");
    if (v5)
      v7 = (const __CFString *)v5;
    v8 = (id)objc_msgSend(v3, "initWithFormat:", CFSTR("Failed to report stats for %lu requests due to error: %@"), v4, v7);

    objc_msgSend(*(id *)(a1 + 32), "_finishReportingStatsSessionWithActivity:withState:transaction:endResultString:", *(_QWORD *)(a1 + 48), 5, *(_QWORD *)(a1 + 56), v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newBackgroundContext");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_3;
    v13[3] = &unk_1EA3D1680;
    v14 = *(id *)(a1 + 40);
    v15 = v10;
    v8 = v10;
    objc_msgSend(v8, "performBlockAndWait:", v13);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Successfully reported stats for %lu requests"), objc_msgSend(*(id *)(a1 + 40), "count"));
    objc_msgSend(*(id *)(a1 + 32), "_finishReportingStatsSessionWithActivity:withState:transaction:endResultString:", *(_QWORD *)(a1 + 48), 5, *(_QWORD *)(a1 + 56), v11);

  }
}

void __62__DRSService__runReportingSessionWithTransaction_xpcActivity___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "setHasBeenCountedByTelemetry:", 1);
        objc_msgSend(v7, "updateContextWithRequest_ON_MOC_QUEUE:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v4);
  }

  v8 = *(void **)(a1 + 40);
  v16 = 0;
  v9 = objc_msgSend(v8, "save:", &v16);
  v10 = v16;
  if ((v9 & 1) != 0)
  {
    DPLogHandle_CoreData();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v22 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReportRequestStatsSave", "Successfully reported stats for %lu records", buf, 0xCu);
    }
  }
  else
  {
    DPLogHandle_CoreDataError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(v10, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138543362;
      v22 = (uint64_t)v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReportRequestStatsSaveFailure", "Failed to save reported request stats to error: %{public}@", buf, 0xCu);

    }
  }

}

- (double)_resolvedEnableDataGatheringQueryAcceptanceRate
{
  void *v2;
  char v3;
  double result;
  void *v5;
  int v6;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternal");

  result = 1.0;
  if ((v3 & 1) == 0)
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSeed");

    result = 0.01;
    if (v6)
      return 0.1;
  }
  return result;
}

- (BOOL)_enableDataGatheringQueryPassesRandomRejection
{
  -[DRSService _resolvedEnableDataGatheringQueryAcceptanceRate](self, "_resolvedEnableDataGatheringQueryAcceptanceRate");
  return +[DRSDampeningManager passesAcceptanceRate:](DRSDampeningManager, "passesAcceptanceRate:");
}

- (BOOL)_persistEnableLogGatheringResult:(id)a3 workingContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __62__DRSService__persistEnableLogGatheringResult_workingContext___block_invoke;
  v20 = &unk_1EA3D13B8;
  v7 = v5;
  v21 = v7;
  v8 = v6;
  v22 = v8;
  v23 = &v25;
  v24 = &v29;
  objc_msgSend(v8, "performBlockAndWait:", &v17);
  if (*((_BYTE *)v26 + 24))
  {
    DPLogHandle_CoreData();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v7, "debugDescription", v17, v18, v19, v20, v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableDataGatheringRecordSave", "Saved enable data gathering query %{public}@", buf, 0xCu);

    }
  }
  else
  {
    DPLogHandle_CoreDataError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v7, "debugDescription", v17, v18, v19, v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30[5], "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown");
      if (v12)
        v14 = (const __CFString *)v12;
      *(_DWORD *)buf = 138543618;
      v36 = v11;
      v37 = 2114;
      v38 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableDataGatheringRecordSaveFailure", "Failed to enable data gathering query %{public}@ due to error: %{public}@", buf, 0x16u);

    }
  }

  v15 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

void __62__DRSService__persistEnableLogGatheringResult_workingContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "updateContextWithDataGatheringQuery_ON_MOC_QUEUE:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (id)_cachedMatchingQuery:(id)a3 workingContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0;
  +[DRSEnableDataGatheringQuery cachedQueryResponseForQuery:inContext:errorOut:](DRSEnableDataGatheringQuery, "cachedQueryResponseForQuery:inContext:errorOut:", v5, a4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7)
  {
    DPLogHandle_CoreDataError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      objc_msgSend(v5, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("Unknown");
      if (v10)
        v12 = (const __CFString *)v10;
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2114;
      v21 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CachedQueryResultFetchFailure", "Encountered failure when trying to fetch cached results for '%{public}@': %{public}@", buf, 0x16u);

    }
    if (!v6)
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
  }
  else if (!v6)
  {
    DPLogHandle_CoreData();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      objc_msgSend(v5, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CachedQueryResultNotFound", "No cached result for '%{public}@'", buf, 0xCu);

    }
    goto LABEL_13;
  }
  v13 = v6;
LABEL_14:

  return v13;
}

- (void)_handleEnableLogGatheringRequest:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  DRSEnableDataGatheringQuery *v9;
  xpc_object_t reply;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _xpc_connection_s *v21;
  _xpc_connection_s *v22;
  const char *v23;
  const char *v24;
  _xpc_connection_s *v25;
  id v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _xpc_connection_s *v32;
  _xpc_connection_s *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[DRSEnableDataGatheringQuery initWithXPCDict:]([DRSEnableDataGatheringQuery alloc], "initWithXPCDict:", v7);
  reply = xpc_dictionary_create_reply(v7);
  v11 = reply;
  if (v9)
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isLogUploadEnabled");

    if ((v13 & 1) != 0)
    {
      -[DRSService serviceContainer](self, "serviceContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "newBackgroundContext");

      -[DRSService _cachedMatchingQuery:workingContext:](self, "_cachedMatchingQuery:workingContext:", v9, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = v16;
        if (!objc_msgSend(v16, "response") || objc_msgSend(v17, "response") == 2)
        {
          DPLogHandle_CoreData();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v18))
          {
            -[DRSEnableDataGatheringQuery debugDescription](v9, "debugDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "debugDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v19;
            v39 = 2114;
            v40 = v20;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReturningCachedQueryResult", "Returning cached result for enable query '%{public}@': %{public}@", buf, 0x16u);

          }
          xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", objc_msgSend(v17, "response"));
          xpc_dictionary_get_remote_connection(v7);
          v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
          xpc_connection_send_message(v21, v11);

LABEL_23:
          goto LABEL_24;
        }
        DPLogHandle_CoreData();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v29))
        {
          -[DRSEnableDataGatheringQuery debugDescription](v9, "debugDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "debugDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v30;
          v39 = 2114;
          v40 = v31;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoringCachedQueryYES", "Asking again for %@ (Ignoring cached YES result '%{public}@')", buf, 0x16u);

        }
        -[DRSEnableDataGatheringQuery setIsContinue:](v9, "setIsContinue:", 1);
        xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", objc_msgSend(v17, "response"));
        xpc_dictionary_get_remote_connection(v7);
        v32 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v32, v11);

      }
      else if (!-[DRSService _enableDataGatheringQueryPassesRandomRejection](self, "_enableDataGatheringQueryPassesRandomRejection"))
      {
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[DRSService _resolvedEnableDataGatheringQueryAcceptanceRate](self, "_resolvedEnableDataGatheringQueryAcceptanceRate");
        v17 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("Randomized rejection (%.2f%% acceptance rate)"), v27 * 100.0);
        v28 = 0;
LABEL_20:
        -[DRSEnableDataGatheringQuery setResponse:](v9, "setResponse:", v28);
        -[DRSEnableDataGatheringQuery setRejectionReason:](v9, "setRejectionReason:", v17);
        xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", v28);
        xpc_dictionary_get_remote_connection(v7);
        v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v33, v11);

        DPLogHandle_ServiceXPC();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v34))
        {
          -[DRSEnableDataGatheringQuery debugDescription](v9, "debugDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stateDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v38 = v35;
          v39 = 2114;
          v40 = v36;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnableLogGatheringQueryReply", "Replied %@ to query from %{public}@", buf, 0x16u);

        }
        -[DRSService _persistEnableLogGatheringResult:workingContext:](self, "_persistEnableLogGatheringResult:workingContext:", v9, v15);
        goto LABEL_23;
      }
      v17 = 0;
      v28 = 2;
      goto LABEL_20;
    }
    xpc_dictionary_set_uint64(v11, "EnableLogGatheringQueryReply", 0);
    xpc_dictionary_get_remote_connection(v7);
    v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v25, v11);

    DPLogHandle_EnableDataGatheringQuery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      v23 = "CustomerDoesNotApprove";
      v24 = "Rejecting enable data gathering query due to lack of customer approval";
      goto LABEL_13;
    }
  }
  else
  {
    xpc_dictionary_set_uint64(reply, "EnableLogGatheringQueryReply", 3uLL);
    xpc_dictionary_get_remote_connection(v7);
    v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v22, v11);

    DPLogHandle_EnableDataGatheringQueryError();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      v23 = "InvalidEnableDataGatheringQuery";
      v24 = "Rejecting enable data gathering query due to malformed message";
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v23, v24, buf, 2u);
    }
  }
LABEL_24:

}

- (void)_sendAdminRequestReply:(BOOL)a3 rejectionReason:(const char *)a4 requestMessage:(id)a5
{
  _BOOL4 v6;
  id v7;
  xpc_object_t reply;
  NSObject *v9;
  const char *v10;
  const char *v11;
  _xpc_connection_s *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v6 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  reply = xpc_dictionary_create_reply(v7);
  xpc_dictionary_set_BOOL(reply, "AdminRequest_Reply", v6);
  if (a4 && !v6)
    xpc_dictionary_set_string(reply, "AdminRequest_RejectionReason", a4);
  DPLogHandle_ClientXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    v10 = "Rejected";
    if (v6)
      v10 = "Accepted";
    v11 = "Success!";
    if (a4)
      v11 = a4;
    v13 = 136315394;
    v14 = v10;
    v15 = 2082;
    v16 = v11;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestReply", "%s: %{public}s", (uint8_t *)&v13, 0x16u);
  }

  xpc_dictionary_get_remote_connection(v7);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v12, reply);
}

- (void)_rejectInjectRequest:(id)a3 state:(id)a4 reason:(const char *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, a5, a3);
  DPLogHandle_ServiceXPCError();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    objc_msgSend(v8, "stateDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2080;
    v14 = a5;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringResultResult_Rejected", "Rejecting inject enable log gathering result request from %{public}@ due reason: %s", (uint8_t *)&v11, 0x16u);

  }
}

- (void)_handleInjectEnableLogGatheringRequestResult:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  unsigned __int8 uint64;
  const char *v12;
  unsigned __int8 v13;
  DRSEnableDataGatheringQuery *v14;
  DRSEnableDataGatheringQuery *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  DRSEnableDataGatheringQuery *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) == 0)
  {
    v12 = "Missing required entitlement";
    goto LABEL_9;
  }
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternal");

  if ((v9 & 1) == 0)
  {
    v12 = "Device is running non-Internal build";
    goto LABEL_9;
  }
  xpc_dictionary_get_value(v6, "InjectEnableLogGatheringQueryInjectedResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = "Missing injected result parameter";
    goto LABEL_9;
  }
  uint64 = xpc_dictionary_get_uint64(v6, "InjectEnableLogGatheringQueryInjectedResult");
  if ((uint64 & 0xFE) != 0)
  {
    v12 = "Injected response is not a valid value";
LABEL_9:
    -[DRSService _rejectInjectRequest:state:reason:](self, "_rejectInjectRequest:state:reason:", v6, v7, v12);
    goto LABEL_10;
  }
  v13 = uint64;
  v14 = -[DRSEnableDataGatheringQuery initWithXPCDict:]([DRSEnableDataGatheringQuery alloc], "initWithXPCDict:", v6);
  if (!v14)
  {
    v12 = "Malformed query parameters";
    goto LABEL_9;
  }
  v15 = v14;
  -[DRSService serviceContainer](self, "serviceContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "newBackgroundContext");

  -[DRSService _cachedMatchingQuery:workingContext:](self, "_cachedMatchingQuery:workingContext:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    DPLogHandle_CoreData();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      -[DRSEnableDataGatheringQuery debugDescription](v15, "debugDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v20;
      v28 = 2114;
      v29 = v21;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatingCachedQueryResultFound", "Updating cached result for '%{public}@': %{public}@", (uint8_t *)&v26, 0x16u);

    }
    v22 = v18;

    v15 = v22;
  }

  -[DRSEnableDataGatheringQuery setResponse:](v15, "setResponse:", v13);
  if (-[DRSEnableDataGatheringQuery response](v15, "response") != 1)
    -[DRSEnableDataGatheringQuery setRejectionReason:](v15, "setRejectionReason:", CFSTR("Injected response"));
  if (-[DRSService _persistEnableLogGatheringResult:workingContext:](self, "_persistEnableLogGatheringResult:workingContext:", v15, v17))
  {
    DPLogHandle_ServiceXPC();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      objc_msgSend(v7, "stateDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSEnableDataGatheringQuery debugDescription](v15, "debugDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v24;
      v28 = 2114;
      v29 = v25;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringResultResult_Accepted", "Accepted inject enable log gathering result request from %{public}@: %{public}@", (uint8_t *)&v26, 0x16u);

    }
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v6);
  }
  else
  {
    -[DRSService _rejectInjectRequest:state:reason:](self, "_rejectInjectRequest:state:reason:", v6, v7, "Failed to persist injected result");
  }

LABEL_10:
}

- (void)_handleCKWorkTriggerRequest:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "hasAdminEntitlement") & 1) != 0)
  {
    v11 = xpc_dictionary_get_BOOL(v8, "isExpedited");
    v12 = xpc_dictionary_get_BOOL(v8, "isAsync");
    DPLogHandle_ServiceXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      objc_msgSend(v9, "stateDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      if (v11)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v27 = v17;
      v26 = 2112;
      if (v12)
        v16 = CFSTR("YES");
      v28 = 2112;
      v29 = v16;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKWorkTrigger", "Triggering CK work due to request from %{public}@. Expedited:%@, Async:%@", buf, 0x20u);

    }
    if (v12)
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v8);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__DRSService__handleCKWorkTriggerRequest_state_transaction___block_invoke;
    v20[3] = &unk_1EA3D1800;
    v23 = v12;
    v20[4] = self;
    v21 = v8;
    v22 = v10;
    -[DRSService _runCloudKitUploadWorkSessionWithTransaction:xpcActivity:isExpedited:completionBlock:](self, "_runCloudKitUploadWorkSessionWithTransaction:xpcActivity:isExpedited:completionBlock:", v22, 0, v11, v20);

  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v8);
    DPLogHandle_ServiceXPCError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      objc_msgSend(v9, "stateDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = (uint64_t)v19;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKWorkTriggerRejected", "Rejecting CK work trigger from %{public}@ due to missing entitlement", buf, 0xCu);

    }
  }

}

uint64_t __60__DRSService__handleCKWorkTriggerRequest_state_transaction___block_invoke(uint64_t result, uint64_t a2, id a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;

  if (!*(_BYTE *)(result + 56))
  {
    v4 = result;
    v5 = *(void **)(result + 32);
    v6 = objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    if (v6)
      v7 = (const char *)v6;
    else
      v7 = "Unknown rejection reason";
    return objc_msgSend(v5, "_sendAdminRequestReply:rejectionReason:requestMessage:", a2, v7, *(_QWORD *)(v4 + 40));
  }
  return result;
}

- (void)_handleRequestCleanTrigger:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  void *v16;
  char *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    v8 = xpc_dictionary_get_BOOL(v6, "KeepRequestRecords");
    v9 = xpc_dictionary_get_BOOL(v6, "KeepRequestLogs");
    -[DRSService serviceContainer](self, "serviceContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v11 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:](DRSRequest, "cleanRequestRecordsFromPersistentContainer:removeFiles:removeRecord:matchingPredicate:errorOut:", v10, !v9, !v8, 0, &v28);
    v12 = v28;

    if (v11)
    {
      DPLogHandle_ServiceXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        if (v8)
          v14 = "YES";
        else
          v14 = "NO";
        if (v9)
          v15 = "YES";
        else
          v15 = "NO";
        objc_msgSend(v7, "stateDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v30 = v14;
        v31 = 2082;
        v32 = v15;
        v33 = 2114;
        v34 = v16;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Success", "clean request records with 'KeepRecords' %{public}s ' KeepLogs' %{public}s from %{public}@ succeeded", buf, 0x20u);

      }
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v6);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[NSObject localizedDescription](v12, "localizedDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("Unknown");
      if (v19)
        v21 = (const __CFString *)v19;
      v22 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("Error encountered trying to clean records: %@"), v21);

      v23 = objc_retainAutorelease(v22);
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, objc_msgSend(v23, "UTF8String"), v6);
      DPLogHandle_ServiceXPCError();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v24))
      {
        if (v8)
          v25 = "YES";
        else
          v25 = "NO";
        if (v9)
          v26 = "YES";
        else
          v26 = "NO";
        objc_msgSend(v7, "stateDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v30 = v25;
        v31 = 2082;
        v32 = v26;
        v33 = 2114;
        v34 = v27;
        v35 = 2114;
        v36 = v23;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Failed", "Failed to clean request records with 'KeepRecords' %{public}s ' KeepLogs' %{public}s from %{public}@ due reason: %{public}@", buf, 0x2Au);

      }
    }
  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v7, "stateDescription");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCleanTrigger_Rejected", "Rejecting request to clean request records from %{public}@ due to missing entitlement", buf, 0xCu);

    }
  }

}

- (void)_addCKConfigSettingsToReplyMessage:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a3;
  -[DRSService ckConfig](self, "ckConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containerEnvironment") == 1;

  -[DRSService ckConfig](self, "ckConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "rapidEnvironment") == 1;

  xpc_dictionary_set_BOOL(xdict, "ContainerEnv", v5);
  xpc_dictionary_set_BOOL(xdict, "RapidEnv", (BOOL)v4);

}

- (void)_replyToCKConfigMessageWithCurrentCKConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  _xpc_connection_s *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _acceptingAdminReplyMessage(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSService ckConfig](self, "ckConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containerEnvironment");

  -[DRSService ckConfig](self, "ckConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rapidEnvironment");

  xpc_dictionary_set_BOOL(v5, "ContainerEnv", v7 == 1);
  xpc_dictionary_set_BOOL(v5, "RapidEnv", v9 == 1);
  -[DRSService ckConfig](self, "ckConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v5, "OverridesDefault", objc_msgSend(v10, "overridesDefault"));

  DPLogHandle_ClientXPC();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    v12 = "Sandbox";
    if (v7 == 1)
      v13 = "Prod";
    else
      v13 = "Sandbox";
    if (v9 == 1)
      v12 = "Prod";
    v15 = 136446466;
    v16 = v13;
    v17 = 2082;
    v18 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigRequestReply", "Container environment: %{public}s, RAPID environment: %{public}s", (uint8_t *)&v15, 0x16u);
  }

  xpc_dictionary_get_remote_connection(v4);
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v14, v5);
}

- (id)_updateCKConfig:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[DRSService cloudKitQueue](self, "cloudKitQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__DRSService__updateCKConfig___block_invoke;
  block[3] = &unk_1EA3D0EB8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __30__DRSService__updateCKConfig___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  id obj;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "ckConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSCloudKitHelper helperForCKConfig:](DRSCloudKitHelper, "helperForCKConfig:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v3;

  objc_msgSend(*(id *)(a1 + 32), "ckConfigStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "ckConfigStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v7, "saveConfig:errorOut:", v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);

    if ((v10 & 1) != 0)
    {
      DPLogHandle_ServiceXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        objc_msgSend(*(id *)(a1 + 32), "ckConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "debugDescription");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceCKConfigUpdated", "Service CK Config updated to: %{public}@", buf, 0xCu);

LABEL_9:
      }
    }
    else
    {
      DPLogHandle_ServiceXPCError();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
        v14 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v14;
        v15 = CFSTR("Unknown");
        if (v14)
          v15 = (const __CFString *)v14;
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceCKConfigUpdate_Failed", "Service CK Config failed to update due to reason: %{public}@", buf, 0xCu);
        goto LABEL_9;
      }
    }

  }
}

- (void)_handleCKConfigUpdate:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  DRSCKConfig *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const char *v30;
  _BYTE v31[24];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    v8 = xpc_dictionary_get_BOOL(v6, "ContainerEnv");
    v9 = xpc_dictionary_get_BOOL(v6, "RapidEnv");
    v10 = v9;
    if (v8)
      v11 = 1;
    else
      v11 = 2;
    if (v9)
      v12 = 1;
    else
      v12 = 2;
    DPLogHandle_ServiceXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      objc_msgSend(v7, "stateDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = "Sandbox";
      if (v8)
        v17 = "Prod";
      else
        v17 = "Sandbox";
      *(_DWORD *)v31 = 138543874;
      *(_QWORD *)&v31[4] = v14;
      *(_WORD *)&v31[12] = 2082;
      *(_QWORD *)&v31[14] = v17;
      if (v10)
        v16 = "Prod";
      *(_WORD *)&v31[22] = 2082;
      v32 = v16;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_Status", "Client %{public}@ requesting: Container environment: %{public}s, RAPID environment: %{public}s", v31, 0x20u);

    }
    -[DRSService ckConfig](self, "ckConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containerEnvironment") == v11)
    {
      -[DRSService ckConfig](self, "ckConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "rapidEnvironment");

      if (v20 == v12)
      {
        DPLogHandle_ServiceXPC();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          objc_msgSend(v7, "stateDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v31 = 138543362;
          *(_QWORD *)&v31[4] = v22;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_AlreadySet", "Config is already what client %{public}@ is asking for", v31, 0xCu);

        }
        -[DRSService _replyToCKConfigMessageWithCurrentCKConfig:](self, "_replyToCKConfigMessageWithCurrentCKConfig:", v6);
        goto LABEL_31;
      }
    }
    else
    {

    }
    v25 = -[DRSCKConfig initWithContainerEnvironment:rapidEnvironment:overridesDefault:]([DRSCKConfig alloc], "initWithContainerEnvironment:rapidEnvironment:overridesDefault:", v11, v12, 1);
    -[DRSService _updateCKConfig:](self, "_updateCKConfig:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "localizedDescription");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      if (v29)
        v30 = (const char *)v29;
      else
        v30 = "Unknown";
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, v30, v6, *(_OWORD *)v31, *(_QWORD *)&v31[16]);

    }
    else
    {
      -[DRSService _replyToCKConfigMessageWithCurrentCKConfig:](self, "_replyToCKConfigMessageWithCurrentCKConfig:", v6);
    }

  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      objc_msgSend(v7, "stateDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 138543362;
      *(_QWORD *)&v31[4] = v24;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigUpdate_Rejected", "Rejecting request to update CK config %{public}@ due to missing entitlement", v31, 0xCu);

    }
  }
LABEL_31:

}

- (void)_handleGetCKConfig:(id)a3 state:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v6, "hasAdminEntitlement") & 1) != 0)
  {
    -[DRSService _replyToCKConfigMessageWithCurrentCKConfig:](self, "_replyToCKConfigMessageWithCurrentCKConfig:", v7);
  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v7);

    DPLogHandle_ServiceXPCError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(v6, "stateDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCKConfig_Rejected", "Rejecting request for current CK config %{public}@ due to missing entitlement", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)_handleResetCKConfig:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    +[DRSCKConfig defaultConfig](DRSCKConfig, "defaultConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSService _updateCKConfig:](self, "_updateCKConfig:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "localizedDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      if (v11)
        v12 = (const char *)v11;
      else
        v12 = "Unknown";
      -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, v12, v6);

    }
    else
    {
      -[DRSService _replyToCKConfigMessageWithCurrentCKConfig:](self, "_replyToCKConfigMessageWithCurrentCKConfig:", v6);
    }

  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      objc_msgSend(v7, "stateDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCKConfig_Rejected", "Rejecting request to reset CK config %{public}@ due to missing entitlement", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)_handleUploadSchedulingRequest:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    -[DRSService _registerPermissiveExpeditedUploadXPCActivity:](self, "_registerPermissiveExpeditedUploadXPCActivity:", xpc_dictionary_get_uint64(v6, "delaySeconds"));
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v6);
  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      objc_msgSend(v7, "stateDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSchedulingRequest_Rejected", "Rejecting request to schedule a more permissive expedited upload from %{public}@ due to missing entitlement", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)_handleCancelScheduledUploadRequest:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    DPLogHandle_PermissiveUploadActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      objc_msgSend(v7, "stateDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadRequest", "Cancelling scheduled permissive expedited upload due to request from %{public}@", (uint8_t *)&v12, 0xCu);

    }
    -[DRSService _unregisterPermissiveExpeditedUploadXPCActivity](self, "_unregisterPermissiveExpeditedUploadXPCActivity");
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 1, 0, v6);
  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      objc_msgSend(v7, "stateDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadRequest_Rejected", "Rejecting request to cancel scheduled permissive expedited upload from %{public}@ due to missing entitlement", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (void)_sendCurrentIgnoreADGReply:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  _xpc_connection_s *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _acceptingAdminReplyMessage(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSService ignoreAutomatedDeviceGroup](self, "ignoreAutomatedDeviceGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DRSService ignoreAutomatedDeviceGroup](self, "ignoreAutomatedDeviceGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_BOOL(v6, "IgnoreADGValue", objc_msgSend(v8, "BOOLValue"));

  }
  DPLogHandle_ClientXPC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    -[DRSService ignoreAutomatedDeviceGroup](self, "ignoreAutomatedDeviceGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("<none>");
    if (v10)
      v12 = (const __CFString *)v10;
    v14 = 138543362;
    v15 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IgnoreADGRequestReply", "Current value: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  xpc_dictionary_get_remote_connection(v5);
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v13, v6);
}

- (void)_handleGetIgnoreADG:(id)a3 state:(id)a4
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v6, "hasAdminEntitlement") & 1) != 0)
  {
    -[DRSService _sendCurrentIgnoreADGReply:state:](self, "_sendCurrentIgnoreADGReply:state:", v7, v6);
  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v7);

    DPLogHandle_ServiceXPCError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      v8[0] = 67109120;
      v8[1] = objc_msgSend(v6, "pid");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetIgnoreADG_Rejected", "Rejecting request for current 'Ignore AutomatedDeviceGroup' setting [%d] due to missing entitlement", (uint8_t *)v8, 8u);
    }
  }

}

- (void)_handleSetIgnoreADG:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasAdminEntitlement") & 1) != 0)
  {
    xpc_dictionary_get_value(v6, "IgnoreADGValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", xpc_dictionary_get_BOOL(v6, "IgnoreADGValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[DRSService setIgnoreAutomatedDeviceGroup:](self, "setIgnoreAutomatedDeviceGroup:", v9);
    -[DRSService _sendCurrentIgnoreADGReply:state:](self, "_sendCurrentIgnoreADGReply:state:", v6, v7);

  }
  else
  {
    -[DRSService _sendAdminRequestReply:rejectionReason:requestMessage:](self, "_sendAdminRequestReply:rejectionReason:requestMessage:", 0, "Missing required entitlement", v6);
    DPLogHandle_ServiceXPCError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11[0] = 67109120;
      v11[1] = objc_msgSend(v7, "pid");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetIgnoreADG_Rejected", "Rejecting request to update 'Ignore AutomatedDeviceGroup' setting [%d] due to missing entitlement", (uint8_t *)v11, 8u);
    }

  }
}

- (void)handleRequest:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t uint64;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1DF0B6DC4]();
  v9 = (void *)os_transaction_create();
  uint64 = xpc_dictionary_get_uint64(v6, "ClientMessageType");
  switch(uint64)
  {
    case 'd':
      -[DRSService _handleDampeningConfigurationGlobalEnablementMessage:state:transaction:](self, "_handleDampeningConfigurationGlobalEnablementMessage:state:transaction:", v6, v7, v9);
      goto LABEL_6;
    case 'e':
      -[DRSService _handleDampeningConfigurationReset:state:transaction:](self, "_handleDampeningConfigurationReset:state:transaction:", v6, v7, v9);
      goto LABEL_6;
    case 'f':
      -[DRSService _handleDampeningConfigurationDictMessage:state:transaction:](self, "_handleDampeningConfigurationDictMessage:state:transaction:", v6, v7, v9);
      goto LABEL_6;
    case 'g':
      -[DRSService _handleCKWorkTriggerRequest:state:transaction:](self, "_handleCKWorkTriggerRequest:state:transaction:", v6, v7, v9);
      goto LABEL_6;
    case 'h':
      -[DRSService _handleInjectEnableLogGatheringRequestResult:state:](self, "_handleInjectEnableLogGatheringRequestResult:state:", v6, v7);
      goto LABEL_6;
    case 'i':
      -[DRSService _handleRequestCleanTrigger:state:](self, "_handleRequestCleanTrigger:state:", v6, v7);
      goto LABEL_6;
    case 'j':
      -[DRSService _handleRefreshDampeningConfigMessage:state:transaction:](self, "_handleRefreshDampeningConfigMessage:state:transaction:", v6, v7, v9);
      goto LABEL_6;
    case 'k':
      -[DRSService _handleCKConfigUpdate:state:](self, "_handleCKConfigUpdate:state:", v6, v7);
      goto LABEL_6;
    case 'l':
      -[DRSService _handleGetCKConfig:state:](self, "_handleGetCKConfig:state:", v6, v7);
      goto LABEL_6;
    case 'm':
      -[DRSService _handleResetCKConfig:state:](self, "_handleResetCKConfig:state:", v6, v7);
      goto LABEL_6;
    case 'n':
      -[DRSService _handleUploadSchedulingRequest:state:](self, "_handleUploadSchedulingRequest:state:", v6, v7);
      goto LABEL_6;
    case 'o':
      -[DRSService _handleCancelScheduledUploadRequest:state:](self, "_handleCancelScheduledUploadRequest:state:", v6, v7);
      goto LABEL_6;
    case 'p':
      -[DRSService _handleGetIgnoreADG:state:](self, "_handleGetIgnoreADG:state:", v6, v7);
      goto LABEL_6;
    case 'q':
      -[DRSService _handleSetIgnoreADG:state:](self, "_handleSetIgnoreADG:state:", v6, v7);
      goto LABEL_6;
    default:
      v11 = uint64;
      if (uint64 > 5)
        goto LABEL_22;
      if (((1 << uint64) & 0x36) != 0)
      {
        -[DRSService _handleDRSRequestMessage:state:transaction:](self, "_handleDRSRequestMessage:state:transaction:", v6, v7, v9);
      }
      else if (uint64 == 3)
      {
        -[DRSService _handleEnableLogGatheringRequest:state:transaction:](self, "_handleEnableLogGatheringRequest:state:transaction:", v6, v7, v9);
      }
      else
      {
LABEL_22:
        DPLogHandle_ServiceXPCError();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v12))
        {
          objc_msgSend(v7, "stateDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 134349314;
          v15 = v11;
          v16 = 2114;
          v17 = v13;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnknownRequest", "Received unknown request %{public}llu from client %{public}@", (uint8_t *)&v14, 0x16u);

        }
      }
LABEL_6:

      objc_autoreleasePoolPop(v8);
      return;
  }
}

- (void)_handleNewEntitledConnection:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[DRSService _waitForDeviceUnlockAndInitializeServiceState](self, "_waitForDeviceUnlockAndInitializeServiceState");
  DPLogHandle_ServiceLifecycle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    objc_msgSend(v6, "stateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewClientConnection", "New connection from client %{public}@", (uint8_t *)&v10, 0xCu);

  }
  -[DRSService _sendCurrentConfigurationToConnection:](self, "_sendCurrentConfigurationToConnection:", v7);

}

- (BOOL)activateService
{
  NSObject *v3;
  _QWORD block[5];

  -[DRSService _configureXPCActivities](self, "_configureXPCActivities");
  -[DRSService messageQueue](self, "messageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DRSService_activateService__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  dispatch_sync(v3, block);

  return 1;
}

void __29__DRSService_activateService__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if (v2)
  {
    if (v4)
    {
      DRSStringForServiceState(objc_msgSend(*(id *)(a1 + 32), "state"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantServiceActivation", "Tried to activate while in state: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ServiceActivation", (const char *)&unk_1DBC04191, (uint8_t *)&v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    xpc_connection_activate((xpc_connection_t)v3);
  }

}

- (void)deactivateService
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  uint8_t *v6;
  _xpc_connection_s *v7;
  __int16 v8;
  __int16 v9;

  if (-[DRSService state](self, "state") == 2)
  {
    DPLogHandle_ServiceLifecycle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v9 = 0;
      v4 = "RedundantServiceDeactivation";
      v5 = "Tried to deactivate already deactivated service";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v4, v5, v6, 2u);
    }
  }
  else
  {
    self->_state = 2;
    -[DRSService serviceConnection](self, "serviceConnection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v7);

    DPLogHandle_ServiceLifecycle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v8 = 0;
      v4 = "ServiceDeactivated";
      v5 = (const char *)&unk_1DBC04191;
      v6 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[DRSService deactivateService](self, "deactivateService");
  v3.receiver = self;
  v3.super_class = (Class)DRSService;
  -[DRSService dealloc](&v3, sel_dealloc);
}

- (void)_configureXPCActivities
{
  -[DRSService _configureUploadXPCActivity](self, "_configureUploadXPCActivity");
  -[DRSService _configureExpeditedUploadXPCActivity](self, "_configureExpeditedUploadXPCActivity");
  -[DRSService _configureBackstopUploadXPCActivity](self, "_configureBackstopUploadXPCActivity");
  -[DRSService _configureReportStatsXPCActivity](self, "_configureReportStatsXPCActivity");
}

- (void)_configureUploadXPCActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringUploadXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__DRSService__configureUploadXPCActivity__block_invoke;
  handler[3] = &unk_1EA3D11E0;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_activity", v4, handler);
}

void __41__DRSService__configureUploadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  _BOOL4 should_defer;
  void *v14;
  uint8_t buf[4];
  xpc_activity_state_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v6 = state;
    if (state)
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v6;
        v8 = "CloudKitXPCActivityUnknownState";
        v9 = "Unknown XPC activity state %ld";
        v10 = v7;
        v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        v8 = "UploadXPCActivityCheckIn";
        v9 = (const char *)&unk_1DBC04191;
        v10 = v7;
        v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
      }
    }

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
  DPLogHandle_ServiceLifecycle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitUploadXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
  {
    should_defer = xpc_activity_should_defer(v3);
    v14 = *(void **)(a1 + 32);
    if (should_defer)
    {
      objc_msgSend(v14, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 3, 0, v4, 0, CFSTR("Immediate deferral"), 0);
    }
    else
    {
      objc_msgSend(v14, "_unregisterPermissiveExpeditedUploadXPCActivity");
      objc_msgSend(*(id *)(a1 + 32), "_runCloudKitUploadWorkSessionWithTransaction:xpcActivity:isExpedited:completionBlock:", v4, v3, 0, 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 5, 0, v4, 0, CFSTR("Service is disabled"), 0);
  }
LABEL_17:

}

- (void)_configureExpeditedUploadXPCActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringExpeditedUploadXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__DRSService__configureExpeditedUploadXPCActivity__block_invoke;
  handler[3] = &unk_1EA3D11E0;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_expedited_upload", v4, handler);
}

void __50__DRSService__configureExpeditedUploadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  _BOOL4 should_defer;
  void *v14;
  uint8_t buf[4];
  xpc_activity_state_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v6 = state;
    if (state)
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v6;
        v8 = "ExpeditedCloudKitXPCActivityUnknownState";
        v9 = "Unknown XPC activity state %ld";
        v10 = v7;
        v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        v8 = "ExpeditedUploadXPCActivityCheckIn";
        v9 = (const char *)&unk_1DBC04191;
        v10 = v7;
        v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, buf, v11);
      }
    }

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
  DPLogHandle_ServiceLifecycle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitExpeditedUploadXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
  {
    should_defer = xpc_activity_should_defer(v3);
    v14 = *(void **)(a1 + 32);
    if (should_defer)
    {
      objc_msgSend(v14, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 3, 1, v4, 0, CFSTR("Immediate deferral"), 0);
    }
    else
    {
      objc_msgSend(v14, "_unregisterPermissiveExpeditedUploadXPCActivity");
      objc_msgSend(*(id *)(a1 + 32), "_runCloudKitUploadWorkSessionWithTransaction:xpcActivity:isExpedited:completionBlock:", v4, v3, 1, 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 5, 1, v4, 0, CFSTR("Service is disabled"), 0);
  }
LABEL_17:

}

- (unsigned)_randomDelaySecWithCap:(unsigned int)a3
{
  return arc4random_uniform(a3 + 1);
}

- (id)_permissiveXPCActivitCriteriaDict:(unsigned int)a3
{
  xpc_object_t v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80858], 20971520);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], a3);
  return v4;
}

- (void)_configurePermissiveActivityCriteria:(id)a3 delaySeconds:(unsigned int)a4
{
  uint64_t v4;
  _xpc_activity_s *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v10 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_activity_s *)a3;
  -[DRSService _permissiveXPCActivitCriteriaDict:](self, "_permissiveXPCActivitCriteriaDict:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_activity_set_criteria(v6, v7);

  DPLogHandle_PermissiveUploadActivity();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    v9[0] = 67240192;
    v9[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatePermissiveActivity", "%{public, name=delaySeconds}u second(s) delay", (uint8_t *)v9, 8u);
  }

}

- (void)_unregisterPermissiveExpeditedUploadXPCActivity
{
  NSObject *v2;
  uint8_t v3[16];

  DPLogHandle_PermissiveUploadActivity();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelScheduledUploadActivity", (const char *)&unk_1DBC04191, v3, 2u);
  }

  xpc_activity_unregister("com.apple.diagnosticpipeline.cloudkit_permissive_upload");
}

- (void)_registerPermissiveExpeditedUploadXPCActivity:(unsigned int)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  unsigned int v8;
  uint8_t buf[4];
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  DPLogHandle_PermissiveUploadActivity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 67240192;
    v10 = a3;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SchedulingPermissiveExpeditedUploadXPCActivity", "%{public, name=delaySeconds}u second(s) delay", buf, 8u);
  }

  v6 = (void *)*MEMORY[0x1E0C80748];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke;
  v7[3] = &unk_1EA3D1850;
  v7[4] = self;
  v8 = a3;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_permissive_upload", v6, v7);
}

void __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 should_defer;
  void *v10;
  xpc_object_t v11;
  void *v12;
  NSObject *v13;
  int64_t int64;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  state = xpc_activity_get_state(v3);
  if (state)
  {
    v6 = state;
    if (state == 2)
    {
      DPLogHandle_PermissiveUploadActivity();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RunPermissiveUploadActivity", (const char *)&unk_1DBC04191, buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
      DPLogHandle_ServiceLifecycle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitExpeditedUploadXPCActivitySingleton permissive expedited upload activity", (const char *)&unk_1DBC04191, buf, 2u);
      }

      if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
      {
        should_defer = xpc_activity_should_defer(v3);
        v10 = *(void **)(a1 + 32);
        if (should_defer)
        {
          objc_msgSend(v10, "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 3, 1, v4, 0, CFSTR("Immediate deferral"), 0);
        }
        else
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke_166;
          v16[3] = &unk_1EA3D1828;
          v16[4] = v10;
          objc_msgSend(v10, "_runCloudKitUploadWorkSessionWithTransaction:xpcActivity:isExpedited:completionBlock:", v4, v3, 1, v16);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_finishUploadSessionWithActivity:withState:isExpedited:transaction:completedSuccessfully:endResultString:completionBlock:", v3, 5, 1, v4, 0, CFSTR("Service is disabled"), 0);
        objc_msgSend(*(id *)(a1 + 32), "_unregisterPermissiveExpeditedUploadXPCActivity");
      }
    }
    else
    {
      DPLogHandle_PermissiveUploadActivity();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 134217984;
        v18 = v6;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PermissiveCloudKitXPCActivityUnknownState", "Unexpected XPC activity state %ld", buf, 0xCu);
      }

    }
  }
  else
  {
    v11 = xpc_activity_copy_criteria(v3);
    v12 = v11;
    if (v11 && xpc_dictionary_get_count(v11))
    {
      DPLogHandle_PermissiveUploadActivity();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        int64 = xpc_dictionary_get_int64(v12, (const char *)*MEMORY[0x1E0C80760]);
        *(_DWORD *)buf = 134349056;
        v18 = int64;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PermissiveActivityAlreadyScheduled", "Activity already scheduled with %{public, name=delaySeconds}lld s as a delay cap", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_configurePermissiveActivityCriteria:delaySeconds:", v3, *(unsigned int *)(a1 + 40));
    }

  }
}

uint64_t __60__DRSService__registerPermissiveExpeditedUploadXPCActivity___block_invoke_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterPermissiveExpeditedUploadXPCActivity");
}

- (void)_configureReportStatsXPCActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  DPLogHandle_ServiceLifecycle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfiguringReportStatsXPCActivity", (const char *)&unk_1DBC04191, buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __46__DRSService__configureReportStatsXPCActivity__block_invoke;
  handler[3] = &unk_1EA3D11E0;
  handler[4] = self;
  xpc_activity_register("com.apple.diagnosticpipeline.cloudkit_report_stats", v4, handler);
}

void __46__DRSService__configureReportStatsXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL4 should_defer;
  void *v16;
  const __CFString *v17;
  _xpc_activity_s *v18;
  uint64_t v19;
  int v20;
  xpc_activity_state_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v6 = state;
    if (state)
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        v20 = 134217984;
        v21 = v6;
        v8 = "CloudKitXPCActivityUnknownState";
        v9 = "Unknown XPC activity state %ld";
        v10 = v7;
        v11 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      DPLogHandle_ServiceLifecycle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v20) = 0;
        v8 = "ReportStatsXPCActivityCheckIn";
        v9 = (const char *)&unk_1DBC04191;
        v10 = v7;
        v11 = 2;
LABEL_12:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, (uint8_t *)&v20, v11);
      }
    }

    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 32), "_waitForDeviceUnlockAndInitializeServiceState");
  v12 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  DPLogHandle_ServiceLifecycle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_enabled(v13);
  if ((v12 & 1) != 0)
  {
    if (v14)
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", (const char *)&unk_1DBC04191, (uint8_t *)&v20, 2u);
    }

    should_defer = xpc_activity_should_defer(v3);
    v16 = *(void **)(a1 + 32);
    if (!should_defer)
    {
      objc_msgSend(v16, "_runReportingSessionWithTransaction:xpcActivity:", v4, v3);
      goto LABEL_19;
    }
    v17 = CFSTR("Immediate deferral");
    v18 = v3;
    v19 = 3;
  }
  else
  {
    if (v14)
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudKitReportStatsXPCActivity", "No-op XPC activity since the service is disabled", (uint8_t *)&v20, 2u);
    }

    v16 = *(void **)(a1 + 32);
    v17 = CFSTR("Service is disabled");
    v18 = v3;
    v19 = 5;
  }
  objc_msgSend(v16, "_finishReportingStatsSessionWithActivity:withState:transaction:endResultString:", v18, v19, v4, v17);
LABEL_19:

}

+ (id)_currentUploadSession_ON_MOC_QUEUE:(id)a3 errorOut:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  NSObject *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[DRSUploadSessionRecordMO fetchRequest](DRSUploadSessionRecordMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v34;

  if (!v8)
  {
    if (objc_msgSend(v7, "count"))
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        objc_msgSend(v7, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      DPLogHandle_UploadSessionDateError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        v15 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v15;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NonUniqueUploadSessionDate", "Found %u dates. Attempting to delete and recover from state.", buf, 8u);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v16 = v7;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v31;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v31 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v5, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20++));
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v18);
      }

      v29 = 0;
      v21 = objc_msgSend(v5, "save:", &v29);
      v22 = v29;
      if ((v21 & 1) == 0)
      {
        DPLogHandle_CoreDataError();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v23))
        {
          objc_msgSend(v22, "localizedDescription");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          v26 = CFSTR("Unknown");
          if (v24)
            v26 = (const __CFString *)v24;
          *(_DWORD *)buf = 138543362;
          v37 = v26;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveUploadSession", "To save upload session updates due to error: %{public}@", buf, 0xCu);

        }
        if (a4)
          *a4 = objc_retainAutorelease(v22);
      }

    }
    else
    {
      DPLogHandle_UploadSessionDate();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSessionDateFetchMiss", "No cached CK Config", buf, 2u);
      }

    }
    goto LABEL_30;
  }
  DPLogHandle_UploadSessionDateError();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    objc_msgSend(v8, "localizedDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("Unknown");
    if (v10)
      v12 = (const __CFString *)v10;
    *(_DWORD *)buf = 138543362;
    v37 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadSessionDateMOFetch", "Failed to fetch an upload session managed object due to error: %{public}@", buf, 0xCu);

  }
  if (!a4)
  {
LABEL_30:
    v13 = 0;
    goto LABEL_31;
  }
  v13 = 0;
  *a4 = objc_retainAutorelease(v8);
LABEL_31:

  return v13;
}

+ (id)previousUploadSessionDateFromContainer:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v7 = (void *)objc_msgSend(v6, "newBackgroundContext");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__DRSService_previousUploadSessionDateFromContainer_errorOut___block_invoke;
  v11[3] = &unk_1EA3D1878;
  v15 = a1;
  v8 = v7;
  v12 = v8;
  v13 = &v16;
  v14 = &v22;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __62__DRSService_previousUploadSessionDateFromContainer_errorOut___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = (void *)a1[7];
  v3 = a1[4];
  v12 = 0;
  objc_msgSend(v2, "_currentUploadSession_ON_MOC_QUEUE:errorOut:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  objc_msgSend(v4, "sessionDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

+ (BOOL)updateUploadSessionDateFromContainer:(id)a3 toDate:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v10 = (void *)objc_msgSend(v8, "newBackgroundContext");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__DRSService_updateUploadSessionDateFromContainer_toDate_errorOut___block_invoke;
  v15[3] = &unk_1EA3D18A0;
  v19 = a1;
  v11 = v10;
  v16 = v11;
  v18 = &v20;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __67__DRSService_updateUploadSessionDateFromContainer_toDate_errorOut___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  DRSUploadSessionRecordMO *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[7];
  v3 = a1[4];
  v16 = 0;
  objc_msgSend(v2, "_currentUploadSession_ON_MOC_QUEUE:errorOut:", v3, &v16);
  v4 = (DRSUploadSessionRecordMO *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  v6 = v16;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  if (!v4)
    v4 = -[DRSUploadSessionRecordMO initWithContext:]([DRSUploadSessionRecordMO alloc], "initWithContext:", a1[4]);
  if (a1[5])
    -[DRSUploadSessionRecordMO setSessionDate:](v4, "setSessionDate:");
  else
    objc_msgSend((id)a1[4], "deleteObject:", v4);
  v7 = (void *)a1[4];
  v15 = 0;
  v8 = objc_msgSend(v7, "save:", &v15);
  v9 = v15;
  v10 = v15;
  if ((v8 & 1) == 0)
  {
    DPLogHandle_CoreDataError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown");
      if (v12)
        v14 = (const __CFString *)v12;
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveUpdatedUploadSession", "To save upload session updates due to error: %{public}@", buf, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);
  }

}

+ (double)backstopInterval
{
  return 1209600.0;
}

- (BOOL)updateUploadSessionDate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[DRSService serviceContainer](self, "serviceContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "updateUploadSessionDateFromContainer:toDate:errorOut:", v6, v7, a3);

  return (char)a3;
}

- (BOOL)clearUploadSessionDate:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[DRSService serviceContainer](self, "serviceContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "updateUploadSessionDateFromContainer:toDate:errorOut:", v6, 0, a3);

  return (char)a3;
}

- (BOOL)shouldRunBackstopUpload:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[DRSService serviceContainer](self, "serviceContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "shouldRunBackstopUpload:currentDate:errorOut:", v6, v7, a3);

  return (char)a3;
}

+ (BOOL)shouldRunBackstopUpload:(id)a3 currentDate:(id)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  id v17;

  v8 = a4;
  v17 = 0;
  objc_msgSend(a1, "previousUploadSessionDateFromContainer:errorOut:", a3, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v14 = v13;
    objc_msgSend(a1, "backstopInterval");
    v12 = v14 > v15;
  }

  return v12;
}

- (BOOL)_syncConfigurationToDisk:(id)a3
{
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v4 = DRSSetConfigurationDictionary(CFSTR("/private/var/mobile/Library/DiagnosticPipeline/Configuration"), a3, &v14);
  v5 = v14;
  if ((v4 & 1) != 0)
  {
    DPLogHandle_DRSConfig();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      -[DRSService configDict](self, "configDict");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("-");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigSave", "Saved DRSService config to disk: %{public}@", buf, 0xCu);

LABEL_10:
    }
  }
  else
  {
    DPLogHandle_DRSConfigError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      objc_msgSend(v5, "localizedDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v11;
      v12 = CFSTR("Unknown");
      if (v11)
        v12 = (const __CFString *)v11;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigSaveFailure", "Failed to save new config to disk due to error: %{public}@", buf, 0xCu);
      goto LABEL_10;
    }
  }

  return v4;
}

- (void)_getConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  -[DRSService configurationSyncQueue](self, "configurationSyncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__DRSService__getConfiguration__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __31__DRSService__getConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  DRSGetConfigurationDictionary(CFSTR("/private/var/mobile/Library/DiagnosticPipeline/Configuration"), &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v3)
  {
    DPLogHandle_DRSConfigError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = CFSTR("Unknown");
      if (v5)
        v7 = (const __CFString *)v5;
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceConfigGetFailure", "Failed to get DRSService config due to error: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), v2);
    objc_msgSend(*(id *)(a1 + 32), "_adjustStateForNewConfiguration");
  }

}

- (void)_updateConfigDict:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[DRSService _syncConfigurationToDisk:](self, "_syncConfigurationToDisk:", v5))
  {
    objc_storeStrong((id *)&self->_configDict, a3);
    -[DRSService _adjustStateForNewConfiguration](self, "_adjustStateForNewConfiguration");
    DPLogHandle_DRSConfig();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      objc_msgSend(v5, "description");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("<none>");
      if (v7)
        v9 = (const __CFString *)v7;
      v10 = 138543362;
      v11 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UpdatedDRSServiceConfig", "New config: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    DPLogHandle_DRSConfig();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToUpdateDRSServiceConfig", (const char *)&unk_1DBC04191, (uint8_t *)&v10, 2u);
    }
  }

}

- (void)_adjustStateForNewConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[DRSService configDict](self, "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", kDRSIgnoreAutomatedDeviceGroupKey);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsAutomatedDeviceGroupOverride:", 1);

    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOverridingAutomatedDeviceGroup:", 0);
  }
  else
  {
    +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsAutomatedDeviceGroupOverride:", 0);
  }

}

- (NSNumber)ignoreAutomatedDeviceGroup
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[DRSService configurationSyncQueue](self, "configurationSyncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__DRSService_ignoreAutomatedDeviceGroup__block_invoke;
  v6[3] = &unk_1EA3D18C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

void __40__DRSService_ignoreAutomatedDeviceGroup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "configDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", kDRSIgnoreAutomatedDeviceGroupKey);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setIgnoreAutomatedDeviceGroup:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DRSService configurationSyncQueue](self, "configurationSyncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__DRSService_setIgnoreAutomatedDeviceGroup___block_invoke;
  block[3] = &unk_1EA3D1680;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__DRSService_setIgnoreAutomatedDeviceGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "configDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "mutableCopy");

  if (*(_QWORD *)(a1 + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v3)
        v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), kDRSIgnoreAutomatedDeviceGroupKey);
      objc_msgSend(*(id *)(a1 + 32), "_updateConfigDict:", v3);
      DPLogHandle_DRSConfigError();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v4))
      {
        v5 = *(const __CFString **)(a1 + 40);
        if (!v5)
          v5 = CFSTR("<none>");
        v7 = 138543362;
        v8 = v5;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceSetIgnoreAutomatedDeviceGroup", "Set 'ignoreAutomatedDeviceGroup' to %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      DPLogHandle_DRSConfigError();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v4))
      {
        objc_msgSend(*(id *)(a1 + 40), "description");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSServiceSetIgnoreAutomatedDeviceGroupFailure", "Cannot set 'ignoreAutomatedDeviceGroup' to unexpected non-NSNumber value: %{public}@", (uint8_t *)&v7, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", kDRSIgnoreAutomatedDeviceGroupKey);
    if (!objc_msgSend(v3, "count"))
    {

      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateConfigDict:", v3);
  }

}

- (unint64_t)maxSingleSessionUploadSizeInBytes
{
  return self->_maxSingleSessionUploadSizeInBytes;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_dispatch_queue)cloudKitQueue
{
  return self->_cloudKitQueue;
}

- (OS_dispatch_queue)uploadRequestLookupQueue
{
  return self->_uploadRequestLookupQueue;
}

- (OS_dispatch_queue)postReceiptWorkQueue
{
  return self->_postReceiptWorkQueue;
}

- (OS_dispatch_queue)configurationSyncQueue
{
  return self->_configurationSyncQueue;
}

- (OS_xpc_object)serviceConnection
{
  return self->_serviceConnection;
}

- (OS_dispatch_semaphore)serviceDeactivatedSem
{
  return self->_serviceDeactivatedSem;
}

- (unsigned)state
{
  return self->_state;
}

- (NSMutableDictionary)connectionToState
{
  return self->_connectionToState;
}

- (NSPersistentContainer)serviceContainer
{
  return self->_serviceContainer;
}

- (DRSDampeningManager)dampeningManager
{
  return self->_dampeningManager;
}

- (DRSTaskingManager)taskingManager
{
  return self->_taskingManager;
}

- (DRSCloudKitHelper)ckHelper
{
  return self->_ckHelper;
}

- (DRSCKConfigStore)ckConfigStore
{
  return self->_ckConfigStore;
}

- (DRSCKConfig)ckConfig
{
  return self->_ckConfig;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSMutableDictionary)configDict
{
  return self->_configDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_ckConfig, 0);
  objc_storeStrong((id *)&self->_ckConfigStore, 0);
  objc_storeStrong((id *)&self->_ckHelper, 0);
  objc_storeStrong((id *)&self->_taskingManager, 0);
  objc_storeStrong((id *)&self->_dampeningManager, 0);
  objc_storeStrong((id *)&self->_serviceContainer, 0);
  objc_storeStrong((id *)&self->_connectionToState, 0);
  objc_storeStrong((id *)&self->_serviceDeactivatedSem, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_configurationSyncQueue, 0);
  objc_storeStrong((id *)&self->_postReceiptWorkQueue, 0);
  objc_storeStrong((id *)&self->_uploadRequestLookupQueue, 0);
  objc_storeStrong((id *)&self->_cloudKitQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

void __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DBB92000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Unable to create dampening manager for service.", v1, 2u);
}

void __59__DRSService__waitForDeviceUnlockAndInitializeServiceState__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3;
  v6 = CFSTR("Unknown");
  if (v3)
    v6 = (const __CFString *)v3;
  v7 = 138543362;
  v8 = v6;
  OUTLINED_FUNCTION_0_0(&dword_1DBB92000, a2, v4, "Failed to initalize CK config store due to error: %{public}@. Falling back to default settings", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_0();
}

@end
