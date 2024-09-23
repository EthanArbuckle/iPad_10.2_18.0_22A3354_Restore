@implementation NSCompoundPredicate(SQLitePredicate)

- (id)hd_sqlPredicateForSelect
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_msgSend(a1, "compoundPredicateType");
    if (!v4)
    {
      v14 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(a1, "subpredicates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "negatedPredicate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      return v17;
    }
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "subpredicates", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "hd_sqlPredicateForSelect");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v19 = (void *)v13;

      return v19;
    }

    v3 = 0;
  }
  return v3;
}

@end
