@implementation WBSBrowserTabCompletionMatch(SafariCompletionItem)

- (void)acceptCompletionWithActionHandler:()SafariCompletionItem
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "tabUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "windowUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchToTabWithUUID:inWindowWithUUID:forTabGroupWithUUID:", v7, v5, v6);

}

- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 8, a3);

}

- (PageTitleAndAddressTableViewCell)completionTableViewCellForCompletionList:()SafariCompletionItem
{
  PageTitleAndAddressTableViewCell *v2;
  void *v3;
  PageTitleAndAddressTableViewCell *v4;

  v2 = [PageTitleAndAddressTableViewCell alloc];
  objc_msgSend(a1, "completionTableViewCellReuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PageTitleAndAddressTableViewCell initWithStyle:reuseIdentifier:](v2, "initWithStyle:reuseIdentifier:", 3, v3);

  return v4;
}

- (const)completionTableViewCellReuseIdentifier
{
  return CFSTR("SwitchToTabCell");
}

- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend(a1, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", 48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "alternativeDisplayTextForURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "alternativeDisplayTextForURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  objc_msgSend(a1, "tabGroupTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "query");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setTitle:address:prompt:withQuery:", v16, v11, v15, v17);
  +[Application sharedApplication](Application, "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "browserWindowController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tabUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tabWithUUID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "tabOverviewItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "icon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && (objc_msgSend(v23, "isSymbolImage") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A9C8], "resizedImage:withSize:", v23, 24.0, 24.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 24.0, 24.0);
    objc_msgSend(v26, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setImage:", v24);

    v23 = v24;
  }
  else
  {
    -[UITableViewCell safari_setCompletionIcon:](v26, 5);
  }
  objc_msgSend(v26, "setAccessibilityIdentifier:", CFSTR("SwitchToTab"));

}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBSIsEqual();

    if (v8)
    {
      objc_msgSend(a1, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = WBSIsEqual();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
