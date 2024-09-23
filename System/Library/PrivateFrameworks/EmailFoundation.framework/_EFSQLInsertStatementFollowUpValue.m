@implementation _EFSQLInsertStatementFollowUpValue

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
    bindables = self->super._bindables;
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
      expressables = self->super._expressables;
    else
      expressables = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](expressables, "objectForKeyedSubscript:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7;
  int v8;
  int v9;
  char v10;
  NSMutableOrderedSet *requiredColumns;
  NSMutableDictionary *bindables;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = objc_opt_respondsToSelector();
  v9 = objc_opt_respondsToSelector();
  v10 = v9;
  if (((v8 | v9) & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLInsertStatement.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName != nil"));

    if (self)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSQLInsertStatement.m"), 85, CFSTR("Value must conform to either EFSQLBindable or EFSQLValueExpressable"));

  if (!v7)
    goto LABEL_17;
LABEL_3:
  if (self)
  {
LABEL_4:
    requiredColumns = self->super._requiredColumns;
    goto LABEL_5;
  }
LABEL_18:
  requiredColumns = 0;
LABEL_5:
  if (!-[NSMutableOrderedSet containsObject:](requiredColumns, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("column: %@ was not defined for the initial value, can't define it for a follow-up value"), v7);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  if ((v8 & 1) != 0)
  {
    if (self)
      bindables = self->super._bindables;
    else
      bindables = 0;
LABEL_14:
    -[NSMutableDictionary setObject:forKeyedSubscript:](bindables, "setObject:forKeyedSubscript:", v17, v7);
    goto LABEL_15;
  }
  if ((v10 & 1) != 0)
  {
    if (self)
      v13 = self->super._bindables;
    else
      v13 = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", 0, v7);
    if (self)
      bindables = self->super._expressables;
    else
      bindables = 0;
    goto LABEL_14;
  }
LABEL_15:

}

@end
