@implementation MSNScopedException

- (MSNScopedException)initWithConnection:(id)a3 exception:(id)a4
{
  id v7;
  id v8;
  MSNScopedException *v9;
  MSNScopedException *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSNScopedException;
  v9 = -[MSNScopedException init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_exception, a4);
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)exception
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setException:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exception, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
