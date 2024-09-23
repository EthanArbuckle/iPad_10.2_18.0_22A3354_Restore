@implementation EFSQLUpdateStatement

- (EFSQLUpdateStatement)initWithTable:(id)a3
{
  return -[EFSQLUpdateStatement initWithTable:conflictResolution:](self, "initWithTable:conflictResolution:", a3, 0);
}

- (void)setWhereClause:(id)a3
{
  objc_storeStrong((id *)&self->_whereClause, a3);
}

void __65__EFSQLUpdateStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(CFSTR(":update_"), "stringByAppendingString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)queryString
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[EFSQLUpdateStatement _renderSQLExpressionForUpsert:into:]((uint64_t)self, 0, v3);
  return (NSString *)v3;
}

- (void)_renderSQLExpressionForUpsert:(void *)a3 into:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
    goto LABEL_21;
  v6 = *(id *)(a1 + 16);
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(*(id *)(a1 + 24), "count");

  if (!(v7 + v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__renderSQLExpressionForUpsert_into_, a1, CFSTR("EFSQLUpdateStatement.m"), 72, CFSTR("Need at least one bindable value for a column to generate a queryString"));

    if (a2)
      goto LABEL_4;
LABEL_6:
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      EFSQLStringForConflictResolution(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("UPDATE OR %@ %@ SET "), v11, *(_QWORD *)(a1 + 32));

    }
    else
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("UPDATE %@ SET "), *(_QWORD *)(a1 + 32));
    }
    goto LABEL_9;
  }
  if (!a2)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v5, "appendString:", CFSTR("UPDATE SET "));
LABEL_9:
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 16), "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        if (v27[3] >= 1)
          objc_msgSend(v5, "appendString:", CFSTR(", "));
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ = :update_%@"), v16, v16);
        ++v27[3];
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  v17 = *(id *)(a1 + 24);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__EFSQLUpdateStatement__renderSQLExpressionForUpsert_into___block_invoke;
  v19[3] = &unk_1E62A75C8;
  v21 = &v26;
  v18 = v5;
  v20 = v18;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v19);

  if (*(_QWORD *)(a1 + 8))
  {
    objc_msgSend(v18, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(*(id *)(a1 + 8), "ef_renderSQLExpressionInto:", v18);
  }

  _Block_object_dispose(&v26, 8);
LABEL_21:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_expressables, 0);
  objc_storeStrong((id *)&self->_bindables, 0);
  objc_storeStrong((id *)&self->_whereClause, 0);
}

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *bindables;
  NSMutableDictionary *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (self)
    bindables = self->_bindables;
  else
    bindables = 0;
  v6 = bindables;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__EFSQLUpdateStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke;
  v8[3] = &unk_1E62A75A0;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (EFSQLUpdateStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4
{
  id v6;
  EFSQLUpdateStatement *v7;
  uint64_t v8;
  NSString *table;
  NSMutableDictionary *v10;
  NSMutableDictionary *bindables;
  NSMutableDictionary *v12;
  NSMutableDictionary *expressables;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLUpdateStatement;
  v7 = -[EFSQLUpdateStatement init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    table = v7->_table;
    v7->_table = (NSString *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bindables = v7->_bindables;
    v7->_bindables = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    expressables = v7->_expressables;
    v7->_expressables = v12;

    v7->_conflictResolution = a4;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7;
  int v8;
  int v9;
  char v10;
  NSMutableDictionary *bindables;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = v9;
  if (((v8 | v9) & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLUpdateStatement.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isBindable || isExpressable"));

    if (v7)
    {
LABEL_3:
      if ((v8 & 1) != 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLUpdateStatement.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName != nil"));

  if ((v8 & 1) != 0)
  {
LABEL_4:
    if (self)
      bindables = self->_bindables;
    else
      bindables = 0;
LABEL_13:
    -[NSMutableDictionary setObject:forKeyedSubscript:](bindables, "setObject:forKeyedSubscript:", v15, v7);
    goto LABEL_14;
  }
LABEL_8:
  if ((v10 & 1) != 0)
  {
    if (self)
      v14 = self->_bindables;
    else
      v14 = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v7);
    if (self)
      bindables = self->_expressables;
    else
      bindables = 0;
    goto LABEL_13;
  }
LABEL_14:

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  NSMutableDictionary *bindables;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *expressables;
  void *v11;

  v4 = a3;
  if (self)
    bindables = self->_bindables;
  else
    bindables = 0;
  v6 = bindables;
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    if (self)
      expressables = self->_expressables;
    else
      expressables = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](expressables, "objectForKeyedSubscript:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

void __59__EFSQLUpdateStatement__renderSQLExpressionForUpsert_into___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ = "), v7);
  objc_msgSend(v5, "ef_SQLIsolatedExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_renderSQLExpressionInto:", *(_QWORD *)(a1 + 32));

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (EFSQLValueExpressable)whereClause
{
  return self->_whereClause;
}

- (void)renderStatementForUpsertInto:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[EFSQLUpdateStatement _renderSQLExpressionForUpsert:into:](a1, 1, v3);

}

@end
