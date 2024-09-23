@implementation NSSQLiteStatement

- (id)bindVariables
{
  return self->_bindVariables;
}

- (id)entity
{
  return self->_entity;
}

- (id)bindIntarrays
{
  return self->_bindIntarrays;
}

- (id)sqlString
{
  return self->_sqlString;
}

- (void)dealloc
{
  objc_super v3;

  self->_entity = 0;

  *(_OWORD *)&self->_bindIntarrays = 0u;
  *(_OWORD *)&self->_entity = 0u;
  -[NSSQLiteStatement clearCaches:](self, 1);

  self->_fakeEntityForFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteStatement;
  -[NSSQLiteStatement dealloc](&v3, sel_dealloc);
}

- (void)clearCaches:(void *)key
{
  sqlite3_stmt *v3;
  uint64_t v4;
  BOOL v5;
  __CFDictionary *v6;

  if (key)
  {
    v3 = (sqlite3_stmt *)*((_QWORD *)key + 8);
    if (v3)
    {
      v4 = *((_QWORD *)key + 9);
      if (v4)
        v5 = a2 == 0;
      else
        v5 = 1;
      if (!v5)
      {
        v6 = *(__CFDictionary **)(v4 + 152);
        if (v6)
        {
          CFDictionaryRemoveValue(v6, key);
          v3 = (sqlite3_stmt *)*((_QWORD *)key + 8);
        }
      }
      sqlite3_finalize(v3);
      *((_QWORD *)key + 8) = 0;
    }

    *((_QWORD *)key + 7) = 0;
    *((_QWORD *)key + 9) = 0;
  }
}

- (uint64_t)addBindVariable:(uint64_t)a1
{
  id v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v4 = *(id *)(a1 + 16);
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(a1 + 16) = v4;
  }
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(*(id *)(a1 + 16), "addObject:", a2);
  objc_msgSend(a2, "setIndex:", v5);
  return v5;
}

- (NSSQLiteStatement)initWithEntity:(id)a3 sqlString:(id)a4
{
  NSSQLiteStatement *v6;
  NSSQLiteStatement *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLiteStatement;
  v6 = -[NSSQLiteStatement init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_entity = (NSSQLEntity *)a3;
    v6->_sqlString = (NSString *)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (NSSQLiteStatement)initWithEntity:(id)a3
{
  return -[NSSQLiteStatement initWithEntity:sqlString:](self, "initWithEntity:sqlString:", a3, 0);
}

- (void)setBindIntarrays:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 24) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 24) = a2;
    }
  }
}

- (void)cacheFakeEntityForFetch:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 48) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 48) = a2;
    }
  }
}

- (sqlite3_stmt)setCachedSQLiteStatement:(uint64_t)a3 forConnection:
{
  sqlite3_stmt *v4;

  if (result)
  {
    v4 = result;
    if (!*((_QWORD *)result + 9))
      *((_QWORD *)result + 9) = a3;
    result = (sqlite3_stmt *)*((_QWORD *)result + 8);
    if (result != a2)
    {
      if (result)
        result = (sqlite3_stmt *)sqlite3_finalize(result);
      *((_QWORD *)v4 + 8) = a2;
    }
    if (!a2)
      *((_QWORD *)v4 + 9) = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s <%p> on entity '%@' with sql text '%@'"), class_getName(v4), self, -[NSSQLEntity name](self->_entity, "name"), self->_sqlString);
}

@end
