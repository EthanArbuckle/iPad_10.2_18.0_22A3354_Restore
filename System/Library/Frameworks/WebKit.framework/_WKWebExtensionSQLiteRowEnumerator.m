@implementation _WKWebExtensionSQLiteRowEnumerator

- (_WKWebExtensionSQLiteRowEnumerator)initWithResultsOfStatement:(id)a3
{
  id v5;
  _WKWebExtensionSQLiteRowEnumerator *v6;
  void *v7;
  NSObject *v8;
  _WKWebExtensionSQLiteRowEnumerator *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionSQLiteRowEnumerator;
  v6 = -[_WKWebExtensionSQLiteRowEnumerator init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    objc_storeStrong((id *)&v6->_statement, a3);
    v9 = v6;
  }

  return v6;
}

- (id)nextObject
{
  void *v3;
  NSObject *v4;
  int v5;
  _WKWebExtensionSQLiteRow *v6;
  void *v7;
  _WKWebExtensionSQLiteRow *row;
  _WKWebExtensionSQLiteRow *v9;
  _WKWebExtensionSQLiteRow *v10;

  -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = sqlite3_step(-[_WKWebExtensionSQLiteStatement handle](self->_statement, "handle"));
  v6 = 0;
  self->_lastResultCode = v5;
  if (v5)
  {
    if (v5 == 100)
    {
      row = self->_row;
      if (!row)
      {
        v9 = -[_WKWebExtensionSQLiteRow initWithCurrentRowOfEnumerator:]([_WKWebExtensionSQLiteRow alloc], "initWithCurrentRowOfEnumerator:", self);
        v10 = self->_row;
        self->_row = v9;

        row = self->_row;
      }
      v6 = row;
    }
    else if (v5 != 101)
    {
      -[_WKWebExtensionSQLiteStatement database](self->_statement, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reportErrorWithCode:statement:error:", self->_lastResultCode, -[_WKWebExtensionSQLiteStatement handle](self->_statement, "handle"), 0);

      v6 = 0;
    }
  }
  return v6;
}

- (_WKWebExtensionSQLiteStatement)statement
{
  return self->_statement;
}

- (int)lastResultCode
{
  return self->_lastResultCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_statement, 0);
}

@end
