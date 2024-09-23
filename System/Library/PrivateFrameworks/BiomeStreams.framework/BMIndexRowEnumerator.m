@implementation BMIndexRowEnumerator

- (BMIndexRowEnumerator)initWithDatabase:(sqlite3 *)a3 statement:(sqlite3_stmt *)a4 index:(id)a5
{
  id v9;
  BMIndexRowEnumerator *v10;
  BMIndexRowEnumerator *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMIndexRowEnumerator;
  v10 = -[BMIndexRowEnumerator init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_db = a3;
    v10->_stmt = a4;
    objc_storeStrong((id *)&v10->_index, a5);
  }

  return v11;
}

- (id)next
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const void *v14;
  void *error;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  BMIndexRow *v25;
  void *v26;
  void *v27;
  void *v28;
  sqlite3 *db;
  NSError *v30;
  void *v32;
  int v33;

  v4 = sqlite3_step(self->_stmt);
  if ((_DWORD)v4 == 101)
  {
    v25 = 0;
  }
  else
  {
    v5 = v4;
    if ((_DWORD)v4 == 100)
    {
      v6 = sqlite3_column_count(self->_stmt);
      v33 = v6 - 5;
      if ((int)v6 <= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMIndexRow.m"), 76, CFSTR("Invalid column count: %d"), v6);

      }
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)v6);
      if ((int)v6 >= 1)
      {
        v8 = 0;
        do
        {
          v9 = sqlite3_column_type(self->_stmt, v8);
          switch((int)v9)
          {
            case 1:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v8));
              v10 = objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            case 2:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_stmt, v8));
              v10 = objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            case 3:
              v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_text(self->_stmt, v8));
              goto LABEL_14;
            case 4:
              v14 = sqlite3_column_blob(self->_stmt, v8);
              v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v14, sqlite3_column_bytes(self->_stmt, v8));
              goto LABEL_14;
            case 5:
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
              v13 = (void *)v10;
              break;
            default:
              v11 = v9;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMIndexRow.m"), 96, CFSTR("Invalid sqlite type: %d"), v11);

              v13 = 0;
              break;
          }
          objc_msgSend(v7, "addObject:", v13);

          ++v8;
        }
        while ((_DWORD)v6 != v8);
      }
      objc_msgSend(v7, "subarrayWithRange:", 0, v33);
      error = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subarrayWithRange:", v33, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0D024B8]);
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;
      objc_msgSend(v16, "objectAtIndexedSubscript:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v17, "initWithStream:segment:iterationStartTime:offset:", v18, v19, objc_msgSend(v23, "unsignedIntValue"), v22);

      v25 = -[BMIndexRow initWithIndexFields:storeBookmark:]([BMIndexRow alloc], "initWithIndexFields:storeBookmark:", error, v24);
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      -[BMIndex name](self->_index, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Error stepping index search result on %@"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      db = self->_db;
      v7 = objc_retainAutorelease(v28);
      BMSQLDatabaseError(v5, db, (const char *)objc_msgSend(v7, "UTF8String"));
      v30 = (NSError *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      error = self->_error;
      self->_error = v30;
    }

  }
  return v25;
}

- (id)allRows
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[BMIndexRowEnumerator next](self, "next");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);

      -[BMIndexRowEnumerator next](self, "next");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v5);
  }
  return v3;
}

- (id)nextBookmark
{
  void *v2;
  void *v3;

  -[BMIndexRowEnumerator next](self, "next");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeBookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)error
{
  return self->_error;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_finalize(self->_stmt);
  v3.receiver = self;
  v3.super_class = (Class)BMIndexRowEnumerator;
  -[BMIndexRowEnumerator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
