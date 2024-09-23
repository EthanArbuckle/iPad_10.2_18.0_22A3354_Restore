@implementation WBSURLCompletionMatch(SafariCompletionItem)

+ (id)_relativeDateTimeFormatter
{
  if (+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::onceToken != -1)
    dispatch_once(&+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::onceToken, &__block_literal_global_55);
  return (id)+[WBSURLCompletionMatch(SafariCompletionItem) _relativeDateTimeFormatter]::formatter;
}

- (void)configureCompletionTableViewCell:()SafariCompletionItem forCompletionList:
{
  id v6;
  id v7;
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
  int v18;
  int v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "rewrittenQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "query");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(a1, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_addressString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_promptString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:address:prompt:withQuery:", v12, v13, v14, v11);

  objc_msgSend(v7, "faviconCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "originalURLString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(a1, "isTopHit");
  if (v17)
    v19 = v18;
  else
    v19 = 0;
  if (v19 == 1)
  {
    objc_msgSend(v6, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v17);

  }
  else
  {
    -[UITableViewCell safari_setCompletionIcon:](v6, objc_msgSend(a1, "_completionIcon"));
  }
  if ((objc_msgSend(a1, "onlyContainsCloudTab") & 1) == 0)
    objc_msgSend(a1, "containsBookmark");
  v25 = CFSTR("isTopHit");
  v21 = objc_msgSend(a1, "isTopHit");
  v22 = CFSTR("false");
  if (v21)
    v22 = CFSTR("true");
  v26[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v24);

}

- (id)_addressString
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(a1, "isTopHit");
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "userVisibleURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_URLWithUserTypedString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v6 = 0;
  else
    v6 = 48;

  objc_msgSend(v5, "safari_stringForListDisplayWithAdditionalSimplificationOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (__CFString)_promptString
{
  __CFString *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isTopHit") & 1) == 0 && (objc_msgSend(a1, "containsBookmark") & 1) == 0)
  {
    if (objc_msgSend(a1, "onlyContainsCloudTab"))
    {
      objc_msgSend(a1, "cloudTabDeviceName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cloudTabDeviceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", v6, v7);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
      v18 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "userVisibleURLString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSURLCompletionMatch(SafariCompletionItem) _promptString].cold.1(v20, (uint64_t)v21, v18);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v9 = v8;
      objc_msgSend(a1, "lastVisitTimeInterval");
      v11 = v10;
      objc_msgSend(a1, "lastVisitTimeInterval");
      if (v12 != 0.0)
      {
        v13 = v9 - v11;
        if (v13 >= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0D8AD70], "_relativeDateTimeFormatter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringFromTimeInterval:", -v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x1E0CB3940];
          _WBSLocalizedString();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", v17, v15);
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

          return v2;
        }
      }
      v18 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "userVisibleURLString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSURLCompletionMatch(SafariCompletionItem) _promptString].cold.2(v19, (uint64_t)v21, v18);
      }
    }

  }
  v2 = &stru_1E9CFDBB0;
  return v2;
}

- (uint64_t)_completionIcon
{
  if ((objc_msgSend(a1, "isTopHit") & 1) != 0)
    return 6;
  if ((objc_msgSend(a1, "containsBookmark") & 1) != 0)
    return 0;
  if (objc_msgSend(a1, "onlyContainsCloudTab"))
    return 1;
  return 2;
}

- (void)acceptCompletionWithActionHandler:()SafariCompletionItem
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "userVisibleURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "goToURLString:", v4);

}

- (const)completionTableViewCellReuseIdentifier
{
  return CFSTR("URL");
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

- (uint64_t)completionTableViewCellCustomHeightForCompletionList:()SafariCompletionItem
{
  return +[PageTitleAndAddressTableViewCell defaultHeight](PageTitleAndAddressTableViewCell, "defaultHeight");
}

- (void)auditAcceptedCompletionWithRank:()SafariCompletionItem
{
  uint64_t v4;
  id v5;

  if (objc_msgSend(a1, "isTopHit"))
    v4 = 9;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAcceptCompletionItemOfType:atRank:", v4, a3);

}

- (id)reflectedStringForUserTypedString:()SafariCompletionItem
{
  objc_msgSend(a1, "matchingStringWithUserTypedPrefix:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtextForHistoryServiceCompletionList
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_promptString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(" · "), "stringByAppendingString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;

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

    if ((v8 & 1) != 0)
    {
      objc_msgSend(a1, "userVisibleURLString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userVisibleURLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = WBSIsEqual();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_promptString
{
  *(_DWORD *)a2 = 138739971;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Invalid last visit time for history item: %{sensitive}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

@end
