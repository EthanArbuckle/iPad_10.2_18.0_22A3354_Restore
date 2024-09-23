@implementation IMDCKChatSyncController

+ (id)sharedInstance
{
  if (qword_1ED935D20 != -1)
    dispatch_once(&qword_1ED935D20, &unk_1E922E9B0);
  return (id)qword_1ED935E60;
}

- (IMDCKChatSyncController)initWithSyncTokenStore:(id)a3
{
  id v5;
  IMDCKChatSyncController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ckQueue;
  uint64_t v9;
  IMDRecordZoneManager *recordZoneManager;
  IMDCKChatSyncCKOperationFactory *v11;
  IMDCKChatSyncCKOperationFactory *CKOperationFactory;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDCKChatSyncController;
  v6 = -[IMDCKChatSyncController init](&v14, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.private.IMDCKChatSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v11 = objc_alloc_init(IMDCKChatSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    -[IMDCKChatSyncController _migrateServerChangeToken](v6, "_migrateServerChangeToken");
  }

  return v6;
}

- (IMDCKChatSyncController)init
{
  IMDCKSyncTokenStore *v3;
  IMDCKChatSyncController *v4;

  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = -[IMDCKChatSyncController initWithSyncTokenStore:](self, "initWithSyncTokenStore:", v3);

  return v4;
}

- (int64_t)syncControllerRecordType
{
  return 2;
}

- (IMDChatRegistry)chatRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BF218;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  if (qword_1ED9363D8 != -1)
    dispatch_once(&qword_1ED9363D8, block);
  return self->_chatRegistry;
}

- (id)recordStore
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1D15BF338;
  v9 = sub_1D15BF348;
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BF350;
  block[3] = &unk_1E922B000;
  block[4] = &v5;
  if (qword_1EFC63ED8 != -1)
    dispatch_once(&qword_1EFC63ED8, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_generateLockRecord
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "************ CREATING CHAT LOCK RECORD **************** OH BOY **************", v11, 2u);
    }

  }
  v4 = objc_alloc(MEMORY[0x1E0C95070]);
  -[IMDCKChatSyncController recordZoneManager](self, "recordZoneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatRecordZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithRecordName:zoneID:", CFSTR("chatLockRecordName"), v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("chatLockRecordType"), v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("lRKey"));

  return v8;
}

- (void)_migrateServerChangeToken
{
  id v2;

  -[IMDCKChatSyncController syncTokenStore](self, "syncTokenStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrateKey:fromDatabase:", CFSTR("changeToken"), CFSTR("/var/mobile/Library/SMS/CloudKitMetaData/ChatSyncZoneMetaData.db"));

}

- (id)_changeTokenKey
{
  return CFSTR("changeToken");
}

- (void)setLatestSyncToken:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[IMDCKChatSyncController syncTokenStore](self, "syncTokenStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKChatSyncController _changeTokenKey](self, "_changeTokenKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v6 = v7;
  else
    v6 = 0;
  objc_msgSend(v4, "persistToken:forKey:", v6, v5);

}

- (CKServerChangeToken)latestSyncToken
{
  void *v3;
  void *v4;
  void *v5;

  -[IMDCKChatSyncController syncTokenStore](self, "syncTokenStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKChatSyncController _changeTokenKey](self, "_changeTokenKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKServerChangeToken *)v5;
}

- (id)_copyChatsToUploadWithLimit:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t v9[8];
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1D15BF338;
  v15 = sub_1D15BF348;
  v16 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((v5 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "**** Do not call -[IMDCKChatSyncController _chatsToUpload] on main thread *******", v9, 2u);
      }

    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15BF744;
    block[3] = &unk_1E922E9D8;
    block[4] = self;
    block[5] = &v11;
    block[6] = a3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)_randomSalt
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
}

