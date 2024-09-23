@implementation NWRemoteConnectionWrapper

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NWConnection)connection
{
  return (NWConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
