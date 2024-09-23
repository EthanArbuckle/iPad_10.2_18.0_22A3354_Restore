@implementation ML3DatabaseCachedRow

- (ML3DatabaseCachedRow)initWithArray:(id)a3
{
  id v5;
  ML3DatabaseCachedRow *v6;
  ML3DatabaseCachedRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseCachedRow;
  v6 = -[ML3DatabaseRow initWithParentResult:](&v9, sel_initWithParentResult_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_arrayRepresentation, a3);

  return v7;
}

- (ML3DatabaseCachedRow)initWithParentResult:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-initWithParentResult: is invalid for cached rows. Use -initWithArray: instead."));
  return self;
}

- (unint64_t)columnCount
{
  return -[NSArray count](self->_arrayRepresentation, "count");
}

- (double)doubleForColumnIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[ML3DatabaseCachedRow _numberOrZeroForColumnIndex:](self, "_numberOrZeroForColumnIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int)intForColumnIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[ML3DatabaseCachedRow _numberOrZeroForColumnIndex:](self, "_numberOrZeroForColumnIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)int64ForColumnIndex:(unint64_t)a3
{
  void *v3;
  int64_t v4;

  -[ML3DatabaseCachedRow _numberOrZeroForColumnIndex:](self, "_numberOrZeroForColumnIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (const)cStringForColumnIndex:(unint64_t)a3
{
  id v3;
  const char *v4;

  -[ML3DatabaseCachedRow valueForColumnIndex:](self, "valueForColumnIndex:", a3);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return v4;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ML3DatabaseCachedRow dataForColumnIndex:](self, "dataForColumnIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseCachedRow.m"), 80, CFSTR("Attempted to read cached blob data from non-NSData type."));

    }
    *a4 = objc_msgSend(v12, "length");
    v9 = (void *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v10 = v12;
  }
  else
  {
    *a4 = 0;
  }
  *a3 = v9;

}

- (id)valueForColumnIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_arrayRepresentation, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_arrayRepresentation, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_arrayRepresentation, "count"))
  {
    v4 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_arrayRepresentation, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v5, v6);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_arrayRepresentation, "count"));
  }
  return v3;
}

- (id)arrayRepresentation
{
  return (id)-[NSArray copy](self->_arrayRepresentation, "copy");
}

- (id)_numberOrZeroForColumnIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_arrayRepresentation, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {

    v3 = &unk_1E5BAC528;
  }
  return v3;
}

- (id)dataForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (double)doubleForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0.0;
}

- (int)intForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (int64_t)int64ForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (const)cStringForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (id)stringForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (id)numberForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."), a5);
}

- (id)valueForColumnName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Fetching data using column name is unsupported for cached rows."));
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrayRepresentation, 0);
}

@end
