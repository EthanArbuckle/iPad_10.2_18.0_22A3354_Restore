@implementation NRXPCProxy

- (NRXPCProxy)initWithConnection:(id)a3 delegate:(id)a4 xpcTarget:(id)a5 entitlementBitmask:(unsigned int)a6
{
  id v11;
  id v12;
  id v13;
  NRXPCProxy *v14;
  NRXPCProxy *v15;
  uint64_t v16;
  NSString *appPath;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[NRXPCProxy init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    objc_storeStrong(&v15->_target, a5);
    v15->_entitlementBitmask = a6;
    objc_msgSend(v11, "processName");
    v16 = objc_claimAutoreleasedReturnValue();
    appPath = v15->_appPath;
    v15->_appPath = (NSString *)v16;

  }
  return v15;
}

- (int)pid
{
  return -[NRNSXPCConnectionProtocol processIdentifier](self->_connection, "processIdentifier");
}

- (NRNSXPCConnectionProtocol)connection
{
  return self->_connection;
}

- (BOOL)hasEntitlement:(id)a3
{
  NRXPCProxy *v3;
  NRXPCProxyDelegate **p_delegate;
  id v5;
  id WeakRetained;

  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "hasEntitlement:withBitmask:", v5, v3->_entitlementBitmask);

  return (char)v3;
}

- (NSString)appPath
{
  return self->_appPath;
}

- (id)target
{
  return self->_target;
}

+ (id)machServiceName
{
  return 0;
}

+ (id)serverExportedInterface
{
  return 0;
}

+ (id)serverRemoteObjectInterface
{
  return 0;
}

+ (id)clientExportedInterface
{
  return 0;
}

+ (id)clientRemoteObjectInterface
{
  return 0;
}

+ (id)entitlements
{
  return 0;
}

+ (BOOL)requireAnEntitlement
{
  void *v2;

  objc_msgSend(a1, "entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");

  return 0;
}

- (BOOL)hasEntitlements
{
  return self->_entitlementBitmask != 0;
}

- (id)remoteObjectProxy
{
  return (id)-[NRNSXPCConnectionProtocol remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)_invalidate
{
  NRNSXPCConnectionProtocol *connection;
  id target;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[NRNSXPCConnectionProtocol setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NRNSXPCConnectionProtocol setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    -[NRNSXPCConnectionProtocol invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

    target = self->_target;
    self->_target = 0;

  }
}

- (void)setMonitorClientForSuspension:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  self->_monitorClientForSuspension = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shouldMonitorProxy:forSuspension:", self, v3);

}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (BOOL)monitorClientForSuspension
{
  return self->_monitorClientForSuspension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_appPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
