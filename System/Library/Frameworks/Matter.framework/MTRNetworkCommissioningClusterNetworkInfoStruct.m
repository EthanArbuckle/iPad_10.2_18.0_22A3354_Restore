@implementation MTRNetworkCommissioningClusterNetworkInfoStruct

- (MTRNetworkCommissioningClusterNetworkInfoStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRNetworkCommissioningClusterNetworkInfoStruct *v4;
  uint64_t v5;
  NSData *networkID;
  NSNumber *connected;
  NSData *networkIdentifier;
  NSData *clientIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRNetworkCommissioningClusterNetworkInfoStruct;
  v4 = -[MTRNetworkCommissioningClusterNetworkInfoStruct init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    networkID = v4->_networkID;
    v4->_networkID = (NSData *)v5;

    connected = v4->_connected;
    v4->_connected = (NSNumber *)&unk_250591B18;

    networkIdentifier = v4->_networkIdentifier;
    v4->_networkIdentifier = 0;

    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterNetworkInfoStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterNetworkInfoStruct);
  objc_msgSend_networkID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkID_(v4, v8, (uint64_t)v7);

  objc_msgSend_connected(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConnected_(v4, v12, (uint64_t)v11);

  objc_msgSend_networkIdentifier(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkIdentifier_(v4, v16, (uint64_t)v15);

  objc_msgSend_clientIdentifier(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClientIdentifier_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSNumber *connected;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_networkID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  connected = self->_connected;
  objc_msgSend_base64EncodedStringWithOptions_(self->_networkIdentifier, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentifier, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: networkID:%@; connected:%@; networkIdentifier:%@; clientIdentifier:%@; >"),
    v5,
    v7,
    connected,
    v10,
    v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSData)networkID
{
  return self->_networkID;
}

- (void)setNetworkID:(NSData *)networkID
{
  objc_setProperty_nonatomic_copy(self, a2, networkID, 8);
}

- (NSNumber)connected
{
  return self->_connected;
}

- (void)setConnected:(NSNumber *)connected
{
  objc_setProperty_nonatomic_copy(self, a2, connected, 16);
}

- (NSData)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_connected, 0);
  objc_storeStrong((id *)&self->_networkID, 0);
}

@end
