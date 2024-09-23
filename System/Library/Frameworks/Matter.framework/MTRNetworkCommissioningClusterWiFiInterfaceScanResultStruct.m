@implementation MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct

- (MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct)init
{
  MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct *v2;
  MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct *v3;
  NSNumber *security;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *ssid;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSData *bssid;
  NSNumber *channel;
  NSNumber *wiFiBand;
  NSNumber *rssi;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct;
  v2 = -[MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    security = v2->_security;
    v2->_security = (NSNumber *)&unk_250591B18;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    ssid = v3->_ssid;
    v3->_ssid = (NSData *)v7;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    bssid = v3->_bssid;
    v3->_bssid = (NSData *)v11;

    channel = v3->_channel;
    v3->_channel = (NSNumber *)&unk_250591B18;

    wiFiBand = v3->_wiFiBand;
    v3->_wiFiBand = (NSNumber *)&unk_250591B18;

    rssi = v3->_rssi;
    v3->_rssi = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct *v4;
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

  v4 = objc_alloc_init(MTRNetworkCommissioningClusterWiFiInterfaceScanResultStruct);
  objc_msgSend_security(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSecurity_(v4, v8, (uint64_t)v7);

  objc_msgSend_ssid(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSsid_(v4, v12, (uint64_t)v11);

  objc_msgSend_bssid(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBssid_(v4, v16, (uint64_t)v15);

  objc_msgSend_channel(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannel_(v4, v20, (uint64_t)v19);

  objc_msgSend_wiFiBand(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWiFiBand_(v4, v24, (uint64_t)v23);

  objc_msgSend_rssi(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRssi_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *security;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  security = self->_security;
  objc_msgSend_base64EncodedStringWithOptions_(self->_ssid, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_bssid, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("<%@: security:%@; ssid:%@; bssid:%@; channel:%@; wiFiBand:%@; rssi:%@; >"),
    v5,
    security,
    v8,
    v10,
    self->_channel,
    self->_wiFiBand,
    self->_rssi);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSNumber)security
{
  return self->_security;
}

- (void)setSecurity:(NSNumber *)security
{
  objc_setProperty_nonatomic_copy(self, a2, security, 8);
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(NSData *)ssid
{
  objc_setProperty_nonatomic_copy(self, a2, ssid, 16);
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(NSData *)bssid
{
  objc_setProperty_nonatomic_copy(self, a2, bssid, 24);
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(NSNumber *)channel
{
  objc_setProperty_nonatomic_copy(self, a2, channel, 32);
}

- (NSNumber)wiFiBand
{
  return self->_wiFiBand;
}

- (void)setWiFiBand:(NSNumber *)wiFiBand
{
  objc_setProperty_nonatomic_copy(self, a2, wiFiBand, 40);
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(NSNumber *)rssi
{
  objc_setProperty_nonatomic_copy(self, a2, rssi, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wiFiBand, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_security, 0);
}

@end
