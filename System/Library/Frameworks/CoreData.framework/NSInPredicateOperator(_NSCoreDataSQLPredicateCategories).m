@implementation NSInPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicate:
{
  void *v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a4, "rightExpression");
  v8 = objc_msgSend(a1, "operatorType");
  if (v8 == 99)
    v7 = (void *)objc_msgSend(v4, "leftExpression");
  v9 = objc_msgSend(v7, "expressionType");
  v10 = v9;
  if (v9 != 14 && v9)
    return (uint64_t)v4;
  v11 = (void *)objc_msgSend(v7, "constantValue");
  if (objc_msgSend(v11, "isNSString"))
  {
    if (objc_msgSend(v11, "length"))
      return (uint64_t)v4;
    v12 = (void *)MEMORY[0x1E0CB3980];
    return objc_msgSend(v12, "defaultInstance");
  }
  if ((objc_msgSend(v11, "isNSArray") & 1) == 0
    && (objc_msgSend(v11, "isNSSet") & 1) == 0
    && (objc_msgSend(v11, "isNSOrderedSet") & 1) == 0
    && !objc_msgSend(v11, "isNSDictionary"))
  {
    return (uint64_t)v4;
  }
  if (!objc_msgSend(v11, "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB35F0];
    return objc_msgSend(v12, "defaultInstance");
  }
  if (v10 || (objc_msgSend(v11, "isNSDictionary") & 1) != 0)
    return (uint64_t)v4;
  v26 = v8;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  objc_opt_class();
  v14 = objc_msgSend(a3, "valueForKey:", CFSTR("persistentStore"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v15)
    goto LABEL_29;
  v16 = v15;
  v17 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_25:
          if (objc_msgSend(v19, "persistentStore") != v14)
            continue;
        }
LABEL_26:
        objc_msgSend(v13, "addObject:", v19);
        continue;
      }
      if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "persistentStore") == v14)
        goto LABEL_26;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_25;
    }
    v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v16);
LABEL_29:
  if (objc_msgSend(v13, "count"))
  {
    v20 = objc_msgSend(v11, "count");
    if (v20 == objc_msgSend(v13, "count"))
    {

      return (uint64_t)v4;
    }
    v23 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v13);

    v24 = (void *)MEMORY[0x1E0CB3518];
    if (v26 == 10)
    {
      v25 = objc_msgSend(v4, "leftExpression");
    }
    else
    {
      v25 = v23;
      v23 = objc_msgSend(v4, "rightExpression");
    }
    return objc_msgSend(v24, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v25, v23, objc_msgSend(v4, "comparisonPredicateModifier"), v26, objc_msgSend(v4, "options"));
  }
  else
  {

    return objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance");
  }
}

@end
