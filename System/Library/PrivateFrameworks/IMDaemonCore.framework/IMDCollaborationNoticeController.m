@implementation IMDCollaborationNoticeController

+ (id)sharedController
{
  if (qword_1ED936078 != -1)
    dispatch_once(&qword_1ED936078, &unk_1E922EBC8);
  return (id)qword_1ED936060;
}

- (IMDCollaborationNoticeController)init
{
  IMDCollaborationNoticeController *v2;
  IMDCollaborationNoticeController *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *noticeDataQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *mappingChatsToHighlightsQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *collaborationNoticeDispatcherQueue;
  SWHighlightCenter *v12;
  SWHighlightCenter *highlightCenter;
  IMDCollaborationNoticeDispatcher *v14;
  IMDCollaborationNoticeDispatcher *noticeDispatcher;
  uint64_t v16;
  NSDictionary *highlightURLsForChatGUID;
  uint64_t v18;
  NSSet *highlightURLs;
  IMDCollaborationNoticeStore *v20;
  IMDCollaborationNoticeStore *noticeStore;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)IMDCollaborationNoticeController;
  v2 = -[IMDCollaborationNoticeController init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[IMDCollaborationNoticeController init]";
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
      }

    }
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.NoticeArrayQueue", v5);
    noticeDataQueue = v3->_noticeDataQueue;
    v3->_noticeDataQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.MappingHighlightsToChatsQueue", 0);
    mappingChatsToHighlightsQueue = v3->_mappingChatsToHighlightsQueue;
    v3->_mappingChatsToHighlightsQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.IMDaemonCore.IMDCollaborationNoticeController.CollaborationNoticeDispatcherQueue", 0);
    collaborationNoticeDispatcherQueue = v3->_collaborationNoticeDispatcherQueue;
    v3->_collaborationNoticeDispatcherQueue = (OS_dispatch_queue *)v10;

    if (objc_msgSend(MEMORY[0x1E0D397F8], "supportsSharedWithYou"))
    {
      v12 = (SWHighlightCenter *)objc_alloc_init((Class)MEMORY[0x1D17EA3EC](CFSTR("SWHighlightCenter"), CFSTR("SharedWithYou")));
      highlightCenter = v3->_highlightCenter;
      v3->_highlightCenter = v12;

      -[SWHighlightCenter setDelegate:](v3->_highlightCenter, "setDelegate:", v3);
      v14 = objc_alloc_init(IMDCollaborationNoticeDispatcher);
      noticeDispatcher = v3->_noticeDispatcher;
      v3->_noticeDispatcher = v14;

      -[IMDCollaborationNoticeDispatcher setDelegate:](v3->_noticeDispatcher, "setDelegate:", v3);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v16 = objc_claimAutoreleasedReturnValue();
      highlightURLsForChatGUID = v3->_highlightURLsForChatGUID;
      v3->_highlightURLsForChatGUID = (NSDictionary *)v16;

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v18 = objc_claimAutoreleasedReturnValue();
      highlightURLs = v3->_highlightURLs;
      v3->_highlightURLs = (NSSet *)v18;

      v3->_hasPopulatedHighlightTracking = 0;
      v20 = objc_alloc_init(IMDCollaborationNoticeStore);
      noticeStore = v3->_noticeStore;
      v3->_noticeStore = v20;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", v3, sel__handleChatParticipantsDidChange_, CFSTR("__kIMDChatParticipantsDidChangeNotification"), 0);

    }
  }
  return v3;
}

- (NSDictionary)highlightURLsForChatGUID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1D15C77A0;
  v11 = sub_1D15C77B0;
  v12 = 0;
  -[IMDCollaborationNoticeController noticeDataQueue](self, "noticeDataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15C77B8;
  v6[3] = &unk_1E922EBF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setHighlightURLsForChatGUID:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  -[IMDCollaborationNoticeController highlightURLsForChatGUID](self, "highlightURLsForChatGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToDictionary:", v4);

  if ((v5 & 1) == 0)
  {
    -[IMDCollaborationNoticeController noticeDataQueue](self, "noticeDataQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D15C78C0;
    block[3] = &unk_1E9228750;
    block[4] = self;
    v9 = v7;
    dispatch_barrier_sync(v6, block);

  }
}

- (id)noticesForChatGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCollaborationNoticeController highlightURLsForChatGUID](self, "highlightURLsForChatGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "noticesForURLs:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Found %@ notices for chatGUID: %@ : %@", (uint8_t *)&v14, 0x20u);

    }
  }

  return v9;
}

