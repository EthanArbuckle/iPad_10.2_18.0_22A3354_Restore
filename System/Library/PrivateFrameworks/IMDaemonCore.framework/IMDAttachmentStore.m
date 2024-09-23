@implementation IMDAttachmentStore

- (NSNumber)afterRow
{
  return (NSNumber *)objc_getAssociatedObject(self, sel_afterRow);
}

- (void)setAfterRow:(id)a3
{
  objc_setAssociatedObject(self, sel_afterRow, a3, (void *)1);
}

- (void)resetFetchState
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting fetch state (afterRow to nil)", v4, 2u);
    }

  }
  -[IMDAttachmentStore setAfterRow:](self, "setAfterRow:", 0);
}

- (id)syncTokenStore
{
  if (qword_1EFC63CB8 != -1)
    dispatch_once(&qword_1EFC63CB8, &unk_1E9229330);
  return (id)qword_1EFC63CB0;
}

- (void)resetLocalSyncStateIfAppropriate
{
  if (-[IMDAttachmentStore _shouldMarkAllAttachmentsAsNeedingSync](self, "_shouldMarkAllAttachmentsAsNeedingSync"))
  {
    -[IMDAttachmentStore clearLocalSyncState:](self, "clearLocalSyncState:", 3);
    -[IMDAttachmentStore _hasMarkedAllAttachmentsAsNeedingSync](self, "_hasMarkedAllAttachmentsAsNeedingSync");
  }
  -[IMDAttachmentStore _markAllFailedAttachmentsAsNeedingSync](self, "_markAllFailedAttachmentsAsNeedingSync");
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
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing local attachments sync state, flags 0x%x", (uint8_t *)v6, 8u);
    }

  }
  if ((v3 & 1) != 0)
    -[IMDAttachmentStore deleteAttachmentSyncToken](self, "deleteAttachmentSyncToken");
  if ((v3 & 2) != 0)
  {
    -[IMDAttachmentStore markAllAttachmentsAsNeedingCloudKitSync](self, "markAllAttachmentsAsNeedingCloudKitSync");
  }
  else if ((v3 & 0x10) != 0)
  {
    -[IMDAttachmentStore _needsToMarkAllAttachmentsAsNeedingSync](self, "_needsToMarkAllAttachmentsAsNeedingSync");
  }
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
  v2 = -[IMDAttachmentStore _shouldMarkAttachmentsAsNeedingReupload](self, "_shouldMarkAttachmentsAsNeedingReupload");
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

