@implementation DTXPCRegistration

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)oneshotHandler
{
  return self->_oneshotHandler;
}

- (void)setOneshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong(&self->_client, a3);
}

- (id)pkHandle
{
  return self->_pkHandle;
}

- (void)setPkHandle:(id)a3
{
  objc_storeStrong(&self->_pkHandle, a3);
}

- (OS_xpc_object)xpcObject
{
  return self->_xpcObject;
}

- (void)setXpcObject:(id)a3
{
  objc_storeStrong((id *)&self->_xpcObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcObject, 0);
  objc_storeStrong(&self->_pkHandle, 0);
  objc_storeStrong(&self->_client, 0);
  objc_storeStrong(&self->_oneshotHandler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end
