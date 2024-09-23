@implementation COIDSDiscoveryRecord

- (COIDSDiscoveryRecord)initWithIdsIdentifier:(id)a3 deviceTokenURI:(id)a4
{
  id v6;
  id v7;
  COIDSDiscoveryRecord *v8;
  uint64_t v9;
  NSString *IDSIdentifier;
  uint64_t v11;
  NSString *deviceTokenURI;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COIDSDiscoveryRecord;
  v8 = -[COIDSDiscoveryRecord init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    IDSIdentifier = v8->_IDSIdentifier;
    v8->_IDSIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    deviceTokenURI = v8->_deviceTokenURI;
    v8->_deviceTokenURI = (NSString *)v11;

  }
  return v8;
}

- (NSUUID)HomeKitIdentifier
{
  return 0;
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
  -[COIDSDiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, IDS: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COIDSDiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)producesElectionCapableTransport
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;

  -[COIDSDiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
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
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  COIDSDiscoveryRecord *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (COIDSDiscoveryRecord *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[COIDSDiscoveryRecord IDSIdentifier](self, "IDSIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[COIDSDiscoveryRecord IDSIdentifier](v4, "IDSIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[COIDSDiscoveryRecord serviceDirector](self, "serviceDirector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportWithDiscoveryRecord:withExecutionContext:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (COIDSServiceDirector)serviceDirector
{
  return self->_serviceDirector;
}

- (void)setServiceDirector:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceTokenURI
{
  return self->_deviceTokenURI;
}

- (COOnDemandIDSNodeCreationRequest)onDemandRequest
{
  return self->_onDemandRequest;
}

- (void)setOnDemandRequest:(id)a3
{
  objc_storeStrong((id *)&self->_onDemandRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRequest, 0);
  objc_storeStrong((id *)&self->_deviceTokenURI, 0);
  objc_storeStrong((id *)&self->_serviceDirector, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
