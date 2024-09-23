@implementation NSPredicate(CDLogging)

- (id)cd_sanitizeForLogging
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v13 = a1;
    v14 = v13;
    if ((isKindOfClass & 1) == 0)
      return v14;
    objc_msgSend(v13, "leftExpression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "cd_containsSensitiveKeyPath");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", CFSTR("<redacted>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0CB3518]);
      objc_msgSend(v14, "leftExpression");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "comparisonPredicateModifier");
      v21 = objc_msgSend(v14, "predicateOperatorType");
      v22 = objc_msgSend(v14, "options");
      v23 = v18;
      v24 = v19;
      v25 = v17;
    }
    else
    {
      objc_msgSend(v14, "rightExpression");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "cd_containsSensitiveKeyPath");

      if (!v27)
      {
        v29 = v14;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", CFSTR("<redacted>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc(MEMORY[0x1E0CB3518]);
      objc_msgSend(v14, "rightExpression");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "comparisonPredicateModifier");
      v21 = objc_msgSend(v14, "predicateOperatorType");
      v22 = objc_msgSend(v14, "options");
      v23 = v28;
      v24 = v17;
      v25 = v19;
    }
    v29 = (id)objc_msgSend(v23, "initWithLeftExpression:rightExpression:modifier:type:options:", v24, v25, v20, v21, v22);

LABEL_19:
    v14 = v29;
    return v14;
  }
  v2 = a1;
  v3 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v2, "subpredicates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8), "cd_sanitizeForLogging");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v2, "compoundPredicateType"), v3);
  return v10;
}

@end
