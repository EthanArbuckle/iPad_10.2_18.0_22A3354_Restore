@implementation MSVSQLRowEnumerator

- (id)nextObject
{
  return -[MSVSQLRowEnumerator nextObjectWithError:](self, "nextObjectWithError:", 0);
}

- (unint64_t)uint64ValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_int64(statementHandle, a3);
}

- (id)jsonValueAtColumnIndex:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[MSVSQLRowEnumerator jsonDataAtColumnIndex:](self, "jsonDataAtColumnIndex:", a3);
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

- (id)dataValueAtColumnIndex:(int64_t)a3
{
  int v3;
  void *v5;
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  const void *v8;
  MSVSQLStatement *v9;
  sqlite3_stmt *v10;

  v3 = a3;
  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    statement = self->_statement;
    if (statement)
      statementHandle = statement->_statementHandle;
    else
      statementHandle = 0;
    v8 = sqlite3_column_blob(statementHandle, v3);
    v9 = self->_statement;
    if (v9)
      v10 = v9->_statementHandle;
    else
      v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, sqlite3_column_bytes(v10, v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)jsonDataAtColumnIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    -[MSVSQLRowEnumerator stringValueAtColumnIndex:](self, "stringValueAtColumnIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)stringValueAtColumnIndex:(int64_t)a3
{
  int v3;
  void *v5;
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  const unsigned __int8 *v8;
  MSVSQLStatement *v9;
  sqlite3_stmt *v10;

  v3 = a3;
  if (-[MSVSQLRowEnumerator isNullValueAtColumnIndex:](self, "isNullValueAtColumnIndex:"))
  {
    v5 = 0;
  }
  else
  {
    statement = self->_statement;
    if (statement)
      statementHandle = statement->_statementHandle;
    else
      statementHandle = 0;
    v8 = sqlite3_column_text(statementHandle, v3);
    v9 = self->_statement;
    if (v9)
      v10 = v9->_statementHandle;
    else
      v10 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v8, sqlite3_column_bytes(v10, v3), 4);
  }
  return v5;
}

- (BOOL)isNullValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_type(statementHandle, a3) == 5;
}

- (id)nextObjectWithError:(id *)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  int v7;
  MSVSQLRowEnumerator *v8;
  MSVSQLStatement *v9;
  sqlite3 **v10;
  id v11;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  v7 = sqlite3_step(statementHandle);
  if (v7 == 101)
    goto LABEL_10;
  if (v7 == 100)
  {
    v8 = self;
    return v8;
  }
  if (!a3)
  {
LABEL_10:
    v8 = 0;
    return v8;
  }
  v9 = self->_statement;
  if (v9)
    v9 = (MSVSQLStatement *)v9->_connection;
  v10 = v9;
  -[_MSVSQLConnection lastError](v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  *a3 = v11;
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
}

- (id)initWithStatement:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)MSVSQLRowEnumerator;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (int64_t)columnCount
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_count(statementHandle);
}

- (id)columnNameAtIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(statementHandle, a3));
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  const char *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSVSQLRowEnumerator;
  -[MSVSQLRowEnumerator description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 1);
  v5 = -[MSVSQLRowEnumerator columnCount](self, "columnCount");
  objc_msgSend(v4, "appendString:", CFSTR(" currentRow: (\n"));
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      statement = self->_statement;
      if (statement)
        statementHandle = statement->_statementHandle;
      else
        statementHandle = 0;
      v9 = sqlite3_column_name(statementHandle, i);
      -[MSVSQLRowEnumerator objectValueAtColumnIndex:](self, "objectValueAtColumnIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("    %s : %@ \n"), v9, v10);

    }
  }
  objc_msgSend(v4, "appendString:", CFSTR(")>"));
  return (NSString *)v4;
}

- (BOOL)BOOLValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_int(statementHandle, a3) != 0;
}

- (id)dateValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  v7 = sqlite3_column_type(statementHandle, a3);
  if ((v7 - 1) >= 2)
  {
    if (v7 == 3)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      -[MSVSQLRowEnumerator stringValueAtColumnIndex:](self, "stringValueAtColumnIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateFromString:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    -[MSVSQLRowEnumerator doubleValueAtColumnIndex:](self, "doubleValueAtColumnIndex:", a3);
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (double)doubleValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_double(statementHandle, a3);
}

- (float)floatValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_double(statementHandle, a3);
}

- (int64_t)int64ValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  return sqlite3_column_int64(statementHandle, a3);
}

- (id)objectValueAtColumnIndex:(int64_t)a3
{
  MSVSQLStatement *statement;
  sqlite3_stmt *statementHandle;
  void *v7;
  void *v8;

  statement = self->_statement;
  if (statement)
    statementHandle = statement->_statementHandle;
  else
    statementHandle = 0;
  switch(sqlite3_column_type(statementHandle, a3))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MSVSQLRowEnumerator int64ValueAtColumnIndex:](self, "int64ValueAtColumnIndex:", a3));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[MSVSQLRowEnumerator doubleValueAtColumnIndex:](self, "doubleValueAtColumnIndex:", a3);
      objc_msgSend(v8, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[MSVSQLRowEnumerator stringValueAtColumnIndex:](self, "stringValueAtColumnIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[MSVSQLRowEnumerator dataValueAtColumnIndex:](self, "dataValueAtColumnIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)markdownTableRow
{
  void *v3;
  void *v4;

  -[MSVSQLRowEnumerator _markdownTable](self, "_markdownTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVSQLRowEnumerator _addRow:toTable:](self, "_addRow:toTable:", self, v3);
  objc_msgSend(v3, "renderMarkdownWithOptions:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)markdownTableHeader
{
  void *v2;
  void *v3;

  -[MSVSQLRowEnumerator _markdownTable](self, "_markdownTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderMarkdownWithOptions:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)markdownTable
{
  void *v3;
  MSVSQLRowEnumerator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MSVSQLRowEnumerator _markdownTable](self, "_markdownTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self;
  v5 = -[MSVSQLRowEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[MSVSQLRowEnumerator _addRow:toTable:](v4, "_addRow:toTable:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), v3, (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[MSVSQLRowEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "renderMarkdownWithOptions:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_markdownTable
{
  uint64_t v3;
  MSVMarkdownTable *v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[MSVSQLRowEnumerator columnCount](self, "columnCount");
  v4 = objc_alloc_init(MSVMarkdownTable);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[MSVSQLRowEnumerator columnNameAtIndex:](self, "columnNameAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSVMarkdownTable escapedString:](MSVMarkdownTable, "escapedString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVMarkdownTable addColumnWithHeader:](v4, "addColumnWithHeader:", v7);

    }
  }
  return v4;
}

- (void)_addRow:(id)a3 toTable:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a4;
  v5 = -[MSVSQLRowEnumerator columnCount](self, "columnCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[MSVSQLRowEnumerator objectValueAtColumnIndex:](self, "objectValueAtColumnIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = CFSTR("<null>");
      objc_msgSend(v6, "addObject:", v11);

    }
  }
  objc_msgSend(v12, "addRow:", v6);

}

@end
