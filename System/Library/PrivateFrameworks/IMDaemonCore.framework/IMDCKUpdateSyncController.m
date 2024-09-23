@implementation IMDCKUpdateSyncController

+ (id)sharedInstance
{
  if (qword_1ED935D38 != -1)
    dispatch_once(&qword_1ED935D38, &unk_1E922F020);
  return (id)qword_1ED935E78;
}

- (IMDCKUpdateSyncController)initWithSyncTokenStore:(id)a3
{
  id v5;
  IMDCKUpdateSyncController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ckQueue;
  uint64_t v9;
  IMDRecordZoneManager *recordZoneManager;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDCKUpdateSyncController;
  v6 = -[IMDCKUpdateSyncController init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.private.IMDCKUpdateSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
  }

  return v6;
}

- (IMDCKUpdateSyncController)init
{
  IMDCKSyncTokenStore *v3;
  IMDCKUpdateSyncController *v4;

  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = -[IMDCKUpdateSyncController initWithSyncTokenStore:](self, "initWithSyncTokenStore:", v3);

  return v4;
}

- (void)deleteUpdateZone
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKUpdateSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15CE4E4;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing local updates sync state, flags 0x%x", (uint8_t *)v6, 8u);
    }

  }
  if ((v3 & 1) != 0)
    -[IMDCKUpdateSyncController deleteUpdateSyncToken](self, "deleteUpdateSyncToken");
}

- (void)deleteUpdateSyncToken
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKUpdateSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15CE670;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

+ (id)messageUpdateV1RecordType
{
  return CFSTR("messageUpdateV1");
}

- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "getBoolFromDomain:forKey:", CFSTR("com.apple.madrid"), CFSTR("mic-delete-update-zone"));

  if (v11)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Deleting zone based on default, and skipping Update syncs", v15, 2u);
      }

    }
    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteUpdateZone");

    if (v9)
      v9[2](v9, 1, 0);
  }
  else
  {
    -[IMDCKUpdateSyncController _readRecordsWithType:attemptCount:activity:completion:](self, "_readRecordsWithType:attemptCount:activity:completion:", a3, 0, v8, v9);
  }

}

- (void)_readRecordsWithType:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  IMDCKUpdateSyncController *v19;
  id v20;
  id v21;
  int64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  -[IMDCKUpdateSyncController _fetchRecordsOperationWithActivity:](self, "_fetchRecordsOperationWithActivity:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1D15CEAB8;
    v26[3] = &unk_1E922A4F8;
    v26[4] = self;
    objc_msgSend(v11, "setRecordChangedBlock:", v26);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_1D15CEAC4;
    v25[3] = &unk_1E922A560;
    v25[4] = self;
    objc_msgSend(v12, "setRecordWithIDWasDeletedBlock:", v25);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = sub_1D15CEAD4;
    v24[3] = &unk_1E922D5B8;
    v24[4] = self;
    objc_msgSend(v12, "setRecordZoneChangeTokensUpdatedBlock:", v24);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = sub_1D15CEAE8;
    v23[3] = &unk_1E922D5E0;
    v23[4] = self;
    objc_msgSend(v12, "setRecordZoneFetchCompletionBlock:", v23);
    v15 = v13;
    v16 = 3221225472;
    v17 = sub_1D15CEB04;
    v18 = &unk_1E922D608;
    v19 = self;
    v22 = a3;
    v20 = v9;
    v21 = v10;
    if (IMOSLoggingEnabled(objc_msgSend(v12, "setFetchRecordZoneChangesCompletionBlock:", &v15)))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Scheduling a fetch update zone changes operation %@", buf, 0xCu);
      }

    }
    -[IMDCKUpdateSyncController _scheduleOperation:](self, "_scheduleOperation:", v12, v15, v16, v17, v18, v19);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)_onRecordRead:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "_stringForKey:", CFSTR("ut"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Fetched update record with type %@", buf, 0xCu);

    }
  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleMessageUpdate:", v3);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15CEC8C;
    block[3] = &unk_1E92287A0;
    v8 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    v6 = v8;
  }

}

- (void)_onRecordDeleted:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Delete record operation unsupported.", v8, 2u);
    }

  }
}

- (void)_onChangeTokenUpdated:(id)a3 token:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }

  }
  -[IMDCKUpdateSyncController ckQueue](self, "ckQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D15CEF00;
  v14[3] = &unk_1E9228750;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  dispatch_sync(v12, v14);

}

- (void)_onRecordZoneFetchComplete:(id)a3 token:(id)a4 tokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 138413314;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 1024;
      v24 = v8;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Record Zone fetch complete zoneID %@ changeToken %@ tokenData %@ moreComing %d error %@", (uint8_t *)&v17, 0x30u);
    }

  }
  -[IMDCKUpdateSyncController _onChangeTokenUpdated:token:data:](self, "_onChangeTokenUpdated:token:data:", v12, v13, v14);

}

