@implementation ASTNetworkObject

- (ASTConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_receivedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
