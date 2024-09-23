@implementation ICNASnapshotReporter

+ (id)sharedReporter
{
  if (s_onceToken != -1)
    dispatch_once(&s_onceToken, &__block_literal_global);
  return (id)sharedReporter_s_instance;
}

void __38__ICNASnapshotReporter_sharedReporter__block_invoke()
{
  ICNASnapshotReporter *v0;
  void *v1;

  v0 = -[ICNAEventReporter initWithSubTrackerName:]([ICNASnapshotReporter alloc], "initWithSubTrackerName:", CFSTR("snapshot_reporter"));
  v1 = (void *)sharedReporter_s_instance;
  sharedReporter_s_instance = (uint64_t)v0;

}

- (void)setupContextsIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICNASnapshotReporter *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICNASnapshotReporter modernContext](obj, "modernContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "workerManagedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter setModernContext:](obj, "setModernContext:", v4);

  }
  -[ICNASnapshotReporter htmlContext](obj, "htmlContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ICNewLegacyContext();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter setHtmlContext:](obj, "setHtmlContext:", v6);

  }
  -[ICNASnapshotReporter setContextHolderCount:](obj, "setContextHolderCount:", -[ICNASnapshotReporter contextHolderCount](obj, "contextHolderCount") + 1);
  objc_sync_exit(obj);

}

- (void)tearDownContextsIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  ICNASnapshotReporter *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[ICNASnapshotReporter contextHolderCount](obj, "contextHolderCount");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;
  -[ICNASnapshotReporter setContextHolderCount:](obj, "setContextHolderCount:", v3 - 1);
  if (!-[ICNASnapshotReporter contextHolderCount](obj, "contextHolderCount"))
  {
    -[ICNASnapshotReporter setModernContext:](obj, "setModernContext:", 0);
    -[ICNASnapshotReporter setHtmlContext:](obj, "setHtmlContext:", 0);
  }
  objc_sync_exit(obj);

}

- (void)checkIfSnapshotNotFiredForALongTime
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BDCEC000, log, OS_LOG_TYPE_ERROR, "Snapshot scheduled at %@ not run. Last snapshot was ran at %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)scheduleSnapshotIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Did not schedule snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v6 = 2;
  }
  objc_msgSend(*(id *)(a1 + 32), "submitSnapshotScheduleEventWithResult:error:lastScheduledTime:", v6, v5, *(_QWORD *)(a1 + 40));

}

- (void)submitSnapshotScheduleEventWithResult:(int64_t)a3 error:(id)a4 lastScheduledTime:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  ICASResultType *v11;
  ICASResultData *v12;
  ICASSnapshotErrorData *v13;
  void *v14;
  void *v15;
  ICASSnapshotErrorData *v16;
  ICASSnapshotTimeData *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  ICASSnapshotTimeData *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  v11 = -[ICASResultType initWithResultType:]([ICASResultType alloc], "initWithResultType:", a3);
  v12 = -[ICASResultData initWithResultType:]([ICASResultData alloc], "initWithResultType:", v11);
  objc_msgSend(v10, "addObject:", v12);
  if (v27)
  {
    v13 = [ICASSnapshotErrorData alloc];
    objc_msgSend(v27, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICASSnapshotErrorData initWithErrorDomain:errorCode:](v13, "initWithErrorDomain:errorCode:", v14, v15);

    objc_msgSend(v10, "addObject:", v16);
  }
  v17 = [ICASSnapshotTimeData alloc];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "timeIntervalSince1970");
  v20 = v19;

  objc_msgSend(v18, "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ICASSnapshotTimeData initWithLastTimeOfAttemptedSchedule:](v17, "initWithLastTimeOfAttemptedSchedule:", v21);

  objc_msgSend(v10, "addObject:", v22);
  -[ICNASnapshotReporter backgroundAppRefreshData](self, "backgroundAppRefreshData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v23);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submitEventOfType:pushThenPopDataObjects:subTracker:", v25, v10, v26);

}

- (void)submitMiniSnapshot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Running mini snapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ICASMiniSnapshotAccountItemData *v13;
  void *v14;
  void *v15;
  void *v16;
  ICASMiniSnapshotAccountItemData *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639C8], "allAccountsInContext:", a2);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v6, "didChooseToMigrate"))
        {
          v7 = objc_msgSend(v6, "visibleNotesIncludingTrashCount");
          v8 = objc_msgSend(v6, "visibleCustomFoldersCount");
          v9 = objc_msgSend(v6, "visibleAttachmentsIncludingTrashCount");
          +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "saltedID:forClass:", v11, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = [ICASMiniSnapshotAccountItemData alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v7));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v8));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[ICASMiniSnapshotAccountItemData initWithCountofNotes:counfOfFolders:countOfAttachments:privateAccountID:](v13, "initWithCountofNotes:counfOfFolders:countOfAttachments:privateAccountID:", v14, v15, v16, v12);

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }

}

void __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ICASMiniSnapshotAccountItemData *v13;
  void *v14;
  ICASMiniSnapshotAccountItemData *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "allAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDeleted") & 1) == 0 && (objc_msgSend(v8, "didChooseToMigrate") & 1) == 0)
        {
          v9 = objc_msgSend(v2, "countOfVisibleNotesForAccount:", v8);
          +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accountIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "saltedID:forClass:", v11, objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = [ICASMiniSnapshotAccountItemData alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[ICASMiniSnapshotAccountItemData initWithCountofNotes:counfOfFolders:countOfAttachments:privateAccountID:](v13, "initWithCountofNotes:counfOfFolders:countOfAttachments:privateAccountID:", v14, &unk_1E77497E8, &unk_1E77497E8, v12);

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

uint64_t __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke_510(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "killMiniSnapshotBackgroundTaskIfNecessary");
}

- (void)reallyPerformSnapshotWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  ICNASnapshotReporter *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  ICNASnapshotReporter *v11;

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[ICNASnapshotReporter isPerformingSnapshot](v5, "isPerformingSnapshot"))
  {
    if (v4)
      v4[2](v4);
    objc_sync_exit(v5);

  }
  else
  {
    -[ICNASnapshotReporter setIsPerformingSnapshot:](v5, "setIsPerformingSnapshot:", 1);
    objc_sync_exit(v5);

    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("analytics_last_snapshot_running_timestamp"));

    v8 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICNASnapshotReporter reallyPerformSnapshotWithCompletionHandler:].cold.1();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (id)objc_msgSend(MEMORY[0x1E0D63BC8], "performSelector:withObject:", sel_beginBackgroundTaskNamed_, CFSTR("Perform Snapshot"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", MEMORY[0x1E0CEB390], "Q");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[ICNASnapshotReporter setupContextsIfNecessary](v5, "setupContextsIfNecessary");
    -[ICNASnapshotReporter snapshotDevice](v5, "snapshotDevice");
    -[ICNASnapshotReporter tearDownContextsIfNecessary](v5, "tearDownContextsIfNecessary");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(MEMORY[0x1E0D63BC8], "performSelector:withObject:", sel_endBackgroundTask_, v10);
    if (v4)
      v4[2](v4);
    v11 = v5;
    objc_sync_enter(v11);
    -[ICNASnapshotReporter setIsPerformingSnapshot:](v11, "setIsPerformingSnapshot:", 0);
    objc_sync_exit(v11);

  }
}

