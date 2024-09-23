@implementation CORapportDevice

- (CORapportDevice)initWithCompanionLinkDevice:(id)a3 sourceTransport:(id)a4
{
  id v7;
  id v8;
  CORapportDevice *v9;
  CORapportDevice *v10;
  uint64_t v11;
  id companionLinkProvider;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CORapportDevice;
  v9 = -[CORapportDevice init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_sourceTransport, a4);
    objc_initWeak(&location, v10);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__CORapportDevice_initWithCompanionLinkDevice_sourceTransport___block_invoke;
    v14[3] = &unk_24D4B14A8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    v11 = MEMORY[0x2199F3D40](v14);
    companionLinkProvider = v10->_companionLinkProvider;
    v10->_companionLinkProvider = (id)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __63__CORapportDevice_initWithCompanionLinkDevice_sourceTransport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x24BE7CBF0];
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "sourceTransport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "co_companionLinkClientToDevice:dispatchQueue:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  -[CORapportDevice IDSIdentifier](self, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, IDS: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)IDSIdentifier
{
  NSString *IDSIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  IDSIdentifier = self->_IDSIdentifier;
  if (!IDSIdentifier)
  {
    -[CORapportDevice device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDeviceIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_IDSIdentifier;
    self->_IDSIdentifier = v5;

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
  NSUUID *HomeKitIdentifier;
  void *v4;
  NSUUID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUUID *i;
  void *v12;
  void *v13;
  NSUUID *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HomeKitIdentifier = self->_HomeKitIdentifier;
  if (!HomeKitIdentifier)
  {
    -[CORapportDevice device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitIdentifier");
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CORapportDevice IDSIdentifier](self, "IDSIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[CORapportDevice sourceTransport](self, "sourceTransport", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activeDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (NSUUID *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
      {
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v5; i = (NSUUID *)((char *)i + 1))
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v9);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v12, "idsDeviceIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 && !objc_msgSend(v6, "compare:options:", v13, 1))
            {
              objc_msgSend(v12, "homeKitIdentifier");
              v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();

              goto LABEL_14;
            }

          }
          v5 = (NSUUID *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_14:

    }
    v14 = self->_HomeKitIdentifier;
    self->_HomeKitIdentifier = v5;

    HomeKitIdentifier = self->_HomeKitIdentifier;
  }
  return HomeKitIdentifier;
}

- (BOOL)producesElectionCapableTransport
{
  void *v2;
  void *v3;
  char v4;

  -[CORapportDevice sourceTransport](self, "sourceTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "leaderElectionConfigured");

  return v4;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4;
  CORapportTransport *v5;
  void *v6;

  v4 = a3;
  v5 = -[CORapportTransport initWithDiscoveryRecord:executionContext:]([CORapportTransport alloc], "initWithDiscoveryRecord:executionContext:", self, v4);

  -[CORapportDevice sourceTransport](self, "sourceTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsSink:", v5);

  return v5;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CORapportDevice IDSIdentifier](self, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  CORapportDevice *v4;
  CORapportDevice *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CORapportDevice *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[CORapportDevice conformsToProtocol:](v4, "conformsToProtocol:", &unk_254E13B70))
  {
    -[CORapportDevice IDSIdentifier](self, "IDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CORapportDevice IDSIdentifier](v5, "IDSIdentifier");
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

  -[CORapportDevice IDSIdentifier](self, "IDSIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v3;

  return v6;
}

- (BOOL)requiresInquiry
{
  return 1;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setHomeKitIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_HomeKitIdentifier, a3);
}

- (CORapportTransport)sourceTransport
{
  return self->_sourceTransport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTransport, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
