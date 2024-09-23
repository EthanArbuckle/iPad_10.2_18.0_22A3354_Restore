@implementation IMDCKAttachmentSyncController

+ (id)sharedInstance
{
  if (qword_1ED935C70 != -1)
    dispatch_once(&qword_1ED935C70, &unk_1E922A1A0);
  return (id)qword_1ED935DA0;
}

- (IMDCKAttachmentSyncController)initWithSyncTokenStore:(id)a3
{
  id v5;
  IMDCKAttachmentSyncController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ckQueue;
  uint64_t v9;
  IMDRecordZoneManager *recordZoneManager;
  IMDCKAttachmentSyncCKOperationFactory *v11;
  IMDCKAttachmentSyncCKOperationFactory *CKOperationFactory;
  NSMutableArray *v13;
  NSMutableArray *downloadAssetsForTransferGUIDs;
  NSMutableDictionary *v15;
  NSMutableDictionary *recordIDToTransferMap;
  NSMutableDictionary *v17;
  NSMutableDictionary *completionBlocksForAssetFetchOperations;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMDCKAttachmentSyncController;
  v6 = -[IMDCKAttachmentSyncController init](&v20, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.private.IMDCKAttachmentSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    v11 = objc_alloc_init(IMDCKAttachmentSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    v6->_deviceConditionsToCheck = 0;
    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    downloadAssetsForTransferGUIDs = v6->_downloadAssetsForTransferGUIDs;
    v6->_downloadAssetsForTransferGUIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recordIDToTransferMap = v6->_recordIDToTransferMap;
    v6->_recordIDToTransferMap = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionBlocksForAssetFetchOperations = v6->_completionBlocksForAssetFetchOperations;
    v6->_completionBlocksForAssetFetchOperations = v17;

    -[IMDCKAttachmentSyncController _migrateSyncToken](v6, "_migrateSyncToken");
  }

  return v6;
}

- (IMDCKAttachmentSyncController)init
{
  IMDCKSyncTokenStore *v3;
  IMDCKAttachmentSyncController *v4;

  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = -[IMDCKAttachmentSyncController initWithSyncTokenStore:](self, "initWithSyncTokenStore:", v3);

  return v4;
}

- (int64_t)syncControllerRecordType
{
  return 3;
}

- (id)recordStore
{
  if (qword_1EFC63CD8 != -1)
    dispatch_once(&qword_1EFC63CD8, &unk_1E922A1C0);
  return (id)qword_1EFC63CD0;
}

- (void)_needsToMarkAllAttachmentsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 0, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37970]);

}

- (BOOL)_shouldMarkAllAttachmentsAsNeedingSync
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
    v5 = objc_msgSend(v6, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37970]) ^ 1;

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
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "_shouldMarkAllAttachmentsAsNeedingSync %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (void)_hasMarkedAllAttachmentsAsNeedingSync
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forDomain:forKey:", 1, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37970]);

}

- (int64_t)_numberOfBatchesOfAttachmentsToFetchInInitialSync
{
  void *v3;
  char v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInCloudKitDemoMode");

  if ((v4 & 1) != 0)
    return 1;
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ck-max-number-of-attachment-batches"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "integerValue") >= 1)
  {
    v5 = objc_msgSend(v8, "integerValue");
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, " overriding max number of attachment batches to fetch %@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  else
  {
    v5 = 50;
  }

  return v5;
}

- (BOOL)_shouldMarkAttachmentsAsNeedingReupload
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37488]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    v5 = v3;
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7;

    v9 = v8 > 604800.0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_markAllFailedAttachmentsAsNeedingSync
{
  _BOOL8 v2;
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[IMDCKAttachmentSyncController _shouldMarkAttachmentsAsNeedingReupload](self, "_shouldMarkAttachmentsAsNeedingReupload");
  v3 = v2;
  v4 = IMOSLoggingEnabled(v2);
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Marking any unsuccessfully synced attachments as needing sync", (uint8_t *)&v11, 2u);
      }

    }
    v6 = IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync();
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Finished Marking any unsuccessfully synced attachments as needing sync", (uint8_t *)&v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      IMGetCachedDomainValueForKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Not marking unsuccessful attachments as needing sync. Last attempt date %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (int64_t)_numberOfMetadataBatchesOfAttachmentsToFetchInInitialSync
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInCloudKitDemoMode");

  if (v4)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "overriding max number of attachment metadata batches to fetch as this is in demo mode.", (uint8_t *)&v14, 2u);
      }

    }
    return 1;
  }
  else
  {
    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverBag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ck-max-number-of-attachment-metadata-batches"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "integerValue") >= 1)
    {
      v7 = objc_msgSend(v10, "integerValue");
      if (IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v12;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "overriding max number of attachment metadata batches to fetch %@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
    else
    {
      v7 = 5;
    }

  }
  return v7;
}

- (void)syncAttachmentsWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;
  unint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD aBlock[5];
  id v33;
  int64_t v34;
  uint8_t buf[4];
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a3;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Initiating attachment syncing with type %ld", buf, 0xCu);
    }

  }
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D148F738;
  aBlock[3] = &unk_1E922A1E8;
  v33 = v11;
  v34 = a3;
  aBlock[4] = self;
  v14 = v11;
  v15 = _Block_copy(aBlock);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = sub_1D148F8F0;
  v29[3] = &unk_1E922A210;
  v29[4] = self;
  v16 = v10;
  v30 = v16;
  v17 = v15;
  v31 = v17;
  v18 = _Block_copy(v29);
  -[IMDCKAbstractSyncController resetRecordCounts](self, "resetRecordCounts");
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_1D148FA74;
  v23[3] = &unk_1E922A260;
  v27 = a3;
  v28 = a4;
  v23[4] = self;
  v24 = v16;
  v25 = v17;
  v26 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  dispatch_async(v19, v23);

}

- (void)fetchAttachmentDataForTransfers:(id)a3 highQuality:(BOOL)a4 perTransferProgress:(id)a5 activity:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  IMDCKAttachmentSyncController *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v10 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = CFSTR("NO");
      if (v10)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v30 = v12;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "fetchAttachmentDataForTransferGUIDs %@ HQ %@", buf, 0x16u);
    }

  }
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D148FFAC;
  block[3] = &unk_1E922A2F0;
  v24 = v12;
  v25 = self;
  v27 = v13;
  v28 = v15;
  v26 = v14;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v12;
  dispatch_async(v18, block);

}

- (void)acceptFileTransfer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "accepting file transfer %@", buf, 0xCu);
    }

  }
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D1490670;
  aBlock[3] = &unk_1E922A318;
  v10 = v6;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  v16 = v9;
  v17 = 3221225472;
  v18 = sub_1D14907FC;
  v19 = &unk_1E922A340;
  v20 = v10;
  v21 = v7;
  v12 = v10;
  v13 = v7;
  v14 = _Block_copy(&v16);
  v24 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAttachmentSyncController fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:](self, "fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:", v15, 0, v11, 0, v14);

}

- (void)acceptFileTransfers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "accepting file transfers %@", buf, 0xCu);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D14909E0;
  aBlock[3] = &unk_1E922A368;
  v12 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  -[IMDCKAttachmentSyncController fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:](self, "fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:", v6, 0, 0, 0, v10);

}

