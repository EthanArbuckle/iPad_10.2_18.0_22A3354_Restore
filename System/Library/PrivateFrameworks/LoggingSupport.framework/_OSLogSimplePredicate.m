@implementation _OSLogSimplePredicate

- (void)visitPredicate:(id)a3
{
  NSMutableArray *stack;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_OSLogSimplePredicate processComparisonPredicate:](self, "processComparisonPredicate:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_OSLogSimplePredicate processCompoundPredicate:](self, "processCompoundPredicate:", v6);
    }
    else
    {
      stack = self->_stack;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](stack, "addObject:", v5);

    }
  }

}

- (void)processComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  NSSet *operators;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  operators = self->_operators;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "predicateOperatorType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(operators) = -[NSSet containsObject:](operators, "containsObject:", v7);

  if ((_DWORD)operators)
  {
    objc_msgSend(v4, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_OSLogSimplePredicate isSupportedExpression:](self, "isSupportedExpression:", v8)
      || -[_OSLogSimplePredicate isSupportedExpression:](self, "isSupportedExpression:", v9))
    {
      if (objc_msgSend(v4, "predicateOperatorType") == 5)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v8, v9, objc_msgSend(v4, "comparisonPredicateModifier"), 4, objc_msgSend(v4, "options"));
        v11 = objc_alloc(MEMORY[0x1E0CB3528]);
        v15[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithType:subpredicates:", 0, v12);

        v5 = (void *)v13;
      }
      else
      {
        v14 = v4;

        v5 = v14;
      }
    }

  }
  -[NSMutableArray addObject:](self->_stack, "addObject:", v5);

}

- (BOOL)isSupportedExpression:(id)a3
{
  id v4;
  NSSet *keys;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "expressionType") == 3)
  {
    keys = self->_keys;
    objc_msgSend(v4, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSSet containsObject:](keys, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)processCompoundPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "subpredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[NSMutableArray count](self->_stack, "count");
  v8 = v7 - v6;
  -[NSMutableArray subarrayWithRange:](self->_stack, "subarrayWithRange:", v7 - v6, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_stack, "removeObjectsInRange:", v8, v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "addObject:", v16, (_QWORD)v24);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v10, "count");
  if (!-[_OSLogSimplePredicate isSupportedCompoundType:](self, "isSupportedCompoundType:", objc_msgSend(v4, "compoundPredicateType")))
  {
LABEL_15:
    v19 = 0;
    goto LABEL_21;
  }
  v18 = objc_msgSend(v4, "compoundPredicateType");
  if (v18)
  {
    if (v18 != 2)
    {
      if (v18 == 1)
      {
        v19 = v17 != 0;
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    v20 = v17 == v6;
  }
  else
  {
    v20 = v17 == 1;
  }
  v19 = v20;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v17 == 1 && objc_msgSend(v4, "compoundPredicateType"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v4, "compoundPredicateType"), v10);
    }
    v23 = (void *)v22;

    v21 = v23;
  }
  -[NSMutableArray addObject:](self->_stack, "addObject:", v21);

}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_compoundTypes, 0);
  objc_storeStrong((id *)&self->_operators, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (_OSLogSimplePredicate)initWithPredicate:(id)a3 supportedKeys:(id)a4 supportedOperators:(id)a5 supportedCompoundTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _OSLogSimplePredicate *v14;
  _OSLogSimplePredicate *v15;
  NSMutableArray *v16;
  NSMutableArray *stack;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  NSPredicate *predicate;
  _OSLogSimplePredicate *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = -[_OSLogSimplePredicate init](self, "init");
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_keys, a4);
      objc_storeStrong((id *)&v15->_operators, a5);
      objc_storeStrong((id *)&v15->_compoundTypes, a6);
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      stack = v15->_stack;
      v15->_stack = v16;

      objc_msgSend(v10, "acceptVisitor:flags:", v15, 0);
      -[NSMutableArray objectAtIndexedSubscript:](v15->_stack, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v15->_stack, "objectAtIndexedSubscript:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
        predicate = v15->_predicate;
        v15->_predicate = (NSPredicate *)v20;

      }
    }
    self = v15;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)isSupportedCompoundType:(unint64_t)a3
{
  NSSet *compoundTypes;
  void *v4;

  compoundTypes = self->_compoundTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(compoundTypes) = -[NSSet containsObject:](compoundTypes, "containsObject:", v4);

  return (char)compoundTypes;
}

@end
