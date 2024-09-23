@implementation SAUIAddDialogs(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&off_1EE424118;
  objc_msgSendSuper2(&v17, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "af_dialogIdentifiersForAnalyticsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("dialogIdentifiers"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "dialogs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "af_analyticsContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("dialogs"));

}

- (id)af_dialogIdentifiersForAnalyticsContext
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "dialogs", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "af_dialogIdentifiersForAnalyticsContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          if (!v4)
            v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "addObjectsFromArray:", v7);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

@end
