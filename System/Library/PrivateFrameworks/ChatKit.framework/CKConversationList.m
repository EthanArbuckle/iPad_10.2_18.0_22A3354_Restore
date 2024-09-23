@implementation CKConversationList

uint64_t __49__CKConversationList__conversationSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareBySequenceNumberAndDateDescending:");
}

void __55__CKConversationList_updateRecoverableConversationList__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "recoverableMessagesCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "conversationForExistingChat:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

uint64_t __50__CKConversationList__nonPlaceholderConversations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPlaceholder") ^ 1;
}

- (void)logConversationsTopCount:(int64_t)a3 bottomCount:(int64_t)a4
{
  CKConversationList *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int64_t v19;
  NSObject *v20;
  NSObject *v21;
  int64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CKConversationList *v32;
  uint64_t v34;
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v4 = self;
  v45 = *MEMORY[0x1E0C80C00];
  v34 = -[NSMutableArray count](self->_trackedConversations, "count");
  v32 = v4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v36 = v34;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "resorted conversation list. length %ld", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v36 = a3;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "top %ld conversations:", buf, 0xCu);
    }

  }
  v7 = -[NSMutableArray count](v4->_trackedConversations, "count");
  if (a3 >= 1 && v7)
  {
    v8 = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](v4->_trackedConversations, "objectAtIndex:", v8 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "chat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastFinishedMessageDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "chat");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastTUConversationCreatedDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "chat");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastScheduledMessageCreatedDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v8 - 1;
          v37 = 2112;
          v38 = v12;
          v39 = 2112;
          v40 = v14;
          v41 = 2112;
          v42 = v16;
          v43 = 2112;
          v44 = v9;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%ld. %@ (lastTUConversationCreatedDate: %@) (lastScheduledMessageCreatedDate: %@) - %@", buf, 0x34u);

          v4 = v32;
        }

      }
      v17 = -[NSMutableArray count](v4->_trackedConversations, "count");
      if (v8 >= a3)
        break;
    }
    while (v8++ < v17);
  }
  if (v34 - a3 >= a4)
    v19 = a4;
  else
    v19 = v34 - a3;
  if ((IMOSLoggingEnabled() & 1) != 0)
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "---------------------------------------", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v36 = v19 & ~(v19 >> 63);
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "bottom %ld conversations:", buf, 0xCu);
    }

  }
  if (v19 >= 1)
  {
    v22 = v34 - (v19 & ~(v19 >> 63));
    do
    {
      -[NSMutableArray objectAtIndex:](v4->_trackedConversations, "objectAtIndex:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v23, "chat");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastFinishedMessageDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "chat");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastTUConversationCreatedDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "chat");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastScheduledMessageCreatedDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v36 = v22;
          v37 = 2112;
          v38 = v26;
          v39 = 2112;
          v40 = v28;
          v41 = 2112;
          v42 = v30;
          v43 = 2112;
          v44 = v23;
          _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "%ld. %@ (lastTUConversationCreatedDate: %@) (lastScheduledMessageCreatedDate: %@) - %@", buf, 0x34u);

          v4 = v32;
        }

      }
      ++v22;
    }
    while (v22 < v34);
  }
}

- (void)_beginTrackingAllExistingChatsIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  NSMutableArray *trackedConversations;
  NSArray *pinnedConversations;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v16 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
    _CKLog();
  }
  if (CKIsRunningInPreferences()
    || CKIsRunningInNanoSettings()
    || CKIsRunningInMessagesOrSpringBoard()
    || IMIsRunningInMessagesComposeViewService())
  {
    self->_loadingConversations = 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Attempting to register existing chats", buf, 2u);
      }

    }
    trackedConversations = self->_trackedConversations;
    self->_trackedConversations = 0;

    pinnedConversations = self->_pinnedConversations;
    self->_pinnedConversations = 0;

    v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v7, "startTimingForKey:", CFSTR("ChatTracking"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedChats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "stopTimingForKey:", CFSTR("ChatTracking"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
        v23 = 2112;
        v24 = v7;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
      }

    }
    *(_WORD *)&self->_loadingConversations = 256;
    if (objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations", v16))
      -[CKConversationList updatePinnedConversationsFromDataSource](self, "updatePinnedConversationsFromDataSource");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("CKConversationListFinishedLoadingNotification"), self, 0);

  }
}

- (CKConversation)_beginTrackingConversationWithChat:(id *)a1
{
  id v3;
  CKConversation *v4;

  v3 = a2;
  if (a1)
  {
    if (CKIsRunningInPreferences()
      || CKIsRunningInNanoSettings()
      || CKIsRunningInMessages()
      || (IMIsRunningInMessagesComposeViewService() & 1) != 0
      || CKIsRunningInCarousel())
    {
      objc_msgSend(v3, "setNumberOfMessagesToKeepLoaded:", 50);
    }
    objc_msgSend(a1, "_alreadyTrackedConversationForChat:", v3);
    v4 = (CKConversation *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v3);
    if ((objc_msgSend(a1[6], "containsObjectIdenticalTo:", v4) & 1) == 0)
      objc_msgSend(a1, "beginTrackingConversation:forChat:", v4, v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_alreadyTrackedConversationForChat:(id)a3
{
  return (id)objc_msgSend(a3, "contextInfo");
}

- (void)beginTrackingConversation:(id)a3 forChat:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *trackedConversations;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CKConversationList _shouldBailBeginTrackingForCurrentProcess](self, "_shouldBailBeginTrackingForCurrentProcess"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v17 = v9;
        v18 = 2048;
        v19 = v6;
        v20 = 2048;
        v21 = v7;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "-beginTrackingConversation called with guid %@ conversation %p chat %p", buf, 0x20u);

      }
    }
    if (!self->_trackedConversations)
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      trackedConversations = self->_trackedConversations;
      self->_trackedConversations = v10;

    }
    if (v6)
    {
      objc_msgSend(v7, "setContextInfo:", v6);
      if (IMIsOscarEnabled())
      {
        objc_msgSend(v6, "chat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isFiltered") == 2;

        if (v13)
        {
          v15 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationList updateEarliestMessageDateForConversations:](self, "updateEarliestMessageDateForConversations:", v14);

        }
      }
      -[CKConversationList _insertConversationIntoSortedConversationList:](self, "_insertConversationIntoSortedConversationList:", v6);
    }
    -[CKConversationList _postConversationListChangedNotification](self, "_postConversationListChangedNotification");
  }

}

- (BOOL)_shouldBailBeginTrackingForCurrentProcess
{
  return !CKIsRunningInPreferences()
      && !CKIsRunningInNanoSettings()
      && !CKIsRunningInMessages()
      && (IMIsRunningInMessagesComposeViewService() & 1) == 0
      && CKIsRunningInCarousel() == 0;
}

- (void)_postConversationListChangedNotification
{
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[CKConversationList loadingConversations](self, "loadingConversations");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not posting _postConversationListChangedNotification: Still loading conversations", v8, 2u);
      }

    }
  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Posting _postConversationListChangedNotification", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("CKConversationListChangedNotification"), self, 0);

  }
}

- (BOOL)loadingConversations
{
  return self->_loadingConversations;
}

