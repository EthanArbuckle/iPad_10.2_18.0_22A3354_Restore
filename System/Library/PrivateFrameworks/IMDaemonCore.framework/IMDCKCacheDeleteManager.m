@implementation IMDCKCacheDeleteManager

+ (id)sharedInstance
{
  if (qword_1ED935C90 != -1)
    dispatch_once(&qword_1ED935C90, &unk_1E922B420);
  return (id)qword_1ED935DC0;
}

- (IMDCKCacheDeleteManager)init
{
  char *v2;
  IMDCKCacheDeleteManager *v3;
  IMPurgedAttachmentHandler *v4;
  IMPurgedAttachmentHandler *purgedAttachmentHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDCKCacheDeleteManager;
  v2 = -[IMDCKCacheDeleteManager init](&v7, sel_init);
  v3 = (IMDCKCacheDeleteManager *)v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 9) = 65537;
    v4 = -[IMPurgedAttachmentHandler initWithBatchSize:]([IMPurgedAttachmentHandler alloc], "initWithBatchSize:", 64);
    purgedAttachmentHandler = v3->_purgedAttachmentHandler;
    v3->_purgedAttachmentHandler = v4;

    -[IMPurgedAttachmentHandler setDelegate:](v3->_purgedAttachmentHandler, "setDelegate:", v3);
  }
  return v3;
}

- (id)_ckUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (BOOL)_deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  _BOOL8 should_defer;
  NSObject *v6;
  _BOOL8 v7;
  NSObject *v8;
  char v9;
  void *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    should_defer = xpc_activity_should_defer(v3);
    if (should_defer)
    {
      if (IMOSLoggingEnabled(should_defer))
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", buf, 2u);
        }

      }
      v7 = xpc_activity_set_state(v4, 3);
      if (!v7 && IMOSLoggingEnabled(v7))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", v12, 2u);
        }

      }
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isDeviceCharging");

  }
  return v9;
}

- (void)updateAttachmentFileSizesWithActivity:(id)a3
{
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *updated;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  _BOOL4 v33;
  NSObject *v34;
  __int128 v35;
  _xpc_activity_s *activity;
  void *context;
  unsigned int v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  activity = (_xpc_activity_s *)a3;
  v4 = -[IMDCKCacheDeleteManager isUpdatingAttachmentFileSizes](self, "isUpdatingAttachmentFileSizes");
  if (v4)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Is already updating file sizes, returning", buf, 2u);
      }
LABEL_5:

    }
  }
  else
  {
    v6 = IMBagIntValueWithDefault();
    if (v6)
    {
      if (!IMOSLoggingEnabled(v6))
        goto LABEL_52;
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Server bag does not allow attachment filesize updating, retunring", buf, 2u);
      }
      goto LABEL_5;
    }
    -[IMDCKCacheDeleteManager setIsUpdatingAttachmentFileSizes:](self, "setIsUpdatingAttachmentFileSizes:", 1);
    IMGetCachedDomainValueForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");

    v38 = 0;
    v9 = 0;
    *(_QWORD *)&v10 = 138412290;
    v35 = v10;
    do
    {
      if (!-[IMDCKCacheDeleteManager _deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:](self, "_deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:", activity, v35))break;
      context = (void *)MEMORY[0x1D17EA968]();
      if (IMOSLoggingEnabled(context))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v12;
          v47 = 2112;
          v48 = v13;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Calling IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark with rowID %@ iteration %@", buf, 0x16u);

        }
      }
      updated = (void *)IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark();
      v39 = updated;
      if (updated)
      {
        if (objc_msgSend(updated, "count"))
        {
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v15 = v39;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v41 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v19, "objectForKey:", CFSTR("filename"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKey:", CFSTR("rowID"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = objc_msgSend(v21, "longLongValue");

                objc_msgSend(v19, "objectForKey:", CFSTR("guid"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = -[IMDCKCacheDeleteManager canMarkPurgeableIfIsRichLinkForTransferGUID:](self, "canMarkPurgeableIfIsRichLinkForTransferGUID:", v22);
                if (v20)
                  v24 = v23;
                else
                  v24 = 0;
                if (v24)
                {
                  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "markAttachmentPurgeable:", v20);

                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            }
            while (v16);
          }

        }
        else
        {
          v26 = IMOSLoggingEnabled(0);
          v9 += 20;
          if ((_DWORD)v26)
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Got an empty set of attachments back - there are still more so increasing watermark by 20", buf, 2u);
            }

          }
        }
      }
      else
      {
        v26 = IMOSLoggingEnabled(0);
        if ((_DWORD)v26)
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "No more attachment fileSizes to fix up, got nil back from query", buf, 2u);
          }

        }
        v9 = -1;
      }
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v35;
          v46 = v30;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Previous batch of attachment filesize updates completed, setting new watermark to be %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainValueForKey();

      objc_autoreleasePoolPop(context);
      ++v38;
      v8 = v9;
    }
    while (v39);
    if (activity)
    {
      v32 = xpc_activity_set_state(activity, 5);
      v33 = v32;
      if (IMOSLoggingEnabled(v32))
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v46) = v33;
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Stopping filesize update. Set state attachment filesizes updated activity result %d", buf, 8u);
        }

      }
    }
    -[IMDCKCacheDeleteManager setIsUpdatingAttachmentFileSizes:](self, "setIsUpdatingAttachmentFileSizes:", 0);
  }
