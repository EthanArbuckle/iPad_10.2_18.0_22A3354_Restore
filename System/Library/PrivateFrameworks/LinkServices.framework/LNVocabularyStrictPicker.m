@implementation LNVocabularyStrictPicker

- (id)pickTermsFromCorpora:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      if (v8 == 1000)
        break;
      v11 = 1000 - v8;
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "getTerms", (_QWORD)v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (1000 - v8 < (unint64_t)objc_msgSend(v12, "count") || (v11 = objc_msgSend(v12, "count")) != 0)
      {
        objc_msgSend(v12, "subarrayWithRange:", 0, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v13);
        v8 += v11;

      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v4;
}

@end
