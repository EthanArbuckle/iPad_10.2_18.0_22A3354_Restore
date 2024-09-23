@implementation CKSpotlightQuery

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)_processSearchResults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__CKSpotlightQuery__processSearchResults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void (**v18)(void *, void *);
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  _QWORD v31[5];
  void (**v32)(void *, void *);
  _QWORD aBlock[5];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v3;
        _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Leaving group %d", buf, 8u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Leaving A - cancel", buf, 2u);
      }

    }
  }
  else
  {
    if (!*(_QWORD *)(v1 + 48))
      return;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_processSearchResults...", buf, 2u);
      }

    }
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v8 + 32) < v6)
    {
      *(_QWORD *)&v7 = 138412290;
      v29 = v7;
      do
      {
        objc_msgSend(*(id *)(v8 + 40), "objectAtIndex:", v29);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "domainIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributeSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "__ck_itemContentCreationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "attributeSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "__ck_spotlightItemSnippet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "containsString:", CFSTR("message_guid")) & 1) != 0
          || objc_msgSend(v10, "containsString:", CFSTR("chat_guid")))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v38 = (unint64_t)v10;
              v39 = 2112;
              v40 = v11;
              _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Looking for a message matching message guid: %@ or chat guid: %@", buf, 0x16u);
            }

          }
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke_69;
          aBlock[3] = &unk_1E2757970;
          aBlock[4] = *(_QWORD *)(a1 + 32);
          v34 = v13;
          v17 = v10;
          v35 = v17;
          v36 = v15;
          v18 = (void (**)(void *, void *))_Block_copy(aBlock);
          if (v11)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                v38 = (unint64_t)v11;
                _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "ChatGUID: %@", buf, 0xCu);
              }

            }
            objc_msgSend(*(id *)(a1 + 32), "chatRegistry");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "existingChatWithGUID:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v18[2](v18, v21);
          }
          else if (v17)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v29;
                v38 = (unint64_t)v17;
                _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "MessageGUID: %@", buf, 0xCu);
              }

            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Entering B", buf, 2u);
              }

            }
            dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
            objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __41__CKSpotlightQuery__processSearchResults__block_invoke_72;
            v31[3] = &unk_1E2757998;
            v31[4] = *(_QWORD *)(a1 + 32);
            v32 = v18;
            objc_msgSend(v24, "loadMessageWithGUID:completionBlock:", v17, v31);

          }
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);

        }
        v8 = *(_QWORD *)(a1 + 32);
      }
      while (*(_QWORD *)(v8 + 32) < v6);
    }
    v25 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 134218240;
        v38 = v6;
        v39 = 1024;
        LODWORD(v40) = v27;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Count: %lu group: %d", buf, 0x12u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Leaving A", buf, 2u);
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
}

void __41__CKSpotlightQuery__processSearchResults__block_invoke_69(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  CKSpotlightSearchResult *v11;
  uint64_t v12;
  void *v13;
  CKSpotlightSearchResult *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Chat: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  objc_msgSend(v3, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1[4] + 48);
    objc_msgSend(v3, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || a1[5]
      && (objc_msgSend(v8, "messageDate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "compare:", a1[5]) == -1,
          v9,
          v10))
    {
      v11 = [CKSpotlightSearchResult alloc];
      v12 = a1[6];
      objc_msgSend(v3, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[CKSpotlightSearchResult initWithMessageGUID:chatGUID:messageTime:summery:](v11, "initWithMessageGUID:chatGUID:messageTime:summery:", v12, v13, a1[5], a1[7]);

      v15 = *(void **)(a1[4] + 48);
      objc_msgSend(v3, "guid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v14, v16);

    }
  }

}

void __41__CKSpotlightQuery__processSearchResults__block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Completion called with message; %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Leaving B", (uint8_t *)&v11, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));

}

- (void)_cleanup
{
  NSArray *searchResults;
  NSMutableDictionary *chatGUIDToLatestSearchResult;
  MDSearchQuery *currentQuery;
  MDSearchQuery *v6;
  OS_dispatch_group *searchResultLoadingGroup;

  searchResults = self->_searchResults;
  self->_searchResults = 0;

  self->_resultIndex = 0;
  chatGUIDToLatestSearchResult = self->_chatGUIDToLatestSearchResult;
  self->_chatGUIDToLatestSearchResult = 0;

  currentQuery = self->_currentQuery;
  if (currentQuery)
  {
    if ((unint64_t)-[MDSearchQuery status](currentQuery, "status") <= 2)
      -[MDSearchQuery cancel](self->_currentQuery, "cancel");
    -[MDSearchQuery setDelegate:](self->_currentQuery, "setDelegate:", 0);
    v6 = self->_currentQuery;
    self->_currentQuery = 0;

  }
  -[CKSpotlightQuery setCompletion:](self, "setCompletion:", 0);
  searchResultLoadingGroup = self->_searchResultLoadingGroup;
  if (searchResultLoadingGroup)
  {
    self->_searchResultLoadingGroup = 0;

  }
}

- (void)_callCompletion
{
  void *v3;
  id v4;

  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_chatGUIDToLatestSearchResult, "count"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allValues](self->_chatGUIDToLatestSearchResult, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v3);

    objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_76_5);
    (*((void (**)(void))self->_completion + 2))();

  }
}

