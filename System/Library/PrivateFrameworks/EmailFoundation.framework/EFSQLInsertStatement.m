@implementation EFSQLInsertStatement

- (EFSQLInsertStatement)initWithTable:(id)a3
{
  return -[EFSQLInsertStatement initWithTable:conflictResolution:](self, "initWithTable:conflictResolution:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredColumns, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (BOOL)isEmpty
{
  NSMutableArray *values;
  NSMutableArray *v4;
  NSMutableOrderedSet *requiredColumns;
  BOOL v6;

  if (self)
    values = self->_values;
  else
    values = 0;
  v4 = values;
  if (-[NSMutableArray count](v4, "count") == 1)
  {
    if (self)
      requiredColumns = self->_requiredColumns;
    else
      requiredColumns = 0;
    v6 = -[NSMutableOrderedSet count](requiredColumns, "count") == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EFSQLInsertStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4
{
  id v6;
  EFSQLInsertStatement *v7;
  uint64_t v8;
  NSString *table;
  NSMutableArray *v10;
  NSMutableArray *values;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *requiredColumns;
  NSMutableArray *v14;
  _QWORD *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EFSQLInsertStatement;
  v7 = -[EFSQLInsertStatement init](&v17, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    table = v7->_table;
    v7->_table = (NSString *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    values = v7->_values;
    v7->_values = v10;

    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    requiredColumns = v7->_requiredColumns;
    v7->_requiredColumns = v12;

    v14 = v7->_values;
    v15 = -[_EFSQLInsertStatementValue initWithRequiredColumns:]([_EFSQLInsertStatementFirstValue alloc], v7->_requiredColumns);
    -[NSMutableArray addObject:](v14, "addObject:", v15);

    v7->_conflictResolution = a4;
  }

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v5;
  NSMutableArray *values;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (self)
    values = self->_values;
  else
    values = 0;
  if (-[NSMutableArray count](values, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLInsertStatement.m"), 133, CFSTR("Direct statement access only works with a single value"));

    if (self)
      goto LABEL_5;
LABEL_8:
    v7 = 0;
    goto LABEL_6;
  }
  if (!self)
    goto LABEL_8;
LABEL_5:
  v7 = self->_values;
LABEL_6:
  -[NSMutableArray firstObject](v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7;
  NSMutableArray *values;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (self)
    values = self->_values;
  else
    values = 0;
  if (-[NSMutableArray count](values, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLInsertStatement.m"), 138, CFSTR("Direct statement access only works with a single value"));

    if (self)
      goto LABEL_5;
LABEL_8:
    v9 = 0;
    goto LABEL_6;
  }
  if (!self)
    goto LABEL_8;
LABEL_5:
  v9 = self->_values;
LABEL_6:
  -[NSMutableArray firstObject](v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v7);

}

- (NSString)queryString
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[EFSQLInsertStatement _renderQueryStringForNamedBindings:into:]((uint64_t)self, 0, v3);
  return (NSString *)v3;
}

- (void)_renderQueryStringForNamedBindings:(void *)a3 into:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v21 = a3;
  if (a1)
  {
    v5 = *(id *)(a1 + 24);
    objc_msgSend(v5, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 16);
    else
      v8 = 0;
    v9 = v8;
    v10 = objc_msgSend(v9, "count");
    v11 = *(id *)(a1 + 24);
    objc_msgSend(v11, "lastObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(void **)(v12 + 24);
    else
      v14 = 0;
    v15 = objc_msgSend(v14, "count", v21);

    if (!(v10 + v15))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__renderQueryStringForNamedBindings_into_, a1, CFSTR("EFSQLInsertStatement.m"), 157, CFSTR("Last value contains no data"));

    }
    objc_msgSend(v21, "appendString:", CFSTR("INSERT"));
    v16 = *(_QWORD *)(a1 + 16);
    if (v16)
    {
      objc_msgSend(v21, "appendString:", CFSTR(" OR "));
      EFSQLStringForConflictResolution(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendString:", v17);

    }
    objc_msgSend(v21, "appendString:", CFSTR(" INTO "));
    objc_msgSend(v21, "appendString:", *(_QWORD *)(a1 + 8));
    objc_msgSend(v21, "appendString:", CFSTR(" ("));
    v18 = *(id *)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__EFSQLInsertStatement__renderQueryStringForNamedBindings_into___block_invoke;
    v22[3] = &unk_1E62A7190;
    v19 = v21;
    v23 = v19;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);

    objc_msgSend(v19, "appendString:", CFSTR(") VALUES "));
    -[EFSQLInsertStatement _renderValuesForNamedBindings:intoString:](a1, a2, v19);

  }
}

- (void)renderStatementWithNamedBindingsInto:(id)a3
{
  -[EFSQLInsertStatement _renderQueryStringForNamedBindings:into:]((uint64_t)self, 1, a3);
}

void __64__EFSQLInsertStatement__renderQueryStringForNamedBindings_into___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (void)_renderValuesForNamedBindings:(void *)a3 intoString:
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v8 = a3;
  if (a1)
  {
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke;
    v9[3] = &unk_1E62A71E0;
    v10 = v8;
    v11 = v5;
    v12 = a2;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
}

void __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v5 = a2;
  if (a3)
    v6 = CFSTR(", (");
  else
    v6 = CFSTR("(");
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke_2;
  v10[3] = &unk_1E62A71B8;
  v7 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v8 = v5;
  v14 = *(_BYTE *)(a1 + 48);
  v9 = v8;
  v12 = v8;
  v13 = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(")"));

}

void __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v6, "appendString:", CFSTR(":insert_"));
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      if (*(_QWORD *)(a1 + 48))
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("_%lu"), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR("?"));
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "ef_SQLIsolatedExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_renderSQLExpressionInto:", *(_QWORD *)(a1 + 32));

  }
}

- (void)enumerateBindingIndicesAndValuesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  NSMutableArray *values;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableOrderedSet *requiredColumns;
  NSMutableOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  EFSQLInsertStatement *v19;
  uint64_t v20;
  NSMutableArray *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v31 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (self)
    values = self->_values;
  else
    values = 0;
  v6 = values;
  v21 = v6;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v20)
  {
    v7 = 0;
    v8 = *(_QWORD *)v28;
    v18 = *(_QWORD *)v28;
    v19 = self;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v22);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        if (self)
          requiredColumns = self->_requiredColumns;
        else
          requiredColumns = 0;
        v11 = requiredColumns;
        v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v4[2](v4, v7, v15, &v31);
                v16 = v31 == 0;

                if (!v16)
                {

                  v6 = v21;
                  goto LABEL_27;
                }
                ++v7;
              }
              else
              {

              }
            }
            v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v21;
        self = v19;
        ++v22;
        v8 = v18;
      }
      while (v22 != v20);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      v20 = v17;
    }
    while (v17);
  }
LABEL_27:

}

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *values;
  NSMutableArray *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (self)
    values = self->_values;
  else
    values = 0;
  v6 = values;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__EFSQLInsertStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke;
  v8[3] = &unk_1E62A7208;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);

}

void __65__EFSQLInsertStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  _QWORD *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = a1;
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[4];
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v14 = a3
              ? objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(":insert_%@_%lu"), v12, a3)
              : objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(":insert_%@"), v12);
          v15 = (void *)v14;
          (*(void (**)(void))(*(_QWORD *)(v17 + 40) + 16))();
          v16 = *a4 == 0;

          if (!v16)
          {

            goto LABEL_17;
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

}

- (id)addValue
{
  EFSQLInsertStatement *v2;
  NSMutableArray *v3;
  _QWORD *v4;
  _QWORD *v5;
  NSMutableArray *values;
  _QWORD *v7;
  _EFSQLInsertStatementFollowUpValue *v8;
  NSMutableOrderedSet *requiredColumns;
  NSMutableArray *v10;
  id v12;

  v2 = self;
  if (self)
    self = (EFSQLInsertStatement *)self->_values;
  if (-[EFSQLInsertStatement count](self, "count") != 1)
  {
    if (v2)
      values = v2->_values;
    else
      values = 0;
    -[NSMutableArray lastObject](values, "lastObject");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v7)
      v7 = (_QWORD *)v7[2];
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No columns were defined for the previous value"));
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v12);
    }
    goto LABEL_15;
  }
  if (v2)
    v3 = v2->_values;
  else
    v3 = 0;
  -[NSMutableArray firstObject](v3, "firstObject");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[2];
  if (objc_msgSend(v4, "count"))
  {
LABEL_15:

    v8 = [_EFSQLInsertStatementFollowUpValue alloc];
    if (v2)
      requiredColumns = v2->_requiredColumns;
    else
      requiredColumns = 0;
    v5 = -[_EFSQLInsertStatementValue initWithRequiredColumns:](v8, requiredColumns);
    if (v2)
      v10 = v2->_values;
    else
      v10 = 0;
    -[NSMutableArray addObject:](v10, "addObject:", v5);
  }
  return v5;
}

@end
