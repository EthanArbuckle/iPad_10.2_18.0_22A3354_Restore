@implementation CKConversationListScrollingController

- (void)reachedConversationWithLastMessageDate:(id)a3 filterMode:(unint64_t)a4 remainingRows:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[12];
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListScrollingController filterModeToEarliestFetchedDate](self, "filterModeToEarliestFetchedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  -[CKConversationListScrollingController filterModeToEarliestReachedDate](self, "filterModeToEarliestReachedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  objc_msgSend(v19, "earlierDate:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListScrollingController filterModeToEarliestReachedDate](self, "filterModeToEarliestReachedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v9);

  if (!-[CKConversationListScrollingController isFetchingOlderConversations](self, "isFetchingOlderConversations"))
  {
    objc_msgSend(v8, "earlierDate:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToDate:", v8);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "conversationListScrollingPaddingRowCount");

    v26 = v25 > a5 ? 1 : v23;
    if (v26 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = CFSTR("NO");
          if (v25 <= a5)
            v30 = CFSTR("NO");
          else
            v30 = CFSTR("YES");
          *(_DWORD *)v32 = 138412802;
          if (v23)
            v29 = CFSTR("YES");
          *(_QWORD *)&v32[4] = v29;
          v33 = 2112;
          v34 = v30;
          v35 = 2112;
          v36 = v28;
          v31 = (void *)v28;
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Initiating infinite scroll fetch for date: %@ for end of list: %@ remaining rows: %@", v32, 0x20u);

        }
      }
      -[CKConversationListScrollingController _loadOlderConversationsWithFilterMode:](self, "_loadOlderConversationsWithFilterMode:", a4, *(_QWORD *)v32);
    }
  }

}

- (NSMutableDictionary)filterModeToEarliestReachedDate
{
  return self->_filterModeToEarliestReachedDate;
}

- (BOOL)isFetchingOlderConversations
{
  return self->_fetchingOlderConversations;
}

- (NSMutableDictionary)filterModeToEarliestFetchedDate
{
  return self->_filterModeToEarliestFetchedDate;
}

- (CKConversationListScrollingController)initWithConversationList:(id)a3 chatRegistry:(id)a4
{
  id v7;
  id v8;
  CKConversationListScrollingController *v9;
  CKConversationListScrollingController *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListScrollingController;
  v9 = -[CKConversationListScrollingController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationList, a3);
    objc_storeStrong((id *)&v10->_chatRegistry, a4);
    -[CKConversationListScrollingController chatRegistry](v10, "chatRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListScrollingController _resetDateTrackingWithChatRegistry:](v10, "_resetDateTrackingWithChatRegistry:", v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__handleRegistryDidLoadNotification_, *MEMORY[0x1E0D35470], 0);

  }
  return v10;
}

- (IMChatRegistry)chatRegistry
{
  return self->_chatRegistry;
}

- (void)_resetDateTrackingWithChatRegistry:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *filterModeToEarliestFetchedDate;
  NSMutableDictionary *v8;
  NSMutableDictionary *filterModeToEarliestReachedDate;
  NSObject *v10;
  NSMutableDictionary *v11;
  int v12;
  NSMutableDictionary *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "filterCategoryToEarliestInitiallyFetchedLastMessageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListScrollingController _convertFilterActionDictionaryToConversationListFilterModeDictionary:](self, "_convertFilterActionDictionaryToConversationListFilterModeDictionary:", v5);
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  filterModeToEarliestFetchedDate = self->_filterModeToEarliestFetchedDate;
  self->_filterModeToEarliestFetchedDate = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  filterModeToEarliestReachedDate = self->_filterModeToEarliestReachedDate;
  self->_filterModeToEarliestReachedDate = v8;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_filterModeToEarliestFetchedDate;
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Reset filter mode to fetch dates to %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (id)_convertFilterActionDictionaryToConversationListFilterModeDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110__CKConversationListScrollingController__convertFilterActionDictionaryToConversationListFilterModeDictionary___block_invoke;
  v8[3] = &unk_1E274BED0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __110__CKConversationListScrollingController__convertFilterActionDictionaryToConversationListFilterModeDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "integerValue");
  switch(v7)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, &unk_1E2870288);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, &unk_1E28702A0);
      v8 = *(void **)(a1 + 32);
      v9 = &unk_1E28702B8;
      goto LABEL_11;
    case 1:
      v8 = *(void **)(a1 + 32);
      v9 = &unk_1E28702E8;
      goto LABEL_11;
    case 2:
      v8 = *(void **)(a1 + 32);
      v9 = &unk_1E28702D0;
      goto LABEL_11;
    case 3:
      v8 = *(void **)(a1 + 32);
      v9 = &unk_1E2870300;
      goto LABEL_11;
    case 4:
      v8 = *(void **)(a1 + 32);
      v9 = &unk_1E2870318;
LABEL_11:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);
      break;
    default:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 134217984;
          v12 = v7;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Unknown filter action: %ld", (uint8_t *)&v11, 0xCu);
        }

      }
      break;
  }

}