- (BOOL)_attachmentDownloadCanStart:(BOOL)a3 withActivity:(id)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  BOOL v15;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;

  v4 = a3;
  v6 = a4;
  v7 = -[IMDCKAttachmentSyncController __shouldOptimizeAttachmentDefault](self, "__shouldOptimizeAttachmentDefault");
  if (!v4 && v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 0;
        v9 = "Won't download assets, we are optimizing attachment storage.";
        v10 = (uint8_t *)&v20;
LABEL_19:
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  -[IMDCKAttachmentSyncController _attachmentZoneSalt](self, "_attachmentZoneSalt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v19 = 0;
        v9 = "We have a nil salt so we can't download assets anyway -- bailing";
        v10 = (uint8_t *)&v19;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v13 = -[IMDCKAttachmentSyncController assetDownloadInProgress](self, "assetDownloadInProgress");
  if (v13)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v18 = 0;
        v9 = "CloudKit Asset download already in progress, ignoring request";
        v10 = (uint8_t *)&v18;
        goto LABEL_19;
      }
LABEL_20:

    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v14 = -[IMDCKAttachmentSyncController _deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:activity:](self, "_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:activity:", v4, v6);
  if (!v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 0;
        v9 = "Won't download download assets, we don't meet the resource conditions currently";
        v10 = (uint8_t *)&v17;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v15 = 1;
LABEL_22:

  return v15;
}

- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 completion:(id)a7
{
  -[IMDCKAttachmentSyncController _downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:](self, "_downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:", a3, a4, a5, a6, 0, a7);
}

- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 transfers:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  IMDCKAttachmentSyncController *v42;
  id v43;
  id v44;
  uint64_t *v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v14 = a7;
  v32 = a8;
  -[IMDCKAttachmentSyncController setAssetDownloadInProgress:](self, "setAssetDownloadInProgress:", 1);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = a6;
  v33 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v15 = v14;
  }
  else
  {
    -[IMDCKAttachmentSyncController __databaseRequestForAttachmentsWithAssets](self, "__databaseRequestForAttachmentsWithAssets", v30);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v15;
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v34, "count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v54 = v17;
      v55 = 2112;
      v56 = v18;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Starting attachment download batch with %lu items retries %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v34, "count", v30))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D149100C;
    aBlock[3] = &unk_1E922A3B8;
    v45 = &v48;
    v19 = v34;
    v40 = v19;
    v41 = v14;
    v42 = self;
    v46 = a5;
    v47 = a4;
    v20 = v31;
    v43 = v20;
    v44 = v32;
    v21 = _Block_copy(aBlock);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[IMDCKAttachmentSyncController fileTransferCenter](self, "fileTransferCenter");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "guid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addTransfer:forGUID:", v26, v28);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      }
      while (v23);
    }

    -[IMDCKAttachmentSyncController fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:](self, "fetchAttachmentDataForTransfers:highQuality:perTransferProgress:activity:completion:", v22, 0, 0, v20, v21);
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "No assets to downloand", buf, 2u);
      }

    }
    -[IMDCKAttachmentSyncController setAssetDownloadInProgress:](self, "setAssetDownloadInProgress:", 0);
    if (v32)
      (*((void (**)(id, uint64_t, uint64_t, _QWORD))v32 + 2))(v32, 1, v49[3], 0);
  }

  _Block_object_dispose(&v48, 8);
}

- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[IMDCKAttachmentSyncController _attachmentDownloadCanStart:withActivity:](self, "_attachmentDownloadCanStart:withActivity:", v6, v8))
  {
    -[IMDCKAttachmentSyncController __databaseRequestForAttachmentsWithAssets](self, "__databaseRequestForAttachmentsWithAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D14919D4;
    v11[3] = &unk_1E922A3E0;
    v12 = v9;
    -[IMDCKAttachmentSyncController _downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:](self, "_downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:", v8, v6, 0, 0, v10, v11);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4
{
  -[IMDCKAttachmentSyncController downloadAttachmentAssetsWithActivity:restoringAttachments:completion:](self, "downloadAttachmentAssetsWithActivity:restoringAttachments:completion:", a3, a4, 0);
}

- (id)purgedAttachmentsForChat:(id)a3 services:(id)a4 limit:(int64_t)a5
{
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = (uint64_t)v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "purgedAttachmentsForChat Request to download purged assets for chats %@ on services %@", buf, 0x16u);
    }

  }
  v7 = (void *)IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices();
  v8 = IMOSLoggingEnabled(v7);
  if (v7)
  {
    if (!v8)
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v29 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Got %lu purged assets to download", buf, 0xCu);
    }
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "No assets that have been purged", buf, 2u);
    }
  }

LABEL_14:
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = IMFileTransferFromIMDAttachmentRecordRef((uint64_t)v16);
        if (v17)
        {
          objc_msgSend(v11, "addObject:", v17);
        }
        else
        {
          v18 = objc_msgSend(v16, "rowID");
          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v29 = v18;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as synced ***", buf, 0xCu);
            }

          }
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  return v11;
}

- (unint64_t)purgedAttachmentsCountForChatsWithChatIdentifiers:(id)a3 services:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = (unint64_t)v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "purgedAttachmentsCountForChat Request to get count of purged assets for chats %@ on services %@", (uint8_t *)&v16, 0x16u);
    }

  }
  v8 = (void *)IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v16 = 134217984;
        v17 = v11;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Got %lu purged assets to download", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "No assets that have been purged", (uint8_t *)&v16, 2u);
      }

    }
    v11 = 0;
  }

  return v11;
}

- (void)downloadAttachmentAssetsForChatIDs:(id)a3 services:(id)a4 style:(unsigned __int8)a5 completion:(id)a6
{
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v19 = a6;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v24;
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Request to download purged assets for chats %@ on services %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("ck-client-download-purged-attachments-batch-size"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v25, "intValue") >= 1)
    v9 = (int)objc_msgSend(v25, "intValue");
  else
    v9 = 10;
  -[IMDCKAttachmentSyncController purgedAttachmentsForChat:services:limit:](self, "purgedAttachmentsForChat:services:limit:", v24, v23, v9);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v12 = v11;
  if (v11)
  {
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        v11 = IMOSLoggingEnabled(v11);
        if ((_DWORD)v11)
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v15;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Got %@", buf, 0xCu);
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v12 = v11;
    }
    while (v11);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D14922E0;
  v26[3] = &unk_1E922A408;
  v27 = v24;
  v28 = v20;
  v17 = v20;
  v18 = v24;
  -[IMDCKAttachmentSyncController _downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:](self, "_downloadAttachmentAssetsWithActivity:restoringAttachments:retryCount:numAttachmentsDownloaded:transfers:completion:", 0, 0, 0, 0, v10, v26);

}

- (id)__databaseRequestForAttachmentsWithAssets
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMDCKAttachmentSyncController _numberOfAttachmentsToDownload](self, "_numberOfAttachmentsToDownload");
  v2 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v2;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Found records to donwload {%@}", buf, 0xCu);
    }

  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = IMFileTransferFromIMDAttachmentRecordRef((uint64_t)v9);
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          v11 = objc_msgSend(v9, "rowID");
          if (IMOSLoggingEnabled(v11))
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v20 = v11;
              _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as failed to sync ***", buf, 0xCu);
            }

          }
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_ckUtilitiesInstance
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[IMDCKAttachmentSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"))
  {
    if (a4 == -1)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This is a periodic sync and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 2u);
        }
        goto LABEL_12;
      }
LABEL_13:
      -[IMDCKAttachmentSyncController setDeviceConditionsToCheck:](self, "setDeviceConditionsToCheck:", 1);
      return;
    }
    if ((a4 & 0x8000000000000000) == 0 && a3 > a4)
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412546;
          v11 = v8;
          v12 = 2112;
          v13 = v9;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "This is an initial sync but current batch count [%@] >= maxBatchCount [%@] and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 0x16u);

        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5
{
  id v8;

  v8 = a5;
  -[IMDCKAttachmentSyncController _updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:maxBatchCount:](self, "_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:maxBatchCount:", a3, a4);
  LOBYTE(a4) = -[IMDCKAttachmentSyncController _deviceConditionsAllowsMessageSyncWithActivity:](self, "_deviceConditionsAllowsMessageSyncWithActivity:", v8);

  return a4;
}

- (BOOL)_deviceConditionsAllowsMessageSyncWithActivity:(id)a3
{
  return -[IMDCKAttachmentSyncController _deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:activity:](self, "_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:activity:", 0, a3);
}

- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3 activity:(id)a4
{
  _xpc_activity_s *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  _BOOL8 should_defer;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_activity_s *)a4;
  -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cloudKitSyncingEnabled");

  if (a3 || v8)
  {
    -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "iCloudAccountMatchesiMessageAccount");

    if (!v6)
      goto LABEL_16;
  }
  else
  {
    v9 = 0;
    if (!v6)
      goto LABEL_16;
  }
  should_defer = xpc_activity_should_defer(v6);
  if (v9 & should_defer)
  {
    if (IMOSLoggingEnabled(should_defer))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", (uint8_t *)&v24, 2u);
      }

    }
    v13 = xpc_activity_set_state(v6, 3);
    if (!v13 && IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", (uint8_t *)&v24, 2u);
      }

    }
    goto LABEL_33;
  }
LABEL_16:
  if (!v9)
    goto LABEL_34;
  v15 = -[IMDCKAttachmentSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck");
  if (v6 || !v15)
    goto LABEL_34;
  v16 = -[IMDCKAttachmentSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck");
  if (v16 == 2)
  {
    -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isDeviceOnWifi");
    goto LABEL_23;
  }
  if (v16 == 1)
  {
    -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "deviceConditionsAllowPeriodicSync");
LABEL_23:
    v19 = v18;

    goto LABEL_25;
  }
  v19 = 0;
LABEL_25:
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      if (v19)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMDCKAttachmentSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v21;
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Attachment sync: device conditions allow sync: %@ deviceConditionsToCheck %@", (uint8_t *)&v24, 0x16u);

    }
  }
  if (!v19)
LABEL_33:
    LOBYTE(v9) = 0;
LABEL_34:

  return v9;
}

- (id)_attachmentZoneID
{
  void *v2;
  void *v3;

  -[IMDCKAttachmentSyncController recordZoneManager](self, "recordZoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentRecordZoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
}

- (id)_attachmentZoneSalt
{
  void *v2;
  void *v3;

  -[IMDCKAttachmentSyncController _recordKeyManagerSharedInstance](self, "_recordKeyManagerSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSalt");
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

- (unint64_t)_numberOfAttachmentsToDownload
{
  return 20;
}

- (unint64_t)_numberOfAttachmentsToWriteUp
{
  return 20;
}

- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersToForceMarkAsSync:(id)a3 transfersToSyncRowIDs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v9 = 0;
    v10 = *(_QWORD *)v27;
    *(_QWORD *)&v8 = 138412546;
    v22 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "guid", v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "updateTemporaryTransferGUIDsIfNeeded:transfersToSync:", v12, v6);

        if (v15)
        {
          if (IMOSLoggingEnabled(v16))
          {
            OSLogHandleForIMFoundationCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "guid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v22;
              v31 = v13;
              v32 = 2112;
              v33 = v18;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Fixed up guid for transfer old guid: %@ new guid: %@", buf, 0x16u);

            }
          }
        }
        else if (IMFileTransferGUIDIsTemporary())
        {
          objc_msgSend(v25, "objectAtIndexedSubscript:", v9 + i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled(v19))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v31 = v13;
              v32 = 2112;
              v33 = v19;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "******** Marking attachment with final failure, as we could not update it's guid %@ (rowid %@)", buf, 0x16u);
            }

          }
          -[IMDCKAttachmentSyncController _markAttachmentWithROWID:withSyncState:](self, "_markAttachmentWithROWID:withSyncState:", objc_msgSend(v19, "longLongValue"), 64);
          objc_msgSend(v24, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      v9 += i;
    }
    while (v7);
  }

  return v24;
}

- (id)_fetchAndPrepareRecordsToWrite:(BOOL *)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  void *v50;
  unint64_t v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD block[5];
  id v63;
  id v64;
  _BYTE *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  _BYTE v74[128];
  uint8_t v75[128];
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDCKAttachmentSyncController _numberOfAttachmentsToWriteUp](self, "_numberOfAttachmentsToWriteUp");
  v6 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  v7 = objc_msgSend(v6, "count");
  if (a3)
    *a3 = v7 < v5;
  v51 = v7;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v67 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v14 = IMFileTransferFromIMDAttachmentRecordRef((uint64_t)v13);
        if (v14)
        {
          objc_msgSend(v8, "addObject:", v14);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "rowID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        else
        {
          if (IMOSLoggingEnabled(0))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = objc_msgSend(v13, "rowID");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v17;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as clean ***", buf, 0xCu);
            }

          }
          objc_msgSend(v13, "rowID");
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v10);
  }

  v19 = IMOSLoggingEnabled(v18);
  if ((_DWORD)v19)
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Got %lu dirty results to sync, filtered to %lu", buf, 0x16u);
    }

  }
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Fixing up attachment GUIDs if needed", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v77 = sub_1D1493754;
  v78 = sub_1D1493764;
  v79 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D149376C;
  block[3] = &unk_1E922A430;
  v65 = buf;
  block[4] = self;
  v52 = v8;
  v63 = v52;
  v49 = v9;
  v64 = v49;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v23 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
  if (v23)
  {
    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v70 = 0;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Removing attachments that were marked as clean ", v70, 2u);
      }

    }
    objc_msgSend(v52, "removeObjectsInArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v49);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v25 = v52;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    v27 = v26;
    if (v26)
    {
      v28 = *(_QWORD *)v59;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v59 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v29);
          v26 = IMOSLoggingEnabled(v26);
          if ((_DWORD)v26)
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v70 = 138412290;
              v71 = v30;
              _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Transfer to sync %@ ", v70, 0xCu);
            }

          }
          ++v29;
        }
        while (v27 != v29);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
        v27 = v26;
      }
      while (v26);
    }

  }
  if (objc_msgSend(v52, "count", v49))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v33 = v52;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v55 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[IMDCKAttachmentSyncController recordZoneManager](self, "recordZoneManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "attachmentRecordZoneID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDCKAttachmentSyncController _attachmentZoneSalt](self, "_attachmentZoneSalt");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v37, "copyCKRecordRepresentationWithZoneID:salt:", v39, v40);

          if (v41)
            objc_msgSend(v32, "addObject:", v41);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
      }
      while (v34);
    }

    -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "newfilteredArrayRemovingCKRecordDupes:", v32);

    if (IMOSLoggingEnabled(v44))
    {
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = objc_msgSend(v32, "count");
        v47 = objc_msgSend(v43, "count");
        *(_DWORD *)v70 = 134218240;
        v71 = v46;
        v72 = 2048;
        v73 = v47;
        _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Got %lu records to sync, filtered to %lu unique records", v70, 0x16u);
      }

    }
  }
  else
  {
    v43 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v43;
}

