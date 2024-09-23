@implementation SearchSuggestion

+ (id)relativeDateTimeFormatter
{
  if (relativeDateTimeFormatter_onceToken != -1)
    dispatch_once(&relativeDateTimeFormatter_onceToken, &__block_literal_global_32);
  return (id)relativeDateTimeFormatter__relativeDateTimeFormatter;
}

void __45__SearchSuggestion_relativeDateTimeFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  v1 = (void *)relativeDateTimeFormatter__relativeDateTimeFormatter;
  relativeDateTimeFormatter__relativeDateTimeFormatter = (uint64_t)v0;

}

- (id)_initWithString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  id v8;
  id v9;
  SearchSuggestion *v10;
  uint64_t v11;
  NSString *string;
  SearchSuggestion *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchSuggestion;
  v10 = -[SearchSuggestion init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    string = v10->_string;
    v10->_string = (NSString *)v11;

    objc_storeStrong((id *)&v10->_userQuery, a4);
    v10->_parsecQueryID = -[WBSCompletionQuery queryID](v10->_userQuery, "queryID");
    v10->_forPrivateBrowsing = a5;
    v13 = v10;
  }

  return v10;
}

- (SearchSuggestion)initWithUserTypedQuery:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  SearchSuggestion *v8;
  SearchSuggestion *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SearchSuggestion _initWithString:userQuery:forPrivateBrowsing:](self, "_initWithString:userQuery:forPrivateBrowsing:", v7, v6, v4);

  if (v8)
  {
    v8->_asTypedSuggestion = 1;
    v9 = v8;
  }

  return v8;
}

- (SearchSuggestion)initWithRecentSearchString:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5
{
  SearchSuggestion *v5;
  SearchSuggestion *v6;
  SearchSuggestion *v7;

  v5 = -[SearchSuggestion _initWithString:userQuery:forPrivateBrowsing:](self, "_initWithString:userQuery:forPrivateBrowsing:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_recentSearch = 1;
    v7 = v5;
  }

  return v6;
}

- (SearchSuggestion)initWithSearchEngineSuggestion:(id)a3 userQuery:(id)a4 forPrivateBrowsing:(BOOL)a5 isOfflineSearchSuggestion:(BOOL)a6
{
  SearchSuggestion *v7;
  SearchSuggestion *v8;
  SearchSuggestion *v9;

  v7 = -[SearchSuggestion _initWithString:userQuery:forPrivateBrowsing:](self, "_initWithString:userQuery:forPrivateBrowsing:", a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_searchEngineSuggestion = 1;
    v7->_offlineSearchEngineSuggestion = a6;
    v7->_goesToURL = (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) < 2;
    v9 = v8;
  }

  return v8;
}

- (BOOL)_isLabelPreviousSearchesInCompletionListEnabled
{
  return objc_msgSend(MEMORY[0x1E0D89BE8], "isLabelPreviousSearchesInCompletionListEnabled");
}

- (void)setQuery:(id)a3
{
  NSString *v5;
  NSString *string;
  id v7;

  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userQuery, a3);
    if (self->_asTypedSuggestion)
    {
      objc_msgSend(v7, "queryString");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      string = self->_string;
      self->_string = v5;

    }
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_forPrivateBrowsing)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; string = %@; goes to URL: %d; private = %@>"),
    v5,
    self,
    self->_string,
    self->_goesToURL,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)_accessoryButtonTapped
{
  id WeakRetained;

  self->_handlingAccessoryButtonTap = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  objc_msgSend(WeakRetained, "searchTextCompletionAccessoryButtonTappedForCompletionItem:", self);

  self->_handlingAccessoryButtonTap = 0;
}