- (id)_newckRecordsFromChats:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;
  IMDCKChatSyncController *v10;
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
  v15 = sub_1D15BF338;
  v16 = sub_1D15BF348;
  v17 = 0;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BF898;
  block[3] = &unk_1E922EA00;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v5 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)_chatZoneID
{
  void *v2;
  void *v3;

  -[IMDCKChatSyncController recordZoneManager](self, "recordZoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatRecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (void)_updateChatUsingCKRecord:(id)a3 onRead:(BOOL)a4 didSucceed:(BOOL)a5 dispatchToMain:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  _QWORD aBlock[5];
  id v15;
  BOOL v16;
  BOOL v17;

  v6 = a6;
  v10 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D15BFCE4;
  aBlock[3] = &unk_1E922EA28;
  aBlock[4] = self;
  v15 = v10;
  v16 = a4;
  v17 = a5;
  v11 = v10;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v13 = v12;
  if (v6)
    dispatch_sync(MEMORY[0x1E0C80D38], v12);
  else
    v12[2](v12);

}

- (void)_resolveChatConflictUsingCKRecord:(id)a3 localGUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BFDD0;
  block[3] = &unk_1E9229280;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

- (void)_markChatAsDefferedForSyncingUsingRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15BFE8C;
  block[3] = &unk_1E9228750;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

- (BOOL)_chatZoneCreated
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
  -[IMDCKChatSyncController recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D15C0054;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createChatZoneIfNeededWithCompletionBlock:", v12);

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
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating chat zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4 recordIDtoGUIDmap:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  IMDCKChatSyncController *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "recordID");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordChangeTag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "per record completion block record %@ changeTag %@ error %@", buf, 0x20u);

    }
  }
  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1D15C0340;
  v18[3] = &unk_1E922B838;
  v19 = v9;
  v20 = v8;
  v21 = self;
  v22 = v10;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  dispatch_sync(v14, v18);

}

- (BOOL)_lockRecordHadConflict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "code") == 2)
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0C94940]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "recordName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("chatLockRecordName"));

          if (v12)
          {
            objc_msgSend(v5, "objectForKey:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "code") == 14)
            {
              if (IMOSLoggingEnabled(14))
              {
                OSLogHandleForIMFoundationCategory();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v22 = v10;
                  _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Got a conflict while fetching lock record %@", buf, 0xCu);
                }

              }
              v14 = 1;
              goto LABEL_19;
            }

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_19:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = IMOSLoggingEnabled(v13);
  if ((_DWORD)v14)
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "modifyRecordsCompletionBlock error %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Number of records saved %@", buf, 0xCu);

    }
  }
  v18 = v12;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "errorIndicatesQuotaExceeded:", v18);

  if (v20)
  {
    v22 = v18;
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "We got back that we have exceeded quota in chat sync -- failing to continue writes", buf, 2u);
      }

      v22 = v18;
    }
  }
  else
  {
    v22 = v18;
    if (objc_msgSend(v18, "code") == 2)
    {
      if (IMOSLoggingEnabled(2))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "We only had partial error and the whole batch failed ", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CC0], 2, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (v13)
  {
    -[IMDCKChatSyncController ckQueue](self, "ckQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1D15C0CF0;
    v26[3] = &unk_1E92290A8;
    v28 = v13;
    v27 = v22;
    dispatch_async(v25, v26);

  }
}

- (void)_writeCKRecordsToChatZone:(id)a3 activity:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD block[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v13, "recordType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("chatLockRecordType"));

        if (v15)
        {
          if (IMOSLoggingEnabled(v16))
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "lock record is present amongst chats", buf, 2u);
            }

          }
          v10 = 1;
        }
        else
        {
          objc_msgSend(v13, "_stringForKey:", CFSTR("guid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "recordName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v18, v20);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
    {
      -[IMDCKChatSyncController CKOperationFactory](self, "CKOperationFactory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "saveChatsCKOperationUsingRecordsToSave:activity:", v8, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setPerRecordProgressBlock:", &unk_1E922EA48);
      v24 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1D15C1218;
      v35[3] = &unk_1E922EA70;
      v35[4] = self;
      v36 = v32;
      objc_msgSend(v23, "setPerRecordCompletionBlock:", v35);
      v33[0] = v24;
      v33[1] = 3221225472;
      v33[2] = sub_1D15C122C;
      v33[3] = &unk_1E92291C0;
      v33[4] = self;
      v34 = v31;
      if (IMOSLoggingEnabled(objc_msgSend(v23, "setModifyRecordsCompletionBlock:", v33)))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v26;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Attempting to write %@ records to truth zone ", buf, 0xCu);

        }
      }
      -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v23);

      goto LABEL_28;
    }
  }
  else
  {

  }
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "******** LOCK RECORD IS NOT PRESENT ******", buf, 2u);
    }

  }
  if (v31)
  {
    -[IMDCKChatSyncController ckQueue](self, "ckQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15C11B4;
    block[3] = &unk_1E9228700;
    v38 = v31;
    dispatch_async(v28, block);

    v23 = v38;
LABEL_28:

  }
}

