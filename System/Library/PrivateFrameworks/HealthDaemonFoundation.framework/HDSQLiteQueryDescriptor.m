@implementation HDSQLiteQueryDescriptor

- (id)selectSQLForProperties:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[HDSQLiteQueryDescriptor _SQLForSelectWithProperties:columns:](self, "_SQLForSelectWithProperties:columns:", v7, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)bindToSelectStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  NSString *groupBy;
  int64_t limitCount;
  void *v10;

  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_predicate, "bindToStatement:bindingIndex:");
  groupBy = self->_groupBy;
  if (groupBy)
    sqlite3_bind_text(a3, *a4, -[NSString UTF8String](groupBy, "UTF8String"), -[NSString length](self->_groupBy, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  limitCount = self->_limitCount;
  if (limitCount >= 0x80000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteQuery.mm"), 151, CFSTR("bindToSelectStatement called with limit count %ld, greater than maximum allowed limit count (%d)"), self->_limitCount, 0x7FFFFFFFLL);

    limitCount = self->_limitCount;
    if (!limitCount)
      return;
  }
  else if (!limitCount)
  {
    return;
  }
  sqlite3_bind_int(a3, *a4, limitCount);
  ++*a4;
}

- (void)bindToDeleteStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  int64_t limitCount;
  void *v9;

  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_predicate, "bindToStatement:bindingIndex:");
  limitCount = self->_limitCount;
  if (limitCount >= 0x80000000)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSQLiteQuery.mm"), 161, CFSTR("bindToDeleteStatement called with limit count %ld, greater than maximum allowed limit count (%d)"), self->_limitCount, 0x7FFFFFFFLL);

    limitCount = self->_limitCount;
    if (!limitCount)
      return;
  }
  else if (!limitCount)
  {
    return;
  }
  sqlite3_bind_int(a3, *a4, limitCount);
  ++*a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 16) = self->_entityClass;
  *(_QWORD *)(v5 + 24) = self->_limitCount;
  v6 = -[NSArray copy](self->_orderingTerms, "copy");
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[HDSQLitePredicate copyWithZone:](self->_predicate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_BYTE *)(v5 + 8) = self->_returnsDistinctEntities;
  v10 = -[NSString copy](self->_groupBy, "copy");
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSArray copy](self->_preferredEntityJoinOrder, "copy");
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  *(_BYTE *)(v5 + 9) = self->_shouldExpandLastSQLStatement;
  return (id)v5;
}

- (id)_sortedJoinClauses:(id)a3 preferredOrder:(id)a4 baseTables:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v27 = a4;
  v25 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v25);
  v30 = (void *)objc_msgSend(v26, "mutableCopy");
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v27)
  {
    -[HDSQLiteQueryDescriptor _joinClauseComparatorWithPreferredEntityOrder:](self, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  while (objc_msgSend(v30, "count", v25))
  {
    objc_msgSend(v9, "removeAllObjects");
    objc_msgSend(v10, "removeAllObjects");
    objc_msgSend(v30, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v17, "localTable");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v8, "containsObject:", v18);

          if ((v19 & 1) != 0)
          {
            objc_msgSend(v9, "addObject:", v17);
            objc_msgSend(v17, "joinAsName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v8, "containsObject:", v20);

            if ((v21 & 1) == 0)
            {
              objc_msgSend(v17, "joinAsName");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v22);

              objc_msgSend(v10, "addObject:", v17);
            }
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    if (!objc_msgSend(v9, "count"))
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x24BDD2FD8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FD8], OS_LOG_TYPE_ERROR))
        -[HDSQLiteQueryDescriptor _sortedJoinClauses:preferredOrder:baseTables:].cold.1((uint64_t)v30, (uint64_t)v8, v23);

      break;
    }
    if (v29)
      objc_msgSend(v10, "sortUsingComparator:", v29);
    objc_msgSend(v28, "addObjectsFromArray:", v10);
    objc_msgSend(v30, "minusSet:", v9);

  }
  return v28;
}

- (id)_joinClauseComparatorWithPreferredEntityOrder:(void *)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10 + v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v7 = v10 + v9;
      }
      while (v6);
      v6 = v10 + v9;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__HDSQLiteQueryDescriptor__joinClauseComparatorWithPreferredEntityOrder___block_invoke;
    v17[3] = &unk_24CB18F20;
    v18 = v4;
    v19 = v13;
    v14 = v13;
    v15 = v4;
    a1 = (void *)MEMORY[0x212BD3780](v17);

  }
  return a1;
}

