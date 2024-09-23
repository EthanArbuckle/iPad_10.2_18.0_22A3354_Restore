@implementation SearchQueryRestorationCompletionItem

- (SearchQueryRestorationCompletionItem)initWithQuery:(id)a3
{
  id v5;
  SearchQueryRestorationCompletionItem *v6;
  SearchQueryRestorationCompletionItem *v7;
  SearchQueryRestorationCompletionItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchQueryRestorationCompletionItem;
  v6 = -[SearchQueryRestorationCompletionItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryToRestore, a3);
    v7->_parsecQueryID = -[WBSCompletionQuery queryID](v7->_queryToRestore, "queryID");
    v8 = v7;
  }

  return v7;
}

- (id)completionTableViewCellReuseIdentifier
{
  return CFSTR("SearchRestoration");
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0DC3D50]);
  -[SearchQueryRestorationCompletionItem completionTableViewCellReuseIdentifier](self, "completionTableViewCellReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStyle:reuseIdentifier:", 0, v5);

  return v6;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v10 = a3;
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCompletionQuery queryString](self->_queryToRestore, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[UITableViewCell safari_setCompletionIcon:](v10, 3);
}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  objc_msgSend(a3, "resumeSearchWithQuery:", self->_queryToRestore);
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 3, a3);

}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)CFSTR("restoredSearchCompletion");
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return (id)-[WBSCompletionQuery queryString](self->_queryToRestore, "queryString", a3);
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;

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

    -[SearchQueryRestorationCompletionItem parsecDomainIdentifier](self, "parsecDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSCompletionQuery queryString](self->_queryToRestore, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setUserInput:](self->_sfSearchResultValue, "setUserInput:", v9);

    -[SFSearchResult setQueryId:](self->_sfSearchResultValue, "setQueryId:", -[WBSCompletionQuery queryID](self->_queryToRestore, "queryID"));
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v8);
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v8);
    v10 = (void *)MEMORY[0x1E0D8C7A8];
    -[WBSCompletionQuery queryString](self->_queryToRestore, "queryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setTitle:](self->_sfSearchResultValue, "setTitle:", v12);

    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", 2);
    v3 = self->_sfSearchResultValue;

  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 3;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return (NSString *)-[WBSCompletionQuery queryString](self->_queryToRestore, "queryString");
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchQueryRestorationCompletionItem queryToRestore](self, "queryToRestore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryToRestore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBSIsEqual();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (WBSCompletionQuery)queryToRestore
{
  return self->_queryToRestore;
}

- (void)setQueryToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_queryToRestore, a3);
}

- (CompletionGroupListing)listingToRestore
{
  return self->_listingToRestore;
}

- (void)setListingToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_listingToRestore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listingToRestore, 0);
  objc_storeStrong((id *)&self->_queryToRestore, 0);
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
}

@end