- (void)snapshotDevice
{
  uint64_t v3;
  ICASCollabFoldersItemData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICASDeviceSnapshotData *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ICASDeviceSnapshotData *v30;
  ICASCollabFoldersItemData *v31;
  _QWORD v32[8];
  _QWORD v33[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  ICNANoteReportToDevice *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  _ICNAFolderReportToDevice *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  _ICNAAccountReportToDevice *v51;
  ICASDeviceSnapshotData *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  v51 = objc_alloc_init(_ICNAAccountReportToDevice);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = objc_alloc_init(_ICNAFolderReportToDevice);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = objc_alloc_init(ICNANoteReportToDevice);
  v3 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __38__ICNASnapshotReporter_snapshotDevice__block_invoke;
  v33[3] = &unk_1E771C098;
  v33[4] = self;
  v33[5] = &v46;
  v33[6] = &v40;
  v33[7] = &v34;
  -[ICNASnapshotReporter performBlockForModernManagedObjectContext:](self, "performBlockForModernManagedObjectContext:", v33);
  v32[0] = v3;
  v32[1] = 3221225472;
  v32[2] = __38__ICNASnapshotReporter_snapshotDevice__block_invoke_2;
  v32[3] = &unk_1E771C0C0;
  v32[4] = self;
  v32[5] = &v46;
  v32[6] = &v40;
  v32[7] = &v34;
  -[ICNASnapshotReporter performBlockForHTMLManagedObjectContext:](self, "performBlockForHTMLManagedObjectContext:", v32);
  v4 = [ICASCollabFoldersItemData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 1)));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 2)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 1)));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 2)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 0)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 1)));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v41[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 2)));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[ICASCollabFoldersItemData initWithTotalFoldersCollabRootReadOnlyCount:totalFoldersCollabSubfolderReadOnlyCount:totalFoldersCollabRootReadWriteJoinedCount:totalFoldersCollabSubfolderReadWriteJoinedCount:totalFoldersNotCollabCount:totalFoldersCollabRootOwnedCount:totalFoldersCollabSubfolderOwnedCount:](v4, "initWithTotalFoldersCollabRootReadOnlyCount:totalFoldersCollabSubfolderReadOnlyCount:totalFoldersCollabRootReadWriteJoinedCount:totalFoldersCollabSubfolderReadWriteJoinedCount:totalFoldersNotCollabCount:totalFoldersCollabRootOwnedCount:totalFoldersCollabSubfolderOwnedCount:", v5, v6, v7, v8, v9, v10, v11);

  v30 = [ICASDeviceSnapshotData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController saltVersion](ICNAController, "saltVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v47[5], "accountTypeSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v35[5], "countOfPinnedNotes")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter deviceSnapshotSummaryForDataType:](self, "deviceSnapshotSummaryForDataType:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter userSnapshotSummaryForDataType:](self, "userSnapshotSummaryForDataType:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICASDeviceSnapshotData initWithUserStartMonth:userStartYear:saltVersion:accountTypeSummary:collabFoldersSummary:totalCountOfPinnedNotes:deviceSnapshotSummary:userSnapshotSummary:](v30, "initWithUserStartMonth:userStartYear:saltVersion:accountTypeSummary:collabFoldersSummary:totalCountOfPinnedNotes:deviceSnapshotSummary:userSnapshotSummary:", v12, v13, v14, v15, v16, v17, v18, v19);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "enterGroupWithSubtracker:", v22);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  v52 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "submitEventOfType:pushThenPopDataObjects:subTracker:", v24, v25, v26);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leaveGroupWithSubtracker:", v28);

  +[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fireSnapshotWithNoteReportToDevice:", v35[5]);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

void __38__ICNASnapshotReporter_snapshotDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639C8], "allAccountsInContext:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "didChooseToMigrate"))
          objc_msgSend(*(id *)(a1 + 32), "snapshotModernAccount:reportedDataToDevice:reportedDataFromFolderToDevice:reportedDataFromNoteToDevice:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __38__ICNASnapshotReporter_snapshotDevice__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDeleted") & 1) == 0 && (objc_msgSend(v8, "didChooseToMigrate") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "snapshotHTMLAccount:reportedDataToDevice:reportedDataFromFolderToDevice:reportedDataFromNoteToDevice:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)snapshotModernAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ICNAHistogramManager *v15;
  uint64_t v16;
  void *v17;
  ICNASnapshotReporter *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _ICNANoteReportToAccount *v23;
  _ICNAFolderReportToAccount *v24;
  _ICNAAttachmentReportToAccount *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _ICNAFolderReportToParentFolder *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  ICASCollabNotesItemData *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _ICNANoteReportToAccount *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  ICASLockedNotesItemData *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _ICNANoteReportToAccount *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  ICNASnapshotReporter *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  ICASAccountSnapshotData *v156;
  ICASAccountSnapshotData *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  ICASLockedNotesItemData *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  _ICNANoteReportToAccount *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  ICASSmartFoldersItemData *v293;
  ICASSmartFoldersItemData *v294;
  void *v295;
  void *v296;
  ICASScrapPaperAttachmentItemData *v297;
  ICASScrapPaperAttachmentItemData *v298;
  void *v299;
  ICASNoteAttachmentItemData *v300;
  ICASNoteAttachmentItemData *v301;
  void *v302;
  ICASCollabFoldersItemData *v303;
  ICASCollabFoldersItemData *v304;
  void *v305;
  ICASCollabNotesItemData *v306;
  ICASAccountNotesTwoFactorItemData *v307;
  ICASAccountNotesTwoFactorItemData *v308;
  _ICNAAttachmentReportToAccount *v309;
  ICASAccountSnapshotItemData *v310;
  void *v311;
  _ICNAFolderReportToAccount *v312;
  id obj;
  id v314;
  id v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  ICASAccountSnapshotData *v320;
  ICASSmartFoldersItemData *v321;
  ICASLockedNotesItemData *v322;
  ICASScrapPaperAttachmentItemData *v323;
  ICASNoteAttachmentItemData *v324;
  ICASCollabFoldersItemData *v325;
  ICASCollabNotesItemData *v326;
  ICASAccountNotesTwoFactorItemData *v327;
  ICASAccountSnapshotItemData *v328;
  _BYTE v329[128];
  uint64_t v330;

  v330 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  if (objc_msgSend(v10, "isUnsupported"))
  {
    objc_msgSend((id)objc_opt_class(), "faultOutObject:", v10);
  }
  else
  {
    v314 = v13;
    v315 = v12;
    v178 = v11;
    v15 = objc_alloc_init(ICNAHistogramManager);
    -[ICNASnapshotReporter setAccountHistogramManager:](self, "setAccountHistogramManager:", v15);

    -[ICNAEventReporter accountTypeForModernAccount:](self, "accountTypeForModernAccount:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = self;
    -[ICNASnapshotReporter accountPurposeForModernAccount:](self, "accountPurposeForModernAccount:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "saltedID:forClass:", v21, objc_opt_class());
    v22 = objc_claimAutoreleasedReturnValue();

    v175 = (void *)v22;
    v177 = (void *)v16;
    v176 = (void *)v19;
    v310 = -[ICASAccountSnapshotItemData initWithAccountID:accountType:accountPurpose:]([ICASAccountSnapshotItemData alloc], "initWithAccountID:accountType:accountPurpose:", v22, v16, v19);
    v23 = objc_alloc_init(_ICNANoteReportToAccount);
    v24 = objc_alloc_init(_ICNAFolderReportToAccount);
    v25 = objc_alloc_init(_ICNAAttachmentReportToAccount);
    v311 = v17;
    objc_msgSend(v17, "customRootLevelFolders");
    v316 = 0u;
    v317 = 0u;
    v318 = 0u;
    v319 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v316, v329, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v317;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v317 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v316 + 1) + 8 * v29);
          v31 = objc_alloc_init(_ICNAFolderReportToParentFolder);
          -[ICNASnapshotReporter snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:](v18, "snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:", v30, v31, v24, v315, v23, v25, v314);
          -[ICNASnapshotReporter accountHistogramManager](v18, "accountHistogramManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "topLevelFolderTotalNoteCountHistogram");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "reportValue:", (double)-[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v31, "totalNoteCountIncludingSubFolders"));

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v316, v329, 16);
      }
      while (v27);
    }
    objc_msgSend(v311, "defaultFolder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v18;
    v312 = v24;
    v309 = v25;
    -[ICNASnapshotReporter snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:](v18, "snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:", v34, 0, v24, v315, v23, v25, v314);

    objc_msgSend(v311, "trashFolder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:](v18, "snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:", v35, 0, v24, v315, v23, v25, v314);

    v307 = [ICASAccountNotesTwoFactorItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 1)));
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 2)));
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 3)));
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 4)));
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 5)));
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 6)));
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 7)));
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 8)));
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 2)));
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 3)));
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 4)));
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 5)));
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 6)));
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 7)));
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 8)));
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 9)));
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 3)));
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 4)));
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 5)));
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 6)));
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 7)));
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 8)));
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 9)));
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 4)));
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 5)));
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 6)));
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 7)));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 8)));
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 9)));
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 5)));
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 6)));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 7)));
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 8)));
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 9)));
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 6)));
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 7)));
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 8)));
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 9)));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 7)));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 8)));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 9)));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 7, 8)));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 8, 9)));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v308 = -[ICASAccountNotesTwoFactorItemData initWithTotalCountOfNotesWithCollabAndDocScan:totalCountOfNotesWithCollabAndInlineDrawingV1:totalCountOfNotesWithCollabAndInlineDrawingV2:totalCountOfNotesWithCollabAndFullscreenDrawing:totalCountOfNotesWithCollabAndTables:totalCountOfNotesWithCollabAndOtherAttachments:totalCountOfNotesWithCollabAndChecklist:totalCountOfNotesWithCollabAndIsPinned:totalCountOfNotesWithDocScanAndInlineDrawingV1:totalCountOfNotesWithDocScanAndInlineDrawingV2:totalCountOfNotesWithDocScanAndFullscreenDrawing:totalCountOfNotesWithDocScanAndTables:totalCountOfNotesWithDocScanAndOtherAttachments:totalCountOfNotesWithDocScanAndChecklist:totalCountOfNotesWithDocScanAndIsPinned:totalCountOfNotesWithDocScanAndIsLocked:totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV1AndTables:totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:totalCountOfNotesWithInlineDrawingV1AndChecklist:totalCountOfNotesWithInlineDrawingV1AndIsPinned:totalCountOfNotesWithInlineDrawingV1AndIsLocked:totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV2AndTables:totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:totalCountOfNotesWithInlineDrawingV2AndChecklist:totalCountOfNotesWithInlineDrawingV2AndIsPinned:totalCountOfNotesWithInlineDrawingV2AndIsLocked:totalCountOfNotesWithFullscreenDrawingAndTables:totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:totalCountOfNotesWithFullscreenDrawingAndChecklist:totalCountOfNotesWithFullscreenDrawingAndIsPinned:totalCountOfNotesWithFullscreenDrawingAndIsLocked:totalCountOfNotesWithTablesAndOtherAttachments:totalCountOfNotesWithTablesAndChecklist:totalCountOfNotesWithTablesAndIsPinned:totalCountOfNotesWithTablesAndIsLocked:totalCountOfNotesWithOtherAttachmentsAndChecklist:totalCountOfNotesWithOtherAttachmentsAndIsPinned:totalCountOfNotesWithOtherAttachmentsAndIsLocked:totalCountOfNotesWithChecklistAndIsPinned:totalCountOfNotesIsPinnedAndIsLocked:](v307, "initWithTotalCountOfNotesWithCollabAndDocScan:totalCountOfNotesWithCollabAndInlineDrawingV1:totalCountOfNotesWithCollabAndInlineDrawingV2:totalCountOfNotesWithCollabAndFullscreenDrawing:totalCountOfNotesWithCollabAndTables:totalCountOfNotesWithCollabAndOtherAttachments:totalCountOfNotesWithCollabAndChecklist:totalCountOfNotesWithCollabAndIsPinned:totalCountOfNotesWithDocScanAndInlineDrawingV1:totalCountOfNotesWithDocScanAndInlineDrawingV2:totalCountOfNotesWithDocScanAndFullscreenDrawing:totalCountOfNotesWithDocScanAndTables:totalCountOfNotesWithDocScanAndOtherAttachments:totalCountOfNotesWithDocScanAndChecklist:totalCountOfNotesWithDocScanAndIsPinned:totalCountOfNotesWithDocScanAndIsLocked:totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV1AndTables:totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:totalCountOfNotesWithInlineDrawingV1AndChecklist:totalCountOfNotesWithInlineDrawingV1AndIsPinned:totalCountOfNotesWithInlineDrawingV1AndIsLocked:totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV2AndTables:totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:totalCountOfNotesWithInlineDrawingV2AndChecklist:totalCountOfNotesWithInlineDrawingV2AndIsPinned:totalCountOfNotesWithInlineDrawingV2AndIsLocked:totalCountOfNotesWithFullscreenDrawingAndTables:totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:totalCountOfNotesWithFullscreenDrawingAndChecklist:totalCountOfNotesWithFullscreenDrawingAndIsPinned:totalCountOfNotesWithFullscreenDrawingAndIsLocked:totalCountOfNotesWithTablesAndOtherAttachments:totalCountOfNotesWithTablesAndChecklist:totalCountOfNotesWithTablesAndIsPinned:totalCountOfNotesWithTablesAndIsLocked:totalCountOfNotesWithOtherAttachmentsAndChecklist:totalCountOfNotesWithOtherAttachmentsAndIsPinned:totalCountOfNotesWithOtherAttachmentsAndIsL"
             "ocked:totalCountOfNotesWithChecklistAndIsPinned:totalCountOfNotesIsPinnedAndIsLocked:",
             v305,
             v302,
             v299,
             v295,
             v285,
             v281,
             v290,
             v277,
             v273,
             v270,
             v264,
             v267,
             v261,
             v255,
             v258,
             v249,
             v252,
             v244,
             v246,
             v240,
             v242,
             v234,
             v238,
             v232,
             v236,
             v230,
             v220,
             v228,
             v218,
             v226,
             v216,
             v214,
             v212,
             v224,
             v222,
             v210,
             v208,
             v206,
             v204,
             v36,
             v37,
             v38,
             v39);

    v40 = [ICASCollabNotesItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 2, 1)));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 2, 2)));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 1, 1)));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 1, 2)));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 0)));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 1)));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 2)));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = -[ICASCollabNotesItemData initWithTotalNotesCollabRootReadOnlyCount:totalNotesCollabThruFolderReadOnlyCount:totalNotesCollabRootReadWriteJoinedCount:totalNotesCollabThruFolderReadWriteJoinedCount:totalNotesNotCollabCount:totalNotesCollabRootOwnedCount:totalNotesCollabThruFolderOwnedCount:](v40, "initWithTotalNotesCollabRootReadOnlyCount:totalNotesCollabThruFolderReadOnlyCount:totalNotesCollabRootReadWriteJoinedCount:totalNotesCollabThruFolderReadWriteJoinedCount:totalNotesNotCollabCount:totalNotesCollabRootOwnedCount:totalNotesCollabThruFolderOwnedCount:", v41, v42, v43, v44, v45, v46, v47);

    v303 = [ICASCollabFoldersItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 1)));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 2)));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 1)));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 2)));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 0)));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 1)));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v312, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 2)));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = -[ICASCollabFoldersItemData initWithTotalFoldersCollabRootReadOnlyCount:totalFoldersCollabSubfolderReadOnlyCount:totalFoldersCollabRootReadWriteJoinedCount:totalFoldersCollabSubfolderReadWriteJoinedCount:totalFoldersNotCollabCount:totalFoldersCollabRootOwnedCount:totalFoldersCollabSubfolderOwnedCount:](v303, "initWithTotalFoldersCollabRootReadOnlyCount:totalFoldersCollabSubfolderReadOnlyCount:totalFoldersCollabRootReadWriteJoinedCount:totalFoldersCollabSubfolderReadWriteJoinedCount:totalFoldersNotCollabCount:totalFoldersCollabRootOwnedCount:totalFoldersCollabSubfolderOwnedCount:", v48, v49, v50, v51, v52, v53, v54);

    v300 = [ICASNoteAttachmentItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithDocScan](v23, "countOfNotesWithDocScan")));
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithInlineDrawingV1](v23, "countOfNotesWithInlineDrawingV1")));
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithInlineDrawingV2](v23, "countOfNotesWithInlineDrawingV2")));
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPaperKit](v23, "countOfNotesWithPaperKit")));
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFullscreenDrawing](v23, "countOfNotesWithFullscreenDrawing")));
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithTable](v23, "countOfNotesWithTable")));
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithOtherAttachments](v23, "countOfNotesWithOtherAttachments")));
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithRichURL](v23, "countOfNotesWithRichURL")));
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMapLink](v23, "countOfNotesWithMapLink")));
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithDeepLink](v23, "countOfNotesWithDeepLink")));
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPaperDocument](v23, "countOfNotesWithPaperDocument")));
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPDF](v23, "countOfNotesWithPDF")));
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithNoteLink](v23, "countOfNotesWithNoteLink")));
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFolderLink](v23, "countOfNotesWithFolderLink")));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-1));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = -[ICASNoteAttachmentItemData initWithTotalCountOfNotesWithAttachmentDocScan:totalCountOfNotesWithAttachmentInlineDrawingV1:totalCountOfNotesWithAttachmentInlineDrawingV2:totalCountOfNotesWithAttachmentPaperKit:totalCountOfNotesWithAttachmentFullscreenDrawing:totalCountOfNotesWithAttachmentTables:totalCountOfNotesWithAttachmentOther:totalCountOfNotesWithAttachmentRichUrl:totalCountOfNotesWithAttachmentMapLink:totalCountOfNotesWithAttachmentDeepLink:totalCountOfNotesWithPaperDocument:totalCountOfNotesWithPdfDocument:totalCountOfNotesWithNoteLinks:totalCountOfNotesWithFolderLinks:totalCountOfNotesWithAttachmentAudio:totalCountOfAudioAttachments:totalCountOfAudioAttachmentsRecordedInNotes:totalCountOfAudioAttachmentsWithAppendedAudio:totalCountOfNotesWithAttachmentAudioTranscript:totalCountOfNotesWithAttachmentAudioSummary:](v300, "initWithTotalCountOfNotesWithAttachmentDocScan:totalCountOfNotesWithAttachmentInlineDrawingV1:totalCountOfNotesWithAttachmentInlineDrawingV2:totalCountOfNotesWithAttachmentPaperKit:totalCountOfNotesWithAttachmentFullscreenDrawing:totalCountOfNotesWithAttachmentTables:totalCountOfNotesWithAttachmentOther:totalCountOfNotesWithAttachmentRichUrl:totalCountOfNotesWithAttachmentMapLink:totalCountOfNotesWithAttachmentDeepLink:totalCountOfNotesWithPaperDocument:totalCountOfNotesWithPdfDocument:totalCountOfNotesWithNoteLinks:totalCountOfNotesWithFolderLinks:totalCountOfNotesWithAttachmentAudio:totalCountOfAudioAttachments:totalCountOfAudioAttachmentsRecordedInNotes:totalCountOfAudioAttachmentsWithAppendedAudio:totalCountOfNotesWithAttachmentAudioTranscript:totalCountOfNotesWithAttachmentAudioSummary:", v282, v291, v286, v296, v265, v262, v278, v274, v259, v271,
             v268,
             v253,
             v256,
             v56,
             v250,
             v247,
             v57,
             v58,
             v59,
             v60);

    v297 = [ICASScrapPaperAttachmentItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithDocScan](v55, "countOfScrapPapersWithDocScan")));
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithInlineDrawingV1](v55, "countOfScrapPapersWithInlineDrawingV1")));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithInlineDrawingV2](v55, "countOfScrapPapersWithInlineDrawingV2")));
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithPaperKit](v55, "countOfScrapPapersWithPaperKit")));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithFullscreenDrawing](v55, "countOfScrapPapersWithFullscreenDrawing")));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithTables](v55, "countOfScrapPapersWithTables")));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithOtherAttachments](v55, "countOfScrapPapersWithOtherAttachments")));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithRichUrl](v55, "countOfScrapPapersWithRichUrl")));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v55;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithMapLink](v55, "countOfScrapPapersWithMapLink")));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithDeepLink](v55, "countOfScrapPapersWithDeepLink")));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v298 = -[ICASScrapPaperAttachmentItemData initWithTotalCountOfScrapPapersWithAttachmentDocScan:totalCountOfScrapPapersWithAttachmentInlineDrawingV1:totalCountOfScrapPapersWithAttachmentInlineDrawingV2:totalCountOfScrapPapersWithAttachmentPaperKit:totalCountOfScrapPapersWithAttachmentFullscreenDrawing:totalCountOfScrapPapersWithAttachmentTables:totalCountOfScrapPapersWithAttachmentOther:totalCountOfScrapPapersWithAttachmentRichUrl:totalCountOfScrapPapersWithAttachmentMapLink:totalCountOfScrapPapersWithAttachmentDeepLink:](v297, "initWithTotalCountOfScrapPapersWithAttachmentDocScan:totalCountOfScrapPapersWithAttachmentInlineDrawingV1:totalCountOfScrapPapersWithAttachmentInlineDrawingV2:totalCountOfScrapPapersWithAttachmentPaperKit:totalCountOfScrapPapersWithAttachmentFullscreenDrawing:totalCountOfScrapPapersWithAttachmentTables:totalCountOfScrapPapersWithAttachmentOther:totalCountOfScrapPapersWithAttachmentRichUrl:totalCountOfScrapPapersWithAttachmentMapLink:totalCountOfScrapPapersWithAttachmentDeepLink:", v292, v61, v287, v62, v63, v64, v65, v66, v67, v68);

    v293 = [ICASSmartFoldersItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithTagsFilter](v312, "countOfSmartFoldersWithTagsFilter")));
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithDateCreatedFilter](v312, "countOfSmartFoldersWithDateCreatedFilter")));
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithDateModifiedFilter](v312, "countOfSmartFoldersWithDateModifiedFilter")));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithSharedFilter](v312, "countOfSmartFoldersWithSharedFilter")));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithMentionsFilter](v312, "countOfSmartFoldersWithMentionsFilter")));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithChecklistsFilter](v312, "countOfSmartFoldersWithChecklistsFilter")));
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithAttachmentsFilter](v312, "countOfSmartFoldersWithAttachmentsFilter")));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithFoldersFilter](v312, "countOfSmartFoldersWithFoldersFilter")));
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithQuickNotesFilter](v312, "countOfSmartFoldersWithQuickNotesFilter")));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithPinnedNotesFilter](v312, "countOfSmartFoldersWithPinnedNotesFilter")));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithLockedNotesFilter](v312, "countOfSmartFoldersWithLockedNotesFilter")));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithUnknownFilter](v312, "countOfSmartFoldersWithUnknownFilter")));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = -[ICASSmartFoldersItemData initWithTotalCountOfSmartFoldersWithTagsFilter:totalCountOfSmartFoldersWithDateCreatedFilter:totalCountOfSmartFoldersWithDateModifiedFilter:totalCountOfSmartFoldersWithSharedFilter:totalCountOfSmartFoldersWithMentionsFilter:totalCountOfSmartFoldersWithChecklistsFilter:totalCountOfSmartFoldersWithAttachmentsFilter:totalCountOfSmartFoldersWithFoldersFilter:totalCountOfSmartFoldersWithQuickNotesFilter:totalCountOfSmartFoldersWithPinnedNotesFilter:totalCountOfSmartFoldersWithLockedNotesFilter:totalCountOfSmartFoldersWithUnknownFilter:](v293, "initWithTotalCountOfSmartFoldersWithTagsFilter:totalCountOfSmartFoldersWithDateCreatedFilter:totalCountOfSmartFoldersWithDateModifiedFilter:totalCountOfSmartFoldersWithSharedFilter:totalCountOfSmartFoldersWithMentionsFilter:totalCountOfSmartFoldersWithChecklistsFilter:totalCountOfSmartFoldersWithAttachmentsFilter:totalCountOfSmartFoldersWithFoldersFilter:totalCountOfSmartFoldersWithQuickNotesFilter:totalCountOfSmartFoldersWithPinnedNotesFilter:totalCountOfSmartFoldersWithLockedNotesFilter:totalCountOfSmartFoldersWithUnknownFilter:", v288, v279, v69, v70, v71, v283, v72, v275, v73, v74, v75, v76);

    v77 = [ICASLockedNotesItemData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfV1LockedNotes](v55, "countOfV1LockedNotes")));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfV2LockedNotes](v55, "countOfV2LockedNotes")));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotesWithDivergedMode](v55, "countOfLockedNotesWithDivergedMode")));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotesWithDivergedPassword](v55, "countOfLockedNotesWithDivergedPassword")));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = -[ICASLockedNotesItemData initWithTotalCountOfV1LockedNotes:totalCountOfV2LockedNotes:totalCountOfLockedNotesWithDivergedMode:totalCountOfLockedNotesWithDivergedPassword:](v77, "initWithTotalCountOfV1LockedNotes:totalCountOfV2LockedNotes:totalCountOfLockedNotesWithDivergedMode:totalCountOfLockedNotesWithDivergedPassword:", v78, v79, v80, v81);

    v156 = [ICASAccountSnapshotData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNAController saltVersion](ICNAController, "saltVersion");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    v328 = v310;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v328, 1);
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    v327 = v308;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v327, 1);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = v306;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v326, 1);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = v304;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v325, 1);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v324 = v301;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v324, 1);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    v323 = v298;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v323, 1);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v322 = v174;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v322, 1);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v321 = v294;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v321, 1);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotes](v55, "countOfNotes")));
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFolders](v312, "countOfFolders")));
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfCustomSmartFolders](v312, "countOfCustomSmartFolders")));
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v55;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfChecklists](v55, "countOfChecklists")));
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithChecklists](v55, "countOfNotesWithChecklists")));
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfPinnedNotes](v55, "countOfPinnedNotes")));
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotes](v55, "countOfLockedNotes")));
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter deviceSnapshotSummaryForDataType:](v149, "deviceSnapshotSummaryForDataType:", objc_opt_class());
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter userSnapshotSummaryForDataType:](v149, "userSnapshotSummaryForDataType:", objc_opt_class());
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICNAAttachmentReportToAccount attachmentUTISummary](v309, "attachmentUTISummary");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "folderDirectNoteCountHistogram");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "icasHistogram");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "collabRootFolderTotalNoteCountHistogram");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "icasHistogram");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "docScanPageCountHistogram");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "icasHistogram");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "collabOwnedRootFolderInviteeCountHistogram");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "icasHistogram");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "collabOwnedRootFolderAcceptanceCountHistogram");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "icasHistogram");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "collabOwnedRootFolderNoReplyCountHistogram");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "icasHistogram");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "collabOwnedRootFolderAcceptanceRatioHistogram");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "icasHistogram");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "collabOwnedSingleNoteInviteeCountHistogram");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "icasHistogram");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "collabOwnedSingleNoteAcceptanceCountHistogram");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "icasHistogram");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "collabOwnedSingleNoteNoReplyCountHistogram");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "icasHistogram");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "collabOwnedSingleNoteAcceptanceRatioHistogram");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "icasHistogram");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "noteCharCountHistogram");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "icasHistogram");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "inlineDrawingV1TotalStrokeCountHistogram");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "icasHistogram");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "inlineDrawingV1PencilStrokeCountHistogram");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "icasHistogram");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "inlineDrawingV1FingerStrokeCountHistogram");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "icasHistogram");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "inlineDrawingV1FingerStrokeRatioHistogram");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "icasHistogram");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "inlineDrawingV2TotalStrokeCountHistogram");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "icasHistogram");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "inlineDrawingV2PencilStrokeCountHistogram");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "icasHistogram");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "inlineDrawingV2FingerStrokeCountHistogram");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "icasHistogram");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "inlineDrawingV2FingerStrokeRatioHistogram");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "icasHistogram");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "fullscreenDrawingStrokeCountHistogram");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "icasHistogram");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "tableRowCountHistogram");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "icasHistogram");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "tableColumnCountHistogram");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "icasHistogram");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "tableCellCountHistogram");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "icasHistogram");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "passwordProtectedNoteWeeklyAgeHistogram");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "icasHistogram");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "topLevelFolderTotalNoteCountHistogram");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "icasHistogram");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "attachmentCountPerNoteHistogram");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "icasHistogram");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "drawingCountPerNoteHistogram");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "icasHistogram");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "inlineDrawingFingerStrokesCountPerNoteHistogram");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "icasHistogram");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "inlineDrawingPencilStrokesCountPerNoteHistogram");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "icasHistogram");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "fullScreenDrawingStrokesCountPerNoteHistogram");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "icasHistogram");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "totalStrokesCountPerNoteHistogram");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "icasHistogram");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "tagCountPerNoteHistogram");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "icasHistogram");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "distinctTagCountPerNoteHistogram");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "icasHistogram");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithTags](v55, "countOfNotesWithTags")));
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollapsedSections](v55, "countOfNotesWithCollapsedSections")));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMentions](v55, "countOfNotesWithMentions")));
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount scrapPaperCount](v55, "scrapPaperCount")));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithTags](v55, "countOfScrapPapersWithTags")));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithMentions](v55, "countOfScrapPapersWithMentions")));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfPinnedScrapPapers](v55, "countOfPinnedScrapPapers")));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedScrapPapers](v55, "countOfLockedScrapPapers")));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfCollaboratedScrapPapers](v55, "countOfCollaboratedScrapPapers")));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "mentionCountPerNoteHistogram");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "icasHistogram");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASnapshotReporter accountHistogramManager](v149, "accountHistogramManager");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "distinctMentionCountPerNoteHistogram");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "icasHistogram");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMathUsage](v82, "countOfNotesWithMathUsage")));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = -[ICASAccountSnapshotData initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:](v156, "initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:tota"
             "lCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPer"
             "NoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:",
             v289,
             v284,
             v276,
             v266,
             v257,
             v245,
             v272,
             v280,
             v239,
             v269,
             v263,
             v260,
             v235,
             v254,
             v251,
             v248,
             v233,
             v243,
             v241,
             v229,
             v237,
             v231,
             v223,
             v227,
             v219,
             v225,
             v217,
             v207,
             v221,
             v203,
             v215,
             v213,
             v201,
             v211,
             v199,
             v209,
             v198,
             v205,
             v202,
             v200,
             v194,
             v197,
             v193,
             v196,
             v191,
             v195,
             v189,
             v192,
             v187,
             v190,
             v188,
             v186,
             v185,
             v183,
             v182,
             v181,
             v180,
             v179,
             v102,
             v99,
             v83);

    +[ICNAController sharedController](ICNAController, "sharedController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_opt_class();
    v320 = v157;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v320, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter subTracker](v149, "subTracker");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "submitEventOfType:pushThenPopDataObjects:subTracker:", v90, v91, v92);

    v93 = objc_msgSend(v177, "accountType");
    v94 = -[_ICNANoteReportToAccount countOfNotes](v184, "countOfNotes");
    v11 = v178;
    v95 = v93;
    v13 = v314;
    objc_msgSend(v178, "reportAccountType:noteCount:", v95, v94);
    v14 = v311;
    objc_msgSend((id)objc_opt_class(), "faultOutObject:");
    -[ICNASnapshotReporter setAccountHistogramManager:](v149, "setAccountHistogramManager:", 0);

    v12 = v315;
  }

}

