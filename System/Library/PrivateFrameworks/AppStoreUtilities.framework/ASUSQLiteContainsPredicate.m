@implementation ASUSQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[1];
  v7[1] = v8;

  *((_BYTE *)v7 + 16) = 0;
  v10 = objc_msgSend(v5, "copy");

  v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = objc_msgSend(v9, "copy");

  v12 = (void *)v10[1];
  v10[1] = v11;

  *((_BYTE *)v10 + 16) = 0;
  v13 = (void *)v10[3];
  v10[3] = v7;
  v14 = v7;

  v15 = objc_msgSend(v8, "copy");
  v16 = (void *)v10[4];
  v10[4] = v15;

  return v10;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend(v6, "copy");

  v9 = (void *)v7[1];
  v7[1] = v8;

  *((_BYTE *)v7 + 16) = 1;
  v10 = objc_msgSend(v5, "copy");

  v11 = (void *)v7[5];
  v7[5] = v10;

  return v7;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6;
  ASUSQLiteQuery *query;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  query = self->_query;
  if (query)
  {
    -[ASUSQLiteQuery applyBinding:atIndex:](query, "applyBinding:atIndex:", v6, a4);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_values;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          ASUSQLiteBindFoundationValue(v6, *a4, *(void **)(*((_QWORD *)&v13 + 1) + 8 * i));
          ++*a4;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASUSQLiteContainsPredicate;
  if (-[ASUSQLitePropertyPredicate isEqual:](&v17, sel_isEqual_, v6))
  {
    v7 = -[ASUSQLiteContainsPredicate isNegative](self, "isNegative");
    if (v7 == objc_msgSend(v6, "isNegative"))
    {
      -[ASUSQLiteContainsPredicate values](self, "values");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10
        || (-[ASUSQLiteContainsPredicate values](self, "values"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "values"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        -[ASUSQLiteContainsPredicate query](self, "query");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "query");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 == (void *)v12)
        {

          v8 = 1;
        }
        else
        {
          v13 = (void *)v12;
          -[ASUSQLiteContainsPredicate query](self, "query");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "query");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v14, "isEqual:", v15);

        }
        if (v9 == v10)
          goto LABEL_12;
      }
      else
      {
        v8 = 0;
      }

LABEL_12:
      goto LABEL_13;
    }
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  ASUSQLiteQuery *query;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[ASUSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_negative)
    v9 = CFSTR(" NOT IN (");
  else
    v9 = CFSTR(" IN (");
  objc_msgSend(v7, "appendString:", v9);
  query = self->_query;
  if (query)
  {
    v17[0] = self->_queryProperty;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ASUSQLiteQuery copySelectSQLWithProperties:](query, "copySelectSQLWithProperties:", v11);

    if (v12)
      objc_msgSend(v8, "appendString:", v12);

  }
  else
  {
    v14 = objc_msgSend(self->_values, "count");
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v8, "appendString:", CFSTR("?"));
      v16 = v15 - 1;
      if (v15 != 1)
      {
        do
        {
          objc_msgSend(v8, "appendString:", CFSTR(", ?"));
          --v16;
        }
        while (v16);
      }
    }
  }
  objc_msgSend(v8, "appendString:", CFSTR(")"));

  return v8;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (ASUSQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (NSArray)values
{
  return (NSArray *)self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_values, 0);
  objc_storeStrong((id *)&self->_queryProperty, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