LABEL_52:

}

- (void)registerWithCacheDelete
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14C2CD4;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  if (qword_1ED935FB8 != -1)
    dispatch_once(&qword_1ED935FB8, block);
}

- (void)_cacheDeleteSetUp
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  CFStringRef v7;
  int v8;
  void *v9;
  id v10;
  id v11[2];
  _BYTE buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "cacheDeleteEnabled");
      v6 = CFSTR("NO");
      if (v5)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Setting up cache delete callbacks cache delete enabled %@", buf, 0xCu);

    }
  }
  -[IMDCKCacheDeleteManager isUsingCentralizedModel](self, "isUsingCentralizedModel");
  -[IMDCKCacheDeleteManager setIsUsingCentralizedModel:](self, "setIsUsingCentralizedModel:", IMGetDomainBoolForKeyWithDefaultValue());
  if (-[IMDCKCacheDeleteManager isUsingCentralizedModel](self, "isUsingCentralizedModel"))
  {
    CacheDeleteRegisterInfoCallbacks();
    CacheDeleteInitPurgeMarker();
    v7 = CFStringCreateWithCString(0, (const char *)objc_msgSend(CFSTR("/var/mobile/Library/SMS"), "fileSystemRepresentation"), 0x8000100u);
    v8 = objc_msgSend(CFSTR("/var/mobile/Library/SMS"), "isEqualToString:", CFSTR("all"));
    v9 = &unk_1E9271928;
    if (v8)
      v9 = 0;
    v10 = v9;
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[1] = (id)v7;
    objc_copyWeak(v11, (id *)buf);
    CacheDeleteRegisterPurgeNotification();
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    CacheDeleteRegisterInfoCallbacks();
  }
}

- (void)resetAttachmentWatermark
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "markAllAttachmentsAsNotPurgeable");

    v3 = IMSetDomainValueForKey();
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Attachment watermark reset to 0", v5, 2u);
      }

    }
  }
}

- (id)_cacheDeleteRequestCacheableSpaceGuidanceWithID:(id)a3 diskVolume:(id)a4 urgency:(int)a5 requestedSize:(unint64_t)a6
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedLong:", a6);
  v9 = (void *)CacheDeleteRequestCacheableSpaceGuidance();

  return v9;
}

- (id)_cacheDeleteGuidanceDictionaryForRequestedSize:(unint64_t)a3
{
  if (qword_1EFC63D80 != -1)
    dispatch_once(&qword_1EFC63D80, &unk_1E922B550);
  return (id)MEMORY[0x1E0DE7D20](self, sel__cacheDeleteRequestCacheableSpaceGuidanceWithID_diskVolume_urgency_requestedSize_);
}

- (BOOL)canWriteFileOfEstimatedSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[IMDCKCacheDeleteManager isDeviceLowOnDiskSpace](self, "isDeviceLowOnDiskSpace"))
  {
    if (v4)
    {
      -[IMDCKCacheDeleteManager _cacheDeleteGuidanceDictionaryForRequestedSize:](self, "_cacheDeleteGuidanceDictionaryForRequestedSize:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_GUIDANCE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedLongLongValue");

      -[IMDCKCacheDeleteManager setDeviceLowOnDiskSpace:](self, "setDeviceLowOnDiskSpace:", v10 < a3);
      -[IMDCKCacheDeleteManager setAllowsWritingToDisk:](self, "setAllowsWritingToDisk:", objc_msgSend(v8, "isEqualToString:", CFSTR("CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE")) ^ 1);
      v11 = -[IMDCKCacheDeleteManager allowsWritingToDisk](self, "allowsWritingToDisk");
      if (!v11 && IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = v7;
          v17 = 2112;
          v18 = v13;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Cache delete  guidance %@ requested size %@", (uint8_t *)&v15, 0x16u);

        }
      }

    }
  }
  else if (!-[IMDCKCacheDeleteManager isDeviceLowOnDiskSpace](self, "isDeviceLowOnDiskSpace"))
  {
    -[IMDCKCacheDeleteManager setAllowsWritingToDisk:](self, "setAllowsWritingToDisk:", 1);
  }
  return -[IMDCKCacheDeleteManager allowsWritingToDisk](self, "allowsWritingToDisk");
}

- (BOOL)shouldDownloadAssetsOfSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4
{
  void *v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[IMDCKCacheDeleteManager _cacheDeleteGuidanceDictionaryForRequestedSize:](self, "_cacheDeleteGuidanceDictionaryForRequestedSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_GUIDANCE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCKCacheDeleteManager setAllowsWritingToDisk:](self, "setAllowsWritingToDisk:", objc_msgSend(v7, "isEqualToString:", CFSTR("CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE")) ^ 1);
    v8 = -[IMDCKCacheDeleteManager allowsWritingToDisk](self, "allowsWritingToDisk");
    if (!v8 && IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Cache delete  guidance %@ requested size %@", (uint8_t *)&v12, 0x16u);

      }
    }

  }
  return -[IMDCKCacheDeleteManager allowsWritingToDisk](self, "allowsWritingToDisk", a3);
}

- (id)reportAvailableSpaceToBeDeleted:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDCKCacheDeleteManager _purgeableSpaceGivenUrgency:](self, "_purgeableSpaceGivenUrgency:", v4);
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Purgeable callback -- purgeableSpace: %lld purgeableNumber: %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)deleteAttachmentsAndReturnBytesDeleted:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDCKCacheDeleteManager _deleteAttachmentsAndReturnBytesDeleted:](self, "_deleteAttachmentsAndReturnBytesDeleted:", v4);
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
      v11 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v18 = v8;
      v19 = 2112;
      if (v10)
        v11 = CFSTR("YES");
      v20 = v7;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Purge callback -- Deleted bytes: %lld, volume: %@ is running on main thread: %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)createDictionaryForNotDeletingAnyAttachments:(id)a3 urgency:(int)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "nothingToPurgeDictionary -- volume: %@ purgeableSpace: %@", buf, 0x16u);
    }

  }
  v10[0] = CFSTR("CACHE_DELETE_VOLUME");
  v10[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canMarkPurgeableIfIsRichLinkForTransferGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageForAttachmentGUID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "balloonBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D375F8]);

  v10 = objc_msgSend(v5, "canMarkPurgeableIfIsRichLink:", v9);
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "filename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "hideAttachment");
      objc_msgSend(v7, "balloonBundleID");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      v19 = 138413314;
      v20 = v3;
      if (v13)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      if ((_DWORD)v10)
        v16 = CFSTR("YES");
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "canMarkPurgeableIfIsRichLinkForTransferGUID: %@ file: [%@], hideAttachment: [%@], bundleID: [%@] purgeable: [%@]", (uint8_t *)&v19, 0x34u);

    }
  }

  return v10;
}

