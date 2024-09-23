@implementation _DKBiomePredicateScanner

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableSet count](self->_matchedKeys, "count");
  v5 = v4 == -[NSSet count](self->_searchKeys, "count");
  v6 = v10;
  if (!v5)
  {
    v5 = objc_msgSend(v10, "expressionType") == 3;
    v6 = v10;
    if (v5 || (v5 = objc_msgSend(v10, "expressionType") == 10, v6 = v10, v5))
    {
      objc_msgSend(v6, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "intersectSet:", self->_searchKeys);
        -[NSMutableSet unionSet:](self->_matchedKeys, "unionSet:", v9);

      }
      v6 = v10;
    }
  }

}

+ (id)searchForKeys:(id)a3 inPredicate:(id)a4
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    v7 = -[_DKBiomePredicateScanner _initWithSearchKeys:]([_DKBiomePredicateScanner alloc], "_initWithSearchKeys:", v6);

    objc_msgSend(v5, "acceptVisitor:flags:", v7, 1);
    if (objc_msgSend(v7[2], "count"))
      v8 = v7[2];
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_initWithSearchKeys:(id)a3
{
  id v4;
  _DKBiomePredicateScanner *v5;
  uint64_t v6;
  NSSet *searchKeys;
  uint64_t v8;
  NSMutableSet *matchedKeys;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKBiomePredicateScanner;
  v5 = -[_DKBiomePredicateScanner init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    searchKeys = v5->_searchKeys;
    v5->_searchKeys = (NSSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    matchedKeys = v5->_matchedKeys;
    v5->_matchedKeys = (NSMutableSet *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedKeys, 0);
  objc_storeStrong((id *)&self->_searchKeys, 0);
}

@end
