@implementation IMDCKRecoverableMessageSyncController

+ (id)sharedInstance
{
  if (qword_1ED935CF8 != -1)
    dispatch_once(&qword_1ED935CF8, &unk_1E922D590);
  return (id)qword_1ED935E30;
}

- (IMDCKRecoverableMessageSyncController)init
{
  IMDCKSyncTokenStore *v3;
  IMDCKRecoverableMessageSyncController *v4;

  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = -[IMDCKRecoverableMessageSyncController initWithSyncTokenStore:](self, "initWithSyncTokenStore:", v3);

  return v4;
}

- (IMDCKRecoverableMessageSyncController)initWithSyncTokenStore:(id)a3
{
  id v5;
  IMDCKRecoverableMessageSyncController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ckQueue;
  uint64_t v9;
  IMDRecordZoneManager *recordZoneManager;
  IMDCKMessageSyncCKOperationFactory *v11;
  IMDCKMessageSyncCKOperationFactory *CKOperationFactory;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDCKRecoverableMessageSyncController;
  v6 = -[IMDCKRecoverableMessageSyncController init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.private.IMDCKRecoverableMessageSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKMessageSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

  }
  return v6;
}

- (void)syncWithType:(int64_t)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  -[IMDCKRecoverableMessageSyncController _readRecordsWithType:attemptCount:activity:completion:](self, "_readRecordsWithType:attemptCount:activity:completion:", a3, 0, a4, a5);
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
  IMDCKRecoverableMessageSyncController *v19;
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
  -[IMDCKRecoverableMessageSyncController _fetchRecordsOperationWithActivity:](self, "_fetchRecordsOperationWithActivity:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1D1563404;
    v26[3] = &unk_1E922A4F8;
    v26[4] = self;
    objc_msgSend(v11, "setRecordChangedBlock:", v26);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_1D1563410;
    v25[3] = &unk_1E922A560;
    v25[4] = self;
    objc_msgSend(v12, "setRecordWithIDWasDeletedBlock:", v25);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = sub_1D1563420;
    v24[3] = &unk_1E922D5B8;
    v24[4] = self;
    objc_msgSend(v12, "setRecordZoneChangeTokensUpdatedBlock:", v24);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = sub_1D1563434;
    v23[3] = &unk_1E922D5E0;
    v23[4] = self;
    objc_msgSend(v12, "setRecordZoneFetchCompletionBlock:", v23);
    v15 = v13;
    v16 = 3221225472;
    v17 = sub_1D1563450;
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
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Scheduling a fetch recoverable message zone changes operation %@", buf, 0xCu);
      }

    }
    -[IMDCKRecoverableMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v12, v15, v16, v17, v18, v19);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)_onRecordRead:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Reading recoverable message record: %@", buf, 0xCu);

    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D15635C0;
  v9[3] = &unk_1E9228750;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], v9);

}