- (void)_onReadComplete:(int64_t)a3 error:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, uint64_t);
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  const __CFString *v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, uint64_t))a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1D15CF4B0;
  v35 = sub_1D15CF4C0;
  v36 = 0;
  v13 = v10;
  v36 = v13;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "errorIndicatesZoneNotCreated:", v32[5]);

  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "errorIndicatesUserDeletedZone:", v32[5]);

  if ((v15 | v17) == 1)
  {
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = CFSTR("zone not created");
        if (v17)
          v20 = CFSTR("user deleted zone");
        *(_DWORD *)buf = 138412546;
        v38 = v20;
        v39 = 2112;
        v40 = v13;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "We got a %@ error while fetching updates. %@", buf, 0x16u);
      }

    }
    -[IMDCKUpdateSyncController ckQueue](self, "ckQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D15CF4C8;
    v30[3] = &unk_1E922D658;
    v30[4] = self;
    v30[5] = &v31;
    dispatch_sync(v21, v30);

  }
  if (v32[5])
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "CKPartialError:hasErrorCode:", v32[5], &unk_1E9271788);

    if (v23)
    {
      if (IMOSLoggingEnabled(v24))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (const __CFString *)v32[5];
          *(_DWORD *)buf = 138412290;
          v38 = v26;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the updates again %@", buf, 0xCu);
        }

      }
      -[IMDCKUpdateSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 17);
    }
    else if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (const __CFString *)v32[5];
        *(_DWORD *)buf = 138412290;
        v38 = v29;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from update zone %@", buf, 0xCu);
      }

    }
    if (v12)
      v12[2](v12, 0, v32[5]);
  }
  else
  {
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "We completed fetching changes from update zone with no error", buf, 2u);
      }

    }
    -[IMDCKUpdateSyncController _writeRecordsWithType:activity:completion:](self, "_writeRecordsWithType:activity:completion:", a3, v11, v12);
  }
  _Block_object_dispose(&v31, 8);

}

- (unint64_t)_numberOfRecordsToFetchPerBatch
{
  return 50;
}

- (id)_syncTokenKey
{
  return CFSTR("updateChangeToken");
}

- (id)_syncTokenStore
{
  return self->_syncTokenStore;
}

- (BOOL)_zoneCreated
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  char v9;
  uint8_t v11[16];
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  -[IMDCKUpdateSyncController recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D15CF7C0;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createUpdateZoneIfNeededWithCompletionBlock:", v12);

  v6 = dispatch_time(0, 300000000000);
  v7 = dispatch_semaphore_wait(v5, v6);
  if (v7)
  {
    *((_BYTE *)v16 + 24) = 0;
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating update zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  -[IMDCKUpdateSyncController _writeUpdatesWithType:updateStep:activity:completion:](self, "_writeUpdatesWithType:updateStep:activity:completion:", a3, 1, a4, a5);
}

+ (int64_t)stepAfter:(int64_t)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (void)_writeUpdatesWithType:(int64_t)a3 updateStep:(int64_t)a4 activity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a5;
  v11 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D15CFA14;
  aBlock[3] = &unk_1E922EB60;
  v18 = a4;
  v19 = a3;
  aBlock[4] = self;
  v12 = v10;
  v16 = v12;
  v13 = v11;
  v17 = v13;
  v14 = _Block_copy(aBlock);
  if (a4 == 3)
    goto LABEL_5;
  if (a4 == 2)
  {
    -[IMDCKUpdateSyncController _writeT2RecordUpdatesWithType:activity:completion:](self, "_writeT2RecordUpdatesWithType:activity:completion:", a3, v12, v14);
    goto LABEL_8;
  }
  if (a4 != 1)
  {
LABEL_5:
    if (v13)
      (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);
  }
  else
  {
    -[IMDCKUpdateSyncController _writeT1RecordUpdatesWithType:activity:completion:](self, "_writeT1RecordUpdatesWithType:activity:completion:", a3, v12, v14);
  }
LABEL_8:

}

