@implementation IMRecentItemsList

+ (id)sharedInstance
{
  if (qword_1ECFC7630 != -1)
    dispatch_once(&qword_1ECFC7630, &unk_1E3FB3688);
  return (id)qword_1ECFC7590;
}

- (IMRecentItemsList)init
{
  IMRecentItemsList *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMRecentItemsList;
  v2 = -[IMRecentItemsList init](&v4, sel_init);
  if (v2)
    v2->_diskWritingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.private.IMSharedUtilities.IMRecents", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_diskWritingQueue);
  self->_diskWritingQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMRecentItemsList;
  -[IMRecentItemsList dealloc](&v3, sel_dealloc);
}

- (int64_t)cacheSizeForDomain:(id)a3
{
  if (qword_1EE503EE0 != -1)
    dispatch_once(&qword_1EE503EE0, &unk_1E3FB4628);
  return objc_msgSend((id)objc_msgSend((id)qword_1EE503ED8, "objectForKey:", a3), "integerValue");
}

- (void)dispatchCacheUpdateWithBlock:(id)a3
{
  NSObject *diskWritingQueue;
  _QWORD block[5];

  if (a3)
  {
    diskWritingQueue = self->_diskWritingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2A62DC;
    block[3] = &unk_1E3FB6E20;
    block[4] = a3;
    dispatch_async(diskWritingQueue, block);
  }
}

- (void)deleteRecentItemWithFileURL:(id)a3 GUID:(id)a4 forDomain:(id)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19E2A643C;
  v5[3] = &unk_1E3FB6E48;
  v5[4] = a4;
  v5[5] = self;
  v5[6] = a3;
  v5[7] = a5;
  -[IMRecentItemsList dispatchCacheUpdateWithBlock:](self, "dispatchCacheUpdateWithBlock:", v5);
}

- (void)deleteRecentItemWithData:(id)a3 GUID:(id)a4 forDomain:(id)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_19E2A64FC;
  v5[3] = &unk_1E3FB6E48;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  v5[7] = a5;
  -[IMRecentItemsList dispatchCacheUpdateWithBlock:](self, "dispatchCacheUpdateWithBlock:", v5);
}

- (void)deleteAllRecentItemsForDomain:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_19E2A659C;
  v3[3] = &unk_1E3FB58C8;
  v3[4] = a3;
  -[IMRecentItemsList dispatchCacheUpdateWithBlock:](self, "dispatchCacheUpdateWithBlock:", v3);
}

