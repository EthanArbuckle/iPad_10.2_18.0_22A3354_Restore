@implementation _MSVSQLDatabaseFunctionContext

- (sqlite3_value)_valueAtIndex:(int64_t)a3
{
  void *v7;

  if (-[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 782, CFSTR("argument index out of bounds: %d/%d"), a3, -[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments"));

  }
  return self->_argv[a3];
}

- (int64_t)numberOfArguments
{
  return self->_argc;
}

- (BOOL)isNullValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_type(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3)) == 5;
}

- (int64_t)int64ValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_int64(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3));
}

- (double)doubleValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_double(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3));
}

- (id)stringValueAtArgumentIndex:(int64_t)a3
{
  void *v5;
  sqlite3_value *v6;
  const unsigned __int8 *v7;

  if (-[_MSVSQLDatabaseFunctionContext isNullValueAtArgumentIndex:](self, "isNullValueAtArgumentIndex:"))
  {
    v5 = 0;
  }
  else
  {
    v6 = -[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3);
    v7 = sqlite3_value_text(v6);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7, sqlite3_value_bytes(v6), 4);
  }
  return v5;
}

- (id)dataValueAtArgumentIndex:(int64_t)a3
{
  sqlite3_value *v3;
  const void *v4;

  v3 = -[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3);
  v4 = sqlite3_value_blob(v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, sqlite3_value_bytes(v3));
}

- (BOOL)BOOLValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_int(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3)) != 0;
}

- (unint64_t)uint64ValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_int64(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3));
}

- (float)floatValueAtArgumentIndex:(int64_t)a3
{
  return sqlite3_value_double(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a3));
}

- (id)dateValueAtArgumentIndex:(int64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = sqlite3_value_type(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:"));
  if ((v5 - 1) >= 2)
  {
    if (v5 == 3)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      -[_MSVSQLDatabaseFunctionContext stringValueAtArgumentIndex:](self, "stringValueAtArgumentIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateFromString:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[_MSVSQLDatabaseFunctionContext doubleValueAtArgumentIndex:](self, "doubleValueAtArgumentIndex:", a3);
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)jsonValueAtArgumentIndex:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[_MSVSQLDatabaseFunctionContext jsonDataAtArgumentIndex:](self, "jsonDataAtArgumentIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)jsonDataAtArgumentIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[_MSVSQLDatabaseFunctionContext isNullValueAtArgumentIndex:](self, "isNullValueAtArgumentIndex:"))
  {
    v5 = 0;
  }
  else
  {
    -[_MSVSQLDatabaseFunctionContext stringValueAtArgumentIndex:](self, "stringValueAtArgumentIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)objectValueAtArgumentIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  switch(sqlite3_value_type(-[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:")))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_MSVSQLDatabaseFunctionContext int64ValueAtArgumentIndex:](self, "int64ValueAtArgumentIndex:", a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v6 = (void *)MEMORY[0x1E0CB37E8];
      -[_MSVSQLDatabaseFunctionContext doubleValueAtArgumentIndex:](self, "doubleValueAtArgumentIndex:", a3);
      objc_msgSend(v6, "numberWithDouble:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[_MSVSQLDatabaseFunctionContext stringValueAtArgumentIndex:](self, "stringValueAtArgumentIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[_MSVSQLDatabaseFunctionContext dataValueAtArgumentIndex:](self, "dataValueAtArgumentIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)functionContextOfClass:(Class)a3 atArgumentIndex:(int64_t)a4
{
  sqlite3_value *v5;
  const char *ClassName;

  v5 = -[_MSVSQLDatabaseFunctionContext _valueAtIndex:](self, "_valueAtIndex:", a4);
  ClassName = object_getClassName(a3);
  return sqlite3_value_pointer(v5, ClassName);
}

- (void)memoizeObject:(id)a3 forArgumentIndex:(int64_t)a4
{
  id v7;
  void *v8;

  v7 = a3;
  if (-[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 906, CFSTR("argument index out of bounds: %d/%d"), a4, -[_MSVSQLDatabaseFunctionContext numberOfArguments](self, "numberOfArguments"));

  }
  sqlite3_set_auxdata(self->_context, a4, v7, _MSVSQLBridgeDestroy);
}

- (id)memoizedObjectForArgumentIndex:(int64_t)a3
{
  return sqlite3_get_auxdata(self->_context, a3);
}

- (id)returnNull
{
  sqlite3_result_null(self->_context);
  return self;
}

- (id)returnInt64:(int64_t)a3
{
  sqlite3_result_int64(self->_context, a3);
  return self;
}

- (id)returnDouble:(double)a3
{
  sqlite3_result_double(self->_context, a3);
  return self;
}

- (id)returnString:(id)a3
{
  sqlite3_context *context;
  id v5;
  const char *v6;
  int v7;

  context = self->_context;
  v5 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = objc_msgSend(v5, "length");

  sqlite3_result_text(context, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return self;
}

- (id)returnData:(id)a3
{
  sqlite3_context *context;
  id v5;
  const void *v6;
  int v7;

  context = self->_context;
  v5 = objc_retainAutorelease(a3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  sqlite3_result_blob64(context, v6, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return self;
}

- (id)returnBool:(BOOL)a3
{
  sqlite3_result_int(self->_context, a3);
  return self;
}

- (id)returnFloat:(float)a3
{
  return -[_MSVSQLDatabaseFunctionContext returnDouble:](self, "returnDouble:", a3);
}

- (id)returnDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  return -[_MSVSQLDatabaseFunctionContext returnDouble:](self, "returnDouble:");
}

- (id)returnJSON:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  sqlite3_context *context;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v6) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
    {
      context = self->_context;
      v10 = objc_retainAutorelease(v7);
      sqlite3_result_text64(context, (const char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL, 1u);
    }
    else
    {
      self = 0;
    }
    a4 = self;

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("jsonValue");
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MSVSQLDatabaseError"), 2, v12, CFSTR("Not valid JSON object: %@"), v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)returnFunctionContext:(id)a3
{
  id v4;
  sqlite3_context *context;
  id v6;
  const char *ClassName;

  v4 = a3;
  context = self->_context;
  v6 = v4;
  ClassName = object_getClassName((id)objc_msgSend(v6, "classForCoder"));
  sqlite3_result_pointer(context, v6, ClassName, _MSVSQLBridgeDestroy);

  return self;
}

- (id)returnErrorTooBig
{
  sqlite3_result_error_toobig(self->_context);
  return self;
}

- (id)returnErrorNoMemory
{
  sqlite3_result_error_nomem(self->_context);
  return self;
}

- (id)returnError:(id)a3
{
  return -[_MSVSQLDatabaseFunctionContext returnError:sqliteCode:](self, "returnError:sqliteCode:", a3, 1);
}

- (id)returnError:(id)a3 sqliteCode:(int)a4
{
  void *v6;
  sqlite3_context *context;
  id v8;

  objc_msgSend(a3, "msv_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v8 = objc_retainAutorelease(v6);
  sqlite3_result_error(context, (const char *)objc_msgSend(v8, "UTF8String"), objc_msgSend(v8, "length"));
  sqlite3_result_error_code(self->_context, a4);

  return self;
}

@end