- (void)_writeAttachmentsToCloudKitWithActivity:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  unint64_t v20;
  NSObject *v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  IMDCKAttachmentSyncController *v27;
  id v28;
  id v29;
  char v30;
  unsigned __int8 v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Writing up a batch of attachments to cloudKit", buf, 2u);
    }

  }
  v9 = -[IMDCKAttachmentSyncController _deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:](self, "_deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:", 1, -1, v6);
  if (v9)
  {
    -[IMDCKAbstractSyncController setBroadcastedSyncStateToUploading](self, "setBroadcastedSyncStateToUploading");
    v31 = 0;
    -[IMDCKAttachmentSyncController _fetchAndPrepareRecordsToWrite:](self, "_fetchAndPrepareRecordsToWrite:", &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v31;
    if (v11)
    {
      if (v31 && IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = objc_msgSend(v10, "count");
          v15 = -[IMDCKAttachmentSyncController _numberOfAttachmentsToWriteUp](self, "_numberOfAttachmentsToWriteUp");
          *(_DWORD *)buf = 134218240;
          v33 = v14;
          v34 = 2048;
          v35 = v15;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "*** This is the last batch of attachments to write up. Number of records to write %lu < max batch size %lu", buf, 0x16u);
        }

      }
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_1D1493C30;
      v25[3] = &unk_1E922A458;
      v29 = v7;
      v30 = v12;
      v26 = v10;
      v27 = self;
      v28 = v6;
      -[IMDCKAttachmentSyncController _writeCKRecordsToAttachmentZone:activity:withCompletion:](self, "_writeCKRecordsToAttachmentZone:activity:withCompletion:", v26, v28, v25);

    }
    else
    {
      v18 = IMOSLoggingEnabled(0);
      if (v12)
      {
        if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = -[IMDCKAttachmentSyncController _numberOfAttachmentsToWriteUp](self, "_numberOfAttachmentsToWriteUp");
            *(_DWORD *)buf = 134217984;
            v33 = v20;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Failed to write any of these %lu dirty attachments, looks like there's nothing left to do", buf, 0xCu);
          }

        }
        if (v7)
          (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      }
      else
      {
        if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = -[IMDCKAttachmentSyncController _numberOfAttachmentsToWriteUp](self, "_numberOfAttachmentsToWriteUp");
            *(_DWORD *)buf = 134217984;
            v33 = v22;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Failed to write any of these %lu dirty attachments, looking for more attachments to write", buf, 0xCu);
          }

        }
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = sub_1D1493F30;
        v23[3] = &unk_1E9227FA8;
        v24 = v7;
        -[IMDCKAttachmentSyncController _kickOffWriteOnCKQueueWithActivity:completion:](self, "_kickOffWriteOnCKQueueWithActivity:completion:", v6, v23);

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Device conditions dont allow us to sync", buf, 2u);
      }

    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CB8], 4, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v17);

    }
  }

}

- (void)_fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 ognSuffix:(id)a5 removeTombstones:(BOOL)a6 activity:(id)a7 completion:(id)a8
{
  id v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  BOOL v34;
  _QWORD v35[5];
  _QWORD v36[5];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (__CFString *)a5;
  v30 = a7;
  v16 = a8;
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Fetching assets for %@", buf, 0xCu);
    }

  }
  v18 = v15;
  if (v15)
    goto LABEL_8;
  if (-[IMDCKAttachmentSyncController isDoingDeleteRecoverySync](self, "isDoingDeleteRecoverySync"))
  {
    v18 = CFSTR("-DRR");
LABEL_8:
    objc_msgSend(CFSTR("OptimizeRedownload"), "stringByAppendingString:", v18, v30);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v19 = CFSTR("OptimizeRedownload");
LABEL_9:
  -[IMDCKAttachmentSyncController CKOperationFactory](self, "CKOperationFactory", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchAttachmentZoneRecords:desiredKeys:operationGroupName:activity:", v14, a4, v19, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1D1494234;
  v36[3] = &unk_1E922A480;
  v36[4] = self;
  objc_msgSend(v21, "setPerRecordProgressBlock:", v36);
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = sub_1D1494240;
  v35[3] = &unk_1E922A4A8;
  v35[4] = self;
  objc_msgSend(v21, "setPerRecordCompletionBlock:", v35);
  objc_msgSend(v21, "operationID");
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = sub_1D1494254;
  v32[3] = &unk_1E922A4D0;
  v34 = a6;
  v32[4] = self;
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v33;
  objc_msgSend(v21, "setFetchRecordsCompletionBlock:", v32);
  if (v16)
  {
    -[IMDCKAttachmentSyncController completionBlocksForAssetFetchOperations](self, "completionBlocksForAssetFetchOperations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v16, "copy");
    v26 = _Block_copy(v25);
    objc_msgSend(v21, "operationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v26, v27);

  }
  +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "manateeDataBase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addOperation:", v21);

}

- (BOOL)_fetchedAllChangesFromCloudKit
{
  return IMGetDomainBoolForKey();
}

- (int)_resyncForDeleteRecoveryState
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37690]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)_hasCompletedRecoveryResync
{
  return -[IMDCKAttachmentSyncController _resyncForDeleteRecoveryState](self, "_resyncForDeleteRecoveryState") == 2;
}

- (void)_initResyncForDeleteRecovery
{
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[IMDCKAttachmentSyncController _resyncForDeleteRecoveryState](self, "_resyncForDeleteRecoveryState");
  v4 = v3;
  if ((int)v3 <= 0)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Starting Delete Recovery Resync", buf, 2u);
      }

    }
    -[IMDCKAttachmentSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 3);
    -[IMDCKAttachmentSyncController _markResyncForDeleteRecoveryAs:](self, "_markResyncForDeleteRecoveryAs:", 1);
  }
  if (-[IMDCKAttachmentSyncController _resyncForDeleteRecoveryState](self, "_resyncForDeleteRecoveryState") < 1
    || -[IMDCKAttachmentSyncController _resyncForDeleteRecoveryState](self, "_resyncForDeleteRecoveryState") > 1)
  {
    -[IMDCKAttachmentSyncController setIsDoingDeleteRecoverySync:](self, "setIsDoingDeleteRecoverySync:", 0);
  }
  else
  {
    v6 = -[IMDCKAttachmentSyncController setIsDoingDeleteRecoverySync:](self, "setIsDoingDeleteRecoverySync:", 1);
    if (v4 >= 1 && IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Continuing Delete Recovery Resync", v8, 2u);
      }

    }
  }
}

- (void)_markResyncForDeleteRecoveryAs:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forDomain:forKey:", v4, *MEMORY[0x1E0D37950], *MEMORY[0x1E0D37690]);

}

