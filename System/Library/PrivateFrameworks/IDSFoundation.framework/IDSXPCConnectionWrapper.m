@implementation IDSXPCConnectionWrapper

- (IDSXPCConnectionWrapper)initWithConnection:(id)a3
{
  id v5;
  IDSXPCConnectionWrapper *v6;
  IDSXPCConnectionWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSXPCConnectionWrapper;
  v6 = -[IDSXPCConnectionWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)resume
{
  xpc_connection_resume(self->_connection);
}

- (void)cancel
{
  xpc_connection_cancel(self->_connection);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
