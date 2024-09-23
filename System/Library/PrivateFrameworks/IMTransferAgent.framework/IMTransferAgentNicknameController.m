@implementation IMTransferAgentNicknameController

+ (id)sharedInstance
{
  if (qword_2540D93C0 != -1)
    dispatch_once(&qword_2540D93C0, &unk_24F979E80);
  return (id)qword_2540D93E8;
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 knownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 queue:(id)a10 completionBlock:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  IMTransferAgentNicknameController *v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  BOOL v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  if (objc_msgSend(MEMORY[0x24BE511E8], "supportsNameAndPhoto"))
  {
    if (objc_msgSend(v17, "length"))
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = sub_22D98AC20;
      v43 = sub_22D98AC30;
      v44 = 0;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = sub_22D98AC38;
      v27[3] = &unk_24F97A368;
      v28 = v17;
      v29 = v21;
      v30 = v19;
      v37 = a8;
      v31 = v20;
      v32 = self;
      v24 = v22;
      v33 = v24;
      v34 = v18;
      v38 = a9;
      v35 = v23;
      v36 = &v39;
      v25 = (void *)MEMORY[0x22E31D724](v27);
      -[IMTransferAgentNicknameController performCloudKitOperation:queue:withError:](self, "performCloudKitOperation:queue:withError:", v25, v24, v40[5]);

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nickname"), 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v23 + 2))(v23, 0, v26);

    }
  }

}

- (void)fetchCurrentUserForNicknameContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMTransferAgentNicknameController _nickNameContainer](self, "_nickNameContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22D98B6B8;
  v7[3] = &unk_24F97A390;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchUserRecordIDWithCompletionHandler:", v7);

}

- (void)fetchAllNicknamesForCurrentUser:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_22D98B73C;
  v6[3] = &unk_24F97A3E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[IMTransferAgentNicknameController fetchCurrentUserForNicknameContainer:](self, "fetchCurrentUserForNicknameContainer:", v6);

}

- (void)setPersonalNicknameData:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x24BDD1620];
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = a3;
  objc_msgSend(v14, "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v16, v15, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v21;
  if (v17)
    v19 = v18 == 0;
  else
    v19 = 0;
  if (v19)
  {
    -[IMTransferAgentNicknameController setPersonalNickname:oldRecordID:queue:completionBlock:](self, "setPersonalNickname:oldRecordID:queue:completionBlock:", v17, v10, v11, v12);
  }
  else
  {
    -[IMTransferAgentNicknameController _errorWrappingError:](self, "_errorWrappingError:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, v20);

  }
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v33 = a4;
  v31 = a5;
  v11 = a6;
  v12 = v10;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "avatar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageFilePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v12;
      v52 = 2112;
      v53 = v15;
      _os_log_impl(&dword_22D97D000, v13, OS_LOG_TYPE_INFO, "Client request to store new personal nickname %@ path%@", buf, 0x16u);

    }
  }
  v16 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_22D98C010;
  v48[3] = &unk_24F97A408;
  v17 = v11;
  v48[4] = self;
  v49 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E31D724](v48);
  v47 = 0;
  objc_msgSend(MEMORY[0x24BE51268], "generatePreKeyWithError:", &v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v47;
  v21 = v20;
  if (v19)
  {
    v45 = 0;
    v46 = 0;
    v43 = v20;
    v44 = 0;
    objc_msgSend(v12, "publicRecordsForNicknameWithPreKey:wallpaperDataTag:lowResWallpaperDataTag:wallpaperMetadataTag:error:", v19, &v46, &v45, &v44, &v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v46;
    v23 = v45;
    v28 = v44;
    v24 = v43;

    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("profileRecord"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("wallpaperRecord"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      if (objc_msgSend(v33, "length"))
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v33);
      else
        v27 = 0;
      v25 = objc_alloc_init(MEMORY[0x24BE508D8]);
      objc_msgSend(v25, "startTimingForKey:", CFSTR("Nickname Upload"));
      v34[0] = v16;
      v34[1] = 3221225472;
      v34[2] = sub_22D98C144;
      v34[3] = &unk_24F97A430;
      v35 = v25;
      v36 = v12;
      v37 = v30;
      v42 = v18;
      v38 = v19;
      v39 = v22;
      v40 = v23;
      v41 = v28;
      v26 = v25;
      -[IMTransferAgentNicknameController _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:wallpaperRecordToSave:deletingRecordID:queue:withCompletionBlock:](self, "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:wallpaperRecordToSave:deletingRecordID:queue:withCompletionBlock:", v37, v29, v27, v31, v34);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v18)[2](v18, 0, 0, 0, 0, 0, 0, 0, v24);
    }

    v21 = v24;
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))v18)[2](v18, 0, 0, 0, 0, 0, 0, 0, v20);
  }

}

