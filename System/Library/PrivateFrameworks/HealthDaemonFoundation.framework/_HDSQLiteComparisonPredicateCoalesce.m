@implementation _HDSQLiteComparisonPredicateCoalesce

- (_HDSQLiteComparisonPredicateCoalesce)initWithProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8;
  _HDSQLiteComparisonPredicateCoalesce *v9;
  uint64_t v10;
  NSArray *properties;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  v9 = -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:](&v13, sel_initWithProperty_value_comparisonType_, 0, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    properties = v9->_properties;
    v9->_properties = (NSArray *)v10;

  }
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  v3 = -[HDSQLiteComparisonPredicate hash](&v7, sel_hash);
  -[_HDSQLiteComparisonPredicateCoalesce properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *properties;
  NSArray *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  if (!-[HDSQLiteComparisonPredicate isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_5;
  properties = self->_properties;
  v6 = (NSArray *)v4[5];
  if (properties == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSArray isEqual:](properties, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  NSArray *properties;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  properties = self->_properties;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58___HDSQLiteComparisonPredicateCoalesce_SQLForEntityClass___block_invoke;
  v11[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v11[4] = a3;
  -[NSArray hk_map:](properties, "hk_map:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(COALESCE(%@) %@ ?)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_properties, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_properties;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  _QWORD *v4;
  NSArray *properties;
  NSArray *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  if (!-[HDSQLiteComparisonPredicate isCompatibleWithPredicate:](&v9, sel_isCompatibleWithPredicate_, v4))
    goto LABEL_5;
  properties = self->_properties;
  v6 = (NSArray *)v4[5];
  if (properties == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSArray isEqual:](properties, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSArray componentsJoinedByString:](self->_properties, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLiteComparisonPredicate value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<\"(%@)\" %@ %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
