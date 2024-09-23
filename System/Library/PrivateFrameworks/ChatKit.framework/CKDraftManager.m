@implementation CKDraftManager

- (id)draftForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "draftForConversation: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v9 = v4;
    _CKLog();
  }
  objc_msgSend(v4, "uniqueIdentifier", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDraftManager _draftForKey:](self, "_draftForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_draftForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *cachedDrafts;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cachedDrafts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CKComposition savedCompositionForGUID:](CKComposition, "savedCompositionForGUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      cachedDrafts = self->_cachedDrafts;
      if (!cachedDrafts)
      {
        v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = self->_cachedDrafts;
        self->_cachedDrafts = v7;

        cachedDrafts = self->_cachedDrafts;
      }
      -[NSMutableDictionary setObject:forKey:](cachedDrafts, "setObject:forKey:", v5, v4);
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "_draftForKey: %@, comp %@", (uint8_t *)&v11, 0x16u);
    }

  }
  return v5;
}

+ (id)sharedInstance
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (sDraftManager)
    return (id)sDraftManager;
  v3 = objc_alloc_init((Class)a1);
  v4 = (void *)sDraftManager;
  sDraftManager = (uint64_t)v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("PendingCleared")) & 1) != 0)
  {

    goto LABEL_11;
  }
  v6 = CKIsRunningInMessages();

  if (!v6)
  {
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "****** Not Clearing pending drafts *******", v10, 2u);
      }

    }
    return (id)sDraftManager;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "****** Clearing pending drafts *******", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", 1, CFSTR("PendingCleared"));

  objc_msgSend((id)sDraftManager, "clearDraftForPendingConversation");
  objc_msgSend((id)sDraftManager, "saveCompositionAndFlushCache:", 0);
  return (id)sDraftManager;
}

- (void)dealloc
{
  objc_super v3;

  -[CKDraftManager saveCompositionAndFlushCache:](self, "saveCompositionAndFlushCache:", 1);
  v3.receiver = self;
  v3.super_class = (Class)CKDraftManager;
  -[CKDraftManager dealloc](&v3, sel_dealloc);
}

- (void)_clearDraftForConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CKDraftManager _clearDraftForConversation:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s conversation:[%@]", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = "-[CKDraftManager _clearDraftForConversation:]";
    v8 = v4;
    _CKLog();
  }
  objc_msgSend(v4, "uniqueIdentifier", v7, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDraftManager _setDraft:forKey:](self, "_setDraft:forKey:", 0, v6);

}

- (void)setDraft:(id)a3 forConversation:(id)a4
{
  char *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  char *v22;
  const char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (char *)a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "setDraft: %@ forConversation: %@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v22 = v6;
    v24 = v7;
    _CKLog();
  }
  objc_msgSend(v7, "uniqueIdentifier", v22, v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasNonwhiteSpaceContent") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "bizIntent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;

  }
  v12 = objc_msgSend(v6, "isExpirableComposition");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAudioMessagesEntryViewRecordingEnabled");

  if (v14)
  {
    if (v10)
      v10 = objc_msgSend(v6, "isAudioComposition") ^ 1;
    if (v12)
      v12 = objc_msgSend(v6, "isAudioComposition") ^ 1;
  }
  if (v6)
    v15 = v9 == 0;
  else
    v15 = 1;
  if (v15)
    v16 = 1;
  else
    v16 = v10;
  v17 = IMOSLoggingEnabled();
  if (v16 | v12)
  {
    if (v17)
    {
      CKLogCStringForType(15);
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Clearing the draft conversation. This is expected if the conversation has NO composition, or the composition lacks content, or the conversation has no unique identifier, or composition was only whitespace, or the composition was expirable (and not an audio message). Conversation: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v23 = v7;
      _CKLogExternal();
    }
    -[CKDraftManager _clearDraftForConversation:](self, "_clearDraftForConversation:", v7, v23);
  }
  else
  {
    if (v17)
    {
      CKLogCStringForType(15);
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[CKDraftManager setDraft:forConversation:]";
        v29 = 2112;
        v30 = v6;
        v31 = 2112;
        v32 = v7;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_DEBUG, "%s draft:[%@],conversation:[%@]", buf, 0x20u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v25 = v6;
      v26 = v7;
      v23 = "-[CKDraftManager setDraft:forConversation:]";
      _CKLog();
    }
    objc_msgSend(v7, "uniqueIdentifier", v23, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDraftManager _setDraft:forKey:](self, "_setDraft:forKey:", v6, v20);

    if (IMIsRunningInMessagesExtension())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CKDraftManagerSavedDraft"), 0, 0, 1u);
    }
  }

}

- (id)draftForPendingConversationWithRecipients:(id *)a3
{
  NSObject *v5;
  void *v6;
  const char *v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CKDraftManager draftForPendingConversationWithRecipients:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v8 = "-[CKDraftManager draftForPendingConversationWithRecipients:]";
    _CKLog();
  }
  -[CKDraftManager _draftForKey:](self, "_draftForKey:", CFSTR("Pending"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[CKDraftManager _pendingRecipients](self, "_pendingRecipients");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)setDraftForPendingConversation:(id)a3 withRecipients:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 136315650;
        v10 = "-[CKDraftManager setDraftForPendingConversation:withRecipients:]";
        v11 = 2112;
        v12 = v6;
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "%s draft:[%@],recipients:[%@]", (uint8_t *)&v9, 0x20u);
      }

    }
    -[CKDraftManager _setDraft:forKey:](self, "_setDraft:forKey:", v6, CFSTR("Pending"));
    -[CKDraftManager _setPendingRecipients:](self, "_setPendingRecipients:", v7);
  }
  else
  {
    -[CKDraftManager clearDraftForPendingConversation](self, "clearDraftForPendingConversation");
  }

}

