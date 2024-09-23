@implementation SAUIDisambiguationGroup(AFDisambiguationAssistancePrivate)

- (id)af_disambiguationIdentifier
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CC_SHA1_CTX c;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "disambiguationLists", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        _UpdateSha1WithDisambiguationList(&c, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v4);
  }

  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20));
  CC_SHA1_Final((unsigned __int8 *)objc_msgSend(v7, "mutableBytes"), &c);
  return v7;
}

- (id)af_indexIdentifierForItem:()AFDisambiguationAssistancePrivate
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "disambiguationLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "af_indexIdentifierForItem:", v4);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v14 = (void *)v12;

          if (v8 + v10 == 0x7FFFFFFFFFFFFFFFLL)
            v13 = 0;
          else
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu.%@"), v8 + v10, v14);
          goto LABEL_13;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

  v13 = 0;
  v14 = 0;
LABEL_13:

  return v13;
}

- (id)af_itemForIndexIdentifier:()AFDisambiguationAssistancePrivate
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("."));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    v9 = v6;
    objc_msgSend(v4, "substringToIndex:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");
    objc_msgSend(a1, "disambiguationLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    if (v11 || objc_msgSend(v4, "isEqualToString:", CFSTR("0")))
    {
      if (v11 >= v13 || v11 < 0)
        v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v4, "substringFromIndex:", v8 + v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "af_itemForIndexIdentifier:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (void)af_setDisambiguationInfo:()AFDisambiguationAssistancePrivate
{
  id v4;
  id v5;
  void *v6;
  AFDisambiguationStore *v7;

  v4 = a1;
  v5 = a3;
  objc_setAssociatedObject(v4, "DisambiguationInfoKey", v5, (void *)1);
  v7 = objc_alloc_init(AFDisambiguationStore);
  objc_msgSend(v4, "af_disambiguationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFDisambiguationStore saveInfo:forIdentifier:](v7, "saveInfo:forIdentifier:", v5, v6);
}

- (id)af_assistedSelectionItem
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _af_AssistedSelectionItem(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    v4 = &unk_1E3AA9D78;
  else
    v4 = 0;
  objc_msgSend(v2, "logEventWithType:context:", 1925, v4);

  return v1;
}

- (void)af_saveItemSelection:()AFDisambiguationAssistancePrivate forType:
{
  _af_SaveItemSelection(a1, a3, a4);
}

@end