- (unint64_t)_numberOfChatsToFetch
{
  void *v2;
  int64_t v3;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "overrideNumberOfChatsToFetch");

  if (v3 <= 0)
    return 200;
  else
    return v3;
}

- (unint64_t)_numberOfChatsToWrite
{
  void *v2;
  int64_t v3;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "overrideNumberOfChatsToWrite");

  if (v3 <= 0)
    return 200;
  else
    return v3;
}

- (BOOL)_shouldResyncChatsForError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D37CC0]))
  {

    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != 2)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "We failed to sync Chats due to op lock Not doing ABC %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (void)_logGreenTeaLogsForChats:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {

    goto LABEL_23;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v18;
  v9 = (_QWORD *)MEMORY[0x1E0D38F58];
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v11, "serviceName", (_QWORD)v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *v9);

      if ((v13 & 1) != 0)
      {
        v6 = 1;
        if ((v7 & 1) == 0)
          continue;
      }
      else
      {
        objc_msgSend(v11, "serviceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D38F68]))
        {
          objc_msgSend(v11, "lastAddressedLocalHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = MEMORY[0x1D17EA35C]();

        }
        else
        {
          v16 = 0;
        }

        v7 |= v16;
        if ((v7 & 1) == 0)
          continue;
      }
      if ((v6 & 1) != 0)
      {

        IMGreenTeaMessageTransmitLog();
LABEL_21:
        IMGreenTeaPhoneNumberTransmitLog();
        goto LABEL_23;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
      continue;
    break;
  }

  if ((v6 & 1) != 0)
    IMGreenTeaMessageTransmitLog();
  if ((v7 & 1) != 0)
    goto LABEL_21;
LABEL_23:

}

- (void)_writeDirtyChatsToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  IMDCKChatSyncController *v44;
  _QWORD v45[4];
  id v46;
  IMDCKChatSyncController *v47;
  id v48;
  id v49;
  BOOL v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v6 = a4;
  v7 = -[IMDCKChatSyncController _copyChatsToUploadWithLimit:](self, "_copyChatsToUploadWithLimit:", -[IMDCKChatSyncController _numberOfChatsToWrite](self, "_numberOfChatsToWrite"));
  v43 = v6;
  v41 = v7;
  if (objc_msgSend(v7, "count"))
  {
    -[IMDCKChatSyncController _logGreenTeaLogsForChats:](self, "_logGreenTeaLogsForChats:", v7, v7);
    v44 = self;
    if (IMOSLoggingEnabled(-[IMDCKAbstractSyncController setBroadcastedSyncStateToUploading](self, "setBroadcastedSyncStateToUploading")))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = (unint64_t)v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Number of chats to write up %@", buf, 0xCu);

      }
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    v12 = v11;
    if (v11)
    {
      v13 = *(_QWORD *)v52;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v14);
          v11 = IMOSLoggingEnabled(v11);
          if ((_DWORD)v11)
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "cloudKitDebugDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v56 = (unint64_t)v17;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Chat to sync up %@", buf, 0xCu);

            }
          }
          ++v14;
        }
        while (v12 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        v12 = v11;
      }
      while (v11);
    }

    v18 = -[IMDCKChatSyncController _newckRecordsFromChats:](v44, "_newckRecordsFromChats:", v10);
    v19 = objc_msgSend(v18, "count");
    -[IMDCKAbstractSyncController ckUtilities](v44, "ckUtilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "newfilteredArrayRemovingCKRecordDupes:", v18);

    if (IMOSLoggingEnabled(v22))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134218240;
        v56 = v19;
        v57 = 2048;
        v58 = v24;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Got %lu records to sync, filtered to %lu unique records", buf, 0x16u);
      }

    }
    objc_msgSend(v18, "removeAllObjects");
    objc_msgSend(v18, "addObjectsFromArray:", v21);
    v25 = -[IMDCKChatSyncController _numberOfChatsToWrite](v44, "_numberOfChatsToWrite");
    v26 = v25;
    if (v19 < v25 && IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "This is the last batch of chats to write up", buf, 2u);
      }

    }
    -[IMDCKChatSyncController lockRecord](v44, "lockRecord");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      -[IMDCKChatSyncController _generateLockRecord](v44, "_generateLockRecord");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKChatSyncController setLockRecord:](v44, "setLockRecord:", v31);

    }
    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        -[IMDCKChatSyncController lockRecord](v44, "lockRecord");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = (unint64_t)v33;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Adding lock record %@", buf, 0xCu);

      }
    }
    if (v18)
    {
      -[IMDCKChatSyncController lockRecord](v44, "lockRecord");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (!v35)
      {
        -[IMDCKChatSyncController lockRecord](v44, "lockRecord");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        CFArrayAppendValue((CFMutableArrayRef)v18, v36);

      }
    }
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1D15C1C38;
    v45[3] = &unk_1E922EA98;
    v50 = v19 < v26;
    v46 = v18;
    v47 = v44;
    v48 = v42;
    v49 = v43;
    v37 = v18;
    -[IMDCKChatSyncController _writeCKRecordsToChatZone:activity:withCompletion:](v44, "_writeCKRecordsToChatZone:activity:withCompletion:", v37, v48, v45);

  }
  else
  {
    v38 = IMOSLoggingEnabled(0);
    if ((_DWORD)v38)
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "No chats to sync up at this moment", buf, 2u);
      }

    }
    if (v6)
    {
      (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
    }
    else if (IMOSLoggingEnabled(v38))
    {
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "No completion block to call", buf, 2u);
      }

    }
  }

}