- (void)_insertConversationIntoSortedConversationList:(id)a3
{
  NSMutableArray *trackedConversations;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  trackedConversations = self->_trackedConversations;
  v8 = a3;
  v5 = -[NSMutableArray count](trackedConversations, "count");
  -[CKConversationList _conversationSortComparator](self, "_conversationSortComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](trackedConversations, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v5, 1024, v6);

  -[NSMutableArray insertObject:atIndex:](self->_trackedConversations, "insertObject:atIndex:", v8, v7);
}

- (id)_conversationSortComparator
{
  return &__block_literal_global_178_0;
}

- (void)updatePinnedConversationsFromDataSource
{
  -[CKConversationList updatePinnedConversationsFromDataSourceWithConversationFetch:](self, "updatePinnedConversationsFromDataSourceWithConversationFetch:", 1);
}

- (void)setPinnedConversations:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConversations, a3);
}

+ (id)sharedConversationList
{
  void *v2;
  CKConversationList *v3;
  void *v4;

  v2 = (void *)sharedConversationList_sSharedConversationList;
  if (!sharedConversationList_sSharedConversationList)
  {
    v3 = objc_alloc_init(CKConversationList);
    v4 = (void *)sharedConversationList_sSharedConversationList;
    sharedConversationList_sSharedConversationList = (uint64_t)v3;

    v2 = (void *)sharedConversationList_sSharedConversationList;
  }
  return v2;
}

- (id)conversationForExistingChatWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithGUID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_conversationForChat:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CKConversationList)init
{
  CKConversationList *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *conversationsDictionary;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKConversationList;
  v2 = -[CKConversationList init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__invalidateABCaches_, *MEMORY[0x1E0D373C8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__abChanged_, *MEMORY[0x1E0D373C0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__invalidatePartialABCaches_, *MEMORY[0x1E0D37408], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__abPartialChanged_, *MEMORY[0x1E0D373D0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleChatParticipantsDidChange_, *MEMORY[0x1E0D35418], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleChatJoinStateDidChange_, *MEMORY[0x1E0D353D0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handlePreferredServiceChangedNotification_, *MEMORY[0x1E0D354D0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__chatItemsDidChange_, *MEMORY[0x1E0D35328], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleEngroupFinishedUpdating_, *MEMORY[0x1E0D35300], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__chatPropertiesChanged_, *MEMORY[0x1E0D35440], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleChatsWillRemergeNotification_, *MEMORY[0x1E0D354C0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleChatsDidRemergeNotification_, *MEMORY[0x1E0D35498], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleUpdatedMessagesWithSummariesNotification_, *MEMORY[0x1E0D354A8], 0);
    if (CKIsRunningInPreferences()
      || CKIsRunningInNanoSettings()
      || CKIsRunningInMessagesOrSpringBoard())
    {
      objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleRegistryDidRegisterChatNotification_, *MEMORY[0x1E0D35490], 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleRegistryWillUnregisterChatNotification_, *MEMORY[0x1E0D354C8], 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleMemoryWarning_, *MEMORY[0x1E0CEB298], 0);
    }
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateConversationsForNewPinnedConversations_, *MEMORY[0x1E0D35640], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleGroupPhotoChanged_, *MEMORY[0x1E0D35308], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleGroupNameChanged_, *MEMORY[0x1E0D352F0], 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    conversationsDictionary = v2->_conversationsDictionary;
    v2->_conversationsDictionary = (NSMutableDictionary *)v4;

    v2->_simFilterIndex = -1;
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("simFilterIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if ((unint64_t)(v7 - 1) <= 1)
      v2->_simFilterIndex = v7;

  }
  return v2;
}

- (void)_configureForUnsortedConversationList
{
  id v3;

  -[CKConversationList _nonPlaceholderConversations](self, "_nonPlaceholderConversations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v3, 0);

}

- (void)updateConversationListsAndSortIfEnabled
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  _QWORD block[5];
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[CKConversationList conversations](self, "conversations");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList updateFilteredByFocusStateForConversations:](self, "updateFilteredByFocusStateForConversations:", v30);
  -[CKConversationList updateRecoverableConversationList](self, "updateRecoverableConversationList");
  if (-[CKConversationList _shouldShowInboxUI](self, "_shouldShowInboxUI")
    || -[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    v3 = -[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    -[CKConversationList _nonPlaceholderConversations](self, "_nonPlaceholderConversations");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationList _emptyConversationsDictionaryWithConversationsCount:](self, "_emptyConversationsDictionaryWithConversationsCount:", objc_msgSend(v29, "count"));
    v39[0] = v4;
    v39[1] = 3221225472;
    v39[2] = __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_2;
    v39[3] = &unk_1E274C4F8;
    v39[4] = self;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v5;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v39);
    for (i = 1; i != 10; ++i)
    {
      if (i != 7)
      {
        CKConversationListFilterModeStringValue(i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v8, i);
      }
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSMSFilterSyncEnabled");

    if ((v10 & 1) != 0)
    {
      if (!-[CKConversationList _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled"))
      {
LABEL_43:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("CKConversationListDidFinishSorting"), 0, 0);

        goto LABEL_44;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v36 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            if ((unint64_t)objc_msgSend(v15, "filterMode") >= 0x10)
            {
              CKConversationListFilterModeStringValue(objc_msgSend(v15, "filterMode"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v5, "objectForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v17, objc_msgSend(v15, "filterMode"));

              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  v19 = objc_msgSend(v15, "filterMode");
                  *(_DWORD *)buf = 138412546;
                  v44 = 0;
                  v45 = 2048;
                  v46 = v19;
                  _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
                }

              }
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        }
        while (v12);
      }
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v32;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v11);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
            if ((unint64_t)objc_msgSend(v23, "filterMode") >= 0x10)
            {
              CKConversationListFilterModeStringValue(objc_msgSend(v23, "filterMode"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(v5, "objectForKey:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v25, objc_msgSend(v23, "filterMode"));

              }
              else if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  v27 = objc_msgSend(v23, "filterMode");
                  *(_DWORD *)buf = 138412546;
                  v44 = 0;
                  v45 = 2048;
                  v46 = v27;
                  _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
                }

              }
            }
          }
          v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        }
        while (v20);
      }
    }

    goto LABEL_43;
  }
  if (IMIsOscarEnabled())
    -[CKConversationList _configureForOscarEnabledUnsortedConversationList](self, "_configureForOscarEnabledUnsortedConversationList");
  else
    -[CKConversationList _configureForUnsortedConversationList](self, "_configureForUnsortedConversationList");
LABEL_44:

}

- (void)updateRecoverableConversationList
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedChats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CKConversationList_updateRecoverableConversationList__block_invoke;
  v8[3] = &unk_1E274C5C8;
  v8[4] = self;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  -[CKConversationList _recoverableSortComparator](self, "_recoverableSortComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", v6);

  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v7, 7);
}

- (id)_recoverableSortComparator
{
  return &__block_literal_global_220_0;
}

- (NSArray)pinnedConversations
{
  return self->_pinnedConversations;
}

- (CKConversation)pendingConversation
{
  return self->_pendingConversation;
}

- (id)conversationsForFilterMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CKConversationList conversationsDictionary](self, "conversationsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKConversationListFilterModeStringValue(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKConversationList _isParentWithSubfoldersForFilterMode:](self, "_isParentWithSubfoldersForFilterMode:", a3))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 134217984;
        v21 = a3;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Looking into sub classes of parent mode: %lu", (uint8_t *)&v20, 0xCu);
      }

    }
    -[CKConversationList subclassifiedConversationsForFilterMode:](self, "subclassifiedConversationsForFilterMode:", a3);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  if (v7
    && -[CKConversationList _messageSIMFilteringEnabled](self, "_messageSIMFilteringEnabled")
    && self->_simFilterIndex != -1)
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ctSubscriptionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__im_subscriptionContextForForSlotID:", -[CKConversationList simFilterIndex](self, "simFilterIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "labelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationList _filterConversations:byHandleID:simID:](self, "_filterConversations:byHandleID:simID:", v7, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldFilterConversationsByFocus");

  if (v17)
  {
    -[CKConversationList _filterConversationsByFocus:](self, "_filterConversationsByFocus:", v7);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
  }
  if (!v7)
    v7 = (void *)objc_opt_new();
  return v7;
}

