@implementation CKConversationSearchController

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA68D8];
  v6[0] = *MEMORY[0x1E0CA67D8];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0CA6450];
  v6[2] = *MEMORY[0x1E0CA67C0];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E0CA5F30];
  v6[5] = CFSTR("com_apple_mobilesms_chatStyle");
  v4 = *MEMORY[0x1E0CA6A88];
  v6[6] = *MEMORY[0x1E0CA63E8];
  v6[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA68D8];
  v5[0] = *MEMORY[0x1E0CA67D8];
  v5[1] = v3;
  v5[2] = *MEMORY[0x1E0CA67C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)searchTokenContentType
{
  return 0;
}

+ (BOOL)_shouldUseAvatarCellsForMode:(unint64_t)a3
{
  return a3 < 2;
}

- (unint64_t)maxResultsForMode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 2 < 3)
    return 0x7FFFFFFFLL;
  if (a3 > 1)
    return 0;
  if (-[CKSearchController layoutWidth](self, "layoutWidth", v3, v4))
    return 4;
  return 3;
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6198], CFSTR("chatDomain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rankingQueriesWithText:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *MEMORY[0x1E0CA63E8];
  v6 = *MEMORY[0x1E0CA67D8];
  v7 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@ == \"%@\") && (%@=\"%@*\"cwdt)"), v5, MEMORY[0x1E0C9AAA0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CA68D8];
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\") && (%@=\"%@*\"cwdt)"), v5, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA68D8], v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\") && (%@=\"%@*\"cwdt) && (%@ = \"\")"), v5, v10, v6, v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationSearchController _appendRecencyToRankingQuery:hours:](self, "_appendRecencyToRankingQuery:hours:", v8, 24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationSearchController _appendRecencyToRankingQuery:hours:](self, "_appendRecencyToRankingQuery:hours:", v11, 24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationSearchController _appendRecencyToRankingQuery:hours:](self, "_appendRecencyToRankingQuery:hours:", v12, 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = v11;
  v18[2] = v8;
  v18[3] = v15;
  v18[4] = v14;
  v18[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)useRecencyRankedSearchForMode:(unint64_t)a3
{
  return 1;
}

+ (unint64_t)recencyRankedTargetResultCount
{
  return 10;
}

- (id)_appendRecencyToRankingQuery:(id)a3 hours:(unint64_t)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ && (InRange(%@, $time.now(-%ld), $time.now))"), a3, *MEMORY[0x1E0CA6450], 3600 * a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)searchWithText:(id)a3 mode:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[CKSearchController shouldIncludeResultsIfFiltered](self, "shouldIncludeResultsIfFiltered"))
  {
    if (a4 == 1)
      -[CKConversationSearchController _searchZKWWithText:mode:](self, "_searchZKWWithText:mode:", v6, 1);
    else
      -[CKConversationSearchController searchSpotlightWithText:mode:](self, "searchSpotlightWithText:mode:", v6, a4);
  }
  else
  {
    -[CKSearchController setResults:](self, "setResults:", 0);
  }

}