- (void)_fetchAttachmentZoneChangesShouldWriteBackChanges:(BOOL)a3 desiredKeys:(int64_t)a4 syncType:(int64_t)a5 currentBatchCount:(int64_t)a6 maxBatchCount:(int64_t)a7 syncToken:(id)a8 activity:(id)a9 completionBlock:(id)a10
{
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  BOOL v21;
  int v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  int64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL8 v31;
  NSObject *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void (**v40)(void);
  NSObject *v41;
  id v43;
  int v44;
  void (**v45)(void);
  void *v47;
  id v48;
  _QWORD v49[5];
  void (**v50)(void);
  _QWORD v51[5];
  id v52;
  void (**v53)(void);
  int64_t v54;
  int64_t v55;
  int64_t v56;
  int64_t v57;
  BOOL v58;
  _QWORD v59[5];
  _QWORD v60[5];
  uint8_t buf[4];
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v43 = a8;
  v48 = a9;
  v45 = (void (**)(void))a10;
  if (IMOSLoggingEnabled(v45))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v62 = v15;
      v63 = 2112;
      v64 = v16;
      v65 = 2112;
      v66 = v17;
      v67 = 2112;
      v68 = &unk_1E9271050;
      v69 = 2112;
      v70 = v43;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Fetching attachment batch count %@ (max: %@) syncType %@ batch size %@ token %@", buf, 0x34u);

    }
  }
  v18 = CFSTR("AttachmentSync");
  if (a5 == 1)
    v18 = CFSTR("PeriodicSync");
  if (!a5)
    v18 = CFSTR("FullRestore");
  v47 = (void *)v18;
  v19 = -[IMDCKAttachmentSyncController isDoingDeleteRecoverySync](self, "isDoingDeleteRecoverySync");
  if ((_DWORD)v19)
  {
    objc_msgSend(v47, "stringByAppendingString:", CFSTR("-DRR"));
    v19 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v19;
  }
  v21 = a7 >= 0 && a6 >= a7 && a5 == 0;
  v22 = v21;
  v44 = v22;
  if (v21 && IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "*** Exceeded max number of attachment batches to fetch. Stopping attachment fetch ***", buf, 2u);
    }

  }
  +[IMDCKCacheDeleteManager sharedInstance](IMDCKCacheDeleteManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "canWriteFileOfEstimatedSize:refreshCachedValue:", 819200, a6 % 0x64uLL == 0);

  v26 = a4;
  if (a5 == 1)
  {
    v26 = a4;
    if (!-[IMDCKAttachmentSyncController _fetchedAllChangesFromCloudKit](self, "_fetchedAllChangesFromCloudKit"))
    {
      +[IMDCKCacheDeleteManager sharedInstance](IMDCKCacheDeleteManager, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "shouldDownloadAssetsOfSize:refreshCachedValue:", 819200, a6 % 0x64uLL == 0);

      v26 = a4;
      if (v28)
      {
        if (IMOSLoggingEnabled(v29))
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Downloading asset while performing periodic syncing with cloudkit", buf, 2u);
          }

        }
        v26 = 1;
      }
    }
  }
  v31 = -[IMDCKAttachmentSyncController _deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:](self, "_deviceConditionsAllowsMessageSyncForCurrentBatchCount:maxBatchCount:activity:", a6, a7, v48);
  if (v44 | !(v31 & v25))
  {
    if (IMOSLoggingEnabled(v31))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = CFSTR("YES");
        if (v44)
          v34 = CFSTR("NO");
        else
          v34 = CFSTR("YES");
        if (!v25)
          v33 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v62 = v34;
        v63 = 2112;
        v64 = v33;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Device conditions dont allow sync OR continueFetching %@. Disk Space Available: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CB8], 4, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v44)
    {

      v36 = 0;
    }
    if (v45)
      v45[2]();
  }
  else
  {
    -[IMDCKAbstractSyncController setBroadcastedSyncStateToDownloading](self, "setBroadcastedSyncStateToDownloading");
    -[IMDCKAttachmentSyncController CKOperationFactory](self, "CKOperationFactory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKAttachmentSyncController _attachmentZoneID](self, "_attachmentZoneID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "fetchAttachmentZoneChangesCKOperationUsingToken:zoneID:resultsLimit:desiredKeys:operationGroupName:activity:", v43, v38, 20, v26, v47, v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = sub_1D1494BB8;
    v60[3] = &unk_1E922A4F8;
    v60[4] = self;
    objc_msgSend(v36, "setRecordChangedBlock:", v60);
    objc_msgSend(v36, "setRecordZoneChangeTokensUpdatedBlock:", &unk_1E922A538);
    v59[0] = v39;
    v59[1] = 3221225472;
    v59[2] = sub_1D1494C84;
    v59[3] = &unk_1E922A560;
    v59[4] = self;
    objc_msgSend(v36, "setRecordWithIDWasDeletedBlock:", v59);
    v51[0] = v39;
    v51[1] = 3221225472;
    v51[2] = sub_1D1494C90;
    v51[3] = &unk_1E922A588;
    v58 = a3;
    v51[4] = self;
    v54 = a4;
    v55 = a5;
    v56 = a6;
    v57 = a7;
    v52 = v48;
    v40 = v45;
    v53 = v40;
    objc_msgSend(v36, "setRecordZoneFetchCompletionBlock:", v51);
    v49[0] = v39;
    v49[1] = 3221225472;
    v49[2] = sub_1D1494CE4;
    v49[3] = &unk_1E922A5B0;
    v49[4] = self;
    v50 = v40;
    if (IMOSLoggingEnabled(objc_msgSend(v36, "setFetchRecordZoneChangesCompletionBlock:", v49)))
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Scheduling a fetch operation from attachment zone", buf, 2u);
      }

    }
    -[IMDCKAttachmentSyncController _scheduleOperation:](self, "_scheduleOperation:", v36);

  }
}

- (void)_writeCKRecordsToAttachmentZone:(id)a3 activity:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[IMDCKAttachmentSyncController _fetchedAllChangesFromCloudKit](self, "_fetchedAllChangesFromCloudKit");
  v12 = CFSTR("BackfillAttachmentSync");
  if (v11)
    v12 = CFSTR("PeriodicAttachmentSync");
  v13 = v12;
  if (-[IMDCKAttachmentSyncController isDoingDeleteRecoverySync](self, "isDoingDeleteRecoverySync"))
  {
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", CFSTR("-DRR"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v14;
  }
  -[IMDCKAttachmentSyncController CKOperationFactory](self, "CKOperationFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveAttachmentsCKOperationUsingRecordsToSave:operationGroupName:activity:", v8, v13, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPerRecordProgressBlock:", &unk_1E922A5F0);
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1D1494F58;
  v23[3] = &unk_1E922A618;
  v23[4] = self;
  objc_msgSend(v16, "setPerRecordCompletionBlock:", v23);
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = sub_1D1494F68;
  v21[3] = &unk_1E92291C0;
  v21[4] = self;
  v18 = v10;
  v22 = v18;
  if (IMOSLoggingEnabled(objc_msgSend(v16, "setModifyRecordsCompletionBlock:", v21)))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Attempting to write %@ records to truth zone ", buf, 0xCu);

    }
  }
  -[IMDCKAttachmentSyncController _scheduleOperation:](self, "_scheduleOperation:", v16);

}

- (BOOL)_attachmentZoneCreated
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
  -[IMDCKAttachmentSyncController recordZoneManager](self, "recordZoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D1495108;
  v12[3] = &unk_1E92291E8;
  v14 = &v15;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "createAttachmentZoneIfNeededWithCompletionBlock:", v12);

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
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "***** Timed out creating attachment zone *******", v11, 2u);
      }

    }
  }
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)deleteAttachmentSyncToken
{
  void *v3;
  void *v4;
  id v5;

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logCollectorAddress");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:reasonString:", CFSTR("ChangeTokenExpired"), 1, 0, v5, CFSTR("ChangeTokenExpired"));

  -[IMDCKAttachmentSyncController setLatestSyncToken:forSyncType:](self, "setLatestSyncToken:forSyncType:", 0, 1);
  -[IMDCKAttachmentSyncController setLatestSyncToken:forSyncType:](self, "setLatestSyncToken:forSyncType:", 0, 5);

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
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Kicking off an attachment write after fetching messages", buf, 2u);
    }

  }
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14953C8;
  block[3] = &unk_1E92290F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  __int16 v20[8];
  uint8_t buf[16];

  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v10, "shouldKickOffWriteForSyncType:", a3);

  if (!(_DWORD)a3)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20[0] = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Not writing up messages as sync type does not allow it", (uint8_t *)v20, 2u);
      }

    }
    if (v9)
      v9[2](v9, 1, 0);
    goto LABEL_16;
  }
  -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isLocalCachedSaltPresent");

  if (!v13)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not kicking off a write because cachedSalt is not present.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CB8], 7, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);

    }
LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
  -[IMDCKAttachmentSyncController _kickOffWriteOnCKQueueWithActivity:completion:](self, "_kickOffWriteOnCKQueueWithActivity:completion:", v8, v9);
  v15 = 1;
LABEL_17:

  return v15;
}

- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 shouldWriteBackChanges:(BOOL)a7 desiredKeys:(int64_t)a8 syncType:(int64_t)a9 error:(id)a10 currentBatchCount:(int64_t)a11 maxBatchCount:(int64_t)a12 activity:(id)a13 completionBlock:(id)a14
{
  _BOOL4 v14;
  __CFString *v18;
  void (**v19)(id, _QWORD, id);
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  int64_t v39;
  uint64_t v40;
  __CFString *v43;
  id v44;
  id v45;
  __CFString *v46;
  _QWORD v47[5];
  id v48;
  void (**v49)(id, _QWORD, id);
  int64_t v50;
  int64_t v51;
  int64_t v52;
  uint64_t v53;
  BOOL v54;
  _QWORD block[4];
  __CFString *v56;
  IMDCKAttachmentSyncController *v57;
  id v58;
  void (**v59)(id, _QWORD, id);
  int64_t v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  BOOL v64;
  BOOL v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  __CFString *v75;
  uint64_t v76;

  v14 = a6;
  v76 = *MEMORY[0x1E0C80C00];
  v46 = (__CFString *)a3;
  v43 = (__CFString *)a4;
  v44 = a5;
  v18 = (__CFString *)a10;
  v45 = a13;
  v19 = (void (**)(id, _QWORD, id))a14;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v67 = v43;
      if (v14)
        v21 = CFSTR("YES");
      v68 = 2112;
      v69 = v46;
      v70 = 2112;
      v71 = v44;
      v72 = 2112;
      v73 = v21;
      v74 = 2112;
      v75 = v18;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@ moreComing %@ recordZoneError %@", buf, 0x34u);
    }

  }
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "errorIndicatesZoneNotCreated:", v18);

  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "errorIndicatesUserDeletedZone:", v18);

  v39 = a12;
  if (v18)
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "CKPartialError:hasErrorCode:", v18, &unk_1E9271068);

    if (v27)
    {
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "We got back a change token has expired for processing the record zone for attachments going to try and fetch again", buf, 2u);
        }

      }
      -[IMDCKAttachmentSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 17, a12);
      if (v19)
