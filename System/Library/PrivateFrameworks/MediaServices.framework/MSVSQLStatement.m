@implementation MSVSQLStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implicitTransaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[MSVSQLStatement invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSVSQLStatement;
  -[MSVSQLStatement dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  sqlite3_stmt *statementHandle;
  _MSVSQLConnection *connection;

  statementHandle = self->_statementHandle;
  if (statementHandle)
  {
    sqlite3_finalize(statementHandle);
    -[MSVSQLDatabaseTransaction commit](self->_implicitTransaction, "commit");
    connection = self->_connection;
    self->_statementHandle = 0;
    self->_connection = 0;

  }
}

- (BOOL)bindJSONValue:(id)a3 toParameterNamed:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  sqlite3_stmt *statementHandle;
  id v12;
  BOOL v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 388, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v12 = objc_retainAutorelease(v10);
  v13 = -[MSVSQLStatement bindJSONValue:toParameterAtIndex:error:](self, "bindJSONValue:toParameterAtIndex:error:", v9, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v12, "UTF8String")), a5);

  return v13;
}

- (BOOL)bindJSONValue:(id)a3 toParameterAtIndex:(int64_t)a4 error:(id *)a5
{
  int v6;
  id v9;
  void *v10;
  void *v11;
  sqlite3_stmt *statementHandle;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v6 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonValue"));

  }
  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 369, CFSTR("Attempt to use invalidated statement."));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a5)
    {
      statementHandle = self->_statementHandle;
      v13 = objc_retainAutorelease(v10);
      sqlite3_bind_text64(statementHandle, v6, (const char *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL, 1u);
    }
    LOBYTE(a5) = v11 != 0;

  }
  else if (a5)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v19 = CFSTR("jsonValue");
    v20[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MSVSQLDatabaseError"), 2, v15, CFSTR("Not valid JSON object: %@"), v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)bindDataValue:(id)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 317, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v9 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindDataValue:toParameterAtIndex:](self, "bindDataValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v9, "UTF8String")));

}

- (void)bindDataValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  id v7;
  sqlite3_stmt *statementHandle;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 311, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v11 = objc_retainAutorelease(v7);
  sqlite3_bind_blob64(statementHandle, v4, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (void)bindStringValue:(id)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 304, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v9 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindStringValue:toParameterAtIndex:](self, "bindStringValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v9, "UTF8String")));

}

- (void)bindStringValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  id v7;
  sqlite3_stmt *statementHandle;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 298, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v11 = objc_retainAutorelease(v7);
  sqlite3_bind_text(statementHandle, v4, (const char *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

- (void)bindUInt64Value:(unint64_t)a3 toParameterNamed:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 339, CFSTR("Attempt to use invalidated statement."));

    v7 = v9;
  }
  -[MSVSQLStatement bindInt64Value:toParameterNamed:](self, "bindInt64Value:toParameterNamed:", a3, v7);

}

- (void)bindInt64Value:(int64_t)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  void *v9;
  id v10;

  v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 280, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v10 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindInt64Value:toParameterAtIndex:](self, "bindInt64Value:toParameterAtIndex:", a3, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v10, "UTF8String")));

}

- (void)bindInt64Value:(int64_t)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  sqlite3_stmt *statementHandle;
  void *v9;

  v4 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 275, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_int64(statementHandle, v4, a3);
}

- (id)description
{
  sqlite3_stmt *statementHandle;
  char *v4;
  uint64_t v6;

  statementHandle = self->_statementHandle;
  if (statementHandle)
  {
    v4 = sqlite3_expanded_sql(statementHandle);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %s"), objc_opt_class(), self, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p INVALIDATED>"), objc_opt_class(), self, v6);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reset
{
  sqlite3_stmt *statementHandle;
  void *v5;

  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 258, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  sqlite3_reset(statementHandle);
  sqlite3_clear_bindings(self->_statementHandle);
}

- (void)bindNullValueToParameterAtIndex:(int64_t)a3
{
  int v3;
  sqlite3_stmt *statementHandle;
  void *v7;

  v3 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 264, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_null(statementHandle, v3);
}