- (void)deleteAttachmentSyncToken
{
  id v2;

  -[IMDAttachmentStore syncTokenStore](self, "syncTokenStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistToken:forKey:", 0, CFSTR("attachmentZoneChangeToken"));

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

- (void)_markAttachmentWithROWID:(id)a3 withSyncState:(int64_t)a4
{
  objc_msgSend(a3, "longLongValue");
  IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
}

- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:(id)a3 transfersToSyncRowIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __int128 v24;
  id v25;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v10 = 0;
    v27 = *(_QWORD *)v29;
    *(_QWORD *)&v9 = 138412546;
    v24 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v27)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "guid", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDAttachmentStore messageForTransferGUID:shouldLoadAttachments:](self, "messageForTransferGUID:shouldLoadAttachments:", v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = -[IMDAttachmentStore updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:](self, "updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:", v12, v15, v7);
          if (v16)
          {
            if (IMOSLoggingEnabled(v16))
            {
              OSLogHandleForIMFoundationCategory();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "guid");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v24;
                v33 = v13;
                v34 = 2112;
                v35 = v18;
                _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Fixed up guid for transfer old guid: %@ new guid: %@", buf, 0x16u);

              }
            }
          }
          else if (IMFileTransferGUIDIsTemporary())
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", v10 + i);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled(v21))
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v24;
                v33 = v13;
                v34 = 2112;
                v35 = v21;
                _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "******** Marking attachment as failed to upload, as we could not update it's guid %@ (rowid %@)", buf, 0x16u);
              }

            }
            -[IMDAttachmentStore _markAttachmentWithROWID:withSyncState:](self, "_markAttachmentWithROWID:withSyncState:", v21, 2);
            objc_msgSend(v25, "addObject:", v12);

          }
        }
        else
        {
          objc_msgSend(v26, "objectAtIndexedSubscript:", v10 + i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled(v19))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v24;
              v33 = v13;
              v34 = 2112;
              v35 = v19;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "******** Marking attachment %@ (rowid %@) as forever failed to upload, as we could not find an associated message", buf, 0x16u);
            }

          }
          -[IMDAttachmentStore _markAttachmentWithROWID:withSyncState:](self, "_markAttachmentWithROWID:withSyncState:", v19, 64);
          objc_msgSend(v25, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      v10 += i;
    }
    while (v8);
  }

  return v25;
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  return -[IMDAttachmentStore batchOfRecordsToWriteWithFilter:limit:recurseCount:error:](self, "batchOfRecordsToWriteWithFilter:limit:recurseCount:error:", a3, a4, 0, a5);
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 recurseCount:(int)a5 error:(id *)a6
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  id v71;
  void *v73;
  id v75;
  id obj;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[2];
  _QWORD v96[2];
  uint8_t v97[4];
  uint64_t v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _BYTE v105[128];
  _QWORD v106[2];
  _QWORD v107[5];

  v107[2] = *MEMORY[0x1E0C80C00];
  -[IMDAttachmentStore afterRow](self, "afterRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();

  v73 = v7;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v77 = v8;
    v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v82 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IMDAttachmentStore afterRow](self, "afterRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v92 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          v15 = IMFileTransferFromIMDAttachmentRecordRef((uint64_t)v14);
          v16 = objc_msgSend(v14, "rowID");
          if (!v9 || (v17 = objc_msgSend(v9, "longLongValue"), v17 < v16))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
            v18 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v18;
          }
          if (v15)
          {
            objc_msgSend(v81, "addObject:", v15);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "rowID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "addObject:", v19);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "rowID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "guid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setObject:forKey:", v20, v21);

          }
          else
          {
            if (IMOSLoggingEnabled(v17))
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                v23 = objc_msgSend(v14, "rowID");
                *(_DWORD *)buf = 134217984;
                v102 = v23;
                _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as failed to upload ***", buf, 0xCu);
              }

            }
            objc_msgSend(v14, "rowID");
            IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
      }
      while (v11);
    }

    v24 = IMOSLoggingEnabled(-[IMDAttachmentStore setAfterRow:](self, "setAfterRow:", v9));
    if ((_DWORD)v24)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v81, "count");
        *(_DWORD *)buf = 134218240;
        v102 = v77;
        v103 = 2048;
        v104 = v26;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Got %lu dirty results to sync, filtered to %lu", buf, 0x16u);
      }

    }
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Fixing up attachment GUIDs if needed", buf, 2u);
      }

    }
    v71 = -[IMDAttachmentStore _updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:transfersToSyncRowIDs:](self, "_updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:transfersToSyncRowIDs:", v81, v80);
    v28 = objc_msgSend(v71, "count");
    if (v28)
    {
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Removing attachments that failed guid conversion", buf, 2u);
        }

      }
      objc_msgSend(v81, "removeObjectsInArray:", v71);
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v30 = v81;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      v32 = v31;
      if (v31)
      {
        v33 = *(_QWORD *)v88;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v88 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v34);
            v31 = IMOSLoggingEnabled(v31);
            if ((_DWORD)v31)
            {
              OSLogHandleForIMFoundationCategory();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v102 = v35;
                _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Transfer to sync %@ ", buf, 0xCu);
              }

            }
            ++v34;
          }
          while (v32 != v34);
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
          v32 = v31;
        }
        while (v31);
      }

    }
    +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "attachmentRecordZoneID");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDCKRecordSaltManager sharedInstance](IMDCKRecordSaltManager, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "cachedSalt");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v81, "count"))
    {
      v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      obj = v81;
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      if (!v40)
        goto LABEL_66;
      v41 = *(_QWORD *)v84;
      while (1)
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v84 != v41)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          v44 = (void *)objc_msgSend(v43, "copyCKRecordRepresentationWithZoneID:salt:", v79, v78);
          v45 = v44;
          if (v44)
          {
            objc_msgSend(v44, "recordID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "recordName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v39, "containsObject:", v47);

            if ((v48 & 1) != 0)
              goto LABEL_64;
            objc_msgSend(v43, "guid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setObject:forKey:", v45, v49);

            objc_msgSend(v45, "recordID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "recordName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v51);

          }
          else
          {
            objc_msgSend(v43, "guid");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "objectForKey:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "longLongValue");

            if (v54)
            {
              if (IMOSLoggingEnabled(v55))
              {
                OSLogHandleForIMFoundationCategory();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v43, "guid");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v102 = (uint64_t)v57;
                  v103 = 2048;
                  v104 = v54;
                  _os_log_impl(&dword_1D1413000, v56, OS_LOG_TYPE_INFO, "**** failed to create CKRecord from IMTransfer guid %@, marking row %lld as failed to upload ***", buf, 0x16u);

                }
              }
              IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
            }
            else
            {
              IMLogHandleForCategory();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                sub_1D16664D8(v97, v43, &v98, v58);

            }
            objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("NullCKRecordForIMFileTransfer"), 0, CFSTR("MiCSync"), CFSTR("Failed to generate CKRecord for IMFileTransfer"));
          }

LABEL_64:
        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
        if (!v40)
        {
LABEL_66:

          break;
        }
      }
    }
    if (objc_msgSend(v75, "count"))
    {
      if (a5 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v95[0] = *MEMORY[0x1E0D38620];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v75, "count"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = v60;
        v95[1] = *MEMORY[0x1E0D38628];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v96[1] = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "trackEvent:withDictionary:", *MEMORY[0x1E0D38630], v62);

      }
      v63 = v75;
      v64 = v75;
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v66, OS_LOG_TYPE_INFO, "*** All the records we fetched to write had problems, fetching next batch ***", buf, 2u);
        }

      }
      -[IMDAttachmentStore batchOfRecordsToWriteWithFilter:limit:recurseCount:error:](self, "batchOfRecordsToWriteWithFilter:limit:recurseCount:error:", a3, a4, (a5 + 1), a6);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      v63 = v75;
    }

  }
  else
  {
    if (a5 < 1)
    {
      v64 = 0;
      goto LABEL_80;
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x1E0D38628];
    v106[0] = *MEMORY[0x1E0D38620];
    v106[1] = v65;
    v107[0] = &unk_1E9271008;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
    v80 = (id)objc_claimAutoreleasedReturnValue();
    v107[1] = v80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
    v82 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "trackEvent:withDictionary:", *MEMORY[0x1E0D38630], v82);
    v64 = 0;
  }

LABEL_80:
  return v64;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateTransferUsingCKRecord:wasFetched:dispatchToMain:", v3, 0, 0);

}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  IMDAttachmentStore *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "copy");
  if (!objc_msgSend(v10, "wasRecordAlreadyChanged:", v9))
  {
    v26 = objc_msgSend(v10, "wasAssetNotAvailable:", v9);
    if ((_DWORD)v26)
    {
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Asset was not available marking transfer as unsuccessully synced", buf, 2u);
        }

      }