- (void)_onRecoverableMessagePartRecordReadWithDeleteDate:(id)a3 messageGUID:(id)a4 partBody:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  id v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Reading recoverable message part record", (uint8_t *)&buf, 2u);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageWithGUID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D366B8];
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D366B8], 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if (IMOSLoggingEnabled(v17))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Recently Deleted | Found stored part number %@", (uint8_t *)&buf, 0xCu);

    }
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = sub_1D1563C54;
  v47 = sub_1D1563C64;
  v48 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1D1563C54;
  v34 = sub_1D1563C64;
  v35 = 0;
  v20 = objc_msgSend(v13, "length");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1D1563C6C;
  v29[3] = &unk_1E922D630;
  v29[4] = &v36;
  v29[5] = &buf;
  v29[6] = &v30;
  v29[7] = v16;
  v21 = objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v20, 0, v29);
  if (*((_BYTE *)v37 + 24))
  {
    objc_msgSend(MEMORY[0x1E0D39918], "_messageItemWithIndexesDeleted:subRangesToDeleteMapping:deleteSubject:deleteTransferCallback:createItemCallback:fromMessageItem:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v31[5], 0, 0, 0, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "broadcasterForChatListeners");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accountID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "account:chat:style:chatProperties:messageUpdated:", v25, 0, 0, 0, v22);

    }
  }
  else if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138412546;
      v41 = v27;
      v42 = 2112;
      v43 = v8;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Did not find partIndex: %@ in message GUID: %@", v40, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D360F0], "database");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "storeRecoverableMessagePartWithBody:forMessageWithGUID:deleteDate:", v9, v8, v7);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v36, 8);
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
  -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D1563F6C;
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
  -[IMDCKRecoverableMessageSyncController _onChangeTokenUpdated:token:data:](self, "_onChangeTokenUpdated:token:data:", v12, v13, v14);

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
  v34 = sub_1D1563C54;
  v35 = sub_1D1563C64;
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
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "We got a %@ error while fetching recoverable messages. %@", buf, 0x16u);
      }

    }
    -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D156451C;
    v30[3] = &unk_1E922D658;
    v30[4] = self;
    v30[5] = &v31;
    dispatch_sync(v21, v30);

  }
  if (v32[5])
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "CKPartialError:hasErrorCode:", v32[5], &unk_1E9271650);

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
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the recoverable messages again %@", buf, 0xCu);
        }

      }
      -[IMDCKRecoverableMessageSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 17);
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
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from recoverable messages zone %@", buf, 0xCu);
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
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "We completed fetching changes from recoverable message zone with no error", buf, 2u);
      }

    }
    -[IMDCKRecoverableMessageSyncController _writeRecordsWithType:activity:completion:](self, "_writeRecordsWithType:activity:completion:", a3, v11, v12);
  }
  _Block_object_dispose(&v31, 8);

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Clearing local recoverable sync state, flags 0x%x", buf, 8u);
    }

  }
  if ((v3 & 1) != 0)
  {
    -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1564790;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (id)_syncTokenKey
{
  return CFSTR("recoverableMessageChangeToken");
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
  -[IMDCKRecoverableMessageSyncController recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D15649D0;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createRecoverableMessageZoneIfNeededWithCompletionBlock:", v12);

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
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating recoverable message zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_writeRecordsWithType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1D1563C54;
  v25 = sub_1D1563C64;
  v26 = 0;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDCKRecoverableMessageSyncController _saveRecordsOperationWithMap:activity:](self, "_saveRecordsOperationWithMap:activity:", v22[5], v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1D1564D50;
    v20[3] = &unk_1E922D680;
    v20[4] = self;
    v20[5] = &v21;
    objc_msgSend(v10, "setPerRecordCompletionBlock:", v20);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = sub_1D1564D6C;
    v15[3] = &unk_1E922D6A8;
    v18 = &v21;
    v19 = a3;
    v15[4] = self;
    v16 = v8;
    v13 = v9;
    v17 = v13;
    if (IMOSLoggingEnabled(objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v15)))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Scheduling write recoverable message operation %@", buf, 0xCu);
      }

    }
    -[IMDCKRecoverableMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v11);
    if (v13)
      (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_onRecordWrite:(id)a3 error:(id)a4 recordNameToPartIndexAndRowID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v25 = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Wrote recoverable message record %@ with error %@", (uint8_t *)&v25, 0x16u);
    }

  }
  if (v9)
  {
    if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setRecordsWriteFailed:](self, "setRecordsWriteFailed:", -[IMDCKAbstractSyncController recordsWriteFailed](self, "recordsWriteFailed") + 1)))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v25 = 138412546;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: could not write record: %@ encountered error: %@", (uint8_t *)&v25, 0x16u);
      }

    }
  }
  else
  {
    -[IMDCKAbstractSyncController setRecordsWritten:](self, "setRecordsWritten:", -[IMDCKAbstractSyncController recordsWritten](self, "recordsWritten") + 1);
    objc_msgSend(v8, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("messageRowID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("partIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | Marking row %@ with partIndex: %@ for %@ as clean", (uint8_t *)&v25, 0x20u);

      }
    }
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateRecoverableMessageSyncState:forMessageRowID:onPartIndex:", 1, v17, v19);

  }
}

- (void)_onWriteComplete:(int64_t)a3 error:(id)a4 shouldWriteMore:(BOOL)a5 activity:(id)a6 completion:(id)a7
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
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Recoverable messages writes completed sucess: %@ error %@", (uint8_t *)&v17, 0x16u);
    }

  }
  if (v12)
  {
    if (v14)
      v14[2](v14, 0, v12);
  }
  else if (v9)
  {
    -[IMDCKRecoverableMessageSyncController _writeRecordsWithType:activity:completion:](self, "_writeRecordsWithType:activity:completion:", a3, v13, v14);
  }
  else if (v14)
  {
    v14[2](v14, 1, 0);
  }

}