- (void)snapshotHTMLAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICNAHistogramManager *v13;
  void *v14;
  void *v15;
  _ICNAFolderReportToAccount *v16;
  _ICNANoteReportToAccount *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  ICASAccountSnapshotItemData *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  ICASAccountSnapshotData *v114;
  ICASAccountSnapshotData *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  ICASAccountSnapshotData *v146;
  ICASAccountSnapshotItemData *v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v101 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(ICNAHistogramManager);
  -[ICNASnapshotReporter setAccountHistogramManager:](self, "setAccountHistogramManager:", v13);

  v14 = v10;
  -[ICNASnapshotReporter sortedFoldersForAccount:](self, "sortedFoldersForAccount:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(_ICNAFolderReportToAccount);
  v17 = objc_alloc_init(_ICNANoteReportToAccount);
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v142, v148, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v143;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v143 != v21)
          objc_enumerationMutation(v18);
        -[ICNASnapshotReporter snapshotHTMLFolder:reportedDataToAccount:reportedDataToDevice:noteReportToAccount:reportedDataFromNoteToDevice:](self, "snapshotHTMLFolder:reportedDataToAccount:reportedDataToDevice:noteReportToAccount:reportedDataFromNoteToDevice:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * v22++), v16, v11, v17, v12);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v142, v148, 16);
    }
    while (v20);
  }

  v75 = v14;
  -[ICNAEventReporter accountTypeForHTMLAccount:](self, "accountTypeForHTMLAccount:", v14);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountPurposeForHTMLAccount](self, "accountPurposeForHTMLAccount");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "saltedID:forClass:", v24, objc_opt_class());
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = -[ICASAccountSnapshotItemData initWithAccountID:accountType:accountPurpose:]([ICASAccountSnapshotItemData alloc], "initWithAccountID:accountType:accountPurpose:", v99, v141, v100);
  v114 = [ICASAccountSnapshotData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController saltVersion](ICNAController, "saltVersion");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v98;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotes](v17, "countOfNotes")));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFolders](v16, "countOfFolders")));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfCustomSmartFolders](v16, "countOfCustomSmartFolders")));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter deviceSnapshotSummaryForDataType:](self, "deviceSnapshotSummaryForDataType:", objc_opt_class());
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter userSnapshotSummaryForDataType:](self, "userSnapshotSummaryForDataType:", objc_opt_class());
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "folderDirectNoteCountHistogram");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "icasHistogram");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "collabRootFolderTotalNoteCountHistogram");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "icasHistogram");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "docScanPageCountHistogram");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "icasHistogram");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "collabOwnedRootFolderInviteeCountHistogram");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "icasHistogram");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "collabOwnedRootFolderAcceptanceCountHistogram");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "icasHistogram");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "collabOwnedRootFolderNoReplyCountHistogram");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "icasHistogram");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "collabOwnedRootFolderAcceptanceRatioHistogram");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "icasHistogram");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "collabOwnedSingleNoteInviteeCountHistogram");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "icasHistogram");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "collabOwnedSingleNoteAcceptanceCountHistogram");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "icasHistogram");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "collabOwnedSingleNoteNoReplyCountHistogram");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "icasHistogram");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "collabOwnedSingleNoteAcceptanceRatioHistogram");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "icasHistogram");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "noteCharCountHistogram");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "icasHistogram");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "inlineDrawingV1TotalStrokeCountHistogram");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "icasHistogram");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "inlineDrawingV1PencilStrokeCountHistogram");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "icasHistogram");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "inlineDrawingV1FingerStrokeCountHistogram");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "icasHistogram");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "inlineDrawingV1FingerStrokeRatioHistogram");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "icasHistogram");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "inlineDrawingV2TotalStrokeCountHistogram");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "icasHistogram");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "inlineDrawingV2PencilStrokeCountHistogram");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "icasHistogram");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "inlineDrawingV2FingerStrokeCountHistogram");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "icasHistogram");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "inlineDrawingV2FingerStrokeRatioHistogram");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "icasHistogram");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "fullscreenDrawingStrokeCountHistogram");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "icasHistogram");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "tableRowCountHistogram");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "icasHistogram");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "tableColumnCountHistogram");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "icasHistogram");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "tableCellCountHistogram");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "icasHistogram");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "passwordProtectedNoteWeeklyAgeHistogram");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "icasHistogram");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topLevelFolderTotalNoteCountHistogram");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "icasHistogram");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "attachmentCountPerNoteHistogram");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "icasHistogram");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "drawingCountPerNoteHistogram");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "icasHistogram");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inlineDrawingFingerStrokesCountPerNoteHistogram");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "icasHistogram");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "inlineDrawingPencilStrokesCountPerNoteHistogram");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "icasHistogram");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fullScreenDrawingStrokesCountPerNoteHistogram");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "icasHistogram");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "totalStrokesCountPerNoteHistogram");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "icasHistogram");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = -[ICASAccountSnapshotData initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:](v114, "initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCount"
           "OfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerN"
           "oteHistogram:totalCountOfNotesWithMathUsage:",
           v140,
           v139,
           v138,
           v137,
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           v136,
           v135,
           v134,
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8,
           v133,
           v132,
           MEMORY[0x1E0C9AA60],
           v131,
           v130,
           v129,
           v128,
           v127,
           v126,
           v125,
           v124,
           v123,
           v122,
           v121,
           v120,
           v119,
           v118,
           v117,
           v116,
           v113,
           v112,
           v111,
           v110,
           v109,
           v108,
           v107,
           v106,
           v105,
           v104,
           v103,
           v102,
           v25,
           v26,
           v27,
           v28,
           MEMORY[0x1E0C9AA60],
           MEMORY[0x1E0C9AA60],
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8,
           &unk_1E77497E8);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  v146 = v115;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitEventOfType:pushThenPopDataObjects:subTracker:", v30, v31, v32);

  objc_msgSend(v101, "reportAccountType:noteCount:", objc_msgSend(v141, "accountType"), -[_ICNANoteReportToAccount countOfNotes](v17, "countOfNotes"));
  objc_msgSend((id)objc_opt_class(), "faultOutObject:", v75);
  -[ICNASnapshotReporter setAccountHistogramManager:](self, "setAccountHistogramManager:", 0);

}