- (void)broadcastNoticesDidChangeForChatGUIDs:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (v3 = (id)objc_msgSend(v3, "count")) != 0)
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v9 = 136315394;
        v10 = "-[IMDCollaborationNoticeController broadcastNoticesDidChangeForChatGUIDs:]";
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%s guids: %@.", (uint8_t *)&v9, 0x16u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcasterForChatListeners");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collaborationNoticesDidChangeForChatGUIDs:", v4);

  }
  else if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[IMDCollaborationNoticeController broadcastNoticesDidChangeForChatGUIDs:]";
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "%s No chatGUIDs provided, aborting broadcast.", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)dismissNotice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[IMDCollaborationNoticeController dismissNotice:]";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%s for notice: %@", buf, 0x16u);
    }

  }
  -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteNotice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1D15C7DD4;
    v9[3] = &unk_1E922EC18;
    v9[4] = self;
    v10 = v4;
    -[IMDCollaborationNoticeController _chatGUIDsForNotice:completionBlock:](self, "_chatGUIDsForNotice:completionBlock:", v10, v9);

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D166C380(v4);

  }
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 136315138;
        v9 = "-[IMDCollaborationNoticeController highlightCenterHighlightsDidChange:]";
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "%s updating mapping of highlights to chats", (uint8_t *)&v8, 0xCu);
      }

    }
    -[IMDCollaborationNoticeController _updateMappingHighlightsToChats](self, "_updateMappingHighlightsToChats");
  }

}

- (void)receiveHighlightEvent:(id)a3 fromSender:(id)a4 guidString:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  IMDCollaborationNoticeController *v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v27 = a5;
  v12 = a6;
  +[IMDCollaborationNoticeTypeGenerator sharedGenerator](IMDCollaborationNoticeTypeGenerator, "sharedGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "typeForHighlightEvent:", v10);

  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = v10;
      v37 = 2112;
      v38 = v17;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "highlightEvent: %@ (type: %@) from sender: %@", buf, 0x20u);

    }
  }
  if (v14 == -1)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1D166C3FC();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "highlightURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject urlMinusFragment:onlyCKURL:](v18, "urlMinusFragment:onlyCKURL:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v20;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "\tnoticeURL: %@", buf, 0xCu);
        }

      }
      -[IMDCollaborationNoticeController highlightURLs](self, "highlightURLs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v20);

      if ((v24 & 1) != 0)
      {
        -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = sub_1D15C83CC;
        v28[3] = &unk_1E922EC68;
        v29 = v20;
        v34 = v14;
        v30 = v27;
        v31 = v11;
        v32 = v12;
        v33 = self;
        objc_msgSend(v25, "getCollaborationHighlightForURL:completionHandler:", v29, v28);

        v26 = v29;
      }
      else
      {
        IMLogHandleForCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_1D166C454();
      }
    }
    else
    {
      IMLogHandleForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1D166C428();
    }

  }
}

- (void)_processNotice:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveNotice:", v4);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15C8918;
  v6[3] = &unk_1E922EC90;
  v6[4] = self;
  -[IMDCollaborationNoticeController _chatGUIDsForNotice:completionBlock:](self, "_chatGUIDsForNotice:completionBlock:", v4, v6);

}

- (void)updateNotice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "deleteNotice:", v4);

  -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveNotice:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D15C8A5C;
  v8[3] = &unk_1E922EC90;
  v8[4] = self;
  -[IMDCollaborationNoticeController _chatGUIDsForNotice:completionBlock:](self, "_chatGUIDsForNotice:completionBlock:", v4, v8);

}

- (void)_updateMappingHighlightsToChats
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highlights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          dispatch_group_enter(v5);
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = sub_1D15C8D44;
          v19[3] = &unk_1E922ECB8;
          v19[4] = self;
          v20 = v3;
          v21 = v13;
          v22 = v4;
          v23 = v5;
          -[IMDCollaborationNoticeController _mapChatGUIDsToHighlight:completionBlock:](self, "_mapChatGUIDsToHighlight:completionBlock:", v12, v19);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D15C8F90;
  v16[3] = &unk_1E9229280;
  v16[4] = self;
  v17 = v3;
  v18 = v4;
  v14 = v4;
  v15 = v3;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v16);

}

