@implementation AMSSQLiteQueryResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindString:atPosition:](self->_statement, "bindString:atPosition:", a3, *(_QWORD *)&a4);
}

uint64_t __49__AMSSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
  if (v2 == 100)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return v2;
}

- (AMSSQLiteQueryResults)initWithStatement:(id)a3
{
  id v5;
  AMSSQLiteQueryResults *v6;
  AMSSQLiteQueryResults *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteQueryResults;
  v6 = -[AMSSQLiteQueryResults init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statement, a3);

  return v7;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4;
  AMSSQLiteCursor *v5;
  sqlite3_stmt *v6;
  void *v7;
  id v8;
  AMSSQLiteCursor *v9;
  int v10;
  id v11;
  char v12;
  _QWORD v13[4];
  AMSSQLiteCursor *v14;
  id v15;
  sqlite3_stmt *v16;
  id v17;

  v4 = a3;
  v5 = -[AMSSQLiteCursor initWithStatement:]([AMSSQLiteCursor alloc], "initWithStatement:", self->_statement);
  v6 = -[AMSSQLiteStatement sqlite3_stmt](self->_statement, "sqlite3_stmt");
  -[AMSSQLiteStatement connection](self->_statement, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__AMSSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke;
  v13[3] = &unk_1E2545DA8;
  v16 = v6;
  v8 = v4;
  v15 = v8;
  v9 = v5;
  v14 = v9;
  v10 = objc_msgSend(v7, "executeWithError:usingBlock:", &v17, v13);
  v11 = v17;

  if (v10)
  {
    -[AMSSQLiteStatement reset](self->_statement, "reset");
  }
  else
  {
    v12 = 0;
    (*((void (**)(id, _QWORD, id, char *))v8 + 2))(v8, 0, v11, &v12);
  }

}

uint64_t __32__AMSSQLiteQueryResults_hasRows__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

uint64_t __40__AMSSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (a2)
  {
    v5 = result;
    result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

- (BOOL)hasRows
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__AMSSQLiteQueryResults_hasRows__block_invoke;
  v4[3] = &unk_1E2545D58;
  v4[4] = &v5;
  -[AMSSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)firstInt64Value
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__AMSSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_1E2545D58;
  v4[4] = &v5;
  -[AMSSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindFloat:atPosition:](self->_statement, "bindFloat:atPosition:", *(_QWORD *)&a4);
}

- (NSNumber)firstNumberValue
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__64;
  v9 = __Block_byref_object_dispose__64;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AMSSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_1E2545D58;
  v4[4] = &v5;
  -[AMSSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __41__AMSSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2)
  {
    objc_msgSend(a2, "numberForColumnIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindArray:atPosition:](self->_statement, "bindArray:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindData:atPosition:](self->_statement, "bindData:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindDataCopy:atPosition:](self->_statement, "bindDataCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindDate:atPosition:](self->_statement, "bindDate:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindDictionary:atPosition:](self->_statement, "bindDictionary:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindDouble:atPosition:](self->_statement, "bindDouble:atPosition:", *(_QWORD *)&a4, a3);
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindInt:atPosition:](self->_statement, "bindInt:atPosition:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindInt64:atPosition:](self->_statement, "bindInt64:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindNullAtPosition:(int)a3
{
  -[AMSSQLiteStatement bindNullAtPosition:](self->_statement, "bindNullAtPosition:", *(_QWORD *)&a3);
}

- (void)bindNullableString:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindNullableString:atPosition:](self->_statement, "bindNullableString:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindNumber:atPosition:](self->_statement, "bindNumber:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindStringCopy:atPosition:](self->_statement, "bindStringCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
  -[AMSSQLiteStatement bindURL:atPosition:](self->_statement, "bindURL:atPosition:", a3, *(_QWORD *)&a4);
}

- (int)clearBindings
{
  return -[AMSSQLiteStatement clearBindings](self->_statement, "clearBindings");
}

@end
