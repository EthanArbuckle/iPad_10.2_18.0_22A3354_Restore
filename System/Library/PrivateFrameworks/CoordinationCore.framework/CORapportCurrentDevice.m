@implementation CORapportCurrentDevice

- (CORapportCurrentDevice)initWithClient:(id)a3 browser:(id)a4
{
  id v7;
  id v8;
  CORapportCurrentDevice *v9;
  CORapportCurrentDevice *v10;
  id v11;
  uint64_t v12;
  id companionLinkProvider;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CORapportCurrentDevice;
  v9 = -[CORapportCurrentDevice init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    v11 = objc_initWeak(&location, v8);
    objc_storeWeak((id *)&v10->_browser, v8);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__CORapportCurrentDevice_initWithClient_browser___block_invoke;
    v15[3] = &unk_24D4B3718;
    v16 = v7;
    v12 = MEMORY[0x2199F3D40](v15);
    companionLinkProvider = v10->_companionLinkProvider;
    v10->_companionLinkProvider = (id)v12;

    objc_destroyWeak(&location);
  }

  return v10;
}

id __49__CORapportCurrentDevice_initWithClient_browser___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CORapportCurrentDevice IDSIdentifier](self, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, IDS: %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)IDSIdentifier
{
  NSString *IDSIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  IDSIdentifier = self->_IDSIdentifier;
  if (!IDSIdentifier)
  {
    -[CORapportCurrentDevice client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsDeviceIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_IDSIdentifier;
    self->_IDSIdentifier = v6;

    IDSIdentifier = self->_IDSIdentifier;
  }
  return IDSIdentifier;
}

- (void)setCompanionLinkProvider:(id)a3
{
  void *v4;
  id companionLinkProvider;

  v4 = (void *)MEMORY[0x2199F3D40](a3, a2);
  companionLinkProvider = self->_companionLinkProvider;
  self->_companionLinkProvider = v4;

}

- (id)companionLinkProvider
{
  return (id)MEMORY[0x2199F3D40](self->_companionLinkProvider, a2);
}

- (NSUUID)HomeKitIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CORapportCurrentDevice client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (BOOL)producesElectionCapableTransport
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CORapportCurrentDevice browser](self, "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "leaderElectionConfigured");

  return v5;
}

- (BOOL)requiresInquiry
{
  return 0;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4;
  CORapportTransport *v5;
  void *v6;

  v4 = a3;
  v5 = -[CORapportTransport initWithDiscoveryRecord:executionContext:]([CORapportTransport alloc], "initWithDiscoveryRecord:executionContext:", self, v4);

  -[CORapportCurrentDevice browser](self, "browser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceTransport:", v5);

  return v5;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CORapportCurrentDevice IDSIdentifier](self, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  CORapportCurrentDevice *v4;
  CORapportCurrentDevice *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CORapportCurrentDevice *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[CORapportCurrentDevice conformsToProtocol:](v4, "conformsToProtocol:", &unk_254E13B70))
  {
    -[CORapportCurrentDevice IDSIdentifier](self, "IDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportCurrentDevice IDSIdentifier](v5, "IDSIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;

  -[CORapportCurrentDevice IDSIdentifier](self, "IDSIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (CORapportBrowser)browser
{
  return (CORapportBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
