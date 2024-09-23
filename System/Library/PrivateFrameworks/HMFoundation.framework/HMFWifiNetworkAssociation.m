@implementation HMFWifiNetworkAssociation

- (HMFWifiNetworkAssociation)initWithMACAddress:(id)a3 SSID:(id)a4 BSSID:(id)a5 gatewayIPAddress:(id)a6 gatewayMACAddress:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMFWifiNetworkAssociation *v17;
  HMFWifiNetworkAssociation *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMFWifiNetworkAssociation;
  v17 = -[HMFWifiNetworkAssociation init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_MACAddress, a3);
    objc_storeStrong((id *)&v18->_SSID, a4);
    objc_storeStrong((id *)&v18->_BSSID, a5);
    objc_storeStrong((id *)&v18->_gatewayIPAddress, a6);
    objc_storeStrong((id *)&v18->_gatewayMACAddress, a7);
  }

  return v18;
}

- (HMFMACAddress)MACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)SSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMACAddress)BSSID
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)gatewayIPAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMACAddress)gatewayMACAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayMACAddress, 0);
  objc_storeStrong((id *)&self->_gatewayIPAddress, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