LABEL_38:
        v19[2](v19, 0, v18);
    }
    else
    {
      v31 = IMOSLoggingEnabled(v28);
      if (!(v23 | v25))
      {
        if ((_DWORD)v31)
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v18;
            _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "//---*** Error fetching attachments from CloudKit with error: %@ ---- ***//", buf, 0xCu);
          }

        }
        goto LABEL_38;
      }
      if ((_DWORD)v31)
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = CFSTR("zone not created");
          if (v25)
            v33 = CFSTR("user deleted zone");
          *(_DWORD *)buf = 138412546;
          v67 = v33;
          v68 = 2112;
          v69 = v18;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "We got a %@ error while fetching attachments. %@", buf, 0x16u);
        }

      }
      if (v25)
      {
        if (IMOSLoggingEnabled(v31))
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Resetting local attachment sync state & last sync date after received user deleted zone error", buf, 2u);
          }

        }
        -[IMDCKAttachmentSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 3, a12);
        -[IMDCKAbstractSyncController ckUtilities](self, "ckUtilities");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "resetLastSyncDate");

      }
      if (IMOSLoggingEnabled(v31))
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Attachment zone missing, attempting to create it", buf, 2u);
        }

      }
      -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue", v39);
      v37 = objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = sub_1D14961B8;
      v47[3] = &unk_1E922A690;
      v54 = a7;
      v47[4] = self;
      v50 = a8;
      v51 = a9;
      v52 = a11;
      v53 = v40;
      v48 = v45;
      v49 = v19;
      dispatch_async(v37, v47);

    }
  }
  else
  {
    -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D1495C7C;
    block[3] = &unk_1E922A668;
    v56 = v46;
    v57 = self;
    v64 = v14;
    v65 = a7;
    v60 = a9;
    v61 = a8;
    v62 = a11;
    v63 = a12;
    v58 = v45;
    v59 = v19;
    dispatch_async(v30, block);

  }
}

- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL4 v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  IMDCKAttachmentSyncController *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  id v47;
  _QWORD block[5];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "recordID");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordChangeTag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v9;
      v51 = 2112;
      v52 = v10;
      v53 = 2112;
      v54 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Attachment per-record completion %@ changeTag %@ error %@", buf, 0x20u);

    }
  }
  if (v7 && objc_msgSend(v7, "code") != 16)
  {
    v15 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1D14969F4;
    v45[3] = &unk_1E92287A0;
    v45[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], v45);
    if (objc_msgSend(v7, "code") == 14)
    {
      if (IMOSLoggingEnabled(14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone had a conflict ", buf, 2u);
        }

      }
      -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extractServerRecordFromCKServerErrorRecordChanged:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v41[0] = v15;
      v41[1] = 3221225472;
      v41[2] = sub_1D1496A04;
      v41[3] = &unk_1E9229280;
      v42 = v6;
      v43 = v18;
      v44 = self;
      v20 = v18;
      dispatch_sync(v19, v41);

    }
    else
    {
      v21 = objc_msgSend(v7, "code");
      if (v21 == 12 || (v21 = objc_msgSend(v7, "code"), v21 == 35))
      {
        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", buf, 2u);
          }

        }
        -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        v39[0] = v15;
        v39[1] = 3221225472;
        v39[2] = sub_1D1496CFC;
        v39[3] = &unk_1E9228750;
        v39[4] = self;
        v40 = v6;
        dispatch_sync(v23, v39);

      }
      else if (objc_msgSend(v7, "code") == 11)
      {
        if (IMOSLoggingEnabled(11))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Record had unknown error code. Clearing out CK metadata", buf, 2u);
          }

        }
        -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        v37[0] = v15;
        v37[1] = 3221225472;
        v37[2] = sub_1D1496D08;
        v37[3] = &unk_1E9228750;
        v37[4] = self;
        v38 = v6;
        dispatch_sync(v25, v37);

      }
      else
      {
        v26 = objc_msgSend(v7, "code");
        v27 = v26 == 26;
        v28 = IMOSLoggingEnabled(v26);
        if (v27)
        {
          if (v28)
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "We couldn't find the attachment zone for this record so marking the attachment as dirty and clearing the state", buf, 2u);
            }

          }
          -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
          v30 = objc_claimAutoreleasedReturnValue();
          v35[0] = v15;
          v35[1] = 3221225472;
          v35[2] = sub_1D1496D18;
          v35[3] = &unk_1E9228750;
          v35[4] = self;
          v36 = v6;
          dispatch_sync(v30, v35);

        }
        else
        {
          if (v28)
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v7;
              _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone perRecordCompletionBlock encountered an error.  Will try this record again on next sync. %@", buf, 0xCu);
            }

          }
          -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
          v32 = objc_claimAutoreleasedReturnValue();
          v33[0] = v15;
          v33[1] = 3221225472;
          v33[2] = sub_1D1496D28;
          v33[3] = &unk_1E9228750;
          v33[4] = self;
          v34 = v6;
          dispatch_sync(v32, v33);

        }
      }
    }
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D14969D0;
    block[3] = &unk_1E92287A0;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone uploaded record successfully", buf, 2u);
      }

    }
    -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = sub_1D14969E0;
    v46[3] = &unk_1E9228750;
    v46[4] = self;
    v47 = v6;
    dispatch_sync(v14, v46);

  }
}

- (void)_processFetchRecordChangesCompleted:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  char v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
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
      v17 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "_processFetchRecordChangesCompleted error %@", buf, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "errorIndicatesZoneNotCreated:", v6);

    if (v7)
      v11 = v10;
    else
      v11 = 1;
    if ((v11 & 1) == 0)
    {
      -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1D1496ED4;
      v13[3] = &unk_1E92290A8;
      v15 = v7;
      v14 = v6;
      dispatch_async(v12, v13);

    }
  }

}

- (void)_processRecordDeletion:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "_processRecordDeletion deleted record %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_processRecordChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "recordID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39848], "transferGUIDOfRecord:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "_processRecordChanged changed recordID:%@ for attachmentGUID %@", buf, 0x16u);

    }
  }
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1497184;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = sub_1D1497194;
  v11[3] = &unk_1E9228750;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_sync(v9, v11);

}

- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5 syncType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  int64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v11;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }

  }
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1497338;
  block[3] = &unk_1E9229A70;
  block[4] = self;
  v17 = v10;
  v18 = a6;
  v15 = v10;
  dispatch_sync(v14, block);

}

- (id)_operationErrorForModifyingRecordCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E9271080, &unk_1E9271098, &unk_1E92710B0, &unk_1E92710C8, &unk_1E92710E0, &unk_1E92710F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAbstractSyncController errorAnalyzer](self, "errorAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "CKPartialError:onlyHasErrorCodes:", v4, v5);

  if (v7)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Modify attachment had errors we can deal with, so treating this as a non error case", buf, 2u);
      }

    }
    v10 = 0;
  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "_processModifyRecordCompletion error: %@", buf, 0xCu);
    }

  }
  -[IMDCKAttachmentSyncController _operationErrorForModifyingRecordCompletion:](self, "_operationErrorForModifyingRecordCompletion:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Number of records saved %@ with error %@", buf, 0x16u);

    }
  }
  if (v13)
  {
    -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1D14976DC;
    v20[3] = &unk_1E92290A8;
    v22 = v13;
    v21 = v15;
    dispatch_async(v19, v20);

  }
}

