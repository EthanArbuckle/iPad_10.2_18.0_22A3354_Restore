@implementation NSExpression(_NSCoreDataSQLPredicateCategories)

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  const __CFString *v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0;
  v6 = objc_msgSend(a1, "expressionType");
  if (v6 > 9)
  {
    if (v6 == 10)
    {
      v7 = objc_msgSend(a1, "keyPath");
      goto LABEL_19;
    }
    if (v6 != 14)
      goto LABEL_27;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (void *)objc_msgSend(a1, "collection", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      v11 = 1;
LABEL_9:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "_keypathsForDerivedPropertyValidation:", &v26);
        v14 = v13;
        if (!v13)
          goto LABEL_30;
        if (objc_msgSend(v13, "count"))
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
        if (v9 == ++v12)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
          v14 = 0;
          if (v9)
            goto LABEL_9;
          goto LABEL_21;
        }
      }
    }
  }
  else if ((unint64_t)v6 >= 2)
  {
    if (v6 == 2)
    {
      v7 = objc_msgSend(a1, "predicateFormat");
LABEL_19:
      objc_msgSend(v5, "addObject:", v7);
      goto LABEL_20;
    }
LABEL_27:
    if (a3)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("expression");
      v28 = a1;
      v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v14 = 0;
      v11 = 0;
      *a3 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134097, v21);
      goto LABEL_21;
    }
    v14 = 0;
LABEL_30:
    v11 = 0;
    goto LABEL_21;
  }
LABEL_20:
  v14 = 0;
  v11 = 1;
LABEL_21:
  v15 = v26;
  if (a3 && v26)
    *a3 = v26;
  objc_msgSend(0, "drain");
  v16 = v14;
  v17 = v26;
  v18 = v5;
  if (v11)
    return v5;
  else
    return 0;
}

@end