- (void)_searchZKWWithText:(id)a3 mode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15[2];
  uint8_t buf[8];

  v6 = a3;
  -[CKSearchController setMode:](self, "setMode:", a4);
  -[CKSearchController setCurrentSearchText:](self, "setCurrentSearchText:", v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Performing ZKW search!", buf, 2u);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v8, "startTimingForKey:", CFSTR("zkwConvoSearch"));
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke;
  block[3] = &unk_1E27567A0;
  block[4] = self;
  v15[1] = (id)a4;
  objc_copyWeak(v15, (id *)buf);
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke(uint64_t a1)
{
  objc_class *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  id v20[2];
  uint8_t buf[16];

  v2 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("_PSPredictionContext"), CFSTR("PeopleSuggester"));
  if (v2)
  {
    v3 = objc_alloc_init(v2);
    objc_msgSend(v3, "setBundleID:", CFSTR("com.apple.MobileSMS"));
    objc_msgSend(*(id *)(a1 + 32), "zkwSuggester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Using CD for ZKW!", buf, 2u);
        }

      }
      objc_msgSend(v4, "rankedZKWSuggestionsFromContext:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCurrentZKWSuggestions:", v6);
      v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "maxResultsForMode:", *(_QWORD *)(a1 + 64));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_75;
      block[3] = &unk_1E27567A0;
      v17 = v6;
      v9 = v6;
      objc_copyWeak(v20, (id *)(a1 + 56));
      v18 = v7;
      v20[1] = v8;
      v19 = *(id *)(a1 + 40);
      v10 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(v20);
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_78;
      v13[3] = &unk_1E274D400;
      objc_copyWeak(v15, (id *)(a1 + 56));
      v11 = *(id *)(a1 + 48);
      v12 = *(void **)(a1 + 64);
      v14 = v11;
      v15[1] = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

      objc_destroyWeak(v15);
    }

  }
}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_75(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  CKZKWQueryResult *v10;
  id v11;
  void *v12;
  CKZKWQueryResult *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v25;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v3)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v4), "conversationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v7, "searchController:conversationForChatGUID:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = [CKZKWQueryResult alloc];
        v11 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CKZKWQueryResult initWithSearchableItem:inSection:withConversation:](v10, "initWithSearchableItem:inSection:withConversation:", 0, v12, v9);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
      }
      v14 = (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 64);

      if (!v14)
        break;
      if (v2 == ++v4)
      {
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v2)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "stopTimingForKey:", CFSTR("zkwConvoSearch"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "ZKW convo timing %@", buf, 0xCu);
    }

  }
  v17 = (id *)(a1 + 56);
  v18 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setResults:", v19);

  v20 = objc_loadWeakRetained(v17);
  objc_msgSend(v20, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_loadWeakRetained(v17);
  objc_msgSend(v21, "searchControllerContentsDidChange:", v22);

}

void __58__CKConversationSearchController__searchZKWWithText_mode___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Using Spotlight for ZKW!", v4, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "searchSpotlightWithText:mode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (_PSSuggester)zkwSuggester
{
  _PSSuggester *zkwSuggester;
  _PSSuggester *v4;
  _PSSuggester *v5;

  zkwSuggester = self->_zkwSuggester;
  if (!zkwSuggester)
  {
    v4 = (_PSSuggester *)objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("_PSSuggester"), CFSTR("PeopleSuggester")));
    v5 = self->_zkwSuggester;
    self->_zkwSuggester = v4;

    zkwSuggester = self->_zkwSuggester;
  }
  return zkwSuggester;
}

