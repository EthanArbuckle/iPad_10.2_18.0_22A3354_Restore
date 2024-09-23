@implementation GEOAPServiceManager

void __36__GEOAPServiceManager_sharedManager__block_invoke()
{
  GEOAPServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAPServiceManager);
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)v0;

}

+ (id)sharedManager
{
  if (qword_2543169D0 != -1)
    dispatch_once(&qword_2543169D0, &__block_literal_global_1);
  return (id)_MergedGlobals_2;
}

- (void)reportDailyUsageCountType:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  GEOApplicationIdentifierOrProcessName();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOAPServiceManager reportDailyUsageCountType:usageString:usageBool:appId:](self, "reportDailyUsageCountType:usageString:usageBool:appId:", v3, 0, 0, v5);

}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  -[GEOAPServiceProxy reportDailyUsageCountType:usageString:usageBool:appId:completion:](self->_proxy, "reportDailyUsageCountType:usageString:usageBool:appId:completion:", *(_QWORD *)&a3, a4, a5, a6, a7);
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
  -[GEOAPServiceManager reportDailyUsageCountType:usageString:usageBool:appId:completion:](self, "reportDailyUsageCountType:usageString:usageBool:appId:completion:", *(_QWORD *)&a3, a4, a5, a6, 0);
}

- (GEOAPServiceManager)init
{
  GEOAPServiceManager *v2;
  objc_class *v3;
  void *v4;
  GEOAPServiceProxy *v5;
  GEOAPServiceProxy *proxy;
  uint64_t v7;
  geo_isolater *evInfoIsolator;
  void *global_queue;
  uint64_t v10;
  id evDirectionsFeedbackAllowedListener;
  uint64_t v12;
  id evDirectionsFeedbackAuthListener;
  GEOAPServiceManager *v15;
  GEOAPServiceManager *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)GEOAPServiceManager;
  v2 = -[GEOAPServiceManager init](&v17, sel_init);
  if (v2)
  {
    v3 = (objc_class *)qword_2543169C8;
    if (!qword_2543169C8)
    {
      v4 = (void *)objc_opt_class();
      objc_msgSend(v4, "useProxyClass:", objc_opt_class());
      v3 = (objc_class *)qword_2543169C8;
    }
    v5 = (GEOAPServiceProxy *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v5;

    v2->_directionsFeedbackAllowed = 1;
    v2->_evDirectionsFeedbackAllowed = GEOConfigGetBOOL();
    v7 = geo_isolater_create();
    evInfoIsolator = v2->_evInfoIsolator;
    v2->_evInfoIsolator = (geo_isolater *)v7;

    global_queue = (void *)geo_get_global_queue();
    v16 = v2;
    _GEOConfigAddBlockListenerForKey();
    v10 = objc_claimAutoreleasedReturnValue();
    evDirectionsFeedbackAllowedListener = v16->_evDirectionsFeedbackAllowedListener;
    v16->_evDirectionsFeedbackAllowedListener = (id)v10;

    v16->_evDirectionsFeedbackAuth = GEOConfigGetBOOL();
    v15 = v16;
    _GEOConfigAddBlockListenerForKey();
    v12 = objc_claimAutoreleasedReturnValue();
    evDirectionsFeedbackAuthListener = v15->_evDirectionsFeedbackAuthListener;
    v15->_evDirectionsFeedbackAuthListener = (id)v12;

  }
  return v2;
}

+ (void)useProxyClass:(Class)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  uint8_t buf[2];
  __int16 v10;

  v4 = &unk_256C1EAE8;
  if (_MergedGlobals_2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v10 = 0;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Assertion failed: !_sharedManager";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_fault_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
  }
  else
  {
    v8 = v4;
    if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v4) & 1) != 0)
    {
      qword_2543169C8 = (uint64_t)a3;

      return;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x24BDACB70];
      v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      v7 = buf;
      goto LABEL_8;
    }
  }
  __break(1u);
}

void __27__GEOAPServiceManager_init__block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  geo_isolate_sync();

}

uint64_t __27__GEOAPServiceManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = GEOConfigGetBOOL();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

void __27__GEOAPServiceManager_init__block_invoke_3(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  geo_isolate_sync();

}

