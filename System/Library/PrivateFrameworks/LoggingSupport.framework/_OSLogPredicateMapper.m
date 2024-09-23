@implementation _OSLogPredicateMapper

- (void)visitPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_pass)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_OSLogPredicateMapper processComparisonPredicate:](self, "processComparisonPredicate:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_OSLogPredicateMapper processCompoundPredicate:](self, "processCompoundPredicate:", v5);
      else
        -[NSMutableArray addObject:](self->_stack, "addObject:", v5);
    }
    v4 = v5;
  }

}

- (void)processComparisonPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "leftExpression");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightExpression");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_OSLogPredicateMapper mapLeftExpression:andRightExpression:](self, "mapLeftExpression:andRightExpression:", &v13, &v12);
  -[_OSLogPredicateMapper mapLeftExpression:andRightExpression:](self, "mapLeftExpression:andRightExpression:", &v12, &v13);
  v5 = objc_alloc(MEMORY[0x1E0CB3518]);
  v7 = v12;
  v6 = v13;
  v8 = objc_msgSend(v4, "comparisonPredicateModifier");
  v9 = objc_msgSend(v4, "predicateOperatorType");
  v10 = objc_msgSend(v4, "options");

  v11 = (void *)objc_msgSend(v5, "initWithLeftExpression:rightExpression:modifier:type:options:", v6, v7, v8, v9, v10);
  -[NSMutableArray addObject:](self->_stack, "addObject:", v11);

}

- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  uint64_t v22;
  id v23;

  if (mapLeftExpression_andRightExpression__once != -1)
    dispatch_once(&mapLeftExpression_andRightExpression__once, &__block_literal_global_197);
  if (objc_msgSend(*a3, "expressionType") == 3)
  {
    objc_msgSend(*a3, "keyPath");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps, "objectForKeyedSubscript:", v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "expressionForKeyPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *a3;
      *a3 = v10;

    }
    else
    {
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("type")) & 1) != 0
        || objc_msgSend(v23, "isEqualToString:", CFSTR("eventType")))
      {
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *a3;
        *a3 = v12;

        -[_OSLogPredicateMapper mapEventTypeExpression:](self, "mapEventTypeExpression:", *a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v23, "isEqualToString:", CFSTR("signpostScope")))
      {
        -[_OSLogPredicateMapper mapSignpostScopeExpression:](self, "mapSignpostScopeExpression:", *a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v23, "isEqualToString:", CFSTR("signpostType")))
        {
          if ((objc_msgSend(v23, "isEqualToString:", CFSTR("messageType")) & 1) == 0
            && !objc_msgSend(v23, "isEqualToString:", CFSTR("logType")))
          {
            goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("logType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *a3;
          *a3 = v15;

          -[_OSLogPredicateMapper mapMessageTypeExpression:](self, "mapMessageTypeExpression:", *a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *a4;
          *a4 = v17;

          if (objc_msgSend(*a4, "expressionType"))
            goto LABEL_12;
          objc_msgSend(*a4, "constantValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_12;
          objc_msgSend(*a4, "constantValue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v9, "integerValue");
          if (v21 == 2)
          {
            v22 = 1;
          }
          else
          {
            if (v21 != 1)
              goto LABEL_11;
            v22 = 2;
          }
          self->_flags |= v22;
          goto LABEL_11;
        }
        -[_OSLogPredicateMapper mapSignpostTypeExpression:](self, "mapSignpostTypeExpression:", *a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = *a4;
      *a4 = v14;
    }
LABEL_11:

LABEL_12:
  }
}

- (void)visitPredicateExpression:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_pass == 1)
  {
    v5 = v4;
    -[_OSLogPredicateMapper validateExpression:](self, "validateExpression:", v4);

  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

- (void)validateExpression:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *validationErrors;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "expressionType");
  if (v4 > 0xE)
    goto LABEL_8;
  if (((1 << v4) & 0x4403) != 0)
    goto LABEL_10;
  if (v4 != 3)
  {
LABEL_8:
    validationErrors = self->_validationErrors;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid expression: %@"), v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](validationErrors, "addObject:", v14);
    goto LABEL_9;
  }
  objc_msgSend(v17, "operand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "expressionType");

  if (v6 == 1)
  {
    objc_msgSend(v17, "arguments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == 1)
    {
      -[_OSLogPredicateMapper validKeyPaths](self, "validKeyPaths");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if ((v11 & 1) == 0)
      {
        v12 = self->_validationErrors;
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("no such field: %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v12, "addObject:", v15);

LABEL_9:
      }
LABEL_10:

      return;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

- (NSMutableSet)validKeyPaths
{
  if (validKeyPaths_once != -1)
    dispatch_once(&validKeyPaths_once, &__block_literal_global_677);
  return (NSMutableSet *)(id)validKeyPaths__validKeyPaths;
}

- (void)processCompoundPredicate:(id)a3
{
  NSMutableArray *stack;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  stack = self->_stack;
  v5 = a3;
  v6 = -[NSMutableArray count](stack, "count");
  objc_msgSend(v5, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 - objc_msgSend(v7, "count");
  objc_msgSend(v5, "subpredicates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[NSMutableArray subarrayWithRange:](self->_stack, "subarrayWithRange:", v8, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_stack, "removeObjectsInRange:", v8, v10);
  v11 = objc_alloc(MEMORY[0x1E0CB3528]);
  v12 = objc_msgSend(v5, "compoundPredicateType");

  v13 = (void *)objc_msgSend(v11, "initWithType:subpredicates:", v12, v14);
  -[NSMutableArray addObject:](self->_stack, "addObject:", v13);

}

- (NSPredicate)mappedPredicate
{
  return self->_predicate;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (_OSLogPredicateMapper)initWithPredicate:(id)a3
{
  return -[_OSLogPredicateMapper initWithPredicate:andValidate:](self, "initWithPredicate:andValidate:", a3, 1);
}

- (_OSLogPredicateMapper)initWithPredicate:(id)a3 andValidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _OSLogPredicateMapper *v7;
  NSMutableArray *v8;
  NSMutableArray *stack;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *validationErrors;

  v4 = a4;
  v6 = a3;
  v7 = -[_OSLogPredicateMapper init](self, "init");
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stack = v7->_stack;
    v7->_stack = v8;

    v7->_pass = 0;
    objc_msgSend(v6, "acceptVisitor:flags:", v7, 0);
    -[NSMutableArray lastObject](v7->_stack, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    validationErrors = v7->_validationErrors;
    v7->_validationErrors = v11;

    if (v4)
    {
      v7->_pass = 1;
      objc_msgSend(v10, "acceptVisitor:flags:", v7, 1);
    }
    if (!-[NSMutableArray count](v7->_validationErrors, "count"))
      objc_storeStrong((id *)&v7->_predicate, v10);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_validationErrors, 0);
}

- (id)mapKeywordToConstantExpression:(id)a3 keywordMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "expressionType") != 3
    || (objc_msgSend(v5, "keyPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (!objc_msgSend(v5, "expressionType"))
    {
      objc_msgSend(v5, "constantValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "constantValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v9 = (void *)MEMORY[0x1E0CB35D0];
          objc_msgSend(v5, "constantValue");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    v16 = v5;
    goto LABEL_11;
  }
  v9 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(v5, "keyPath");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = (void *)v10;
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expressionForConstantValue:", v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v16;
}

- (id)mapEventTypeExpression:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = mapEventTypeExpression__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&mapEventTypeExpression__once, &__block_literal_global_125);
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:](self, "mapKeywordToConstantExpression:keywordMap:", v5, mapEventTypeExpression__eventTypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapMessageTypeExpression:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = mapMessageTypeExpression__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&mapMessageTypeExpression__once, &__block_literal_global_153);
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:](self, "mapKeywordToConstantExpression:keywordMap:", v5, mapMessageTypeExpression__messageTypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapSignpostScopeExpression:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = mapSignpostScopeExpression__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&mapSignpostScopeExpression__once, &__block_literal_global_174);
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:](self, "mapKeywordToConstantExpression:keywordMap:", v5, mapSignpostScopeExpression__scopes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapSignpostTypeExpression:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = mapSignpostTypeExpression__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&mapSignpostTypeExpression__once, &__block_literal_global_187);
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:](self, "mapKeywordToConstantExpression:keywordMap:", v5, mapSignpostTypeExpression__types);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)visitPredicateOperator:(id)a3
{
  id v3;

  v3 = a3;
  _os_crash();
  __break(1u);
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (NSArray)validationErrors
{
  return &self->_validationErrors->super;
}

@end