- (void)_processAssetFetchPerRecordProgressBlock:(id)a3 progress:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  double v13;

  v6 = a3;
  -[IMDCKAttachmentSyncController perTransferProgress](self, "perTransferProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMDCKAttachmentSyncController recordIDToTransferMap](self, "recordIDToTransferMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D14977D4;
      block[3] = &unk_1E922A6B8;
      v12 = v7;
      v11 = v9;
      v13 = a4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

- (void)_processAssetFetchPerRecordCompletionBlock:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDCKAttachmentSyncController recordIDToTransferMap](self, "recordIDToTransferMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "guid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v15;
        v25 = 2112;
        v26 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Asset fetch complete for %@ error %@", buf, 0x16u);

      }
    }
    -[IMDCKAttachmentSyncController perTransferProgress](self, "perTransferProgress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D1497A10;
      block[3] = &unk_1E9229170;
      v22 = v16;
      v20 = v12;
      v21 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    if (v10 && (CKCanRetryForError() & 1) == 0)
    {
      +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "markTransferAsNotSuccessfullyDownloadedFromCloud:", v12);

    }
  }

}

- (void)_processAssetFetchOperationCompletionBlock:(id)a3 removeTombstones:(BOOL)a4 operationID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD *v19;
  BOOL v20;
  _QWORD v21[5];
  id v22;

  v10 = a3;
  v11 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1D1493754;
  v21[4] = sub_1D1493764;
  v22 = 0;
  v12 = a6;
  v22 = v12;
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1497B74;
  block[3] = &unk_1E922A730;
  block[4] = self;
  v17 = v10;
  v20 = a4;
  v18 = v11;
  v19 = v21;
  v14 = v11;
  v15 = v10;
  dispatch_sync(v13, block);

  _Block_object_dispose(v21, 8);
}

- (id)_recordsToProcessWithError:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "code") != 2)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v7)
    {
      objc_msgSend(v7, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0C94940];
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C94940]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v7, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "allKeys");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "arrayByExcludingObjectsInArray:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21), (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

  }
  return v9;
}

- (void)_removeTransferFromiCloudBackupWithGuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  char v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "cloudKitSyncState") == 1)
  {
    objc_msgSend(v5, "localPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v13 = 0;
    if (v6
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v13),
          v8,
          v9))
    {
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v15 = v7;
          v16 = 2112;
          v17 = v3;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Removing icloud backup attribute for path '%@' for %@ from iCloud backups", buf, 0x16u);
        }

      }
      +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removePathFromiCloudBackup:", v7);

    }
    else if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v3;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Attachment at path '%@' for %@ not found, NOT removing from iCloud backups", buf, 0x16u);
      }

    }
  }

}

- (void)_updateTransferUsingCKRecord:(id)a3 wasFetched:(BOOL)a4 dispatchToMain:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  IMDCKAttachmentSyncController *v18;
  uint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v5 = a5;
  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1D1493754;
  v26 = sub_1D1493764;
  v27 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D1498E04;
  aBlock[3] = &unk_1E922A758;
  v19 = &v22;
  v9 = v8;
  v21 = v6;
  v20 = &v28;
  v17 = v9;
  v18 = self;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = v10;
  if (v5)
    dispatch_sync(MEMORY[0x1E0C80D38], v10);
  else
    v10[2](v10);
  if (*((_BYTE *)v29 + 24))
  {
    v12 = objc_msgSend((id)v23[5], "length");
    if (v12)
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = v23[5];
          *(_DWORD *)buf = 138412290;
          v33 = v14;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Going to fetch the asset for transfer guid at the end of this batch: %@", buf, 0xCu);
        }

      }
      -[IMDCKAttachmentSyncController downloadAssetsForTransferGUIDs](self, "downloadAssetsForTransferGUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v23[5]);

    }
  }
  if (v6)
    objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAssetsOnDiskForRecord:", v9);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

}

- (void)_kickOffAssetFetchForTransfersIfNeededWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1498F4C;
  v7[3] = &unk_1E9228750;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_markAttachmentWithROWID:(int64_t)a3 withSyncState:(int64_t)a4
{
  IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
}

- (void)_markTransferAsNotBeingAbleToSync:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1499384;
  block[3] = &unk_1E92287A0;
  v6 = v3;
  v4 = v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

- (void)_markTransferAsNotBeingAbleToSyncUsingCKRecord:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D39848], "transferGUIDOfRecord:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    block[1] = 3221225472;
    block[2] = sub_1D1499444;
    block[3] = &unk_1E92287A0;
    v4 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v6 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

    v3 = v4;
  }

}

- (void)_resetAttachmentSyncStateForRecord:(id)a3 toState:(int64_t)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  int64_t v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1499504;
  block[3] = &unk_1E922A7E8;
  v8 = v5;
  v9 = a4;
  v6 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

- (void)_migrateSyncToken
{
  id v2;

  -[IMDCKAttachmentSyncController syncTokenStore](self, "syncTokenStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "migrateKey:fromDatabase:", CFSTR("attachmentZoneChangeToken"), CFSTR("/var/mobile/Library/SMS/CloudKitMetaData/AttachmentSyncZoneMetaData.db"));

}

- (id)_changeTokenKeyForSyncType:(int64_t)a3
{
  return CFSTR("attachmentZoneChangeToken");
}

- (void)setLatestSyncToken:(id)a3 forSyncType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[IMDCKAttachmentSyncController syncTokenStore](self, "syncTokenStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDCKAttachmentSyncController _changeTokenKeyForSyncType:](self, "_changeTokenKeyForSyncType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistToken:forKey:", v6, v7);

}

- (id)latestSyncTokenForSyncType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[IMDCKAttachmentSyncController syncTokenStore](self, "syncTokenStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKAttachmentSyncController _changeTokenKeyForSyncType:](self, "_changeTokenKeyForSyncType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)deleteAttachmentZone
{
  NSObject *v3;
  _QWORD block[5];

  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14996DC;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing local attachments sync state, flags 0x%x", (uint8_t *)v8, 8u);
    }

  }
  if ((v3 & 1) != 0)
  {
    -[IMDCKAttachmentSyncController syncTokenStore](self, "syncTokenStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistToken:forKey:", 0, CFSTR("attachmentZoneChangeToken"));

  }
  if ((v3 & 2) != 0)
  {
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markAllAttachmentsAsNeedingCloudKitSync");

  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDCKAttachmentSyncController _needsToMarkAllAttachmentsAsNeedingSync](self, "_needsToMarkAllAttachmentsAsNeedingSync");
  }
}

- (void)_validateTransferFromCloudKit:(id)a3 localTransfer:(id)a4 validateCompletion:(id)a5
{
  uint64_t v6;
  void *v7;
  void (**v8)(id, uint64_t, void *);

  v8 = (void (**)(id, uint64_t, void *))a5;
  v6 = objc_msgSend(MEMORY[0x1E0D39848], "validateMD5HashForRecord:", a3);
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D37CB8], 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v6, v7);

}

- (void)_processAndValidateAttachmentRecordsEligibleForPurge:(id)a3 recordIDsToTransfers:(id)a4 capturedWithABC:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  IMDCKAttachmentSyncController *v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14999C4;
  block[3] = &unk_1E922A888;
  v22 = a5;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(v13, block);

}

