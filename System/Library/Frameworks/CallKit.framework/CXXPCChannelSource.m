@implementation CXXPCChannelSource

- (CXXPCChannelSource)initWithClient:(id)a3
{
  id v5;
  void *v6;
  CXXPCChannelSource *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)CXXPCChannelSource;
  v7 = -[CXAbstractProviderSource initWithIdentifier:](&v9, sel_initWithIdentifier_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_client, a3);

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[CXXPCChannelSource client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bundleURL
{
  void *v2;
  void *v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isConnected
{
  void *v2;
  char v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  void *v2;
  char v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPermittedToUsePrivateAPI");

  return v3;
}

- (BOOL)isPermittedToUsePublicAPI
{
  void *v2;
  char v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPermittedToUsePublicAPI");

  return v3;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  void *v2;
  char v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPermittedToUseBluetoothAccessories");

  return v3;
}

- (int)processIdentifier
{
  void *v2;
  int v3;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)vendorProtocolDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[CXXPCChannelSource client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CXChannelServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