- (void)setHandlerForActionItem:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 goesToURL;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_string)
  {
    v8 = v6;
    goesToURL = self->_goesToURL;
    v32 = CFSTR("destination");
    if (goesToURL)
      v10 = CFSTR("URL");
    else
      v10 = CFSTR("Search");
    v33[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", v12);

    if (self->_goesToURL)
    {
      v13 = (void *)MEMORY[0x1E0DC3870];
      systemImageNameForCompletionIcon(4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "systemImageNamed:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v15);

      -[UITableViewCell safari_setLinkedPageTitle:description:](v8, (const char *)self->_string, (uint64_t)&stru_1E9CFDBB0);
      objc_msgSend(v8, "setHidesCompletionArrowView:", 1);
      objc_msgSend(v8, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[NSString safari_numberForKey:](v19, "safari_numberForKey:", *MEMORY[0x1E0D4F190]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safari_labelColorFromNumber:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTextColor:", v21);

    }
    else
    {
      objc_msgSend(v8, "setHidesImage:", 0);
      objc_msgSend(v8, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "preferredContentSizeCategory");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (UIContentSizeCategoryIsAccessibilityCategory(v19))
        v24 = 0;
      else
        v24 = 2;
      objc_msgSend(v17, "setNumberOfLines:", v24);
      objc_msgSend(v8, "setSearchSuggestion:withQuery:", self->_string, self->_userQuery);
      if (-[SearchSuggestion _isLabelPreviousSearchesInCompletionListEnabled](self, "_isLabelPreviousSearchesInCompletionListEnabled"))
      {
        -[SearchSuggestion _configureHistoryLastAccessedLabelForTableViewCellIfNeeded:](self, "_configureHistoryLastAccessedLabelForTableViewCellIfNeeded:", v8);
      }
      -[WBSCompletionQuery queryString](self->_userQuery, "queryString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", self->_string);

      if (v26)
      {
        objc_msgSend(v8, "setHidesCompletionArrowView:", 1);
      }
      else
      {
        objc_msgSend(v7, "browserController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rootViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setUsesDownBackwardCompletionArrow:", objc_msgSend(v28, "isUsingBottomCapsule"));

        objc_msgSend(v8, "setHidesCompletionArrowView:", 0);
        objc_initWeak(&location, self);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __71__SearchSuggestion_configureCompletionTableViewCell_forCompletionList___block_invoke;
        v29[3] = &unk_1E9CF25A0;
        objc_copyWeak(&v30, &location);
        objc_msgSend(v8, "setAccessoryActionHandler:", v29);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
    }

  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SearchSuggestion configureCompletionTableViewCell:forCompletionList:].cold.1(v22);
  }

}

void __71__SearchSuggestion_configureCompletionTableViewCell_forCompletionList___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessoryButtonTapped");

}

- (void)_configureHistoryLastAccessedLabelForTableViewCellIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (-[SearchSuggestion hasBeenSearchedBefore](self, "hasBeenSearchedBefore")
    && -[SearchSuggestion _isLabelPreviousSearchesInCompletionListEnabled](self, "_isLabelPreviousSearchesInCompletionListEnabled"))
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    systemImageNameForCompletionIcon(2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    -[SearchSuggestion lastVisitTimeInterval](self, "lastVisitTimeInterval");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v11 = v9 - v10;
    -[SearchSuggestion lastVisitTimeInterval](self, "lastVisitTimeInterval");
    v13 = v11 > 0.0 || v12 == 0.0;
    if (!v13)
    {
      +[SearchSuggestion relativeDateTimeFormatter](SearchSuggestion, "relativeDateTimeFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringFromTimeInterval:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHistoryLastAccessedLabel:", v15);

    }
    objc_msgSend(v16, "setHidesHistoryLastAccessedLabel:", v13);
  }

}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  NSString *string;

  string = self->_string;
  if (self->_goesToURL)
    objc_msgSend(a3, "goToURLString:", string);
  else
    objc_msgSend(a3, "search:", string);
}

