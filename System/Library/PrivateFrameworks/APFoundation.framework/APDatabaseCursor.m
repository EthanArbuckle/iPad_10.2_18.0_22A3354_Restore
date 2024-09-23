@implementation APDatabaseCursor

- (APDatabaseCursor)initWithStatement:(sqlite3_stmt *)a3 lock:(id)a4
{
  id v7;
  APDatabaseCursor *v8;
  APDatabaseCursor *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APDatabaseCursor;
  v8 = -[APDatabaseCursor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_statement = a3;
    objc_storeStrong((id *)&v8->_lock, a4);
  }

  return v9;
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (int)lastStepResult
{
  return self->_lastStepResult;
}

- (void)setLastStepResult:(int)a3
{
  self->_lastStepResult = a3;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