- (id)_copyAttachmentRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((unint64_t)(objc_msgSend(v3, "count") - 1) > 8)
    objc_msgSend(v3, "objectAtIndexedSubscript:", 9);
  else
    objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();
  if (!v5)
  {
    v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();
    if (!v5)
    {
      if (objc_msgSend(v3, "count"))
      {
        v6 = 0;
        v7 = 0;
        do
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();

          if (!v5)
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();

            if (!v5)
              break;
          }
          ++v6;
          v7 = v5;
        }
        while (v6 < objc_msgSend(v3, "count"));
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (int64_t)_purgeableSpaceGivenUrgency:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  int64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[IMDCKCacheDeleteManager purgeableAttachmentSize](self, "purgeableAttachmentSize");
  v5 = v4;
  switch(a3)
  {
    case 1:
      v6 = (double)v4;
      v7 = 0.25;
      goto LABEL_6;
    case 2:
      v6 = (double)v4;
      v7 = 0.5;
      goto LABEL_6;
    case 3:
      v6 = (double)v4;
      v7 = 0.75;
LABEL_6:
      v8 = (uint64_t)(v6 * v7);
      break;
    case 4:
      v8 = v4;
      break;
    default:
      v8 = 0;
      break;
  }
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 134218496;
      v12 = v5;
      v13 = 2048;
      v14 = v8;
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "_purgeableSpaceGivenUrgency -- Bytes available to purge: %lld result: %lld urgency: %d", (uint8_t *)&v11, 0x1Cu);
    }

  }
  return v8;
}

- (int64_t)_deleteAttachmentsAndReturnBytesDeleted:(int)a3
{
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint8_t v11[16];

  v5 = -[IMDCKCacheDeleteManager _purgeableSpaceGivenUrgency:](self, "_purgeableSpaceGivenUrgency:");
  if (a3 == 4)
  {
    v6 = -1;
  }
  else
  {
    v6 = v5;
    if (v5 < 0)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "We somehow got back a negative number of bytes to delete so we don't want to delete anything", v11, 2u);
        }

      }
      v6 = 0;
    }
  }
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cacheDeleteEnabled");

  if (v9)
    return -[IMDCKCacheDeleteManager purgeAttachments:](self, "purgeAttachments:", v6);
  else
    return 0;
}

- (id)__wrapperAroundCacheDeletePurgeableCallback:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[IMDCKCacheDeleteManager reportAvailableSpaceToBeDeleted:urgency:](self, "reportAvailableSpaceToBeDeleted:urgency:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKCacheDeleteManager createDictionaryForNotDeletingAnyAttachments:urgency:](self, "createDictionaryForNotDeletingAnyAttachments:urgency:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "cacheDeleteEnabled");

  if ((_DWORD)v6)
  {
    v10 = v7;

    v8 = v10;
  }

  return v8;
}

- (id)__wrapperAroundCacheDeletePurgingCallback:(id)a3 urgency:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[IMDCKCacheDeleteManager deleteAttachmentsAndReturnBytesDeleted:urgency:](self, "deleteAttachmentsAndReturnBytesDeleted:urgency:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKCacheDeleteManager createDictionaryForNotDeletingAnyAttachments:urgency:](self, "createDictionaryForNotDeletingAnyAttachments:urgency:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "cacheDeleteEnabled");

  if ((_DWORD)v6)
  {
    v10 = v7;

    v8 = v10;
  }

  return v8;
}

- (int64_t)purgeableAttachmentSize
{
  void *v2;
  char v3;
  uint64_t v4;
  int64_t PurgeableDiskSpace;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cacheDeleteEnabled");

  if ((v3 & 1) != 0)
  {
    PurgeableDiskSpace = IMDAttachmentRecordGetPurgeableDiskSpace();
    if (IMOSLoggingEnabled(PurgeableDiskSpace))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", PurgeableDiskSpace);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Purgeable space %@", (uint8_t *)&v10, 0xCu);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Tried to obtain purgeable attachments without proper default ---- please set them: defaults write com.apple.madrid EnableCacheDelete -BOOL YES", (uint8_t *)&v10, 2u);
      }

    }
    return 0;
  }
  return PurgeableDiskSpace;
}

