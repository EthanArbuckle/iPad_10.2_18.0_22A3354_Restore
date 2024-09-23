@implementation CSSearchableItemAttributeSet(CSQueryResultMatchingHint)

- (void)setMatchingHints:()CSQueryResultMatchingHint
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "flattenedHints", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  -[CSSearchableItemAttributeSet _setArrayValue:withItemClass:forKey:](self, "_setArrayValue:withItemClass:forKey:", v12, objc_opt_class(), CFSTR("kMDQueryResultMatchingHints"));

}

- (NSArray)matchingHints
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSQueryResultMatchingHint *v10;
  CSQueryResultMatchingHint *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", CFSTR("kMDQueryResultMatchingHints"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (v2)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = [CSQueryResultMatchingHint alloc];
          v11 = -[CSQueryResultMatchingHint initWithBackingHint:](v10, "initWithBackingHint:", v9, (_QWORD)v14);
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  v12 = (void *)objc_msgSend(v3, "copy", (_QWORD)v14);

  return (NSArray *)v12;
}

@end