- (void)deleteRecentsInFirstLaunch
{
  if ((IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", objc_msgSend((id)IMSystemRootDirectory(), "stringByAppendingString:", CFSTR("/var/mobile/Library/SMS/Recents/")), 0);
  }
}

- (void)addRecentItemWithData:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6
{
  _QWORD v6[9];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19E2A67E8;
  v6[3] = &unk_1E3FB6E70;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = self;
  v6[8] = a6;
  -[IMRecentItemsList dispatchCacheUpdateWithBlock:](self, "dispatchCacheUpdateWithBlock:", v6);
}

- (void)fetchRecentStickersWithCompletion:(id)a3
{
  uint64_t v5;
  NSObject *diskWritingQueue;
  _QWORD block[9];
  _QWORD v8[5];
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[6];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_19E2475FC;
  v12[4] = sub_19E2474E0;
  v12[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_19E2475FC;
  v10[4] = sub_19E2474E0;
  v11 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_19E2475FC;
  v8[4] = sub_19E2474E0;
  v9 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 10);
  v5 = MEMORY[0x1A1AE7D58]("IMDAttachmentRecordCopyAttachmentStickers", CFSTR("IMDPersistence"));
  diskWritingQueue = self->_diskWritingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19E2A69C8;
  block[3] = &unk_1E3FB6EC0;
  block[5] = v12;
  block[6] = v8;
  block[7] = v10;
  block[8] = v5;
  block[4] = a3;
  dispatch_async(diskWritingQueue, block);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
}

- (void)fetchRecentItemsForDomain:(id)a3 completion:(id)a4
{
  NSObject *diskWritingQueue;
  _QWORD v8[12];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;
  _QWORD v14[6];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_19E2475FC;
  v14[4] = sub_19E2474E0;
  v14[5] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_19E2475FC;
  v12[4] = sub_19E2474E0;
  v13 = 0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = sub_19E2475FC;
  v11[4] = sub_19E2474E0;
  v11[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_19E2475FC;
  v10[4] = sub_19E2474E0;
  v10[5] = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_19E2475FC;
  v9[4] = sub_19E2474E0;
  v9[5] = 0;
  diskWritingQueue = self->_diskWritingQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E2A6F90;
  v8[3] = &unk_1E3FB6EE8;
  v8[4] = self;
  v8[5] = a3;
  v8[8] = v11;
  v8[9] = v9;
  v8[10] = v10;
  v8[11] = v12;
  v8[6] = a4;
  v8[7] = v14;
  dispatch_async(diskWritingQueue, v8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

- (void)_addRecentDataPayloadEntry:(id)a3 toDomain:(id)a4
{
  NSObject *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v32 = (void *)objc_msgSend(a3, "GUID");
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v49 = (uint64_t)a4;
      v50 = 2112;
      v51 = v32;
      v52 = 2112;
      v53 = objc_msgSend(a3, "timestamp");
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Adding new recents entry in domain: %@ with GUID: %@ and timestamp: %@", buf, 0x20u);
    }
  }
  obj = (id)objc_msgSend(-[IMRecentItemsList _recentsCacheForDomain:](self, "_recentsCacheForDomain:", a4), "mutableCopy");
  v5 = IMOSLoggingEnabled();
  if (obj)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = (uint64_t)a4;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Updating existing Recents cache for domain: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v5)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = (uint64_t)a4;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Creating new Recents cache for domain: %@", buf, 0xCu);
      }
    }
    obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  objc_msgSend(obj, "addObject:", objc_msgSend(a3, "asJSONObject"));
  v8 = -[IMRecentItemsList _buildLRUCacheUsingArray:forDomain:](self, "_buildLRUCacheUsingArray:forDomain:", obj, a4);
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v10;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Cache Size: %tu", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (uint64_t)v8;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Cache contents: %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    v12 = objc_msgSend(obj, "count");
    if (v12 != objc_msgSend(v8, "count"))
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v13)
      {
        v15 = *(_QWORD *)v42;
        *(_QWORD *)&v14 = 138412290;
        v27 = v14;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16, v27);
            if (v18)
            {
              v19 = *(_QWORD *)v38;
LABEL_27:
              v20 = 0;
              while (1)
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v8);
                if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "valueForKey:", CFSTR("guid")), "isEqualToString:", objc_msgSend(v17, "valueForKey:", CFSTR("guid"))) & 1) != 0)break;
                if (v18 == ++v20)
                {
                  v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
                  if (v18)
                    goto LABEL_27;
                  goto LABEL_33;
                }
              }
            }
            else
            {
LABEL_33:
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  v22 = objc_msgSend(v17, "valueForKey:", CFSTR("guid"));
                  *(_DWORD *)buf = v27;
                  v49 = v22;
                  _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Removing deprecated recents item: %@", buf, 0xCu);
                }
              }
              -[IMRecentItemsList _removeRecentDataPayloadEntryFromDisk:forDomain:](self, "_removeRecentDataPayloadEntryFromDisk:forDomain:", objc_msgSend(v17, "valueForKey:", CFSTR("guid")), a4);
            }
            ++v16;
          }
          while (v16 != v13);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v13);
      }
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v34;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v8);
          if (objc_msgSend(v32, "isEqualToString:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v25), "valueForKey:", CFSTR("guid"))))
          {
            if (IMOSLoggingEnabled())
            {
              v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Saving new Recents Payload to disk", buf, 2u);
              }
            }
            -[IMRecentItemsList _saveRecentDataPayloadEntryToDisk:forDomain:](self, "_saveRecentDataPayloadEntryToDisk:forDomain:", a3, a4);
          }
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v23);
    }
    -[IMRecentItemsList _updateRecentsCache:forDomain:](self, "_updateRecentsCache:forDomain:", v8, a4);
  }

}

- (void)addRecentItemAtFileURL:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6
{
  NSObject *v6;
  _QWORD v7[10];
  uint8_t buf[16];
  _QWORD v9[6];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_19E2475FC;
  v9[4] = sub_19E2474E0;
  v9[5] = 0;
  if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_19E2A7C58;
    v7[3] = &unk_1E3FB6F10;
    v7[4] = a4;
    v7[5] = a6;
    v7[6] = a3;
    v7[7] = self;
    v7[8] = a5;
    v7[9] = v9;
    -[IMRecentItemsList dispatchCacheUpdateWithBlock:](self, "dispatchCacheUpdateWithBlock:", v7);
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "No file URL provided when adding recent", buf, 2u);
    }
  }
  _Block_object_dispose(v9, 8);
}

- (void)_removeRecentDataPayloadEntry:(id)a3 forDomain:(id)a4
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v19 = a4;
      v20 = 2112;
      v21 = objc_msgSend(a3, "GUID");
      v22 = 2112;
      v23 = objc_msgSend(a3, "timestamp");
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Updating cache with Data Payload entry for Domain: %@ with GUID: %@ and timestamp: %@", buf, 0x20u);
    }
  }
  v8 = (void *)objc_msgSend(-[IMRecentItemsList _recentsCacheForDomain:](self, "_recentsCacheForDomain:", a4), "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("guid")), "isEqualToString:", objc_msgSend(a3, "GUID")))
        {
          objc_msgSend(v8, "removeObject:", v12);
          -[IMRecentItemsList _removeRecentDataPayloadEntryFromDisk:forDomain:](self, "_removeRecentDataPayloadEntryFromDisk:forDomain:", objc_msgSend(a3, "GUID"), a4);
          -[IMRecentItemsList _updateRecentsCache:forDomain:](self, "_updateRecentsCache:forDomain:", v8, a4);
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)_saveRecentDataPayloadEntryToDisk:(id)a3 forDomain:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)FormattedDataFilePath(a4, (void *)objc_msgSend(a3, "GUID"));
  v14 = 0;
  IMSharedHelperEnsureDirectoryExistsAtPath(objc_msgSend(v5, "stringByDeletingLastPathComponent"));
  if (objc_msgSend(a3, "messageItemInfo"))
  {
    v6 = objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("json"));
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", objc_msgSend(a3, "messageItemInfo"), 0, &v14);
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v14;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Failed to save recent item info dictionary onto disk. Error: %@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v7, "writeToFile:atomically:", v6, 1);
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Creating a new Recents Item payload file at: %@", buf, 0xCu);
    }
  }
  if (objc_msgSend(a3, "payloadData"))
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "payloadData"), "writeToFile:atomically:", v5, 1);
    v11 = IMOSLoggingEnabled();
    if ((v10 & 1) != 0)
    {
      if (v11)
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Wrote data to disk successfully. Posting IMRecentItemsListUpdatedNotification", buf, 2u);
        }
      }
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.imagent.IMRecentItemsListUpdatedNotification"), "UTF8String"));
    }
    else if (v11)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Failed to write data to disk", buf, 2u);
      }
    }
  }
}