- (void)didSelectResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x193FF3C18](CFSTR("_PSMessagesZkwFeedback"), CFSTR("PeopleSuggester"));
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationSearchController currentZKWSuggestions](self, "currentZKWSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[CKConversationSearchController currentZKWSuggestions](self, "currentZKWSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKConversationSearchController_didSelectResult___block_invoke;
  block[3] = &unk_1E27567C8;
  v18[1] = v5;
  v16 = v8;
  v17 = v11;
  v13 = v11;
  v14 = v8;
  objc_copyWeak(v18, &location);
  dispatch_async(v12, block);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __50__CKConversationSearchController_didSelectResult___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithChatGuidEngagaged:suggestions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "zkwSuggester");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provideFeedbackForMessagesZkwSuggestions:", v2);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = objc_msgSend(*(id *)(a1 + 40), "count");
      v8 = 136315650;
      v9 = "-[CKConversationSearchController didSelectResult:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s submitted PS feedback for guid %@ currently maintaining %lu zkw results", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)searchSpotlightWithText:(id)a3 mode:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  id location;

  v6 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke;
  aBlock[3] = &unk_1E274DBB0;
  objc_copyWeak(&v14, &location);
  v8 = _Block_copy(aBlock);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_2;
  v11[3] = &unk_1E274DFE8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  v9 = _Block_copy(v11);
  -[CKConversationSearchController setSearchTerminated:](self, "setSearchTerminated:", 0);
  -[CKConversationSearchController setIntermediaryResults:](self, "setIntermediaryResults:", 0);
  -[CKSearchController setQueryFoundItemHandler:](self, "setQueryFoundItemHandler:", v8);
  -[CKSearchController setQueryCompletionHandler:](self, "setQueryCompletionHandler:", v9);
  -[CKConversationSearchController setGotResults:](self, "setGotResults:", 0);
  v10.receiver = self;
  v10.super_class = (Class)CKConversationSearchController;
  -[CKSearchController searchWithText:mode:](&v10, sel_searchWithText_mode_, v6, a4);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(WeakRetained, "searchTerminated");

  if ((v5 & 1) == 0)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setGotResults:", 1);

    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "intermediaryResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_loadWeakRetained(v3);
      objc_msgSend(v9, "intermediaryResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "setByAddingObjectsFromArray:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained(v3);
    objc_msgSend(v12, "setIntermediaryResults:", v11);

  }
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Finished searching with error %@", buf, 0xCu);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_85;
  v5[3] = &unk_1E274D5D0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);

}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_85(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "gotResults");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "intermediaryResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "intermediaryResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v17 = *(void **)(a1 + 32);
    objc_msgSend(v8, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_sortedAndRankedItemsWithItems:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v28 = objc_msgSend(v19, "count");
        v29 = 2048;
        v30 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Got %ld results from top conversation query, truncated from initial %ld results", buf, 0x16u);
      }

    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_87;
    v22[3] = &unk_1E274D5D0;
    objc_copyWeak(&v24, v2);
    v23 = v19;
    v21 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

    objc_destroyWeak(&v24);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Didn't get any results, cleaning up old results", buf, 2u);
      }

    }
    v10 = objc_loadWeakRetained(v2);
    v11 = objc_msgSend(v10, "isTokenizationSearchController");

    if (v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_86;
      block[3] = &unk_1E274B548;
      objc_copyWeak(&v26, v2);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v26);
    }
    else
    {
      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setResults:", v13);

      v14 = objc_loadWeakRetained(v2);
      objc_msgSend(v14, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "searchControllerContentsDidChange:", v16);

    }
  }
}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_86(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tokenizedQueryResultsForItems:", MEMORY[0x1E0C9AA60]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setResults:", v7);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "searchControllerContentsDidChange:", v6);

}

void __63__CKConversationSearchController_searchSpotlightWithText_mode___block_invoke_87(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "isTokenizationSearchController");

  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v5, "tokenizedQueryResultsForItems:", v7);
  else
    objc_msgSend(v5, "queryResultsForItems:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "setResults:", v13);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "setQueriedResultsCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "searchControllerContentsDidChange:", v12);

}

- (void)searchEnded
{
  id v3;

  -[CKConversationSearchController setSearchTerminated:](self, "setSearchTerminated:", 1);
  -[CKSearchController cancelCurrentSearch](self, "cancelCurrentSearch");
  if (-[CKSearchController shouldResetSearchResultsWhenEnded](self, "shouldResetSearchResultsWhenEnded"))
  {
    -[CKSearchController setResults:](self, "setResults:", MEMORY[0x1E0C9AA60]);
    -[CKSearchController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchControllerContentsDidChange:", self);

  }
}

- (id)_sortedAndRankedItemsWithItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationSearchController rankingQueriesWithText:](self, "rankingQueriesWithText:", &stru_1E276D870);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
        v32 = 0;
        v13 = +[CKSpotlightQueryUtilities matchedRankingQueriesForResult:withRankingQueryCount:maxRankingQuery:](CKSpotlightQueryUtilities, "matchedRankingQueriesForResult:withRankingQueryCount:maxRankingQuery:", v12, v6, &v32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v15, "addObject:", v12);
        objc_msgSend(v7, "setObject:forKey:", v15, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_151);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v23));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
        {
          objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_99_1);
          objc_msgSend(v16, "addObjectsFromArray:", v25);
        }

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v21);
  }

  return v16;
}

