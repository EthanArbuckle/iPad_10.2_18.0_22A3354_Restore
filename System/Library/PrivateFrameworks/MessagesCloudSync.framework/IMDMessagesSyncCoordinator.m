@implementation IMDMessagesSyncCoordinator

+ (id)configureWithDelegate:(id)a3
{
  uint64_t v3;
  id v5;

  v5 = 0;
  objc_msgSend_configureWith_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v5, v3);
  return v5;
}

+ (id)startInitialSyncWithDelegate:(id)a3
{
  uint64_t v3;
  int started;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  started = objc_msgSend_startInitialSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (started)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)scheduleBackfillSyncWithDelegate:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend_scheduleBackfillSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (v4)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)schedulePeriodicSyncWithDelegate:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend_schedulePeriodicSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (v4)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)scheduleBackupSyncWithDelegate:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend_scheduleBackupSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (v4)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)scheduleAttachmentAssetDownloadWithDelegate:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend_scheduleAttachmentAssetDownloadSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (v4)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)scheduleTelemetrySyncWithDelegate:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend_scheduleTelemetrySyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (v4)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (id)startUserInitiatedSyncWithDelegate:(id)a3
{
  uint64_t v3;
  int started;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  started = objc_msgSend_startUserInitiatedSyncWithDelegate_error_(IMDMessagesSyncCoordinatorInternal, a2, (uint64_t)a3, (uint64_t)&v9, v3);
  v5 = v9;
  v6 = v5;
  if (started)
    v5 = 0;
  v7 = v5;

  return v7;
}

+ (void)registerErrorAnalyzer:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithErrorAnalyzer_, a3);
}

+ (void)registerSyncTokenStore:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithSyncTokenStore_, a3);
}

+ (void)registerSyncStateManager:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithSyncStateManager_, a3);
}

+ (void)registerBackupController:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithBackupController_, a3);
}

+ (void)registerStore:(id)a3 asType:(int64_t)a4
{
  ((void (*)(__objc2_class *, char *, id, int64_t))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithStore_asType_, a3, a4);
}

+ (void)registerPreReqsVerifier:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithPreReqsVerifier_, a3);
}

+ (void)registerNotifier:(id)a3
{
  ((void (*)(__objc2_class *, char *, id))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_registerWithNotifier_, a3);
}

+ (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  void (**v7)(id, BOOL, void *);
  const char *v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  v7 = (void (**)(id, BOOL, void *))a5;
  v10 = 0;
  objc_msgSend_initiateSyncFor_delegate_forceRunNow_error_(IMDMessagesSyncCoordinatorInternal, v8, (uint64_t)a3, 0, v5, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v10 == 0, v9);

}

+ (id)readServerCountsFromDefaults
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_readServerCountsFromDefaults);
}

+ (void)fetchSyncStoreCountsWithCompletion:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_217768010;
  v8[3] = &unk_24D806120;
  v9 = v3;
  v4 = v3;
  objc_msgSend_fetchSyncStoreCountsWithCompletion_(IMDMessagesSyncCoordinatorInternal, v5, (uint64_t)v8, v6, v7);

}

+ (void)clearSyncStoreWhenSafe
{
  ((void (*)(__objc2_class *, char *, void *))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_clearSyncStoreWhenSafeWithCompletionHandler_, &unk_24D806160);
}

+ (void)clearLocalCountsWhenSafe
{
  ((void (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_clearLocalCountsWhenSafe);
}

+ (BOOL)isSyncing
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_isSyncing);
}

+ (int64_t)currentTelemetryVersion
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(IMDMessagesSyncCoordinatorInternal, sel_currentTelemetrySyncVersion);
}

@end
