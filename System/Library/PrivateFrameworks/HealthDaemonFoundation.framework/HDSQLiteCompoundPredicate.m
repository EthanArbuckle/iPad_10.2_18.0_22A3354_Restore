@implementation HDSQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _BYTE *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count") != 1)
  {
    v5 = objc_alloc_init((Class)objc_opt_class());
    v5[8] = 0;
    v5[9] = 1;
    v6 = (void *)*((_QWORD *)v5 + 2);
    v17 = v5;
    *((_QWORD *)v5 + 2) = CFSTR(" AND ");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v3;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v9)
      goto LABEL_15;
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if (objc_msgSend(*((id *)v14 + 2), "isEqualToString:", CFSTR(" AND ")))
          {
            objc_msgSend(v7, "addObjectsFromArray:", *((_QWORD *)v14 + 3));

            goto LABEL_13;
          }

        }
        objc_msgSend(v7, "addObject:", v13, v17);
LABEL_13:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v10)
      {
LABEL_15:

        v4 = v17;
        v15 = (void *)*((_QWORD *)v17 + 3);
        *((_QWORD *)v17 + 3) = v7;

        v3 = v18;
        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _BYTE *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count") != 1)
  {
    v5 = objc_alloc_init((Class)objc_opt_class());
    v5[8] = 0;
    v5[9] = 0;
    v6 = (void *)*((_QWORD *)v5 + 2);
    v17 = v5;
    *((_QWORD *)v5 + 2) = CFSTR(" OR ");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v3;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (!v9)
      goto LABEL_15;
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if (objc_msgSend(*((id *)v14 + 2), "isEqualToString:", CFSTR(" OR ")))
          {
            objc_msgSend(v7, "addObjectsFromArray:", *((_QWORD *)v14 + 3));

            goto LABEL_13;
          }

        }
        objc_msgSend(v7, "addObject:", v13, v17);
LABEL_13:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v10)
      {
LABEL_15:

        v4 = v17;
        v15 = (void *)*((_QWORD *)v17 + 3);
        *((_QWORD *)v17 + 3) = v7;

        v3 = v18;
        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v4;
}

+ (id)negatedPredicate:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init((Class)objc_opt_class());
    v4[8] = 1;
    v5 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = CFSTR("NOT ");

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, 0);
    v7 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v6;

  }
  else
  {
    v4 = 0;
  }
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
        +[HDSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](HDSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), a5, (_QWORD)v19);
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

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:values:comparisonType:", a3, a4, 1);
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  void *v4;
  void *v5;

  +[HDSQLiteCompoundPredicate predicateWithProperty:equalToValues:](HDSQLiteCompoundPredicate, "predicateWithProperty:equalToValues:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteCompoundPredicate negatedPredicate:](HDSQLiteCompoundPredicate, "negatedPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_predicates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "bindToStatement:bindingIndex:", a3, a4, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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
  v8.super_class = (Class)HDSQLiteCompoundPredicate;
  v3 = -[HDSQLitePredicate hash](&v8, sel_hash);
  v4 = -[NSString hash](self->_combinationOperation, "hash");
  -[HDSQLiteCompoundPredicate predicates](self, "predicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v3 + objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *combinationOperation;
  NSString *v6;
  NSArray *predicates;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSQLiteCompoundPredicate;
  if (-[HDSQLitePredicate isEqual:](&v14, sel_isEqual_, v4)
    && ((combinationOperation = self->_combinationOperation, v6 = (NSString *)v4[2], combinationOperation == v6)
     || v6 && -[NSString isEqual:](combinationOperation, "isEqual:")))
  {
    predicates = self->_predicates;
    objc_msgSend(v4, "predicates");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (predicates == v8)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v4, "predicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = self->_predicates;
        objc_msgSend(v4, "predicates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSArray isEqual:](v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_predicates, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_unary)
    {
      objc_msgSend(v5, "appendString:", self->_combinationOperation);
      -[NSArray objectAtIndex:](self->_predicates, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "SQLForEntityClass:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v8);

    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = self->_predicates;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "SQLForEntityClass:", a3, (_QWORD)v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              if ((unint64_t)objc_msgSend(v6, "length") >= 2)
                objc_msgSend(v6, "appendString:", self->_combinationOperation);
              objc_msgSend(v6, "appendString:", v16);
            }

          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v6, "appendString:", CFSTR(")"), (_QWORD)v17);
    return v6;
  }
  else
  {
    if (self->_trueIfNoPredicates)
      v9 = CFSTR("1");
    else
      v9 = CFSTR("0");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
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

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v4;
  id *v5;
  NSUInteger v6;
  uint64_t v7;
  NSString *combinationOperation;
  NSString *v9;
  BOOL v10;
  unint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteCompoundPredicate;
  if (-[HDSQLitePredicate isCompatibleWithPredicate:](&v16, sel_isCompatibleWithPredicate_, v4))
  {
    v5 = (id *)v4;
    v6 = -[NSArray count](self->_predicates, "count");
    v7 = objc_msgSend(v5[3], "count");
    combinationOperation = self->_combinationOperation;
    v9 = (NSString *)v5[2];
    if (combinationOperation == v9 || v9 && -[NSString isEqual:](combinationOperation, "isEqual:"))
    {
      LOBYTE(v7) = v6 == v7;
      if ((_BYTE)v7)
        v10 = v6 == 0;
      else
        v10 = 1;
      if (!v10)
      {
        v11 = 1;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_predicates, "objectAtIndexedSubscript:", v11 - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5[3], "objectAtIndexedSubscript:", v11 - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v7) = objc_msgSend(v12, "isCompatibleWithPredicate:", v13);

          if ((_DWORD)v7)
            v14 = v11 >= v6;
          else
            v14 = 1;
          ++v11;
        }
        while (!v14);
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *combinationOperation;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_predicates, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_predicates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  combinationOperation = self->_combinationOperation;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",\n\t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("{%@:\n\t%@\n}"), combinationOperation, v12, (_QWORD)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
