@implementation IDSDataChannelsDirectConnections

- (OS_nw_connection)udpConnection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUdpConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_nw_connection)qpodConnection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQpodConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qpodConnection, 0);
  objc_storeStrong((id *)&self->_udpConnection, 0);
}

@end