- (void)_setConversations:(id)a3 forFilterMode:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v6 = a3;
    -[CKConversationList conversationsDictionary](self, "conversationsDictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    CKConversationListFilterModeStringValue(a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v7);

  }
}

- (NSMutableDictionary)conversationsDictionary
{
  return self->_conversationsDictionary;
}

- (BOOL)_isParentWithSubfoldersForFilterMode:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)updateFilteredByFocusStateForConversations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v4, "shouldDisplayFocusFilterBanner", (_QWORD)v12))
          v11 = objc_msgSend(v4, "conversationMatchesActiveFocusMode:", v10);
        else
          v11 = 1;
        objc_msgSend(v10, "setAllowedByPersonListInActiveFocus:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldShowInboxUI
{
  return CKShouldShowInboxView() != 0;
}

- (id)_nonPlaceholderConversations
{
  void *v2;
  id v3;
  void *v5;

  -[CKConversationList conversations](self, "conversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_210_0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filteredArrayUsingPredicate:", v5);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSArray)conversations
{
  void *v2;
  void *v3;

  -[CKConversationList trackedConversations](self, "trackedConversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSMutableArray)trackedConversations
{
  if (!self->_loadedConversations)
    -[CKConversationList _beginTrackingAllExistingChatsIfNeeded](self, "_beginTrackingAllExistingChatsIfNeeded");
  return self->_trackedConversations;
}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (BOOL)_messageSIMFilteringEnabled
{
  return CKMessageSIMFilteringEnabled();
}

- (void)resort
{
  NSMutableArray *trackedConversations;
  void *v4;

  if (!-[CKConversationList loadingConversations](self, "loadingConversations"))
  {
    trackedConversations = self->_trackedConversations;
    -[CKConversationList _conversationSortComparator](self, "_conversationSortComparator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingComparator:](trackedConversations, "sortUsingComparator:", v4);

    -[CKConversationList logConversationsTopCount:bottomCount:](self, "logConversationsTopCount:bottomCount:", 20, 10);
  }
}

- (CKConversationListScrollingController)scrollingController
{
  CKConversationListScrollingController *scrollingController;
  CKConversationListScrollingController *v4;
  void *v5;
  CKConversationListScrollingController *v6;
  CKConversationListScrollingController *v7;

  scrollingController = self->_scrollingController;
  if (!scrollingController)
  {
    v4 = [CKConversationListScrollingController alloc];
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKConversationListScrollingController initWithConversationList:chatRegistry:](v4, "initWithConversationList:chatRegistry:", self, v5);
    v7 = self->_scrollingController;
    self->_scrollingController = v6;

    scrollingController = self->_scrollingController;
  }
  return scrollingController;
}

- (id)pinningIdentifierMap
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CKConversationList conversations](self, "conversations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v20;
    *(_QWORD *)&v5 = 138412802;
    v17 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "chat", v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "matchingIdentifierForChat:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v3, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            IMLogHandleForCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v24 = v11;
              v25 = 2112;
              v26 = v12;
              v27 = 2112;
              v28 = v8;
              _os_log_error_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_ERROR, "We matched multiple conversations to one pinning identifier. Keeping existing match. matchingIdentifier: %@, match1: %@, match2: %@", buf, 0x20u);
            }

          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v24 = v11;
                v25 = 2112;
                v26 = v8;
                _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Found a match for the conversation in the IMPinnedConversationsController. matchingIdentifier: %@, conversation: %@", buf, 0x16u);
              }

            }
            objc_msgSend(v3, "setObject:forKey:", v8, v11);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v4);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (void)updateConversationsForNewPinnedConversations:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _updateConversationsForNewPinnedConversations:](self, "_updateConversationsForNewPinnedConversations:", v4);

}

- (void)_updateConversationsForNewPinnedConversations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  CKConversationList *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = self;
  -[CKConversationList pinnedConversations](self, "pinnedConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "pinningIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            -[CKConversationList pinnedConversations](v17, "pinnedConversations");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v9;
            v24 = 2112;
            v25 = v12;
            _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "An existing pinned conversation's pinningIdentifier was nil. existingPinnedConversation: %@, pinnedConversations: %@", buf, 0x16u);

          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "isEqualToOrderedSet:", v16))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "A pinned conversation list update notification was received, but the conversations are the same. Ignoring notification.", buf, 2u);
      }

    }
    -[CKConversationList postFinishedInitalPinLoadIfNecessary](v17, "postFinishedInitalPinLoadIfNecessary");
  }
  else
  {
    -[CKConversationList updatePinnedConversationsFromDataSource](v17, "updatePinnedConversationsFromDataSource");
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v4, CFSTR("previousPinnedConversationIdentifiers"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("CKConversationListPinnedConversationsChangedNotification"), v17, v14);

    -[CKConversationList postFinishedInitalPinLoadIfNecessary](v17, "postFinishedInitalPinLoadIfNecessary");
  }

}

- (void)postFinishedInitalPinLoadIfNecessary
{
  id v3;

  if (!-[CKConversationList loadedPinnedConversations](self, "loadedPinnedConversations"))
  {
    -[CKConversationList setLoadedPinnedConversations:](self, "setLoadedPinnedConversations:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CKConversationListFinishedInitalPinLoadNotification"), self, 0);

  }
}

- (void)setLoadedPinnedConversations:(BOOL)a3
{
  self->_loadedPinnedConversations = a3;
}

- (BOOL)loadedPinnedConversations
{
  return self->_loadedPinnedConversations;
}

+ (void)initialize
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__handleRegistryDidLoadNotification_, *MEMORY[0x1E0D35470], 0);

}

+ (void)_handleRegistryDidLoadNotification:(id)a3
{
  void *v3;
  CKConversationMutedChatListMigrator *v4;

  objc_msgSend(a1, "sharedConversationList", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_beginTrackingAllExistingChatsIfNeeded");

  v4 = objc_alloc_init(CKConversationMutedChatListMigrator);
  -[CKConversationMutedChatListMigrator migrateMutedChatListInfoIfNeeded](v4, "migrateMutedChatListInfoIfNeeded");

}

- (BOOL)loadedConversations
{
  return self->_loadedConversations;
}

- (id)conversationForExistingChatWithChatIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (objc_msgSend(v4, "isEqualToString:", CFSTR("-1")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithChatIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)conversationListAlertSuppressionContextForFilterMode:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 > 1)
  {
    CKConversationListFilterModeStringValue(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("ConversationListSuppressionContext"), "stringByAppendingString:", v4);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = CFSTR("ConversationListSuppressionContext");
  }
  return v3;
}

- (id)description
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CKConversationList conversations](self, "conversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v2;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v3), "chat");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "lastFinishedMessageID");
        v6 = objc_msgSend(v4, "__ck_watermarkMessageID");
        objc_msgSend(v4, "lastFinishedMessageDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "__ck_watermarkDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (v5 <= v6)
          v10 = v6;
        else
          v10 = v5;
        objc_msgSend(v7, "laterDate:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceReferenceDate");
        v14 = v13;
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v16 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%lld - %@ | %@ (%lld,%lld) (%f,%f)"), v10, v11, v12, v5, v6, v14, v15);

        objc_msgSend(v25, "addObject:", v16);
        ++v3;
      }
      while (v26 != v3);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

  v17 = (void *)MEMORY[0x1E0CB3940];
  v27.receiver = self;
  v27.super_class = (Class)CKConversationList;
  -[CKConversationList description](&v27, sel_description);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_beginTrackingConversationWithChatIndirect:(id)a3
{
  return -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, a3);
}