LABEL_14:
      -[IMDAttachmentStore _markTransferAsNotBeingAbleToSyncWithGUID:](self, "_markTransferAsNotBeingAbleToSyncWithGUID:", v11);
      goto LABEL_32;
    }
    if (objc_msgSend(v10, "wasUnknownItem:", v9))
    {
      v28 = self;
      v29 = v11;
      v30 = 2;
    }
    else
    {
      v34 = objc_msgSend(v10, "wasZoneNotFound:", v9);
      if (!(_DWORD)v34)
      {
        if (IMOSLoggingEnabled(v34))
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Record failed with unhandled error will try this record again on next sync", buf, 2u);
          }

        }
        goto LABEL_14;
      }
      v28 = self;
      v29 = v11;
      v30 = 0;
    }
    -[IMDAttachmentStore _resetAttachmentSyncStateForGUID:newSyncState:](v28, "_resetAttachmentSyncStateForGUID:newSyncState:", v29, v30);
    goto LABEL_32;
  }
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extractServerRecordFromCKServerErrorRecordChanged:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = objc_msgSend(v14, "isEqualToString:", v16);

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D39848], "transferGUIDOfRecord:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v11, "isEqualToString:", v20);
    v22 = v21;
    v23 = IMOSLoggingEnabled(v21);
    if (v22)
    {
      v7 = v17;
      if (v23)
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Server's GUID matched local GUID; aligning with the server's data",
            buf,
            2u);
        }

      }
      +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_updateTransferUsingCKRecord:wasFetched:dispatchToMain:", v13, 0, 0);

    }
    else
    {
      v7 = v17;
      if (v23)
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v20;
          v41 = 2112;
          v42 = v11;
          _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "On conflict, the server record's GUID (%@) was different than the record we tried to update with GUID (%@); "
            "marking local attachment as synced, to skip to",
            buf,
            0x16u);
        }

      }
      IMDAttachmentRecordRowIDForGUID();
      IMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit();
    }

  }
  else
  {
    v7 = v17;
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "recordID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "recordName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v32;
        v41 = 2112;
        v42 = v33;
        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Conflicting serverRecord was different than the one being updated (server: %@, local: %@)", buf, 0x16u);

      }
    }
    -[IMDAttachmentStore _resetAttachmentSyncStateForGUID:newSyncState:](self, "_resetAttachmentSyncStateForGUID:newSyncState:", v11, 2);
  }

LABEL_32:
}

- (void)_resetAttachmentSyncStateForGUID:(id)a3 newSyncState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setCloudKitServerChangeTokenBlob:", 0);
    objc_msgSend(v8, "setCloudKitRecordID:", 0);
    objc_msgSend(v8, "setCloudKitSyncState:", a4);
    -[IMDAttachmentStore updateAttachment:](self, "updateAttachment:", v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Tried to clear sync state for a transfer with guid (%@), transfer not found on disk", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_markTransferAsNotBeingAbleToSyncWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setCloudKitSyncState:", 2);
    -[IMDAttachmentStore updateAttachment:](self, "updateAttachment:", v6);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Could not find transfer for guid (%@) to mark as not synced successfully", (uint8_t *)&v8, 0xCu);
    }

  }
}

+ (IMDAttachmentStore)sharedInstance
{
  if (qword_1ED935CD8 != -1)
    dispatch_once(&qword_1ED935CD8, &unk_1E922CC88);
  return (IMDAttachmentStore *)qword_1ED935E10;
}

- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4
{
  return -[IMDAttachmentStore storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:](self, "storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:", a3, a4, 0, 0);
}

- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4 chatGUID:(id)a5 storeAtExternalLocation:(BOOL)a6
{
  _BOOL8 v6;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  const void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1D17EA968](self, a2);
  if (IMOSLoggingEnabled(v11))
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = (uint64_t)a3;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Request to store transfer: %@", (uint8_t *)&v27, 0xCu);
    }
  }
  v13 = -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", objc_msgSend(a3, "guid"));
  v14 = v13;
  if (v13)
  {
    if (IMOSLoggingEnabled(v13))
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = (uint64_t)v14;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "  => Updating existing : %@", (uint8_t *)&v27, 0xCu);
      }
    }
    v16 = -[IMDAttachmentStore updateAttachment:chatGUID:storeAtExternalPath:](self, "updateAttachment:chatGUID:storeAtExternalPath:", a3, a5, v6);
    if (!a4)
      goto LABEL_20;
    goto LABEL_15;
  }
  v17 = IMDAttachmentRecordRefFromIMFileTransfer(a3, (uint64_t)a5, v6);
  v18 = (const void *)v17;
  if (!v17)
  {
    v16 = 0;
    if (!a4)
      goto LABEL_20;
    goto LABEL_15;
  }
  v19 = IMFileTransferFromIMDAttachmentRecordRef(v17);
  if (IMOSLoggingEnabled(v19))
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = (uint64_t)v19;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "  => Created new : %@", (uint8_t *)&v27, 0xCu);
    }
  }
  v16 = v19 != 0;

  CFRelease(v18);
  if (a4)
  {
LABEL_15:
    v21 = objc_msgSend(a3, "isAuxVideo");
    if ((v21 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v21))
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = objc_msgSend(a3, "guid");
          v27 = 138412546;
          v28 = v23;
          v29 = 2112;
          v30 = a4;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "  ** Associated transfer GUID %@ with message GUID: %@", (uint8_t *)&v27, 0x16u);
        }
      }
      objc_msgSend(a3, "guid");
      IMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID();
    }
  }
LABEL_20:

  objc_autoreleasePoolPop(v11);
  v24 = objc_msgSend(a3, "isAuxVideo");
  if ((_DWORD)v24)
  {
    if (IMOSLoggingEnabled(v24))
    {
      v25 = OSLogHandleForIMFoundationCategory();
      v16 = 1;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = (uint64_t)a3;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Over ridiing return val in storeAttachment for Aux transfer %@", (uint8_t *)&v27, 0xCu);
      }
    }
    else
    {
      return 1;
    }
  }
  return v16;
}

