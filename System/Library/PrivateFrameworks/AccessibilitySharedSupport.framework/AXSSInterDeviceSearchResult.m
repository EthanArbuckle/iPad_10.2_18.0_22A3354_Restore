@implementation AXSSInterDeviceSearchResult

+ (id)searchResultWithPeerID:(id)a3 deviceType:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPeerID:deviceType:", v7, v6);

  return v8;
}

- (AXSSInterDeviceSearchResult)initWithPeerID:(id)a3 deviceType:(id)a4
{
  id v6;
  id v7;
  AXSSInterDeviceSearchResult *v8;
  AXSSInterDeviceSearchResult *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSSInterDeviceSearchResult;
  v8 = -[AXSSInterDeviceSearchResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXSSInterDeviceSearchResult setPeerID:](v8, "setPeerID:", v6);
    -[AXSSInterDeviceSearchResult setDeviceType:](v9, "setDeviceType:", v7);
  }

  return v9;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[AXSSInterDeviceSearchResult peerID](self, "peerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "peerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSInterDeviceSearchResult peerID](self, "peerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSInterDeviceSearchResult peerID](self, "peerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end
