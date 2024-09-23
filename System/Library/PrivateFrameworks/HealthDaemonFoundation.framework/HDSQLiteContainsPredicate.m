@implementation HDSQLiteContainsPredicate

- (HDSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 contains:(BOOL)a5
{
  id v8;
  id v9;
  HDSQLiteContainsPredicate *v10;
  uint64_t v11;
  NSString *property;
  uint64_t v13;
  NSArray *values;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteContainsPredicate;
  v10 = -[HDSQLiteContainsPredicate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    property = v10->super._property;
    v10->super._property = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    values = v10->_values;
    v10->_values = (NSArray *)v13;

    v10->_contains = a5;
  }

  return v10;
}

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  return +[HDSQLiteContainsPredicate _containsPredicateWithProperty:values:contains:]((uint64_t)a1, a3, a4, 1);
}

+ (HDSQLiteContainsPredicate)_containsPredicateWithProperty:(void *)a3 values:(uint64_t)a4 contains:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  HDSQLiteContainsPredicate *v12;

  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  +[HDSQLiteContainsPredicate _arrayFromValues:](v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1)
  {
    if ((_DWORD)a4)
      v10 = 1;
    else
      v10 = 2;
    objc_msgSend(v9, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    +[HDSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](HDSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v7, v11, v10);
    v12 = (HDSQLiteContainsPredicate *)objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  else
  {
    v12 = -[HDSQLiteContainsPredicate initWithProperty:values:contains:]([HDSQLiteContainsPredicate alloc], "initWithProperty:values:contains:", v7, v9, a4);
  }

  return v12;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  return +[HDSQLiteContainsPredicate _containsPredicateWithProperty:values:contains:]((uint64_t)a1, a3, a4, 0);
}

+ (id)_arrayFromValues:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
LABEL_5:
    v4 = v3;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "allObjects");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

LABEL_14:
  return v4;
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
  v6 = self->_values;
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
        HDSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++*a4;
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteContainsPredicate;
  if (-[HDSQLitePropertyPredicate isEqual:](&v13, sel_isEqual_, v4)
    && (v5 = -[HDSQLiteContainsPredicate contains](self, "contains"), v5 == objc_msgSend(v4, "contains")))
  {
    -[HDSQLiteContainsPredicate values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "values");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HDSQLiteContainsPredicate values](self, "values");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "values");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLitePropertyPredicate property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  if (self->_contains)
    v8 = CFSTR(" IN (");
  else
    v8 = CFSTR(" NOT IN (");
  objc_msgSend(v5, "appendString:", v8);
  v9 = -[NSArray count](self->_values, "count");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v5, "appendString:", CFSTR("?"));
    v11 = v10 - 1;
    if (v10 != 1)
    {
      do
      {
        objc_msgSend(v5, "appendString:", CFSTR(", ?"));
        --v11;
      }
      while (v11);
    }
  }
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  return v5;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v4;
  id *v5;
  NSUInteger v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteContainsPredicate;
  if (-[HDSQLitePropertyPredicate isCompatibleWithPredicate:](&v9, sel_isCompatibleWithPredicate_, v4))
  {
    v5 = (id *)v4;
    if (self->_contains == *((unsigned __int8 *)v5 + 16))
    {
      v6 = -[NSArray count](self->_values, "count");
      v7 = v6 == objc_msgSend(v5[3], "count");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  -[NSArray hk_map:](self->_values, "hk_map:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLitePropertyPredicate property](self, "property");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_contains)
    v8 = "";
  else
    v8 = "NOT ";
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<\"%@\" %sIN (%@)>"), v6, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __40__HDSQLiteContainsPredicate_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (BOOL)contains
{
  return self->_contains;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