- (BOOL)removeAttachment:(id)a3 fromMessageWithGUID:(id)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17EA968](self, a2);
  if (IMOSLoggingEnabled(v7))
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = a3;
      v14 = 2112;
      v15 = a4;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Request to unassociate transfer: %@ from message guid: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  v9 = -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", objc_msgSend(a3, "guid"));
  v10 = v9;
  objc_msgSend(a3, "guid");
  IMDMessageRecordUnassociateMessageWithGUIDFromAttachmentWithGUID();

  objc_autoreleasePoolPop(v7);
  return 0;
}

- (BOOL)updateAttachment:(id)a3
{
  return -[IMDAttachmentStore updateAttachment:chatGUID:storeAtExternalPath:](self, "updateAttachment:chatGUID:storeAtExternalPath:", a3, 0, 0);
}

- (BOOL)updateAttachment:(id)a3 chatGUID:(id)a4 storeAtExternalPath:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  NSObject *v10;
  const void *v11;
  id v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1D17EA968](self, a2);
  if (IMOSLoggingEnabled(v9))
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = a3;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Request to update transfer: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  objc_msgSend(a3, "guid");
  v11 = (const void *)IMDAttachmentRecordCopyAttachmentForGUID();
  v12 = -[IMDAttachmentStore fileTransferWithAttachmentRecordRef:](self, "fileTransferWithAttachmentRecordRef:", v11);
  v13 = IMOSLoggingEnabled(v12);
  if (v12)
  {
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18 = 138412546;
        v19 = v12;
        v20 = 2112;
        v21 = a3;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "  => Updating existing: %@ with: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    IMDUpdateIMFileTransferFromIMFileTransfer(v12, v11, a3, v5, (uint64_t)a4);
    v15 = 1;
    if (!v11)
      goto LABEL_15;
LABEL_14:
    CFRelease(v11);
    goto LABEL_15;
  }
  if (v13)
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "  => Found no transfer, storing instead", (uint8_t *)&v18, 2u);
    }
  }
  v15 = -[IMDAttachmentStore storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:](self, "storeAttachment:associateWithMessageWithGUID:chatGUID:storeAtExternalLocation:", a3, 0, a4, v5);
  if (v11)
    goto LABEL_14;
LABEL_15:
  objc_autoreleasePoolPop(v9);
  return v15;
}

- (void)markFile:(id)a3 asPurgeable:(BOOL)a4
{
  _BOOL8 v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v5 = +[IMDAttachmentStore fileEligibleForCacheDelete:](IMDAttachmentStore, "fileEligibleForCacheDelete:", a3);
      if (!v5)
      {
        if (IMOSLoggingEnabled(v5))
        {
          v6 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            v11 = 138412290;
            v12 = a3;
            v7 = "%@ not eligible for cache delete";
            v8 = v6;
            v9 = 12;
LABEL_10:
            _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, v9);
            return;
          }
        }
        return;
      }
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
    {
      IMLogBacktrace();
      +[IMDAttachmentStore _askToTapToRadarForErrorString:path:](IMDAttachmentStore, "_askToTapToRadarForErrorString:path:", CFSTR("SingleFile"), a3);
    }
    MEMORY[0x1E0DE7D20](a3, sel_im_markFileAsPurgeable_);
    return;
  }
  if (IMOSLoggingEnabled(self))
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      v7 = "No attachment path to mark as purgable";
      v8 = v10;
      v9 = 2;
      goto LABEL_10;
    }
  }
}

+ (BOOL)_cloudkitSyncingEnabled
{
  return -[IMDCKUtilities cloudKitSyncingEnabled](+[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance"), "cloudKitSyncingEnabled");
}

+ (BOOL)fileEligibleForCacheDelete:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "_cloudkitSyncingEnabled");
  if ((v4 & 1) == 0)
  {
    v7 = IMOSLoggingEnabled(v4);
    if (!v7)
      return v7;
    v8 = OSLogHandleForIMFoundationCategory();
    v7 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!v7)
      return v7;
    LOWORD(v19) = 0;
    v9 = "Not marking path as eligible for cachedelete, cloudkit syncing is not on";
    v10 = v8;
    v11 = 2;
    goto LABEL_8;
  }
  v5 = (void *)objc_msgSend(a3, "lastPathComponent");
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Attachments")))
  {
    v12 = objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D37FB8]);
    if (!(_DWORD)v12)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByExpandingTildeInPath")) & 1) == 0)
      {
        v17 = IMLogHandleForCategory();
        v7 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        sub_1D166AAA4();
        goto LABEL_9;
      }
      v14 = objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "im_isAudioMessageExtension");
      v15 = v14;
      if ((_DWORD)v14)
      {
        if (IMOSLoggingEnabled(v14))
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v19 = 138412290;
            v20 = a3;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Not marking path as eligible for cachedelete, file extension is an audio message. path: %@", (uint8_t *)&v19, 0xCu);
          }
        }
      }
      LOBYTE(v7) = v15 ^ 1;
      return v7;
    }
    v7 = IMOSLoggingEnabled(v12);
    if (!v7)
      return v7;
    v13 = OSLogHandleForIMFoundationCategory();
    v7 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (!v7)
      return v7;
    v19 = 138412290;
    v20 = a3;
    v9 = "Not marking path as eligible for cachedelete, last path component matches group photo file name. path: %@";
    v10 = v13;
    v11 = 12;
LABEL_8:
    _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v19, v11);
    goto LABEL_9;
  }
  v6 = IMLogHandleForCategory();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    sub_1D166AA64(v6);
LABEL_9:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)markAttachmentPurgeable:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_markAttachment_purgeable_);
}

- (void)markAttachmentUnpurgeable:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_markAttachment_purgeable_);
}

