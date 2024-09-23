@implementation CKSpotlightQueryUtilities

+ (id)defaultSearchControllers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3, v8, v9, v10, v11, v12, v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController](CKSpotlightQueryUtilities, "shouldDisplayWalletSearchController"))
  {
    objc_msgSend(v4, "insertObject:atIndex:", objc_opt_class(), 6);
  }
  objc_msgSend(v4, "insertObject:atIndex:", objc_opt_class(), 3);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSearchTokensEnabled");

  if (v6)
    objc_msgSend(v4, "insertObject:atIndex:", objc_opt_class(), 1);
  return v4;
}

+ (BOOL)shouldDisplayWalletSearchController
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsPassbookAttachments");

  return v5;
}

+ (id)detailsSearchControllers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CKSpotlightQueryUtilities shouldDisplayWalletSearchController](CKSpotlightQueryUtilities, "shouldDisplayWalletSearchController"))
  {
    objc_msgSend(v4, "insertObject:atIndex:", objc_opt_class(), 4);
  }
  objc_msgSend(v4, "insertObject:atIndex:", objc_opt_class(), 1);
  return v4;
}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 primaryFont:(id)a6 annotatedTextColor:(id)a7 annotatedFont:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  void *v28;
  id v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v14, "length"))
  {
    v29 = v15;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v14);
    v20 = objc_msgSend(v19, "length");
    v27 = v13;
    if (objc_msgSend(v13, "length"))
    {
      v21 = objc_msgSend(v14, "rangeOfString:options:", v13, 129);
      v23 = v22;
    }
    else
    {
      v21 = 0;
      v23 = 0;
    }
    v24 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v16, 0, v20, v27);
    v25 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v29, 0, v20);
    if (v23)
    {
      objc_msgSend(v19, "addAttribute:value:range:", v25, v17, v21, v23);
      objc_msgSend(v19, "addAttribute:value:range:", v24, v18, v21, v23);
    }
    v13 = v28;
    v15 = v29;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)annotatedResultStringWithSearchText:(id)a3 resultText:(id)a4 primaryTextColor:(id)a5 annotatedTextColor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v10);
    v14 = objc_msgSend(v13, "length");
    if (objc_msgSend(v9, "length"))
    {
      v15 = objc_msgSend(v10, "rangeOfString:options:", v9, 129);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v11, 0, v14);
    if (v17)
      objc_msgSend(v13, "addAttribute:value:range:", v18, v12, v15, v17);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)stringByEscapingSearchString:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (unint64_t)countOfNonSpaceCharsInSearchString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "length", (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4 matchType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "stringByEscapingSearchString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__84;
  v21 = __Block_byref_object_dispose__84;
  v22 = 0;
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CKSpotlightQueryUtilities_queryStringForSearchString_attributes_matchType___block_invoke;
  v13[3] = &unk_1E2750E30;
  v16 = a5;
  v10 = v9;
  v14 = v10;
  v15 = &v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend((id)v18[5], "componentsJoinedByString:", CFSTR(" || "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __77__CKSpotlightQueryUtilities_queryStringForSearchString_attributes_matchType___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = a1[6];
  if (v4)
  {
    if (v4 != 1)
      goto LABEL_7;
    v5 = CFSTR("%@=\"*%@*\"%@");
  }
  else
  {
    v5 = CFSTR("%@=\"%@*\"%@");
  }
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v3, a1[4], CFSTR("cwdt"));
  v6 = objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v6);

    v3 = v8;
  }
LABEL_7:

}

+ (id)rankingQueriesForSearchString:(id)a3 attributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "stringByEscapingSearchString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        objc_msgSend((id)objc_opt_class(), "rankingQueryForField:matchType:searchString:", v15, 0, v7, (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "rankingQueryForField:matchType:searchString:", v15, 1, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);
        objc_msgSend(v9, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)rankingQueryForField:(id)a3 matchType:(unint64_t)a4 searchString:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (a4)
  {
    if (a4 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = CFSTR("%@=\"*%@*\"%@");
  }
  else
  {
    v9 = CFSTR("%@=\"%@*\"%@");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v7, v8, CFSTR("cwdt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

+ (id)matchedRankingQueriesForResult:(id)a3 withRankingQueryCount:(unint64_t)a4 maxRankingQuery:(unint64_t *)a5
{
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if (a4)
  {
    objc_msgSend(a3, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryResultRelevance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v10 = objc_msgSend(v8, "unsignedIntValue");
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = v11 + 1;
        if (((v10 >> v11) & 1) != 0)
        {
          objc_msgSend(v9, "addIndex:", v13);
          if (v12 <= v13)
            v12 = v13;
        }
        v11 = v13;
      }
      while (a4 != v13);
      if (a5)
        *a5 = v12;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)queryStringFromSubqueries:(id)a3 combineOperator:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  _QWORD v11[4];
  __CFString *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = CFSTR("&&");
    if (!a4)
      v6 = CFSTR("||");
    v7 = v6;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__84;
    v18 = __Block_byref_object_dispose__84;
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__CKSpotlightQueryUtilities_queryStringFromSubqueries_combineOperator___block_invoke;
    v11[3] = &unk_1E275ADF0;
    v13 = &v14;
    v8 = v7;
    v12 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __71__CKSpotlightQueryUtilities_queryStringFromSubqueries_combineOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ (%@)"), *(_QWORD *)(a1 + 32), a2);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), a2, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)tokenAddressesForFilteringWithContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "emailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "phoneNumbers", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          IMNormalizeFormattedString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v18);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

@end
