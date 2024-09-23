@implementation ASUSQLiteQueryDescriptor

- (ASUSQLiteQueryDescriptor)initWithEntityClass:(Class)a3 memoryEntityClass:(Class)a4
{
  ASUSQLiteQueryDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASUSQLiteQueryDescriptor;
  result = -[ASUSQLiteQueryDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_entityClass = a3;
    result->_memoryEntityClass = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = self->_entityClass;
  *(_QWORD *)(v5 + 16) = self->_limitCount;
  *(_QWORD *)(v5 + 24) = self->_memoryEntityClass;
  v6 = -[NSString copyWithZone:](self->_orderingClause, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSArray copyWithZone:](self->_orderingDirections, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSArray copyWithZone:](self->_orderingProperties, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[ASUSQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  *(_BYTE *)(v5 + 64) = self->_returnsDistinctEntities;
  return (id)v5;
}

- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  Class entityClass;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT "));
  v9 = v8;
  if (self->_returnsDistinctEntities)
    objc_msgSend(v8, "appendString:", CFSTR("DISTINCT "));
  v37 = v7;
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" FROM %@"), v11);

  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[ASUSQLitePredicate SQLJoinClausesForEntityClass:](self->_predicate, "SQLJoinClausesForEntityClass:", self->_entityClass);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "unionSet:", v13);
  v36 = (void *)v13;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        -[objc_class joinClauseForProperty:](self->_entityClass, "joinClauseForProperty:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v12, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v16);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = v12;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v9, "appendString:", CFSTR(" "));
        objc_msgSend(v9, "appendString:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v22);
  }

  -[ASUSQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v9, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v9, "appendString:", v26);
  }
  v27 = -[NSArray count](self->_orderingProperties, "count");
  if (self->_orderingClause)
  {
    objc_msgSend(v9, "appendString:", CFSTR(" ORDER BY "));
    objc_msgSend(v9, "appendString:", self->_orderingClause);
  }
  else
  {
    v28 = v27;
    if (v27 >= 1)
    {
      v29 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      v30 = 0;
      do
      {
        entityClass = self->_entityClass;
        -[NSArray objectAtIndex:](self->_orderingProperties, "objectAtIndex:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "length"))
          objc_msgSend(v29, "appendString:", CFSTR(", "));
        objc_msgSend(v29, "appendString:", v33);
        objc_msgSend(v29, "appendString:", CFSTR(" "));
        if (v30 >= -[NSArray count](self->_orderingDirections, "count"))
        {
          objc_msgSend(v29, "appendString:", CFSTR("ASC"));
        }
        else
        {
          -[NSArray objectAtIndex:](self->_orderingDirections, "objectAtIndex:", v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "appendString:", v34);

        }
        ++v30;
      }
      while (v28 != v30);
      objc_msgSend(v9, "appendString:", CFSTR(" ORDER BY "));
      objc_msgSend(v9, "appendString:", v29);

    }
  }
  if (self->_limitCount)
    objc_msgSend(v9, "appendString:", CFSTR(" LIMIT ?"));

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (Class)memoryEntityClass
{
  return self->_memoryEntityClass;
}

- (void)setMemoryEntityClass:(Class)a3
{
  self->_memoryEntityClass = a3;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (NSString)orderingClause
{
  return self->_orderingClause;
}

- (void)setOrderingClause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)orderingDirections
{
  return self->_orderingDirections;
}

- (void)setOrderingDirections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (void)setOrderingProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (ASUSQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);
  objc_storeStrong((id *)&self->_orderingDirections, 0);
  objc_storeStrong((id *)&self->_orderingClause, 0);
}

@end
