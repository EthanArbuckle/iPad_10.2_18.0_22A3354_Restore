@implementation BSSqliteResultRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
}

- (void)invalidate
{
  self->_statement = 0;
}

+ (_QWORD)resultRowWithStatement:(uint64_t)a1
{
  objc_class *v3;
  _QWORD *v4;
  void *v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_self();
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_resultRowWithStatement_, v3, CFSTR("BSSqliteResultRow.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statement"));

  }
  v4 = [v3 alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)BSSqliteResultRow;
    v4 = objc_msgSendSuper2(&v7, sel_init);
    if (v4)
      v4[1] = a2;
  }
  return v4;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v7;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 75, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow objectAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    v5 = 0;
  }
  else
  {
    switch(sqlite3_column_type(self->_statement, a3))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BSSqliteResultRow integerAtIndex:](self, "integerAtIndex:", a3));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        v7 = (void *)MEMORY[0x1E0CB37E8];
        -[BSSqliteResultRow doubleAtIndex:](self, "doubleAtIndex:", a3);
        objc_msgSend(v7, "numberWithDouble:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        -[BSSqliteResultRow stringAtIndex:](self, "stringAtIndex:", a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        -[BSSqliteResultRow dataAtIndex:](self, "dataAtIndex:", a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
  }
  return v5;
}

- (id)dataAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 140, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow dataAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_bytes(self->_statement, a3);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", sqlite3_column_blob(self->_statement, a3), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  void *v7;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 102, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow integerAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return sqlite3_column_int64(self->_statement, a3);
}

- (BSSqliteResultRow)init
{
  void *v4;
  BSSqliteResultRow *result;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 32, CFSTR("init is not allowed"));

  if (!self)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BSSqliteResultRow;
  result = -[BSSqliteResultRow init](&v6, sel_init);
  if (result)
    result->_statement = 0;
  return result;
}

- (BOOL)isValid
{
  return self->_statement != 0;
}

- (unint64_t)count
{
  sqlite3_stmt *statement;
  void *v6;

  statement = self->_statement;
  if (!statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 61, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow count]");

    statement = self->_statement;
  }
  return sqlite3_column_count(statement);
}

- (id)keyAtIndex:(unint64_t)a3
{
  int v3;
  sqlite3_stmt *statement;
  void *v8;

  v3 = a3;
  statement = self->_statement;
  if (!statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 66, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow keyAtIndex:]");

    statement = self->_statement;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_name(statement, v3));
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSSqliteResultRow objectAtIndex:](self, "objectAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_QWORD)_indexForKey:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[2];
    if (!v4)
    {
      v5 = objc_msgSend(a1, "count");
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      if (v5)
      {
        for (i = 0; i != v5; ++i)
        {
          objc_msgSend(a1, "keyAtIndex:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v8);

        }
      }
      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

      v4 = (void *)a1[2];
    }
    v11 = v4;
    a1 = (_QWORD *)objc_msgSend(v11, "indexOfObject:", v3);

  }
  return a1;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[BSSqliteResultRow integerAtIndex:](self, "integerAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));

  return v5;
}

- (double)doubleForKey:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[BSSqliteResultRow doubleAtIndex:](self, "doubleAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));
  v6 = v5;

  return v6;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  void *v7;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 114, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow doubleAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  else
    return sqlite3_column_double(self->_statement, a3);
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSSqliteResultRow stringAtIndex:](self, "stringAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v9;

  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSqliteResultRow.m"), 126, CFSTR("cannot call %s after the row has become invalid"), "-[BSSqliteResultRow stringAtIndex:]");

  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = sqlite3_column_bytes(self->_statement, a3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", sqlite3_column_text(self->_statement, a3), v6, 4);
  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSSqliteResultRow dataAtIndex:](self, "dataAtIndex:", -[BSSqliteResultRow _indexForKey:](self, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BSSqliteFrozenResultRow *v4;
  BSSqliteResultRow *v5;
  BSSqliteResultRow *v6;
  BSSqliteResultRow *v7;
  BSSqliteResultRow *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  sqlite3_stmt *statement;
  uint64_t v23;
  NSArray *columnNames;
  uint64_t v25;
  Class isa;
  uint64_t v27;
  sqlite3_stmt *v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  Class v32;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v4 = +[_BSSqliteFrozenResultRow allocWithZone:](_BSSqliteFrozenResultRow, "allocWithZone:", a3);
  v5 = self;
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithResultRow_, v4, CFSTR("BSSqliteResultRow.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultRow"));

    }
    v37.receiver = v4;
    v37.super_class = (Class)BSSqliteResultRow;
    v7 = -[BSSqliteResultRow init](&v37, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_statement = 0;
      v7[1].super.isa = (Class)-[BSSqliteResultRow count](v6, "count");
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8[1].super.isa);
      if (v8[1].super.isa)
      {
        v13 = 0;
        do
        {
          -[BSSqliteResultRow keyAtIndex:](v6, "keyAtIndex:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v14);

          -[BSSqliteResultRow objectAtIndex:](v6, "objectAtIndex:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v15);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BSSqliteResultRow integerAtIndex:](v6, "integerAtIndex:", v13));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          v17 = (void *)MEMORY[0x1E0CB37E8];
          -[BSSqliteResultRow doubleAtIndex:](v6, "doubleAtIndex:", v13);
          objc_msgSend(v17, "numberWithDouble:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

          -[BSSqliteResultRow stringAtIndex:](v6, "stringAtIndex:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

          -[BSSqliteResultRow dataAtIndex:](v6, "dataAtIndex:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

          v13 = (objc_class *)((char *)v13 + 1);
        }
        while (v13 < v8[1].super.isa);
      }
      v21 = objc_msgSend(v36, "copy");
      statement = v8[1]._statement;
      v8[1]._statement = (sqlite3_stmt *)v21;

      v23 = objc_msgSend(v35, "copy");
      columnNames = v8[1]._columnNames;
      v8[1]._columnNames = (NSArray *)v23;

      v25 = objc_msgSend(v9, "copy");
      isa = v8[2].super.isa;
      v8[2].super.isa = (Class)v25;

      v27 = objc_msgSend(v10, "copy");
      v28 = v8[2]._statement;
      v8[2]._statement = (sqlite3_stmt *)v27;

      v29 = objc_msgSend(v11, "copy");
      v30 = v8[2]._columnNames;
      v8[2]._columnNames = (NSArray *)v29;

      v31 = objc_msgSend(v12, "copy");
      v32 = v8[3].super.isa;
      v8[3].super.isa = (Class)v31;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
