@implementation EFSQLCaseExpression

- (EFSQLCaseExpression)init
{
  return -[EFSQLCaseExpression initWithBaseExpression:](self, "initWithBaseExpression:", 0);
}

- (EFSQLCaseExpression)initWithBaseExpression:(id)a3
{
  id v5;
  EFSQLCaseExpression *v6;
  EFSQLCaseExpression *v7;
  uint64_t v8;
  NSMapTable *whenExpressions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLCaseExpression;
  v6 = -[EFSQLCaseExpression init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseExpression, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    whenExpressions = v7->_whenExpressions;
    v7->_whenExpressions = (NSMapTable *)v8;

  }
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[NSMapTable objectForKey:](self->_whenExpressions, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_whenExpressions, "setObject:forKey:", a3, a4);
}

- (NSString)ef_SQLExpression
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFSQLCaseExpression ef_renderSQLExpressionInto:](self, "ef_renderSQLExpressionInto:", v3);
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("CASE"));
  -[EFSQLCaseExpression baseExpression](self, "baseExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" "));
    objc_msgSend(v16, "ef_SQLIsolatedExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_renderSQLExpressionInto:", v4);

  }
  -[EFSQLCaseExpression whenExpressions](self, "whenExpressions");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", CFSTR(" WHEN "));
        objc_msgSend(v10, "ef_SQLIsolatedExpression");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ef_renderSQLExpressionInto:", v4);

        objc_msgSend(v4, "appendString:", CFSTR(" THEN "));
        objc_msgSend(v11, "ef_SQLIsolatedExpression");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ef_renderSQLExpressionInto:", v4);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[EFSQLCaseExpression elseExpression](self, "elseExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" ELSE "));
    objc_msgSend(v14, "ef_SQLIsolatedExpression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ef_renderSQLExpressionInto:", v4);

  }
  objc_msgSend(v4, "appendString:", CFSTR(" END"));

}

- (EFSQLValueExpressable)elseExpression
{
  return self->_elseExpression;
}

- (void)setElseExpression:(id)a3
{
  objc_storeStrong((id *)&self->_elseExpression, a3);
}

- (EFSQLValueExpressable)baseExpression
{
  return self->_baseExpression;
}

- (NSMapTable)whenExpressions
{
  return self->_whenExpressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whenExpressions, 0);
  objc_storeStrong((id *)&self->_baseExpression, 0);
  objc_storeStrong((id *)&self->_elseExpression, 0);
}

@end