- (void)snapshotModernFolder:(id)a3 reportedDataToParentFolder:(id)a4 reportedDataToAccount:(id)a5 reportedDataToDevice:(id)a6 reportedDataFromNotesToAccount:(id)a7 reportedDataFromAttachmentToAccount:(id)a8 reportedDataFromNoteToDevice:(id)a9
{
  id v15;
  _ICNAFolderReportToParentFolder *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  _ICNAFolderReportToParentFolder *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  double v35;
  ICNASnapshotReporter *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  id v65;
  void *v66;
  void *v67;
  id v68;
  ICNASnapshotReporter *v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
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
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (_ICNAFolderReportToParentFolder *)a4;
  v17 = a5;
  v68 = a6;
  v72 = a7;
  v71 = a8;
  v70 = a9;
  if (objc_msgSend(v15, "isUnsupported"))
  {
    objc_msgSend((id)objc_opt_class(), "faultOutObject:", v15);
    v18 = v17;
  }
  else
  {
    v69 = self;
    if (!v16)
      v16 = objc_alloc_init(_ICNAFolderReportToParentFolder);
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v15, "foldersInFolder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v82 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          v25 = objc_alloc_init(_ICNAFolderReportToParentFolder);
          -[ICNASnapshotReporter snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:](v69, "snapshotModernFolder:reportedDataToParentFolder:reportedDataToAccount:reportedDataToDevice:reportedDataFromNotesToAccount:reportedDataFromAttachmentToAccount:reportedDataFromNoteToDevice:", v24, v25, v17, v68, v72, v71, v70);
          -[_ICNAFolderReportToParentFolder setTotalNoteCountIncludingSubFolders:](v16, "setTotalNoteCountIncludingSubFolders:", -[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v16, "totalNoteCountIncludingSubFolders")+ -[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v25, "totalNoteCountIncludingSubFolders"));

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v21);
    }

    v26 = objc_msgSend(v15, "isSmartFolder");
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v15, "visibleNotesInFolder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v28)
    {
      v29 = v28;
      v65 = v15;
      v30 = 0;
      v31 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v78 != v31)
            objc_enumerationMutation(v27);
          if ((v26 & 1) == 0)
          {
            v33 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
            v34 = (void *)MEMORY[0x1C3B7B820]();
            -[ICNASnapshotReporter snapshotModernNote:reportedDataToAccount:reportToDevice:reportedDataFromAttachmentToAccount:](v69, "snapshotModernNote:reportedDataToAccount:reportToDevice:reportedDataFromAttachmentToAccount:", v33, v72, v70, v71);
            objc_autoreleasePoolPop(v34);
          }
          -[_ICNAFolderReportToParentFolder setTotalNoteCountIncludingSubFolders:](v16, "setTotalNoteCountIncludingSubFolders:", -[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v16, "totalNoteCountIncludingSubFolders")+ 1);
        }
        v30 += v29;
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v29);
      v35 = (double)v30;
      v15 = v65;
    }
    else
    {
      v35 = 0.0;
    }

    v18 = v17;
    v36 = v69;
    if ((objc_msgSend(v15, "isDefaultFolderForAccount") & 1) == 0 && (objc_msgSend(v15, "isTrashFolder") & 1) == 0)
    {
      -[ICNAEventReporter collaborationStatusForModernObject:](v69, "collaborationStatusForModernObject:", v15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNAEventReporter collaborationTypeForModernObject:](v69, "collaborationTypeForModernObject:", v15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "collaborationType") == 2)
      {
        -[ICNASnapshotReporter accountHistogramManager](v69, "accountHistogramManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "collabRootFolderTotalNoteCountHistogram");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "reportValue:", (double)-[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v16, "totalNoteCountIncludingSubFolders"));

      }
      if (objc_msgSend(v37, "collaborationStatus") == 1 && objc_msgSend(v38, "collaborationType") == 2)
      {
        objc_msgSend(v15, "serverShare");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "ic_nonOwnerInvitedParticipantsCount");
        v43 = objc_msgSend(v41, "ic_nonOwnerAcceptedParticipantsCount");
        -[ICNASnapshotReporter accountHistogramManager](v69, "accountHistogramManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "collabOwnedRootFolderInviteeCountHistogram");
        v66 = v38;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (double)v42;
        objc_msgSend(v45, "reportValue:", (double)v42);

        -[ICNASnapshotReporter accountHistogramManager](v69, "accountHistogramManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "collabOwnedRootFolderAcceptanceCountHistogram");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "reportValue:", (double)v43);

        -[ICNASnapshotReporter accountHistogramManager](v69, "accountHistogramManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "collabOwnedRootFolderNoReplyCountHistogram");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v69;
        objc_msgSend(v50, "reportValue:", (double)(v42 - v43));

        v38 = v66;
        -[ICNASnapshotReporter accountHistogramManager](v69, "accountHistogramManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "collabOwnedRootFolderAcceptanceRatioHistogram");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "reportValue:", (double)v43 / v46);

      }
      -[ICNASnapshotReporter accountHistogramManager](v36, "accountHistogramManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "folderDirectNoteCountHistogram");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "reportValue:", v35);

      objc_msgSend(v18, "setCountOfFolders:", objc_msgSend(v18, "countOfFolders") + 1);
      if (objc_msgSend(v15, "folderType") == 2)
      {
        v67 = v38;
        objc_msgSend(v18, "setCountOfCustomSmartFolders:", objc_msgSend(v18, "countOfCustomSmartFolders") + 1);
        objc_msgSend(v15, "smartFolderQuery");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "managedObjectContext");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "account");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "filterSelectionWithManagedObjectContext:account:", v56, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v59, "filterTypeSelections");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v62; ++k)
            {
              if (*(_QWORD *)v74 != v63)
                objc_enumerationMutation(v60);
              switch(objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "filterType"))
              {
                case -1:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithUnknownFilter:", objc_msgSend(v18, "countOfSmartFoldersWithUnknownFilter") + 1);
                  break;
                case 0:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithTagsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithTagsFilter") + 1);
                  break;
                case 1:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithDateCreatedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithDateCreatedFilter") + 1);
                  break;
                case 2:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithDateModifiedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithDateModifiedFilter") + 1);
                  break;
                case 3:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithSharedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithSharedFilter") + 1);
                  break;
                case 4:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithMentionsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithMentionsFilter") + 1);
                  break;
                case 5:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithChecklistsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithChecklistsFilter") + 1);
                  break;
                case 6:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithAttachmentsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithAttachmentsFilter") + 1);
                  break;
                case 7:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithFoldersFilter:", objc_msgSend(v18, "countOfSmartFoldersWithFoldersFilter") + 1);
                  break;
                case 8:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithQuickNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithQuickNotesFilter") + 1);
                  break;
                case 9:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithPinnedNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithPinnedNotesFilter") + 1);
                  break;
                case 10:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithLockedNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithLockedNotesFilter") + 1);
                  break;
                default:
                  continue;
              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
          }
          while (v62);
        }

        v38 = v67;
      }
      objc_msgSend(v18, "updateFolderCollaborationMatrixWithCollaborationStatus:collaborationType:", v37, v38);
      objc_msgSend(v68, "updateFolderCollaborationMatrixWithCollaborationStatus:collaborationType:", v37, v38);

    }
    objc_msgSend((id)objc_opt_class(), "faultOutObject:", v15);
  }

}

