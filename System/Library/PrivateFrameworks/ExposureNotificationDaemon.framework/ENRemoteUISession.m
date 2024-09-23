@implementation ENRemoteUISession

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENXPCConnection)connection
{
  return (ENXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (OS_xpc_object)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