uint64_t __35__CKSpotlightQuery__callCompletion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4 startQuery:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  CKSpotlightQuery *v10;
  CKSpotlightQuery *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MDSearchQuery *currentQuery;
  void *v20;
  _BOOL4 v21;
  objc_super v22;
  _QWORD v23[9];
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v21 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "initWithSearchText:completionBlock: [searchText: %@]", buf, 0xCu);
    }

  }
  v22.receiver = self;
  v22.super_class = (Class)CKSpotlightQuery;
  v10 = -[CKSpotlightQuery init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CKSpotlightQuery setCompletion:](v10, "setCompletion:", v8);
    if (objc_msgSend(v7, "length"))
    {
      if (setupCoreSpotlight_onceToken != -1)
        dispatch_once(&setupCoreSpotlight_onceToken, &__block_literal_global_182);
      if (_CKMDSearchQueryClass
        && _CKMDSearchQueryOptionFetchAttributes
        && _CKMDItemAuthors
        && _CKMDItemAuthorAddresses
        && _CKMDItemRecipients
        && _CKMDItemRecipientAddresses
        && _CKMDItemSubject
        && _CKMDItemTextContent
        && _CKMDItemInstantMessageAddresses)
      {
        if (CKEnhancedLegacySearchDisabled())
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kMDItemAuthors contains[cd] %@) || (kMDItemAuthorAddresses contains[cd] %@) || (kMDItemRecipients contains[cd] %@) || (kMDItemRecipientAddresses contains[cd] %@) || (kMDItemInstantMessageAddresses contains[cd] %@) || (kMDItemSubject contains[cd] %@) || (kMDItemTextContent contains[cd] %@)"), v7, v7, v7, v7, v7, v7, v7);
        else
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kMDItemSubject contains[cd] %@) || (kMDItemTextContent contains[cd] %@)"), v7, v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc((Class)_CKMDSearchQueryClass);
        v24 = _CKMDSearchQueryOptionFetchAttributes;
        v23[0] = _CKMDItemAuthors;
        v23[1] = _CKMDItemAuthorAddresses;
        v23[2] = _CKMDItemRecipients;
        v23[3] = _CKMDItemRecipientAddresses;
        v23[4] = _CKMDItemInstantMessageAddresses;
        v23[5] = _CKMDItemSubject;
        v23[6] = _CKMDItemTextContent;
        v23[7] = CFSTR("kMDItemContentCreationDate");
        v14 = _CKMDItemSnippet;
        if (!_CKMDItemSnippet)
          v14 = kMDSpotlightItemSnippet;
        v23[8] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "initWithPredicate:options:", v20, v16);
        currentQuery = v11->_currentQuery;
        v11->_currentQuery = (MDSearchQuery *)v17;

        -[MDSearchQuery setClientBundleID:](v11->_currentQuery, "setClientBundleID:", CFSTR("com.apple.MobileSMS"));
        -[MDSearchQuery setDelegate:](v11->_currentQuery, "setDelegate:", v11);
        if (v21)
          -[MDSearchQuery start](v11->_currentQuery, "start");

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Couldn't find CoreSpotlight symbols", buf, 2u);
        }

      }
    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CKSpotlightQuery _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CKSpotlightQuery;
  -[CKSpotlightQuery dealloc](&v3, sel_dealloc);
}