- (void)snapshotHTMLFolder:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5 noteReportToAccount:(id)a6 reportedDataFromNoteToDevice:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  double v27;
  ICASCollaborationStatus *v28;
  ICASCollaborationType *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[ICNASnapshotReporter htmlContext](self, "htmlContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allVisibleNotesInFolder:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v36 = v14;
  if (v20)
  {
    v21 = v20;
    v34 = v13;
    v35 = v12;
    v22 = 0;
    v23 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x1C3B7B820]();
        -[ICNASnapshotReporter snapshotHTMLNote:reportedDataToAccount:reportedDataToDevice:](self, "snapshotHTMLNote:reportedDataToAccount:reportedDataToDevice:", v25, v15, v16);
        objc_autoreleasePoolPop(v26);
      }
      v22 += v21;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v21);
    v27 = (double)v22;
    v13 = v34;
    v12 = v35;
    v14 = v36;
  }
  else
  {
    v27 = 0.0;
  }

  if (objc_msgSend(v12, "isCustomFolder"))
  {
    v28 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
    v29 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topLevelFolderTotalNoteCountHistogram");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reportValue:", v27);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "folderDirectNoteCountHistogram");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reportValue:", v27);

    v14 = v36;
    objc_msgSend(v13, "setCountOfFolders:", objc_msgSend(v13, "countOfFolders") + 1);
    objc_msgSend(v13, "updateFolderCollaborationMatrixWithCollaborationStatus:collaborationType:", v28, v29);
    objc_msgSend(v36, "updateFolderCollaborationMatrixWithCollaborationStatus:collaborationType:", v28, v29);

  }
  objc_msgSend((id)objc_opt_class(), "faultOutObject:", v12);

}

