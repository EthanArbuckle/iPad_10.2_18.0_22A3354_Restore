@implementation MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct

- (MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct)init
{
  MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct *v2;
  MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct *v3;
  NSNumber *panId;
  NSNumber *extendedPanId;
  NSString *networkName;
  NSNumber *channel;
  NSNumber *version;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSData *extendedAddress;
  NSNumber *rssi;
  NSNumber *lqi;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct;
  v2 = -[MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    panId = v2->_panId;
    v2->_panId = (NSNumber *)&unk_250591B18;

    extendedPanId = v3->_extendedPanId;
    v3->_extendedPanId = (NSNumber *)&unk_250591B18;

    networkName = v3->_networkName;
    v3->_networkName = (NSString *)&stru_2505249E8;

    channel = v3->_channel;
    v3->_channel = (NSNumber *)&unk_250591B18;

    version = v3->_version;
    v3->_version = (NSNumber *)&unk_250591B18;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    extendedAddress = v3->_extendedAddress;
    v3->_extendedAddress = (NSData *)v11;

    rssi = v3->_rssi;
    v3->_rssi = (NSNumber *)&unk_250591B18;

    lqi = v3->_lqi;
    v3->_lqi = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct *v4;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterThreadInterfaceScanResultStruct);
  objc_msgSend_panId(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPanId_(v4, v8, (uint64_t)v7);

  objc_msgSend_extendedPanId(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtendedPanId_(v4, v12, (uint64_t)v11);

  objc_msgSend_networkName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNetworkName_(v4, v16, (uint64_t)v15);

  objc_msgSend_channel(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannel_(v4, v20, (uint64_t)v19);

  objc_msgSend_version(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVersion_(v4, v24, (uint64_t)v23);

  objc_msgSend_extendedAddress(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExtendedAddress_(v4, v28, (uint64_t)v27);

  objc_msgSend_rssi(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRssi_(v4, v32, (uint64_t)v31);

  objc_msgSend_lqi(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLqi_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *panId;
  NSNumber *extendedPanId;
  NSString *networkName;
  NSNumber *channel;
  NSNumber *version;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  panId = self->_panId;
  extendedPanId = self->_extendedPanId;
  networkName = self->_networkName;
  channel = self->_channel;
  version = self->_version;
  objc_msgSend_base64EncodedStringWithOptions_(self->_extendedAddress, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: panId:%@; extendedPanId:%@; networkName:%@; channel:%@; version:%@; extendedAddress:%@; rssi:%@; lqi:%@; >"),
    v5,
    panId,
    extendedPanId,
    networkName,
    channel,
    version,
    v12,
    self->_rssi,
    self->_lqi);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSNumber)panId
{
  return self->_panId;
}

- (void)setPanId:(NSNumber *)panId
{
  objc_setProperty_nonatomic_copy(self, a2, panId, 8);
}

- (NSNumber)extendedPanId
{
  return self->_extendedPanId;
}

- (void)setExtendedPanId:(NSNumber *)extendedPanId
{
  objc_setProperty_nonatomic_copy(self, a2, extendedPanId, 16);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(NSString *)networkName
{
  objc_setProperty_nonatomic_copy(self, a2, networkName, 24);
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(NSNumber *)channel
{
  objc_setProperty_nonatomic_copy(self, a2, channel, 32);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(NSNumber *)version
{
  objc_setProperty_nonatomic_copy(self, a2, version, 40);
}

- (NSData)extendedAddress
{
  return self->_extendedAddress;
}

- (void)setExtendedAddress:(NSData *)extendedAddress
{
  objc_setProperty_nonatomic_copy(self, a2, extendedAddress, 48);
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(NSNumber *)rssi
{
  objc_setProperty_nonatomic_copy(self, a2, rssi, 56);
}

- (NSNumber)lqi
{
  return self->_lqi;
}

- (void)setLqi:(NSNumber *)lqi
{
  objc_setProperty_nonatomic_copy(self, a2, lqi, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lqi, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_extendedAddress, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_extendedPanId, 0);
  objc_storeStrong((id *)&self->_panId, 0);
}

@end
