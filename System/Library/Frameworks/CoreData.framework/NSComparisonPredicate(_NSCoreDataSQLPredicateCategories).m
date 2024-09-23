@implementation NSComparisonPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v12;
  void *v13;

  v4 = a1;
  v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "minimalFormInContext:", a3);
  v6 = (id)objc_msgSend((id)objc_msgSend(v4, "rightExpression"), "minimalFormInContext:", a3);
  v7 = objc_msgSend(v4, "leftExpression");
  v8 = objc_msgSend(v4, "rightExpression");
  v9 = objc_msgSend(v4, "predicateOperatorType");
  if (!objc_msgSend(v5, "expressionType") && !objc_msgSend(v6, "expressionType"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "allowEvaluation");
    if (!objc_msgSend(v4, "evaluateWithObject:", 0))
      goto LABEL_24;
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "expressionType"))
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_5;
  }
  if (!objc_msgSend(v6, "constantValue"))
  {
    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v10 = 4;
      goto LABEL_5;
    }
LABEL_36:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid predicate: nil RHS"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("predicate"))));
  }
  v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E38], "null"), "isEqual:", objc_msgSend(v6, "constantValue"))&& v10 != 4)
  {
    goto LABEL_36;
  }
LABEL_5:
  if (!objc_msgSend(v6, "expressionType")
    && v10 == 6
    && objc_msgSend(&stru_1E1EE23F0, "isEqual:", objc_msgSend(v6, "constantValue")))
  {
    goto LABEL_24;
  }
  if (v9 == 99 || v9 == 10)
    return objc_msgSend((id)objc_msgSend(v4, "predicateOperator"), "minimalFormInContext:ofPredicate:", a3, v4);
  if (!-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((_BOOL8)v4, v5, a3)
    && !-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((_BOOL8)v4, v6, a3))
  {
    if (v5 != (id)v7 || v6 != (id)v8)
    {
      v13 = (void *)objc_msgSend((id)objc_msgSend(v4, "predicateOperator"), "copy");
      if (v5 == (id)v7)
        v5 = (id)objc_msgSend(v5, "copy");
      if (v6 == (id)v8)
        v6 = (id)objc_msgSend(v6, "copy");
      v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicateOperator:leftExpression:rightExpression:", v13, v5, v6);

    }
    return (uint64_t)v4;
  }
  if (v9 == 5)
  {
LABEL_23:
    v12 = (void *)MEMORY[0x1E0CB3980];
    return objc_msgSend(v12, "defaultInstance");
  }
  if (v9 == 4)
  {
LABEL_24:
    v12 = (void *)MEMORY[0x1E0CB35F0];
    return objc_msgSend(v12, "defaultInstance");
  }
  return (uint64_t)v4;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;

  v13 = 0;
  v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v5)
    goto LABEL_6;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "rightExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v6)
  {
    v5 = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v5 = v5;
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "allObjects"));
  v7 = v5;
LABEL_7:
  v8 = v13;
  if (a3 && v13)
    *a3 = v13;
  objc_msgSend(0, "drain");
  v9 = 0;
  v10 = v13;
  v11 = v5;
  return v7;
}

@end
