@implementation ML3DatabaseStatementRenderer

- (id)commitTransactionStatement
{
  return CFSTR("COMMIT TRANSACTION");
}

+ (id)defaultRenderer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ML3DatabaseStatementRenderer_defaultRenderer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRenderer___once != -1)
    dispatch_once(&defaultRenderer___once, block);
  return (id)defaultRenderer_defaultRenderer;
}

- (id)beginTransactionStatementWithBehaviorType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("BEGIN TRANSACTION");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BEGIN %@ TRANSACTION"), off_1E5B65368[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__ML3DatabaseStatementRenderer_defaultRenderer__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultRenderer_defaultRenderer;
  defaultRenderer_defaultRenderer = (uint64_t)v0;

}

- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4
{
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = 2 * a4 - 1;
  v5 = a3;
  objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", v4, CFSTR(",?"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IN (%@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4 valueCount:(unint64_t)a5
{
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = 2 * a4 - 1;
  v7 = a3;
  objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", v6, CFSTR(",?"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", (%@)"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length") * a5 - 2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", v10, v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)insertStatementForTableName:(id)a3 columnNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

  v22[0] = CFSTR("ML3DatabaseInsertStatementOptionTableNameKey");
  v22[1] = CFSTR("ML3DatabaseInsertStatementOptionColumnNamesKey");
  v23[0] = v6;
  v23[1] = v9;
  v22[2] = CFSTR("ML3DatabaseInsertStatementOptionValuesKey");
  v23[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseStatementRenderer insertStatementWithOptions:](self, "insertStatementWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)insertStatementUsingDefaultValuesForTableName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("ML3DatabaseInsertStatementOptionTableNameKey");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ML3DatabaseStatementRenderer insertStatementWithOptions:](self, "insertStatementWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)insertStatementWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionTableNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatementRenderer+Insertions.m"), 46, CFSTR("Must specify a table name to render insertion statement."));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionFailureOptionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionFailureOptionKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if ((unint64_t)(v9 - 1) > 4)
      v10 = CFSTR("FAIL");
    else
      v10 = off_1E5B65340[v9 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR %@"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("INSERT");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionDatabaseNameKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionDatabaseNameKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("INTO %@.%@"), v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INTO %@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionColumnNamesKey"));
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ML3DatabaseInsertStatementOptionValuesKey"));
  v17 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v17;
  if (v16 | v17)
  {
    v18 = (void *)v17;
    if (v16)
    {
      objc_msgSend((id)v16, "componentsJoinedByString:", CFSTR(","));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v19);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v20 = objc_msgSend((id)v16, "count");
        if (v20 != objc_msgSend(v18, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatementRenderer+Insertions.m"), 108, CFSTR("Number of column names provided doesn't match the number of values provided."));

        }
        goto LABEL_19;
      }
    }
    else
    {
      v43 = 0;
      if (v17)
      {
LABEL_19:
        v39 = v16;
        v40 = v15;
        v41 = v11;
        v42 = v6;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v24 = v18;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (!v25)
          goto LABEL_31;
        v26 = v25;
        v27 = *(_QWORD *)v46;
        while (1)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v46 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v29, "stringValue");
              v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              v31 = CFSTR("NULL");
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_29;
              v30 = v29;
            }
            v31 = v30;
LABEL_29:
            objc_msgSend(v23, "addObject:", v31);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (!v26)
          {
LABEL_31:

            objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v42;
            v15 = v40;
            v11 = v41;
            v16 = v39;
            goto LABEL_33;
          }
        }
      }
    }
    objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend((id)v16, "count") - 1, CFSTR(",?"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VALUES (%@)"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v43, v33);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = v33;
    }
    v22 = v35;

  }
  else
  {
    v22 = CFSTR("DEFAULT VALUES");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v11, v15, v22);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)rollbackTranscationStatement
{
  return -[ML3DatabaseStatementRenderer rollbackTranscationStatementToSavepointName:](self, "rollbackTranscationStatementToSavepointName:", 0);
}

- (id)rollbackTranscationStatementToSavepointName:(id)a3
{
  if (!a3)
    return CFSTR("ROLLBACK TRANSACTION");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROLLBACK TRANSACTION TO SAVEPOINT %@"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)savepointStatementWithName:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatementRenderer+Transactions.m"), 64, CFSTR("Must specify a savepoint name."));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SAVEPOINT %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)savepointReleaseStatementWithName:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseStatementRenderer+Transactions.m"), 71, CFSTR("Must specify a savepoint name."));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RELEASE SAVEPOINT %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