- (void)deleteAllPersonalNicknamesOnQueue:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Client request to delete personal nickname with recordID", buf, 2u);
    }

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22D98C588;
  v11[3] = &unk_24F97A480;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[IMTransferAgentNicknameController fetchAllNicknamesForCurrentUser:](self, "fetchAllNicknamesForCurrentUser:", v11);

}

- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:(id)a3 wallpaperRecordToSave:(id)a4 deletingRecordID:(id)a5 queue:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  IMTransferAgentNicknameController *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  IMTransferAgentNicknameController *v35;
  id v36;
  id v37;
  id v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v12)
  {
    objc_msgSend(v18, "addObject:", v12);
    if (v13)
      objc_msgSend(v19, "addObject:", v13);
  }
  if (objc_msgSend(v17, "count"))
  {
    v20 = objc_alloc_init(MEMORY[0x24BE508D8]);
    objc_msgSend(v20, "startTimingForKey:", CFSTR("Nickname Delete"));
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = sub_22D98C9C4;
    v32 = &unk_24F97A4A8;
    v33 = v20;
    v34 = v12;
    v35 = self;
    v36 = v19;
    v21 = v15;
    v37 = v21;
    v38 = v16;
    v22 = v20;
    v23 = MEMORY[0x22E31D724](&v29);
    v24 = self;
    v25 = v16;
    v26 = v15;
    v27 = v13;
    v28 = (void *)v23;
    -[IMTransferAgentNicknameController _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:](v24, "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:", 0, v17, v21, v23, v29, v30, v31, v32);

    v13 = v27;
    v15 = v26;
    v16 = v25;

  }
  else
  {
    -[IMTransferAgentNicknameController _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:](self, "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:", v19, 0, v15, v16);
  }

}

- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:(id)a3 deletingRecordIDs:(id)a4 queue:(id)a5 withCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  IMTransferAgentNicknameController *v27;
  id v28;
  id v29;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_22D97D000, v14, OS_LOG_TYPE_INFO, "Publishing Nickname to CloudKit Public DB with record %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (v11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_22D97D000, v15, OS_LOG_TYPE_INFO, "Deleting Nickname from CloudKit Public DB with recordID %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = sub_22D98AC20;
  v34 = sub_22D98AC30;
  v35 = 0;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_22D98CDAC;
  v24 = &unk_24F97A570;
  v16 = v11;
  v25 = v16;
  v17 = v10;
  v26 = v17;
  v27 = self;
  v18 = v12;
  v28 = v18;
  v19 = v13;
  v29 = v19;
  p_buf = &buf;
  v20 = (void *)MEMORY[0x22E31D724](&v21);
  -[IMTransferAgentNicknameController performCloudKitOperation:queue:withError:](self, "performCloudKitOperation:queue:withError:", v20, v18, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v21, v22, v23, v24);

  _Block_object_dispose(&buf, 8);
}

- (void)_handleSaveNicknameError:(id)a3 queue:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _BYTE v30[128];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  if (v8)
  {
    if (objc_msgSend(v8, "code") == 2)
    {
      objc_msgSend(v8, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForKey:", *MEMORY[0x24BDB8EE8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = 0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v18, "code") == 19 || objc_msgSend(v18, "code") == 12)
        {
          *((_BYTE *)v27 + 24) = 1;
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = sub_22D98D75C;
          v19[3] = &unk_24F97A598;
          v21 = &v26;
          v20 = v10;
          -[IMTransferAgentNicknameController deleteAllPersonalNicknamesOnQueue:withCompletion:](self, "deleteAllPersonalNicknamesOnQueue:withCompletion:", v9, v19);

          goto LABEL_22;
        }
        if (objc_msgSend(v18, "code") == 14)
          *((_BYTE *)v27 + 24) = 0;
        if (objc_msgSend(v18, "code") == 15)
          *((_BYTE *)v27 + 24) = 0;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v15)
        continue;
      break;
    }
  }

  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, *((unsigned __int8 *)v27 + 24));
LABEL_22:
  _Block_object_dispose(&v26, 8);

}

- (void)performCloudKitOperation:(id)a3 queue:(id)a4 withError:(id)a5
{
  -[IMTransferAgentNicknameController cloudKitOperationWithRetryCount:queue:withError:operation:](self, "cloudKitOperationWithRetryCount:queue:withError:operation:", 0, a4, a5, a3);
}