- (void)snapshotModernNote:(id)a3 reportedDataToAccount:(id)a4 reportToDevice:(id)a5 reportedDataFromAttachmentToAccount:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _ICNAAttachmentReportToNote *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  BOOL v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  _QWORD v127[7];
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[4];
  id v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  char v152;
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v126 = a4;
  v125 = a5;
  v11 = a6;
  v124 = v10;
  if (objc_msgSend(v10, "isUnsupported"))
  {
    objc_msgSend((id)objc_opt_class(), "faultOutObject:", v10);
  }
  else
  {
    -[ICNAEventReporter collaborationTypeForModernObject:](self, "collaborationTypeForModernObject:", v10);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter collaborationStatusForModernObject:](self, "collaborationStatusForModernObject:", v10);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "updateNoteCollaborationMatrixWithCollaborationStatus:collaborationType:", v113, v114);
    if (objc_msgSend(v113, "collaborationStatus") == 1 && objc_msgSend(v114, "collaborationType") == 2)
    {
      objc_msgSend(v10, "serverShare");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "ic_nonOwnerInvitedParticipantsCount");
      v14 = objc_msgSend(v12, "ic_nonOwnerAcceptedParticipantsCount");
      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collabOwnedSingleNoteInviteeCountHistogram");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reportValue:", (double)v13);

      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "collabOwnedSingleNoteAcceptanceCountHistogram");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reportValue:", (double)v14);

      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collabOwnedSingleNoteNoReplyCountHistogram");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reportValue:", (double)(v13 - v14));

      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "collabOwnedSingleNoteAcceptanceRatioHistogram");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reportValue:", (double)v14 / (double)v13);

    }
    objc_msgSend(v124, "textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v23;
    v149 = 0;
    v150 = &v149;
    v151 = 0x2020000000;
    v152 = 0;
    v145 = 0;
    v146 = &v145;
    v147 = 0x2020000000;
    v148 = 0;
    v24 = v23;
    if (v23)
    {
      v108 = objc_msgSend(v23, "length");
      v141 = 0;
      v142 = &v141;
      v143 = 0x2020000000;
      v144 = 0;
      v25 = objc_msgSend(v24, "length");
      v136[0] = MEMORY[0x1E0C809B0];
      v136[1] = 3221225472;
      v136[2] = __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke;
      v136[3] = &unk_1E771C0E8;
      v138 = &v149;
      v137 = v126;
      v139 = &v141;
      v140 = &v145;
      objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v25, 0, v136);

      _Block_object_dispose(&v141, 8);
    }
    else
    {
      v108 = 0;
    }
    v26 = objc_alloc_init(_ICNAAttachmentReportToNote);
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(v124, "visibleAttachments");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v133 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          v32 = (void *)MEMORY[0x1C3B7B820]();
          objc_msgSend(v31, "parentAttachment");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33 == 0;

          if (v34)
            -[ICNASnapshotReporter snapshotAttachment:reportedDataToNote:reportedDataToAccount:](self, "snapshotAttachment:reportedDataToNote:reportedDataToAccount:", v31, v26, v11);
          objc_autoreleasePoolPop(v32);
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
      }
      while (v28);
    }

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0D63678]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v36, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D63688]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v38, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D63680]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v40, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0D63670]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v42, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x1E0D636B8]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v44, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v47, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("com.apple.notes.analytics.appleMaps"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v49, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x1E0D636B0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v51, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D63698]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v53, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", *MEMORY[0x1E0D636A0]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v55, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", *MEMORY[0x1E0D636A8]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v57, "unsignedIntegerValue");

    -[_ICNAAttachmentReportToNote countOfAttachmentByUTI](v26, "countOfAttachmentByUTI");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D63690]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v59, "unsignedIntegerValue");

    v107 = -[_ICNAAttachmentReportToNote countOfAttachments](v26, "countOfAttachments");
    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "noteCharCountHistogram");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "reportValue:", (double)v108);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "attachmentCountPerNoteHistogram");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "reportValue:", (double)-[_ICNAAttachmentReportToNote countOfAttachments](v26, "countOfAttachments"));

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "drawingCountPerNoteHistogram");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "reportValue:", (double)(unint64_t)(v120 + v121 + v122));

    v66 = -[_ICNAAttachmentReportToNote countOfInlineDrawingV1FingerStrokes](v26, "countOfInlineDrawingV1FingerStrokes");
    v67 = -[_ICNAAttachmentReportToNote countOfInlineDrawingV2FingerStrokes](v26, "countOfInlineDrawingV2FingerStrokes");
    v68 = -[_ICNAAttachmentReportToNote countOfInlineDrawingV1PencilStrokes](v26, "countOfInlineDrawingV1PencilStrokes");
    v69 = -[_ICNAAttachmentReportToNote countOfInlineDrawingV2PencilStrokes](v26, "countOfInlineDrawingV2PencilStrokes");
    v70 = -[_ICNAAttachmentReportToNote countOfFullscreenDrawingStrokes](v26, "countOfFullscreenDrawingStrokes");
    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "inlineDrawingFingerStrokesCountPerNoteHistogram");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v67 + v66;
    objc_msgSend(v72, "reportValue:", (double)v73);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "inlineDrawingPencilStrokesCountPerNoteHistogram");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v69 + v68;
    objc_msgSend(v75, "reportValue:", (double)v76);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "fullScreenDrawingStrokesCountPerNoteHistogram");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "reportValue:", (double)v70);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "totalStrokesCountPerNoteHistogram");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "reportValue:", (double)(v76 + v73 + v70));

    v81 = objc_msgSend(v124, "isSystemPaper");
    objc_msgSend(v126, "setCountOfNotes:", objc_msgSend(v126, "countOfNotes") + 1);
    objc_msgSend(v126, "setCountOfChecklists:", v146[3] + objc_msgSend(v126, "countOfChecklists"));
    objc_msgSend(v125, "setCountOfModernNotes:", objc_msgSend(v125, "countOfModernNotes") + 1);
    if (v81)
      objc_msgSend(v125, "setCountOfScrapPapers:", objc_msgSend(v125, "countOfScrapPapers") + 1);
    if (objc_msgSend(v124, "isPinned"))
    {
      objc_msgSend(v126, "setCountOfPinnedNotes:", objc_msgSend(v126, "countOfPinnedNotes") + 1);
      objc_msgSend(v125, "setCountOfPinnedNotes:", objc_msgSend(v125, "countOfPinnedNotes") + 1);
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 8);
      if (v81)
        objc_msgSend(v126, "setCountOfPinnedScrapPapers:", objc_msgSend(v126, "countOfPinnedScrapPapers") + 1);
    }
    if (objc_msgSend(v124, "isPasswordProtected"))
    {
      objc_msgSend(v126, "setCountOfLockedNotes:", objc_msgSend(v126, "countOfLockedNotes") + 1);
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 9);
      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "passwordProtectedNoteWeeklyAgeHistogram");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "creationDate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "reportValue:", (double)-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v84));

      if (v81)
        objc_msgSend(v126, "setCountOfLockedScrapPapers:", objc_msgSend(v126, "countOfLockedScrapPapers") + 1);
      if (objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithCustomPasswordForObject:", v124))
      {
        objc_msgSend(v126, "setCountOfV1LockedNotes:", objc_msgSend(v126, "countOfV1LockedNotes") + 1);
        objc_msgSend(v124, "account");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v85, "resolvedLockedNotesMode") == 2;

        if (v86)
          objc_msgSend(v126, "setCountOfLockedNotesWithDivergedMode:", objc_msgSend(v126, "countOfLockedNotesWithDivergedMode") + 1);
        objc_msgSend(v124, "account");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "cryptoStrategy");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "hasSameKeyAsObject:", v124);

        if ((v89 & 1) == 0)
          objc_msgSend(v126, "setCountOfLockedNotesWithDivergedPassword:", objc_msgSend(v126, "countOfLockedNotesWithDivergedPassword") + 1);
      }
      else if (objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithDevicePasswordForObject:", v124))
      {
        objc_msgSend(v126, "setCountOfV2LockedNotes:", objc_msgSend(v126, "countOfV2LockedNotes") + 1);
        objc_msgSend(v124, "account");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "resolvedLockedNotesMode") == 1;

        if (v91)
          objc_msgSend(v126, "setCountOfLockedNotesWithDivergedMode:", objc_msgSend(v126, "countOfLockedNotesWithDivergedMode") + 1);
      }
    }
    if (objc_msgSend(v124, "isSharedViaICloud"))
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 0);
      if (v81)
        objc_msgSend(v126, "setCountOfCollaboratedScrapPapers:", objc_msgSend(v126, "countOfCollaboratedScrapPapers") + 1);
    }
    objc_msgSend(v124, "outlineState");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "collapsedUUIDs");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "count") == 0;

    if (!v94)
      objc_msgSend(v126, "setCountOfNotesWithCollapsedSections:", objc_msgSend(v126, "countOfNotesWithCollapsedSections") + 1);
    if (*((_BYTE *)v150 + 24))
      objc_msgSend(v126, "setCountOfNotesWithChecklists:", objc_msgSend(v126, "countOfNotesWithChecklists") + 1);
    if (v112 | v115)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 1);
      objc_msgSend(v126, "setCountOfNotesWithDocScan:", objc_msgSend(v126, "countOfNotesWithDocScan") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithDocScan:", objc_msgSend(v126, "countOfScrapPapersWithDocScan") + 1);
    }
    if (v121)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 2);
      objc_msgSend(v126, "setCountOfNotesWithInlineDrawingV1:", objc_msgSend(v126, "countOfNotesWithInlineDrawingV1") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithInlineDrawingV1:", objc_msgSend(v126, "countOfScrapPapersWithInlineDrawingV1") + 1);
    }
    if (v120)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 3);
      objc_msgSend(v126, "setCountOfNotesWithInlineDrawingV2:", objc_msgSend(v126, "countOfNotesWithInlineDrawingV2") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithInlineDrawingV2:", objc_msgSend(v126, "countOfScrapPapersWithInlineDrawingV2") + 1);
    }
    if (v122)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 4);
      objc_msgSend(v126, "setCountOfNotesWithFullscreenDrawing:", objc_msgSend(v126, "countOfNotesWithFullscreenDrawing") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithFullscreenDrawing:", objc_msgSend(v126, "countOfScrapPapersWithFullscreenDrawing") + 1);
    }
    if (v111)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 5);
      objc_msgSend(v126, "setCountOfNotesWithTable:", objc_msgSend(v126, "countOfNotesWithTable") + 1);
      objc_msgSend(v125, "setCountOfModernNotesWithTable:", objc_msgSend(v125, "countOfModernNotesWithTable") + 1);
      if (v81)
      {
        objc_msgSend(v126, "setCountOfScrapPapersWithTables:", objc_msgSend(v126, "countOfScrapPapersWithTables") + 1);
        objc_msgSend(v125, "setCountOfScrapPapersWithTables:", objc_msgSend(v125, "countOfScrapPapersWithTables") + 1);
      }
    }
    if (v107 - (v115 + v109) - (v121 + v112 + v120 + v122 + v111 + v119 + v118 + v117 + v110 + v116) >= 1)
    {
      objc_msgSend(v126, "updateNoteTwoFactorMatrixWithIndex:", 6);
      objc_msgSend(v126, "setCountOfNotesWithOtherAttachments:", objc_msgSend(v126, "countOfNotesWithOtherAttachments") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithOtherAttachments:", objc_msgSend(v126, "countOfScrapPapersWithOtherAttachments") + 1);
    }
    if (v119)
    {
      objc_msgSend(v126, "setCountOfNotesWithRichURL:", objc_msgSend(v126, "countOfNotesWithRichURL") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithRichUrl:", objc_msgSend(v126, "countOfScrapPapersWithRichUrl") + 1);
    }
    if (v118)
    {
      objc_msgSend(v126, "setCountOfNotesWithMapLink:", objc_msgSend(v126, "countOfNotesWithMapLink") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithMapLink:", objc_msgSend(v126, "countOfScrapPapersWithMapLink") + 1);
    }
    if (v117)
    {
      objc_msgSend(v126, "setCountOfNotesWithPaperKit:", objc_msgSend(v126, "countOfNotesWithPaperKit") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithPaperKit:", objc_msgSend(v126, "countOfScrapPapersWithPaperKit") + 1);
    }
    if (v110 || v116 || v115)
      objc_msgSend(v126, "setCountOfNotesWithPaperDocument:", objc_msgSend(v126, "countOfNotesWithPaperDocument") + 1);
    if (v109 | v116)
      objc_msgSend(v126, "setCountOfNotesWithPDF:", objc_msgSend(v126, "countOfNotesWithPDF") + 1);
    if (-[_ICNAAttachmentReportToNote hasDeepLink](v26, "hasDeepLink"))
    {
      objc_msgSend(v126, "setCountOfNotesWithDeepLink:", objc_msgSend(v126, "countOfNotesWithDeepLink") + 1);
      objc_msgSend(v125, "setCountOfModernNotesWithDeeplink:", objc_msgSend(v125, "countOfModernNotesWithDeeplink") + 1);
      if (v81)
      {
        objc_msgSend(v126, "setCountOfScrapPapersWithDeepLink:", objc_msgSend(v126, "countOfScrapPapersWithDeepLink") + 1);
        objc_msgSend(v125, "setCountOfScrapPapersWithDeepLink:", objc_msgSend(v125, "countOfScrapPapersWithDeepLink") + 1);
      }
    }
    if (-[_ICNAAttachmentReportToNote hasSafariHighlight](v26, "hasSafariHighlight"))
    {
      objc_msgSend(v125, "setCountOfModernNotesWithWebHighlights:", objc_msgSend(v125, "countOfModernNotesWithWebHighlights") + 1);
      if (v81)
        objc_msgSend(v125, "setCountOfScrapPapersWithWebHighlights:", objc_msgSend(v125, "countOfScrapPapersWithWebHighlights") + 1);
    }
    if (v120 + v121 + v117 != -v122)
    {
      objc_msgSend(v125, "setCountOfModernNotesWithDrawing:", objc_msgSend(v125, "countOfModernNotesWithDrawing") + 1);
      if (v81)
        objc_msgSend(v125, "setCountOfScrapPapersWithDrawing:", objc_msgSend(v125, "countOfScrapPapersWithDrawing") + 1);
    }
    if (-[_ICNAAttachmentReportToNote hasImages](v26, "hasImages"))
    {
      objc_msgSend(v125, "setCountOfModernNotesWithImage:", objc_msgSend(v125, "countOfModernNotesWithImage") + 1);
      if (v81)
        objc_msgSend(v125, "setCountOfScrapPapersWithImage:", objc_msgSend(v125, "countOfScrapPapersWithImage") + 1);
    }
    if (v118 != -v119)
    {
      objc_msgSend(v125, "setCountOfModernNotesWithLinks:", objc_msgSend(v125, "countOfModernNotesWithLinks") + 1);
      if (v81)
        objc_msgSend(v125, "setCountOfScrapPapersWithLinks:", objc_msgSend(v125, "countOfScrapPapersWithLinks") + 1);
    }
    objc_msgSend((id)objc_opt_class(), "inlineAttachmentReportForModernNote:faultOutInlineAttachmentsAfterDone:", v124, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = 0;
    v142 = &v141;
    v143 = 0x2020000000;
    v144 = 0;
    v128 = 0;
    v129 = &v128;
    v130 = 0x2020000000;
    v131 = 0;
    if (objc_msgSend(v95, "countOfTags"))
    {
      objc_msgSend(v126, "setCountOfNotesWithTags:", objc_msgSend(v126, "countOfNotesWithTags") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithTags:", objc_msgSend(v126, "countOfScrapPapersWithTags") + 1);
      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "tagCountPerNoteHistogram");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "reportValue:", (double)(unint64_t)objc_msgSend(v95, "countOfTags"));

      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "distinctTagCountPerNoteHistogram");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "reportValue:", (double)(unint64_t)objc_msgSend(v95, "countOfDistinctTags"));

    }
    if (objc_msgSend(v95, "countOfMentions"))
    {
      objc_msgSend(v126, "setCountOfNotesWithMentions:", objc_msgSend(v126, "countOfNotesWithMentions") + 1);
      if (v81)
        objc_msgSend(v126, "setCountOfScrapPapersWithMentions:", objc_msgSend(v126, "countOfScrapPapersWithMentions") + 1);
      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "mentionCountPerNoteHistogram");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "reportValue:", (double)(unint64_t)objc_msgSend(v95, "countOfMentions"));

      -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "distinctMentionCountPerNoteHistogram");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "reportValue:", (double)(unint64_t)objc_msgSend(v95, "countOfDistinctMentions"));

    }
    if (objc_msgSend(v95, "countOfNoteLinks"))
      *((_BYTE *)v142 + 24) = 1;
    if (objc_msgSend(v95, "countOfFolderLinks"))
      *((_BYTE *)v129 + 24) = 1;
    if (objc_msgSend(v95, "countOfCalculateResults") || objc_msgSend(v95, "countOfCalculateGraphExpressions"))
      -[_ICNAAttachmentReportToNote setHasMathUsage:](v26, "setHasMathUsage:", 1);
    if (v123)
    {
      v104 = objc_msgSend(v123, "ic_range");
      v105 = *MEMORY[0x1E0CEA0C0];
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke_2;
      v127[3] = &unk_1E771C110;
      v127[4] = self;
      v127[5] = &v141;
      v127[6] = &v128;
      objc_msgSend(v123, "enumerateAttribute:inRange:options:usingBlock:", v105, v104, v106, 0, v127);
    }
    if (*((_BYTE *)v142 + 24))
      objc_msgSend(v126, "setCountOfNotesWithNoteLink:", objc_msgSend(v126, "countOfNotesWithNoteLink") + 1);
    if (*((_BYTE *)v129 + 24))
      objc_msgSend(v126, "setCountOfNotesWithFolderLink:", objc_msgSend(v126, "countOfNotesWithFolderLink") + 1);
    if (-[_ICNAAttachmentReportToNote hasMathUsage](v26, "hasMathUsage"))
      objc_msgSend(v126, "setCountOfNotesWithMathUsage:", objc_msgSend(v126, "countOfNotesWithMathUsage") + 1);
    if (v81)
      objc_msgSend(v126, "setScrapPaperCount:", objc_msgSend(v126, "scrapPaperCount") + 1);
    objc_msgSend(v126, "completeTwoFactorMatrixReportingForCurrentNote");
    objc_msgSend((id)objc_opt_class(), "faultOutObject:", v124);
    _Block_object_dispose(&v128, 8);
    _Block_object_dispose(&v141, 8);

    _Block_object_dispose(&v145, 8);
    _Block_object_dispose(&v149, 8);

  }
}

