@implementation EMFQueryResultOverrideList

- (EMFQueryResultOverrideList)initWithOverrideListURL:(id)a3
{
  id v4;
  EMFQueryResultOverrideList *v5;
  EMFQueryResultOverrideList *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)EMFQueryResultOverrideList;
    v5 = -[EMFQueryResultOverrideList init](&v12, sel_init);
    if (v5 == self)
    {
      v11 = 0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v4, &v11);
      v8 = v11;
      if (v8)
      {
        emf_logging_get_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[EMFQueryResultOverrideList initWithOverrideListURL:].cold.1((uint64_t)v4, v8, v9);

        v6 = 0;
      }
      else
      {
        objc_storeStrong((id *)&self->_overrideMap, v7);
        v6 = self;
      }

    }
    else
    {
      v6 = 0;
      self = v5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)overriddenResultsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
      do
      {
        -[EMFQueryResultOverrideList overriddenResultsForQuery:searchType:](self, "overriddenResultsForQuery:searchType:", v5, kEMFSearchTypeFallbackOrdering[v7]);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
          v9 = 1;
        else
          v9 = v7 == 3;
        ++v7;
      }
      while (!v9);
      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)overriddenResultsForQuery:(id)a3 searchType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "queryString"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    switch(a4)
    {
      case 0uLL:
        -[EMFQueryResultOverrideList _overriddenResultsRawStringExactMatchForQuery:](self, "_overriddenResultsRawStringExactMatchForQuery:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 1uLL:
        -[EMFQueryResultOverrideList _overriddenResultsRawStringPrefixMatchForQuery:](self, "_overriddenResultsRawStringPrefixMatchForQuery:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 2uLL:
        -[EMFQueryResultOverrideList _overriddenResultsTokenExactMatchForQuery:](self, "_overriddenResultsTokenExactMatchForQuery:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      case 3uLL:
        -[EMFQueryResultOverrideList _overriddenResultsTokenPrefixMatchForQuery:](self, "_overriddenResultsTokenPrefixMatchForQuery:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_5;
    }
    v10 = (void *)v9;
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)_metadataForString:(id)a3
{
  return -[NSDictionary objectForKey:](self->_overrideMap, "objectForKey:", a3);
}

- (id)_overriddenResultsRawStringExactMatchForRawString:(id)a3 andSearchType:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  EMFQueryResultOverride *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  EMFQueryResultOverride *v16;

  -[EMFQueryResultOverrideList _metadataForString:](self, "_metadataForString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && _searchTypeForEntryMetadata(v5) == a4)
  {
    v7 = v6;
    v8 = [EMFQueryResultOverride alloc];
    objc_msgSend(v7, "objectForKey:", CFSTR("results"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

    v13 = _searchTypeForEntryMetadata(v7);
    objc_msgSend(v7, "objectForKey:", CFSTR("overrideBehaviorType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = objc_msgSend(v14, "unsignedIntegerValue");
    else
      v15 = 0;

    v16 = -[EMFQueryResultOverride initWithOverridesArray:searchType:behavior:](v8, "initWithOverridesArray:searchType:behavior:", v12, v13, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_overriddenResultsRawStringExactMatchForQuery:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "normalizedQueryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFQueryResultOverrideList _overriddenResultsRawStringExactMatchForRawString:andSearchType:](self, "_overriddenResultsRawStringExactMatchForRawString:andSearchType:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_overriddenResultsTokenExactMatchForQuery:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "tokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[EMFQueryResultOverrideList _overriddenResultsRawStringExactMatchForRawString:andSearchType:](self, "_overriddenResultsRawStringExactMatchForRawString:andSearchType:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), 2);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_overriddenResultsRawStringPrefixMatchForQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  objc_msgSend(v4, "normalizedQueryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__EMFQueryResultOverrideList__overriddenResultsRawStringPrefixMatchForQuery___block_invoke;
  v8[3] = &unk_1E66FA130;
  v8[4] = self;
  v8[5] = &v9;
  _enumeratePrefixesInStringUsingBlock(v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __77__EMFQueryResultOverrideList__overriddenResultsRawStringPrefixMatchForQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_overriddenResultsRawStringExactMatchForRawString:andSearchType:", a2, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (id)_overriddenResultsTokenPrefixMatchForQuery:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __73__EMFQueryResultOverrideList__overriddenResultsTokenPrefixMatchForQuery___block_invoke;
      v13[3] = &unk_1E66FA130;
      v13[4] = self;
      v13[5] = &v18;
      _enumeratePrefixesInStringUsingBlock(v10, v13);
      if (v19[5])
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __73__EMFQueryResultOverrideList__overriddenResultsTokenPrefixMatchForQuery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_overriddenResultsRawStringExactMatchForRawString:andSearchType:", a2, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMap, 0);
}

- (void)initWithOverrideListURL:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B3DE1000, a3, OS_LOG_TYPE_ERROR, "Override list '%@' could not be loaded: %@", (uint8_t *)&v6, 0x16u);

}

@end