- (id)_fetchChatRecordOperationWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[IMDCKChatSyncController latestSyncToken](self, "latestSyncToken");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[IMDCKChatSyncController _chatZoneID](self, "_chatZoneID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDCKChatSyncController _numberOfChatsToFetch](self, "_numberOfChatsToFetch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Creating a fetch chat record operation using sync token %@ for zone %@ limit %@", (uint8_t *)&v14, 0x20u);

    }
  }
  -[IMDCKChatSyncController CKOperationFactory](self, "CKOperationFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKChatSyncController latestSyncToken](self, "latestSyncToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKChatSyncController _chatZoneID](self, "_chatZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchChatZoneChangesCKOperationUsingToken:zone:resultsLimit:activity:", v10, v11, -[IMDCKChatSyncController _numberOfChatsToFetch](self, "_numberOfChatsToFetch"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_processRecordDeletion:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "**** _processRecordDeletion:Dropping delete as IDS syncs it real time. ***", v5, 2u);
    }

  }
}

- (void)_processRecordChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  IMDCKChatSyncController *v9;

  v4 = a3;
  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15C21A0;
  block[3] = &unk_1E9228750;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5
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
      v17 = v9;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }

  }
  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D15C253C;
  v14[3] = &unk_1E9228750;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  dispatch_sync(v12, v14);

}

- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v8 = a6;
  v33 = *MEMORY[0x1E0C80C00];
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
      v17 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v24 = v13;
      v25 = 2112;
      if (v8)
        v17 = CFSTR("YES");
      v26 = v12;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@ moreComing %@ recordZoneError %@", buf, 0x34u);
    }

  }
  if (v15)
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "CKPartialError:hasErrorCode:", v15, &unk_1E9271770);

    if (v19)
      -[IMDCKChatSyncController deleteChatSyncToken](self, "deleteChatSyncToken");
  }
  else
  {
    -[IMDCKChatSyncController ckQueue](self, "ckQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1D15C2748;
    v21[3] = &unk_1E9228750;
    v21[4] = self;
    v22 = v12;
    dispatch_sync(v20, v21);

  }
}

- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Kicking off chat write", buf, 2u);
    }

  }
  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15C287C;
  block[3] = &unk_1E92290F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "shouldKickOffWriteForSyncType:", a3);

  if ((_DWORD)a3)
  {
    -[IMDCKChatSyncController _kickOffWriteOnCKQueueWithActivity:completion:](self, "_kickOffWriteOnCKQueueWithActivity:completion:", v8, v9);
  }
  else
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Not writing up chats as sync type does not allow it", v13, 2u);
      }

    }
    if (v9)
      v9[2](v9, 1, 0);
  }

}

- (void)_processFetchRecordChangesCompleted:(id)a3 activity:(id)a4 completion:(id)a5 syncType:(int64_t)a6
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
  void *v30;
  _QWORD block[6];
  char v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, uint64_t))a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1D15BF338;
  v38 = sub_1D15BF348;
  v39 = 0;
  v13 = v10;
  v39 = v13;
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "errorIndicatesZoneNotCreated:", v35[5]);

  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "errorIndicatesUserDeletedZone:", v35[5]);

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
        v41 = v20;
        v42 = 2112;
        v43 = v13;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "We got a %@ error while fetching chats. %@", buf, 0x16u);
      }

    }
    -[IMDCKChatSyncController ckQueue](self, "ckQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15C2E1C;
    block[3] = &unk_1E922EAC0;
    v32 = v17;
    v33 = v15;
    block[4] = self;
    block[5] = &v34;
    dispatch_sync(v21, block);

  }
  if (v35[5])
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "CKPartialError:hasErrorCode:", v35[5], &unk_1E9271770);

    if (v23)
    {
      if (IMOSLoggingEnabled(v24))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (const __CFString *)v35[5];
          *(_DWORD *)buf = 138412290;
          v41 = v26;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We got an expired server change token back so resetting local sync state, and fetching the chats again %@", buf, 0xCu);
        }

      }
      -[IMDCKChatSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 17);
    }
    else
    {
      if (IMOSLoggingEnabled(v24))
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = (const __CFString *)v35[5];
          *(_DWORD *)buf = 138412290;
          v41 = v29;
          _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "********* We got an error fetching changes from chat zone %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "autoBugCaptureWithSubType:errorPayload:", CFSTR("ChatSync"), v35[5]);

    }
    if (v12)
      v12[2](v12, 0, v35[5]);
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
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "We completed fetching changes from chat zone with no error", buf, 2u);
      }

    }
    -[IMDCKChatSyncController _kickOffWriteIfNeededForSyncType:activity:completion:](self, "_kickOffWriteIfNeededForSyncType:activity:completion:", a6, v11, v12);
  }
  _Block_object_dispose(&v34, 8);

}

- (void)deleteChatSyncToken
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15C3138;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)deleteChat1SyncToken
{
  id v2;

  -[IMDCKChatSyncController syncTokenStore](self, "syncTokenStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistToken:forKey:", 0, CFSTR("chat1ChangeToken"));

}

- (void)_syncChatsWithCloudKitWithCompletionType:(int64_t)a3 activity:(id)a4 syncChatsCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  IMDCKChatSyncController *v19;
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
  v8 = a4;
  v9 = a5;
  -[IMDCKAbstractSyncController setBroadcastedSyncStateToDownloading](self, "setBroadcastedSyncStateToDownloading");
  -[IMDCKChatSyncController _fetchChatRecordOperationWithActivity:](self, "_fetchChatRecordOperationWithActivity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D15C3450;
  v26[3] = &unk_1E922A4F8;
  v26[4] = self;
  objc_msgSend(v10, "setRecordChangedBlock:", v26);
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = sub_1D15C345C;
  v25[3] = &unk_1E922A560;
  v25[4] = self;
  objc_msgSend(v10, "setRecordWithIDWasDeletedBlock:", v25);
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = sub_1D15C3468;
  v24[3] = &unk_1E922D5B8;
  v24[4] = self;
  objc_msgSend(v10, "setRecordZoneChangeTokensUpdatedBlock:", v24);
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = sub_1D15C3478;
  v23[3] = &unk_1E922D5E0;
  v23[4] = self;
  objc_msgSend(v10, "setRecordZoneFetchCompletionBlock:", v23);
  v15 = v11;
  v16 = 3221225472;
  v17 = sub_1D15C3490;
  v18 = &unk_1E922D608;
  v19 = self;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = a3;
  if (IMOSLoggingEnabled(objc_msgSend(v10, "setFetchRecordZoneChangesCompletionBlock:", &v15)))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Scheduling a fetch chat zone changes operation %@", buf, 0xCu);
    }

  }
  -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v10, v15, v16, v17, v18, v19);

}

