@implementation CKLinkSearchController

- (unint64_t)searchTokenContentType
{
  return 2;
}

- (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA63E0];
  v5[0] = CFSTR("com_apple_mobilesms_lpPluginPaths");
  v5[1] = v2;
  v3 = *MEMORY[0x1E0CA60D0];
  v5[2] = *MEMORY[0x1E0CA6970];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0CA6018];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryAttributesForText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString **v6;
  uint64_t v7;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v3 = *MEMORY[0x1E0CA6970];
    v10 = CFSTR("com_apple_mobilesms_lpDescription");
    v11 = v3;
    v4 = *MEMORY[0x1E0CA67D8];
    v12 = *MEMORY[0x1E0CA6048];
    v13 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v10;
    v7 = 4;
  }
  else
  {
    v9 = *MEMORY[0x1E0CA6970];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (const __CFString **)&v9;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11, v12, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filterQueries
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA6488], CFSTR("lnk"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *MEMORY[0x1E0CA6028];
  v5 = *MEMORY[0x1E0CA67C8];
  v6 = *MEMORY[0x1E0CA63E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@ == \"*\" || %@ == \"*\" || %@ == \"%@\" || %@ == \"%@\") && %@ == \"%@\"), v4, v5, v6, v7, CFSTR("com_apple_mobilesms_businessChat"), v8, CFSTR("com_apple_mobilesms_dataDetectedLink"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)detailsFilterQueriesForChatGUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    v8 = *MEMORY[0x1E0CA6198];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CKLinkSearchController_detailsFilterQueriesForChatGUIDs___block_invoke;
  v13[3] = &unk_1E274B9A0;
  v13[4] = &v14;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v24 = v15[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __59__CKLinkSearchController_detailsFilterQueriesForChatGUIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" || %@"), a2);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v12);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = (void *)v12;
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 40), "stringByAppendingString:", a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

}

+ (id)sectionTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_LINKS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sectionIdentifier
{
  return CFSTR("LinkSearchSection");
}

+ (id)reuseIdentifierForMode:(unint64_t)a3
{
  return +[CKLinkSearchResultCell reuseIdentifier](CKLinkSearchResultCell, "reuseIdentifier", a3);
}

+ (id)indexingString
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LINKS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)cellClassForMode:(unint64_t)a3
{
  return (Class)objc_opt_class();
}

- (double)interGroupSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchLinksInterItemSpacing");
  v4 = v3 * 0.5;

  return v4;
}

- (id)queryResultsForItems:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKSpotlightQueryResult *v15;
  void *v16;
  CKSpotlightQueryResult *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = -[CKMessageTypeSearchController maxResultsForMode:](self, "maxResultsForMode:", -[CKSearchController mode](self, "mode"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v33 = objc_msgSend(v4, "count");
      v34 = 2048;
      v35 = v26;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Got %lu results. Max is %lu", buf, 0x16u);
    }

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = 0;
    v25 = *(_QWORD *)v28;
LABEL_7:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v25)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
      -[CKMessageTypeSearchController chatGUIDForSearchableItem:](self, "chatGUIDForSearchableItem:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSearchController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "searchController:conversationForChatGUID:", self, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && (objc_msgSend(v12, "isBlockedByCommunicationLimits") & 1) == 0)
      {
        objc_msgSend(v9, "attributeSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v23, "containsObject:", v14) & 1) == 0)
        {
          if (v14)
            objc_msgSend(v23, "addObject:", v14);
          v15 = [CKSpotlightQueryResult alloc];
          objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[CKSpotlightQueryResult initWithSearchableItem:inSection:withConversation:](v15, "initWithSearchableItem:inSection:withConversation:", v9, v16, v12);

          objc_msgSend(v22, "addObject:", v17);
          ++v7;
        }

      }
      if (v7 >= v26)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v6)
          goto LABEL_7;
        break;
      }
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v19;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Returning %lu results", buf, 0xCu);
    }

  }
  v20 = (void *)objc_msgSend(v22, "copy");

  return v20;
}

- (void)postProcessAndUpdateResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[CKLinkSearchController postProcessAndUpdateResults:]";
      v9 = 2048;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s got %lu results", (uint8_t *)&v7, 0x16u);
    }

  }
  -[CKSearchController setResults:](self, "setResults:", v4);
  -[CKSearchController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchControllerContentsDidChange:", self);

}

- (BOOL)applyLayoutMarginsToLayoutGroup
{
  return 1;
}

- (id)cellForSupplementaryItemInCollectionView:(id)a3 atIndexPath:(id)a4 supplementaryViewKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v13, v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SEE_ALL_LINKS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setTitle:", v23);
    objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSectionIdentifier:", v24);
    goto LABEL_8;
  }
  +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSearchAvatarSupplementryView reuseIdentifier](CKSearchAvatarSupplementryView, "reuseIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v25, v26, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v8, "row");
  -[CKSearchController results](self, "results");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v27 < v29)
  {
    -[CKSearchController results](self, "results");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v8, "row"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContact:", v31);
    objc_msgSend(v15, "setAssociatedResult:", v24);
    objc_msgSend(v15, "setParentContentType:", 2);

LABEL_8:
  }

  return v15;
}

- (void)updateSupplementryViewIfNeeded:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = v6;
  v8 = objc_msgSend(v7, "row");
  -[CKSearchController results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 >= v10)
  {
    v12 = 0;
  }
  else
  {
    -[CKSearchController results](self, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "associatedResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      +[CKSpotlightQueryResultUtilities contactForResult:](CKSpotlightQueryResultUtilities, "contactForResult:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContact:", v15);
      objc_msgSend(v16, "setAssociatedResult:", v12);
      objc_msgSend(v16, "setNeedsLayout");

    }
  }

}