- (void)dispatcher:(id)a3 didReceiveNotice:(id)a4 fromID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:](IMDCollaborationNoticeDispatcher, "unarchiveNoticeTransmissionEvent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Received notice: %@ from %@", (uint8_t *)&v15, 0x16u);
    }

  }
  objc_msgSend(v9, "guidString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCollaborationNoticeController receiveHighlightEvent:fromSender:guidString:date:](self, "receiveHighlightEvent:fromSender:guidString:date:", v11, v10, v13, v14);

}

- (void)dispatcher:(id)a3 didReceiveDismissalReflectionForNoticeGUIDs:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id obj;
  _QWORD block[5];
  id v18;
  _QWORD v19[5];
  id v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deleteNoticeWithGUIDString:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v7);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_1D15C94CC;
        v19[3] = &unk_1E922ECE0;
        v19[4] = self;
        v20 = v6;
        v21 = v7;
        -[IMDCollaborationNoticeController _chatGUIDsForNoticeURL:completionBlock:](self, "_chatGUIDsForNoticeURL:completionBlock:", v14, v19);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15C95C0;
  block[3] = &unk_1E9228750;
  block[4] = self;
  v18 = v6;
  v15 = v6;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

- (void)dispatcher:(id)a3 didReceiveDismissalRequest:(id)a4 fromID:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collaborationId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v7, "collaborationHighlightForIdentifier:error:", v8, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;

  if (v10)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166C640(v6, (uint64_t)v10, v11);
  }
  else if (v9 && (objc_msgSend(v9, "URL"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "noticesForURLs:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v17;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21), "guidString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v19);
    }

    -[IMDCollaborationNoticeController noticeStore](self, "noticeStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collaborationId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v23, "deleteAllNoticesWithCollaborationIdentifier:", v24);

    -[IMDCollaborationNoticeController noticeDispatcher](self, "noticeDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCollaborationNoticeController dispatcher:didReceiveDismissalReflectionForNoticeGUIDs:](self, "dispatcher:didReceiveDismissalReflectionForNoticeGUIDs:", v26, v13);

    objc_msgSend(v9, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1D15C993C;
    v29[3] = &unk_1E922EC18;
    v29[4] = self;
    v30 = v13;
    v28 = v13;
    -[IMDCollaborationNoticeController _chatGUIDsForNoticeURL:completionBlock:](self, "_chatGUIDsForNoticeURL:completionBlock:", v27, v29);

  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166C5C8(v6);
  }

}

- (void)_mapChatGUIDsToHighlight:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D39B30]);
  -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D15C9A5C;
  v12[3] = &unk_1E922ED08;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "fetchAttributionsForHighlight:highlight:completionBlock:", v9, v10, v12);

}

- (void)_chatGUIDsForNotice:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D15C9CD4;
  v10[3] = &unk_1E922ED30;
  v11 = v6;
  v9 = v6;
  -[IMDCollaborationNoticeController _chatGUIDsForNoticeURL:completionBlock:](self, "_chatGUIDsForNoticeURL:completionBlock:", v8, v10);

}

- (void)_chatGUIDsForNoticeURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  IMDCollaborationNoticeController *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D15C9E18;
    v12[3] = &unk_1E922ED80;
    v13 = v6;
    v15 = v8;
    v16 = v7;
    v14 = self;
    v10 = v8;
    objc_msgSend(v9, "getCollaborationHighlightForURL:completionHandler:", v13, v12);

  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D166C780();

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (NSSet)highlightURLs
{
  return self->_highlightURLs;
}

- (void)setHighlightURLs:(id)a3
{
  objc_storeStrong((id *)&self->_highlightURLs, a3);
}

- (IMDCollaborationNoticeDispatcher)noticeDispatcher
{
  return self->_noticeDispatcher;
}

- (OS_dispatch_queue)mappingChatsToHighlightsQueue
{
  return self->_mappingChatsToHighlightsQueue;
}

- (OS_dispatch_queue)noticeDataQueue
{
  return self->_noticeDataQueue;
}

- (OS_dispatch_queue)collaborationNoticeDispatcherQueue
{
  return self->_collaborationNoticeDispatcherQueue;
}

- (IMDCollaborationNoticeStore)noticeStore
{
  return self->_noticeStore;
}

- (void)setNoticeStore:(id)a3
{
  objc_storeStrong((id *)&self->_noticeStore, a3);
}