- (void)_fetchAndValidateFileTransfersFromCloudKit:(id)a3 capturedWithABC:(BOOL)a4 activity:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  IMDCKAttachmentSyncController *v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  BOOL v21;
  uint8_t buf[16];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD))v12;
  if (v10 && (v12 = (id)objc_msgSend(v10, "count")) != 0)
  {
    -[IMDCKAbstractSyncController setBroadcastedSyncStateToUploading](self, "setBroadcastedSyncStateToUploading");
    -[IMDCKAttachmentSyncController ckQueue](self, "ckQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D149A40C;
    block[3] = &unk_1E92292D0;
    v17 = v10;
    v18 = self;
    v19 = v11;
    v21 = v8;
    v20 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Attempting to fetch a nil file transfers from CloudKit for attachment purging", buf, 2u);
      }

    }
    v13[2](v13, v8);
  }

}

- (id)fileTransferCenter
{
  return +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
}

- (BOOL)__shouldOptimizeAttachmentDefault
{
  return 1;
}

- (id)_constructAttachmentRecordIDUsingTombStoneDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("recordID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C95070]);
    -[IMDCKAttachmentSyncController _attachmentZoneID](self, "_attachmentZoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithRecordName:zoneID:", v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_attachmentDeleteBatchSize
{
  return 20;
}

- (id)_readNextDeleteAfterRow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", *MEMORY[0x1E0D37950], CFSTR("deleteAfterRow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setNextDeleteAfterRow:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D397E8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forDomain:forKey:", v4, *MEMORY[0x1E0D37950], CFSTR("deleteAfterRow"));

}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *context;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[IMDCKAttachmentSyncController _readNextDeleteAfterRow](self, "_readNextDeleteAfterRow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit();
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  context = (void *)MEMORY[0x1D17EA968]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v11 = -[IMDCKAttachmentSyncController _constructAttachmentRecordIDUsingTombStoneDictionary:](self, "_constructAttachmentRecordIDUsingTombStoneDictionary:", v10, context, v20);
        v12 = objc_msgSend(v5, "containsObject:", v11);
        if ((v12 & 1) != 0)
        {
          if (IMOSLoggingEnabled(v12))
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v11;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Removed duplicate recordID %@ from delete syncing", buf, 0xCu);
            }

          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(v10, "objectForKey:", CFSTR("guid"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v11, v14);

        }
        objc_msgSend(v10, "objectForKey:", CFSTR("ROWID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "longLongValue");

        if (!v6 || v16 > objc_msgSend(v6, "longLongValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v17;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
  -[IMDCKAttachmentSyncController _setNextDeleteAfterRow:](self, "_setNextDeleteAfterRow:", v6);

  return v21;
}

- (void)_deleteAttachmentsWithRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *, void *);
  void *v15;
  IMDCKAttachmentSyncController *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[IMDCKAbstractSyncController setBroadcastedSyncStateToDeleting](self, "setBroadcastedSyncStateToDeleting");
    -[IMDCKAttachmentSyncController CKOperationFactory](self, "CKOperationFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteAttachmentCKOperationUsingRecordIDstoDelete:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = sub_1D149B2DC;
    v15 = &unk_1E92291C0;
    v16 = self;
    v17 = v7;
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", &v12);
    if (IMOSLoggingEnabled(objc_msgSend(v9, "setPerRecordSaveBlock:", &unk_1E922A980, v12, v13, v14, v15, v16)))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Kicking off deleted of recordIDs %@", buf, 0xCu);
      }

    }
    -[IMDCKAttachmentSyncController _scheduleOperation:](self, "_scheduleOperation:", v9);

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
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No GUIDs passed in to delete", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)syncAttachmentDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void (**v8)(void);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  void (**v29)(void);
  NSObject *v30;
  IMDCKAttachmentSyncController *v31;
  id v32;
  void (**v33)(void);
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  void (**v39)(void);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  void (**v45)(void);
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = (void (**)(void))a4;
  v31 = self;
  -[IMDCKAttachmentSyncController _ckUtilitiesInstance](self, "_ckUtilitiesInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "cloudKitSyncingEnabled");

  if ((self & 1) != 0)
  {
    v8 = -[IMDCKAttachmentSyncController _copyRecordIDsToDeleteWithLimit:](v31, "_copyRecordIDsToDeleteWithLimit:", -[IMDCKAttachmentSyncController _attachmentDeleteBatchSize](v31, "_attachmentDeleteBatchSize"));
    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v8 = v8;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isAttachmentReferencedByMessage:", v13);

            v17 = v9;
            if (v16)
            {
              v18 = IMOSLoggingEnabled(v9);
              v17 = v34;
              if (v18)
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v47 = v13;
                  _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Attachment %@ was to be deleted, but is still being referenced. Fetching instead.", buf, 0xCu);
                }

                v17 = v34;
              }
            }
            objc_msgSend(v17, "addObject:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        }
        while (v10);
      }

      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = objc_msgSend(v8, "count");
          v23 = objc_msgSend(v34, "count");
          v24 = objc_msgSend(v9, "count");
          *(_DWORD *)buf = 134218496;
          v47 = v22;
          v48 = 2048;
          v49 = v23;
          v50 = 2048;
          v51 = v24;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Got %lu recordIDs queued for delete processing which split sa %lu records to RE-fetch and  %lu to delete", buf, 0x20u);
        }

      }
      -[IMDCKAttachmentSyncController ckQueue](v31, "ckQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D149BAAC;
      block[3] = &unk_1E922A9F8;
      block[4] = v31;
      v36 = v9;
      v39 = v33;
      v37 = v34;
      v38 = v32;
      v26 = v34;
      v27 = v9;
      dispatch_async(v25, block);

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "No pending messages to delete/fetch from CloudKit", buf, 2u);
        }

      }
      IMDAttachmentRecordClearDeleteTombStones();
      if (v33)
        v33[2]();
    }
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Cloudkit sync is not enabled. Not deleting attachments", buf, 2u);
    }

  }
  v29 = v33;
  if (v33)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1D149BA98;
    v44[3] = &unk_1E9228700;
    v45 = v33;
    dispatch_async(MEMORY[0x1E0C80D38], v44);
    v8 = v45;
LABEL_32:

    v29 = v33;
  }

}

- (BOOL)isDoingDeleteRecoverySync
{
  return self->_isDoingDeleteRecoverySync;
}

- (void)setIsDoingDeleteRecoverySync:(BOOL)a3
{
  self->_isDoingDeleteRecoverySync = a3;
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

- (IMDCKAttachmentSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_CKOperationFactory, a3);
}

- (SyncTokenStoreProviding)syncTokenStore
{
  return self->_syncTokenStore;
}

- (void)setSyncTokenStore:(id)a3
{
  objc_storeStrong((id *)&self->_syncTokenStore, a3);
}

- (NSMutableDictionary)completionBlocksForAssetFetchOperations
{
  return self->_completionBlocksForAssetFetchOperations;
}

- (void)setCompletionBlocksForAssetFetchOperations:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocksForAssetFetchOperations, a3);
}

- (NSMutableDictionary)recordIDToTransferMap
{
  return self->_recordIDToTransferMap;
}

- (void)setRecordIDToTransferMap:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDToTransferMap, a3);
}

- (id)perTransferProgress
{
  return self->_perTransferProgress;
}

- (void)setPerTransferProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)assetDownloadInProgress
{
  return self->_assetDownloadInProgress;
}

- (void)setAssetDownloadInProgress:(BOOL)a3
{
  self->_assetDownloadInProgress = a3;
}

- (NSMutableArray)downloadAssetsForTransferGUIDs
{
  return self->_downloadAssetsForTransferGUIDs;
}

- (void)setDownloadAssetsForTransferGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAssetsForTransferGUIDs, a3);
}

- (unint64_t)deviceConditionsToCheck
{
  return self->_deviceConditionsToCheck;
}

- (void)setDeviceConditionsToCheck:(unint64_t)a3
{
  self->_deviceConditionsToCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadAssetsForTransferGUIDs, 0);
  objc_storeStrong(&self->_perTransferProgress, 0);
  objc_storeStrong((id *)&self->_recordIDToTransferMap, 0);
  objc_storeStrong((id *)&self->_completionBlocksForAssetFetchOperations, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);
  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end
