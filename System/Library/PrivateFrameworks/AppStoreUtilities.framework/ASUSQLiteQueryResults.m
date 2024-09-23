@implementation ASUSQLiteQueryResults

- (id)initWithStatement:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASUSQLiteQueryResults;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4;
  sqlite3_stmt **v5;
  ASUSQLiteStatement *statement;
  ASUSQLiteConnection *v7;
  ASUSQLiteConnection **p_connection;
  ASUSQLiteStatement *v9;
  id v10;
  sqlite3_stmt **v11;
  int v12;
  id v13;
  char v14;
  _QWORD v15[4];
  sqlite3_stmt **v16;
  id v17;
  ASUSQLiteConnection *v18;
  id v19;

  v4 = a3;
  v5 = -[ASUSQLiteCursor initWithStatement:]((sqlite3_stmt **)[ASUSQLiteCursor alloc], self->_statement);
  statement = self->_statement;
  if (statement)
  {
    p_connection = &statement->_connection;
    statement = (ASUSQLiteStatement *)statement->_connection;
    v7 = p_connection[1];
  }
  else
  {
    v7 = 0;
  }
  v9 = statement;
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__ASUSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke;
  v15[3] = &unk_2507A9148;
  v18 = v7;
  v10 = v4;
  v17 = v10;
  v11 = v5;
  v16 = v11;
  if (!v9)
  {

    v13 = 0;
    goto LABEL_8;
  }
  v12 = -[ASUSQLiteConnection _executeWithError:usingBlock:]((uint64_t)v9, &v19, v15);
  v13 = v19;

  if (!v12)
  {
LABEL_8:
    v14 = 0;
    (*((void (**)(id, _QWORD, id, char *))v10 + 2))(v10, 0, v13, &v14);
    goto LABEL_9;
  }
  -[ASUSQLiteStatement reset](self->_statement, "reset");
LABEL_9:

}

uint64_t __49__ASUSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
  if (v2 == 100)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
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
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__ASUSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_2507A9170;
  v4[4] = &v5;
  -[ASUSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__ASUSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__ASUSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_2507A9170;
  v4[4] = &v5;
  -[ASUSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __41__ASUSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__ASUSQLiteQueryResults_hasRows__block_invoke;
  v4[3] = &unk_2507A9170;
  v4[4] = &v5;
  -[ASUSQLiteQueryResults enumerateRowsUsingBlock:](self, "enumerateRowsUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__ASUSQLiteQueryResults_hasRows__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindArray:atPosition:](self->_statement, "bindArray:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindData:atPosition:](self->_statement, "bindData:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindDataCopy:atPosition:](self->_statement, "bindDataCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindDate:atPosition:](self->_statement, "bindDate:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindDictionary:atPosition:](self->_statement, "bindDictionary:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindDouble:atPosition:](self->_statement, "bindDouble:atPosition:", *(_QWORD *)&a4, a3);
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindFloat:atPosition:](self->_statement, "bindFloat:atPosition:", *(_QWORD *)&a4);
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindInt:atPosition:](self->_statement, "bindInt:atPosition:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindInt64:atPosition:](self->_statement, "bindInt64:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindNullAtPosition:(int)a3
{
  -[ASUSQLiteStatement bindNullAtPosition:](self->_statement, "bindNullAtPosition:", *(_QWORD *)&a3);
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindNumber:atPosition:](self->_statement, "bindNumber:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindString:atPosition:](self->_statement, "bindString:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindStringCopy:atPosition:](self->_statement, "bindStringCopy:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindUUID:atPosition:](self->_statement, "bindUUID:atPosition:", a3, *(_QWORD *)&a4);
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
  -[ASUSQLiteStatement bindURL:atPosition:](self->_statement, "bindURL:atPosition:", a3, *(_QWORD *)&a4);
}

- (int)clearBindings
{
  return -[ASUSQLiteStatement clearBindings](self->_statement, "clearBindings");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
}

@end
