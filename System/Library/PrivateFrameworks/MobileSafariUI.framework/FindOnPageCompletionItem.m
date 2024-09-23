@implementation FindOnPageCompletionItem

- (FindOnPageCompletionItem)initWithString:(id)a3 numberOfMatches:(unint64_t)a4 forQueryID:(int64_t)a5
{
  id v8;
  FindOnPageCompletionItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FindOnPageCompletionItem *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FindOnPageCompletionItem;
  v9 = -[FindOnPageCompletionItem init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FindOnPageCompletionItem setTitle:](v9, "setTitle:", v10);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FindOnPageCompletionItem setIdentifier:](v9, "setIdentifier:", v12);

    -[FindOnPageCompletionItem setType:](v9, "setType:", 2);
    objc_msgSend(CFSTR("com.apple.Safari.CompletionList."), "stringByAppendingString:", CFSTR("FindOnPage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FindOnPageCompletionItem setResultBundleId:](v9, "setResultBundleId:", v13);
    -[FindOnPageCompletionItem setSectionBundleIdentifier:](v9, "setSectionBundleIdentifier:", v13);
    v9->_parsecQueryID = a5;
    v9->_numberOfMatches = a4;
    v14 = v9;

  }
  return v9;
}

- (id)completionTableViewCellReuseIdentifier
{
  return CFSTR("FindOnPage");
}

- (id)completionTableViewCellForCompletionList:(id)a3
{
  FindOnPageCompletionTableViewCell *v4;
  uint64_t IsPad;
  void *v6;
  FindOnPageCompletionTableViewCell *v7;

  v4 = [FindOnPageCompletionTableViewCell alloc];
  IsPad = _SFDeviceIsPad();
  -[FindOnPageCompletionItem completionTableViewCellReuseIdentifier](self, "completionTableViewCellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FindOnPageCompletionTableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", IsPad, v6);

  return v7;
}

- (id)string
{
  void *v2;
  void *v3;

  -[FindOnPageCompletionItem title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureCompletionTableViewCell:(id)a3 forCompletionList:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t numberOfMatches;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FindOnPageCompletionItem string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (_SFDeviceIsPad())
  {
    numberOfMatches = self->_numberOfMatches;
    if (numberOfMatches == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = &stru_1E9CFDBB0;
    }
    else if (numberOfMatches == 1)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, 1);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else if (numberOfMatches)
    {
      v14 = *MEMORY[0x1E0CD5820];
      v15 = (void *)MEMORY[0x1E0CB3940];
      if (numberOfMatches >= *MEMORY[0x1E0CD5820])
      {
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);
      }
      else
      {
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v16, self->_numberOfMatches);
      }
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _WBSLocalizedString();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v18);

    objc_msgSend(v17, "setText:", v11);
  }
  -[UITableViewCell safari_setCompletionIcon:](v19, 7);
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("FindOnPage"));

}

- (void)acceptCompletionWithActionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FindOnPageCompletionItem string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "browserController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSearchText:", v4);

  objc_msgSend(v9, "findOnPage");
}

- (void)auditAcceptedCompletionWithRank:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 2, a3);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFindOnPageWithTrigger:", 2);

}

- (NSString)parsecDomainIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D8B1D8];
}

- (id)reflectedStringForUserTypedString:(id)a3
{
  return 0;
}

- (BOOL)needsSectionHeader
{
  return 1;
}

- (unint64_t)engagementDestination
{
  return 2;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t numberOfMatches;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[FindOnPageCompletionItem string](self, "string"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "string"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = WBSIsEqual(),
        v6,
        v5,
        v7))
  {
    numberOfMatches = self->_numberOfMatches;
    v9 = numberOfMatches == objc_msgSend(v4, "numberOfMatches");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setQuery:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    v5 = (void *)MEMORY[0x1E0D8C7A8];
    objc_msgSend(v8, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FindOnPageCompletionItem setTitle:](self, "setTitle:", v7);

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

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