- (void)syncRemovedRecoverableMessagesToCloudKitWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if ((v6 & 1) != 0)
  {
    v8 = -[IMDCKRecoverableMessageSyncController _copyRecordIDsToDeleteWithLimit:](self, "_copyRecordIDsToDeleteWithLimit:", -[IMDCKRecoverableMessageSyncController _deleteBatchSize](self, "_deleteBatchSize"));
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newfilteredArrayRemovingCKRecordIDDupes:", v8);

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v21 = objc_msgSend(v8, "count");
        v22 = 2048;
        v23 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Recently Deleted | Got %lu recordIDs to sync, filtered to %lu unique recordID", buf, 0x16u);
      }

    }
    if (objc_msgSend(v10, "count"))
    {
      -[IMDCKAbstractSyncController setBroadcastedSyncStateToDeleting](self, "setBroadcastedSyncStateToDeleting");
      -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D15655AC;
      block[3] = &unk_1E92290F8;
      block[4] = self;
      v18 = v10;
      v19 = v4;
      dispatch_async(v13, block);

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Recently Deleted | No pending recoverable messages to delete from CloudKit", buf, 2u);
        }

      }
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clearRecoverableMessageTombStones");

      if (v4)
        (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Recently Deleted | Not performing CloudKit recoverable message deletes as CK syncing is off", buf, 2u);
      }

    }
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)_deleteRecoverableMessagesWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  IMDCKRecoverableMessageSyncController *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[IMDCKRecoverableMessageSyncController CKOperationFactory](self, "CKOperationFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRecoverableMessageCKOperationUsingRecordIDstoDelete:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = sub_1D1565A6C;
    v15 = &unk_1E92291C0;
    v16 = self;
    v17 = v7;
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v12);
    if (IMOSLoggingEnabled(objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1E922D6C8, v12, v13, v14, v15, v16)))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Kicking off recoverable delete of recordIDs %@", buf, 0xCu);
      }

    }
    -[IMDCKRecoverableMessageSyncController _scheduleOperation:](self, "_scheduleOperation:", v9);

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | No GUIDs passed in to delete", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFArray *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)MEMORY[0x1D17EA968]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = -[IMDCKRecoverableMessageSyncController _constructRecoverableMessageRecordIDUsingTombStoneDictionary:](self, "_constructRecoverableMessageRecordIDUsingTombStoneDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v15 = v14;
        if (v7 && v14)
          CFArrayAppendValue(v7, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(v8);
  return v7;
}

- (id)_constructRecoverableMessageRecordIDUsingTombStoneDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageGUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chatGUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("partIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (int)objc_msgSend(v7, "intValue");
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedSalt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKRecoverableMessageSyncController recoverableGUIDFromMessageGUID:chatGUID:partIndex:](self, "recoverableGUIDFromMessageGUID:chatGUID:partIndex:", v5, v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKRecoverableMessageSyncController recordZoneManager](self, "recordZoneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recoverableMessageRecordZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKRecordUtilities recordIDUsingSalt:zoneID:guid:](CKRecordUtilities, "recordIDUsingSalt:zoneID:guid:", v10, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)_deleteBatchSize
{
  void *v2;
  int v3;

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInCloudKitDemoMode");

  if (v3)
    return 5;
  else
    return 20;
}

- (id)_fetchRecordsOperationWithActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMDCKRecoverableMessageSyncController recordZoneManager](self, "recordZoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverableMessageRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController latestSyncToken](self, "latestSyncToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecoverableMessageSyncController _fetchOperationFactory:token:batchSize:activity:](IMDCKRecoverableMessageSyncController, "_fetchOperationFactory:token:batchSize:activity:", v6, v7, 200, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_saveRecordsOperationWithMap:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[IMDCKRecoverableMessageSyncController recordZoneManager](self, "recordZoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recoverableMessageRecordZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController latestSyncToken](self, "latestSyncToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKRecoverableMessageSyncController _saveRecoverableMessagesOperationFactory:token:batchSize:recordNameToPartIndexAndRowID:activity:](self, "_saveRecoverableMessagesOperationFactory:token:batchSize:recordNameToPartIndexAndRowID:activity:", v9, v10, 200, v7, v6);
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

+ (id)_fetchRecoverableMessagesCKConfiguration:(id)a3
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

+ (id)_fetchOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 activity:(id)a6
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

    objc_msgSend(a1, "_fetchRecoverableMessagesCKConfiguration:", v13);
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
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "_fetchOperationFactory was passed in a nil zone", v21, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

- (id)_writeRecoverableMessagesCKConfiguration:(id)a3
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

- (id)_saveRecoverableMessagesOperationFactory:(id)a3 token:(id)a4 batchSize:(unint64_t)a5 recordNameToPartIndexAndRowID:(id)a6 activity:(id)a7
{
  int v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  IMDCKRecoverableMessageSyncController *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v9 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (v12)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = sub_1D1566428;
    v31 = &unk_1E922B838;
    v32 = self;
    v33 = v12;
    v34 = v14;
    v18 = v17;
    v35 = v18;
    dispatch_sync(MEMORY[0x1E0C80D38], &v28);
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance", v28, v29, v30, v31, v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "newfilteredArrayRemovingCKRecordDupes:", v18);

    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v20, "count");
        *(_DWORD *)buf = 134218240;
        v37 = v23;
        v38 = 1024;
        v39 = v9;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Found %lu of %u max recoverable messages to write up", buf, 0x12u);
      }

    }
    if (objc_msgSend(v20, "count"))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v20, 0);
      objc_msgSend(v24, "setSavePolicy:", 1);
      -[IMDCKRecoverableMessageSyncController _writeRecoverableMessagesCKConfiguration:](self, "_writeRecoverableMessagesCKConfiguration:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConfiguration:", v25);

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "_saveRecoverableMessagesOperationFactory was passed in a nil zone", buf, 2u);
      }

    }
    v24 = 0;
  }

  return v24;
}

