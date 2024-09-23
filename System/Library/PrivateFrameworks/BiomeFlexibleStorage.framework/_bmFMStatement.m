@implementation _bmFMStatement

- (void)dealloc
{
  objc_super v3;

  -[_bmFMStatement close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)_bmFMStatement;
  -[_bmFMStatement dealloc](&v3, sel_dealloc);
}

- (void)close
{
  sqlite3_stmt *statement;

  statement = (sqlite3_stmt *)self->_statement;
  if (statement)
  {
    sqlite3_finalize(statement);
    self->_statement = 0;
  }
  self->_inUse = 0;
}

- (void)reset
{
  sqlite3_stmt *statement;

  statement = (sqlite3_stmt *)self->_statement;
  if (statement)
    sqlite3_reset(statement);
  self->_inUse = 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)_bmFMStatement;
  -[_bmFMStatement description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %ld hit(s) for query %@"), v4, self->_useCount, self->_query);

  return v5;
}

- (int64_t)useCount
{
  return self->_useCount;
}

- (void)setUseCount:(int64_t)a3
{
  self->_useCount = a3;
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)statement
{
  return self->_statement;
}

- (void)setStatement:(void *)a3
{
  self->_statement = a3;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
