@implementation EFSQLUpsertStatement

- (EFSQLUpsertStatement)initWithTable:(id)a3 conflictTarget:(id)a4
{
  id v6;
  id v7;
  EFSQLUpsertStatement *v8;
  EFSQLInsertStatement *v9;
  EFSQLInsertStatement *insertStatement;
  EFSQLUpdateStatement *v11;
  EFSQLUpdateStatement *updateStatement;
  uint64_t v13;
  NSArray *conflictTarget;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EFSQLUpsertStatement;
  v8 = -[EFSQLUpsertStatement init](&v16, sel_init);
  if (v8)
  {
    v9 = -[EFSQLInsertStatement initWithTable:]([EFSQLInsertStatement alloc], "initWithTable:", v6);
    insertStatement = v8->_insertStatement;
    v8->_insertStatement = v9;

    v11 = -[EFSQLUpdateStatement initWithTable:]([EFSQLUpdateStatement alloc], "initWithTable:", v6);
    updateStatement = v8->_updateStatement;
    v8->_updateStatement = v11;

    v13 = objc_msgSend(v7, "copy");
    conflictTarget = v8->_conflictTarget;
    v8->_conflictTarget = (NSArray *)v13;

  }
  return v8;
}

- (EFSQLInsertStatementValue)insertValue
{
  if (self)
    self = (EFSQLUpsertStatement *)self->_insertStatement;
  return (EFSQLInsertStatementValue *)self;
}

- (EFSQLUpdateStatementValue)updateValue
{
  if (self)
    self = (EFSQLUpsertStatement *)self->_updateStatement;
  return (EFSQLUpdateStatementValue *)self;
}

- (EFSQLValueExpressable)whereClause
{
  if (self)
    self = (EFSQLUpsertStatement *)self->_updateStatement;
  -[EFSQLUpsertStatement whereClause](self, "whereClause");
  return (EFSQLValueExpressable *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setWhereClause:(id)a3
{
  id v4;
  EFSQLUpdateStatement *updateStatement;
  id v6;

  v4 = a3;
  if (self)
    updateStatement = self->_updateStatement;
  else
    updateStatement = 0;
  v6 = v4;
  -[EFSQLUpdateStatement setWhereClause:](updateStatement, "setWhereClause:", v4);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  EFSQLInsertStatement *insertStatement;
  void *v6;

  v4 = a3;
  if (self)
    insertStatement = self->_insertStatement;
  else
    insertStatement = 0;
  -[EFSQLInsertStatement objectForKeyedSubscript:](insertStatement, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  EFSQLInsertStatement *insertStatement;
  NSArray *conflictTarget;
  void *v9;
  EFSQLUpdateStatement *updateStatement;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self)
    insertStatement = self->_insertStatement;
  else
    insertStatement = 0;
  -[EFSQLInsertStatement setObject:forKeyedSubscript:](insertStatement, "setObject:forKeyedSubscript:", v11, v6);
  if (self)
    conflictTarget = self->_conflictTarget;
  else
    conflictTarget = 0;
  if (!-[NSArray containsObject:](conflictTarget, "containsObject:", v6))
  {
    -[EFSQLUpsertStatement excludedColumnExpressionForColumnName:](self, "excludedColumnExpressionForColumnName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      updateStatement = self->_updateStatement;
    else
      updateStatement = 0;
    -[EFSQLUpdateStatement setObject:forKeyedSubscript:](updateStatement, "setObject:forKeyedSubscript:", v9, v6);

  }
}

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4;
  EFSQLInsertStatement *insertStatement;
  EFSQLUpdateStatement *updateStatement;
  id v7;

  v4 = a3;
  if (self)
    insertStatement = self->_insertStatement;
  else
    insertStatement = 0;
  v7 = v4;
  -[EFSQLInsertStatement enumerateBindingNamesAndValuesUsingBlock:](insertStatement, "enumerateBindingNamesAndValuesUsingBlock:", v4);
  if (self)
    updateStatement = self->_updateStatement;
  else
    updateStatement = 0;
  -[EFSQLUpdateStatement enumerateBindingNamesAndValuesUsingBlock:](updateStatement, "enumerateBindingNamesAndValuesUsingBlock:", v7);

}

- (BOOL)isEmpty
{
  if (self)
    self = (EFSQLUpsertStatement *)self->_insertStatement;
  return -[EFSQLUpsertStatement isEmpty](self, "isEmpty");
}

- (NSString)queryString
{
  NSArray *conflictTarget;
  NSArray *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  EFSQLInsertStatement *insertStatement;
  NSArray *v10;
  id v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  _QWORD v19[5];

  if (self)
    conflictTarget = self->_conflictTarget;
  else
    conflictTarget = 0;
  v5 = conflictTarget;
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35__EFSQLUpsertStatement_queryString__block_invoke;
  v19[3] = &unk_1E62A75F0;
  v19[4] = self;
  v7 = -[NSArray ef_all:](v5, "ef_all:", v19);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLUpsertStatement.m"), 81, CFSTR("Must have insertion values for all conflict target columns"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (self)
    insertStatement = self->_insertStatement;
  else
    insertStatement = 0;
  -[EFSQLInsertStatement renderStatementWithNamedBindingsInto:](insertStatement, "renderStatementWithNamedBindingsInto:", v8);
  objc_msgSend(v8, "appendString:", CFSTR(" ON CONFLICT ("));
  v10 = self->_conflictTarget;
  v14 = v6;
  v15 = 3221225472;
  v16 = __35__EFSQLUpsertStatement_queryString__block_invoke_2;
  v17 = &unk_1E62A7190;
  v11 = v8;
  v18 = v11;
  -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", &v14);
  objc_msgSend(v11, "appendString:", CFSTR(") DO "), v14, v15, v16, v17);
  -[EFSQLUpdateStatement renderStatementForUpsertInto:]((uint64_t)self->_updateStatement, v11);

  return (NSString *)v11;
}

BOOL __35__EFSQLUpsertStatement_queryString__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 8);
  else
    v5 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

void __35__EFSQLUpsertStatement_queryString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (id)excludedColumnExpressionForColumnName:(id)a3
{
  id v5;
  EFSQLInsertStatement *insertStatement;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (self)
    insertStatement = self->_insertStatement;
  else
    insertStatement = 0;
  -[EFSQLInsertStatement objectForKeyedSubscript:](insertStatement, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLUpsertStatement.m"), 101, CFSTR("Cannot generate excluded expression for column that was not inserted"));

  }
  +[EFSQLColumnExpression table:column:](EFSQLColumnExpression, "table:column:", CFSTR("excluded"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictTarget, 0);
  objc_storeStrong((id *)&self->_updateStatement, 0);
  objc_storeStrong((id *)&self->_insertStatement, 0);
}

@end