- (int64_t)purgeAttachments:(int64_t)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v21;
  int64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cacheDeleteEnabled");

  v8 = IMOSLoggingEnabled(v7);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v21 = 134217984;
        v22 = a3;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "purgeAttachments with bytes: %lld", (uint8_t *)&v21, 0xCu);
      }

    }
    v10 = (void *)IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace();
    if (v10)
    {
      -[IMDCKCacheDeleteManager _fileTransfersToDelete:](self, "_fileTransfersToDelete:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = objc_msgSend(v10, "count");
          v14 = objc_msgSend(v11, "count");
          v21 = 134218240;
          v22 = v13;
          v23 = 2048;
          v24 = v14;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "We got back %lu records from persistence to delete which resulted in %lu file transfers to delete", (uint8_t *)&v21, 0x16u);
        }

      }
      v15 = -[IMDCKCacheDeleteManager _deleteFilesOnDiskAndUpdateTransfers:](self, "_deleteFilesOnDiskAndUpdateTransfers:", v11);

      goto LABEL_26;
    }
    v17 = IMIsRunningInAutomation();
    if ((_DWORD)v17)
    {
      objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postCoreAutomationNotificationFinishedPurgingAttachments:withErrorString:", 0, CFSTR("No attachments to delete"));

    }
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, " We didn't get back any attachments to purge", (uint8_t *)&v21, 2u);
      }

    }
LABEL_25:
    v15 = 0;
LABEL_26:

    return v15;
  }
  if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Tried to purge attachments without proper default ---- please set them: defaults write com.apple.madrid PurgeWithCacheDelete -BOOL YES", (uint8_t *)&v21, 2u);
    }

  }
  if (IMIsRunningInAutomation())
  {
    objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postCoreAutomationNotificationFinishedPurgingAttachments:withErrorString:", 0, CFSTR("PurgeWithCacheDelete default not enabled"));
    goto LABEL_25;
  }
  return 0;
}

- (id)_fileTransfersToDelete:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
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
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = objc_msgSend(v9, "rowID");
            *(_DWORD *)buf = 134217984;
            v19 = v12;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "We failed to create an IMFileTransfer for IMDAttachmentRecordRef with identifier: %lld", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (int64_t)_deleteFilesOnDiskAndUpdateTransfers:(id)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v38;
  id v39;
  int64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  NSObject *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cacheDeleteEnabled");

  if ((v4 & 1) != 0)
  {
    if (IMIsRunningInAutomation())
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v39 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = v38;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (!v8)
    {
      v40 = 0;
      goto LABEL_47;
    }
    v40 = 0;
    v9 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "existsAtLocalPath");
        v13 = v12;
        v14 = IMOSLoggingEnabled(v12);
        if (v13)
        {
          if (v14)
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "localPath");
              v16 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "guid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v47 = v16;
              v48 = 2112;
              v49 = v17;
              _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We are removing the file at path: %@ for transfer: %@", buf, 0x16u);

            }
          }
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isSafeToDeleteAttachmentAtPath:", v19);

          if ((v20 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0;
            objc_msgSend(v22, "removeItemAtPath:error:", v23, &v41);
            v24 = v41;

            v26 = IMOSLoggingEnabled(v25);
            if (v24)
            {
              if (v26)
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v47 = v24;
                  _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "There was an error trying to remove the file: %@", buf, 0xCu);
                }

              }
            }
            else
            {
              if (v26)
              {
                OSLogHandleForIMFoundationCategory();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "We successfully removed the file - setting the transfer state to waiting for accept", buf, 2u);
                }

              }
              v34 = objc_msgSend(v11, "totalBytes");
              if (IMIsRunningInAutomation())
                objc_msgSend(v39, "addObject:", v11);
              +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "updateTransferAsWaitingForAccept:", v11);

              v24 = 0;
              v40 += v34;
            }
          }
          else
          {
            if (IMOSLoggingEnabled(v21))
            {
              OSLogHandleForIMFoundationCategory();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v11, "guid");
                v31 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "localPath");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v47 = v31;
                v48 = 2112;
                v49 = v32;
                _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "We attempted to delete a path that was not safe to delete for guid: %@ path: %@", buf, 0x16u);

              }
            }
            v24 = 0;
          }
        }
        else
        {
          if (!v14)
            continue;
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "guid");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localPath");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v28;
            v48 = 2112;
            v49 = v29;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "The transfer we want to remove does not exist at its local path -- transfer (%@) local path (%@)", buf, 0x16u);

          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (!v8)
      {
LABEL_47:

        if (IMIsRunningInAutomation())
          -[IMDCKCacheDeleteManager _postTransferInfoOfDeletedTransfers:](self, "_postTransferInfoOfDeletedTransfers:", v39);

        goto LABEL_50;
      }
    }
  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Tried to call _deleteFilesOnDiskAndUpdateTransfers without proper default ---- please set them: defaults write com.apple.madrid EnableCacheDelete -BOOL YES", buf, 2u);
    }

  }
  v40 = 0;
