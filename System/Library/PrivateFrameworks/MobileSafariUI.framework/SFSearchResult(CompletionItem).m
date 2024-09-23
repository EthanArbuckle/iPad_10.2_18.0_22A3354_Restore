@implementation SFSearchResult(CompletionItem)

- (id)completionTableViewCellForCompletionList:()CompletionItem
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(getSearchUIClass(), "rowViewForResult:style:feedbackDelegate:", a1, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureCompletionTableViewCell:()CompletionItem forCompletionList:
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "safari_configureBackgroundColorForCompletionList:", a4);
  objc_msgSend(a1, "resultType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "updateWithResult:", a1);

}

- (NewsCompletionHeaderView)completionTableHeaderView
{
  NewsCompletionHeaderView *v2;
  void *v3;
  NewsCompletionHeaderView *v4;

  if (-[SFSearchResult _willShowNewsHeader](a1))
  {
    v2 = [NewsCompletionHeaderView alloc];
    objc_msgSend(a1, "completionTableHeaderViewReuseIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NewsCompletionHeaderView initWithReuseIdentifier:](v2, "initWithReuseIdentifier:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (const)completionTableHeaderViewReuseIdentifier
{
  if (-[SFSearchResult _willShowNewsHeader](a1))
    return CFSTR("ParsecNewsHeaderView");
  else
    return 0;
}

- (uint64_t)usesDefaultHeaderView
{
  return -[SFSearchResult _willShowNewsHeader](a1) ^ 1;
}

- (void)configureCompletionTableHeaderView:()CompletionItem forCompletionListGroup:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[SFSearchResult _willShowNewsHeader](a1))
  {
    v7 = v9;
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHeaderText:", v8);

  }
}

- (void)acceptCompletionWithActionHandler:()CompletionItem
{
  id v4;
  void *v5;
  void *v6;
  id SearchUIClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D89BE8], "isSMARTParsecResultsEnabled")
    || (getSearchUIClass(), (objc_opt_respondsToSelector() & 1) == 0)
    || (v4 = getSearchUIClass(),
        +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = objc_msgSend(v4, "hasValidCommandForResult:feedbackListener:", a1, v5),
        v5,
        (v4 & 1) == 0))
  {
    objc_msgSend(a1, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      SearchUIClass = getSearchUIClass();
      objc_msgSend(v12, "searchUIFeedbackDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(SearchUIClass, "cardViewControllerForCard:feedbackDelegate:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v12, "presentDetail:", v9);
        objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didActualizeImpressionForURL:provenance:", v11, 1);

      }
      else
      {
        objc_msgSend(a1, "punchoutWithHandler:", v12);
      }

    }
    else
    {
      objc_msgSend(a1, "punchoutWithHandler:", v12);
    }

  }
}

- (void)punchoutWithHandler:()CompletionItem
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  objc_msgSend(a1, "punchout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v7)
  {
    v8 = v7;
    v62 = *(_QWORD *)v69;
    v57 = v6;
    v55 = a1;
    while (2)
    {
      v9 = 0;
      v58 = v8;
      do
      {
        if (*(_QWORD *)v69 != v62)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v9);
        objc_msgSend(v10, "scheme");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (isNewsScheme(v11))
        {
          _newsProxy();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appState");
          v13 = v9;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isInstalled");

          v9 = v13;
          if (v15)
            goto LABEL_40;
        }
        else
        {
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("weather")) & 1) != 0
            || objc_msgSend(v11, "isEqualToString:", CFSTR("stocks")))
          {
LABEL_40:
            objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "openSensitiveURL:withOptions:", v10, 0);

            objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "url");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "didActualizeImpressionForURL:provenance:", v53, 1);

