@implementation HDSQLiteJoinClause

+ (id)innerJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], 0, v14, a4, v13, v12, v11, 0);

  return v15;
}

- (id)_initWithJoinType:(void *)a3 fromTable:(void *)a4 toTargetEntity:(void *)a5 as:(void *)a6 localReference:(void *)a7 targetKey:(void *)a8 additionalPredicate:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!a1)
    goto LABEL_8;
  if (v15)
  {
    if (a4)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, CFSTR("HDSQLiteJoinClause.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localTable != nil"));

    if (a4)
    {
LABEL_4:
      if (v17)
        goto LABEL_5;
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, CFSTR("HDSQLiteJoinClause.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localReferenceProperty != nil"));

      if (v18)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, CFSTR("HDSQLiteJoinClause.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetEntityClass != nil"));

  if (!v17)
    goto LABEL_11;
LABEL_5:
  if (v18)
    goto LABEL_6;
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, CFSTR("HDSQLiteJoinClause.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetKeyProperty != nil"));

LABEL_6:
  v35.receiver = a1;
  v35.super_class = (Class)HDSQLiteJoinClause;
  a1 = (id *)objc_msgSendSuper2(&v35, sel_init);
  if (a1)
  {
    v20 = objc_msgSend(v15, "copy");
    v21 = a1[2];
    a1[2] = (id)v20;

    objc_storeStrong(a1 + 3, a4);
    v22 = objc_msgSend(v16, "copy");
    v23 = a1[1];
    a1[1] = (id)v22;

    v24 = objc_msgSend(v17, "copy");
    v25 = a1[4];
    a1[4] = (id)v24;

    v26 = objc_msgSend(v18, "copy");
    v27 = a1[5];
    a1[5] = (id)v26;

    v28 = objc_msgSend(v19, "copy");
    v29 = a1[7];
    a1[7] = (id)v28;

    a1[6] = a2;
  }
LABEL_8:

  return a1;
}

+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], (void *)1, v14, a4, v13, v12, v11, 0);

  return v15;
}

+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7 additionalPredicate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  v18 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], (void *)1, v17, a4, v16, v15, v14, v13);

  return v18;
}

- (id)copyWithJoinType:(int64_t)a3
{
  if (self->_joinType == a3)
    return self;
  else
    return -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], (void *)a3, self->_localTable, self->_targetEntityClass, self->_joinAsName, self->_localReferenceProperty, self->_targetKeyProperty, self->_additionalPredicate);
}

- (id)SQLJoinClause
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSString *localTable;
  NSString *localReferenceProperty;
  void *v9;
  void *v10;
  NSString *additionalPredicate;
  int64_t joinType;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  -[objc_class disambiguatedDatabaseTable](self->_targetEntityClass, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSString isEqualToString:](self->_localReferenceProperty, "isEqualToString:", self->_targetKeyProperty);
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("USING(%@)"), self->_localReferenceProperty);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    localTable = self->_localTable;
    localReferenceProperty = self->_localReferenceProperty;
    -[HDSQLiteJoinClause joinAsName](self, "joinAsName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@=%@.%@"), localTable, localReferenceProperty, v9, self->_targetKeyProperty);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    additionalPredicate = self->_additionalPredicate;
    if (additionalPredicate)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ON (%@ AND %@)"), v10, additionalPredicate);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ON %@"), v10, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  joinType = self->_joinType;
  v13 = CFSTR("LEFT");
  if (joinType != 1)
    v13 = 0;
  if (joinType)
    v14 = v13;
  else
    v14 = CFSTR("INNER");
  if (self->_joinAsName)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ JOIN %@ AS %@ %@"), v14, v3, self->_joinAsName, v6);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ JOIN %@ %@"), v14, v3, v6, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)joinAsName
{
  NSString *joinAsName;

  joinAsName = self->_joinAsName;
  if (joinAsName)
    return joinAsName;
  -[objc_class disambiguatedDatabaseTable](self->_targetEntityClass, "disambiguatedDatabaseTable");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  NSStringFromClass(self->_targetEntityClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_localTable, "hash");
  v6 = v5 ^ -[NSString hash](self->_joinAsName, "hash") ^ v4;
  v7 = -[NSString hash](self->_localReferenceProperty, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_targetKeyProperty, "hash") ^ self->_joinType;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  Class targetEntityClass;
  BOOL v9;
  NSString *localTable;
  void *v12;
  int64_t joinType;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *localReferenceProperty;
  void *v18;
  NSString *targetKeyProperty;
  void *v20;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    targetEntityClass = self->_targetEntityClass;
    if (targetEntityClass == (Class)objc_msgSend(v7, "targetEntityClass"))
    {
      localTable = self->_localTable;
      objc_msgSend(v7, "localTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](localTable, "isEqualToString:", v12)
        || (joinType = self->_joinType, joinType != objc_msgSend(v7, "joinType")))
      {
        v9 = 0;
LABEL_19:

        goto LABEL_4;
      }
      -[HDSQLiteJoinClause joinAsName](self, "joinAsName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "joinAsName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        goto LABEL_12;
      objc_msgSend(v7, "joinAsName");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v9 = 0;
        goto LABEL_18;
      }
      v3 = (void *)v16;
      -[HDSQLiteJoinClause joinAsName](self, "joinAsName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "joinAsName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqualToString:", v5))
      {
LABEL_12:
        localReferenceProperty = self->_localReferenceProperty;
        objc_msgSend(v7, "localReferenceProperty");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](localReferenceProperty, "isEqualToString:", v18))
        {
          targetKeyProperty = self->_targetKeyProperty;
          objc_msgSend(v7, "targetKeyProperty");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[NSString isEqualToString:](targetKeyProperty, "isEqualToString:", v20);

        }
        else
        {

          v9 = 0;
        }
        if (v14 == v15)
          goto LABEL_18;
      }
      else
      {
        v9 = 0;
      }

LABEL_18:
      goto LABEL_19;
    }
  }
  v9 = 0;
LABEL_4:

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p, localTable:%@, targetEntity:%@>"), objc_opt_class(), self, self->_localTable, self->_targetEntityClass);
}

- (NSString)localTable
{
  return self->_localTable;
}

- (Class)targetEntityClass
{
  return self->_targetEntityClass;
}

- (NSString)localReferenceProperty
{
  return self->_localReferenceProperty;
}

- (NSString)targetKeyProperty
{
  return self->_targetKeyProperty;
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (NSString)additionalPredicate
{
  return self->_additionalPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicate, 0);
  objc_storeStrong((id *)&self->_targetKeyProperty, 0);
  objc_storeStrong((id *)&self->_localReferenceProperty, 0);
  objc_storeStrong((id *)&self->_targetEntityClass, 0);
  objc_storeStrong((id *)&self->_localTable, 0);
  objc_storeStrong((id *)&self->_joinAsName, 0);
}

@end
