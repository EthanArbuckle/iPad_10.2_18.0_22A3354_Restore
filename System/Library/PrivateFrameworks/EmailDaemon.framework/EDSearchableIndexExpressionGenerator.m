@implementation EDSearchableIndexExpressionGenerator

+ (id)expressionForPredicate:(id)a3 suggestion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = 0;
  if ((objc_msgSend(v7, "ed_hasOnlySpotlightKeypaths") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDSearchableIndexExpressionGenerator.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate.ed_hasOnlySpotlightKeypaths"));

  }
  objc_msgSend(v7, "ed_searchableIndexQueryStringForQueryWithSuggestion:originalSearchString:", v8 != 0, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), *MEMORY[0x1E0CA60F8], *MEMORY[0x1E0CEC4D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ == '*'"), *MEMORY[0x1E0CA6800]);
    v13 = (void *)MEMORY[0x1E0D1E310];
    v24[0] = v10;
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryStringByJoiningQueries:withOperand:", v14, 2);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  if (v9)
  {
    v16 = (void *)MEMORY[0x1E0D1E310];
    v23[0] = v10;
    v23[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryStringByJoiningQueries:withOperand:", v17, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v10;
  }
  objc_msgSend(MEMORY[0x1E0D1E318], "expressionWithQueryString:searchString:updatedSuggestion:", v18, v22, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)searchableIndexQueryStringForComparisionPredicate:(id)a3 hasSuggestion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (searchableIndexQueryStringForComparisionPredicate_hasSuggestion__onceToken != -1)
    dispatch_once(&searchableIndexQueryStringForComparisionPredicate_hasSuggestion__onceToken, &__block_literal_global_25);
  objc_msgSend(v6, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(a1, "_keyPathIsSuggestable:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v6, "predicateOperatorType");
    objc_msgSend(v6, "rightExpression");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constantValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DD60]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("$time.absolute(%f)"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = *MEMORY[0x1E0CA6A08];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_queryWithAttributes:matchingValue:operatorType:", v15, v14, v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend((id)searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath, "objectForKeyedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(a1, "_queryWithAttributes:matchingValue:operatorType:", v16, v12, v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

void __104__EDSearchableIndexExpressionGenerator_searchableIndexQueryStringForComparisionPredicate_hasSuggestion___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D1DE80];
  v0 = *MEMORY[0x1E0CA67D0];
  v13[0] = *MEMORY[0x1E0CA67D8];
  v13[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v1;
  v14[1] = *MEMORY[0x1E0D1DE50];
  v2 = *MEMORY[0x1E0CA6030];
  v12[0] = *MEMORY[0x1E0CA6048];
  v12[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v14[2] = *MEMORY[0x1E0D1DE40];
  v11 = *MEMORY[0x1E0CA68D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = *MEMORY[0x1E0D1DE38];
  v10 = *MEMORY[0x1E0CA6910];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = *MEMORY[0x1E0D1DDF8];
  v9 = *MEMORY[0x1E0CA6480];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath;
  searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath = v7;

}

+ (id)queryStringByJoiningQueries:(id)a3 withPredicateType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "_operandStringForCompoundPredicateType:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" %@ "), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "componentsJoinedByString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_operandStringForCompoundPredicateType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("&&");
  if (a3 == 2)
    v3 = CFSTR("||");
  if (a3)
    return (id)v3;
  else
    return CFSTR("!");
}

+ (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 operatorType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_comparisonOperationMatchingValue:operatorType:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__EDSearchableIndexExpressionGenerator__queryWithAttributes_matchingValue_operatorType___block_invoke;
  v16[3] = &unk_1E949F1F8;
  v11 = v10;
  v17 = v11;
  objc_msgSend(v8, "ef_map:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 5)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(MEMORY[0x1E0D1E310], "queryStringByJoiningQueries:withOperand:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __88__EDSearchableIndexExpressionGenerator__queryWithAttributes_matchingValue_operatorType___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_comparisonOperationMatchingValue:(id)a3 operatorType:(unint64_t)a4
{
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "em_stringForQuotingWithCharacter:", 39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("= '%@*'cdwt");
    switch(a4)
    {
      case 0uLL:
        v9 = CFSTR("< %@");
        goto LABEL_13;
      case 1uLL:
        v9 = CFSTR("<= %@");
        goto LABEL_13;
      case 2uLL:
        v9 = CFSTR("> %@");
        goto LABEL_13;
      case 3uLL:
        v9 = CFSTR(">= %@");
        goto LABEL_13;
      case 4uLL:
        v9 = CFSTR("= '%@'cd");
        goto LABEL_13;
      case 5uLL:
        v9 = CFSTR("!= '%@'cd");
        goto LABEL_13;
      case 6uLL:
      case 7uLL:
        goto LABEL_6;
      case 8uLL:
        goto LABEL_13;
      case 9uLL:
        v9 = CFSTR("= '*%@'cdwt");
        goto LABEL_13;
      default:
        if (a4 == 99)
        {
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_6:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", CFSTR("= '%@*'cdwt"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EDSearchableIndexExpressionGenerator.m"), 204, CFSTR("unexpected operator type"));

          v10 = 0;
        }

        break;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_keyPathIsSuggestable:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (_keyPathIsSuggestable__onceToken != -1)
    dispatch_once(&_keyPathIsSuggestable__onceToken, &__block_literal_global_61_0);
  v4 = objc_msgSend((id)_keyPathIsSuggestable__suggestableKeyPaths, "containsObject:", v3);

  return v4;
}

void __62__EDSearchableIndexExpressionGenerator__keyPathIsSuggestable___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D1DE80], *MEMORY[0x1E0D1DE88], *MEMORY[0x1E0D1DD38], *MEMORY[0x1E0D1DD08], *MEMORY[0x1E0D1DD10], *MEMORY[0x1E0D1DE50], *MEMORY[0x1E0D1DE58], *MEMORY[0x1E0D1DE40], *MEMORY[0x1E0D1DE38], *MEMORY[0x1E0D1DD60], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_keyPathIsSuggestable__suggestableKeyPaths;
  _keyPathIsSuggestable__suggestableKeyPaths = v0;

}

@end
