@implementation NSComparisonPredicate(Conversion)

- (id)FCCKPQueryFiltersWithTranslator:()Conversion error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = a3;
  v32 = 0;
  objc_msgSend(a1, "_parseFullTextSearchUsingContainsTranslator:withError:", v6, &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  v9 = v8;
  if (!v7)
  {
    v31 = v8;
    objc_msgSend(a1, "_parseFullTextSearchFiltersWithTranslator:withError:", v6, &v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v31;

    if (v11)
    {
      v13 = v11;
LABEL_5:
      v10 = v13;
LABEL_6:
      v9 = v12;
      goto LABEL_7;
    }
    if (v12)
      goto LABEL_11;
    if (objc_msgSend(a1, "options"))
    {
      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Predicate comparison options are not supported for expression: %@"), a1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v30 = 0;
    objc_msgSend(a1, "_parseListContainsFiltersWithTranslator:withError:", v6, &v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v30;
    v12 = v17;
    if (v16)
    {
LABEL_16:
      v13 = v16;
      goto LABEL_5;
    }
    if (!v17)
    {
      v29 = 0;
      objc_msgSend(a1, "_parseInFiltersWithTranslator:withError:", v6, &v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v29;
      v12 = v18;
      if (v16)
        goto LABEL_16;
      if (!v18)
      {
        v28 = 0;
        objc_msgSend(a1, "_parseListContainsAnyFiltersWithTranslator:withError:", v6, &v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v28;
        v12 = v19;
        if (v16)
          goto LABEL_16;
        if (!v19)
        {
          v27 = 0;
          objc_msgSend(a1, "_parseListContainsAllFiltersWithTranslator:withError:", v6, &v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v27;
          v12 = v20;
          if (v16)
            goto LABEL_16;
          if (!v20)
          {
            v26 = 0;
            objc_msgSend(a1, "_parseBeginsWithFiltersWithTranslator:withError:", v6, &v26);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v26;
            v12 = v21;
            if (v16)
              goto LABEL_16;
            if (!v21)
            {
              v25 = 0;
              objc_msgSend(a1, "_parseBetweenFiltersWithTranslator:withError:", v6, &v25);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v25;
              v12 = v22;
              if (v16)
                goto LABEL_16;
              if (!v22)
              {
                v24 = 0;
                objc_msgSend(a1, "_parseBasicOperatorFiltersWithTranslator:withError:", v6, &v24);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v24;
                v12 = v23;
                if (v16)
                  goto LABEL_16;
                if (!v23)
                {
                  if (!a4)
                  {
                    v10 = 0;
                    v9 = 0;
                    goto LABEL_7;
                  }
                  objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Unexpected expression: %@"), a1);
                  v15 = (id)objc_claimAutoreleasedReturnValue();
                  v10 = 0;
                  v9 = 0;
                  goto LABEL_14;
                }
              }
            }
          }
        }
      }
    }
LABEL_11:
    v10 = 0;
    if (!a4 || !v12)
      goto LABEL_6;
    v15 = objc_retainAutorelease(v12);
    v9 = v15;
    v10 = 0;
LABEL_14:
    *a4 = v15;
    goto LABEL_7;
  }
  v10 = v7;
LABEL_7:

  return v10;
}

- (id)_parseListContainsFiltersWithTranslator:()Conversion withError:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "predicateOperatorType") == 10
    && !objc_msgSend(a1, "comparisonPredicateModifier")
    && !objc_msgSend(v5, "expressionType")
    && objc_msgSend(v6, "expressionType") == 3)
  {
    v7 = objc_opt_new();
    objc_msgSend(v6, "CKExpressionValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v7, v9);

    if (v7)
    {
      *(_BYTE *)(v7 + 28) |= 1u;
      *(_DWORD *)(v7 + 24) = 12;
    }
    objc_msgSend(v5, "CKExpressionValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v7, v11);

    v25 = v7;
    v12 = &v25;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1, v23, v24, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (objc_msgSend(a1, "predicateOperatorType") == 99
    && !objc_msgSend(a1, "comparisonPredicateModifier")
    && objc_msgSend(v5, "expressionType") == 3
    && !objc_msgSend(v6, "expressionType"))
  {
    v7 = objc_opt_new();
    objc_msgSend(v5, "CKExpressionValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v7, v20);

    if (v7)
    {
      *(_BYTE *)(v7 + 28) |= 1u;
      *(_DWORD *)(v7 + 24) = 12;
    }
    objc_msgSend(v6, "CKExpressionValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v7, v22);

    v24 = v7;
    v12 = &v24;
    goto LABEL_24;
  }
  if (objc_msgSend(a1, "predicateOperatorType") == 4
    && objc_msgSend(a1, "comparisonPredicateModifier") == 2
    && objc_msgSend(v5, "expressionType") == 3
    && !objc_msgSend(v6, "expressionType"))
  {
    v7 = objc_opt_new();
    objc_msgSend(v5, "CKExpressionValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v7, v16);

    if (v7)
    {
      *(_BYTE *)(v7 + 28) |= 1u;
      *(_DWORD *)(v7 + 24) = 12;
    }
    objc_msgSend(v6, "CKExpressionValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v7, v18);

    v23 = v7;
    v12 = &v23;
    goto LABEL_24;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (id)_parseInFiltersWithTranslator:()Conversion withError:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "expressionType");
  v8 = objc_msgSend(v6, "expressionType");
  if (objc_msgSend(a1, "predicateOperatorType") == 10
    && !objc_msgSend(a1, "comparisonPredicateModifier")
    && v7 == 3
    && (v8 == 14 || !v8))
  {
    v9 = objc_opt_new();
    objc_msgSend(v5, "CKExpressionValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v9, v11);

    if (v9)
    {
      *(_BYTE *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 3;
    }
    objc_msgSend(v6, "CKExpressionValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKNSArrayFromCollection(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v9, v14);

    v32 = v9;
    v15 = &v32;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1, v30, v31, v32, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_33;
  }
  if (objc_msgSend(a1, "predicateOperatorType") == 4 && objc_msgSend(a1, "comparisonPredicateModifier") == 2)
  {
    v16 = v7 == 14 || v7 == 0;
    if (v16 && v8 == 3)
    {
      v9 = objc_opt_new();
      objc_msgSend(v6, "CKExpressionValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      FCCKPRecordFieldIdentifierForUserFieldName(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldName:](v9, v18);

      if (v9)
      {
        *(_BYTE *)(v9 + 28) |= 1u;
        *(_DWORD *)(v9 + 24) = 3;
      }
      objc_msgSend(v5, "CKExpressionValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CKNSArrayFromCollection(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldValue:](v9, v21);

      v31 = v9;
      v15 = &v31;
      goto LABEL_32;
    }
  }
  if (objc_msgSend(a1, "predicateOperatorType") == 99 && !objc_msgSend(a1, "comparisonPredicateModifier"))
  {
    v22 = 0;
    v23 = v7 == 14 || v7 == 0;
    if (v23 && v8 == 3)
    {
      v9 = objc_opt_new();
      objc_msgSend(v6, "CKExpressionValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      FCCKPRecordFieldIdentifierForUserFieldName(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldName:](v9, v25);

      if (v9)
      {
        *(_BYTE *)(v9 + 28) |= 1u;
        *(_DWORD *)(v9 + 24) = 3;
      }
      objc_msgSend(v5, "CKExpressionValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      CKNSArrayFromCollection(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldValue:](v9, v28);

      v30 = v9;
      v15 = &v30;
      goto LABEL_32;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_33:

  return v22;
}

- (id)_parseFullTextSearchUsingContainsTranslator:()Conversion withError:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "predicateOperatorType") == 99
    && objc_msgSend(v5, "expressionType") == 1
    && !objc_msgSend(v6, "expressionType"))
  {
    v9 = objc_opt_new();
    v10 = objc_msgSend(a1, "comparisonPredicateModifier");
    if (v9)
    {
      if (v10 == 1)
        v11 = 10;
      else
        v11 = 11;
      *(_BYTE *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = v11;
    }
    objc_msgSend(v6, "constantValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v9, v13);

    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_parseFullTextSearchFiltersWithTranslator:()Conversion withError:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t *v34;
  int v35;
  void *v36;
  objc_class *v37;
  void *v38;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "leftExpression");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "expressionType") == 3)
  {
    objc_msgSend(v7, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("allTokens"));

    v11 = v7;
    v12 = v8;
    if ((v10 & 1) != 0)
      goto LABEL_5;
  }
  if (objc_msgSend(v8, "expressionType") == 3)
  {
    objc_msgSend(v8, "keyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("allTokens"));

    v11 = v8;
    v12 = v7;
    if (v14)
    {
LABEL_5:
      v15 = v11;
      v16 = v12;
      v17 = objc_opt_new();
      v18 = objc_msgSend(v16, "expressionType");
      if (v18)
      {
        if (objc_msgSend(v16, "expressionType") != 4
          || (objc_msgSend(v16, "function"),
              v41 = v15,
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("tokenize:using:")),
              v19,
              v15 = v41,
              !v20))
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required string or tokenize() arguments when searching special key-path allTokens: %@"), a1);
LABEL_14:
            v29 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

            goto LABEL_63;
          }
          goto LABEL_61;
        }
        v40 = v17;
        v42 = (uint64_t)v6;
        objc_msgSend(v16, "arguments");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constantValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(a1, "_comparisonOptionForString:", v23);

        if ((v24 & 0xF) == 0xBLL)
        {
          objc_msgSend(v16, "arguments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "constantValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[FCCKProtocolTranslator fieldValueFromObject:](v42, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v40;
            -[FCCKPQueryFilter setFieldValue:](v40, v28);
LABEL_17:

            v15 = v41;
            if (objc_msgSend(a1, "comparisonPredicateModifier") != 1 || v41 != v7)
            {
              v6 = (id)v42;
              if (objc_msgSend(a1, "predicateOperatorType") == 1000)
              {
                if (!v18
                  && ((objc_msgSend(a1, "options") & 4) != 0
                   || (objc_msgSend(a1, "options") & 1) == 0
                   || (objc_msgSend(a1, "options") & 2) == 0
                   || (objc_msgSend(a1, "options") & 8) == 0))
                {
                  if (a4)
                  {
                    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption comparison predicate options: %@"), a1);
                    goto LABEL_14;
                  }
                  goto LABEL_61;
                }
                v31 = objc_msgSend(a1, "comparisonPredicateModifier");
                if (v17)
                {
                  if (v31 == 1)
                    v32 = 10;
                  else
                    v32 = 11;
                  *(_BYTE *)(v17 + 28) |= 1u;
                  *(_DWORD *)(v17 + 24) = v32;
                }
                v44[0] = v17;
                v33 = (void *)MEMORY[0x1E0C99D20];
                v34 = v44;
              }
              else
              {
                if (objc_msgSend(a1, "predicateOperatorType") != 10)
                {
                  if (a4)
                  {
                    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required comparison operators TOKENMATCHES or IN when searching special key-path allTokens: %@"), a1);
                    goto LABEL_14;
                  }
                  goto LABEL_61;
                }
                if (objc_msgSend(a1, "comparisonPredicateModifier") == 2)
                {
                  v35 = 11;
                }
                else
                {
                  if (objc_msgSend(a1, "comparisonPredicateModifier") != 1)
                  {
                    if (a4)
                    {
                      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required predicate modifier ANY or ALL when searching special key-path allTokens: %@"), a1);
                      goto LABEL_14;
                    }
                    goto LABEL_61;
                  }
                  v35 = 10;
                }
                if (v17)
                {
                  *(_BYTE *)(v17 + 28) |= 1u;
                  *(_DWORD *)(v17 + 24) = v35;
                }
                if (!objc_msgSend(v16, "expressionType"))
                {
                  if (a4)
                  {
                    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required tokenize() operand when searching special key-path allTokens: %@"), a1);
                    goto LABEL_14;
                  }
                  goto LABEL_61;
                }
                v43 = v17;
                v33 = (void *)MEMORY[0x1E0C99D20];
                v34 = &v43;
              }
              objc_msgSend(v33, "arrayWithObjects:count:", v34, 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_62;
            }
            v6 = (id)v42;
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Enumerating special key-path allTokens is not allowed: %@"), a1);
              goto LABEL_14;
            }
LABEL_61:
            v29 = 0;
            goto LABEL_62;
          }
          if (a4)
          {
            v36 = (void *)MEMORY[0x1E0C94EA8];
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "errorWithCode:format:", 1009, CFSTR("Required string argument when using tokenize(), but got %@: %@"), v38, a1);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v29 = 0;
          v15 = v41;
          v6 = (id)v42;
        }
        else
        {
          v15 = v41;
          v6 = (id)v42;
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required NSCaseInsensitivePredicateOption, NSDiacriticInsensitivePredicateOption, and NSLocaleSensitivePredicateOption tokenization options on tokenize() function: %@"), a1);
            v29 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = 0;
          }
        }
        v17 = v40;
        goto LABEL_62;
      }
      v42 = (uint64_t)v6;
      objc_msgSend(v16, "constantValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Required string or tokenize() arguments when comparing to special key-path allTokens: %@"), a1);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v29 = 0;
        v6 = (id)v42;
        goto LABEL_62;
      }
      v41 = v15;
      objc_msgSend(v16, "constantValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKProtocolTranslator fieldValueFromObject:](v42, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldValue:](v17, v30);

      goto LABEL_17;
    }
  }
  v29 = 0;
LABEL_63:

  return v29;
}

- (id)_parseListContainsAnyFiltersWithTranslator:()Conversion withError:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "expressionType");
  v8 = objc_msgSend(v6, "expressionType");
  if (objc_msgSend(a1, "predicateOperatorType") == 10
    && objc_msgSend(a1, "comparisonPredicateModifier") == 2
    && v7 == 3
    && (v8 == 14 || !v8))
  {
    v9 = objc_opt_new();
    objc_msgSend(v5, "CKExpressionValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v9, v11);

    if (v9)
    {
      *(_BYTE *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 14;
    }
    objc_msgSend(v6, "CKExpressionValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKNSArrayFromCollection(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v9, v14);

    v25[0] = v9;
    v15 = v25;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  if (objc_msgSend(a1, "predicateOperatorType") != 10 || objc_msgSend(a1, "comparisonPredicateModifier") != 2)
  {
    v16 = 0;
    goto LABEL_22;
  }
  v16 = 0;
  v17 = v7 == 14 || v7 == 0;
  if (v17 && v8 == 3)
  {
    v9 = objc_opt_new();
    objc_msgSend(v6, "CKExpressionValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v9, v19);

    if (v9)
    {
      *(_BYTE *)(v9 + 28) |= 1u;
      *(_DWORD *)(v9 + 24) = 14;
    }
    objc_msgSend(v5, "CKExpressionValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CKNSArrayFromCollection(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v9, v22);

    v24 = v9;
    v15 = &v24;
    goto LABEL_20;
  }
LABEL_22:

  return v16;
}

- (id)_parseListContainsAllFiltersWithTranslator:()Conversion withError:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "expressionType");
  v8 = objc_msgSend(v6, "expressionType");
  if (objc_msgSend(a1, "predicateOperatorType") == 10 && objc_msgSend(a1, "comparisonPredicateModifier") == 1)
  {
    v9 = 0;
    v10 = v7 == 14 || v7 == 0;
    if (v10 && v8 == 3)
    {
      v11 = objc_opt_new();
      objc_msgSend(v6, "CKExpressionValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      FCCKPRecordFieldIdentifierForUserFieldName(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldName:](v11, v13);

      if (v11)
      {
        *(_BYTE *)(v11 + 28) |= 1u;
        *(_DWORD *)(v11 + 24) = 20;
      }
      objc_msgSend(v5, "CKExpressionValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CKNSArrayFromCollection(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v4, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPQueryFilter setFieldValue:](v11, v16);

      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_parseBetweenFiltersWithTranslator:()Conversion withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "predicateOperatorType") == 100
    && !objc_msgSend(a1, "comparisonPredicateModifier")
    && objc_msgSend(v7, "expressionType") == 3
    && objc_msgSend(v8, "expressionType") == 14)
  {
    objc_msgSend(v8, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "CKExpressionValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CKExpressionValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v28 = v13;
        v14 = objc_opt_new();
        v15 = objc_opt_new();
        objc_msgSend(v7, "CKExpressionValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        FCCKPRecordFieldIdentifierForUserFieldName(v16);
        v17 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPQueryFilter setFieldName:](v14, v18);

        v29 = v17;
        -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPQueryFilter setFieldValue:](v14, v19);

        if (v14)
        {
          *(_BYTE *)(v14 + 28) |= 1u;
          *(_DWORD *)(v14 + 24) = 8;
          v20 = *(void **)(v14 + 8);
        }
        else
        {
          v20 = 0;
        }
        v13 = v28;
        v21 = v20;
        -[FCCKPQueryFilter setFieldName:](v15, v21);

        -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPQueryFilter setFieldValue:](v15, v22);

        if (v15)
        {
          *(_BYTE *)(v15 + 28) |= 1u;
          *(_DWORD *)(v15 + 24) = 6;
        }
        v30[0] = v14;
        v30[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v29;
      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Expected array with two number arguments on right hand side: %@"), a1);
        v23 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      if (a4)
      {
        v25 = (void *)MEMORY[0x1E0C94EA8];
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithCode:format:", 1009, CFSTR("Expected array with two number arguments on right hand side, but got %@: %@"), v27, a1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_parseBeginsWithFiltersWithTranslator:()Conversion withError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "predicateOperatorType") == 8
    && objc_msgSend(v7, "expressionType") == 3
    && !objc_msgSend(v8, "expressionType"))
  {
    objc_msgSend(v8, "CKExpressionValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Expected NSString or NSData on right hand side: %@"), a1);
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        goto LABEL_19;
      }
    }
    v12 = objc_opt_new();
    objc_msgSend(v7, "CKExpressionValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    FCCKPRecordFieldIdentifierForUserFieldName(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldName:](v12, v14);

    -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPQueryFilter setFieldValue:](v12, v15);

    if (objc_msgSend(a1, "comparisonPredicateModifier"))
    {
      if (objc_msgSend(a1, "comparisonPredicateModifier") != 2)
      {
        v9 = 0;
LABEL_18:

LABEL_19:
        goto LABEL_5;
      }
      v16 = 18;
    }
    else
    {
      v16 = 16;
    }
    if (v12)
    {
      *(_BYTE *)(v12 + 28) |= 1u;
      *(_DWORD *)(v12 + 24) = v16;
    }
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v9 = 0;
LABEL_5:

  return v9;
}

- (id)_parseBasicOperatorFiltersWithTranslator:()Conversion withError:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int IsAcceptablePredicateClass;
  int v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(a1, "predicateOperatorType") > 5)
  {
    v11 = 0;
LABEL_6:
    v12 = 0;
LABEL_7:
    v13 = 0;
    goto LABEL_43;
  }
  if (objc_msgSend(v7, "expressionType") == 3 || objc_msgSend(v7, "expressionType") == 1)
  {
    v9 = 0;
    v10 = v7;
LABEL_11:
    objc_msgSend(v10, "CKExpressionValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "expressionType") == 3 || objc_msgSend(v8, "expressionType") == 1)
  {
    v9 = 1;
    v10 = v8;
    goto LABEL_11;
  }
  v9 = 0;
  v11 = 0;
LABEL_12:
  if (!objc_msgSend(v7, "expressionType"))
  {
    v19 = v7;
LABEL_21:
    objc_msgSend(v19, "CKExpressionValue");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!objc_msgSend(v8, "expressionType"))
  {
    v19 = v8;
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "expressionType") != 4
    || (objc_msgSend(v7, "function"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("now")),
        v14,
        !v15))
  {
    if (objc_msgSend(v8, "expressionType") != 4
      || (objc_msgSend(v8, "function"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("now")),
          v16,
          !v17))
    {
      v12 = 0;
      if (v11)
        goto LABEL_23;
LABEL_36:
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Expected key-path in comparison expression: %@"), a1);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        goto LABEL_42;
      }
      v11 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v12 = (void *)v18;
  if (!v11)
    goto LABEL_36;
LABEL_23:
  v20 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C94A18]);
  v21 = v20;
  if (!v12 && (v20 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Expected constant value in comparison expression: %@"), a1);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
LABEL_42:
      v13 = 0;
      *a4 = v22;
      goto LABEL_43;
    }
    goto LABEL_6;
  }
  v23 = objc_msgSend(a1, "predicateOperatorType");
  v24 = v23;
  if (v23 < 4)
    v25 = v9;
  else
    v25 = 0;
  if (v25 == 1)
    v24 = qword_1A1E82678[v23];
  if (objc_msgSend(a1, "comparisonPredicateModifier") == 1)
  {
    if (!a4)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Aggregate operator ALL not allowed for comparison expression: %@"), a1);
LABEL_41:
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (objc_msgSend(a1, "comparisonPredicateModifier") == 2)
  {
    if (!a4)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1009, CFSTR("Aggregate operator ANY not allowed for comparison expression: %@"), a1);
    goto LABEL_41;
  }
  IsAcceptablePredicateClass = CKValueIsAcceptablePredicateClass();
  v28 = v21 ^ 1;
  if (v12)
    v28 = 1;
  if (!IsAcceptablePredicateClass && v28)
  {
    if (a4)
    {
      v29 = (void *)MEMORY[0x1E0C94EA8];
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithCode:format:", 1009, CFSTR("Type '%@' not allowed in comparison expression: %@"), v31, a1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  v32 = objc_opt_new();
  FCCKPRecordFieldIdentifierForUserFieldName(v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPQueryFilter setFieldName:](v32, v33);

  v34 = FCCKPQueryFilterTypeForNSPredicateOperatorType(v24);
  if (v32)
  {
    *(_BYTE *)(v32 + 28) |= 1u;
    *(_DWORD *)(v32 + 24) = v34;
  }
  -[FCCKProtocolTranslator fieldValueFromObject:]((uint64_t)v6, v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPQueryFilter setFieldValue:](v32, v35);

  v36[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
  return v13;
}

- (uint64_t)_comparisonOptionForString:()Conversion
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("n")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v3, "rangeOfString:", CFSTR("N")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("c")) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v3, "rangeOfString:", CFSTR("C")) != 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("d")) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v3, "rangeOfString:", CFSTR("D")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 |= 2uLL;
    }
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("l")) != 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v3, "rangeOfString:", CFSTR("L")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 |= 8uLL;
    }
  }
  else
  {
    v4 = 4;
  }

  return v4;
}

@end