void __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "style") == 103)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "updateNoteTwoFactorMatrixWithIndex:", 7);
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v4 + 24))
    {
      *(_BYTE *)(v4 + 24) = 1;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v5 + 24))
      *(_BYTE *)(v5 + 24) = 0;
  }

}

void __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "linkContentTypeEnumForURL:", v7);
    if (v9 == 2)
    {
      v10 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      if (v9 != 1)
      {
LABEL_12:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
          && a5
          && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          *a5 = 1;
        }
        goto LABEL_16;
      }
      v10 = *(_QWORD *)(a1 + 40);
    }
    *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;
    goto LABEL_12;
  }
LABEL_16:

}

- (void)snapshotHTMLNote:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5
{
  id v7;
  id v8;
  ICASCollaborationType *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASCollaborationStatus *v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setCountOfNotes:", objc_msgSend(v7, "countOfNotes") + 1);
  v13 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
  v9 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
  objc_msgSend(v7, "updateNoteCollaborationMatrixWithCollaborationStatus:collaborationType:", v13, v9);

  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "noteCharCountHistogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentAsPlainText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportValue:", (double)(unint64_t)objc_msgSend(v12, "length"));

  objc_msgSend((id)objc_opt_class(), "faultOutObject:", v8);
}

- (void)snapshotAttachment:(id)a3 reportedDataToNote:(id)a4 reportedDataToAccount:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  id v56;

  v56 = a3;
  v8 = a4;
  v9 = a5;
  +[ICNAEventReporter analyticsTypeUTIAttachment:](ICNAEventReporter, "analyticsTypeUTIAttachment:", v56);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v56, "isUnsupported") & 1) != 0)
    goto LABEL_27;
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63678]))
  {
    v11 = -[ICNASnapshotReporter pageCountForDocScanAttachment:](self, "pageCountForDocScanAttachment:", v56);
    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "docScanPageCountHistogram");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportValue:", (double)v11);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D636B8]))
  {
    -[ICNASnapshotReporter tableSnapshotItemDataForTableAttachment:](self, "tableSnapshotItemDataForTableAttachment:", v56);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tableRowCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v12, "tableColumnCount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tableRowCountHistogram");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reportValue:", (double)v15);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tableColumnCountHistogram");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reportValue:", (double)v17);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tableCellCountHistogram");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reportValue:", (double)(v17 * v15));

    goto LABEL_6;
  }
LABEL_7:
  v23 = *MEMORY[0x1E0D63688];
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63688]) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63680]) & 1) == 0
    && !objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63670]))
  {
    goto LABEL_17;
  }
  -[ICNASnapshotReporter drawingSnapshotItemDataForDrawingAttachment:](self, "drawingSnapshotItemDataForDrawingAttachment:", v56);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportDrawingWithSnapshotData:", v24);
  if (objc_msgSend(v10, "isEqualToString:", v23))
  {
    objc_msgSend(v24, "countOfInlineDrawingV1FingerStrokes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    objc_msgSend(v24, "countOfInlineDrawingV1PencilStrokes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedIntegerValue");

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "inlineDrawingV1TotalStrokeCountHistogram");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (double)(v28 + v26);
    objc_msgSend(v30, "reportValue:", v31);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "inlineDrawingV1PencilStrokeCountHistogram");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reportValue:", (double)v28);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "inlineDrawingV1FingerStrokeCountHistogram");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (double)v26;
    objc_msgSend(v35, "reportValue:", (double)v26);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "inlineDrawingV1FingerStrokeRatioHistogram");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v49 = v38;
    v50 = v36 / v31;
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63680]))
  {
    objc_msgSend(v24, "countOfInlineDrawingV2FingerStrokes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedIntegerValue");

    objc_msgSend(v24, "countOfInlineDrawingV2PencilStrokes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "unsignedIntegerValue");

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "inlineDrawingV2TotalStrokeCountHistogram");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (double)(v42 + v40);
    objc_msgSend(v44, "reportValue:", v31);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "inlineDrawingV2PencilStrokeCountHistogram");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "reportValue:", (double)v42);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "inlineDrawingV2FingerStrokeCountHistogram");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (double)v40;
    objc_msgSend(v48, "reportValue:", (double)v40);

    -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "inlineDrawingV2FingerStrokeRatioHistogram");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D63670]))
    goto LABEL_16;
  objc_msgSend(v24, "countOfFullscreenDrawingStrokes");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "unsignedIntegerValue");

  -[ICNASnapshotReporter accountHistogramManager](self, "accountHistogramManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "fullscreenDrawingStrokeCountHistogram");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v38;
  v50 = (double)v55;
LABEL_15:
  objc_msgSend(v38, "reportValue:", v50);

LABEL_16:
LABEL_17:
  objc_msgSend(v56, "synapseData");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v8, "setHasDeepLink:", 1);
    if (objc_msgSend((id)objc_opt_class(), "attachmentHasDeepLinkSafariHighlight:", v56))
      objc_msgSend(v8, "setHasSafariHighlight:", 1);
  }
  if (objc_msgSend(v56, "attachmentType") == 3)
    objc_msgSend(v8, "setHasImages:", 1);
  if (objc_msgSend(v56, "attachmentType") == 13)
  {
    objc_opt_class();
    objc_msgSend(v56, "attachmentModel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v53, "paperHasMath"))
      objc_msgSend(v8, "setHasMathUsage:", 1);

  }
  objc_msgSend(v8, "reportAttachmentTypeUTI:", v10);
  objc_msgSend(v9, "reportAttachmentTypeUTI:", v10);
LABEL_27:
  objc_msgSend((id)objc_opt_class(), "faultOutObject:", v56);

}

- (id)deviceSnapshotSummaryForDataType:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  ICASDeviceSnapshotItemData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICASDeviceSnapshotItemData *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController deviceID](ICNAController, "deviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saltedID:forClass:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [ICASDeviceSnapshotItemData alloc];
  +[ICNAController deviceModel](ICNAController, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController devicePlatform](ICNAController, "devicePlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[ICNAController bioAuthEnabled](ICNAController, "bioAuthEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[ICNAController localNotesEnabled](ICNAController, "localNotesEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController osVersion](ICNAController, "osVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[ICNAController mathTextEnabled](ICNAController, "mathTextEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[ICNAController mathHandwritingEnabled](ICNAController, "mathHandwritingEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICASDeviceSnapshotItemData initWithDeviceModel:devicePlatform:bioAuthEnabled:localNotesEnabled:osVersion:deviceID:audioTranscriptEnabled:audioSummaryEnabled:mathTextEnabled:mathHandwritingEnabled:](v7, "initWithDeviceModel:devicePlatform:bioAuthEnabled:localNotesEnabled:osVersion:deviceID:audioTranscriptEnabled:audioSummaryEnabled:mathTextEnabled:mathHandwritingEnabled:", v8, v9, v10, v11, v12, v6, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], v13, v14);

  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)userSnapshotSummaryForDataType:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  ICASUserSnapshotItemData *v7;
  void *v8;
  ICASUserSnapshotItemData *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController userID](ICNAController, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saltedID:forClass:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [ICASUserSnapshotItemData alloc];
  +[ICNAController storeFrontID](ICNAController, "storeFrontID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASUserSnapshotItemData initWithUserID:userStorefrontID:](v7, "initWithUserID:userStorefrontID:", v6, v8);

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)pageCountForDocScanAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "subAttachmentCount");
  return v6;
}

