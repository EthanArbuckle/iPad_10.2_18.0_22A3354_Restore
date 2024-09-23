@implementation MSNPillDataSource

- (MSNPillDataSource)initWithConnection:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  MSNPillDataSource *v8;
  MSNPillDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSNPillDataSource;
  v8 = -[MSNPillDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeStrong((id *)&v9->_identifiers, a4);
  }

  return v9;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