- (id)completionTableViewCellReuseIdentifier
{
  __CFString *v3;

  v3 = CFSTR("Suggestion");
  if (-[SearchSuggestion hasBeenSearchedBefore](self, "hasBeenSearchedBefore")
    && -[SearchSuggestion _isLabelPreviousSearchesInCompletionListEnabled](self, "_isLabelPreviousSearchesInCompletionListEnabled"))
  {
    v3 = CFSTR("Historic Suggestion");
  }
  return v3;
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  uint64_t v4;
  SearchSuggestionTableViewCell *v5;
  void *v6;
  SearchSuggestionTableViewCell *v7;

  if (-[SearchSuggestion hasBeenSearchedBefore](self, "hasBeenSearchedBefore", a3))
  {
    if (-[SearchSuggestion _isLabelPreviousSearchesInCompletionListEnabled](self, "_isLabelPreviousSearchesInCompletionListEnabled"))
    {
      v4 = 3;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = [SearchSuggestionTableViewCell alloc];
  -[SearchSuggestion completionTableViewCellReuseIdentifier](self, "completionTableViewCellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SearchSuggestionTableViewCell initWithStyle:reuseIdentifier:](v5, "initWithStyle:reuseIdentifier:", v4, v6);

  return v7;
}

- (double)completionTableViewCellCustomHeightForCompletionList:(id)a3
{
  return +[UITableViewCell safari_defaultHeightOfTrivialInstance]();
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (self->_recentSearch)
  {
    v4 = 1;
  }
  else if (self->_searchEngineSuggestion)
  {
    if (self->_goesToURL)
      v4 = 3;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAcceptSearchSuggestionOfType:", v4);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didAcceptCompletionItemOfType:atRank:", 6, a3);

}

- (NSString)parsecDomainIdentifier
{
  return 0;
}

- (BOOL)restoresSearchState
{
  return 1;
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return self->_string;
}

- (BOOL)needsSectionHeader
{
  return 1;
}

- (SFSearchResult)sfSearchResultValue
{
  SFSearchResult *sfSearchResultValue;
  SFSearchResult *v3;
  SFSearchResult *v5;
  SFSearchResult *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  sfSearchResultValue = self->_sfSearchResultValue;
  if (sfSearchResultValue)
  {
    v3 = sfSearchResultValue;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8C6A8], "safari_sfSearchResultWithUniqueIdentifier");
    v5 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sfSearchResultValue;
    self->_sfSearchResultValue = v5;

    -[WBSCompletionQuery queryString](self->_userQuery, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUserInput:](self->_sfSearchResultValue, "setUserInput:", v7);

    -[SFSearchResult setQueryId:](self->_sfSearchResultValue, "setQueryId:", -[WBSCompletionQuery queryID](self->_userQuery, "queryID"));
    objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", self->_string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitle:](self->_sfSearchResultValue, "setTitle:", v8);

    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", 2);
    if (self->_searchEngineSuggestion)
      v9 = CFSTR("SearchEngineSuggestion");
    else
      v9 = CFSTR("UserTypedString");
    if (self->_recentSearch)
      v10 = CFSTR("RecentSearch");
    else
      v10 = v9;
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (self->_offlineSearchEngineSuggestion)
    {

      v12 = CFSTR("SafariCompletionListOfflineSearchEngineSuggestion");
    }
    if (self->_searchEngineSuggestion || self->_recentSearch)
    {
      objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultSearchEngineForPrivateBrowsing:", self->_forPrivateBrowsing);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", objc_msgSend(v14, "parsecSearchResultType"));

    }
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v12);
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", CFSTR("SearchSuggestionProvider"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v15);

    v3 = self->_sfSearchResultValue;
  }
  return v3;
}

- (unint64_t)engagementDestination
{
  if (self->_handlingAccessoryButtonTap)
    return 10;
  else
    return 2;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return self->_string;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchSuggestion string](self, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCompletionQuery)query
{
  return self->_userQuery;
}

- (NSString)string
{
  return self->_string;
}

- (BOOL)goesToURL
{
  return self->_goesToURL;
}

- (BOOL)hasBeenSearchedBefore
{
  return self->_hasBeenSearchedBefore;
}

- (void)setHasBeenSearchedBefore:(BOOL)a3
{
  self->_hasBeenSearchedBefore = a3;
}

- (double)lastVisitTimeInterval
{
  return self->_lastVisitTimeInterval;
}

- (void)setLastVisitTimeInterval:(double)a3
{
  self->_lastVisitTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

- (void)configureCompletionTableViewCell:(os_log_t)log forCompletionList:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Could not configure Search Suggestion cell because search string is nil", v1, 2u);
}

@end