- (id)layoutGroupWithEnvironment:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  double v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = 0.0;
  -[CKLinkSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v36, &v35, -[CKSearchController layoutWidth](self, "layoutWidth", a3));
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory");

  v7 = (void *)MEMORY[0x1E0CEA1C0];
  v8 = v36;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v36 * 1.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchLinksFractionalHeightScale");
    objc_msgSend(v7, "fractionalWidthDimension:", v8 * v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchController suppressAvatars](self, "suppressAvatars"))
  {
    objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CEA1C0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchResultAvatarSize");
    objc_msgSend(v14, "absoluteDimension:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v16, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    if (v18 == 1)
      v19 = 3;
    else
      v19 = 9;
    v20 = -8.0;
    if (v18 == 1)
      v20 = 8.0;
    objc_msgSend(MEMORY[0x1E0CEA1A8], "layoutAnchorWithEdges:absoluteOffset:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CEA200];
    +[CKSearchAvatarSupplementryView supplementaryViewType](CKSearchAvatarSupplementryView, "supplementaryViewType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "supplementaryItemWithLayoutSize:elementKind:containerAnchor:", v17, v23, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CEA1E0];
    v37[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itemWithLayoutSize:supplementaryItems:", v12, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeWithWidthDimension:heightDimension:", v28, v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v29, v13, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CEA1F8];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "searchLinksInterItemSpacing");
  objc_msgSend(v31, "fixedSpacing:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInterItemSpacing:", v33);

  return v30;
}

- (void)fractionalWidth:(double *)a3 count:(unint64_t *)a4 forLayoutWidth:(unint64_t)a5
{
  objc_super v9;

  if (CKIsRunningInMacCatalyst())
  {
    if (a3)
      *a3 = 0.5;
    if (a4)
      *a4 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKLinkSearchController;
    -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](&v9, sel_fractionalWidth_count_forLayoutWidth_, a3, a4, a5);
  }
}

- (Class)_richLinkDatasourceClass
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceClassForBundleID:", *MEMORY[0x1E0D375F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)_additionalMenuElementsForResult:(id)a3
{
  return +[CKLinkSearchController _additionalMenuElementsForResult:](CKLinkSearchController, "_additionalMenuElementsForResult:", a3);
}

+ (id)_additionalMenuElementsForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("safari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SEARCH_OPEN_LINK"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__CKLinkSearchController__additionalMenuElementsForResult___block_invoke;
  v12[3] = &unk_1E274B178;
  v13 = v3;
  v8 = v3;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, v4, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __59__CKLinkSearchController__additionalMenuElementsForResult___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "item");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

}

- (id)itemProviderForSearchResult:(id)a3
{
  return +[CKLinkSearchController itemProviderForSearchResult:](CKLinkSearchController, "itemProviderForSearchResult:", a3);
}

+ (id)itemProviderForSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      v11 = *MEMORY[0x1E0CA5C90];
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke;
      v21[3] = &unk_1E274B9C8;
      v13 = v9;
      v22 = v13;
      objc_msgSend(v10, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v11, 0, v21);
      v14 = *MEMORY[0x1E0CA5CA0];
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke_2;
      v19[3] = &unk_1E274B9C8;
      v20 = v13;
      v15 = v13;
      objc_msgSend(v10, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v14, 0, v19);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Unexpected nil URL for link search results", buf, 2u);
        }

      }
      v10 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Unexpected nil search result when trying to create NSItemProvider for link", buf, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

uint64_t __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __54__CKLinkSearchController_itemProviderForSearchResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (id)_activityItemProviderForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKSearchActivityItemProvider *v9;

  v3 = a3;
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedLinkMetadataForQueryResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKSearchActivityItemProvider initWithPlaceholderItem:metadata:]([CKSearchActivityItemProvider alloc], "initWithPlaceholderItem:metadata:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deleteAttachmentForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__CKLinkSearchController_deleteAttachmentForResult___block_invoke;
  v9[3] = &unk_1E274B9F0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "loadMessageItemWithGUID:completionBlock:", v6, v9);

}

void __52__CKLinkSearchController_deleteAttachmentForResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "removeResult:", v4);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchControllerContentsDidChange:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteMessageItem:", v5);

}

- (BOOL)shouldStartMenuInteractionForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !shouldDisable3DTouchPreviewWithNegativeFeedbackForURL(v5);

  return v6;
}

- (id)previewViewControllerForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldDisable3DTouchPreviewWithNegativeFeedbackForURL(v5)
    || (v6 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MLULookupItem"), CFSTR("MobileLookup"))) == 0)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithURL:dataDetectorsResult:text:range:", v5, 0, &stru_1E276D870, 0, 0);
    objc_msgSend(v7, "resolve");
    objc_msgSend(v7, "viewControllerToPresent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)handleSelectionForResult:(id)a3
{
  return +[CKLinkSearchController handleSelectionForResult:](CKLinkSearchController, "handleSelectionForResult:", a3);
}

+ (BOOL)handleSelectionForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D35768];
  objc_msgSend(v3, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastAddressedHandleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLForDugongShareURL:handle:metadata:", v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openURL:withCompletionHandler:", v12, 0);

  return 1;
}

@end