- (void)_writeT1RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  int64_t v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1D15CF4B0;
  v24 = sub_1D15CF4C0;
  v25 = 0;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDCKUpdateSyncController _saveRecordsT1OperationWithMap:activity:](self, "_saveRecordsT1OperationWithMap:activity:", v21[5], v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1D15CFCF0;
    v19[3] = &unk_1E922D680;
    v19[4] = self;
    v19[5] = &v20;
    objc_msgSend(v10, "setPerRecordCompletionBlock:", v19);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = sub_1D15CFDB4;
    v14[3] = &unk_1E922D6A8;
    v17 = &v20;
    v18 = a3;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    if (IMOSLoggingEnabled(objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v14)))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Scheduling write updates T1 operation %@", buf, 0xCu);
      }

    }
    -[IMDCKUpdateSyncController _scheduleOperation:](self, "_scheduleOperation:", v11);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)_onRecordT1Write:(id)a3 error:(id)a4 recordNameToRowIDMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = IMOSLoggingEnabled(v10);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = (uint64_t)v8;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Wrote T1 update record %@ with error %@", (uint8_t *)&v26, 0x16u);
    }

  }
  if (!v9)
  {
    objc_msgSend(v8, "recordID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v18, "longLongValue");
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = 134218242;
        v27 = v24;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Marking row %lld for %@ as clean", (uint8_t *)&v26, 0x16u);
      }

    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markMessageAsCleanWithROWID:", v24);
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = (uint64_t)v9;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@ ", (uint8_t *)&v26, 0x16u);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extractServerRecordFromCKServerErrorRecordChanged:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "longLongValue");
  if (v15)
  {
    v20 = v19;
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = (uint64_t)v15;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Extracted record from server error%@ ", (uint8_t *)&v26, 0xCu);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleMessageUpdateConflictType:serverRecord:localRowID:", CFSTR("UT1"), v15, v20);
LABEL_21:

  }
}

- (void)_onWriteT1Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v9 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, id))a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (!v12)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Update T1 writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
    }

  }
  if (v12)
  {
    if (v14)
      v14[2](v14, 0, v12);
  }
  else if (v9)
  {
    -[IMDCKUpdateSyncController _writeRecordsWithType:activity:completion:](self, "_writeRecordsWithType:activity:completion:", a3, v13, v14);
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }

}

- (void)_writeT2RecordUpdatesWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  int64_t v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1D15CF4B0;
  v24 = sub_1D15CF4C0;
  v25 = 0;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDCKUpdateSyncController _saveRecordsT2OperationWithMap:activity:](self, "_saveRecordsT2OperationWithMap:activity:", v21[5], v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1D15D062C;
    v19[3] = &unk_1E922D680;
    v19[4] = self;
    v19[5] = &v20;
    objc_msgSend(v10, "setPerRecordCompletionBlock:", v19);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = sub_1D15D06F0;
    v14[3] = &unk_1E922D6A8;
    v17 = &v20;
    v18 = a3;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    if (IMOSLoggingEnabled(objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v14)))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Scheduling write updates T2 operation %@", buf, 0xCu);
      }

    }
    -[IMDCKUpdateSyncController _scheduleOperation:](self, "_scheduleOperation:", v11);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)_onRecordT2Write:(id)a3 error:(id)a4 recordNameToItemMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = IMOSLoggingEnabled(v10);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v27 = 138412546;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Wrote T2 update record %@ with error %@", (uint8_t *)&v27, 0x16u);
    }

  }
  if (!v9)
  {
    objc_msgSend(v8, "recordID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("MID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("SR"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Successful write of T2 update to the server, updating syncedSyndicationRanges for message guid %@ ", (uint8_t *)&v27, 0xCu);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateSyncedSyndicationRanges:forGUID:", v23, v19);

    goto LABEL_21;
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v27 = 138412546;
      v28 = v9;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@ ", (uint8_t *)&v27, 0x16u);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extractServerRecordFromCKServerErrorRecordChanged:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKey:", CFSTR("ROWID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "longLongValue");
  if (v15)
  {
    v21 = v20;
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = v15;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Extracted record from server error%@ ", (uint8_t *)&v27, 0xCu);
      }

    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleMessageUpdateConflictType:serverRecord:localRowID:", CFSTR("UT2"), v15, v21);
LABEL_21:

  }
}

- (void)_onWriteT2Complete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v9 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, id))a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (!v12)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Update T2 writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
    }

  }
  if (v12)
  {
    if (v14)
      v14[2](v14, 0, v12);
  }
  else if (v9)
  {
    -[IMDCKUpdateSyncController _writeRecordsWithType:activity:completion:](self, "_writeRecordsWithType:activity:completion:", a3, v13, v14);
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }

}

