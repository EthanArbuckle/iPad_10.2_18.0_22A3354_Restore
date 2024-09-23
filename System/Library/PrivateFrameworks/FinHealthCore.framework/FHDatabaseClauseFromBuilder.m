@implementation FHDatabaseClauseFromBuilder

+ (id)initWithBuilder:(id)a3
{
  return (id)objc_msgSend(a1, "initWithBuilder:logicalOperator:", a3, CFSTR("AND"));
}

+ (id)initWithBuilder:(id)a3 logicalOperator:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = (void *)objc_opt_new();
  v6[2](v6, v7);

  v8 = -[FHDatabaseClauseFromBuilder _init:logicalOperator:]([FHDatabaseClauseFromBuilder alloc], "_init:logicalOperator:", v7, v5);
  return v8;
}

- (id)_init:(id)a3 logicalOperator:(id)a4
{
  id v6;
  id v7;
  FHDatabaseClauseFromBuilder *v8;
  uint64_t v9;
  NSArray *clauseList;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  NSArray *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FHDatabaseClauseFromBuilder;
  v8 = -[FHDatabaseClauseFromBuilder init](&v16, sel_init);
  if (v8)
  {
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    clauseList = v8->_clauseList;
    v8->_clauseList = (NSArray *)v9;

    v11 = v8->_clauseList;
    objc_msgSend(v6, "clauseStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray arrayByAddingObjectsFromArray:](v11, "arrayByAddingObjectsFromArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v8->_clauseList;
    v8->_clauseList = (NSArray *)v13;

  }
  return v8;
}

- (id)expressionFromClausesAndOperators
{
  void *v2;
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  -[FHDatabaseClauseFromBuilder clausesAndOperatorsInOrder](self, "clausesAndOperatorsInOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "shortDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v7);
        v8 = v4;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@ "), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3 || !objc_msgSend(v3, "count"))
          goto LABEL_9;
        v9 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "componentsJoinedByString:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "removeAllObjects");
        objc_msgSend(v15, "addObject:", v7);
      }

LABEL_9:
      ++v5;
      v4 = v8;
      if (v5 >= objc_msgSend(v2, "count"))
        goto LABEL_12;
    }
  }
  v8 = 0;
LABEL_12:
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "componentsJoinedByString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@)"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)clausesAndOperatorsInOrder
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[FHDatabaseClauseFromBuilder _extractDeepLinkedClauses:clausesAndOperatorsInReversOrder:](self, "_extractDeepLinkedClauses:clausesAndOperatorsInReversOrder:", self->_clauseList, v3);
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_extractDeepLinkedClauses:(id)a3 clausesAndOperatorsInReversOrder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "clauseList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHDatabaseClauseFromBuilder _extractDeepLinkedClauses:clausesAndOperatorsInReversOrder:](self, "_extractDeepLinkedClauses:clausesAndOperatorsInReversOrder:", v13, v7);

        }
        else
        {
          objc_msgSend(v7, "addObject:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("clauseList: '%@'; "), self->_clauseList);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)clauseList
{
  return self->_clauseList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clauseList, 0);
}

@end
