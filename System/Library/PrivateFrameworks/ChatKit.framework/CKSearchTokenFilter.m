@implementation CKSearchTokenFilter

- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 itemIdentifier:(id)a4
{
  return -[CKSearchTokenFilter initWithContentType:filterOptions:itemIdentifier:tokenAddresses:](self, "initWithContentType:filterOptions:itemIdentifier:tokenAddresses:", a3, 0, a4, MEMORY[0x1E0C9AA60]);
}

- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 itemIdentifier:(id)a5 tokenAddresses:(id)a6
{
  id v10;
  id v11;
  CKSearchTokenFilter *v12;
  CKSearchTokenFilter *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CKSearchTokenFilter;
  v12 = -[CKSearchTokenFilter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CKSearchTokenFilter setContentType:](v12, "setContentType:", a3);
    -[CKSearchTokenFilter setFilterOptions:](v13, "setFilterOptions:", a4);
    -[CKSearchTokenFilter setItemIdentifier:](v13, "setItemIdentifier:", v10);
    -[CKSearchTokenFilter setTokenAddresses:](v13, "setTokenAddresses:", v11);
  }

  return v13;
}

- (BOOL)hasFilterOption:(unint64_t)a3
{
  return (a3 & ~-[CKSearchTokenFilter filterOptions](self, "filterOptions")) == 0;
}

- (NSString)queryStringForConversationSearch
{
  NSString *queryStringForConversationSearch;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  queryStringForConversationSearch = self->_queryStringForConversationSearch;
  if (!queryStringForConversationSearch)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchTokenFilter itemIdentifier](self, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA5F30], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    if (!-[CKSearchTokenFilter hasFilterOption:](self, "hasFilterOption:", 2))
    {
      v17 = v5;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[CKSearchTokenFilter tokenAddresses](self, "tokenAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        v11 = *MEMORY[0x1E0CA67C0];
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"*%@\"), v11, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

            ++v12;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      v5 = v17;
    }
    +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v4, 0);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_queryStringForConversationSearch;
    self->_queryStringForConversationSearch = v14;

    queryStringForConversationSearch = self->_queryStringForConversationSearch;
  }
  return queryStringForConversationSearch;
}

+ (id)queryStringForMessageTypeSearch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryStringForMessageTypeSearch");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &__block_literal_global_280);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByExcludingObjectsInArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_216_4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35868], "me");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cnContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:](CKSpotlightQueryUtilities, "tokenAddressesForFilteringWithContact:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v7, "arrayByAddingObject:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__84;
    v24 = __Block_byref_object_dispose__84;
    v25 = 0;
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v13 = MEMORY[0x1E0C809B0];
    v25 = v12;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_219;
    v17[3] = &unk_1E275ADA0;
    v19 = &v20;
    v14 = v7;
    v18 = v14;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_3;
    v16[3] = &unk_1E275ADC8;
    v16[4] = &v20;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
    v5 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }

  return v5;
}

uint64_t __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGroupConversation");

  return v3;
}

uint64_t __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tokenAddresses");
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(" || "));
  +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:", v3, *MEMORY[0x1E0CA6018]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__84;
  v19 = __Block_byref_object_dispose__84;
  v20 = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = *(void **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2_222;
  v12 = &unk_1E275AD78;
  v6 = v3;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (%@))"), v4, v16[5], v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v8);

  _Block_object_dispose(&v15, 8);
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2_222(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isEqualToArray:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(" && "));
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = (void *)MEMORY[0x1E0CB3940];
    +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:", v7, *MEMORY[0x1E0CA67C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

  }
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR(" || "));
  objc_msgSend(v6, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\") || (%@ == \"%@\")"), *MEMORY[0x1E0CA6198], v3, *MEMORY[0x1E0CA5F30], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

}