uint64_t __27__GEOAPServiceManager_init__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = GEOConfigGetBOOL();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)GEOAPServiceManager;
  -[GEOAPServiceManager dealloc](&v3, sel_dealloc);
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  GEOAPServiceProxy *proxy;
  _QWORD v14[4];
  NSObject *v15;
  id v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (GEOConfigGetBOOL())
  {
    if (v12)
      dispatch_async(v11, v12);
  }
  else
  {
    proxy = self->_proxy;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__GEOAPServiceManager_reportLogMsg_uploadBatchId_completionQueue_completion___block_invoke;
    v14[3] = &unk_250DC06B0;
    v16 = v12;
    v15 = v11;
    -[GEOAPServiceProxy reportLogMsg:uploadBatchId:completion:](proxy, "reportLogMsg:uploadBatchId:completion:", v10, a4, v14);

  }
}

void __77__GEOAPServiceManager_reportLogMsg_uploadBatchId_completionQueue_completion___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 40);
  if (v1)
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), v1);
}

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 queue:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  GEOAPServiceProxy *proxy;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v12 = *(_QWORD *)&a3;
  v14 = a7;
  v15 = a8;
  proxy = self->_proxy;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke;
  v19[3] = &unk_250DC0700;
  v20 = v14;
  v21 = v15;
  v17 = v14;
  v18 = v15;
  -[GEOAPServiceProxy reportDailyUsageCountType:usageString:usageBool:appId:completion:](proxy, "reportDailyUsageCountType:usageString:usageBool:appId:completion:", v12, a4, a5, a6, v19);

}

void __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void);
  NSObject *v5;
  _QWORD block[4];
  void (**v7)(void);

  v3 = a2;
  v4 = *(void (***)(void))(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_2;
      block[3] = &unk_250DC06D8;
      v7 = v4;
      dispatch_async(v5, block);

    }
    else
    {
      v4[2]();
    }
  }

}

uint64_t __94__GEOAPServiceManager_reportDailyUsageCountType_usageString_usageBool_appId_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reportDailySettings:(id)a3
{
  -[GEOAPServiceManager reportDailySettings:completionQueue:completion:](self, "reportDailySettings:completionQueue:completion:", a3, 0, 0);
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  -[GEOAPServiceProxy reportDailySettings:completion:](self->_proxy, "reportDailySettings:completion:", a3, a4);
}

- (void)reportDailySettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  GEOAPServiceProxy *proxy;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  proxy = self->_proxy;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__GEOAPServiceManager_reportDailySettings_completionQueue_completion___block_invoke;
  v13[3] = &unk_250DC0700;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[GEOAPServiceProxy reportDailySettings:completion:](proxy, "reportDailySettings:completion:", a3, v13);

}

void __70__GEOAPServiceManager_reportDailySettings_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;

  v3 = a2;
  v4 = *(void (***)(_QWORD))(a1 + 40);
  if (v4)
  {
    v6 = v3;
    v5 = *(NSObject **)(a1 + 32);
    if (v5)
      dispatch_async(v5, v4);
    else
      v4[2](v4);
    v3 = v6;
  }

}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  -[GEOAPServiceProxy reportLogMsg:uploadBatchId:completion:](self->_proxy, "reportLogMsg:uploadBatchId:completion:", a3, a4, a5);
}

- (void)flushEvalData
{
  -[GEOAPServiceProxy flushEvalData](self->_proxy, "flushEvalData");
}

- (void)runAggregationTasks
{
  -[GEOAPServiceProxy runAggregationTasks](self->_proxy, "runAggregationTasks");
}

- (void)setEvalMode:(BOOL)a3
{
  -[GEOAPServiceProxy setEvalMode:](self->_proxy, "setEvalMode:", a3);
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  -[GEOAPServiceProxy showEvalDataWithVisitorBlock:](self->_proxy, "showEvalDataWithVisitorBlock:", a3);
}

- (void)streamWithLogMsgBlock:(id)a3 dailyUsageBlock:(id)a4 monthlyUsageBlock:(id)a5
{
  -[GEOAPServiceProxy streamWithLogMsgBlock:dailyUsageBlock:monthlyUsageBlock:](self->_proxy, "streamWithLogMsgBlock:dailyUsageBlock:monthlyUsageBlock:", a3, a4, a5);
}

- (BOOL)evalModeEnabled
{
  return 0;
}

- (BOOL)AppleInternal
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  return v3;
}

