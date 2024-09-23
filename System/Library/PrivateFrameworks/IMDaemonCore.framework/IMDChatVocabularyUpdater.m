@implementation IMDChatVocabularyUpdater

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D146BF00;
  block[3] = &unk_1E9227F30;
  block[4] = a1;
  if (qword_1ED935EC8 != -1)
    dispatch_once(&qword_1ED935EC8, block);
  return (id)qword_1ED935D90;
}

- (IMDChatVocabularyUpdater)initWithChatRegistry:(id)a3 vocabulary:(id)a4
{
  id v6;
  id v7;
  IMDChatVocabularyUpdater *v8;
  IMDChatRegistry *v9;
  IMDChatRegistry *chatRegistry;
  INVocabulary *v11;
  INVocabulary *vocabulary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDChatVocabularyUpdater;
  v8 = -[IMDChatVocabularyUpdater init](&v14, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (IMDChatRegistry *)v6;
    }
    else
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v9 = (IMDChatRegistry *)objc_claimAutoreleasedReturnValue();
    }
    chatRegistry = v8->_chatRegistry;
    v8->_chatRegistry = v9;

    if (v7)
    {
      v11 = (INVocabulary *)v7;
    }
    else
    {
      objc_msgSend((id)MEMORY[0x1D17EA3EC](CFSTR("INVocabulary"), CFSTR("Intents")), "sharedVocabulary");
      v11 = (INVocabulary *)objc_claimAutoreleasedReturnValue();
    }
    vocabulary = v8->_vocabulary;
    v8->_vocabulary = v11;

  }
  return v8;
}

- (void)updateVocabularyForAddedChat:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _BOOL8 v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[IMDChatRegistry doneLoadingAfterMerge](self->_chatRegistry, "doneLoadingAfterMerge");
  v9 = v8;
  v10 = IMOSLoggingEnabled(v8);
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updating SiriKit group name vocabulary for added chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    -[IMDChatVocabularyUpdater _updateVocabularyExcludingChat:completionHandler:](self, "_updateVocabularyExcludingChat:completionHandler:", 0, v7);
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Received request to update vocabulary for added chat, but chat registry is not yet loaded. Deferring update. Added Chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7)
      v7[2](v7);
  }

}

- (void)updateVocabularyForDeletedChat:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _BOOL8 v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[IMDChatRegistry doneLoadingAfterMerge](self->_chatRegistry, "doneLoadingAfterMerge");
  v9 = v8;
  v10 = IMOSLoggingEnabled(v8);
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updating group name vocabulary for deleted chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    -[IMDChatVocabularyUpdater _updateVocabularyExcludingChat:completionHandler:](self, "_updateVocabularyExcludingChat:completionHandler:", v6, v7);
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Received request to update vocabulary for deleted chat, but chat registry is not yet loaded. Deferring update. Deleted Chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7)
      v7[2](v7);
  }

}

- (void)updateVocabularyForRenamedChat:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  _BOOL8 v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[IMDChatRegistry doneLoadingAfterMerge](self->_chatRegistry, "doneLoadingAfterMerge");
  v9 = v8;
  v10 = IMOSLoggingEnabled(v8);
  if (v9)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updating group name vocabulary for renamed chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    -[IMDChatVocabularyUpdater _updateVocabularyExcludingChat:completionHandler:](self, "_updateVocabularyExcludingChat:completionHandler:", 0, v7);
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Received request to update vocabulary for renamed chat, but chat registry is not yet loaded. Deferring update. Renamed Chat: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7)
      v7[2](v7);
  }

}

- (void)updateVocabularyForDeferredUpdateRequestIfNecessaryWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[16];
  __int16 v12;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[IMDChatRegistry doneLoadingAfterMerge](self->_chatRegistry, "doneLoadingAfterMerge");
  if (!v5)
  {
    if (!IMOSLoggingEnabled(v5))
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v12 = 0;
    v8 = "Chat registry was reloaded, but merge is not yet completed (e.g. we're still under first data protection). Not "
         "updating vocabulary.";
    v9 = (uint8_t *)&v12;
    goto LABEL_14;
  }
  if (self->_haveDeferredUpdateRequest)
  {
    self->_haveDeferredUpdateRequest = 0;
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Chat registry has finished loading. Updating group name vocabulary due to a deferred update request.", buf, 2u);
      }

    }
    -[IMDChatVocabularyUpdater _updateVocabularyExcludingChat:completionHandler:](self, "_updateVocabularyExcludingChat:completionHandler:", 0, v4);
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      goto LABEL_16;
    }
    v10 = 0;
    v8 = "Chat registry has finished loading. No deffered update request.";
    v9 = (uint8_t *)&v10;
LABEL_14:
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
    goto LABEL_15;
  }
LABEL_16:
  if (v4)
    v4[2](v4);
LABEL_18:

}

- (void)_updateVocabularyExcludingChat:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  IMDChatVocabularyUpdater *v23;
  _QWORD block[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v23 = self;
  -[IMDChatRegistry cachedChats](self->_chatRegistry, "cachedChats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isBlackholed") & 1) == 0 && objc_msgSend(v14, "style") != 45)
        {
          objc_msgSend(v14, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if ((objc_msgSend(v14, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              if (!v6
                || (objc_msgSend(v14, "guid"),
                    v16 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v6, "guid"),
                    v17 = (void *)objc_claimAutoreleasedReturnValue(),
                    v18 = objc_msgSend(v16, "isEqual:", v17),
                    v17,
                    v16,
                    (v18 & 1) == 0))
              {
                objc_msgSend(v8, "addObject:", v14);
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "sortUsingComparator:", &unk_1E9229690);
  dispatch_get_global_queue(-2, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D146C8C4;
  block[3] = &unk_1E92290F8;
  block[4] = v23;
  v25 = v8;
  v26 = v22;
  v20 = v22;
  v21 = v8;
  dispatch_async(v19, block);

}

+ (void)performInitialUpdateIfNeeded
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = IMDidPerformInitialChatVocabularyUpdate();
  if ((v2 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Performing initial group name vocabulary update", v5, 2u);
      }

    }
    +[IMDChatVocabularyUpdater sharedInstance](IMDChatVocabularyUpdater, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateVocabularyExcludingChat:completionHandler:", 0, &unk_1E92296B0);

  }
}

- (IMDChatRegistry)chatRegistry
{
  return self->_chatRegistry;
}

- (void)setChatRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_chatRegistry, a3);
}

- (INVocabulary)vocabulary
{
  return self->_vocabulary;
}

- (void)setVocabulary:(id)a3
{
  objc_storeStrong((id *)&self->_vocabulary, a3);
}

- (BOOL)haveDeferredUpdateRequest
{
  return self->_haveDeferredUpdateRequest;
}

- (void)setHaveDeferredUpdateRequest:(BOOL)a3
{
  self->_haveDeferredUpdateRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
}

@end
