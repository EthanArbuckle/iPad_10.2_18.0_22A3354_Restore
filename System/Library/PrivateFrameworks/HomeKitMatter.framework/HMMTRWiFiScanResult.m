@implementation HMMTRWiFiScanResult

- (HMMTRWiFiScanResult)initWithMTRNetworkCommissioningClusterWiFiInterfaceScanResult:(id)a3
{
  id v4;
  HMMTRWiFiScanResult *v5;
  uint64_t v6;
  NSData *ssid;
  uint64_t v8;
  NSNumber *rssi;
  uint64_t v10;
  NSNumber *security;
  uint64_t v12;
  NSNumber *band;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRWiFiScanResult;
  v5 = -[HMMTRWiFiScanResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ssid");
    v6 = objc_claimAutoreleasedReturnValue();
    ssid = v5->_ssid;
    v5->_ssid = (NSData *)v6;

    objc_msgSend(v4, "rssi");
    v8 = objc_claimAutoreleasedReturnValue();
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v8;

    objc_msgSend(v4, "security");
    v10 = objc_claimAutoreleasedReturnValue();
    security = v5->_security;
    v5->_security = (NSNumber *)v10;

    objc_msgSend(v4, "wiFiBand");
    v12 = objc_claimAutoreleasedReturnValue();
    band = v5->_band;
    v5->_band = (NSNumber *)v12;

  }
  return v5;
}

- (HMMTRWiFiScanResult)initWithSSID:(id)a3 rssi:(id)a4 security:(unsigned __int8)a5 band:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  id v12;
  HMMTRWiFiScanResult *v13;
  HMMTRWiFiScanResult *v14;
  uint64_t v15;
  NSNumber *security;
  uint64_t v17;
  NSNumber *band;
  objc_super v20;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMMTRWiFiScanResult;
  v13 = -[HMMTRWiFiScanResult init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_ssid, a3);
    objc_storeStrong((id *)&v14->_rssi, a4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    security = v14->_security;
    v14->_security = (NSNumber *)v15;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6);
    v17 = objc_claimAutoreleasedReturnValue();
    band = v14->_band;
    v14->_band = (NSNumber *)v17;

  }
  return v14;
}

- (NSData)ssid
{
  return self->_ssid;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSNumber)security
{
  return self->_security;
}

- (NSNumber)band
{
  return self->_band;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_band, 0);
  objc_storeStrong((id *)&self->_security, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
