@implementation MTSXPCClientProxy

- (MTSXPCClientProxy)initWithConnection:(id)a3
{
  id v5;
  void *v6;
  MTSXPCClientProxy *v7;
  MTSXPCClientProxy *v8;
  MTSXPCClientProxy *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSXPCClientProxy;
    v7 = -[MTSXPCClientProxy init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_connection, a3);

    return v8;
  }
  else
  {
    v10 = (MTSXPCClientProxy *)_HMFPreconditionFailure();
    return (MTSXPCClientProxy *)-[MTSXPCClientProxy hasDevicePairingEntitlement](v10, v11);
  }
}

- (BOOL)hasDevicePairingEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[MTSXPCClientProxy connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.matter.support.xpc.device-pairing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)hasPrivateHomeKitEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[MTSXPCClientProxy connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.private.homekit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (BOOL)hasMatterSetupPayloadEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[MTSXPCClientProxy connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.developer.matter.allow-setup-payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientProxy:fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", self, v7, v6);

}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientProxy:removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", self, v10, v9, v8);

}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientProxy:removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", self, v7, v6);

}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientProxy:openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", self, v9, v8, a4);

}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientProxy:readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", self, v7, v6);

}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientProxy:performDeviceSetupUsingRequest:completionHandler:", self, v7, v6);

}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientProxy:fetchSystemCommissionerPairingsWithCompletionHandler:", self, v4);

}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientProxy:removeSystemCommissionerPairingWithUUID:completionHandler:", self, v7, v6);

}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSXPCClientProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientProxy:checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:", self, v4);

}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  id v3;

  -[MTSXPCClientProxy delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showRestrictedCharacteristicsAccessWarningAlertWithClientProxy:", self);

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSXPCClientProxy connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Connection"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MTSXPCConnection)connection
{
  return (MTSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (MTSXPCClientProxyDelegate)delegate
{
  return (MTSXPCClientProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