- (SWHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (BOOL)hasPopulatedHighlightTracking
{
  return self->_hasPopulatedHighlightTracking;
}

- (void)setHasPopulatedHighlightTracking:(BOOL)a3
{
  self->_hasPopulatedHighlightTracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_storeStrong((id *)&self->_noticeStore, 0);
  objc_storeStrong((id *)&self->_collaborationNoticeDispatcherQueue, 0);
  objc_storeStrong((id *)&self->_noticeDataQueue, 0);
  objc_storeStrong((id *)&self->_mappingChatsToHighlightsQueue, 0);
  objc_storeStrong((id *)&self->_noticeDispatcher, 0);
  objc_storeStrong((id *)&self->_highlightURLs, 0);
  objc_storeStrong((id *)&self->_highlightURLsForChatGUID, 0);
}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Participants changed in [%@]", (uint8_t *)&v14, 0xCu);
    }

  }
  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("__kIMDChatParticipantsDidChangeAddedParticipantsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("__kIMDChatParticipantsDidChangeRemovedParticipantsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v8, "count");
      if (v11)
        v12 = v8;
      else
        v12 = v10;
      if (v11)
        v13 = 8;
      else
        v13 = 9;
      -[IMDCollaborationNoticeController _shouldPostParticipantChangeNoticesForChat:withParticipants:forNoticeType:](self, "_shouldPostParticipantChangeNoticesForChat:withParticipants:forNoticeType:", v5, v12, v13);
    }

  }
}

- (void)_shouldPostParticipantChangeNoticesForChat:(id)a3 withParticipants:(id)a4 forNoticeType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 134218242;
      v16 = a5;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Notice type: %ld with participants: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  -[IMDCollaborationNoticeController highlightURLsForChatGUID](self, "highlightURLsForChatGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    -[IMDCollaborationNoticeController _generateParticipantChangeNoticesForChat:highlights:participants:noticeType:](self, "_generateParticipantChangeNoticesForChat:highlights:participants:noticeType:", v8, v13, v9, a5);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "No highlight found", (uint8_t *)&v15, 2u);
    }

  }
}

- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlights:(id)a4 participants:(id)a5 noticeType:(int64_t)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v22 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        v24 = v11;
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v11);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v22;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v31;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v31 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17);
              -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v25[0] = MEMORY[0x1E0C809B0];
              v25[1] = 3221225472;
              v25[2] = sub_1D15CA748;
              v25[3] = &unk_1E922EE20;
              v25[4] = self;
              v26 = v10;
              v27 = v18;
              v28 = v12;
              v29 = a6;
              objc_msgSend(v19, "getCollaborationHighlightForURL:completionHandler:", v18, v25);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v15);
        }

        v11 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

}

- (void)_generateParticipantChangeNoticesForChat:(id)a3 highlight:(id)a4 participant:(id)a5 noticeType:(int64_t)a6 checkedPrivileges:(BOOL)a7 messageGUID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  IMDCollaborationNoticeController *v29;
  int64_t v30;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (a7
    || (objc_msgSend(v14, "guid"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = -[IMDCollaborationNoticeController _hasAdministrativePrivilegesForHighlight:chatGUID:](self, "_hasAdministrativePrivilegesForHighlight:chatGUID:", v15, v18), v18, v19))
  {
    v21 = (void *)MEMORY[0x1E0CA5838];
    objc_msgSend(v15, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1D15CB364;
    v24[3] = &unk_1E922EE48;
    v25 = v15;
    v26 = v14;
    v30 = a6;
    v27 = v17;
    v28 = v16;
    v29 = self;
    objc_msgSend(v21, "getAppLinkWithURL:completionHandler:", v22, v24);

  }
  else if (IMOSLoggingEnabled(v20))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "No admin privileges, not showing group collaboration banner", buf, 2u);
    }

  }
}

- (BOOL)_hasAdministrativePrivilegesForHighlight:(id)a3 chatGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDCollaborationNoticeController highlightCenter](self, "highlightCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalSenderForCollaborationHighlight:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length")
    && (+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "accountAssociatedWithHandle:", v10),
        v11,
        v12))
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Has privileges to change membership for URL: %@", (uint8_t *)&v18, 0xCu);

      }
    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_highlightEligibleForSuggestAddingUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  BOOL v12;
  uint8_t v14[16];

  v4 = a3;
  -[IMDCollaborationNoticeController noticeDispatcher](self, "noticeDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rateLimiter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateLastUpdatedForURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Could not get last updated date from rate limiter", v14, 2u);
      }

    }
    objc_msgSend(v4, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "timeIntervalSinceNow");
  v12 = (uint64_t)(v11 / -86400.0) < 90;

  return v12;
}

- (void)_isShareBearURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CA5838];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D15CBBD0;
  v10[3] = &unk_1E922EE70;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "getAppLinkWithURL:completionHandler:", v9, v10);

}

@end