LABEL_41:
            v41 = v6;
            goto LABEL_42;
          }
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("app-distr")))
          {
            v61 = v11;
            v16 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
            objc_msgSend(v16, "setNumberStyle:", 1);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v60 = v17;
            objc_msgSend(v17, "queryItems");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
            v59 = v9;
            if (v18)
            {
              v19 = v18;
              v20 = 0;
              v21 = 0;
              v22 = 0;
              v23 = *(_QWORD *)v65;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v65 != v23)
                    objc_enumerationMutation(obj);
                  v25 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                  objc_msgSend(v25, "name");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("bundle_id"));

                  if (v27)
                  {
                    objc_msgSend(v25, "value");
                    v28 = objc_claimAutoreleasedReturnValue();

                    v22 = v28;
                  }
                  objc_msgSend(v25, "name");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("adam_id"));

                  if (v30)
                  {
                    objc_msgSend(v25, "value");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "numberFromString:", v31);
                    v32 = objc_claimAutoreleasedReturnValue();

                    v21 = v32;
                  }
                  objc_msgSend(v25, "name");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("ext_version_id"));

                  if (v34)
                  {
                    objc_msgSend(v25, "value");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "numberFromString:", v35);
                    v36 = objc_claimAutoreleasedReturnValue();

                    v20 = (void *)v36;
                  }
                }
                v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
              }
              while (v19);
            }
            else
            {
              v20 = 0;
              v21 = 0;
              v22 = 0;
            }

            if (v22 | v21)
            {
              v54 = (void *)v22;
              objc_msgSend(MEMORY[0x1E0D4F6C8], "handlePunchoutWithBundleID:adamID:externalVersionID:", v22, v21, v20);

              v6 = v57;
              v41 = v57;
              v11 = v61;
              goto LABEL_42;
            }

            v6 = v57;
            v8 = v58;
            v11 = v61;
            v9 = v59;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "canOpenURL:", v10);

            if (v38)
            {
              objc_msgSend(v10, "host");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v54, "isEqualToString:", CFSTR("maps.apple.com"))
                && !-[SFSearchResult _usesMapsPlacecard](v55)
                || (objc_msgSend(v54, "isEqualToString:", CFSTR("itunes.apple.com")) & 1) != 0
                || objc_msgSend(v54, "isEqualToString:", CFSTR("weather.apple.com")))
              {
                objc_msgSend(v56, "openURLInExternalApplication:", v10);
              }
              else
              {
                objc_msgSend(v56, "goToURL:", v10);
              }
              goto LABEL_41;
            }
          }
        }

        ++v9;
      }
      while (v9 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      a1 = v55;
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "domainName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("web_answer"));

  if (v40)
  {
    objc_msgSend(a1, "_sf_punchoutURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v56, "goToURL:", v41);
    objc_msgSend(a1, "inlineCard");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "cardSections");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "cardSections");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "command");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        objc_msgSend(v54, "command");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "command");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "punchout");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "preferredOpenableURL");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "goToURL:", v51);

        }
      }
LABEL_42:

    }
  }

}

- (id)userVisibleURLString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "punchout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "urls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)originalURLString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "punchout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "urls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_userVisibleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)auditAcceptedCompletionWithRank:()CompletionItem
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didAcceptCompletionItemOfType:atRank:", 10, a3);

}

- (uint64_t)restoresSearchState
{
  return 1;
}

- (__CFString)completionTableViewCellReuseIdentifier
{
  void *v2;
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getSearchUITableViewCellClass_softClass;
  v12 = getSearchUITableViewCellClass_softClass;
  if (!getSearchUITableViewCellClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getSearchUITableViewCellClass_block_invoke;
    v8[3] = &unk_1E9CF1780;
    v8[4] = &v9;
    __getSearchUITableViewCellClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "reuseIdentifierForResult:", a1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("SFSearchResultParsec");
  v6 = v4;

  return v6;
}

- (id)reflectedStringForUserTypedString:()CompletionItem
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D8ABC0];
  v5 = a3;
  objc_msgSend(a1, "userVisibleURLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "completedQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "shouldAutocompleteToURL:fromUserTypedString:withPredictedQueryString:", v6, v5, v7);

  if ((_DWORD)v4)
  {
    objc_msgSend(a1, "completedQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)parsecDomainIdentifier
{
  return 0;
}

- (id)handlerForActionItem
{
  return objc_getAssociatedObject(a1, (const void *)actionItemHandlerKey);
}

- (void)setHandlerForActionItem:()CompletionItem
{
  objc_setAssociatedObject(a1, (const void *)actionItemHandlerKey, a3, 0);
}

- (uint64_t)isEquivalentTo:()CompletionItem
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
  uint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = WBSIsEqual();

    if (v10)
    {
      objc_msgSend(a1, "userVisibleURLString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userVisibleURLString");
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

- (uint64_t)completionCellBackgroundModeInTopSection
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 0;
  objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSMARTParsecResultsEnabled"))
  {
    objc_msgSend(a1, "inlineCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 2;
  }
  objc_msgSend(a1, "inlineCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safari_containsObjectPassingTest:", &__block_literal_global_27);

  if (v9)
    return 2;
  else
    return 1;
}

- (void)safari_configureBackgroundColorForCompletionList:()CompletionItem
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "shouldOverrideBackgroundViewForItem:", a1))
  {
    objc_msgSend(a1, "inlineCard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", 0);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "inlineCard", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setBackgroundColor:", 0);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (id)urlStringForHistoryServiceCompletionList
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sfSearchResultValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userVisibleURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)safari_setCompletionIconForCompactRow:()CompletionItem
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      systemImageNameForCompletionIcon(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v5, "symbolName"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isEqualToString:", v6),
            v7,
            (v8 & 1) == 0))
      {
        v9 = objc_alloc_init(MEMORY[0x1E0D8C780]);
        objc_msgSend(v9, "setSymbolName:", v6);
        objc_msgSend(v9, "setIsTemplate:", 1);
        objc_msgSend(v10, "setImage:", v9);

      }
    }

    v4 = v10;
  }

}

- (id)safari_titleForReflection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v6)
    {
      objc_msgSend(v6, "leadingText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

@end