- (void)markAttachment:(id)a3 purgeable:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a4;
    -[IMDAttachmentStore markFile:asPurgeable:](self, "markFile:asPurgeable:");
    v7 = -[IMDAttachmentStore _alternateAttachmentPathIfExists:](self, "_alternateAttachmentPathIfExists:", a3);
    if (v7)
      -[IMDAttachmentStore markFile:asPurgeable:](self, "markFile:asPurgeable:", v7, v4);
    if ((objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "isEqualToString:", CFSTR("MOV")) & 1) == 0
      && (objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "isEqualToString:", CFSTR("mov")) & 1) == 0)
    {
      v8 = objc_msgSend(a3, "im_livePhotoVideoPath");
      if (v8)
      {
        v9 = v8;
        if (IMOSLoggingEnabled(v8))
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v12 = 138412290;
            v13 = v9;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Found aux video path: %@", (uint8_t *)&v12, 0xCu);
          }
        }
        -[IMDAttachmentStore markFile:asPurgeable:](self, "markFile:asPurgeable:", v9, v4);
      }
    }
  }
  else if (IMOSLoggingEnabled(self))
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No attachment path to mark as purgable", (uint8_t *)&v12, 2u);
    }
  }
}

+ (BOOL)_filesystemIsCaseSensitiveWithPath:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D153BEA4;
  block[3] = &unk_1E9228690;
  block[4] = a3;
  if (qword_1ED9363D0 != -1)
    dispatch_once(&qword_1ED9363D0, block);
  return byte_1ED936480;
}

- (id)_alternateAttachmentPathIfExists:(id)a3
{
  void *v4;
  id result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (!+[IMDAttachmentStore _filesystemIsCaseSensitiveWithPath:](IMDAttachmentStore, "_filesystemIsCaseSensitiveWithPath:"))return 0;
  v4 = (void *)objc_msgSend(a3, "pathExtension");
  result = (id)objc_msgSend(v4, "length");
  if (result)
  {
    v6 = objc_msgSend(v4, "lowercaseString");
    v7 = objc_msgSend(v4, "uppercaseString");
    if (objc_msgSend(v4, "isEqualToString:", v7))
      v8 = v6;
    else
      v8 = v7;
    v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v8);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v9))
      return v9;
    else
      return 0;
  }
  return result;
}

+ (void)_askToTapToRadarForErrorString:(id)a3 path:(id)a4
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[16];

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall")
    && IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    if (qword_1EFC63DE0 != -1)
      dispatch_once(&qword_1EFC63DE0, &unk_1E922CCA8);
    v6 = objc_msgSend(MEMORY[0x1E0D36B00], "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID"), CFSTR("Messages Storage Management"), CFSTR("An attachment was unexpectedly marked as not purgeable."), CFSTR("File a Radar"), CFSTR("Dismiss"), 0);
    if (v6)
    {
      v7 = (void *)v6;
      if (IMOSLoggingEnabled(v6))
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Presenting CacheDelete TTR UI", buf, 2u);
        }
      }
      v9 = (void *)objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      objc_msgSend(v9, "trackEvent:", *MEMORY[0x1E0D38798]);
      objc_msgSend(v7, "setUsesNotificationCenter:", 0);
      objc_msgSend(v7, "setRepresentedApplicationBundle:", *MEMORY[0x1E0D36C08]);
      v10 = (void *)objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1D153C248;
      v11[3] = &unk_1E922CCD0;
      v11[4] = a3;
      v11[5] = a4;
      objc_msgSend(v10, "addUserNotification:listener:completionHandler:", v7, 0, v11);
    }
  }
}

- (void)markAllAttachmentsAsNotPurgeable
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int *v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  int *v14;
  char *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int128 buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
  {
    IMLogBacktrace();
    +[IMDAttachmentStore _askToTapToRadarForErrorString:path:](IMDAttachmentStore, "_askToTapToRadarForErrorString:path:", CFSTR("All attachments"), 0);
  }
  v2 = (void *)objc_msgSend(CFSTR("/var/mobile/Library/SMS/Attachments"), "stringByExpandingTildeInPath");
  if (IMOSLoggingEnabled(v2))
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Clearing purgeable flags under %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v23 = 0;
  v24 = 0;
  buf = 0x900000002uLL;
  v4 = fsctl((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0xC0204A49uLL, &buf, 0);
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = __error();
    v7 = *v6 == 2;
    v8 = IMOSLoggingEnabled(v6);
    if (v7)
    {
      if (v8)
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v2;
          v10 = "%@ does not exist, skip clearing the purgeable flags";
LABEL_14:
          v11 = v9;
          v12 = 12;
LABEL_18:
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, v12);
        }
      }
    }
    else if (v8)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = __error();
        v15 = strerror(*v14);
        v16 = 138412802;
        v17 = v2;
        v18 = 1024;
        v19 = v5;
        v20 = 2080;
        v21 = v15;
        v10 = "Failed to clear purgeable flag for %@ %d (%s)";
        v11 = v13;
        v12 = 28;
        goto LABEL_18;
      }
    }
  }
  else if (IMOSLoggingEnabled(v4))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v2;
      v10 = "Cleared purgeable flags under %@";
      goto LABEL_14;
    }
  }
}

- (id)attachmentWithGUID:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = a3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Request for attachment with guid: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v5 = (void *)MEMORY[0x1D17EA968]();
  v6 = IMDAttachmentRecordCopyAttachmentForGUID();
  v7 = (const void *)v6;
  if (v6)
  {
    v8 = IMFileTransferFromIMDAttachmentRecordRef(v6);
    objc_msgSend(v8, "fixInvalidTransferStateIfNeeded");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)attachmentsWithGUIDs:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request for attachments with guids: %@", buf, 0xCu);
    }
  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (a3)
  {
    v7 = -[IMDAttachmentStore attachmentsFilteredUsingPredicate:limit:](self, "attachmentsFilteredUsingPredicate:limit:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), *MEMORY[0x1E0D37470], a3), -1);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if (v11
            && (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "isFinished") & 1) == 0
            && objc_msgSend(v11, "transferState"))
          {
            objc_msgSend(v11, "_setTransferState:", 6);
            objc_msgSend(v11, "_setError:", 11);
          }
          objc_msgSend(v6, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
  }
  return v6;
}

