@implementation GDSQLEntityIterator

- (GDSQLEntityIterator)initWithColumns:(unint64_t)a3 statement:(id)a4
{
  int v4;
  id v6;
  GDSQLEntityIterator *v7;
  _BYTE *v8;
  id *v9;
  GDLazyGraphTripleRow *lazyTripleRow;
  GDSQLTripleRowIterator *v11;
  GDSQLTripleRowIterator *innerIterator;
  objc_super v14;

  v4 = a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDSQLEntityIterator;
  v7 = -[GDSQLEntityIterator init](&v14, sel_init);
  if (v7)
  {
    v8 = sub_1AE90EEA4([GDLazyGraphTripleRowCursor alloc], v4, v6);
    v9 = sub_1AE90EE0C((id *)[GDLazyGraphTripleRow alloc], v8, 0);
    lazyTripleRow = v7->_lazyTripleRow;
    v7->_lazyTripleRow = (GDLazyGraphTripleRow *)v9;

    v11 = (GDSQLTripleRowIterator *)sub_1AE90EF5C([GDSQLTripleRowIterator alloc], v7->_lazyTripleRow);
    innerIterator = v7->_innerIterator;
    v7->_innerIterator = v11;

  }
  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  GDSQLTripleRowIterator *innerIterator;
  GDLazyGraphTripleRow *lazyTripleRow;
  GDLazyGraphTripleRowCursor *cursor;
  void *v9;
  const char *v10;
  int isEqualToString;
  GDLazyGraphTripleRow *v12;
  GDLazyGraphTripleRowCursor *v13;
  uint64_t v14;
  NSString *iterateSubjectValue;
  GDLazyGraphTripleRow *v16;
  GDLazyGraphTripleRowCursor *v17;

  if (!a3->var0)
  {
    a3->var0 = 1;
    a3->var1 = (id *)&self->_innerIterator;
    a3->var2 = (unint64_t *)self;
  }
  innerIterator = self->_innerIterator;
  if (innerIterator)
  {
    if (innerIterator->_iterateSubjectValue)
    {
      while (1)
      {
        lazyTripleRow = innerIterator->_lazyTripleRow;
        if (lazyTripleRow)
        {
          cursor = lazyTripleRow->_cursor;
          if (cursor)
          {
            if (cursor->_done)
              break;
          }
        }
        objc_msgSend_subject(lazyTripleRow, a2, (uint64_t)a3, a4, a5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v9, v10, (uint64_t)innerIterator->_iterateSubjectValue);

        if (!isEqualToString)
          break;
        sub_1AE90E770((uint64_t)innerIterator->_lazyTripleRow, a2, (uint64_t)a3);
      }
    }
    else
    {
      sub_1AE90E770((uint64_t)innerIterator->_lazyTripleRow, a2, (uint64_t)a3);
    }
    v12 = innerIterator->_lazyTripleRow;
    if (!v12 || (v13 = v12->_cursor) == 0 || !v13->_done)
    {
      objc_msgSend_subject(v12, a2, (uint64_t)a3, a4, a5);
      v14 = objc_claimAutoreleasedReturnValue();
      iterateSubjectValue = innerIterator->_iterateSubjectValue;
      innerIterator->_iterateSubjectValue = (NSString *)v14;

    }
  }
  v16 = self->_lazyTripleRow;
  return !v16 || (v17 = v16->_cursor) == 0 || !v17->_done;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerIterator, 0);
  objc_storeStrong((id *)&self->_lazyTripleRow, 0);
}

@end