- (void)_handleRegistryDidLoadNotification:(id)a3
{
  id v4;

  -[CKConversationListScrollingController chatRegistry](self, "chatRegistry", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListScrollingController _resetDateTrackingWithChatRegistry:](self, "_resetDateTrackingWithChatRegistry:", v4);

}

- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3
{
  id v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListScrollingController _loadOlderConversationsWithFilterMode:limit:iteration:](self, "_loadOlderConversationsWithFilterMode:limit:iteration:", a3, objc_msgSend(v5, "conversationListScrollingBatchSize"), 0);

}

- (void)_loadOlderConversationsWithFilterMode:(unint64_t)a3 limit:(unint64_t)a4 iteration:(unint64_t)a5
{
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = -[CKConversationListScrollingController isFetchingOlderConversations](self, "isFetchingOlderConversations");
  if (a5 > 0xC || v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = -[CKConversationListScrollingController isFetchingOlderConversations](self, "isFetchingOlderConversations");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v19 = CFSTR("NO");
        if (v16)
          v19 = CFSTR("YES");
        v39 = 138412546;
        v40 = (unint64_t)v19;
        v41 = 2112;
        v42 = v17;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Ignoring load older conversations request, is fetching is %@ and iteration is %@", (uint8_t *)&v39, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListScrollingController filterModeToEarliestFetchedDate](self, "filterModeToEarliestFetchedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v14;

    -[CKConversationListScrollingController conversationList](self, "conversationList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "conversations");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "chat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastFinishedMessageDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "laterDate:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v39 = 134219010;
        v40 = a5;
        v41 = 2048;
        v42 = a4;
        v43 = 1024;
        v44 = a3;
        v45 = 2112;
        v46 = v25;
        v47 = 2112;
        v48 = v32;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Kicking off request (%llu) for %llu older conversations with filter mode %d older than date %@ (oldest conversation date: %@)", (uint8_t *)&v39, 0x30u);
      }

    }
    -[CKConversationListScrollingController setFetchingOlderConversations:](self, "setFetchingOlderConversations:", 1);
    -[CKConversationListScrollingController chatRegistry](self, "chatRegistry");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListScrollingController conversationList](self, "conversationList");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_chatPredicateForFilterMode:", a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke;
    v33[3] = &unk_1E274BEA8;
    v33[4] = self;
    v34 = v10;
    v35 = v25;
    v36 = a4;
    v37 = a5;
    v38 = a3;
    v30 = v25;
    v31 = v10;
    objc_msgSend(v27, "_loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:waitForReply:completionHandler:", v29, v30, a4, 0, v33);

  }
}

void __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  BOOL v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[8];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "filterModeToEarliestFetchedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v7, "count");
      objc_msgSend(*(id *)(a1 + 32), "conversationList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conversations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v31 = v13;
      v32 = 2048;
      v33 = objc_msgSend(v15, "count");
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Request for older conversations found %llu results (conversation list total now %llu) with error: %@ earliest last message date: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setFetchingOlderConversations:", 0);
  if (objc_msgSend(v7, "count"))
  {
    v16 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "filterModeToEarliestReachedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    if (objc_msgSend(v10, "isEqualToDate:", *(_QWORD *)(a1 + 48))
      && (v22 = *(_QWORD *)(a1 + 56), v22 <= 0xC7))
    {
      v16 = 2 * v22;
    }
    else
    {
      objc_msgSend(v21, "earlierDate:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == v21;

      if (!v24)
      {
        v25 = *(_QWORD *)(a1 + 64) == 0;
LABEL_18:
        objc_msgSend(*(id *)(a1 + 32), "filterModeToEarliestFetchedDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

        if (v25)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke_58;
          v29[3] = &unk_1E274BE80;
          v28 = *(_QWORD *)(a1 + 64);
          v27 = *(_QWORD *)(a1 + 72);
          v29[4] = *(_QWORD *)(a1 + 32);
          v29[5] = v27;
          v29[6] = v16;
          v29[7] = v28;
          dispatch_async(MEMORY[0x1E0C80D38], v29);
        }

        goto LABEL_21;
      }
    }
    v25 = 1;
    goto LABEL_18;
  }
LABEL_21:

}

uint64_t __95__CKConversationListScrollingController__loadOlderConversationsWithFilterMode_limit_iteration___block_invoke_58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadOlderConversationsWithFilterMode:limit:iteration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) + 1);
}

- (CKConversationList)conversationList
{
  return self->_conversationList;
}

- (void)setFilterModeToEarliestFetchedDate:(id)a3
{
  objc_storeStrong((id *)&self->_filterModeToEarliestFetchedDate, a3);
}

- (void)setFilterModeToEarliestReachedDate:(id)a3
{
  objc_storeStrong((id *)&self->_filterModeToEarliestReachedDate, a3);
}

- (void)setFetchingOlderConversations:(BOOL)a3
{
  self->_fetchingOlderConversations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterModeToEarliestReachedDate, 0);
  objc_storeStrong((id *)&self->_filterModeToEarliestFetchedDate, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_conversationList, 0);
}

@end
