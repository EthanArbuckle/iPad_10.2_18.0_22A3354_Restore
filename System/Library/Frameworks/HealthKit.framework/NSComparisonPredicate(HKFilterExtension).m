@implementation NSComparisonPredicate(HKFilterExtension)

- (id)hk_filterRepresentationForDataTypes:()HKFilterExtension isSubpredicate:
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  int v32;
  uint64_t v33;
  void *v34;
  unint64_t v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "predicateOperatorType");
  v10 = (uint64_t *)MEMORY[0x1E0C99778];
  if ((v9 > 0xA || v9 == 6) && v9 != 99)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported operator type in comparison expression: %@"), a1);
  v11 = objc_msgSend(v7, "expressionType");
  v12 = v7;
  v13 = v11 != 3;
  if (v11 == 3 || (v14 = objc_msgSend(v8, "expressionType"), v12 = v8, v14 == 3))
  {
    objc_msgSend(v12, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  v16 = objc_msgSend(v7, "expressionType");
  v17 = v7;
  if (v16 && (v18 = objc_msgSend(v8, "expressionType"), v17 = v8, v18))
  {
    v37 = 0;
    v19 = 1;
    if (v15)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(v17, "constantValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (v15)
      goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("Expected key-path in comparison expression: %@"), a1);
LABEL_13:
  if (v19)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("Expected constant value in comparison expression: %@"), a1);
  v20 = objc_msgSend(a1, "predicateOperatorType");
  if (v20 < 4 && v13)
    v20 = qword_19A44BF30[v20];
  v40 = v7;
  v41 = v6;
  v39 = a4;
  v38 = v8;
  v36 = v20;
  if (hk_filterRepresentationForDataTypes_isSubpredicate__onceToken != -1)
    dispatch_once(&hk_filterRepresentationForDataTypes_isSubpredicate__onceToken, &__block_literal_global_67);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = (id)hk_filterRepresentationForDataTypes_isSubpredicate__statsPrefixes;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v43;
    v26 = *v10;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v27);
        if (objc_msgSend(v15, "hasPrefix:", v28))
        {
          objc_msgSend(a1, "_quantityTypeFromKeyPath:prefix:", v15, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v26, CFSTR("Expected quantity type in comparison expression: %@"), a1);
          if ((objc_msgSend(v28, "isEqualToString:", CFSTR("sumQuantity")) & 1) != 0)
          {
            v30 = objc_msgSend(v29, "aggregationStyle");
            v31 = CFSTR("Expected discrete statistics in comparison expression: %@");
            if (v30)
              goto LABEL_32;
          }
          else
          {
            v32 = objc_msgSend(v28, "isEqualToString:", CFSTR("activitySumQuantity"));
            if (objc_msgSend(v29, "aggregationStyle"))
            {
              v31 = CFSTR("Expected discrete statistics in comparison expression: %@");
              if (!v32)
                goto LABEL_33;
            }
            else
            {
              v31 = CFSTR("Expected cumulative statistics in comparison expression: %@");
              if ((v32 & 1) != 0)
                goto LABEL_33;
            }
LABEL_32:
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v26, v31, a1);
          }
LABEL_33:

        }
        ++v27;
      }
      while (v24 != v27);
      v33 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v24 = v33;
    }
    while (v33);
  }

  objc_msgSend(a1, "_comparisonFilterWithKeyPath:operatorType:value:dataTypes:isSubpredicate:", v15, v36, v37, v41, v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_quantityTypeFromKeyPath:()HKFilterExtension prefix:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", v6))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      +[HKQuantityType _quantityTypeWithCode:](HKQuantityType, "_quantityTypeWithCode:", objc_msgSend(v7, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_comparisonFilterWithKeyPath:()HKFilterExtension operatorType:value:dataTypes:isSubpredicate:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  HKComparisonFilterClasses();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "filterForKeyPath:operatorType:value:dataTypes:isSubpredicate:", v11, a4, v12, v13, a7);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;

          goto LABEL_11;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported key path %@ in comparison expression: %@"), v11, a1);
  v20 = 0;
LABEL_11:

  return v20;
}

@end
