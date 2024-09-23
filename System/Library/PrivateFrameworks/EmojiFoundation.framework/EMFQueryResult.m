@implementation EMFQueryResult

- (EMFQueryResult)initWithQuery:(id)a3 andMatchingDocumentWeights:(id)a4
{
  return -[EMFQueryResult initWithQuery:matchingDocumentWeights:resultOverride:](self, "initWithQuery:matchingDocumentWeights:resultOverride:", a3, a4, 0);
}

- (EMFQueryResult)initWithQuery:(id)a3 matchingDocumentWeights:(id)a4 resultOverride:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMFQueryResult *v12;
  EMFQueryResult *v13;
  uint64_t v14;
  NSDictionary *matchingDocumentWeights;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[EMFQueryResult init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_query, a3);
    v14 = objc_msgSend(v10, "copy");
    matchingDocumentWeights = v13->_matchingDocumentWeights;
    v13->_matchingDocumentWeights = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_resultOverride, a5);
  }

  return v13;
}

- (NSArray)documentMatches
{
  NSArray *documentMatches;
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_matchingDocumentWeights)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  documentMatches = self->_documentMatches;
  if (!documentMatches)
  {
    if (-[EMFQueryResult _matchingDocumentWeightsContainsOnlyBlackLivesMatterResults](self, "_matchingDocumentWeightsContainsOnlyBlackLivesMatterResults"))
    {
      v4 = &unk_1E6729178;
    }
    else
    {
      -[NSDictionary keysSortedByValueUsingComparator:](self->_matchingDocumentWeights, "keysSortedByValueUsingComparator:", &__block_literal_global_0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "integerValue", (_QWORD)v17));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
    -[EMFQueryResult resultOverride](self, "resultOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[EMFQueryResult _handleOverrideResultInterpolationForStandardResults:](self, "_handleOverrideResultInterpolationForStandardResults:", v13);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v13;
    }
    v16 = self->_documentMatches;
    self->_documentMatches = v15;

    documentMatches = self->_documentMatches;
  }
  return documentMatches;
}

uint64_t __33__EMFQueryResult_documentMatches__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)emojiStringMatchesUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  NSOrderedSet *sortedResultSet;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSOrderedSet *v15;
  NSOrderedSet *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  sortedResultSet = self->_sortedResultSet;
  if (sortedResultSet)
  {
    -[NSOrderedSet array](sortedResultSet, "array");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[EMFQueryResult documentMatches](self, "documentMatches", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend((id)objc_opt_class(), "_emojiStringForDocumentID:usingLocaleData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    +[EMFQueryResultSorter sortResults:withLocaleData:sortType:](EMFQueryResultSorter, "sortResults:withLocaleData:sortType:", v7, a3, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v14);
    v16 = self->_sortedResultSet;
    self->_sortedResultSet = v15;

    return v14;
  }
}

- (id)emojiMatchesAndDocumentWeightsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EMFQueryResult documentMatches](self, "documentMatches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend((id)objc_opt_class(), "_emojiStringForDocumentID:usingLocaleData:", v13, a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_matchingDocumentWeights, "objectForKeyedSubscript:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v15 = &unk_1E6729400;
          if (v14)
            v15 = (void *)v14;
          v24[0] = v8;
          v24[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

          v9 = (void *)v14;
        }
        ++v11;
        v12 = v8;
      }
      while (v7 != v11);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);

  }
  else
  {
    v9 = 0;
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

- (id)emojiMatchesForOverriddenResultsUsingEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EMFQueryResultOverride results](self->_resultOverride, "results", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_opt_class(), "_emojiStringForDocumentID:usingLocaleData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[EMFQueryResult documentMatches](self, "documentMatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFQuery tokens](self->_query, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: query tokens: '%@', matches: %lu>"), v8, v5, objc_msgSend(v3, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (__EmojiTokenWrapper)_emojiTokenForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  __EmojiTokenWrapper *result;

  if ((unsigned __int16)objc_msgSend(a3, "unsignedIntValue") != 1263 || (EMFIsDeviceInGreaterChina() & 1) == 0)
  {
    result = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithIndex();
    if (result)
      return result;
    log_emoji_token_creation_error();
  }
  return 0;
}

+ (id)_emojiStringForDocumentID:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  id v6;
  const void *v7;
  const __CFString *String;
  __CFString *Copy;

  v6 = a3;
  v7 = (const void *)objc_msgSend(a1, "_emojiTokenForDocumentID:usingLocaleData:", v6, a4);
  String = (const __CFString *)CEMEmojiTokenGetString();
  if (String)
  {
    Copy = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], String);
    CFRelease(v7);
  }
  else
  {
    objc_msgSend(v6, "unsignedIntValue");
    log_emoji_string_lookup_error();
    if (v7)
      CFRelease(v7);
    Copy = 0;
  }

  return Copy;
}

- (BOOL)_matchingDocumentWeightsContainsOnlyBlackLivesMatterResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[NSDictionary allKeys](self->_matchingDocumentWeights, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_matchingDocumentWeights, "objectForKeyedSubscript:", &unk_1E67242D0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_matchingDocumentWeights, "objectForKeyedSubscript:", &unk_1E67242E8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_matchingDocumentWeights, "objectForKeyedSubscript:", &unk_1E6724300);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_handleOverrideResultInterpolationForStandardResults:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  switch(-[EMFQueryResultOverride overrideBehavior](self->_resultOverride, "overrideBehavior"))
  {
    case 0uLL:
      -[EMFQueryResult _interpolateOverriddenResultsByOverwriting](self, "_interpolateOverriddenResultsByOverwriting");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[EMFQueryResult _interpolateOverriddenResultsByPrepending:](self, "_interpolateOverriddenResultsByPrepending:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[EMFQueryResult _interpolateOverriddenResultsByAppending:](self, "_interpolateOverriddenResultsByAppending:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[EMFQueryResult _interpolateOverriddenResultsByAppendingAndMoving:](self, "_interpolateOverriddenResultsByAppendingAndMoving:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[EMFQueryResult _interpolateOverriddenResultsByFiltering:](self, "_interpolateOverriddenResultsByFiltering:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = v4;
      break;
  }
  v6 = v5;

  return v6;
}

- (id)_interpolateOverriddenResultsByPrepending:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = [v4 alloc];
  -[EMFQueryResultOverride results](self->_resultOverride, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v8, "addObjectsFromArray:", v5);
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_interpolateOverriddenResultsByAppending:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  -[EMFQueryResultOverride results](self->_resultOverride, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_interpolateOverriddenResultsByAppendingAndMoving:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  -[EMFQueryResultOverride results](self->_resultOverride, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v7);

  -[EMFQueryResultOverride results](self->_resultOverride, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_interpolateOverriddenResultsByFiltering:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  -[EMFQueryResultOverride results](self->_resultOverride, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v7);

  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_interpolateOverriddenResultsByOverwriting
{
  return -[EMFQueryResultOverride results](self->_resultOverride, "results");
}

- (EMFQueryResultOverride)resultOverride
{
  return self->_resultOverride;
}

- (EMFQuery)query
{
  return self->_query;
}

- (NSDictionary)matchingDocumentWeights
{
  return self->_matchingDocumentWeights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDocumentWeights, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_resultOverride, 0);
  objc_storeStrong((id *)&self->_documentMatches, 0);
  objc_storeStrong((id *)&self->_sortedResultSet, 0);
}

@end