- (id)fileTransferWithAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  NSObject *v4;
  void *v5;
  int v7;
  _IMDAttachmentRecordStruct *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = a3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Request for attachment with attachmentRecord: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  v5 = (void *)MEMORY[0x1D17EA968]();
  if (a3)
  {
    a3 = (_IMDAttachmentRecordStruct *)IMFileTransferFromIMDAttachmentRecordRef((uint64_t)a3);
    -[_IMDAttachmentRecordStruct fixInvalidTransferStateIfNeeded](a3, "fixInvalidTransferStateIfNeeded");
  }
  objc_autoreleasePoolPop(v5);
  return a3;
}

- (id)attachmentsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = sub_1D153A778;
  v24 = sub_1D153A788;
  v25 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1D153CC4C;
  v19[3] = &unk_1E9228998;
  v19[4] = &v20;
  objc_msgSend(v6, "fetchAttachmentRecordsFilteredUsingPredicate:limit:completionHandler:", a3, a4, v19);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)v21[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = IMFileTransferFromIMDAttachmentRecordRef(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if (v12)
          objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v9);
  }

  v13 = v7;
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)database
{
  return (id)objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
}

- (id)messageForTransferGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  uint64_t v5;
  const void *v6;
  void *AttachmentIfNeededRef;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = IMDAttachmentRecordCopyMessageForAttachmentGUID();
  if (v5)
  {
    v6 = (const void *)v5;
    AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v5, 0);
    CFRelease(v6);
    return AttachmentIfNeededRef;
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = a3;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "messageForTransferGUID failed to get a message record for transfer %@", (uint8_t *)&v10, 0xCu);
      }
    }
    return 0;
  }
}

- (BOOL)updateTemporaryTransferGUIDsIfNeeded:(id)a3 transfersToSync:(id)a4
{
  return -[IMDAttachmentStore updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:](self, "updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:", a3, -[IMDAttachmentStore messageForTransferGUID:shouldLoadAttachments:](self, "messageForTransferGUID:shouldLoadAttachments:", objc_msgSend(a3, "guid"), 1), a4);
}

- (BOOL)_shouldEarlyReturnForWrongItemType:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)updateTemporaryTransferGUIDsOnMessageIfNeeded:(id)a3
{
  return -[IMDAttachmentStore updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:](self, "updateTemporaryTransferGUIDsOn:andUpdateMessageIfNeeded:transfersToSync:", 0, a3, 0);
}

- (_IMDAttachmentRecordStruct)_loadAttachmentRecordForGUID:(id)a3
{
  return (_IMDAttachmentRecordStruct *)IMDAttachmentRecordCopyAttachmentForGUID();
}

- (id)_newFileTransferFromIMDAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  return IMFileTransferFromIMDAttachmentRecordRef((uint64_t)a3);
}

- (BOOL)_updateAttachmentGUID:(id)a3 withGUID:(id)a4
{
  return IMDAttachmentRecordUpdateAttachmentGUIDWithGUID() != 0;
}

- (void)_reindexMessageGUIDs:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  IMDCoreSpotlightReindexMessagesWhileBlocking();
}

+ (BOOL)updateTransferIn:(id)a3 fromGUID:(id)a4 toGUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "guid"), "isEqualToString:", a4))
        {
          objc_msgSend(v12, "setGuid:", a5);
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  return v8;
}

- (id)_permanentTransferGUIDForTransfer:(id)a3 inMessageItem:(id)a4
{
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  v6 = (void *)objc_msgSend(a3, "guid");
  if (!IMFileTransferGUIDIsTemporary())
    return v6;
  objc_msgSend(a4, "guid");
  if (objc_msgSend(a3, "isAdaptiveImageGlyph"))
  {
    objc_msgSend(a3, "adaptiveImageGlyphContentIdentifier");
    return (id)IMFileTransferGUIDForGenmojiWithContentIdentifierInMessageGUID();
  }
  if (objc_msgSend(a4, "messagePartIndexForAttachmentMessagePartWithTransferGUID:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Could not find message part matching file transfer GUID, using 0 as the message part index.", v9, 2u);
    }
    return (id)IMFileTransferGUIDForPluginPayloadOrGroupPhotoInMessageGUID();
  }
  return (id)IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
}

- (id)_permanentTransferGUIDForExistingTransferWithTemporaryGUID:(id)a3
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = IMDAttachmentRecordCopyAttachmentForGUID();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = IMDAttachmentRecordCopyMessageForAttachmentGUID();
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = IMDCreateIMMessageItemFromIMDMessageRecordRef(v7, 0);
      v10 = (void *)v9;
      if (v9)
      {
        if (IMOSLoggingEnabled(v9))
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v18 = 138412290;
            v19 = a3;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Found corresponding IMMessageItem for temporary transferGUID %@", (uint8_t *)&v18, 0xCu);
          }
        }
        v12 = IMFileTransferFromIMDAttachmentRecordRef((uint64_t)v6);
        v13 = -[IMDAttachmentStore _permanentTransferGUIDForTransfer:inMessageItem:](self, "_permanentTransferGUIDForTransfer:inMessageItem:", v12, v10);

      }
      else
      {
        v16 = IMLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1D166ABC4();
        v13 = 0;
      }

      CFRelease(v8);
    }
    else
    {
      v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D166AB64();
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1D166AB04();
    return 0;
  }
  return v13;
}