- (void)_anyChatExistsOnServerWithResultsLimit:(int)a3 changeToken:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  IMDCKChatSyncController *v32;
  id v33;
  id v34;
  uint8_t *v35;
  int v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t *v40;
  uint8_t v41[4];
  void *v42;
  __int16 v43;
  int v44;
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  char v48;
  void *v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "chatExistsWithCompletion (batch size %d)", buf, 8u);
    }

  }
  -[IMDCKChatSyncController _chatZoneID](self, "_chatZoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[IMDCKChatSyncController CKOperationFactory](self, "CKOperationFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchChatZoneChangesCKOperationUsingToken:zone:resultsLimit:groupName:activity:", v9, v13, a3, CFSTR("ChatsExistCheck"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setFetchAllChanges:", 0);
    v28 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
    objc_msgSend(v28, "setResultsLimit:", a3);
    objc_msgSend(v28, "setDesiredKeys:", MEMORY[0x1E0C9AA60]);
    v49 = v13;
    v50[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConfigurationsByRecordZoneID:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0C94F80]);
    objc_msgSend(v17, "setQualityOfService:", 17);
    objc_msgSend(v17, "setAllowsCellularAccess:", 1);
    objc_msgSend(v17, "im_setActivity:", v10);
    objc_msgSend(v15, "setConfiguration:", v17);
    objc_msgSend(v15, "operationID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v26 = v9;
    *(_QWORD *)buf = 0;
    v46 = buf;
    v47 = 0x2020000000;
    v48 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = sub_1D15C3930;
    v37[3] = &unk_1E922EAE8;
    v21 = v13;
    v38 = v21;
    v40 = buf;
    v22 = v11;
    v39 = v22;
    objc_msgSend(v15, "setRecordChangedBlock:", v37);
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = sub_1D15C3A7C;
    v29[3] = &unk_1E922EB10;
    v23 = v18;
    v30 = v23;
    v35 = buf;
    v31 = v21;
    v32 = self;
    v36 = a3;
    v33 = v19;
    v34 = v22;
    objc_msgSend(v15, "setRecordZoneFetchCompletionBlock:", v29);
    v9 = v26;
    v10 = v19;
    if (IMOSLoggingEnabled(-[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v15)))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v15, "operationID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v41 = 138412546;
        v42 = v25;
        v43 = 1024;
        v44 = a3;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Scheduled fetch changes operation to check for the existence of a single chat with identifier: %@ (batch size %d)", v41, 0x12u);

      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CC0], 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);
LABEL_13:

  }
}

- (void)anyChatExistsOnServerWithActivity:(id)a3 completion:(id)a4
{
  -[IMDCKChatSyncController _anyChatExistsOnServerWithResultsLimit:changeToken:activity:completion:](self, "_anyChatExistsOnServerWithResultsLimit:changeToken:activity:completion:", 1, 0, a3, a4);
}

- (void)deleteChatZone
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKChatSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15C3D24;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

  -[IMDCKChatSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 3);
}

- (BOOL)_eligibleForTruthZone
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  BOOL v15;
  _QWORD v17[5];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "chat sync controller checking eligibility", buf, 2u);
    }

  }
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D15C4068;
  v17[3] = &unk_1E922EB38;
  v19 = &v20;
  v17[4] = self;
  v6 = v3;
  v18 = v6;
  objc_msgSend(v5, "fetchCloudKitAccountStatusAndUpdateEligibilityAndNeedsRepairStatusWithCompletion:", v17);

  v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    -[IMDCKAbstractSyncController syncState](self, "syncState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEligibleForTruthZone");
    *((_BYTE *)v21 + 24) = v9;

    v11 = IMOSLoggingEnabled(v10);
    if ((_DWORD)v11)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "***** Timed out checking truth zone eligibility *******", buf, 2u);
      }

    }
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (*((_BYTE *)v21 + 24))
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v25 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Returning cached value: %@", buf, 0xCu);
      }

    }
  }
  v15 = *((_BYTE *)v21 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
}