uint64_t __65__CKConversationSearchController__sortedAndRankedItemsWithItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __65__CKConversationSearchController__sortedAndRankedItemsWithItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  objc_msgSend(a3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUsedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastUsedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)queryResultsForItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CKSpotlightQueryResult *v18;
  void *v19;
  CKSpotlightQueryResult *v20;
  void *v21;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = -[CKConversationSearchController maxResultsForMode:](self, "maxResultsForMode:", -[CKSearchController mode](self, "mode"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v4;
  v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v27 = 0;
    v24 = v7;
    v25 = *(_QWORD *)v29;
    v23 = v5;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v8);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[CKConversationSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "searchController:conversationForChatGUID:", self, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && (objc_msgSend(v13, "isBlockedByCommunicationLimits") & 1) == 0)
        {
          v14 = v8;
          v15 = v6;
          objc_msgSend(v13, "chat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "personCentricID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            goto LABEL_11;
          v6 = v15;
          if ((objc_msgSend(v15, "containsObject:", v17) & 1) == 0)
          {
            v18 = [CKSpotlightQueryResult alloc];
            objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[CKSpotlightQueryResult initWithSearchableItem:inSection:withConversation:](v18, "initWithSearchableItem:inSection:withConversation:", v10, v19, v13);

            v5 = v23;
            objc_msgSend(v23, "addObject:", v20);
            objc_msgSend(v15, "addObject:", v17);
            ++v27;

LABEL_11:
            v6 = v15;
          }
          v8 = v14;

          v7 = v24;
        }

        if (v27 >= v7)
          goto LABEL_16;
      }
      v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }
LABEL_16:

  v21 = (void *)objc_msgSend(v5, "copy");
  return v21;
}

- (id)tokenizedQueryResultsForItems:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)supportsQuicklookForResult:(id)a3
{
  return 0;
}

+ (BOOL)supportsMenuInteraction
{
  return 0;
}

- (id)chatGUIDForSearchableItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)navigationBarTitleSummaryForSearchText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONVERSATION_SEARCH_RESULTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

    if (v9 == 1)
      v10 = CFSTR("\u200F");
    else
      v10 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sectionTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)sectionIdentifier
{
  return CFSTR("ConversationSearchSection");
}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_CONVERSATIONS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  int v3;
  __objc2_class **v4;

  v3 = objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", a3);
  v4 = off_1E2732F08;
  if (!v3)
    v4 = off_1E2732F98;
  -[__objc2_class reuseIdentifier](*v4, "reuseIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", a3);
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedCellClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDirectionalEdgeInsets)additionalGroupInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSDirectionalEdgeInsets result;

  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentMarginInsetsForSearchController:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;

  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchConversationSectionInsets");
    v5 = v11;
    v13 = v12;
    v7 = v14;
    v16 = v15;

  }
  else
  {
    v13 = 0.0;
    v16 = 0.0;
    if (CKIsRunningInMacCatalyst())
      v7 = v9;
    else
      v5 = v7;
  }
  if (-[CKSearchController mode](self, "mode") != 1)
  {
    -[CKSearchController results](self, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      v5 = *MEMORY[0x1E0CEA080];
      v13 = *(double *)(MEMORY[0x1E0CEA080] + 8);
      v7 = *(double *)(MEMORY[0x1E0CEA080] + 16);
      v16 = *(double *)(MEMORY[0x1E0CEA080] + 24);
    }
  }
  v19 = v5;
  v20 = v13;
  v21 = v7;
  v22 = v16;
  result.trailing = v22;
  result.bottom = v21;
  result.leading = v20;
  result.top = v19;
  return result;
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  void *v6;
  id v7;
  char isKindOfClass;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKConversationSearchController;
  -[CKSearchController cellForItemInCollectionView:atIndexPath:withIdentifier:](&v15, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      v10 = v9;
      -[CKSearchController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShouldInsetResults:", objc_msgSend(v11, "shouldInsetResultsForSearchController:", self));

      objc_msgSend(v10, "topHairline");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 0);

      objc_msgSend(v10, "bottomHairline");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      objc_msgSend(v10, "setDelegate:", self);
    }
  }

  return v6;
}

