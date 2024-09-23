@implementation HMBSQLQueryStatement

- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5 arguments:(id)a6
{
  id v11;
  HMBSQLQueryStatement *v12;
  HMBSQLQueryStatement *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMBSQLQueryStatement;
  v12 = -[HMBSQLStatement initWithContext:statement:queryPlans:](&v15, sel_initWithContext_statement_queryPlans_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_arguments, a6);

  return v13;
}

- (HMBSQLQueryStatement)initWithContext:(id)a3 statement:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  sqlite3_stmt *v9;
  void *v10;
  uint64_t i;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  HMBSQLQueryStatement *v16;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "sqlStatementForContext:statement:", v6, v7);
  if (v8)
  {
    v9 = (sqlite3_stmt *)v8;
    objc_msgSend((id)objc_opt_class(), "queryPlansForContext:statement:", v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; (int)i <= sqlite3_bind_parameter_count(v9); i = (i + 1))
    {
      v12 = sqlite3_bind_parameter_name(v9, i);
      if (v12)
      {
        v13 = v12;
        if (*v12 != 63)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v14, v15);

        }
      }
    }
    self = -[HMBSQLQueryStatement initWithContext:statement:queryPlans:arguments:](self, "initWithContext:statement:queryPlans:arguments:", v6, v9, v18, v10);

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