- (void)_needsToMarkAllChatsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]);

}

- (BOOL)_shouldMarkAllChatsAsNeedingSync
{
  void *v2;
  char v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnderFirstDataProtectionLock");

  if ((v3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]) ^ 1;

  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_shouldMarkAllChatsAsNeedingSync %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (void)_hasMarkedAllChatsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37978]);

}

- (void)syncChatsWithType:(int64_t)a3 withActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

  if (!a3)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Resetting fetched chats BOOL to NO", buf, 2u);
      }

    }
    -[IMDCKChatSyncController setFetchedChatsDuringLastSync:](self, "setFetchedChatsDuringLastSync:", 0);
  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[IMDCKChatSyncController recordStore](self, "recordStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resetLocalSyncStateIfAppropriate");

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15C4620;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  -[IMDCKChatSyncController __syncChatsWithCloudKit:attemptCount:activity:withCompletion:](self, "__syncChatsWithCloudKit:attemptCount:activity:withCompletion:", a3, 0, v8, v9);

}

- (void)__syncChatsWithCloudKit:(int64_t)a3 attemptCount:(unint64_t)a4 activity:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  int64_t v30;
  unint64_t v31;
  _QWORD aBlock[5];
  id v33;
  _QWORD block[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Starting chat sync attempt count %@", buf, 0xCu);

    }
  }
  -[IMDCKAbstractSyncController resetRecordCounts](self, "resetRecordCounts");
  v14 = -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 1);
  if (a4 < 0x65)
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cloudKitSyncingEnabled");

    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D15C4A58;
    aBlock[3] = &unk_1E92284E8;
    aBlock[4] = self;
    v33 = v11;
    v19 = _Block_copy(aBlock);
    v20 = v19;
    if (v17)
    {
      -[IMDCKChatSyncController ckQueue](self, "ckQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      v27[0] = v18;
      v27[1] = 3221225472;
      v27[2] = sub_1D15C4AF8;
      v27[3] = &unk_1E922D2D0;
      v27[4] = self;
      v30 = a3;
      v31 = a4;
      v28 = v10;
      v29 = v20;
      v22 = v20;
      dispatch_async(v21, v27);

    }
    else
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Not syncing chats due to missing defaults. Please do following as mobile and try again - defaults write com.apple.madrid enableCKSyncingV2 YES", buf, 2u);
        }

      }
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = sub_1D15C4F24;
      v25[3] = &unk_1E9228700;
      v26 = v20;
      v24 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], v25);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Exceeded number of chat sync attempts", buf, 2u);
      }

    }
    if (v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D15C49F4;
      block[3] = &unk_1E9228700;
      v35 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    -[IMDCKAbstractSyncController setIsSyncing:](self, "setIsSyncing:", 0);
  }

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = IMOSLoggingEnabled(self);
  if ((_DWORD)v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v3;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Clearing local chat sync state, flags 0x%x", buf, 8u);
    }

  }
  if ((v3 & 1) != 0)
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCollectorAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:", CFSTR("ResetSyncDate"), 1, 0, v8, CFSTR("ResetSyncDate"));

    -[IMDCKAbstractSyncController syncState](self, "syncState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLastSyncDate:", 0);

    -[IMDCKChatSyncController deleteChatSyncToken](self, "deleteChatSyncToken");
    -[IMDCKChatSyncController setLockRecord:](self, "setLockRecord:", 0);

  }
  if ((v3 & 2) != 0)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Marking all chats as dirty", buf, 2u);
      }

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "resetCKSyncState");
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDCKChatSyncController _needsToMarkAllChatsAsNeedingSync](self, "_needsToMarkAllChatsAsNeedingSync");
  }
}

