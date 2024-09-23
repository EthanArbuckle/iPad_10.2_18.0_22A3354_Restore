@implementation TKSmartCardSessionRequest

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)reply
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setReply:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