- (BOOL)updateTemporaryTransferGUIDsOn:(id)a3 andUpdateMessageIfNeeded:(id)a4 transfersToSync:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _IMDAttachmentRecordStruct *v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  _BOOL4 v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  void *v26;
  id v27;
  const __CFString *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v42;
  char v43;
  int v45;
  id v46;
  id v47;
  id v48;
  id obj;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = objc_msgSend(a4, "guid");
    v47 = a4;
    v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "fileTransferGUIDs"), "copy");
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v8)
    {
      v43 = 0;
      v9 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (IMFileTransferGUIDIsTemporary())
          {
            v12 = -[IMDAttachmentStore _loadAttachmentRecordForGUID:](self, "_loadAttachmentRecordForGUID:", v11);
            if (v12)
            {
              v13 = -[IMDAttachmentStore _newFileTransferFromIMDAttachmentRecordRef:](self, "_newFileTransferFromIMDAttachmentRecordRef:", v12);
              CFRelease(v12);
              v14 = -[IMDAttachmentStore _permanentTransferGUIDForTransfer:inMessageItem:](self, "_permanentTransferGUIDForTransfer:inMessageItem:", v13, v47);
              if (IMOSLoggingEnabled(v14))
              {
                v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v62 = (uint64_t)v11;
                  v63 = 2112;
                  v64 = v14;
                  _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Re-targeting transfer GUID from %@ to %@", buf, 0x16u);
                }
              }
              v16 = -[IMDAttachmentStore _updateAttachmentGUID:withGUID:](self, "_updateAttachmentGUID:withGUID:", v11, v14);
              v17 = v16;
              if (IMOSLoggingEnabled(v16))
              {
                v18 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  v19 = CFSTR("NO");
                  if (v17)
                    v19 = CFSTR("YES");
                  *(_DWORD *)buf = 138412290;
                  v62 = (uint64_t)v19;
                  _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "_updateAttachmentGUID completed with success %@", buf, 0xCu);
                }
              }
              if (v17)
              {
                if (v13)
                  objc_msgSend(v13, "setGuid:", v14);
                +[IMDAttachmentStore updateTransferIn:fromGUID:toGUID:](IMDAttachmentStore, "updateTransferIn:fromGUID:toGUID:", a5, v11, v14);
                -[IMDFileTransferCenter updateTransferGUID:toGUID:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "updateTransferGUID:toGUID:", v11, v14);
                if (a3)
                {
                  v20 = objc_msgSend(v11, "isEqualToString:", objc_msgSend(a3, "guid"));
                  if ((_DWORD)v20)
                  {
                    if (IMOSLoggingEnabled(v20))
                    {
                      v21 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                      {
                        v22 = objc_msgSend(a3, "guid");
                        *(_DWORD *)buf = 138412546;
                        v62 = v22;
                        v63 = 2112;
                        v64 = v14;
                        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "We are updating the in-memory transfer's guid that we will sync to CloudKit in-memory transfer: %@ newGUID: %@", buf, 0x16u);
                      }
                    }
                    objc_msgSend(a3, "setGuid:", v14);
                    v43 = 1;
                  }
                }
                -[IMDAttachmentStore updateAttachment:](self, "updateAttachment:", v13);
                objc_msgSend(v46, "setObject:forKey:", v14, v11);
              }

            }
            else
            {
              v23 = IMLogHandleForCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v62 = (uint64_t)v11;
                _os_log_error_impl(&dword_1D1413000, v23, OS_LOG_TYPE_ERROR, "Got null attachment record for %@", buf, 0xCu);
              }
            }
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v8);
    }
    else
    {
      v43 = 0;
    }
    v26 = (void *)objc_msgSend(v46, "copy");

    v45 = objc_msgSend(v47, "updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:", v26);
    if (v45)
    {
      v27 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v47, 0, 0, 0, 0);
      if (!v47 || v27 == v47)
      {
        v29 = IMLogHandleForCategory();
        v27 = (id)os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v27)
          sub_1D166AC24(v42, v47, v29);
        v28 = CFSTR("FAILED (maybe)");
      }
      else
      {
        v28 = CFSTR("succeeded");
      }
      if (IMOSLoggingEnabled(v27))
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v62 = (uint64_t)v28;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Message body attachment attributes update %@!", buf, 0xCu);
        }
      }
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v48, "addObject:", v42);
      v31 = -[IMDMessageStore messagesWithAssociatedGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "messagesWithAssociatedGUID:", v42);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(v31);
            v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            v36 = objc_msgSend(v35, "guid");
            v37 = objc_msgSend(v35, "updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:", v26);
            v38 = IMLogHandleForCategory();
            v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
            if (v37)
            {
              if (v39)
              {
                *(_DWORD *)buf = 138412290;
                v62 = v36;
                _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_DEFAULT, "Associated message item %@ changed when temporary file transfers were updated.", buf, 0xCu);
              }
              objc_msgSend(v48, "addObject:", v36);
            }
            else if (v39)
            {
              *(_DWORD *)buf = 138412290;
              v62 = v36;
              _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_DEFAULT, "Associated message item %@ did not change when temporary file transfers were updated.", buf, 0xCu);
            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v32);
      }
      v40 = (void *)objc_msgSend(v48, "copy");

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = sub_1D153DA00;
      v51[3] = &unk_1E9228690;
      v51[4] = v40;
      -[IMDAttachmentStore _reindexMessageGUIDs:reason:completion:](self, "_reindexMessageGUIDs:reason:completion:", v40, 1001, v51);

    }
    v25 = v43;
    if (!a3)
      v25 = v45;
  }
  else
  {
    v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1D166ACBC((uint64_t)a4, v24);
    v25 = 0;
  }
  return v25 & 1;
}

