@implementation ASUSQLiteCursor

- (sqlite3_stmt)initWithStatement:(sqlite3_stmt *)a1
{
  _QWORD *v4;
  id *v5;
  void *v6;
  int v7;
  uint64_t v8;
  sqlite3_stmt *v9;
  uint64_t i;
  sqlite3_stmt *v11;
  void *v12;
  const char *v13;
  const char *v14;
  int v15;
  sqlite3_stmt *v16;
  char v17;
  objc_super v19;

  v4 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)ASUSQLiteCursor;
    v5 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = (sqlite3_stmt **)v5;
    if (v5)
    {
      v6 = v4 ? (void *)v4[2] : 0;
      v5[6] = v6;
      objc_storeStrong(v5 + 7, a2);
      v7 = sqlite3_column_count(a1[6]);
      *((_DWORD *)a1 + 2) = v7;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[5];
      a1[5] = (sqlite3_stmt *)v8;

      a1[2] = (sqlite3_stmt *)malloc_type_calloc(*((int *)a1 + 2), 1uLL, 0x100004077774924uLL);
      if (*((int *)a1 + 2) >= 1)
      {
        for (i = 0; i < *((int *)a1 + 2); ++i)
        {
          v11 = a1[5];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_column_name(a1[6], i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[sqlite3_stmt addObject:](v11, "addObject:", v12);

          v13 = sqlite3_column_decltype(a1[6], i);
          if (v13)
          {
            v14 = v13;
            if (!strcmp(v13, "DATETIME"))
            {
              *((_BYTE *)a1[2] + i) = 1;
              continue;
            }
            if (!strcmp(v14, "JSON"))
            {
              v16 = a1[2];
              v17 = 2;
              goto LABEL_20;
            }
            if (!strcmp(v14, "UUID"))
            {
              v16 = a1[2];
              v17 = 3;
              goto LABEL_20;
            }
            if (!strcmp(v14, "URL"))
            {
              v16 = a1[2];
              v17 = 4;
              goto LABEL_20;
            }
            v15 = strcmp(v14, "STRING");
            v16 = a1[2];
            if (!v15)
            {
              v17 = 5;
LABEL_20:
              *((_BYTE *)v16 + i) = v17;
              continue;
            }
          }
          else
          {
            v16 = a1[2];
          }
          *((_BYTE *)v16 + i) = 0;
        }
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_columnDeclaredTypes);
  v3.receiver = self;
  v3.super_class = (Class)ASUSQLiteCursor;
  -[ASUSQLiteCursor dealloc](&v3, sel_dealloc);
}

- (id)dataForColumnIndex:(int)a3
{
  void *v5;
  const void *v6;

  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_statement, a3);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, sqlite3_column_bytes(self->_statement, a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)dataForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor dataForColumnIndex:](self, "dataForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dateForColumnIndex:(int)a3
{
  int v5;
  void *v6;
  double v7;
  void *v8;

  v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    v7 = (double)sqlite3_column_int64(self->_statement, a3);
  }
  else
  {
    if (v5 != 2)
    {
      v8 = 0;
      return v8;
    }
    v6 = (void *)MEMORY[0x24BDBCE60];
    v7 = sqlite3_column_double(self->_statement, a3);
  }
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)dateForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor dateForColumnIndex:](self, "dateForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)doubleForColumnIndex:(int)a3
{
  return sqlite3_column_double(self->_statement, a3);
}

- (double)doubleForColumnName:(id)a3
{
  id v4;
  int v5;
  double v6;

  v4 = a3;
  if (self)
  {
    v5 = -[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4);
    if (v5 < 0)
    {
      v6 = 0.0;
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = sqlite3_column_double(self->_statement, v5);
LABEL_5:

  return v6;
}

- (int)intForColumnIndex:(int)a3
{
  return sqlite3_column_int(self->_statement, a3);
}

- (int)intForColumnName:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  if (self)
  {
    v5 = -[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4);
    if (v5 < 0)
    {
      v6 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = sqlite3_column_int(self->_statement, v5);
LABEL_5:

  return v6;
}

- (int64_t)int64ForColumnIndex:(int)a3
{
  return sqlite3_column_int64(self->_statement, a3);
}

- (int64_t)int64ForColumnName:(id)a3
{
  id v4;
  int v5;
  sqlite3_int64 v6;

  v4 = a3;
  if (self)
  {
    v5 = -[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4);
    if (v5 < 0)
    {
      v6 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = sqlite3_column_int64(self->_statement, v5);
LABEL_5:

  return v6;
}

- (id)numberForColumnIndex:(int)a3
{
  int v5;
  void *v6;

  v5 = sqlite3_column_type(self->_statement, a3);
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_column_int64(self->_statement, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(self->_statement, a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)numberForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor numberForColumnIndex:](self, "numberForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)numberOfColumns
{
  return sqlite3_column_count(self->_statement);
}

- (id)stringForColumnIndex:(int)a3
{
  void *v5;

  if (sqlite3_column_type(self->_statement, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sqlite3_column_text(self->_statement, a3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)stringForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)UUIDForColumnIndex:(int)a3
{
  void *v3;
  void *v4;

  -[ASUSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)UUIDForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor UUIDForColumnIndex:](self, "UUIDForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)URLForColumnIndex:(int)a3
{
  void *v3;
  void *v4;

  -[ASUSQLiteCursor stringForColumnIndex:](self, "stringForColumnIndex:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)URLForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self && (-[NSMutableArray indexOfObject:](self->_columnNames, "indexOfObject:", v4) & 0x80000000) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[ASUSQLiteCursor URLForColumnIndex:](self, "URLForColumnIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dictionaryWithValuesForColumns
{
  return -[ASUSQLiteCursor dictionaryWithValuesForColumnNames:](self, "dictionaryWithValuesForColumnNames:", 0);
}

- (id)dictionaryWithValuesForColumnNames:(id)a3
{
  id v4;
  id columnKeySet;
  void *v6;
  id v7;
  void *v8;
  NSMutableArray *columnNames;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  ASUSQLiteCursor *v17;

  v4 = a3;
  columnKeySet = self->_columnKeySet;
  if (!columnKeySet)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "sharedKeySetForKeys:", self->_columnNames);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_columnKeySet;
    self->_columnKeySet = v6;

    columnKeySet = self->_columnKeySet;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithSharedKeySet:", columnKeySet);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  columnNames = self->_columnNames;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__ASUSQLiteCursor_dictionaryWithValuesForColumnNames___block_invoke;
  v14[3] = &unk_2507A9198;
  v15 = v4;
  v16 = v8;
  v17 = self;
  v10 = v8;
  v11 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](columnNames, "enumerateObjectsUsingBlock:", v14);
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

void __54__ASUSQLiteCursor_dictionaryWithValuesForColumnNames___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  if (!v5 || objc_msgSend(v5, "containsObject:", v7))
  {
    ASUSQLiteCopyFoundationValue(*(void **)(a1 + 48), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementWrapper, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong(&self->_columnKeySet, 0);
  objc_storeStrong((id *)&self->_columnIndexByName, 0);
}

@end
