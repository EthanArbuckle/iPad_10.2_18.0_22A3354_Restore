@implementation HDSQLiteRawPredicate

+ (id)predicateWithSQL:(id)a3 overProperties:(id)a4 values:(id)a5
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDSQLitePredicate.m"), 946, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sql != nil"));

  }
  v12 = (_QWORD *)objc_opt_new();
  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)v12[1];
  v12[1] = v13;

  v15 = objc_msgSend(v10, "copy");
  v16 = (void *)v12[2];
  v12[2] = v15;

  v17 = objc_msgSend(v11, "copy");
  v18 = (void *)v12[3];
  v12[3] = v17;

  return v12;
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
        _BindValueToStatement(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++), a3, a4);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)SQLForEntityClass:(Class)a3
{
  return self->_sql;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  void *v5;
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
    v5 = (void *)objc_opt_new();
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
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  v9.super_class = (Class)HDSQLiteRawPredicate;
  if (!-[HDSQLitePredicate isCompatibleWithPredicate:](&v9, sel_isCompatibleWithPredicate_, v4))
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSString isEqualToString:](self->_sql, "isEqualToString:", v4[1]))
    goto LABEL_7;
  properties = self->_properties;
  v6 = (NSArray *)v4[2];
  if (properties == v6)
  {
    v7 = 1;
    goto LABEL_8;
  }
  if (v6)
    v7 = -[NSArray isEqual:](properties, "isEqual:");
  else
LABEL_7:
    v7 = 0;
LABEL_8:

  return v7;
}

- (id)description
{
  NSString *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = self->_sql;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_values;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = -[NSString rangeOfString:](v3, "rangeOfString:", CFSTR("?"));
        if (v11)
        {
          v12 = v10;
          v13 = v11;
          objc_msgSend(v9, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v12, v13, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v3 = (NSString *)v15;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[NSArray componentsJoinedByString:](self->_properties, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<SQL: '%@>' joining over (%@)"), v3, v17, (_QWORD)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteRawPredicate;
  v3 = -[HDSQLitePredicate hash](&v7, sel_hash);
  v4 = (NSUInteger)v3 + -[NSString hash](self->_sql, "hash");
  v5 = -[NSArray hash](self->_values, "hash");
  return v4 + v5 + -[NSArray hash](self->_properties, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sql;
  NSString *v6;
  NSArray *properties;
  NSArray *v8;
  NSArray *values;
  NSArray *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteRawPredicate;
  if (!-[HDSQLitePredicate isEqual:](&v13, sel_isEqual_, v4))
    goto LABEL_12;
  sql = self->_sql;
  v6 = (NSString *)v4[1];
  if (sql != v6 && (!v6 || !-[NSString isEqual:](sql, "isEqual:")))
    goto LABEL_12;
  properties = self->_properties;
  v8 = (NSArray *)v4[2];
  if (properties != v8 && (!v8 || !-[NSArray isEqual:](properties, "isEqual:")))
    goto LABEL_12;
  values = self->_values;
  v10 = (NSArray *)v4[3];
  if (values == v10)
  {
    v11 = 1;
    goto LABEL_13;
  }
  if (v10)
    v11 = -[NSArray isEqual:](values, "isEqual:");
  else
LABEL_12:
    v11 = 0;
LABEL_13:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_sql, 0);
}

@end
