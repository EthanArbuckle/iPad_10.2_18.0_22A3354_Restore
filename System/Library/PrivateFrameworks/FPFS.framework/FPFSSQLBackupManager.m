@implementation FPFSSQLBackupManager

- (FPFSSQLBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  id v6;
  id v7;
  FPFSSQLBackupManager *v8;
  _TtC9libfssync19FPFSSQLBackupEngine *v9;
  _TtC9libfssync19FPFSSQLBackupEngine *backupEngine;
  void *v11;
  uint64_t v12;
  FPRTCReportingSession *rtcReporting;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FPFSSQLBackupManager;
  v8 = -[FPFSSQLBackupManager init](&v15, sel_init);
  if (v8)
  {
    v9 = -[FPFSSQLBackupEngine initWithUserURL:outputUserURL:]([_TtC9libfssync19FPFSSQLBackupEngine alloc], "initWithUserURL:outputUserURL:", v6, v7);
    backupEngine = v8->_backupEngine;
    v8->_backupEngine = v9;

    objc_msgSend(MEMORY[0x24BE31408], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionForProviderID:version:", CFSTR("d2d_backup_global"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    rtcReporting = v8->_rtcReporting;
    v8->_rtcReporting = (FPRTCReportingSession *)v12;

  }
  return v8;
}

- (void)backUpWithCompletionHandler:(id)a3
{
  id v4;
  _TtC9libfssync19FPFSSQLBackupEngine *backupEngine;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  backupEngine = self->_backupEngine;
  v6 = v4;
  if (backupEngine)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__FPFSSQLBackupManager_backUpWithCompletionHandler___block_invoke;
    v7[3] = &unk_250BDBDD8;
    v7[4] = self;
    v8 = v4;
    -[FPFSSQLBackupEngine backUpWithCompletionHandler:](backupEngine, "backUpWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __52__FPFSSQLBackupManager_backUpWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "reportCompletionTelemetryWithError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)reportCompletionTelemetryWithError:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPFSSQLBackupManager reportCompletionTelemetryWithError:].cold.1(v4, v5);

  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("success"), 0, 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  -[FPRTCReportingSession postReportWithCategory:type:payload:error:](self->_rtcReporting, "postReportWithCategory:type:payload:error:", 1, 1, MEMORY[0x24BDBD1B8], v6);

}

- (FPRTCReportingSession)rtcReporting
{
  return self->_rtcReporting;
}

- (_TtC9libfssync19FPFSSQLBackupEngine)backupEngine
{
  return self->_backupEngine;
}

- (void)setBackupEngine:(id)a3
{
  objc_storeStrong((id *)&self->_backupEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupEngine, 0);
  objc_storeStrong((id *)&self->_rtcReporting, 0);
}

- (void)reportCompletionTelemetryWithError:(const __CFString *)a1 .cold.1(const __CFString *a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("success");
  if (a1)
    v2 = a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_23AA66000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] reporting d2d backup telemetry with %@", (uint8_t *)&v3, 0xCu);
}

@end
