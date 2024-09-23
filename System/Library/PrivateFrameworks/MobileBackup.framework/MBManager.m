@implementation MBManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (MBManager)initWithDelegate:(id)a3
{
  return -[MBManager initWithDelegate:eventQueue:](self, "initWithDelegate:eventQueue:", a3, MEMORY[0x1E0C80D38]);
}

- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  id v6;
  id v7;
  MBXPCClient *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MBXPCClient initWithDelegate:eventQueue:]([MBXPCClient alloc], "initWithDelegate:eventQueue:", v7, v6);

  return &v8->super;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBManager;
  return -[MBManager init](&v3, sel_init);
}

- (MBManager)init
{
  return -[MBManager initWithDelegate:eventQueue:](self, "initWithDelegate:eventQueue:", 0, MEMORY[0x1E0C80D38]);
}

- (MBManager)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  MBXPCClient *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MBXPCClient initWithDelegate:eventQueue:personaIdentifier:]([MBXPCClient alloc], "initWithDelegate:eventQueue:personaIdentifier:", v10, v9, v8);

  return &v11->super;
}

- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  MBXPCClient *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MBXPCClient initWithAccount:delegate:eventQueue:]([MBXPCClient alloc], "initWithAccount:delegate:eventQueue:", v10, v9, v8);

  return &v11->super;
}

- (MBManager)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  MBXPCClient *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[MBXPCClient initWithAccount:delegate:eventQueue:error:]([MBXPCClient alloc], "initWithAccount:delegate:eventQueue:error:", v12, v11, v10, a6);

  return &v13->super;
}

- (void)setSupportsiTunes:(BOOL)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)isBackupEnabled
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setBackupEnabled:(BOOL)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)syncBackupEnabled
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)backupState
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)backupDeviceUUID
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)backupDeviceUDID
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)backupList
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)getBackupListWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
  return 0;
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)startBackup
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)startBackupWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)journalForBackupUUID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)restoreState
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)restoreStateWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (id)backgroundRestoreInfo
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)restoreFileExistsWithPath:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length, a7);
  return 0;
}

- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length, a7);
  return 0;
}

- (void)prioritizeRestoreFileWithPath:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)dateOfLastBackup
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dateOfNextScheduledBackup
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dateOfLastBackupWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dateOfNextScheduledBackupWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)restoreSupportsBatching
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setRestoreQualityOfService:(int64_t)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6[2](v6, 0);

}

- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (id)backgroundRestoreCellularAccessWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a6;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v8[2](v8, 0);

}

- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)restoreFileWithPath:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7);
  return 0;
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)finishRestore
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)insufficientFreeSpaceToRestore
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)cancel
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)cancelRestore
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)startScanWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (unint64_t)nextBackupSize
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)nextBackupSizeInfo
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)domainInfoForName:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)domainInfoList
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)disabledDomainInfos
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)removeDomainName:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)reservedBackupSizeListWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isBackupEnabledForDomainName:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
  return 0;
}

- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
  return 0;
}

- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7);
  return 0;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)restoreInfo
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)clearRestoreSession
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setAllowiTunesBackup:(BOOL)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)allowiTunesBackup
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 1;
}

- (BOOL)countCameraRollQuota
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)discountCameraRollQuota
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)rebootDevice
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)rebootDevice:(BOOL)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a5;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v7[2](v7, 0);

}

- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  id v5;

  v5 = a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v5[2](v5, 0);

}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  id v5;

  v5 = a3;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6[2](v6, 0);

}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6[2](v6, 0);

}

- (BOOL)isInitialMegaBackupCompleted:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)saveBackupEnabledForMegaBackup
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)exitMegaBackupMode:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)personalPersonaIdentifier
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a5, a3);
  return 0;
}

- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)fetchBackupCKRecordsIntoDB:(id *)a3
{
  -[MBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (MBManagerDelegate)delegate
{
  return (MBManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
