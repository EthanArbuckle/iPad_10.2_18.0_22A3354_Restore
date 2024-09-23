@implementation PHMemoryAnalyticsHelper

+ (id)analyticsPayloadForMemory:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v22[0] = CFSTR("cpa_memory_memoryType");
  objc_msgSend(a1, "memoryStateStringForMemory:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("cpa_memory_favorited");
  v6 = objc_msgSend(v4, "isFavorite");
  v7 = MEMORY[0x1E0C9AAA0];
  if (v6)
    v7 = MEMORY[0x1E0C9AAB0];
  v23[1] = v7;
  v22[2] = CFSTR("cpa_memory_playCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "playCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  v22[3] = CFSTR("cpa_memory_shareCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "shareCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v9;
  v22[4] = CFSTR("cpa_memory_viewCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "viewCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v10;
  v22[5] = CFSTR("cpa_memory_category");
  +[PHMemory stringForCategory:](PHMemory, "stringForCategory:", objc_msgSend(v4, "category"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v11;
  v22[6] = CFSTR("cpa_memory_subcategory");
  +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:", objc_msgSend(v4, "subcategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v12;
  v22[7] = CFSTR("cpa_memory_triggerType");
  objc_msgSend(a1, "triggerTypesStringForMemory:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v13;
  v22[8] = CFSTR("cpa_memory_colorGradeKind");
  objc_msgSend(v4, "storyColorGradeKind");
  PFStoryColorGradeKindToString();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("None");
  if (v14)
    v16 = (const __CFString *)v14;
  v23[8] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v5, "initWithDictionary:", v17);

  if (objc_msgSend(v4, "isGenerative"))
  {
    +[PHMemoryAnalyticsHelper isPromptSuggestedForGenerativeMemory:](PHMemoryAnalyticsHelper, "isPromptSuggestedForGenerativeMemory:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v18, "setValue:forKey:", v19, CFSTR("memoryPromptIsSuggested"));

  }
  return v18;
}

+ (id)memoryStateStringForMemory:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "featuredState") == 1)
  {
    v4 = CFSTR("Daily Memory");
  }
  else if (objc_msgSend(v3, "pendingState") == 2)
  {
    v4 = CFSTR("Local Memory");
  }
  else if (objc_msgSend(v3, "creationType") == 1)
  {
    v4 = CFSTR("Generative");
  }
  else if (objc_msgSend(v3, "isUserCreated"))
  {
    v4 = CFSTR("User Created");
  }
  else
  {
    v4 = CFSTR("None");
  }

  return (id)v4;
}

+ (id)triggerTypesStringForMemory:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "triggerTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          +[PHMemory stringForTriggerType:](PHMemory, "stringForTriggerType:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "unsignedIntValue", (_QWORD)v16));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("None");
  }

  return v14;
}

+ (id)isPromptSuggestedForGenerativeMemory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "photosGraphProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("generativeMemoryData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("promptInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSuggestedPrompt"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