- (id)_fetchRecordsOperationWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMDCKUpdateSyncController recordZoneManager](self, "recordZoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController latestSyncToken](self, "latestSyncToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKUpdateSyncController fetchOperationFactory:token:batchSize:activity:](IMDCKUpdateSyncController, "fetchOperationFactory:token:batchSize:activity:", v6, v7, -[IMDCKUpdateSyncController _numberOfRecordsToFetchPerBatch](self, "_numberOfRecordsToFetchPerBatch"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_saveRecordsT1OperationWithMap:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[IMDCKUpdateSyncController recordZoneManager](self, "recordZoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRecordZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController latestSyncToken](self, "latestSyncToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKUpdateSyncController saveT1UpdatesOperationFactory:token:batchSize:recordNameToRowIDMap:activity:](self, "saveT1UpdatesOperationFactory:token:batchSize:recordNameToRowIDMap:activity:", v9, v10, -[IMDCKUpdateSyncController _numberOfRecordsToFetchPerBatch](self, "_numberOfRecordsToFetchPerBatch"), v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_saveRecordsT2OperationWithMap:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[IMDCKUpdateSyncController recordZoneManager](self, "recordZoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRecordZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController latestSyncToken](self, "latestSyncToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKUpdateSyncController saveT2UpdatesOperationFactory:token:batchSize:recordNameToRowIDMap:activity:](self, "saveT2UpdatesOperationFactory:token:batchSize:recordNameToRowIDMap:activity:", v9, v10, -[IMDCKUpdateSyncController _numberOfRecordsToFetchPerBatch](self, "_numberOfRecordsToFetchPerBatch"), v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_zoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v11 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend(v11, "setDesiredKeys:", 0);
  objc_msgSend(v11, "setPreviousServerChangeToken:", v9);

  objc_msgSend(v11, "setResultsLimit:", a5);
  objc_msgSend(v10, "setObject:forKey:", v11, v8);

  return v10;
}

+ (id)_fetchUpdatesCKConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F80];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

+ (id)fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v21[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    v14 = objc_alloc(MEMORY[0x1E0C94DE8]);
    IMSingleObjectArray();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_zoneChangesOptionsDictionaryUsingToken:zoneID:resultsLimit:", v11, v10, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v15, v16);

    objc_msgSend(a1, "_fetchUpdatesCKConfiguration:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConfiguration:", v18);

    objc_msgSend(v17, "setFetchAllChanges:", 1);
  }
  else
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "fetchOperationFactory was passed in a nil zone", v21, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

- (id)_writeUpdatesCKConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C94F80];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setQualityOfService:", 17);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)saveT1UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7
{
  int v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[5];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v12)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D15D14F4;
    aBlock[3] = &unk_1E9229280;
    aBlock[4] = self;
    v30 = v14;
    v18 = v17;
    v31 = v18;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v19[2](v19);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v19);
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "newfilteredArrayRemovingCKRecordDupes:", v18);

    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134218240;
        v33 = v26;
        v34 = 1024;
        v35 = v9;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found %lu of %u max T1 updates to write up", buf, 0x12u);
      }

    }
    if (objc_msgSend(v23, "count"))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v23, 0);
      objc_msgSend(v21, "setSavePolicy:", 1);
      -[IMDCKUpdateSyncController _writeUpdatesCKConfiguration:](self, "_writeUpdatesCKConfiguration:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setConfiguration:", v27);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "saveT1OperationFactory was passed in a nil zone", buf, 2u);
      }

    }
    v21 = 0;
  }

  return v21;
}

- (id)saveT2UpdatesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToRowIDMap:(id)a6 activity:(id)a7
{
  int v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[5];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v12)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D15D1AAC;
    aBlock[3] = &unk_1E9229280;
    aBlock[4] = self;
    v30 = v14;
    v18 = v17;
    v31 = v18;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v19[2](v19);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v19);
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "newfilteredArrayRemovingCKRecordDupes:", v18);

    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134218240;
        v33 = v26;
        v34 = 1024;
        v35 = v9;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found %lu of %u max T2 updates to write up", buf, 0x12u);
      }

    }
    if (objc_msgSend(v23, "count"))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v23, 0);
      objc_msgSend(v21, "setSavePolicy:", 1);
      -[IMDCKUpdateSyncController _writeUpdatesCKConfiguration:](self, "_writeUpdatesCKConfiguration:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setConfiguration:", v27);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "saveT2OperationFactory was passed in a nil zone", buf, 2u);
      }

    }
    v21 = 0;
  }

  return v21;
}

- (void)_scheduleOperation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "truthDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ckQueue, a3);
}

- (IMDRecordZoneManager)recordZoneManager
{
  return self->_recordZoneManager;
}

- (void)setRecordZoneManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneManager, a3);
}

- (SyncTokenStoreProviding)syncTokenStore
{
  return self->_syncTokenStore;
}

- (void)setSyncTokenStore:(id)a3
{
  objc_storeStrong((id *)&self->_syncTokenStore, a3);
}

- (BOOL)fetchedChatsDuringLastSync
{
  return self->_fetchedChatsDuringLastSync;
}

- (void)setFetchedChatsDuringLastSync:(BOOL)a3
{
  self->_fetchedChatsDuringLastSync = a3;
}

- (NSMutableDictionary)writeMsgIDToRowIDMap
{
  return self->_writeMsgIDToRowIDMap;
}

- (void)setWriteMsgIDToRowIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_writeMsgIDToRowIDMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeMsgIDToRowIDMap, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end
