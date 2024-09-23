@implementation ASUSQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = CFSTR(" AND ");

  v6 = objc_msgSend(v3, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = CFSTR(" OR ");

  v6 = objc_msgSend(v3, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        +[ASUSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](ASUSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), a5, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(a1, "predicateMatchingAnyPredicates:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_predicates;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "applyBinding:atIndex:", v6, a4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASUSQLiteCompoundPredicate;
  v3 = -[ASUSQLitePredicate hash](&v8, sel_hash);
  v4 = -[NSString hash](self->_combinationOperation, "hash");
  -[ASUSQLiteCompoundPredicate predicates](self, "predicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v3 + objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *combinationOperation;
  NSArray *predicates;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASUSQLiteCompoundPredicate;
  if (-[ASUSQLitePredicate isEqual:](&v12, sel_isEqual_, v4)
    && ((combinationOperation = self->_combinationOperation, combinationOperation == (NSString *)v4[1])
     || -[NSString isEqual:](combinationOperation, "isEqual:")))
  {
    predicates = self->_predicates;
    objc_msgSend(v4, "predicates");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (predicates == v7)
    {
      v10 = 1;
    }
    else
    {
      v8 = self->_predicates;
      objc_msgSend(v4, "predicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSArray isEqual:](v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_predicates, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_predicates;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "SQLForEntityClass:", a3, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if ((unint64_t)objc_msgSend(v5, "length") >= 2)
              objc_msgSend(v5, "appendString:", self->_combinationOperation);
            objc_msgSend(v5, "appendString:", v11);
          }

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "appendString:", CFSTR(")"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("1"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_predicates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "SQLJoinClausesForEntityClass:", a3, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "unionSet:", v10);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_combinationOperation, 0);
}

@end
