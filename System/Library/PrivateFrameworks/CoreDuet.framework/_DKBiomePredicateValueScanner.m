@implementation _DKBiomePredicateValueScanner

- (void)visitPredicateExpression:(id)a3
{
  void *v4;
  unint64_t state;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *matchedValues;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)MEMORY[0x193FEE914]();
  state = self->_state;
  if (state != 3)
  {
    if (state == 2 && (objc_msgSend(v12, "expressionType") == 3 || objc_msgSend(v12, "expressionType") == 10))
    {
      objc_msgSend(v12, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "intersectSet:", self->_searchKeys);
        if (objc_msgSend(v8, "count"))
          self->_state = 3;

      }
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!objc_msgSend(v12, "expressionType"))
  {
    objc_msgSend(v12, "constantValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMutableSet addObject:](self->_matchedValues, "addObject:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      -[NSMutableSet addObjectsFromArray:](self->_matchedValues, "addObjectsFromArray:", v9);
    }
    self->_state = 1;
    goto LABEL_15;
  }
LABEL_16:
  if (objc_msgSend(v12, "expressionType") == 14)
  {
    objc_msgSend(v12, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      matchedValues = self->_matchedValues;
      objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](matchedValues, "addObjectsFromArray:", v11);

      self->_state = 1;
    }
    goto LABEL_19;
  }
LABEL_20:
  objc_autoreleasePoolPop(v4);

}

+ (id)searchForValuesForKey:(id)a3 inPredicate:(id)a4
{
  id v5;
  id v6;
  _DKBiomePredicateValueScanner *v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [_DKBiomePredicateValueScanner alloc];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_DKBiomePredicateValueScanner _initWithSearchKeys:](v7, "_initWithSearchKeys:", v8);

  objc_msgSend(v5, "acceptVisitor:flags:", v9, 15);
  v10 = (id)objc_msgSend(v9[2], "count");
  if (v10)
    v10 = v9[2];
  v11 = v10;

  return v11;
}

- (id)_initWithSearchKeys:(id)a3
{
  id v4;
  _DKBiomePredicateValueScanner *v5;
  uint64_t v6;
  NSSet *searchKeys;
  uint64_t v8;
  NSMutableSet *matchedValues;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKBiomePredicateValueScanner;
  v5 = -[_DKBiomePredicateValueScanner init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    searchKeys = v5->_searchKeys;
    v5->_searchKeys = (NSSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    matchedValues = v5->_matchedValues;
    v5->_matchedValues = (NSMutableSet *)v8;

    v5->_state = 1;
  }

  return v5;
}

- (void)visitPredicateOperator:(id)a3
{
  id v4;
  unint64_t state;
  BOOL v6;
  id v7;

  v4 = a3;
  state = self->_state;
  if (state - 2 >= 2)
  {
    if (state != 1)
      goto LABEL_8;
  }
  else
  {
    self->_state = 1;
  }
  v7 = v4;
  v6 = objc_msgSend(v4, "operatorType") == 4;
  v4 = v7;
  if (v6 || (v6 = objc_msgSend(v7, "operatorType") == 10, v4 = v7, v6))
    self->_state = 2;
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedValues, 0);
  objc_storeStrong((id *)&self->_searchKeys, 0);
}

@end