- (void)_beginTrackingConversationWithChat:(id)a3 completion:(id)a4
{
  void (**v6)(id, CKConversation *);
  CKConversation *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, CKConversation *))a4;
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v8);
  v7 = (CKConversation *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v8);
  objc_msgSend(v8, "setContextInfo:", v7);
  if (v6)
    v6[2](v6, v7);

}

- (id)conversationForExistingChatWithPinningIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D35798];
    v5 = a3;
    objc_msgSend(v4, "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithPinningIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)conversationForExistingChatWithDeviceIndependentID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D35798];
    v5 = a3;
    objc_msgSend(v4, "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithDeviceIndependentID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)conversationForExistingChatWithGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("-1")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingChatWithGroupID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)conversationForExistingChatWithPersonCentricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatWithPersonID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)conversationsForExistingChatsWithGUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingChatsWithGUIDs:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__CKConversationList_conversationsForExistingChatsWithGUIDs___block_invoke;
    v10[3] = &unk_1E274C3E8;
    v10[4] = self;
    objc_msgSend(v7, "__imArrayByApplyingBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __61__CKConversationList_conversationsForExistingChatsWithGUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_conversationForChat:", a2);
}

- (void)stopTrackingConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "chat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Stop tracking conversation: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  if (v4)
  {
    v8 = objc_msgSend(v4, "isPinned");
    objc_msgSend(v4, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContextInfo:", 0);
    -[NSMutableArray removeObject:](self->_trackedConversations, "removeObject:", v4);
    -[CKConversationList _postConversationListChangedNotification](self, "_postConversationListChangedNotification");
    if (v8)
      -[CKConversationList updatePinnedConversationsFromDataSourceWithConversationFetch:](self, "updatePinnedConversationsFromDataSourceWithConversationFetch:", 0);

  }
}

- (void)_handleRegistryDidRegisterChatNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t, _BYTE *);
  void *v28;
  id v29;
  __int128 *p_buf;
  const __CFString *v31;
  uint64_t v32;
  uint8_t v33[4];
  void *v34;
  __int128 buf;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList pendingConversation](self, "pendingConversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKConversationList pendingConversation](self, "pendingConversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          -[CKConversationList pendingConversation](self, "pendingConversation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Pending conversation has no chat set: %@", (uint8_t *)&buf, 0xCu);

        }
      }
      -[CKConversationList pendingConversation](self, "pendingConversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "participants");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sortedArrayUsingSelector:", sel_guid);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationList pendingConversation](self, "pendingConversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pendingHandles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sortedArrayUsingSelector:", sel_guid);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v36 = 0x2020000000;
      v37 = 0;
      v19 = objc_msgSend(v15, "count");
      v37 = v19 == objc_msgSend(v18, "count");
      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __65__CKConversationList__handleRegistryDidRegisterChatNotification___block_invoke;
        v28 = &unk_1E274C410;
        v29 = v18;
        p_buf = &buf;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v25);

        if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
        {
          v20 = (void *)objc_msgSend(v6, "copyForPendingConversation", v25, v26, v27, v28);
          objc_msgSend(v12, "pendingHandles");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setPendingHandles:", v21);

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v33 = 138412290;
              v34 = v20;
              _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Handles are identical, setting new pending conversation: %@", v33, 0xCu);
            }

          }
          -[CKConversationList setPendingConversation:](self, "setPendingConversation:", v20);
          v31 = CFSTR("CKConversationListWasPendingKey");
          v32 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("CKConversationListConversationLeftNotification"), v12, v23);

        }
      }
      _Block_object_dispose(&buf, 8);

    }
  }

}

void __65__CKConversationList__handleRegistryDidRegisterChatNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compareIDs:", v9);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_handleRegistryWillUnregisterChatNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKConversationList _handleRegistryWillUnregisterChatNotification:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v17 = "-[CKConversationList _handleRegistryWillUnregisterChatNotification:]";
    _CKLog();
  }
  objc_msgSend(v4, "object", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CKConversationList stopTrackingConversation:](self, "stopTrackingConversation:", v7);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CKConversationListConversationLeftNotification"), v7, 0);

    }
    -[CKConversationList pendingConversation](self, "pendingConversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if (v11)
    {
      -[CKConversationList pendingConversation](self, "pendingConversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[CKConversation newPendingConversation](CKConversation, "newPendingConversation");
      objc_msgSend(v6, "participants");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPendingHandles:", v14);

      -[CKConversationList setPendingConversation:](self, "setPendingConversation:", v13);
      v18 = CFSTR("CKConversationListWasPendingKey");
      v19 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("CKConversationListConversationLeftNotification"), v12, v15);

    }
  }

}

- (id)_copyEntitiesForAddressStrings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = +[CKEntity copyEntityForAddressString:](CKEntity, "copyEntityForAddressString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)conversationForHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 create:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = a6;
  return -[CKConversationList conversationForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:create:](self, "conversationForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:create:", a3, a4, 0, 0, a5, 1, v7);
}

- (id)conversationForHandles:(id)a3 displayName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8 create:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v9 = a8;
  v10 = a7;
  v15 = (void *)MEMORY[0x1E0D35798];
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v15, "sharedRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a9;
  objc_msgSend(v20, "_ck_chatForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:", v19, v18, v17, v16, v10, v9, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationList _conversationForChat:](self, "_conversationForChat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)resetCaches
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSMutableArray _copyForEnumerating](self->_trackedConversations, "_copyForEnumerating");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "resetCaches", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setNeedsReload
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_trackedConversations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsReload", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updatePinnedConversationsFromDataSourceWithConversationFetch:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations") & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Updating pinned conversations from the IMPinnedConversationsController", buf, 2u);
      }

    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinnedConversationIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = v31;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v38 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[CKConversationList conversationForExistingChatWithPinningIdentifier:](self, "conversationForExistingChatWithPinningIdentifier:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v12 && IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v11;
                _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Failed to find existing chat for pinning identifier %@", buf, 0xCu);
              }

            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        }
        while (v8);
      }

    }
    -[CKConversationList pinningIdentifierMap](self, "pinningIdentifierMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v31;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v14, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[NSObject addObject:](v5, "addObject:", v20);
          }
          else
          {
            IMLogHandleForCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v19;
              _os_log_error_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_ERROR, "A CKConversation with pinningIdentifier \"%@\" was not found in pinningIdentifierMap. This conversation will appear as not pinned.", buf, 0xCu);
            }

            if (v14)
            {
              objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_28);
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "pinningIdentifierMap == nil", buf, 2u);
              }

            }
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v16);
    }

    v23 = -[NSObject copy](v5, "copy");
    -[CKConversationList setPinnedConversations:](self, "setPinnedConversations:", v23);

  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CKConversationList updatePinnedConversationsFromDataSourceWithConversationFetch:].cold.1(v5, v24, v25, v26, v27, v28, v29, v30);
  }

}