- (BOOL)platformDiagAndUsage
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
  v9 = getDiagnosticLogSubmissionEnabledSymbolLoc_ptr;
  if (!getDiagnosticLogSubmissionEnabledSymbolLoc_ptr)
  {
    v3 = (void *)CrashReporterSupportLibrary();
    v2 = dlsym(v3, "DiagnosticLogSubmissionEnabled");
    v7[3] = (uint64_t)v2;
    getDiagnosticLogSubmissionEnabledSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(void))v2)();
}

- (BOOL)platformDiagAndUsageOrAppleInternal
{
  return -[GEOAPServiceManager platformDiagAndUsage](self, "platformDiagAndUsage")
      || -[GEOAPServiceManager AppleInternal](self, "AppleInternal");
}

- (void)logToDiagAndUsageUnderBugId:(id)a3 filePrefix:(id)a4 logData:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _Unwind_Exception *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__GEOAPServiceManager_logToDiagAndUsageUnderBugId_filePrefix_logData___block_invoke;
  v17[3] = &unk_250DC0728;
  v10 = v9;
  v18 = v10;
  v11 = v7;
  v12 = v8;
  v13 = v17;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v14 = getOSAWriteLogForSubmissionSymbolLoc_ptr;
  v22 = getOSAWriteLogForSubmissionSymbolLoc_ptr;
  if (!getOSAWriteLogForSubmissionSymbolLoc_ptr)
  {
    v15 = (void *)CrashReporterSupportLibrary();
    v14 = dlsym(v15, "OSAWriteLogForSubmission");
    v20[3] = (uint64_t)v14;
    getOSAWriteLogForSubmissionSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v19, 8);
  if (!v14)
  {
    dlerror();
    v16 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v16);
  }
  ((void (*)(id, id, _QWORD, _QWORD, _QWORD *))v14)(v11, v12, 0, 0, v13);

}

uint64_t __70__GEOAPServiceManager_logToDiagAndUsageUnderBugId_filePrefix_logData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:error:", *(_QWORD *)(a1 + 32), 0);
}

- (BOOL)evDirectionsFeedbackAuth
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __47__GEOAPServiceManager_evDirectionsFeedbackAuth__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 10);
  return result;
}

- (BOOL)evDirectionsFeedbackAllowed
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  geo_isolate_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __50__GEOAPServiceManager_evDirectionsFeedbackAllowed__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 10))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(v1 + 8);
  return result;
}

- (void)setEvDirectionsFeedbackAllowed:(BOOL)a3
{
  geo_isolate_sync();
}

uint64_t __54__GEOAPServiceManager_setEvDirectionsFeedbackAllowed___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 40);
  return GEOConfigSetBOOL();
}

- (void)toggleEVDirectionsFeedbackAllowed
{
  geo_isolate_sync();
}

uint64_t __56__GEOAPServiceManager_toggleEVDirectionsFeedbackAllowed__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) ^= 1u;
  return GEOConfigSetBOOL();
}

- (BOOL)directionsFeedbackAllowed
{
  return self->_directionsFeedbackAllowed;
}

- (void)setDirectionsFeedbackAllowed:(BOOL)a3
{
  self->_directionsFeedbackAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evDirectionsFeedbackAuthListener, 0);
  objc_storeStrong(&self->_evDirectionsFeedbackAllowedListener, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_evInfoIsolator, 0);
}

- (void)updateSharedStateType:(int)a3 state:(id)a4
{
  -[GEOAPServiceManager updateSharedStateType:state:completion:completionQueue:](self, "updateSharedStateType:state:completion:completionQueue:", *(_QWORD *)&a3, a4, 0, 0);
}

- (void)updateSharedStateType:(int)a3 state:(id)a4 completion:(id)a5 completionQueue:(id)a6
{
  id v8;
  NSObject *v9;
  NSObject *global_queue;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = a6;
  global_queue = v9;
  if (v8)
  {
    if (!v9)
      global_queue = geo_get_global_queue();
    dispatch_async(global_queue, v8);
  }

}

- (void)reportCuratedCollectionWasViewedWithId:(unint64_t)a3 completion:(id)a4 completionQueue:(id)a5
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t global_queue;
  dispatch_block_t block;

  block = a4;
  v6 = a5;
  v7 = block;
  v8 = v6;
  if (block)
  {
    if (!v6)
    {
      global_queue = geo_get_global_queue();
      v7 = block;
      v8 = global_queue;
    }
    dispatch_async(v8, v7);
  }

}

- (void)processMapsDeletionWithCompletionQueue:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

@end