- (id)drawingSnapshotItemDataForDrawingAttachment:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  ICASDrawingSnapshotItemData *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  ICASDrawingSnapshotItemData *v27;

  v4 = a3;
  +[ICNAEventReporter analyticsTypeUTIAttachment:](ICNAEventReporter, "analyticsTypeUTIAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D63688];
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63688]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63680]))
  {
    objc_msgSend(v4, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend(v8, "handwritingRecognitionDrawing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = (id)objc_msgSend(v8, "newDrawingFromMergeableData");
      v12 = v11;

      v18 = -[ICNAEventReporter pencilStrokeCountForDrawing:](self, "pencilStrokeCountForDrawing:", v12);
      objc_msgSend(v12, "strokes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v19, "count") - v18;

      v20 = objc_msgSend(v5, "isEqualToString:", v6);
      v13 = 0;
      if (v20)
        v14 = 0;
      else
        v14 = v16;
      if (v20)
        v15 = 0;
      else
        v15 = v18;
      if (v20)
      {
        v17 = v18;
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }
      v7 = v8;
      goto LABEL_21;
    }
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63670]))
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v4, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "drawing");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commands");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
LABEL_21:

      goto LABEL_22;
    }
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
LABEL_22:

LABEL_23:
  v21 = [ICASDrawingSnapshotItemData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[ICASDrawingSnapshotItemData initWithCountOfInlineDrawingV1PencilStrokes:countOfInlineDrawingV1FingerStrokes:countOfInlineDrawingV2PencilStrokes:countOfInlineDrawingV2FingerStrokes:countOfFullscreenDrawingStrokes:](v21, "initWithCountOfInlineDrawingV1PencilStrokes:countOfInlineDrawingV1FingerStrokes:countOfInlineDrawingV2PencilStrokes:countOfInlineDrawingV2FingerStrokes:countOfFullscreenDrawingStrokes:", v22, v23, v24, v25, v26);

  return v27;
}

- (id)tableSnapshotItemDataForTableAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  ICASTableSnapshotItemData *v10;
  void *v11;
  void *v12;
  ICASTableSnapshotItemData *v13;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "table");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rowCount");
    v9 = objc_msgSend(v7, "columnCount");
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = [ICASTableSnapshotItemData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICASTableSnapshotItemData initWithTableRowCount:tableColumnCount:](v10, "initWithTableRowCount:tableColumnCount:", v11, v12);

  return v13;
}

- (id)snapshotItemDataForModernAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICASAccountSnapshotItemData *v10;

  v4 = a3;
  -[ICNAEventReporter accountTypeForModernAccount:](self, "accountTypeForModernAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountPurposeForModernAccount:](self, "accountPurposeForModernAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "saltedID:forClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICASAccountSnapshotItemData initWithAccountID:accountType:accountPurpose:]([ICASAccountSnapshotItemData alloc], "initWithAccountID:accountType:accountPurpose:", v9, v5, v6);
  return v10;
}

- (id)snapshotItemDataForHTMLAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICASAccountSnapshotItemData *v10;

  v4 = a3;
  -[ICNAEventReporter accountTypeForHTMLAccount:](self, "accountTypeForHTMLAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter accountPurposeForHTMLAccount](self, "accountPurposeForHTMLAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "saltedID:forClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICASAccountSnapshotItemData initWithAccountID:accountType:accountPurpose:]([ICASAccountSnapshotItemData alloc], "initWithAccountID:accountType:accountPurpose:", v9, v5, v6);
  return v10;
}

- (id)accountPurposeForModernAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ICASAccountPurpose *v6;
  ICASAccountPurpose *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "userType") == 1)
  {
    v11[3] = 3;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__ICNASnapshotReporter_accountPurposeForModernAccount___block_invoke;
    v9[3] = &unk_1E771C138;
    v9[4] = &v10;
    objc_msgSend(v3, "performBlockInPersonaContext:", v9);
  }
  v6 = [ICASAccountPurpose alloc];
  v7 = -[ICASAccountPurpose initWithAccountPurpose:](v6, "initWithAccountPurpose:", v11[3]);

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __55__ICNASnapshotReporter_accountPurposeForModernAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnterprisePersona");

  v5 = 1;
  if (v4)
    v5 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
}

- (id)accountPurposeForHTMLAccount
{
  return -[ICASAccountPurpose initWithAccountPurpose:]([ICASAccountPurpose alloc], "initWithAccountPurpose:", 1);
}

- (id)backgroundAppRefreshData
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  ICASBackgroundAppRefreshData *v14;
  void *v15;
  ICASBackgroundAppRefreshData *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v4 = (void *)getMCProfileConnectionClass_softClass;
  v22 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getMCProfileConnectionClass_block_invoke;
    v18[3] = &unk_1E771C138;
    v18[4] = &v19;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v18);
    v4 = (void *)v20[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v5, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAutomaticAppUpdatesAllowed");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mt"));
  objc_msgSend(v8, "objectForKey:", CFSTR("KeepAppsUpToDateAppList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICNotesAppBundleIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend(v11, "BOOLValue");
  else
    v12 = 1;
  if ((v3 & 1) != 0)
    v13 = 0;
  else
    v13 = v7 & v12;
  v14 = [ICASBackgroundAppRefreshData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICASBackgroundAppRefreshData initWithAutomaticAppUpdatesAllowed:](v14, "initWithAutomaticAppUpdatesAllowed:", v15);

  return v16;
}

- (void)performBlockForHTMLManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ICNASnapshotReporter htmlContext](self, "htmlContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ICNASnapshotReporter_performBlockForHTMLManagedObjectContext___block_invoke;
  v8[3] = &unk_1E771C160;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __64__ICNASnapshotReporter_performBlockForHTMLManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3B7B820]();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "htmlContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  objc_autoreleasePoolPop(v2);
}

- (void)performBlockForModernManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNASnapshotReporter modernContext](self, "modernContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ICNASnapshotReporter_performBlockForModernManagedObjectContext___block_invoke;
  v7[3] = &unk_1E771C160;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __66__ICNASnapshotReporter_performBlockForModernManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3B7B820]();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "modernContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  objc_autoreleasePoolPop(v2);
}

- (double)timeStampOfDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return floor(v3 / 60.0) * 60.0;
}

- (id)lastSnapshotScheduleTimeStamp
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("analytics_last_snapshot_timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("analytics_last_snapshot_timestamp"));

  }
  return v3;
}

- (id)lastSnapshotRunningTimeStamp
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("analytics_last_snapshot_running_timestamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("analytics_last_snapshot_running_timestamp"));

  }
  return v3;
}

- (BOOL)shouldRunSnapshotManually
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("forbid_analytics_snapshot"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter lastSnapshotRunningTimeStamp](self, "lastSnapshotRunningTimeStamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7 > 1814400.0;

  return v8 & ~v4;
}

- (BOOL)shouldScheduleSnapshot
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("forbid_analytics_snapshot"));

  return v3 ^ 1;
}

- (BOOL)shouldSnapshot
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("forbid_analytics_snapshot"));

  if ((v4 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("allow_analytics_snapshot_every_launch"));

  if ((v7 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter lastSnapshotRunningTimeStamp](self, "lastSnapshotRunningTimeStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v5 = v10 > 604800.0;

  return v5;
}

- (id)sortedFoldersForAccount:(id)a3
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
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v5 = (void *)MEMORY[0x1E0C97B20];
  ICLegacyEntityNameFolder();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityForName:inManagedObjectContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntity:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(account == %@)"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("externalIdentifier"), 1);
  v24[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v11);

  objc_msgSend(v3, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v4, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;

  if (v14)
  {
    v15 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICNASnapshotReporter sortedFoldersForAccount:].cold.1((uint64_t)v3, v15, v16, v17, v18, v19, v20, v21);

  }
  return v13;
}

- (void)beginMiniSnapshotBackgroundTask
{
  void *v3;
  void *v4;
  id v5;
  id location;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v5, &location);
    performBlockOnMainThreadAndWait();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "miniSnapshotBackgroundTaskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    +[ICNAController sharedController](ICNAController, "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2;
    v8[3] = &unk_1E771BE80;
    v8[4] = v2;
    v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Analytics mini snapshot"), v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMiniSnapshotBackgroundTaskIdentifier:", v7);

    objc_sync_exit(v3);
  }

}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "killMiniSnapshotBackgroundTaskIfNecessary"))
  {
    v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2_cold_1();

  }
}

- (BOOL)killMiniSnapshotBackgroundTaskIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[ICNASnapshotReporter miniSnapshotBackgroundTaskIdentifier](self, "miniSnapshotBackgroundTaskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[ICNASnapshotReporter miniSnapshotBackgroundTaskIdentifier](self, "miniSnapshotBackgroundTaskIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = *MEMORY[0x1E0CEB390];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CEB390]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASnapshotReporter setMiniSnapshotBackgroundTaskIdentifier:](self, "setMiniSnapshotBackgroundTaskIdentifier:", v9);

  objc_sync_exit(v5);
  if (v7 == v8)
    return 0;
  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endBackgroundTask:", v7);

  return 1;
}

- (ICNAHistogramManager)accountHistogramManager
{
  return self->_accountHistogramManager;
}

- (void)setAccountHistogramManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountHistogramManager, a3);
}

- (BOOL)isPerformingSnapshot
{
  return self->_isPerformingSnapshot;
}

- (void)setIsPerformingSnapshot:(BOOL)a3
{
  self->_isPerformingSnapshot = a3;
}

- (ICLegacyContext)htmlContext
{
  return self->_htmlContext;
}

- (void)setHtmlContext:(id)a3
{
  objc_storeStrong((id *)&self->_htmlContext, a3);
}

- (NSManagedObjectContext)modernContext
{
  return self->_modernContext;
}

- (void)setModernContext:(id)a3
{
  objc_storeStrong((id *)&self->_modernContext, a3);
}

- (NSNumber)miniSnapshotBackgroundTaskIdentifier
{
  return self->_miniSnapshotBackgroundTaskIdentifier;
}

- (void)setMiniSnapshotBackgroundTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_miniSnapshotBackgroundTaskIdentifier, a3);
}

- (int64_t)contextHolderCount
{
  return self->_contextHolderCount;
}

- (void)setContextHolderCount:(int64_t)a3
{
  self->_contextHolderCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniSnapshotBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);
  objc_storeStrong((id *)&self->_htmlContext, 0);
  objc_storeStrong((id *)&self->_accountHistogramManager, 0);
}

void __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, a2, a3, "Error scheduling snapshot: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)reallyPerformSnapshotWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Running snapshot instrumentation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sortedFoldersForAccount:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, a2, a3, "Error getting sorted folders for account %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1BDCEC000, v0, OS_LOG_TYPE_ERROR, "Background task expired before mini snapshot completed.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
