@implementation HDDataExternalSyncIdentifierEntityPredicate

+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  v9 = v7;
  v10 = v6;
  v11 = objc_opt_self();
  +[HDDataExternalSyncIdentifierEntityPredicate _propertyForKey:](v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[HDDataExternalSyncIdentifierEntityPredicate _valueClassForKey:](v11, v9);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v14, "count"))
      objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", v12, v14);
    else
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v20 = objc_claimAutoreleasedReturnValue();
  }

  v21 = (void *)v8[1];
  v8[1] = v20;

  *((_BYTE *)v8 + 16) = 0;
  return v8;
}

+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  char v19;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  v11 = v9;
  v12 = v8;
  v13 = objc_opt_self();
  +[HDDataExternalSyncIdentifierEntityPredicate _propertyForKey:](v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v12 || a5 != 5)
    {
      +[HDDataExternalSyncIdentifierEntityPredicate _valueClassForKey:](v13, v11);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", v14, v12, HDSQLiteComparisonTypeForPredicateOperator());
      else
        objc_msgSend(MEMORY[0x1E0D29890], "BOOLeanPredicateWithValue:", a5 == 5);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D29880], "isNotNullPredicateWithProperty:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = (void *)v10[1];
  v10[1] = v16;

  if (v12)
    v18 = a5 == 5;
  else
    v18 = 0;
  v19 = v18;
  *((_BYTE *)v10 + 16) = v19;
  return v10;
}

+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  _QWORD *v5;
  void *v6;

  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = 0;

  *((_BYTE *)v5 + 16) = !a4;
  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataExternalSyncIdentifierEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration");
  objc_msgSend(v6, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDDataExternalSyncIdentifierEntity, "disambiguatedSQLForProperty:", CFSTR("object_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLitePredicate SQLForEntityClass:](self->_valuePredicate, "SQLForEntityClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!self->_valuePredicate)
    goto LABEL_13;
  objc_msgSend(v10, "appendFormat:", CFSTR("EXISTS (SELECT 1 FROM %@ WHERE (%@=%@ AND %@))"), v5, v7, v8, v9, 0);
  if (self->_matchObjectsWithoutKey)
    objc_msgSend(v11, "appendString:", CFSTR(" OR "));
  if (!self->_valuePredicate || self->_matchObjectsWithoutKey)
  {
LABEL_13:
    if (self->_matchObjectsWithoutKey)
      v12 = CFSTR("NOT EXISTS");
    else
      v12 = CFSTR("EXISTS");
    objc_msgSend(v11, "appendFormat:", CFSTR("%@ (SELECT 1 FROM %@ WHERE (%@=%@))"), v12, v5, v7, v8, 0);
  }
  objc_msgSend(v11, "appendString:", CFSTR(")"));

  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_valuePredicate, "bindToStatement:bindingIndex:", a3, a4);
}

- (NSString)description
{
  HDSQLitePredicate *valuePredicate;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  valuePredicate = self->_valuePredicate;
  if (!valuePredicate)
  {
    if (self->_matchObjectsWithoutKey)
      v7 = CFSTR("does not exist");
    else
      v7 = CFSTR("exists");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_matchObjectsWithoutKey)
  {
    -[HDSQLitePredicate description](valuePredicate, "description");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v8;
    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HDSQLitePredicate description](valuePredicate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("does not exist OR %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@>"), *MEMORY[0x1E0CB55D0], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (const)_propertyForKey:(uint64_t)a1
{
  id v2;
  const __CFString *v3;

  v2 = a2;
  objc_opt_self();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D0]) & 1) != 0)
  {
    v3 = CFSTR("sid");
  }
  else if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D8]))
  {
    v3 = CFSTR("version");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_valueClassForKey:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D0]) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB55D8]))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuePredicate, 0);
}

@end