void __83__CKConversationList_updatePinnedConversationsFromDataSourceWithConversationFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "pinningIdentifierMap[%@] == %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)_handleGroupPhotoChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CKConversationList *v8;
  CKConversationList *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  CKGroupUpdate *v18;
  uint64_t v19;
  CKGroupUpdate *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  CKGroupUpdate *v24;
  const __CFString *v25;
  CKConversationList *v26;
  uint8_t buf[4];
  CKConversationList *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "IMChatGroupPhotoChangedNotification _handleGroupPhotoChanged called on conversation list %@ notification %@", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("sender"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (CKConversationList *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList conversationForExistingChat:](self, "conversationForExistingChat:", v8);
  v9 = (CKConversationList *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList setNeedsUpdatedGroupPhotoForVisualIdentity](v9, "setNeedsUpdatedGroupPhotoForVisualIdentity");
  v25 = CFSTR("conversation");
  v26 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("CKConversationListAvatarUpdateNotification"), 0, v10);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[CKConversationList guid](v8, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Found conversation %@ for chatGuid %@", buf, 0x16u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, " => chat %@", buf, 0xCu);
    }

  }
  -[CKConversationList updateConversationVisualIdentityGroupPhotoWithSender:](v9, "updateConversationVisualIdentityGroupPhotoWithSender:", v7);
  if (objc_msgSend(v7, "length"))
  {
    -[CKConversationList setShouldShowGroupPhotoUpdateBanner:](v9, "setShouldShowGroupPhotoUpdateBanner:", 1);
    -[CKConversationList conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:](v9, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "groupPhoto");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length") == 0;

    v18 = [CKGroupUpdate alloc];
    if (v17)
      v19 = 4;
    else
      v19 = 2;
    v20 = -[CKGroupUpdate initWithType:handleID:](v18, "initWithType:handleID:", v19, v7);
    v23 = CFSTR("CKGroupPhotoUpdate");
    v24 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("CKConversationShowGroupPhotoBannersNotification"), v8, v21);

  }
}

- (void)_handleGroupNameChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CKGroupUpdate *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("sender"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationList conversationForExistingChat:](self, "conversationForExistingChat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConversationVisualIdentityDisplayNameWithSender:", v6);
  objc_msgSend(v8, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length")
    && ((objc_msgSend(v9, "groupName"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v11 = objc_msgSend(v10, "length"),
         v10,
         v12 = [CKGroupUpdate alloc],
         v11)
      ? (v13 = 1)
      : (v13 = 5),
        (v14 = -[CKGroupUpdate initWithType:handleID:](v12, "initWithType:handleID:", v13, v6)) != 0))
  {
    v15 = (void *)v14;
    objc_msgSend(v8, "setShouldShowGroupNameUpdateBanner:", 1);
    v16 = 0;
    v20 = CFSTR("GroupNameUpdate");
    v17 = v15;
  }
  else
  {
    v20 = CFSTR("GroupNameUpdate");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 1;
  }
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("CKConversationShowGroupNameBannersNotification"), v7, v18);

}

- (BOOL)_shouldFilterForParticipants:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = MEMORY[0x1E0C9AA60];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)MEMORY[0x1E0D397A8];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "cnContactWithKeys:", v9, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v11) = objc_msgSend(v11, "isCNContactAKnownContact:", v12);

          if ((v11 & 1) != 0)
          {
            v13 = 0;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_13:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)firstUnreadFilteredConversationIgnoringMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedChats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[CKConversationList _isUnreadChat:ignoringMessages:](self, "_isUnreadChat:ignoringMessages:", v11, v4))
        {
          objc_msgSend(v11, "persistentID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationList conversationForExistingChatWithChatIdentifier:](self, "conversationForExistingChatWithChatIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v12 = v14;
          }
          else
          {
            objc_msgSend(v11, "persistentID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKConversationList conversationForExistingChatWithGroupID:](self, "conversationForExistingChatWithGroupID:", v16);
            v12 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)_chatPredicateForFilterMode:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id result;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 > 0xF)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "filterMode") == a3)
          {
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), *MEMORY[0x1E0D377B8], a3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            return v10;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }

    return 0;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), *MEMORY[0x1E0D377B8], 2);
        goto LABEL_21;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), *MEMORY[0x1E0D377B8], 0);
        goto LABEL_21;
      case 3uLL:
        v11 = (void *)MEMORY[0x1E0CB3880];
        v12 = *MEMORY[0x1E0D377B8];
        v13 = 1;
        goto LABEL_20;
      case 4uLL:
        v11 = (void *)MEMORY[0x1E0CB3880];
        v12 = *MEMORY[0x1E0D377B8];
        v13 = 4;
        goto LABEL_20;
      case 5uLL:
        v11 = (void *)MEMORY[0x1E0CB3880];
        v12 = *MEMORY[0x1E0D377B8];
        v13 = 3;
        goto LABEL_20;
      case 6uLL:
        v11 = (void *)MEMORY[0x1E0CB3880];
        v12 = *MEMORY[0x1E0D377B8];
        v13 = 2;
LABEL_20:
        objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %d"), v12, v13);
LABEL_21:
        result = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (BOOL)hasActiveConversations
{
  void *v2;
  BOOL v3;

  if (!CKIsRunningInPreferences()
    && !CKIsRunningInNanoSettings()
    && !CKIsRunningInMessagesOrSpringBoard())
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfExistingChats") != 0;

  return v3;
}

- (id)topMostConversation
{
  -[CKConversationList resort](self, "resort");
  return (id)-[NSMutableArray firstObject](self->_trackedConversations, "firstObject");
}

- (void)_postConversationListUpdateVisibleConversationsNotificationForUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CKConversationList loadingConversations](self, "loadingConversations"))
  {
    if (objc_msgSend(v4, "length"))
    {
      v7 = CFSTR("uid");
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CKConversationListUpdateVisibleConversationsNotification"), self, v5);

  }
}

- (void)unpendConversation
{
  if (self->_pendingConversation)
    -[CKConversationList setPendingConversation:](self, "setPendingConversation:", 0);
}