- (double)interGroupSpacing
{
  int v2;
  double result;

  v2 = objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode"));
  result = 0.0;
  if (v2)
    return 6.0;
  return result;
}

- (BOOL)wantsHeaderSection
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[CKSearchController mode](self, "mode") == 1)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CKConversationSearchController;
  if (!-[CKSearchController wantsHeaderSection](&v6, sel_wantsHeaderSection))
    return 0;
  -[CKSearchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "searchControllerCanShowSectionHeader:", self);

  return v4;
}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode"));
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    v5 = -[CKSearchController layoutWidth](self, "layoutWidth");
    if (v5)
      v6 = 4;
    else
      v6 = 3;
    v7 = 0.33;
    if (v5)
      v7 = 0.25;
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "uniformAcrossSiblingsWithEstimate:", 88.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CEA1F0];
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeWithWidthDimension:heightDimension:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v14, v11, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CEA1F8];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchConversationAvatarCellInterItemSpacing");
    objc_msgSend(v16, "flexibleSpacing:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterItemSpacing:", v18);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKConversationSearchController;
    -[CKSearchController layoutGroupWithEnvironment:](&v20, sel_layoutGroupWithEnvironment_, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)customLayoutSectionForEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  objc_super v20;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseAvatarCellsForMode:", -[CKSearchController mode](self, "mode")))
  {
    v20.receiver = self;
    v20.super_class = (Class)CKConversationSearchController;
    -[CKSearchController customLayoutSectionForEnvironment:](&v20, sel_customLayoutSectionForEnvironment_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(v4, "container");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentSize");
      v8 = v7;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "snapToMinConversationListWidth");
      v11 = v8 >= v10;

    }
    else
    {
      v11 = 1;
    }
    -[CKSearchController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldInsetResultsForSearchController:", self);

    if (v13)
      v14 = 0;
    else
      v14 = 4;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACD0]), "initWithAppearanceStyle:layoutEnvironment:", v14, v4);
    objc_msgSend(v15, "setSeparatorStyle:", v11);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "conversationCellLeadingSeparatorInsetForEnvironment:", v4);
    v18 = v17;

    objc_msgSend(v15, "setSeparatorInset:", 0.0, v18, 0.0, 0.0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACC8]), "initWithConfiguration:layoutEnvironment:", v15, v4);

  }
  return v5;
}

- (BOOL)isTokenizationSearchController
{
  return 0;
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKSearchController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthForDeterminingAvatarVisibility");
  v4 = v3;

  return v4;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenusForConversation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)gotResults
{
  return self->_gotResults;
}

- (void)setGotResults:(BOOL)a3
{
  self->_gotResults = a3;
}

- (NSSet)intermediaryResults
{
  return self->_intermediaryResults;
}

- (void)setIntermediaryResults:(id)a3
{
  objc_storeStrong((id *)&self->_intermediaryResults, a3);
}

- (BOOL)searchTerminated
{
  return self->_searchTerminated;
}

- (void)setSearchTerminated:(BOOL)a3
{
  self->_searchTerminated = a3;
}

- (void)setZkwSuggester:(id)a3
{
  objc_storeStrong((id *)&self->_zkwSuggester, a3);
}

- (NSArray)currentZKWSuggestions
{
  return self->_currentZKWSuggestions;
}

- (void)setCurrentZKWSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_currentZKWSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentZKWSuggestions, 0);
  objc_storeStrong((id *)&self->_zkwSuggester, 0);
  objc_storeStrong((id *)&self->_intermediaryResults, 0);
}

@end
