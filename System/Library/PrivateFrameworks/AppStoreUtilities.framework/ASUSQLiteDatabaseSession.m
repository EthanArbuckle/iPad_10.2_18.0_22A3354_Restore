@implementation ASUSQLiteDatabaseSession

- (ASUSQLiteDatabaseSession)initWithConnection:(id)a3
{
  id v5;
  ASUSQLiteDatabaseSession *v6;
  ASUSQLiteDatabaseSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteDatabaseSession;
  v6 = -[ASUSQLiteDatabaseSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (ASUSQLiteConnection)connection
{
  return (ASUSQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
