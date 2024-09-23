@implementation CRSQLRow

+ (int)enumerateRowsInStatement:(sqlite3_stmt *)a3 usingBlock:(id)a4
{
  int v7;
  void *v8;
  int v9;

  v7 = objc_msgSend(a1, "step:");
  if (v7 == 100)
  {
    do
    {
      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatement:", a3);
      (*((void (**)(id, void *))a4 + 2))(a4, v8);

      v9 = objc_msgSend(a1, "step:", a3);
    }
    while (v9 == 100);
    v7 = v9;
  }
  sqlite3_reset(a3);
  return v7;
}

+ (int)step:(sqlite3_stmt *)a3
{
  int result;

  do
    result = sqlite3_step(a3);
  while (result - 7 > 0xFFFFFFFD);
  return result;
}

+ (id)rowWithStatement:(sqlite3_stmt *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStatement:", a3);
}

- (CRSQLRow)initWithStatement:(sqlite3_stmt *)a3
{
  CRSQLRow *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRSQLRow;
  result = -[CRSQLRow init](&v5, sel_init);
  if (result)
    result->_stmt = a3;
  return result;
}

- (id)stringAtIndex:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "stringAtIndex:statement:", *(_QWORD *)&a3, self->_stmt);
}

- (id)objectAtIndex:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "objectAtIndex:statement:", *(_QWORD *)&a3, self->_stmt);
}

- (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "dataAtIndex:copyBytes:statement:", *(_QWORD *)&a3, a4, self->_stmt);
}

- (id)numberWithIntegerAtIndex:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "numberWithIntegerAtIndex:statement:", *(_QWORD *)&a3, self->_stmt);
}

- (id)numberWithDoubleAtIndex:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "numberWithDoubleAtIndex:statement:", *(_QWORD *)&a3, self->_stmt);
}

+ (id)stringAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  const unsigned __int8 *v4;

  if (a3 < 0)
    return 0;
  v4 = sqlite3_column_text(a4, a3);
  if (!v4)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
}

+ (id)objectAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "dataAtIndex:copyBytes:statement:", *(_QWORD *)&a3, 0, a4);
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
}

+ (id)dataAtIndex:(int)a3 copyBytes:(BOOL)a4 statement:(sqlite3_stmt *)a5
{
  _BOOL4 v6;
  const void *v8;
  const void *v9;
  int v10;

  if (a3 < 0)
    return 0;
  v6 = a4;
  v8 = sqlite3_column_blob(a5, a3);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = sqlite3_column_bytes(a5, a3);
  if (v6)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v10);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, v10, 0);
}

+ (id)numberWithIntegerAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  if (a3 < 0 || sqlite3_column_type(a4, a3) == 5)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(a4, a3));
}

+ (id)numberWithDoubleAtIndex:(int)a3 statement:(sqlite3_stmt *)a4
{
  if (a3 < 0 || sqlite3_column_type(a4, a3) == 5)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(a4, a3));
}

@end