- (void)_processRecordDeletionCompletion:(id)a3 error:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  IMDCKRecoverableMessageSyncController *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Delete recoverable message callback with error %@", buf, 0xCu);
    }

  }
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15668E0;
  block[3] = &unk_1E9229280;
  v13 = v8;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v22 = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (v10)
  {
    -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = sub_1D1566C0C;
    v16[3] = &unk_1E92290A8;
    v18 = v10;
    v17 = v14;
    dispatch_async(v15, v16);

  }
}

- (id)createCKRecordforRecoverableMessageMetadata:(id)a3 zoneID:(id)a4 recordNameToPartIndexAndRowID:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v31 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageGUID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("chatGUID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deleteDateInterval"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v37, "length");
  if (!v9 || (v9 = objc_msgSend(v35, "length")) == 0 || !v36)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v37;
        v42 = 2112;
        v43 = v36;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: returning nil record. messageGUID: %@, deleteDateNanosecondIntervalNumber: %@", buf, 0x16u);
      }

    }
  }
  v11 = objc_msgSend(v36, "unsignedLongLongValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("partBody"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "attributesAtIndex:effectiveRange:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D366B8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

  }
  else
  {
    v16 = -1;
  }
  +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cachedSalt");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKRecoverableMessageSyncController recoverableGUIDFromMessageGUID:chatGUID:partIndex:](self, "recoverableGUIDFromMessageGUID:chatGUID:partIndex:", v37, v35, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKRecordUtilities recordIDUsingSalt:zoneID:guid:](CKRecordUtilities, "recordIDUsingSalt:zoneID:guid:", v33, v34, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("recoverableMessage"), v19);
    objc_msgSend(v20, "_setCKRecordString:forKey:", v37, CFSTR("guid"));
    v21 = objc_msgSend(v20, "_setCKRecordDate:forKey:", v32, CFSTR("deleteDate"));
    if (v13)
    {
      JWEncodeCodableObject();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_setCKRecordData:forKey:", v22, CFSTR("partBody"));

    }
    if (v20)
    {
      v38[0] = CFSTR("messageRowID");
      objc_msgSend(v8, "objectForKeyedSubscript:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = CFSTR("partIndex");
      v39[0] = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recordID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, v27);

    }
    else if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Recently Delete | Was not able to construct CKRecord with given data. This is bad.", buf, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v8;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "IMDCKRecoverableMessageSyncController | Recently Deleted: returning nil record. recordID nil for metadata: %@", buf, 0xCu);
      }

    }
    v20 = 0;
  }

  return v20;
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

- (int64_t)syncControllerRecordType
{
  return 4;
}

- (void)deleteRecoverableMessageZone
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKRecoverableMessageSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15671B4;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)recoverableGUIDFromMessageGUID:(id)a3 chatGUID:(id)a4 partIndex:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%@+%ld"), a3, a4, a5, 0);
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

- (IMDCKMessageSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_CKOperationFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end