- (void)cloudKitOperationWithRetryCount:(unint64_t)a3 queue:(id)a4 withError:(id)a5 operation:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  NSObject *v21;
  dispatch_time_t v22;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDB8EB8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IMTransferAgentNicknameController _retryIntervalForRetryCount:](self, "_retryIntervalForRetryCount:", a3);
    v16 = v15;
  }
  else
  {
    v16 = 0.0;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_22D98D9BC;
  v23[3] = &unk_24F97A5E8;
  v27 = a3;
  v23[4] = self;
  v17 = v10;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x22E31D724](v23);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v29 = a3;
      v30 = 2048;
      v31 = v16;
      _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Dispatching CloudKit operation with retry: %lu and retryInterval: %f", buf, 0x16u);
    }

  }
  if (v16 <= 0.0)
  {
    v20[2](v20);
  }
  else
  {
    v22 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    dispatch_after(v22, v17, v20);
  }

}

- (id)nickNamePublicDatabase
{
  void *v3;
  void *v4;
  NSObject *v6;
  uint8_t v7[16];

  if (IMSharedHelperNickNameEnabled())
  {
    -[IMTransferAgentNicknameController _nickNameContainer](self, "_nickNameContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publicCloudDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Nicknames NOT enabled, returning nil public database", v7, 2u);
      }

    }
    return 0;
  }
}

- (id)_nickNamePublicDB
{
  return (id)MEMORY[0x24BEDD108](self, sel_nickNamePublicDatabase);
}

- (id)_nickNameSaveConfiguration
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDB9188]);
  objc_msgSend(v2, "setQualityOfService:", 25);
  return v2;
}

- (id)_nickNameFetchConfiguration
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDB9188]);
  objc_msgSend(v2, "setQualityOfService:", 25);
  objc_msgSend(v2, "setPreferAnonymousRequests:", 1);
  return v2;
}

- (double)_retryIntervalForRetryCount:(unint64_t)a3
{
  return pow(1.5, (double)(4 - a3));
}

- (BOOL)_serverSaysToUseOldContainer
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("use-old-nickname-container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue") != 0;
  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getBoolFromDomain:forKey:", *MEMORY[0x24BE50FB0], CFSTR("UseOldProfilesContainer"));

  v7 = v6 | v4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("NO");
      v13 = 138412802;
      if (v7)
        v11 = CFSTR("YES");
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Server says to use new container? %@ {serverbagValue: %@ version: %@}", (uint8_t *)&v13, 0x20u);

    }
  }

  return v7;
}

- (id)_nickNameContainerIdentifier
{
  if (-[IMTransferAgentNicknameController _serverSaysToUseOldContainer](self, "_serverSaysToUseOldContainer"))
    return CFSTR("com.apple.internal.messages.memoji");
  else
    return CFSTR("com.apple.messages.profiles");
}

- (id)_nickNameContainer
{
  CKContainer *nickNameContainer;
  void *v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  CKContainer **p_nickNameContainer;
  CKContainer *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  nickNameContainer = self->_nickNameContainer;
  if (!nickNameContainer)
  {
    -[IMTransferAgentNicknameController _nickNameContainerIdentifier](self, "_nickNameContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IMTransferAgentNicknameController shouldUseDevNickNameContainer](self, "shouldUseDevNickNameContainer");
    v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v4;
          _os_log_impl(&dword_22D97D000, v7, OS_LOG_TYPE_INFO, "**** Initializing dev nick name container with ID %@", (uint8_t *)&v16, 0xCu);
        }

      }
      v8 = 2;
    }
    else
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v4;
          _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Initializing production container %@", (uint8_t *)&v16, 0xCu);
        }

      }
      v8 = 1;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9038]), "initWithContainerIdentifier:environment:", v4, v8);
    v11 = objc_alloc_init(MEMORY[0x24BDB9048]);
    objc_msgSend(v11, "setUseZoneWidePCS:", 1);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:options:", v10, v11);
    v14 = self->_nickNameContainer;
    p_nickNameContainer = &self->_nickNameContainer;
    *p_nickNameContainer = (CKContainer *)v12;

    nickNameContainer = *p_nickNameContainer;
  }
  return nickNameContainer;
}

- (BOOL)shouldUseDevNickNameContainer
{
  int v3;
  void *v4;
  char v5;

  v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    -[IMTransferAgentNicknameController lockdownManager](self, "lockdownManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInternalInstall");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)lockdownManager
{
  return (id)objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance");
}

- (id)_errorWrappingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("blastdoor"));

    if (v7)
    {
      v8 = v4;
    }
    else
    {
      objc_msgSend(v4, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v21 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(v4, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v4, "domain");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (const __CFString *)v15;
      else
        v17 = CFSTR("com.apple.nickname");
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v4, "code"), v13);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0BA0];
    v20 = CFSTR("Unknown error (inner error is nil).");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nickname"), 1, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (CKContainer)nickNameContainer
{
  return self->_nickNameContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickNameContainer, 0);
}

@end
