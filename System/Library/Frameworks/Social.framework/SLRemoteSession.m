@implementation SLRemoteSession

- (SLRemoteSession)initWithConnection:(id)a3 database:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  SLRemoteSession *v9;
  SLRemoteSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  _SLLog(v4, 7, CFSTR("SLRemoteSession initializer called with connection %@ and database"));
  v12.receiver = self;
  v12.super_class = (Class)SLRemoteSession;
  v9 = -[SLRemoteSession init](&v12, sel_init, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[SLRemoteSession setConnection:](v9, "setConnection:", v7);
    -[SLRemoteSession setDatabase:](v10, "setDatabase:", v8);
  }

  return v10;
}

- (BOOL)clientHasEntitlement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SLRemoteSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sl_clientHasEntitlement:", v4);

  return v6;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (SLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
