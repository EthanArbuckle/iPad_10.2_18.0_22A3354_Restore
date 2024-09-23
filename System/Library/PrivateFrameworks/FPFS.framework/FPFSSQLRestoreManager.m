@implementation FPFSSQLRestoreManager

- (FPFSSQLRestoreManager)initWithUserURL:(id)a3
{
  return -[FPFSSQLRestoreManager initWithUserURL:fromBuild:restoreType:cleanupOnSuccess:](self, "initWithUserURL:fromBuild:restoreType:cleanupOnSuccess:", a3, 0, 0, 1);
}

- (FPFSSQLRestoreManager)initWithUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  FPFSSQLRestoreManager *v13;
  _TtC9libfssync20FPFSSQLRestoreEngine *v14;
  _TtC9libfssync20FPFSSQLRestoreEngine *restoreEngine;
  void *v16;
  uint64_t v17;
  FPRTCReportingSession *rtcReporting;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FPFSSQLRestoreManager;
  v13 = -[FPFSSQLRestoreManager init](&v20, sel_init);
  if (v13)
  {
    v14 = -[FPFSSQLRestoreEngine initWithUserURL:]([_TtC9libfssync20FPFSSQLRestoreEngine alloc], "initWithUserURL:", v10);
    restoreEngine = v13->_restoreEngine;
    v13->_restoreEngine = v14;

    objc_msgSend(MEMORY[0x24BE31408], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionForProviderID:version:", CFSTR("d2d_restore_global"), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    rtcReporting = v13->_rtcReporting;
    v13->_rtcReporting = (FPRTCReportingSession *)v17;

    v13->_cleanupOnSuccess = a6;
    objc_storeStrong((id *)&v13->_backupBuild, a4);
    objc_storeStrong((id *)&v13->_restoreType, a5);
  }

  return v13;
}

- (void)restoreWithCompletionHandler:(id)a3
{
  id v4;
  _TtC9libfssync20FPFSSQLRestoreEngine *restoreEngine;
  _BOOL8 cleanupOnSuccess;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  restoreEngine = self->_restoreEngine;
  v7 = v4;
  if (restoreEngine)
  {
    cleanupOnSuccess = self->_cleanupOnSuccess;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__FPFSSQLRestoreManager_restoreWithCompletionHandler___block_invoke;
    v8[3] = &unk_250BDC140;
    v8[4] = self;
    v9 = v4;
    -[FPFSSQLRestoreEngine restoreWithCleanupOnSuccess:completionHandler:](restoreEngine, "restoreWithCleanupOnSuccess:completionHandler:", cleanupOnSuccess, v8);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __54__FPFSSQLRestoreManager_restoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "reportCompletionTelemetryWithError:atStep:", v7, a4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)reportCompletionTelemetryWithError:(id)a3 atStep:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *backupBuild;
  NSString *restoreType;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("success"), 0, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = CFSTR("no step");
  if (v7)
    v10 = v7;
  v11 = v10;
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = CFSTR("nil");
    if (v6)
      v17 = v6;
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl(&dword_23AA66000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] reporting d2d restore telemetry with error %@, step %@", buf, 0x16u);
  }

  v18 = CFSTR("operationType");
  v19 = CFSTR("reason");
  v13 = CFSTR("na");
  backupBuild = (const __CFString *)self->_backupBuild;
  restoreType = self->_restoreType;
  if (!backupBuild)
    backupBuild = CFSTR("na");
  v21 = v11;
  v22 = backupBuild;
  v20 = CFSTR("operationSide");
  if (restoreType)
    v13 = (const __CFString *)restoreType;
  v23 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPRTCReportingSession postReportWithCategory:type:payload:error:](self->_rtcReporting, "postReportWithCategory:type:payload:error:", 1, 1, v16, v9, v18, v19, v20, v21, v22);

}

- (FPRTCReportingSession)rtcReporting
{
  return self->_rtcReporting;
}

- (BOOL)cleanupOnSuccess
{
  return self->_cleanupOnSuccess;
}

- (_TtC9libfssync20FPFSSQLRestoreEngine)restoreEngine
{
  return self->_restoreEngine;
}

- (void)setRestoreEngine:(id)a3
{
  objc_storeStrong((id *)&self->_restoreEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreEngine, 0);
  objc_storeStrong((id *)&self->_rtcReporting, 0);
  objc_storeStrong((id *)&self->_restoreType, 0);
  objc_storeStrong((id *)&self->_backupBuild, 0);
}

@end