- (void)clearDraftForPendingConversation
{
  NSObject *v3;
  const char *v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(15);
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CKDraftManager clearDraftForPendingConversation]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v4 = "-[CKDraftManager clearDraftForPendingConversation]";
    _CKLog();
  }
  -[CKDraftManager _setDraft:forKey:](self, "_setDraft:forKey:", 0, CFSTR("Pending"), v4);
  -[CKDraftManager _setPendingRecipients:](self, "_setPendingRecipients:", 0);
}

- (void)clearDraftForComposition:(id)a3
{
  objc_msgSend(a3, "cleanupCKShareFromComposition");
  -[CKDraftManager clearDraftForPendingConversation](self, "clearDraftForPendingConversation");
}

- (void)saveCompositionAndFlushCache:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSArray *pendingRecipients;
  void *v14;
  char v15;
  NSArray *v16;
  NSObject *v17;
  NSArray *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  NSArray *v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_dirtyDraftIDs;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_cachedDrafts, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "saveCompositionWithGUID:", v9);

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->_dirtyDraftIDs, "removeAllObjects");
  if (v3)
    -[CKDraftManager flushCache](self, "flushCache");
  -[CKDraftManager _pendingRecipientsURL](self, "_pendingRecipientsURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_pendingRecipients, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        pendingRecipients = self->_pendingRecipients;
        *(_DWORD *)buf = 138412290;
        v25 = pendingRecipients;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Saving draft with recipients: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self, 100, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = objc_msgSend(v14, "writeToURL:options:error:", v11, 1073741825, &v19);
    v16 = (NSArray *)v19;
    if ((v15 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(15);
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_DEBUG, "Recipients write failure: %@", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v18 = v16;
        _CKLog();
      }
      -[NSArray writeToURL:atomically:](self->_pendingRecipients, "writeToURL:atomically:", v11, 1, v18);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeItemAtURL:error:", v11, 0);
  }

}

- (void)flushCache
{
  -[NSMutableDictionary removeAllObjects](self->_cachedDrafts, "removeAllObjects");
}

- (id)_pendingRecipientsURL
{
  if (_pendingRecipientsURL_onceToken != -1)
    dispatch_once(&_pendingRecipientsURL_onceToken, &__block_literal_global_96);
  return (id)_pendingRecipientsURL_sPendingRecipientsURL;
}

void __39__CKDraftManager__pendingRecipientsURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  CKDraftsDirectoryURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  v8[1] = CFSTR("Pending");
  v8[2] = CFSTR("recipients.plist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v3, 0);
  v5 = (void *)_pendingRecipientsURL_sPendingRecipientsURL;
  _pendingRecipientsURL_sPendingRecipientsURL = v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_pendingRecipientsURL_sPendingRecipientsURL, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

}

- (void)_setDraft:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *cachedDrafts;
  NSMutableSet *v11;
  NSMutableSet *dirtyDraftIDs;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "_setDraft: %@, %@", (uint8_t *)&v14, 0x16u);
    }

  }
  if (v6)
  {
    if (!self->_cachedDrafts)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      cachedDrafts = self->_cachedDrafts;
      self->_cachedDrafts = v9;

    }
    if (!self->_dirtyDraftIDs)
    {
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      dirtyDraftIDs = self->_dirtyDraftIDs;
      self->_dirtyDraftIDs = v11;

    }
    -[NSMutableDictionary objectForKey:](self->_cachedDrafts, "objectForKey:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 != v6)
    {
      -[NSMutableDictionary setObject:forKey:](self->_cachedDrafts, "setObject:forKey:", v6, v7);
      -[NSMutableSet addObject:](self->_dirtyDraftIDs, "addObject:", v7);
    }

  }
  else
  {
    +[CKComposition deleteCompositionWithGUID:](CKComposition, "deleteCompositionWithGUID:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_cachedDrafts, "removeObjectForKey:", v7);
    -[NSMutableSet removeObject:](self->_dirtyDraftIDs, "removeObject:", v7);
  }

}

- (void)_setPendingRecipients:(id)a3
{
  NSArray *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  if (self->_pendingRecipients != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_pendingRecipients, a3);
    v6 = -[NSArray count](self->_pendingRecipients, "count");
    v5 = v9;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDraftManager _pendingRecipientsURL](self, "_pendingRecipientsURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemAtURL:error:", v8, 0);

      v5 = v9;
    }
  }

}

- (id)_pendingRecipients
{
  NSArray *pendingRecipients;
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  pendingRecipients = self->_pendingRecipients;
  if (!pendingRecipients)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CKDraftManager _pendingRecipientsURL](self, "_pendingRecipientsURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v4, "initWithContentsOfURL:", v5);
    v7 = self->_pendingRecipients;
    self->_pendingRecipients = v6;

    pendingRecipients = self->_pendingRecipients;
  }
  return pendingRecipients;
}

- (NSMutableDictionary)cachedDrafts
{
  return self->_cachedDrafts;
}

- (void)setCachedDrafts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDrafts, a3);
}

- (NSMutableSet)dirtyDraftIDs
{
  return self->_dirtyDraftIDs;
}

- (void)setDirtyDraftIDs:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyDraftIDs, a3);
}

- (NSArray)pendingRecipients
{
  return self->_pendingRecipients;
}

- (void)setPendingRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRecipients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRecipients, 0);
  objc_storeStrong((id *)&self->_dirtyDraftIDs, 0);
  objc_storeStrong((id *)&self->_cachedDrafts, 0);
}

@end