- (int64_t)unreadCountForFilterMode:(unint64_t)a3
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 == 7)
    return 0;
  -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v3 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unreadCount");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)unreadFilteredConversationCountIgnoringMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedChats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 += -[CKConversationList _isUnreadChat:ignoringMessages:](self, "_isUnreadChat:ignoringMessages:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isUnreadChat:(id)a3 ignoringMessages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (-[CKConversationList _chatHasRelevantUnreadLastMessage:](self, "_chatHasRelevantUnreadLastMessage:", v6))
  {
    objc_msgSend(v6, "persistentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationList conversationForExistingChatWithChatIdentifier:](self, "conversationForExistingChatWithChatIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v6, "persistentID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationList conversationForExistingChatWithGroupID:](self, "conversationForExistingChatWithGroupID:", v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v11, "isKnownSender") && (objc_msgSend(v11, "isMuted") & 1) == 0)
    {
      objc_msgSend(v6, "lastMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "guid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v12 = objc_msgSend(v7, "containsObject:", v15) ^ 1;
      else
        LOBYTE(v12) = 0;

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)relevantUnreadLastMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedChats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v20 = *MEMORY[0x1E0C99768];
    v21 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (-[CKConversationList _chatHasRelevantUnreadLastMessage:](self, "_chatHasRelevantUnreadLastMessage:", v9))
        {
          objc_msgSend(v9, "lastMessage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "guid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v23, "addObject:", v11);
          }
          else
          {
            objc_msgSend(v9, "lastMessage");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** relevantUnreadLastMessages: IMMessage has nil guid: %@"), v12);
            else
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** relevantUnreadLastMessages: IMMessageItem has nil message in chat %@"), v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0C99DA0];
            v28[0] = CFSTR("chat");
            objc_msgSend(v9, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v28[1] = CFSTR("lastMessage");
            v29[0] = v15;
            if (v12)
            {
              objc_msgSend(v12, "description");
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v16 = v22;
            }
            else
            {
              v16 = CFSTR("<nil>");
            }
            v29[1] = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v20, v13, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            IMLogExceptionBacktrace();
            IMLogSimulateCrashForException();

            v4 = v21;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v6);
  }

  return v23;
}

- (BOOL)_chatHasRelevantUnreadLastMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v8;
  char v9;

  v3 = a3;
  if (objc_msgSend(v3, "unreadMessageCount")
    && objc_msgSend(v3, "lastMessageExists")
    && (objc_msgSend(v3, "lastMessage"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isRead"),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v3, "lastMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFromMe");

    v6 = v9 ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deleteConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "-deleteConversation called with: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = v4;
    _CKLog();
  }
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList deleteConversations:](self, "deleteConversations:", v6);

}

- (void)deleteConversations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "-deleteConversations called with: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v28 = v4;
    _CKLog();
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = (id)objc_msgSend(v4, "_copyForEnumerating");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "chat", v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setContextInfo:", 0);
        objc_msgSend(v11, "deleteAllMessagesAndRemoveGroup");
        objc_msgSend(v11, "pinningIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v6, "addObject:", v13);
        -[NSMutableArray removeObject:](self->_trackedConversations, "removeObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v8);
  }

  if (objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations"))
  {
    if (-[CKConversationList remergingConversations](self, "remergingConversations"))
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject conversationsWereDeletedWithIdentifiers:](v14, "conversationsWereDeletedWithIdentifiers:", v6);
  }
  else
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CKConversationList deleteConversations:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  }

LABEL_23:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v4;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("CKConversationListConversationLeftNotification"), v26, 0);

        objc_msgSend(v26, "resetCaches");
        objc_msgSend(v26, "setPendingHandles:", 0);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

}

- (void)_abChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  -[CKConversationList resetCaches](self, "resetCaches");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "AB changed notification, updating caches", v6, 2u);
    }

  }
  -[CKConversationList _postConversationListChangedNotification](self, "_postConversationListChangedNotification");

}

- (void)_invalidatePartialABCaches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D373F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Received address book partial change notification for UID %@.", buf, 0xCu);
    }

  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D373F8]))
    -[CKConversationList resetCaches](self, "resetCaches");
  if (objc_msgSend(v6, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CKConversationList conversations](self, "conversations", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsHandleWithUID:", v6))
            objc_msgSend(v13, "resetCaches");
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)_abPartialChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37400]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _postConversationListUpdateVisibleConversationsNotificationForUID:](self, "_postConversationListUpdateVisibleConversationsNotificationForUID:", v4);

}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleChatParticipantsDidChange:", v4);

}

- (void)_handleChatJoinStateDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleChatJoinStateDidChange:", v4);

}

- (void)_handlePreferredServiceChangedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handlePreferredServiceChangedNotification:", v4);

}

- (void)_chatItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_chatItemsDidChange:", v4);

}

- (void)_handleEngroupFinishedUpdating:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleEngroupFinishedUpdating:", v4);

}

- (void)_chatPropertiesChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationList _alreadyTrackedConversationForChat:](self, "_alreadyTrackedConversationForChat:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_chatPropertiesChanged:", v4);

}

- (void)_handleChatsWillRemergeNotification:(id)a3
{
  -[CKConversationList setRemergingConversations:](self, "setRemergingConversations:", 1);
}

- (void)_handleChatsDidRemergeNotification:(id)a3
{
  id v4;

  -[CKConversationList setRemergingConversations:](self, "setRemergingConversations:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CKConversationListFinishedMergingChatsNotification"), self);

}

- (void)_handleUpdatedMessagesWithSummariesNotification:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    objc_msgSend(v5, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CKConversationListDidReceiveSummaries"), 0, v3);

  }
}

- (id)pendingConversationCreatingIfNecessary
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CKConversationList pendingConversation](self, "pendingConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = +[CKConversation newPendingConversation](CKConversation, "newPendingConversation");
    -[CKConversationList setPendingConversation:](self, "setPendingConversation:", v4);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[CKConversationList pendingConversation](self, "pendingConversation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "no current pendingConversation, creating one: %@", (uint8_t *)&v8, 0xCu);

      }
    }
  }
  -[CKConversationList pendingConversation](self, "pendingConversation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPendingConversation:(id)a3
{
  CKConversation *v5;
  CKConversation **p_pendingConversation;
  CKConversation *pendingConversation;
  NSObject *v8;
  void *v9;
  int v10;
  CKConversation *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (CKConversation *)a3;
  pendingConversation = self->_pendingConversation;
  p_pendingConversation = &self->_pendingConversation;
  if (pendingConversation != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "pendingConversation changed to: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_storeStrong((id *)p_pendingConversation, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("CKConversationListPendingConversationChangedNotification"), v5);

  }
}

- (id)_testingTrackedConversations
{
  NSMutableArray *trackedConversations;
  NSMutableArray *v4;
  NSMutableArray *v5;

  trackedConversations = self->_trackedConversations;
  if (!trackedConversations)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_trackedConversations;
    self->_trackedConversations = v4;

    trackedConversations = self->_trackedConversations;
  }
  return trackedConversations;
}

- (void)_handleMemoryWarning:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received memory warning, clearing caches", v6, 2u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    _CKLogExternal();
  -[CKConversationList resetCaches](self, "resetCaches");

}

- (void)updateConversationFilteredFlagsAndReportSpam
{
  void *v2;
  id v3;

  -[CKConversationList conversations](self, "conversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (updateConversationFilteredFlagsAndReportSpam_onceToken != -1)
  {
    dispatch_once(&updateConversationFilteredFlagsAndReportSpam_onceToken, &__block_literal_global_203_0);
    v2 = v3;
  }
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_207_0);
  if (!updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated)
  {
    updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated = 1;
    IMSetDomainBoolForKey();
  }

}

uint64_t __66__CKConversationList_updateConversationFilteredFlagsAndReportSpam__block_invoke()
{
  uint64_t result;

  result = IMGetDomainBoolForKey();
  updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated = result;
  return result;
}

void __66__CKConversationList_updateConversationFilteredFlagsAndReportSpam__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint8_t v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "wasDetectedAsSpam"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v2, "handles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isContact"))
          {
            objc_msgSend(v3, "clearSMSCategory");
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  if (objc_msgSend(v3, "isFiltered"))
  {
    if (objc_msgSend(v3, "containsMessageFromContactOrMe")
      && objc_msgSend(v3, "isFiltered") <= 1
      && !objc_msgSend(v2, "wasDetectedAsSMSCategory"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Chat has replies: Updating isFiltered to NO", v15, 2u);
        }

      }
      goto LABEL_38;
    }
    if (objc_msgSend(v3, "hasKnownParticipantsCache"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Chat has known participants: Updating isFiltered to NO", v15, 2u);
        }

      }
LABEL_38:
      objc_msgSend(v3, "updateIsFiltered:", 0);
      goto LABEL_40;
    }
    if (objc_msgSend(v3, "shouldBeAllowListed"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Allow listed iMessage: Updating isFiltered to NO", v15, 2u);
        }

      }
      goto LABEL_38;
    }
    objc_msgSend(v3, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 == v12;

    if (v13)
    {
      if ((objc_msgSend(v3, "supportsFilteringExtensions") & 1) == 0)
        objc_msgSend(v3, "clearSMSCategory");
      if (updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated)
        objc_msgSend(v3, "autoReportSpam");
      else
        objc_msgSend(v3, "markAsAutoSpamReported");
    }
  }
