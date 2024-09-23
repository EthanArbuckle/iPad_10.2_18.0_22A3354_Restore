@implementation MTRThreadNetworkDirectoryClusterThreadNetworkStruct

- (MTRThreadNetworkDirectoryClusterThreadNetworkStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRThreadNetworkDirectoryClusterThreadNetworkStruct *v4;
  uint64_t v5;
  NSData *extendedPanID;
  NSString *networkName;
  NSNumber *channel;
  NSNumber *activeTimestamp;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRThreadNetworkDirectoryClusterThreadNetworkStruct;
  v4 = -[MTRThreadNetworkDirectoryClusterThreadNetworkStruct init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    extendedPanID = v4->_extendedPanID;
    v4->_extendedPanID = (NSData *)v5;

    networkName = v4->_networkName;
    v4->_networkName = (NSString *)&stru_2505249E8;

    channel = v4->_channel;
    v4->_channel = (NSNumber *)&unk_250591B18;

    activeTimestamp = v4->_activeTimestamp;
    v4->_activeTimestamp = (NSNumber *)&unk_250591B18;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRThreadNetworkDirectoryClusterThreadNetworkStruct *v4;
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

  v4 = objc_alloc_init(MTRThreadNetworkDirectoryClusterThreadNetworkStruct);
  objc_msgSend_extendedPanID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtendedPanID_(v4, v8, (uint64_t)v7);

  objc_msgSend_networkName(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkName_(v4, v12, (uint64_t)v11);

  objc_msgSend_channel(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannel_(v4, v16, (uint64_t)v15);

  objc_msgSend_activeTimestamp(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActiveTimestamp_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_extendedPanID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: extendedPanID:%@; networkName:%@; channel:%@; activeTimestamp:%@; >"),
    v5,
    v7,
    self->_networkName,
    self->_channel,
    self->_activeTimestamp);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)extendedPanID
{
  return self->_extendedPanID;
}

- (void)setExtendedPanID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)activeTimestamp
{
  return self->_activeTimestamp;
}

- (void)setActiveTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTimestamp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_extendedPanID, 0);
}

@end