uint64_t __72__HDSQLiteQueryDescriptor__sortedJoinClauses_preferredOrder_baseTables___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "joinType");
  if (v6 >= objc_msgSend(v5, "joinType"))
  {
    v8 = objc_msgSend(v4, "joinType");
    v7 = v8 > objc_msgSend(v5, "joinType");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __73__HDSQLiteQueryDescriptor__joinClauseComparatorWithPreferredEntityOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(v5, "targetEntityClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v8 = *(void **)(a1 + 40);
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(v6, "targetEntityClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v11 = *(void **)(a1 + 40);
  v12 = v11;

  v13 = objc_msgSend(v9, "compare:", v12);
  return v13;
}

- (id)_SQLForSelectWithProperties:(id)a3 columns:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("SELECT "));
  v10 = v6;
  v11 = v5;
  HKWithAutoreleasePool();
  v7 = v9;

  return v7;
}

uint64_t __63__HDSQLiteQueryDescriptor__SQLForSelectWithProperties_columns___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("DISTINCT "));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_joinClauseForProperties:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" FROM %@"), v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "SQLForEntityClass:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR(" WHERE %@"), v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 48);
  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" GROUP BY %@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    v7 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v7 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" ORDER BY "));
    objc_msgSend(*(id *)(a1 + 40), "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &__block_literal_global_259);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(" LIMIT ?"));

  return 1;
}

id __63__HDSQLiteQueryDescriptor__SQLForSelectWithProperties_columns___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "SQL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_joinClauseForProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend((id)-[objc_class entityClassForEnumeration](self->_entityClass, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[HDSQLitePredicate SQLJoinClausesForEntityClass:](self->_predicate, "SQLJoinClausesForEntityClass:", self->_entityClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "unionSet:", v5);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v24;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        -[objc_class joinClausesForProperty:](self->_entityClass, "joinClausesForProperty:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      objc_msgSend(v4, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v18, "SQLJoinClause");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ %@"), v25, v20);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v25, 0);
      -[HDSQLiteQueryDescriptor _sortedJoinClauses:preferredOrder:baseTables:](self, "_sortedJoinClauses:preferredOrder:baseTables:", v4, self->_preferredEntityJoinOrder);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v25, "mutableCopy");
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = v23;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v27;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
            objc_msgSend(v11, "appendString:", CFSTR(" "));
            objc_msgSend(v16, "SQLJoinClause");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendString:", v17);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v13);
      }

    }
  }
  else
  {
    v11 = v25;
  }

  return v11;
}

- (id)_SQLForDeleteWithError:(id *)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = (_QWORD *)MEMORY[0x24BDBCAB8];
  if (self->_returnsDistinctEntities)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The DELETE statement does not support the DISTINCT keyword"));
  if (self->_groupBy)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v5, CFSTR("The DELETE statement does not support the GROUP BY keyword"));
  -[objc_class disambiguatedDatabaseTable](self->_entityClass, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("DELETE FROM %@"), v6);
  -[HDSQLitePredicate SQLJoinClausesForEntityClass:](self->_predicate, "SQLJoinClausesForEntityClass:", self->_entityClass);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[HDSQLiteQueryDescriptor _joinClauseForProperties:](self, "_joinClauseForProperties:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 100, CFSTR("SQL could not be created due to non-expected nil join clause"));
      v13 = 0;
      goto LABEL_16;
    }
    -[HDSQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[objc_class disambiguatedSQLForProperty:](self->_entityClass, "disambiguatedSQLForProperty:", CFSTR("ROWID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(" WHERE %@ IN (SELECT %@ FROM %@ WHERE %@)"), v11, v11, v9, v10);

    }
  }
  else
  {
    -[HDSQLitePredicate SQLForEntityClass:](self->_predicate, "SQLForEntityClass:", self->_entityClass);
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12;
    if (v12)
      objc_msgSend(v7, "appendFormat:", CFSTR(" WHERE %@"), v12);
  }

  if (self->_limitCount)
    objc_msgSend(v7, "appendFormat:", CFSTR(" LIMIT ?"));
  v13 = v7;
LABEL_16:

  return v13;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (NSArray)orderingTerms
{
  return self->_orderingTerms;
}

- (void)setOrderingTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (HDSQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)groupBy
{
  return self->_groupBy;
}

- (void)setGroupBy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)preferredEntityJoinOrder
{
  return self->_preferredEntityJoinOrder;
}

- (void)setPreferredEntityJoinOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldExpandLastSQLStatement
{
  return self->_shouldExpandLastSQLStatement;
}

- (void)setShouldExpandLastSQLStatement:(BOOL)a3
{
  self->_shouldExpandLastSQLStatement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredEntityJoinOrder, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_orderingTerms, 0);
}

- (void)_sortedJoinClauses:(uint64_t)a1 preferredOrder:(uint64_t)a2 baseTables:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "No clauses in %@ can be joined after tables %@", (uint8_t *)&v3, 0x16u);
}

@end