- (void)searchQuery:(id)a3 didReturnItems:(id)a4
{
  MDSearchQuery *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v6 = (MDSearchQuery *)a3;
  v7 = a4;
  if (self->_currentQuery == v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "did return items", buf, 2u);
      }

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__CKSpotlightQuery_searchQuery_didReturnItems___block_invoke;
    v9[3] = &unk_1E274A108;
    v9[4] = self;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __47__CKSpotlightQuery_searchQuery_didReturnItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v3)
  {
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_msgSend(v2, "copy");
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Added results with count %lu", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4
{
  MDSearchQuery *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (MDSearchQuery *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v10 = a4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "statusChanged: %lu", buf, 0xCu);
    }

  }
  if (a4 == 3 && self->_currentQuery == v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  dispatch_group_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  if (!v5[7])
  {
    v6 = dispatch_group_create();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v6;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Entering A", buf, 2u);
      }

    }
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke_92;
    block[3] = &unk_1E274A208;
    block[4] = v10;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);
    v5 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v5, "_processSearchResults");
}

uint64_t __46__CKSpotlightQuery_searchQuery_statusChanged___block_invoke_92(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Notify triggered!", v5, 2u);
    }

  }
  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[8])
  {
    objc_msgSend(v3, "_callCompletion");
    v3 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v3, "_cleanup");
}

- (void)searchQuery:(id)a3 didFailWithError:(id)a4
{
  MDSearchQuery *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = (MDSearchQuery *)a3;
  v7 = a4;
  if (self->_currentQuery == v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Spotlight query failed with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 completionBlock:(id)a4
{
  return -[CKSpotlightQuery initWithSearchText:completionBlock:startQuery:](self, "initWithSearchText:completionBlock:startQuery:", a3, a4, 1);
}

- (CKSpotlightQuery)initWithSearchText:(id)a3 chatRegistryOverride:(id)a4 startQuery:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  CKSpotlightQuery *v11;
  CKSpotlightQuery *v12;

  v7 = a5;
  v10 = a4;
  v11 = -[CKSpotlightQuery initWithSearchText:completionBlock:startQuery:](self, "initWithSearchText:completionBlock:startQuery:", a3, a6, v7);
  v12 = v11;
  if (v11)
    -[CKSpotlightQuery setChatRegisteryOverride:](v11, "setChatRegisteryOverride:", v10);

  return v12;
}

- (id)chatRegistry
{
  IMChatRegistry *chatRegisteryOverride;

  chatRegisteryOverride = self->_chatRegisteryOverride;
  if (chatRegisteryOverride)
    return chatRegisteryOverride;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MDSearchQuery)currentQuery
{
  return self->_currentQuery;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSMutableDictionary)chatGUIDToLatestSearchResult
{
  return self->_chatGUIDToLatestSearchResult;
}

- (void)setChatGUIDToLatestSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_chatGUIDToLatestSearchResult, a3);
}

- (OS_dispatch_group)searchResultLoadingGroup
{
  return self->_searchResultLoadingGroup;
}

- (void)setSearchResultLoadingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultLoadingGroup, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (IMChatRegistry)chatRegisteryOverride
{
  return self->_chatRegisteryOverride;
}

- (void)setChatRegisteryOverride:(id)a3
{
  objc_storeStrong((id *)&self->_chatRegisteryOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatRegisteryOverride, 0);
  objc_storeStrong((id *)&self->_searchResultLoadingGroup, 0);
  objc_storeStrong((id *)&self->_chatGUIDToLatestSearchResult, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