LABEL_40:

}

- (void)_configureForOscarEnabledUnsortedConversationList
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[CKConversationList _nonPlaceholderConversations](self, "_nonPlaceholderConversations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CKConversationList__configureForOscarEnabledUnsortedConversationList__block_invoke;
  v8[3] = &unk_1E274C4F8;
  v9 = v4;
  v10 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v5, 0);
  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v6, 9);

}

void __71__CKConversationList__configureForOscarEnabledUnsortedConversationList__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFiltered");

  v5 = 40;
  if (v4 == 2)
    v5 = 32;
  objc_msgSend(*(id *)(a1 + v5), "addObject:", v6);

}

uint64_t __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConversationFilteredFlagsAndReportSpam");
}

void __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "primaryFilterModeForConversation:", v17);
  v4 = *(void **)(a1 + 40);
  CKConversationListFilterModeStringValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v17);

  if (v3 != 6 && v3 != 9)
  {
    v8 = *(void **)(a1 + 40);
    CKConversationListFilterModeStringValue(1uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSMSFilterSyncEnabled");

    v13 = objc_msgSend(v17, "hasUnreadMessages");
    if (v12)
    {
      if (((v13 & 1) != 0 || objc_msgSend(v17, "shouldHoldInUnreadFilter"))
        && !objc_msgSend(v17, "wasDetectedAsSMSSpam"))
      {
LABEL_15:
        objc_msgSend(v17, "setHoldInUnreadFilter:", 1);
        v14 = *(void **)(a1 + 40);
        CKConversationListFilterModeStringValue(8uLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

      }
    }
    else if (((v13 & 1) != 0 || objc_msgSend(v17, "shouldHoldInUnreadFilter"))
           && objc_msgSend(v17, "spamCategory") != 2)
    {
      goto LABEL_15;
    }
  }

}

- (id)_emptyConversationsDictionaryWithConversationsCount:(unint64_t)a3
{
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 10; ++i)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    CKConversationListFilterModeStringValue(i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSMSFilterSyncEnabled");

  if ((v10 & 1) == 0 || -[CKConversationList _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v12)
    {
      v14 = *(_QWORD *)v24;
      *(_QWORD *)&v13 = 138412546;
      v22 = v13;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v16, "filterMode", v22) >= 0x10)
          {
            CKConversationListFilterModeStringValue(objc_msgSend(v16, "filterMode"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
              objc_msgSend(v5, "setObject:forKey:", v18, v17);

            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                v20 = objc_msgSend(v16, "filterMode");
                *(_DWORD *)buf = v22;
                v28 = 0;
                v29 = 2048;
                v30 = v20;
                _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
              }

            }
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v12);
    }

  }
  return v5;
}

- (BOOL)conversation:(id)a3 includedInFilterMode:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:", a4);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "chat", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "chat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "guid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)primaryFilterModeForConversation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = a3;
  if (IMIsOscarEnabled()
    && (objc_msgSend(v4, "chat"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isFiltered"),
        v5,
        v6 == 2))
  {
    v7 = 9;
  }
  else if (-[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    if (-[CKConversationList _shouldTreatConversationAsNonSMSCategorized:](self, "_shouldTreatConversationAsNonSMSCategorized:", v4))
    {
      v7 = -[CKConversationList _filterModeForConversationAsNonSMSCategorized:](self, "_filterModeForConversationAsNonSMSCategorized:", v4);
    }
    else if (objc_msgSend(v4, "spamSubCategory"))
    {
      v8 = objc_msgSend(v4, "spamSubCategory");
      v7 = objc_msgSend(v4, "spamCategory") & 0xF | (16 * v8);
    }
    else
    {
      v10 = objc_msgSend(v4, "spamCategory");
      v7 = v10;
      if (v10 != 4)
      {
        if (v10 == 3)
        {
          v7 = 5;
        }
        else if (IMIsOscarEnabled())
        {
          v7 = 9;
        }
        else
        {
          v7 = 6;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldTreatConversationAsNonSMSCategorized:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  char v12;

  v4 = a3;
  if (!-[CKConversationList _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled"))
    goto LABEL_9;
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecovered");

  if ((v6 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v4, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isFiltered"))
  {

LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v4, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFiltered");

  if (v9 == 1)
    goto LABEL_9;
  objc_msgSend(v4, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsFilteringExtensions");

  if (!v11 || !objc_msgSend(v4, "wasDetectedAsSMSCategory"))
    goto LABEL_9;
  v12 = objc_msgSend(v4, "isKnownSender");
LABEL_10:

  return v12;
}

- (unint64_t)_filterModeForConversationAsNonSMSCategorized:(id)a3
{
  id v3;
  char v4;
  int v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasSetWasKnownSender");
  v5 = objc_msgSend(v3, "wasKnownSender");
  if ((v4 & 1) == 0)
    v5 = objc_msgSend(v3, "isKnownSender");
  if (v5)
    v6 = 2;
  else
    v6 = 3;

  return v6;
}

- (id)subclassifiedConversationsForFilterMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  if (a3 == 4)
    goto LABEL_4;
  if (a3 == 5)
  {
    a3 = 3;
LABEL_4:
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v10, "action") == a3)
          {
            -[CKConversationList conversationsDictionary](self, "conversationsDictionary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            CKConversationListFilterModeStringValue(objc_msgSend(v10, "filterMode"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              objc_msgSend(v5, "addObjectsFromArray:", v13);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    -[CKConversationList _conversationSortComparator](self, "_conversationSortComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingComparator:", v14);

    v15 = (void *)objc_msgSend(v5, "copy");
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = a3;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Filter action mapping shouldn't fail. Got filterAction: %lu, returning empty array", buf, 0xCu);
    }

  }
  v15 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v15;
}

- (id)_filterConversationsByFocus:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_214_0);
}

uint64_t __50__CKConversationList__filterConversationsByFocus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowedByPersonListInActiveFocus");
}

- (id)_filterConversationsWithoutiMessageJunk:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_215_0);
}

uint64_t __62__CKConversationList__filterConversationsWithoutiMessageJunk___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOscarChat") ^ 1;

  return v3;
}

- (id)_filterConversations:(id)a3 byHandleID:(id)a4 simID:(id)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t (*v11)(uint64_t, void *);
  uint64_t *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (unint64_t)a4;
  v9 = (unint64_t)a5;
  v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v8)
    {
      v20 = MEMORY[0x1E0C809B0];
      v11 = __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke;
      v12 = &v20;
      v13 = (void *)v8;
    }
    else
    {
      if (!v9)
      {
        v15 = 0;
        goto LABEL_12;
      }
      v19 = MEMORY[0x1E0C809B0];
      v11 = __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke_2;
      v12 = &v19;
      v13 = (void *)v9;
    }
    v12[1] = 3221225472;
    v12[2] = (uint64_t)v11;
    v12[3] = (uint64_t)&unk_1E274C580;
    v12[4] = (uint64_t)v13;
    v16 = (id *)(v12 + 4);
    objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    if (!objc_msgSend(v15, "count", v19) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "SIM Filter | No conversations found for handleID: %@ simID: %@", buf, 0x16u);
      }

    }
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "SIM Filter | handleID & simID are nil, do not apply any filter", buf, 2u);
    }

  }
  v15 = v7;