- (NSString)queryStringForMessageTypeSearch
{
  NSString *queryStringForMessageTypeSearch;
  void *v4;
  char v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *v25;
  uint64_t v27;
  void *v28;
  void *v29;

  queryStringForMessageTypeSearch = self->_queryStringForMessageTypeSearch;
  if (queryStringForMessageTypeSearch)
  {
LABEL_11:
    v10 = queryStringForMessageTypeSearch;
    return v10;
  }
  -[CKSearchTokenFilter conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGroupConversation");

  if ((v5 & 1) == 0)
  {
    v11 = -[CKSearchTokenFilter hasFilterOption:](self, "hasFilterOption:", 2);
    -[CKSearchTokenFilter tokenAddresses](self, "tokenAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:", v12, *MEMORY[0x1E0CA6018]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA63E8], MEMORY[0x1E0C9AAA0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@)"), v13, v14);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35868], "me");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cnContact");
      v17 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v17;
      +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:](CKSpotlightQueryUtilities, "tokenAddressesForFilteringWithContact:", v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSearchTokenFilter tokenAddresses](self, "tokenAddresses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:", v19, *MEMORY[0x1E0CA67C0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"%@\"), *MEMORY[0x1E0CA63E8], MEMORY[0x1E0C9AAA0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@) && (%@)"), v18, v20, v21);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && (%@)"), v20, v21, v27);
      v22 = objc_claimAutoreleasedReturnValue();
      -[CKSearchTokenFilter tokenAddresses](self, "tokenAddresses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:", v23, CFSTR("com_apple_mobilesms_mentionedAddresses"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) || (%@) || (%@)"), v13, v22, v24);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();

      v14 = v13;
      v13 = (void *)v22;
    }

    v25 = self->_queryStringForMessageTypeSearch;
    self->_queryStringForMessageTypeSearch = v15;

    queryStringForMessageTypeSearch = self->_queryStringForMessageTypeSearch;
    goto LABEL_11;
  }
  -[CKSearchTokenFilter itemIdentifier](self, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ == \"%@\") || (%@ == \"%@\")"), *MEMORY[0x1E0CA6198], v6, *MEMORY[0x1E0CA5F30], v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = self->_queryStringForMessageTypeSearch;
  self->_queryStringForMessageTypeSearch = v7;
  v9 = v7;

  v10 = self->_queryStringForMessageTypeSearch;
  return v10;
}

- (NSString)queryStringForDateTypeSearch
{
  NSString *queryStringForDateTypeSearch;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t filterOptions;
  NSString *v15;
  NSString *v16;
  uint64_t v18;

  queryStringForDateTypeSearch = self->_queryStringForDateTypeSearch;
  if (!queryStringForDateTypeSearch)
  {
    v4 = self->_tokenAddresses;
    +[CKTokenizationDateParser serializationDateFormatter](CKTokenizationDateParser, "serializationDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKTokenizationDateParser serializationDateFormatter](CKTokenizationDateParser, "serializationDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    filterOptions = self->_filterOptions;
    if ((filterOptions & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemContentCreationDate > %f"), v13, v18);
    }
    else if ((filterOptions & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemContentCreationDate < %f"), v12, v18);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentCreationDate >= %f) && (kMDItemContentCreationDate <= %f)"), v12, v13);
    }
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_queryStringForDateTypeSearch;
    self->_queryStringForDateTypeSearch = v15;

    queryStringForDateTypeSearch = self->_queryStringForDateTypeSearch;
  }
  return queryStringForDateTypeSearch;
}

+ (id)_conditionalForHandles:(id)a3 usingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ == \"*%@\"), v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  +[CKSpotlightQueryUtilities queryStringFromSubqueries:combineOperator:](CKSpotlightQueryUtilities, "queryStringFromSubqueries:combineOperator:", v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)conversationTokensFromTokenFilters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!objc_msgSend(v10, "contentType", (_QWORD)v13))
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (id)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = v3;
  }

  return v11;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)tokenAddresses
{
  return self->_tokenAddresses;
}

- (void)setTokenAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_tokenAddresses, a3);
}

- (CKConversation)conversation
{
  return (CKConversation *)objc_loadWeakRetained((id *)&self->_conversation);
}

- (void)setConversation:(id)a3
{
  objc_storeWeak((id *)&self->_conversation, a3);
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (void)setQueryStringForConversationSearch:(id)a3
{
  objc_storeStrong((id *)&self->_queryStringForConversationSearch, a3);
}

- (void)setQueryStringForDateTypeSearch:(id)a3
{
  objc_storeStrong((id *)&self->_queryStringForDateTypeSearch, a3);
}

- (void)setQueryStringForMessageTypeSearch:(id)a3
{
  objc_storeStrong((id *)&self->_queryStringForMessageTypeSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStringForMessageTypeSearch, 0);
  objc_storeStrong((id *)&self->_queryStringForDateTypeSearch, 0);
  objc_storeStrong((id *)&self->_queryStringForConversationSearch, 0);
  objc_destroyWeak((id *)&self->_conversation);
  objc_storeStrong((id *)&self->_tokenAddresses, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
