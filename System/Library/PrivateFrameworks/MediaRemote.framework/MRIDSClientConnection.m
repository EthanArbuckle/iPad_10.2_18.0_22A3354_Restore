@implementation MRIDSClientConnection

- (MRIDSClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRIDSClientConnection;
  return -[MRProtocolClientConnection initWithConnection:queue:](&v5, sel_initWithConnection_queue_, a3, a4);
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  self->_discoveryMode = a3;
}

@end