LABEL_17:

  return v15;
}

uint64_t __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastAddressedHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastAddressedSIMID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeConversation:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  for (i = 0; i != 10; ++i)
  {
    -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", v7);
    -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v6, i);

  }
}

- (void)updateConversationsWasKnownSender
{
  id v3;

  if (-[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    -[CKConversationList conversations](self, "conversations");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_217_0);

  }
}

uint64_t __55__CKConversationList_updateConversationsWasKnownSender__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWasKnownSender");
}

- (BOOL)isHoldingWasKnownSenderUpdates
{
  return self->_holdingWasKnownSenderUpdates;
}

- (void)beginWasKnownSenderHold
{
  self->_holdingWasKnownSenderUpdates = 1;
}

- (void)releaseWasKnownSenderHold
{
  self->_holdingWasKnownSenderUpdates = 0;
}

- (void)clearHoldInUnreadFilter
{
  id v3;

  if (-[CKConversationList _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:", 8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_218_0);

  }
}

uint64_t __45__CKConversationList_clearHoldInUnreadFilter__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHoldInUnreadFilter:", 0);
}

- (BOOL)_messageSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

uint64_t __48__CKConversationList__recoverableSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestRecoverableMessageDeletionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latestRecoverableMessageDeletionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:", v6);
  return v9;
}

- (void)recoverableDeleteForConversations:(id)a3 deleteDate:(id)a4 synchronousQuery:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | -recoverableDeleteForConversations called with: %@ with deleteDate: %@", buf, 0x16u);
    }

  }
  -[CKConversationList _updatePinnedConversationsControllerForRemovedConversations:](self, "_updatePinnedConversationsControllerForRemovedConversations:", v10);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = (id)objc_msgSend(v10, "_copyForEnumerating");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17++), "prepareForRecoverableDeletionWithDeleteDate:", v11);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  objc_msgSend(v10, "__imArrayByApplyingBlock:", &__block_literal_global_222_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke_2;
  v21[3] = &unk_1E274C610;
  v23 = v7;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v19, "moveMessagesInChatsToRecentlyDeleted:deleteDate:synchronously:completionHandler:", v18, v11, v7, v21);

}

uint64_t __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chat");
}

void __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecoverableMessagesMetadataSynchronously:completionHandler:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)permanentlyDeleteRecoverableMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | -permanentlyDeleteRecoverableMessagesInConversations called with: %@", buf, 0xCu);
    }

  }
  -[CKConversationList _removeConversationsFromRecentlyDeleted:](self, "_removeConversationsFromRecentlyDeleted:", v8);
  -[CKConversationList _deleteBrandLogosIfNeededForConversations:](self, "_deleteBrandLogosIfNeededForConversations:", v8);
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_223_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2;
  v14[3] = &unk_1E274C610;
  v16 = v6;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "permanentlyDeleteRecoverableMessagesInChats:synchronously:completionHandler:", v11, v6, v14);

}

uint64_t __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chat");
}

void __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecoverableMessagesMetadataSynchronously:completionHandler:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_deleteBrandLogosIfNeededForConversations:(id)a3
{
  id v3;
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
  v3 = a3;
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
        if (objc_msgSend(v8, "isBusinessConversation"))
          objc_msgSend(v8, "deleteBrandLogos");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_updatePinnedConversationsControllerForRemovedConversations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | updatingPinnedConversationsForRemovedConversations: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_224_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("pinningIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CKConversationList remergingConversations](self, "remergingConversations"))
  {
    objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversationsWereDeletedWithIdentifiers:", v8);

  }
}

uint64_t __82__CKConversationList__updatePinnedConversationsControllerForRemovedConversations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPinned");
}

- (void)recoverDeletedMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | -recoverDeletedMessagesInConversations called with: %@", buf, 0xCu);
    }

  }
  -[CKConversationList _removeConversationsFromRecentlyDeleted:](self, "_removeConversationsFromRecentlyDeleted:", v8);
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_227);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2;
  v14[3] = &unk_1E274C610;
  v16 = v6;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "recoverMessagesForChats:synchronously:completionHandler:", v11, v6, v14);

}

uint64_t __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "chat");
}

void __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecoverableMessagesMetadataSynchronously:completionHandler:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_removeConversationsFromRecentlyDeleted:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectsInArray:", v4);
  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v6, 7);

}

- (void)recoverJunkMessagesInConversations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Junk Messages | -recoverJunkMessagesInConversations called with: %@", buf, 0xCu);
    }

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CKConversationList_recoverJunkMessagesInConversations___block_invoke;
  v9[3] = &unk_1E274C638;
  v9[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("CKConversationListRecoveredJunkConversationIdentifiersUserInfoKey");
  -[CKConversationList identifiersSetForConversations:](self, "identifiersSetForConversations:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CKConversationListDidRecoverJunkConversationsNotification"), 0, v8);

}

void __57__CKConversationList_recoverJunkMessagesInConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recoverFromJunk");

  objc_msgSend(v10, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v10, "lastAddressedHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_trackSendEventForMySenderID:andParticipants:", v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackiMessageJunkEvent:", 6);
  }

}

- (id)identifiersSetForConversations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CKConversationList_identifiersSetForConversations___block_invoke;
  v8[3] = &unk_1E274C638;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __53__CKConversationList_identifiersSetForConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "chat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)updateEarliestMessageDateForConversations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CKConversationList_updateEarliestMessageDateForConversations___block_invoke;
  v8[3] = &unk_1E274C638;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateEarliestMessageDateForChats:completion:", v7, 0);

}

void __64__CKConversationList_updateEarliestMessageDateForConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "chat");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_trackSendEventForMySenderID:(id)a3 andParticipants:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7 && v7 <= 1)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x193FF3B1C](v9);
    if ((_DWORD)v11 && MEMORY[0x193FF3B1C](v5))
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      IMCountryCodeForNumber();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      IMCountryCodeForNumber();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isEqualToString:", v14));
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = &unk_1E2870330;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = &unk_1E2870348;
    v20[0] = v17;
    v20[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trackiMessageJunkEvent:withDictionary:", 7, v18);

  }
}

- (BOOL)remergingConversations
{
  return self->_remergingConversations;
}

- (void)setRemergingConversations:(BOOL)a3
{
  self->_remergingConversations = a3;
}

- (int64_t)simFilterIndex
{
  return self->_simFilterIndex;
}

- (void)setSimFilterIndex:(int64_t)a3
{
  self->_simFilterIndex = a3;
}

- (void)setHoldingWasKnownSenderUpdates:(BOOL)a3
{
  self->_holdingWasKnownSenderUpdates = a3;
}

- (void)setTrackedConversations:(id)a3
{
  objc_storeStrong((id *)&self->_trackedConversations, a3);
}

- (void)setConversationsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_conversationsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationsDictionary, 0);
  objc_storeStrong((id *)&self->_trackedConversations, 0);
  objc_storeStrong((id *)&self->_pinnedConversations, 0);
  objc_storeStrong((id *)&self->_scrollingController, 0);
  objc_storeStrong((id *)&self->_pendingConversation, 0);
}

- (void)updatePinnedConversationsFromDataSourceWithConversationFetch:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Ignoring request to update pinned conversations from data source from a process that does not support pinned conversations.", a5, a6, a7, a8, 0);
}

- (void)deleteConversations:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Deleting conversations from a process that does not support pinning may leave the deleted conversation pinned.", a5, a6, a7, a8, 0);
}

@end
