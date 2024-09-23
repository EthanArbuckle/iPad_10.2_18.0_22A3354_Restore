@implementation AUPBClientConnection

- (NSXPCConnection)xpcconnection
{
  return self->xpcconnection;
}

- (void)setXpcconnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AUPBInspecting)proxyInterface
{
  return self->proxyInterface;
}

- (void)setProxyInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
