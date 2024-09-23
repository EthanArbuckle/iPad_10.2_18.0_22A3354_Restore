@implementation NSSubqueryExpression(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  id v11;

  v5 = (id)objc_msgSend(a1, "predicate");
  v6 = (id)objc_msgSend(a1, "collection");
  v7 = (id)objc_msgSend(v5, "minimalFormInContext:", a3);
  v8 = (id)objc_msgSend(v6, "minimalFormInContext:", a3);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3980], "defaultInstance"), "isEqual:", v7) & 1) != 0)
    return (uint64_t)v8;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35F0], "defaultInstance"), "isEqual:", v7))
    return objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", NSArray_EmptyArray);
  if (v7 == v5 && v8 == v6)
    return (uint64_t)a1;
  if (v7 == v5)
    v7 = (id)objc_msgSend(v5, "copy");
  if (v8 == v6)
    v8 = (id)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend((id)objc_msgSend(a1, "variableExpression"), "copy");
  v11 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExpression:usingIteratorExpression:predicate:", v8, v10, v7);

  return (uint64_t)v11;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = 0;
  v25 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "collection"), "_keypathsForDerivedPropertyValidation:", &v31);
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "count") != 1)
    {
      v19 = 0;
      v31 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134097, &unk_1E1F4A368);
      goto LABEL_24;
    }
    v7 = objc_msgSend(v6, "anyObject");
    objc_msgSend(v4, "addObject:", v7);
    v8 = objc_msgSend((id)objc_msgSend(a1, "variableExpression"), "predicateFormat");
    v9 = (void *)objc_msgSend((id)objc_msgSend(a1, "predicate"), "_keypathsForDerivedPropertyValidation:", &v31);
    v10 = v9;
    if (v9)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (!v11)
      {
        v19 = 1;
        goto LABEL_24;
      }
      v12 = *(_QWORD *)v28;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "localizedStandardRangeOfString:", v8);
        v16 = v15;
        if (v15 && v15 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v4, "addObject:", objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", v8, v7));
        if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          v19 = 1;
          if (v11)
            goto LABEL_6;
          goto LABEL_24;
        }
      }
    }
  }
  v19 = 0;
LABEL_24:
  v20 = v31;
  if (a3 && v31)
    *a3 = v31;
  objc_msgSend(v25, "drain");
  v21 = 0;
  v22 = v31;
  v23 = v4;
  if (v19)
    return v4;
  else
    return 0;
}

@end
