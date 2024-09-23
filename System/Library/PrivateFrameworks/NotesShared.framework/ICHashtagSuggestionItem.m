@implementation ICHashtagSuggestionItem

+ (id)suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  ICHashtagSuggestionItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  ICHashtagSuggestionItem *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v12 = objc_alloc_init(ICHashtagSuggestionItem);
        objc_msgSend(v11, "standardizedContent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICHashtagSuggestionItem setTokenContentIdentifier:](v12, "setTokenContentIdentifier:", v13);

        objc_msgSend(v11, "displayText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICHashtagSuggestionItem setDisplayText:](v12, "setDisplayText:", v14);

        objc_msgSend(v5, "addObject:", v12);
        -[ICHashtagSuggestionItem displayText](v12, "displayText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ic_addNonNilObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  v26 = v6;

  +[ICCrossAppHashtagManager hashtagDisplayTextsFromOtherApps](ICCrossAppHashtagManager, "hashtagDisplayTextsFromOtherApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsObject:", v21) & 1) == 0)
        {
          v22 = objc_alloc_init(ICHashtagSuggestionItem);
          +[ICHashtag standardizedHashtagRepresentationForDisplayText:](ICHashtag, "standardizedHashtagRepresentationForDisplayText:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICHashtagSuggestionItem setTokenContentIdentifier:](v22, "setTokenContentIdentifier:", v23);

          -[ICHashtagSuggestionItem setDisplayText:](v22, "setDisplayText:", v21);
          objc_msgSend(v5, "addObject:", v22);
          objc_msgSend(v4, "ic_addNonNilObject:", v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }
  v24 = (void *)objc_msgSend(v5, "copy");

  return v24;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[ICHashtagSuggestionItem lastUsedDate](self, "lastUsedDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(v4, "lastUsedDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    -[ICHashtagSuggestionItem lastUsedDate](self, "lastUsedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v4, "lastUsedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v4, "tokenContentIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "tokenContentIdentifier");
            v9 = objc_claimAutoreleasedReturnValue();
            goto LABEL_4;
          }
        }
        -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {

        }
        else
        {
          objc_msgSend(v4, "tokenContentIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v11 = 0;
            goto LABEL_13;
          }
        }
        -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = (void *)v14;
        if (v14)
          v11 = -1;
        else
          v11 = 1;
        goto LABEL_12;
      }
    }
    -[ICHashtagSuggestionItem lastUsedDate](self, "lastUsedDate");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "lastUsedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHashtagSuggestionItem lastUsedDate](self, "lastUsedDate");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = (void *)v9;
  v11 = objc_msgSend(v8, "compare:", v9);

LABEL_12:
LABEL_13:

  return v11;
}

+ (id)sortedItems:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "tokenContentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ic_addNonNilObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICInlineAttachment recentlyUsedDatesForHashtagsStandardizedContents:context:](ICInlineAttachment, "recentlyUsedDatesForHashtagsStandardizedContents:context:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v21, "tokenContentIdentifier", (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLastUsedDate:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __47__ICHashtagSuggestionItem_sortedItems_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)sortedSuggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "suggestionItemsWithHashtagsIncludingHashtagsFromOtherApps:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sortedItems:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "tokenContentIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v5, "tokenContentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v11 = 1;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
  -[ICHashtagSuggestionItem tokenContentIdentifier](self, "tokenContentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenContentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

LABEL_9:
  return v11;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (NSString)tokenContentIdentifier
{
  return self->_tokenContentIdentifier;
}

- (void)setTokenContentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_tokenContentIdentifier, a3);
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_tokenContentIdentifier, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
