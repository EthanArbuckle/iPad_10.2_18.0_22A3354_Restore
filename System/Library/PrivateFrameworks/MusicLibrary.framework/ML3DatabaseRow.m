@implementation ML3DatabaseRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentResult, 0);
}

- (ML3DatabaseRow)initWithParentResult:(id)a3
{
  id v5;
  ML3DatabaseRow *v6;
  ML3DatabaseRow *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3DatabaseRow;
  v6 = -[ML3DatabaseRow init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentResult, a3);
    -[ML3DatabaseResult _statement](v7->_parentResult, "_statement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_stmt = (sqlite3_stmt *)objc_msgSend(v8, "sqliteStatement");

  }
  return v7;
}

- (int64_t)int64ForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (id)valueForColumnIndex:(unint64_t)a3
{
  int v5;
  void *v6;

  v5 = sqlite3_column_type(self->_stmt, a3);
  if ((v5 - 1) < 2)
  {
    -[ML3DatabaseRow numberForColumnIndex:](self, "numberForColumnIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 5)
  {
    v6 = 0;
  }
  else
  {
    if (v5 == 4)
      -[ML3DatabaseRow dataForColumnIndex:](self, "dataForColumnIndex:", a3);
    else
      -[ML3DatabaseRow stringForColumnIndex:](self, "stringForColumnIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)columnCount
{
  return sqlite3_column_count(self->_stmt);
}

- (id)numberForColumnIndex:(unint64_t)a3
{
  int v3;
  int v5;
  void *v6;

  v3 = a3;
  v5 = sqlite3_column_type(self->_stmt, a3);
  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_stmt, v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_stmt, v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)stringForColumnIndex:(unint64_t)a3
{
  int v3;
  void *v5;

  v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_text(self->_stmt, v3));
  return v5;
}

- (int)intForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_stmt, a3);
}

- (ML3DatabaseRow)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ init] is unsupported. Use -[%@ initWithStatement:] instead."), v4, v4);

  return 0;
}

- (id)dataForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ML3DatabaseRow dataForColumnIndex:](self, "dataForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataForColumnIndex:(unint64_t)a3
{
  int v3;
  void *v5;
  const void *v6;
  size_t v7;
  void *v8;

  v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_blob(self->_stmt, v3);
    v7 = sqlite3_column_bytes(self->_stmt, v3);
    v8 = malloc_type_malloc(v7, 0x8E4EFA43uLL);
    memcpy(v8, v6, v7);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v8, v7);
  }
  return v5;
}

- (double)doubleForColumnName:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[ML3DatabaseRow doubleForColumnIndex:](self, "doubleForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));
  v6 = v5;

  return v6;
}

- (double)doubleForColumnIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (int)intForColumnName:(id)a3
{
  id v4;

  v4 = a3;
  LODWORD(self) = -[ML3DatabaseRow intForColumnIndex:](self, "intForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));

  return (int)self;
}

- (int64_t)int64ForColumnName:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[ML3DatabaseRow int64ForColumnIndex:](self, "int64ForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));

  return v5;
}

- (const)cStringForColumnName:(id)a3
{
  id v4;
  const char *v5;

  v4 = a3;
  v5 = -[ML3DatabaseRow cStringForColumnIndex:](self, "cStringForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));

  return v5;
}

- (const)cStringForColumnIndex:(unint64_t)a3
{
  int v3;

  v3 = a3;
  if (sqlite3_column_type(self->_stmt, a3) == 5)
    return 0;
  else
    return (const char *)sqlite3_column_text(self->_stmt, v3);
}

- (id)stringForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ML3DatabaseRow stringForColumnIndex:](self, "stringForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ML3DatabaseRow numberForColumnIndex:](self, "numberForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5
{
  id v8;

  v8 = a5;
  -[ML3DatabaseRow getBlobBytes:outLength:forColumnIndex:](self, "getBlobBytes:outLength:forColumnIndex:", a3, a4, -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:"));

}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5
{
  int v5;

  v5 = a5;
  if (a3)
    *a3 = sqlite3_column_blob(self->_stmt, a5);
  if (a4)
    *a4 = sqlite3_column_bytes(self->_stmt, v5);
}

- (id)valueForColumnName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ML3DatabaseRow valueForColumnIndex:](self, "valueForColumnIndex:", -[ML3DatabaseResult indexForColumnName:](self->_parentResult, "indexForColumnName:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryRepresentation
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ML3DatabaseRow *v11;

  v3 = -[ML3DatabaseRow columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseResult columnNameIndexMap](self->_parentResult, "columnNameIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ML3DatabaseRow_dictionaryRepresentation__block_invoke;
  v9[3] = &unk_1E5B65250;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = v6;

  return v7;
}

- (id)arrayRepresentation
{
  void *v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = -[ML3DatabaseRow columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      -[ML3DatabaseRow valueForColumnIndex:](self, "valueForColumnIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v2;
      }
      objc_msgSend(v5, "addObject:", v9);
      if (!v8)

      v6 = v7;
    }
    while (v4 > v7++);
  }
  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[ML3DatabaseRow valueForColumnName:](self, "valueForColumnName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ML3DatabaseResult)parentResult
{
  return self->_parentResult;
}

void __42__ML3DatabaseRow_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 40), "valueForColumnIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  if (!v6)

}

@end
