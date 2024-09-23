@implementation QuickWebsiteSearchCompletionItem

- (QuickWebsiteSearchCompletionItem)initWithProvider:(id)a3 query:(id)a4 forQueryID:(int64_t)a5
{
  id v9;
  id v10;
  QuickWebsiteSearchCompletionItem *v11;
  QuickWebsiteSearchCompletionItem *v12;
  QuickWebsiteSearchCompletionItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)QuickWebsiteSearchCompletionItem;
  v11 = -[QuickWebsiteSearchCompletionItem init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchProvider, a3);
    objc_storeStrong((id *)&v12->_searchQuery, a4);
    v12->_parsecQueryID = a5;
    v13 = v12;
  }

  return v12;
}

- (id)completionTableViewCellReuseIdentifier
{
  return CFSTR("WebsiteSpecificSearchCell");
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  SearchSuggestionTableViewCell *v4;
  void *v5;
  SearchSuggestionTableViewCell *v6;

  v4 = [SearchSuggestionTableViewCell alloc];
  -[QuickWebsiteSearchCompletionItem completionTableViewCellReuseIdentifier](self, "completionTableViewCellReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SearchSuggestionTableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 0, v5);

  return v6;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 4);

  objc_msgSend(v12, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSQuickWebsiteSearchProvider displayName](self->_searchProvider, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QuickWebsiteSearchQuery searchTerms](self->_searchQuery, "searchTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v11);

  -[UITableViewCell safari_setCompletionIcon:](v12, 3);
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("QuickWebsiteSearch"));

}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D8AB58];
  v5 = a3;
  objc_msgSend(v4, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didPerformSearchWithProvider:", self->_searchProvider);

  -[WBSQuickWebsiteSearchProvider searchURLTemplate](self->_searchProvider, "searchURLTemplate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[QuickWebsiteSearchQuery searchTerms](self->_searchQuery, "searchTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithSearchTerms:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "goToURL:", v8);

}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 7, a3);

}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D8B1E0];
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
}

- (SFSearchResult)sfSearchResultValue
{
  SFSearchResult *sfSearchResultValue;
  SFSearchResult *v3;
  SFSearchResult *v5;
  SFSearchResult *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

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

    v7 = (void *)MEMORY[0x1E0D8C7A8];
    -[QuickWebsiteSearchQuery searchTerms](self->_searchQuery, "searchTerms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitle:](self->_sfSearchResultValue, "setTitle:", v9);

    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", CFSTR("QuickWebsiteSearch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v10);
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v10);
    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", 1);
    v3 = self->_sfSearchResultValue;

  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return -[QuickWebsiteSearchQuery searchTerms](self->_searchQuery, "searchTerms");
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[QuickWebsiteSearchCompletionItem searchProvider](self, "searchProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBSIsEqual();

    if (v10)
    {
      -[QuickWebsiteSearchCompletionItem searchQuery](self, "searchQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "searchTerms");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchQuery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "searchTerms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = WBSIsEqual();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WBSCompletionQuery)query
{
  return -[QuickWebsiteSearchQuery completionQuery](self->_searchQuery, "completionQuery");
}

- (void)setQuery:(id)a3
{
  void *v4;
  char v5;
  QuickWebsiteSearchQuery *v6;
  QuickWebsiteSearchQuery *searchQuery;
  id v8;

  v8 = a3;
  -[QuickWebsiteSearchQuery completionQuery](self->_searchQuery, "completionQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    v6 = -[QuickWebsiteSearchQuery initWithUserEnteredQuery:]([QuickWebsiteSearchQuery alloc], "initWithUserEnteredQuery:", v8);
    searchQuery = self->_searchQuery;
    self->_searchQuery = v6;

  }
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSQuickWebsiteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (QuickWebsiteSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end
