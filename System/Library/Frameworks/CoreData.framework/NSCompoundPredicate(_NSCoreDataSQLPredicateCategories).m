@implementation NSCompoundPredicate(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x18D76B4E4]();
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "predicateOperator"), "minimalFormInContext:ofPredicates:", a3, objc_msgSend(a1, "subpredicates"));
  v7 = v6;
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_msgSend(a1, "subpredicates", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (!v5)
    goto LABEL_14;
  v6 = 0;
  v7 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_keypathsForDerivedPropertyValidation:", &v21);
      v10 = v9;
      if (!v9)
      {
        v11 = 0;
        goto LABEL_17;
      }
      if (objc_msgSend(v9, "count"))
      {
        if (v6)
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v10, "allObjects"));
        else
          v6 = v10;
      }
    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v5)
      continue;
    break;
  }
  if (!v6)
LABEL_14:
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = v6;
LABEL_17:
  v12 = v21;
  if (a3 && v21)
    *a3 = v21;
  objc_msgSend(0, "drain");
  v13 = 0;
  v14 = v21;
  v15 = v6;
  return v11;
}

@end