- (BOOL)deleteAttachmentsForMessage:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "fileTransferGUIDs");
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    goto LABEL_7;
  if (IMOSLoggingEnabled(v5))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Deleting attachments, guids %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v5 = -[IMDAttachmentStore deleteAttachmentsWithGUIDs:](self, "deleteAttachmentsWithGUIDs:", v4);
  if ((v5 & 1) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
LABEL_7:
    v7 = IMOSLoggingEnabled(v5);
    if (v7)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      v7 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v7)
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Failed to delete attachments", (uint8_t *)&v10, 2u);
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (BOOL)deleteAttachmentsWithGUIDs:(id)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to delete attachments with guids: %@", buf, 0xCu);
    }
  }
  context = (void *)MEMORY[0x1D17EA968]();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "addObject:", v10);
        if (IMFileTransferGUIDIsTemporary())
        {
          v11 = -[IMDAttachmentStore _permanentTransferGUIDForExistingTransferWithTemporaryGUID:](self, "_permanentTransferGUIDForExistingTransferWithTemporaryGUID:", v10);
          v12 = objc_msgSend(v11, "length");
          if (v12)
          {
            if (IMOSLoggingEnabled(v12))
            {
              v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v32 = v10;
                v33 = 2112;
                v34 = v11;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Requested delete of temporary attachmentGUID %@ will also delete permanent attachmentGUID %@", buf, 0x16u);
              }
            }
            objc_msgSend(v6, "addObject:", v11);
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v7);
  }
  v14 = (void *)objc_msgSend(v6, "copy");

  if (IMOSLoggingEnabled(v15))
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Deleting attachments with attachment guids from spotlight: %@", buf, 0xCu);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D360F0], "database"), "coreSpotlightDeleteAttachmentGUIDs:reason:", v14, 1006);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(a3);
        IMDAttachmentRecordDeleteAttachmentForGUID();
      }
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
  objc_autoreleasePoolPop(context);
  return 1;
}

- (BOOL)deleteAttachmentDataForTransfer:(id)a3
{
  void *v4;

  v4 = (void *)MEMORY[0x1D17EA968](self, a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36120], "sharedInstance"), "deleteAttachmentsForTransfer:", a3);
  objc_autoreleasePoolPop(v4);
  return 1;
}

- (BOOL)deleteAttachmentWithGUID:(id)a3
{
  BOOL v3;
  NSObject *v4;
  uint8_t v6[16];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7[0] = a3;
    return -[IMDAttachmentStore deleteAttachmentsWithGUIDs:](self, "deleteAttachmentsWithGUIDs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  }
  else if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    v3 = 1;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Request to delete attachment with nil guid", v6, 2u);
    }
  }
  else
  {
    return 1;
  }
  return v3;
}

- (BOOL)isSafeToDeleteAttachmentAtPath:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "length");
  if (v4)
  {
    if (IMOSLoggingEnabled(v4))
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = a3;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to check if the attachment path is safe: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36120], "sharedInstance"), "isSafeToDeleteAttachmentPath:", a3);
  }
  return v4;
}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D360F0], "database");
  MEMORY[0x1E0DE7D20](v3, sel_deleteAttachmentsDirectWithPredicate_);
}

- (void)resetFetchStateForAssets
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "Resetting fetch state for assets (afterRow to nil)", v3, 2u);
    }

  }
}

- (id)batchOfRecordsMissingAssetsAfterRow:(id *)a3 withLimit:(int64_t)a4
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  if (a3)
    v4 = *a3;
  else
    v4 = 0;
  v5 = v4;
  v6 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v6, "count");
      if (v5)
      {
        objc_msgSend(v5, "stringValue");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = CFSTR("nil");
      }
      *(_DWORD *)buf = 134218498;
      v39 = v8;
      v40 = 2112;
      v41 = v9;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Found %lu records afterRow %@ to download {%@} ", buf, 0x20u);
      if (v5)

    }
  }
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentRecordZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v15 = v31;
  if (v14)
  {
    v16 = *(_QWORD *)v34;
    v15 = v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!v15 || (v19 = objc_msgSend(v15, "longLongValue"), v19 < objc_msgSend(v18, "rowID")))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v18, "rowID", v30));
          v20 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v20;
        }
        objc_msgSend(v18, "cloudRecordID", v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v23 = objc_alloc(MEMORY[0x1E0C95070]);
          objc_msgSend(v18, "cloudRecordID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "initWithRecordName:zoneID:", v24, v12);

          if (v25)
          {
            objc_msgSend(v18, "guid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setObject:forKey:", v27, v25);

          }
          else if (IMOSLoggingEnabled(v26))
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v39 = (uint64_t)v18;
              _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Could not create recordID for attachment to upload on record %@", buf, 0xCu);
            }

          }
        }
        else
        {
          if (!IMOSLoggingEnabled(v22))
            continue;
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = (uint64_t)v18;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "cloudRecordID is nil on record %@", buf, 0xCu);
          }
        }

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  if (v30)
    *v30 = objc_retainAutorelease(v15);

  return v32;
}

- (void)updateAssetUsingRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v8 = 0;
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTransfersWithCKRecord:recordWasFetched:downloadAsset:", v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7 && objc_msgSend(v7, "length"))
    -[IMDAttachmentStore _removeTransferFromiCloudBackupWithGuid:](self, "_removeTransferFromiCloudBackupWithGuid:", v7);
  objc_msgSend(MEMORY[0x1E0D39848], "cleanUpAssetsOnDiskForRecord:", v4);

}

- (void)markTransferAsNotSuccessfullyDownloadedWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setCloudKitSyncState:", 5);
    -[IMDAttachmentStore updateAttachment:](self, "updateAttachment:", v6);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Failed to find transfer %@ to mark as unsuccessful", (uint8_t *)&v8, 0xCu);
    }

  }
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
  id v15;
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
          v15 = v3;
          v16 = 2112;
          v17 = v7;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Removing icloud backup attribute for guid %@ path %@", buf, 0x16u);
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

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  IMDAttachmentStore *v5;
  void *v6;

  v5 = self;
  IMDAttachmentStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D15FD3C0(0, (unint64_t *)&qword_1ED935BB0);
  sub_1D1610804();
  v6 = (void *)sub_1D166DA18();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  unint64_t v4;
  IMDAttachmentStore *v5;

  sub_1D15FD3C0(0, (unint64_t *)&qword_1ED935BB0);
  v4 = sub_1D166DBEC();
  v5 = self;
  _sSo18IMDAttachmentStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0(v4);

  swift_bridgeObjectRelease();
}

@end
