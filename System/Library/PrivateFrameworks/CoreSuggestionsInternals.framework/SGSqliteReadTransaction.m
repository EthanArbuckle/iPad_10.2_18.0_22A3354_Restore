@implementation SGSqliteReadTransaction

- (SGSqliteReadTransaction)initWithHandle:(id)a3
{
  id v5;
  SGSqliteReadTransaction *v6;
  SGSqliteReadTransaction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGSqliteReadTransaction;
  v6 = -[SGSqliteReadTransaction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_db, a3);

  return v7;
}

- (SGSqliteDatabase)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