- (void)bindNullValueToParameterNamed:(id)a3
{
  id v5;
  sqlite3_stmt *statementHandle;
  void *v7;
  id v8;

  v5 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 269, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v8 = objc_retainAutorelease(v5);
  -[MSVSQLStatement bindNullValueToParameterAtIndex:](self, "bindNullValueToParameterAtIndex:", sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v8, "UTF8String")));

}

- (void)bindDoubleValue:(double)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  sqlite3_stmt *statementHandle;
  void *v9;

  v4 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 286, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_double(statementHandle, v4, a3);
}

- (void)bindDoubleValue:(double)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  void *v9;
  id v10;

  v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 291, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v10 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindDoubleValue:toParameterAtIndex:](self, "bindDoubleValue:toParameterAtIndex:", sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v10, "UTF8String")), a3);

}

- (void)bindBoolValue:(BOOL)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  _BOOL4 v5;
  sqlite3_stmt *statementHandle;
  void *v9;

  v4 = a4;
  v5 = a3;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 323, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  sqlite3_bind_int(statementHandle, v4, v5);
}

- (void)bindBoolValue:(BOOL)a3 toParameterNamed:(id)a4
{
  _BOOL8 v4;
  id v7;
  sqlite3_stmt *statementHandle;
  void *v9;
  id v10;

  v4 = a3;
  v7 = a4;
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 328, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v10 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindBoolValue:toParameterAtIndex:](self, "bindBoolValue:toParameterAtIndex:", v4, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v10, "UTF8String")));

}

- (void)bindUInt64Value:(unint64_t)a3 toParameterAtIndex:(int64_t)a4
{
  void *v8;

  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 334, CFSTR("Attempt to use invalidated statement."));

  }
  -[MSVSQLStatement bindInt64Value:toParameterAtIndex:](self, "bindInt64Value:toParameterAtIndex:", a3, a4);
}

- (void)bindFloatValue:(float)a3 toParameterAtIndex:(int64_t)a4
{
  void *v8;

  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 344, CFSTR("Attempt to use invalidated statement."));

  }
  -[MSVSQLStatement bindDoubleValue:toParameterAtIndex:](self, "bindDoubleValue:toParameterAtIndex:", a4, a3);
}

- (void)bindFloatValue:(float)a3 toParameterNamed:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 349, CFSTR("Attempt to use invalidated statement."));

    v7 = v9;
  }
  -[MSVSQLStatement bindDoubleValue:toParameterNamed:](self, "bindDoubleValue:toParameterNamed:", v7, a3);

}

- (void)bindDateValue:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  id v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v7 = a3;
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateValue"));

    v7 = 0;
  }
  if (!self->_statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 355, CFSTR("Attempt to use invalidated statement."));

    v7 = v11;
  }
  objc_msgSend(v7, "timeIntervalSince1970");
  sqlite3_bind_double(self->_statementHandle, v4, v8);

}

- (void)bindDateValue:(id)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateValue"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 362, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v9 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindDateValue:toParameterAtIndex:](self, "bindDateValue:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v9, "UTF8String")));

}

- (void)bindFunctionContext:(id)a3 toParameterAtIndex:(int64_t)a4
{
  int v4;
  id v7;
  sqlite3_stmt *statementHandle;
  const char *ClassName;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 397, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v12 = v7;
  ClassName = object_getClassName((id)objc_msgSend(v12, "classForCoder"));
  sqlite3_bind_pointer(statementHandle, v4, v12, ClassName, _MSVSQLBridgeDestroy);

}

- (void)bindFunctionContext:(id)a3 toParameterNamed:(id)a4
{
  id v7;
  sqlite3_stmt *statementHandle;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  statementHandle = self->_statementHandle;
  if (!statementHandle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 403, CFSTR("Attempt to use invalidated statement."));

    statementHandle = self->_statementHandle;
  }
  v9 = objc_retainAutorelease(v7);
  -[MSVSQLStatement bindFunctionContext:toParameterAtIndex:](self, "bindFunctionContext:toParameterAtIndex:", v12, sqlite3_bind_parameter_index(statementHandle, (const char *)objc_msgSend(v9, "UTF8String")));

}

@end
