@implementation FPDTelemetryService

- (FPDTelemetryService)init
{
  FPDTelemetryService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPDTelemetryService;
  v2 = -[FPDTelemetryService init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("telemetry-service", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)start
{
  xpc_object_t v3;
  const char *v4;
  _QWORD handler[5];
  id v6;
  id location;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D8], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  location = 0;
  objc_initWeak(&location, self);
  v4 = (const char *)objc_msgSend((id)FPDTelemetryXPCActivityId, "UTF8String");
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __28__FPDTelemetryService_start__block_invoke;
  handler[3] = &unk_1E8C75508;
  objc_copyWeak(&v6, &location);
  handler[4] = self;
  xpc_activity_register(v4, v3, handler);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __28__FPDTelemetryService_start__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  NSObject *v5;
  id *WeakRetained;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _xpc_activity_s *v15;
  _QWORD *v16;
  _QWORD v17[5];
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  uint64_t section;

  v3 = a2;
  v4 = (void *)MEMORY[0x1D17D1B04]();
  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __28__FPDTelemetryService_start__block_invoke_cold_1(&section, v5);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    xpc_activity_set_state(v3, 4);
    v7 = dispatch_group_create();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__0;
    v21[4] = __Block_byref_object_dispose__0;
    v22 = 0;
    objc_msgSend(WeakRetained[2], "providerDomainsByID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __28__FPDTelemetryService_start__block_invoke_2;
    v17[3] = &unk_1E8C754B8;
    v17[4] = WeakRetained;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v18 = v10;
    v19 = v11;
    v20 = v21;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 8);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __28__FPDTelemetryService_start__block_invoke_7;
    v14[3] = &unk_1E8C754E0;
    v14[4] = v12;
    v16 = v21;
    v15 = v3;
    dispatch_group_notify(v10, v13, v14);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    activityDone(v3);
  }

  __fp_leave_section_Debug();
  objc_autoreleasePoolPop(v4);

}

void __28__FPDTelemetryService_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  int8x16_t v12;
  _QWORD v13[4];
  int8x16_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v3, "fp_toProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerWithIdentifier:reason:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "fp_toDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domainForIdentifier:reason:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "isUsingFPFS"))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __28__FPDTelemetryService_start__block_invoke_2;
      v13[3] = &unk_1E8C75490;
      v12 = *(int8x16_t *)(a1 + 40);
      v9 = (id)v12.i64[0];
      v14 = vextq_s8(v12, v12, 8uLL);
      v15 = v6;
      v10 = v8;
      v11 = *(_QWORD *)(a1 + 56);
      v16 = v10;
      v17 = v11;
      objc_msgSend(v10, "telemetryReportWithCompletionHandler:", v13);

    }
  }

}

{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D211B0], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = *MEMORY[0x1E0D211A0];
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v16[1] = *MEMORY[0x1E0D211A8];
    objc_msgSend(*(id *)(a1 + 48), "bundleVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    v16[2] = CFSTR("volumeRole");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 56), "volume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "role"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionWithCommonProperties:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "postReportWithCategory:type:payload:error:", 3, 1, v3, 0);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = v12;
      v15 = *(NSObject **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v14;
    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __28__FPDTelemetryService_start__block_invoke_2_cold_1(v15);
    }

  }
  objc_sync_exit(v4);

}

void __28__FPDTelemetryService_start__block_invoke_7(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v7 = 0;
  v4 = objc_msgSend(v3, "flushMessagesSynchronouslyWithError:", &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __28__FPDTelemetryService_start__block_invoke_7_cold_1((uint64_t)v5, v6);

  }
  activityDone(*(_xpc_activity_s **)(a1 + 40));

  objc_sync_exit(v2);
}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (void)setExtensionManager:(id)a3
{
  objc_storeStrong((id *)&self->_extensionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __28__FPDTelemetryService_start__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx gathering and reporting FPFS usage telemetry", (uint8_t *)&v3, 0xCu);
}

void __28__FPDTelemetryService_start__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] FPDRTCReportingSession Failed to start", v1, 2u);
}

void __28__FPDTelemetryService_start__block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] FPDRTCReportingSession failed to flush messages : %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
