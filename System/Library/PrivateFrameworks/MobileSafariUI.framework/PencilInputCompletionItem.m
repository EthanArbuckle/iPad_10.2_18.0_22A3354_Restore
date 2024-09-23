@implementation PencilInputCompletionItem

- (PencilInputCompletionItem)initWithUserQuery:(id)a3 navigationURL:(id)a4 searchQuery:(id)a5
{
  id v9;
  id v10;
  id v11;
  PencilInputCompletionItem *v12;
  PencilInputCompletionItem *v13;
  PencilInputCompletionItem *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PencilInputCompletionItem;
  v12 = -[PencilInputCompletionItem init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userQuery, a3);
    objc_storeStrong((id *)&v13->_navigationURL, a4);
    objc_storeStrong((id *)&v13->_searchQuery, a5);
    v13->_parsecQueryID = -[WBSCompletionQuery queryID](v13->_userQuery, "queryID");
    v14 = v13;
  }

  return v13;
}

- (NSString)parsecDomainIdentifier
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

    -[SFSearchResult setUserInput:](self->_sfSearchResultValue, "setUserInput:", self->_searchQuery);
    -[SFSearchResult setQueryId:](self->_sfSearchResultValue, "setQueryId:", -[WBSCompletionQuery queryID](self->_userQuery, "queryID"));
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", CFSTR("PencilInput"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchResult setResultBundleId:](self->_sfSearchResultValue, "setResultBundleId:", v7);
    -[SFSearchResult setSectionBundleIdentifier:](self->_sfSearchResultValue, "setSectionBundleIdentifier:", v7);
    -[SFSearchResult setType:](self->_sfSearchResultValue, "setType:", 2);
    v3 = self->_sfSearchResultValue;

  }
  return v3;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (id)completionTableViewCellReuseIdentifier
{
  return CFSTR("PencilInputCellIdentifier");
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0DC3D50]);
  -[PencilInputCompletionItem completionTableViewCellReuseIdentifier](self, "completionTableViewCellReuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStyle:reuseIdentifier:", 3, v5);

  return v6;
}

- (NSString)text
{
  NSURL *navigationURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  navigationURL = self->_navigationURL;
  if (navigationURL)
  {
    -[NSURL safari_userVisibleString](navigationURL, "safari_userVisibleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_simplifiedUserVisibleURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v5, self->_searchQuery);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PencilInputCompletionItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[UITableViewCell safari_setCompletionIcon:](v7, 6);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("PencilInput"));

}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  if (self->_navigationURL)
    objc_msgSend(a3, "goToURL:");
  else
    objc_msgSend(a3, "search:", self->_searchQuery);
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 4, a3);

}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
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
    -[PencilInputCompletionItem text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)titleForHistoryServiceCompletionList
{
  return self->_searchQuery;
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void)setParsecQueryID:(int64_t)a3
{
  self->_parsecQueryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSearchResultValue, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_navigationURL, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
}

@end