LABEL_50:

  return v40;
}

- (void)_postTransferInfoOfDeletedTransfers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _QWORD v32[4];
  _QWORD v33[4];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "localPath");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = CFSTR("-1");
        if (v8)
          v10 = (__CFString *)v8;
        v11 = v10;

        v12 = objc_msgSend(v7, "transferState");
        v13 = objc_msgSend(v7, "existsAtLocalPath");
        if (v12)
          v14 = 0;
        else
          v14 = v13;
        v32[0] = CFSTR("existsAtLocalPath");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v15;
        v33[1] = v11;
        v32[1] = CFSTR("localPath");
        v32[2] = CFSTR("transferState");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v16;
        v32[3] = CFSTR("success");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33[3] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setObject:forKey:", v18, v19);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v4);
  }

  if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v22;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Created %lu dictionarie(s) for transfer info of deleted attachment(s)", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D397B8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postCoreAutomationNotificationFinishedPurgingAttachments:withErrorString:", v25, 0);

}

- (void)metricAttachmentsToPurge:(int64_t)a3 withActivity:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  int64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceConditionsAllowPeriodicSync");

  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cloudKitSyncingEnabled");

  v12 = IMOSLoggingEnabled(v11);
  if ((v10 & v8 & 1) != 0)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 134217984;
        v20 = a3;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "We are going to try and fetch attachments we would want to delete from local disk with bytes to free up: %lld", (uint8_t *)&v19, 0xCu);
      }

    }
    v14 = (void *)IMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace();
    if (objc_msgSend(v14, "count"))
    {
      -[IMDCKCacheDeleteManager _fileTransfersToValidate:](self, "_fileTransfersToValidate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCKCacheDeleteManager _fetchTransfersFromCloudKit:withActivity:](self, "_fetchTransfersFromCloudKit:withActivity:", v15, v6);

    }
  }
  else if (v12)
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = CFSTR("NO");
      if (v10)
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      if (v8)
        v17 = CFSTR("YES");
      v19 = 138412546;
      v20 = (int64_t)v18;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Did NOT metric fetching synced attachments from CloudKit. CK Enabled %@ , device conditions allow sync %@", (uint8_t *)&v19, 0x16u);
    }

  }
}

- (id)_fileTransfersToValidate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = IMFileTransferFromIMDAttachmentRecordRef(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v10 = objc_msgSend(v9, "existsAtLocalPath");
        if ((_DWORD)v10)
        {
          objc_msgSend(v4, "addObject:", v9);
        }
        else if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v9;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "We got a fileTransfer that doesn't exist that we think we can delete for CacheDelete: %@", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_fetchTransfersFromCloudKit:(id)a3 withActivity:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = vcvtpd_u64_f64((double)v8 / 30.0);
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = v9;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Going to try and fetch from sync controller with %ld batches to fetch", (uint8_t *)&v12, 0xCu);
    }

  }
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsSyncing:", 1);

  -[IMDCKCacheDeleteManager _fetchTransfersFromCloudKit:indexOfTransfers:numberOfBatchesToFetch:activity:withCompletion:](self, "_fetchTransfersFromCloudKit:indexOfTransfers:numberOfBatchesToFetch:activity:withCompletion:", v6, 0, v9, v7, &unk_1E922B570);
}

- (id)_getIndexSetForBatch:(id)a3 indexOfTransfers:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "count");
  if (v5 - a4 >= 0x1E)
    v6 = 30;
  else
    v6 = v5 - a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", a4, v6);
}

- (unint64_t)_indexOfNextBatch:(id)a3 totalTransfers:(id)a4 indexOfTransfers:(unint64_t)a5
{
  return objc_msgSend(a3, "count") + a5;
}