- (void)_removeRecentDataPayloadEntryFromDisk:(id)a3 forDomain:(id)a4
{
  void *v5;
  uint64_t v6;
  char v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)FormattedDataFilePath(a4, a3);
  v6 = objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v15 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isDeletableFileAtPath:", v5))return;
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v5, &v15);
  v8 = IMOSLoggingEnabled();
  if ((v7 & 1) != 0)
  {
    if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        v10 = "Successfully removed data payload: %@";
        v11 = v9;
        v12 = 12;
LABEL_9:
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
      }
    }
  }
  else if (v8)
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v15;
      v10 = "Failed to delete payload data from file %@. Error: %@";
      v11 = v13;
      v12 = 22;
      goto LABEL_9;
    }
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v6))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v6, &v15);
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v17 = a3;
          v18 = 2112;
          v19 = v15;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Failed to delete dictionary info for GUID %@. Error: %@", buf, 0x16u);
        }
      }
    }
  }
}

- (id)_buildLRUCacheUsingArray:(id)a3 forDomain:(id)a4
{
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  IMRecentItemsList *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v18 = a4;
  v16 = self;
  v28 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Building Recents list as Least Recently Used Cache...", buf, 2u);
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v21 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v21)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", objc_msgSend(v9, "objectForKey:", CFSTR("guid"), v16, v18)))
        {
          if (objc_msgSend(v6, "count"))
          {
            v10 = 0;
            do
            {
              v11 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
              if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("guid")), "isEqualToString:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("guid"))))
              {
                v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timestamp")), "integerValue");
                if (v12 > objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("timestamp")), "integerValue"))objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v10, v9);
              }
              ++v10;
            }
            while (v10 < objc_msgSend(v6, "count"));
          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", objc_msgSend(v9, "objectForKey:", CFSTR("guid")));
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }
  objc_msgSend(v6, "sortUsingComparator:", &unk_1E3FB24D8, v16, v18);
  v13 = objc_msgSend(v17, "cacheSizeForDomain:", v19);
  if (objc_msgSend(v6, "count") <= v13)
    v13 = objc_msgSend(v6, "count");
  v14 = (void *)objc_msgSend(v6, "subarrayWithRange:", 0, v13);

  return v14;
}

- (id)_recentsCacheForDomain:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v3 = FormattedRecentsCacheFilePath(a3);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3))
    goto LABEL_17;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Retrieving Recents cache from JSON file...", buf, 2u);
    }
  }
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v10);
    if (v6)
    {
      if (IMOSLoggingEnabled())
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v10;
          _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Failed read JSON data from recents cache. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
LABEL_17:
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "No data from parsing %@. This must be the first time we're creating a cache", buf, 0xCu);
      }
    }
    return 0;
  }
  return v6;
}

- (void)_updateRecentsCache:(id)a3 forDomain:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  char v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v5 = (void *)FormattedRecentsCacheFilePath(a4);
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Updating Recents cache into JSON file: %@", buf, 0xCu);
    }
  }
  IMSharedHelperEnsureDirectoryExistsAtPath(objc_msgSend(v5, "stringByDeletingLastPathComponent"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v15);
  if (!v15)
  {
    v12 = objc_msgSend(v7, "writeToFile:atomically:", v5, 1);
    v13 = IMOSLoggingEnabled();
    if ((v12 & 1) != 0)
    {
      if (!v13)
        return;
      v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        return;
      *(_WORD *)buf = 0;
      v9 = "Successfully written JSON to file";
    }
    else
    {
      if (!v13)
        return;
      v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        return;
      *(_WORD *)buf = 0;
      v9 = "Failed to write recents cache into file!";
    }
    v10 = v14;
    v11 = 2;
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      v9 = "Failed to generate json object from recents cache for %@";
      v10 = v8;
      v11 = 12;
LABEL_16:
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
}

- (id)_guidForFileURL:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "lastPathComponent");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), IMSharedHelperMD5HashOfFileAtPath(objc_msgSend(a3, "path")), objc_msgSend(v4, "stringByDeletingPathExtension"));
}

@end
