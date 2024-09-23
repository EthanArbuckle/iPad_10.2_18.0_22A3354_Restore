@implementation _IDSXPCCheckInInfo

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (IDSXPCConnectionProtocol)connection
{
  return self->_connection;
}

- (OS_xpc_object)tempObject
{
  return self->_tempObject;
}

- (void)setTempObject:(id)a3
{
  objc_storeStrong((id *)&self->_tempObject, a3);
}

- (BOOL)finishedTransaction
{
  return self->_finishedTransaction;
}

- (void)setFinishedTransaction:(BOOL)a3
{
  self->_finishedTransaction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