- (BOOL)_shouldFetchNextBatch:(unint64_t)a3 totalTransfers:(id)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];

  v6 = a4;
  -[IMDCKCacheDeleteManager _ckUtilitiesSharedInstance](self, "_ckUtilitiesSharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceConditionsAllowPeriodicSync");

  if ((v8 & 1) != 0)
  {
    v10 = objc_msgSend(v6, "count") - 1 >= a3;
  }
  else
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "We disconnected from power or wifi in between batches, so cutting the batches short", v13, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (void)_fetchTransfersFromCloudKit:(id)a3 indexOfTransfers:(unint64_t)a4 numberOfBatchesToFetch:(unint64_t)a5 activity:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  _BOOL8 alreadyCapturedErrorWithAutoBugCapture;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v26 = a6;
  v12 = a7;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = v14;
      v39 = 2112;
      v40 = v15;
      v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "_fetchTransfers with totalTransferCount: %@ index of transfers: %@ number of batches to fetch: %@", buf, 0x20u);

    }
  }
  -[IMDCKCacheDeleteManager _getIndexSetForBatch:indexOfTransfers:](self, "_getIndexSetForBatch:indexOfTransfers:", v11, a4, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsAtIndexes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IMDCKCacheDeleteManager _indexOfNextBatch:totalTransfers:indexOfTransfers:](self, "_indexOfNextBatch:totalTransfers:indexOfTransfers:", v18, v11, a4);
  v20 = -[IMDCKCacheDeleteManager _shouldFetchNextBatch:totalTransfers:](self, "_shouldFetchNextBatch:totalTransfers:", v19, v11);
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  alreadyCapturedErrorWithAutoBugCapture = self->_alreadyCapturedErrorWithAutoBugCapture;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1D14C6634;
  v29[3] = &unk_1E922B598;
  v33 = a4;
  v34 = v19;
  v35 = a5;
  v36 = v20;
  v29[4] = self;
  v30 = v11;
  v31 = v27;
  v32 = v12;
  v23 = v12;
  v24 = v27;
  v25 = v11;
  objc_msgSend(v21, "_fetchAndValidateFileTransfersFromCloudKit:capturedWithABC:activity:completion:", v18, alreadyCapturedErrorWithAutoBugCapture, v24, v29);

}

- (void)batchCompletedWithTransfers:(id)a3
{
  id v4;

  v4 = a3;
  if (IMIsRunningInAutomation())
    -[IMDCKCacheDeleteManager _postTransferInfoOfDeletedTransfers:](self, "_postTransferInfoOfDeletedTransfers:", v4);

}

- (IMPurgedAttachmentHandler)purgedAttachmentHandler
{
  return self->_purgedAttachmentHandler;
}

- (void)setPurgedAttachmentHandler:(id)a3
{
  objc_storeStrong((id *)&self->_purgedAttachmentHandler, a3);
}

- (BOOL)alreadyCapturedErrorWithAutoBugCapture
{
  return self->_alreadyCapturedErrorWithAutoBugCapture;
}

- (void)setAlreadyCapturedErrorWithAutoBugCapture:(BOOL)a3
{
  self->_alreadyCapturedErrorWithAutoBugCapture = a3;
}

- (BOOL)allowsWritingToDisk
{
  return self->_allowsWritingToDisk;
}

- (void)setAllowsWritingToDisk:(BOOL)a3
{
  self->_allowsWritingToDisk = a3;
}

- (BOOL)isDeviceLowOnDiskSpace
{
  return self->_deviceLowOnDiskSpace;
}

- (void)setDeviceLowOnDiskSpace:(BOOL)a3
{
  self->_deviceLowOnDiskSpace = a3;
}

- (BOOL)isUsingCentralizedModel
{
  return self->_isUsingCentralizedModel;
}

- (void)setIsUsingCentralizedModel:(BOOL)a3
{
  self->_isUsingCentralizedModel = a3;
}

- (BOOL)isUpdatingAttachmentFileSizes
{
  return self->_isUpdatingAttachmentFileSizes;
}

- (void)setIsUpdatingAttachmentFileSizes:(BOOL)a3
{
  self->_isUpdatingAttachmentFileSizes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgedAttachmentHandler, 0);
}

@end