- (id)_copyRecordIDsToDelete
{
  __CFArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMDCKChatSyncController chatRegistry](self, "chatRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyRecordIDsAndGUIDsPendingCloudKitDelete");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C95070]);
        objc_msgSend(v10, "valueForKey:", CFSTR("recordID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDCKChatSyncController _chatZoneID](self, "_chatZoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v12, v13);

        if (v3 && v14)
          CFArrayAppendValue(v3, v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_handleChatDeletionCompletionForRecordIDs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  IMDCKChatSyncController *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "_handleChatDeletionCompletionForRecordIDs error %@", buf, 0xCu);
    }

  }
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "acceptableErrorCodeWhileDeleting:", v7);

  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D15C55A0;
    v13[3] = &unk_1E9228750;
    v14 = v6;
    v15 = self;
    dispatch_sync(MEMORY[0x1E0C80D38], v13);

  }
  else if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Error deleteing chats from CloudKit %@", buf, 0xCu);
    }

  }
}

- (void)syncPendingDeletionWithCompletion:(id)a3
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
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudKitSyncingEnabled");

  if ((v6 & 1) != 0)
  {
    v8 = -[IMDCKChatSyncController _copyRecordIDsToDelete](self, "_copyRecordIDsToDelete");
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newfilteredArrayRemovingCKRecordIDDupes:", v8);

    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v17 = objc_msgSend(v8, "count");
        v18 = 2048;
        v19 = objc_msgSend(v10, "count");
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Got %lu recordIDs to sync, filtered to %lu unique recordIDs", buf, 0x16u);
      }

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D15C59A0;
    v14[3] = &unk_1E922A2C8;
    v14[4] = self;
    v15 = v4;
    -[IMDCKChatSyncController _filterRecordIDsToChatsWithNoRecentModifications:completion:](self, "_filterRecordIDsToChatsWithNoRecentModifications:completion:", v10, v14);

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "CloudKit Syncing is disable", buf, 2u);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.IMDCKChatSyncController"), 2, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v4 + 2))(v4, v8);
LABEL_13:

  }
}

- (void)_deleteChatRecordsWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, void *);
  void *v14;
  IMDCKChatSyncController *v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[IMDCKAbstractSyncController setBroadcastedSyncStateToDeleting](self, "setBroadcastedSyncStateToDeleting");
    -[IMDCKChatSyncController CKOperationFactory](self, "CKOperationFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteChatCKOperationUsingRecordIDstoDelete:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1E922EB80);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = sub_1D15C5CE0;
    v14 = &unk_1E92291C0;
    v15 = self;
    v16 = v7;
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v11);
    -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v9, v11, v12, v13, v14, v15);

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "No pending chats at this moment", buf, 2u);
      }

    }
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_filterRecordIDsToChatsWithNoRecentModifications:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__im_dateByAddingDays:", -14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Filtering chat recordIDs to those with modification date after %@", buf, 0xCu);
    }

  }
  -[IMDCKChatSyncController CKOperationFactory](self, "CKOperationFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchChatCKOperationUsingRecordIDs:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setDesiredKeys:", MEMORY[0x1E0C9AA60]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = sub_1D15C5F78;
  v19 = &unk_1E9229198;
  v20 = v9;
  v21 = v7;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v13, "setFetchRecordsCompletionBlock:", &v16);
  -[IMDCKChatSyncController _scheduleOperation:](self, "_scheduleOperation:", v13, v16, v17, v18, v19);

}

- (BOOL)fetchedChatsDuringLastSync
{
  return self->_fetchedChatsDuringLastSync;
}

- (void)setFetchedChatsDuringLastSync:(BOOL)a3
{
  self->_fetchedChatsDuringLastSync = a3;
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ckQueue, a3);
}

- (void)setChatRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_chatRegistry, a3);
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

- (IMDCKChatSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_CKOperationFactory, a3);
}

- (CKRecord)lockRecord
{
  return self->_lockRecord;
}

- (void)setLockRecord:(id)a3
{
  objc_storeStrong((id *)&self->_lockRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockRecord, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
  objc_storeStrong((id *)&self->_latestSyncToken, 0);
}

@end
