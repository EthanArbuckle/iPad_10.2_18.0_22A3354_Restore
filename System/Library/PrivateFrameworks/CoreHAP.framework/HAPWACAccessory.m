@implementation HAPWACAccessory

- (HAPWACAccessory)initWithWiFiDevice:(id)a3
{
  id v5;
  HAPWACAccessory *v6;
  HAPWACAccessory *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *model;
  uint64_t v12;
  NSString *manufacturer;
  int v14;
  void *v15;
  uint64_t v16;
  NSNumber *rssi;
  uint64_t v18;
  NSData *bssid;
  uint64_t v20;
  NSString *ssid;
  uint64_t v22;
  NSUUID *identifier;
  uint64_t v24;
  NSData *setupHash;
  id v26;
  void *v27;
  uint64_t v28;
  NSString *deviceId;
  uint64_t v30;
  NSDictionary *rawScanResult;
  objc_super v33;
  _BYTE v34[256];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HAPWACAccessory;
  v6 = -[HAPWACAccessory init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cuWiFiDevice, a3);
    objc_msgSend(v5, "deviceIEName");
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(v5, "deviceIEModel");
    v10 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (NSString *)v10;

    objc_msgSend(v5, "deviceIEManufacturer");
    v12 = objc_claimAutoreleasedReturnValue();
    manufacturer = v7->_manufacturer;
    v7->_manufacturer = (NSString *)v12;

    v14 = objc_msgSend(v5, "deviceIECategory");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "deviceIECategory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &unk_1E89896B0;
    }
    objc_storeStrong((id *)&v7->_wacCategory, v15);
    if (v14)

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "rssi"));
    v16 = objc_claimAutoreleasedReturnValue();
    rssi = v7->_rssi;
    v7->_rssi = (NSNumber *)v16;

    objc_msgSend(v5, "bssid");
    v18 = objc_claimAutoreleasedReturnValue();
    bssid = v7->_bssid;
    v7->_bssid = (NSData *)v18;

    objc_msgSend(v5, "ssid");
    v20 = objc_claimAutoreleasedReturnValue();
    ssid = v7->_ssid;
    v7->_ssid = (NSString *)v20;

    objc_msgSend(v5, "identifier");
    v22 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v22;

    objc_msgSend(v5, "deviceIDSetupHash");
    v24 = objc_claimAutoreleasedReturnValue();
    setupHash = v7->_setupHash;
    v7->_setupHash = (NSData *)v24;

    objc_msgSend(v5, "deviceIEDeviceID");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v26, "bytes");
    objc_msgSend(v5, "deviceIEDeviceID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "length");
    HardwareAddressToCString();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4);
    v28 = objc_claimAutoreleasedReturnValue();
    deviceId = v7->_deviceId;
    v7->_deviceId = (NSString *)v28;

    objc_msgSend(v5, "rawScanResult");
    v30 = objc_claimAutoreleasedReturnValue();
    rawScanResult = v7->_rawScanResult;
    v7->_rawScanResult = (NSDictionary *)v30;

    v7->_supportsAirPlay = 0;
    v7->_homeKitPaired = 0;
    v7->_pairSetupWAC = 0;
    v7->_requiresOwnershipToken = 0;
    v7->_supportedWiFiBands = 0;
    v7->_authFeatures = 0;
    -[HAPWACAccessory __setupSupportedFlags:](v7, "__setupSupportedFlags:", objc_msgSend(v5, "deviceIEFlags"));
  }

  return v7;
}

- (void)__setupSupportedFlags:(unsigned int)a3
{
  if ((a3 & 0x1000) != 0)
    self->_supportsAirPlay = 1;
  if ((a3 & 0x20000) != 0)
    self->_supportedWiFiBands |= 1uLL;
  if ((a3 & 0x10000) != 0)
    self->_supportedWiFiBands |= 2uLL;
  if ((a3 & 0x4000) != 0)
  {
    self->_version = 1;
    if ((a3 & 0x2000) == 0)
    {
LABEL_9:
      if ((a3 & 0x400000) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((a3 & 0x2000) == 0)
  {
    goto LABEL_9;
  }
  self->_version = 2;
  if ((a3 & 0x400000) == 0)
  {
LABEL_10:
    if ((a3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  self->_homeKitPaired = 1;
  if ((a3 & 0x800) != 0)
LABEL_11:
    self->_pairSetupWAC = 1;
LABEL_12:
  if ((a3 & 0x20000400) != 0)
    self->_authFeatures |= 1uLL;
  if ((a3 & 0x40000) != 0)
  {
    self->_authFeatures |= 4uLL;
    if ((a3 & 0x200) == 0)
    {
LABEL_16:
      if ((a3 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
  }
  else if ((a3 & 0x200) == 0)
  {
    goto LABEL_16;
  }
  self->_authFeatures |= 2uLL;
  if ((a3 & 0x100) == 0)
  {
LABEL_17:
    if ((a3 & 0x20) == 0)
      return;
LABEL_26:
    self->_requiresOwnershipToken = 1;
    return;
  }
LABEL_25:
  self->_authFeatures |= 8uLL;
  if ((a3 & 0x20) != 0)
    goto LABEL_26;
}

- (HAPWACAccessory)initWithName:(id)a3 identifier:(id)a4 category:(id)a5 ssid:(id)a6 deviceId:(id)a7 flags:(unsigned int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HAPWACAccessory *v18;
  HAPWACAccessory *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAPWACAccessory;
  v18 = -[HAPWACAccessory init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_identifier, a4);
    objc_storeStrong((id *)&v19->_wacCategory, a5);
    objc_storeStrong((id *)&v19->_ssid, a6);
    objc_storeStrong((id *)&v19->_deviceId, a7);
    -[HAPWACAccessory __setupSupportedFlags:](v19, "__setupSupportedFlags:", a8);
  }

  return v19;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  __CFString *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  __CFString *v26;
  _BOOL4 v27;
  __CFString *v28;
  _BOOL4 v29;
  __CFString *v30;

  v24 = (void *)MEMORY[0x1E0CB3940];
  v29 = HAPIsInternalBuild();
  if (v29)
  {
    -[HAPWACAccessory name](self, "name");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("<private>");
  }
  v27 = HAPIsInternalBuild();
  if (v27)
  {
    -[HAPWACAccessory model](self, "model");
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("<private>");
  }
  v23 = HAPIsInternalBuild();
  if (v23)
  {
    -[HAPWACAccessory manufacturer](self, "manufacturer");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("<private>");
  }
  -[HAPWACAccessory wacCategory](self, "wacCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  v20 = HAPIsInternalBuild();
  if (v20)
  {
    -[HAPWACAccessory bssid](self, "bssid");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = CFSTR("<private>");
  }
  v19 = HAPIsInternalBuild();
  v28 = (__CFString *)v3;
  v26 = (__CFString *)v4;
  v21 = (void *)v6;
  v22 = (__CFString *)v5;
  if (v19)
  {
    -[HAPWACAccessory ssid](self, "ssid");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("<private>");
  }
  -[HAPWACAccessory identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessory deviceId](self, "deviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessory setupHash](self, "setupHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPWACAccessory supportsAirPlay](self, "supportsAirPlay"))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  if (-[HAPWACAccessory homeKitPaired](self, "homeKitPaired"))
    v11 = CFSTR("Yes");
  else
    v11 = CFSTR("No");
  if (-[HAPWACAccessory pairSetupWAC](self, "pairSetupWAC"))
    v12 = CFSTR("Yes");
  else
    v12 = CFSTR("No");
  if (-[HAPWACAccessory version](self, "version") == 1)
  {
    v13 = CFSTR("HAPWACV1");
  }
  else if (-[HAPWACAccessory version](self, "version") == 2)
  {
    v13 = CFSTR("HAPWACV2");
  }
  else
  {
    v13 = CFSTR("?");
  }
  HAPAuthFeaturesToString(-[HAPWACAccessory authFeatures](self, "authFeatures"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HAPWACWiFiBandToString(-[HAPWACAccessory supportedWiFiBands](self, "supportedWiFiBands"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessory discoveryTime](self, "discoveryTime");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("\n Name: %@\n Model: %@\n Manufacturer: %@\n Category: %@\n BSSID: %@\n SSID: %@\n Identifier: %@\n DeviceId: %@\n setup hash: %@\n AirPlay: %@\n HomeKit Paired: %@\n Pair Setup WAC: %@\n HomeKit Version: %@\n Auth: %@\n Supported WiFi Band(s): %@\n DiscoveryTime: %f sec\n "), v28, v26, v22, v21, v30, v7, v18, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v20)

  if (v23)
  if (v27)

  if (v29)
  return v25;
}

- (void)updateWithHAPWACAccessory:(id)a3
{
  CUWiFiDevice *v4;
  CUWiFiDevice *cuWiFiDevice;
  NSString *v6;
  NSString *name;
  NSString *v8;
  NSString *model;
  NSString *v10;
  NSString *manufacturer;
  NSNumber *v12;
  NSNumber *wacCategory;
  NSNumber *v14;
  NSNumber *rssi;
  NSData *v16;
  NSData *bssid;
  NSString *v18;
  NSString *ssid;
  NSUUID *v20;
  NSUUID *identifier;
  NSData *v22;
  NSData *setupHash;
  NSString *v24;
  NSString *deviceId;
  NSDictionary *v26;
  NSDictionary *rawScanResult;
  void *v28;
  double v29;
  id v30;

  v30 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v30, "cuWiFiDevice");
  v4 = (CUWiFiDevice *)objc_claimAutoreleasedReturnValue();
  cuWiFiDevice = self->_cuWiFiDevice;
  self->_cuWiFiDevice = v4;

  objc_msgSend(v30, "name");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v6;

  objc_msgSend(v30, "model");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v8;

  objc_msgSend(v30, "manufacturer");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v10;

  objc_msgSend(v30, "wacCategory");
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  wacCategory = self->_wacCategory;
  self->_wacCategory = v12;

  objc_msgSend(v30, "rssi");
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rssi = self->_rssi;
  self->_rssi = v14;

  objc_msgSend(v30, "bssid");
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  bssid = self->_bssid;
  self->_bssid = v16;

  objc_msgSend(v30, "ssid");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  ssid = self->_ssid;
  self->_ssid = v18;

  objc_msgSend(v30, "identifier");
  v20 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v20;

  objc_msgSend(v30, "setupHash");
  v22 = (NSData *)objc_claimAutoreleasedReturnValue();
  setupHash = self->_setupHash;
  self->_setupHash = v22;

  objc_msgSend(v30, "deviceId");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceId = self->_deviceId;
  self->_deviceId = v24;

  objc_msgSend(v30, "rawScanResult");
  v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  rawScanResult = self->_rawScanResult;
  self->_rawScanResult = v26;

  self->_supportsAirPlay = 0;
  self->_homeKitPaired = 0;
  self->_pairSetupWAC = 0;
  self->_supportedWiFiBands = 0;
  self->_authFeatures = 0;
  objc_msgSend(v30, "cuWiFiDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWACAccessory __setupSupportedFlags:](self, "__setupSupportedFlags:", objc_msgSend(v28, "deviceIEFlags"));

  objc_msgSend(v30, "discoveryTime");
  self->_discoveryTime = v29;
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)supportsLegacyWAC
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (self->_authFeatures & 0xD) != 0 && !self->_pairSetupWAC;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsWAC2
{
  os_unfair_lock_s *p_lock;
  BOOL pairSetupWAC;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_authFeatures)
    pairSetupWAC = self->_pairSetupWAC;
  else
    pairSetupWAC = 0;
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)supportsTokenAuth
{
  os_unfair_lock_s *p_lock;
  BOOL pairSetupWAC;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pairSetupWAC = 0;
  if ((self->_authFeatures & 2) != 0)
    pairSetupWAC = self->_pairSetupWAC;
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)supportsCertAuth
{
  os_unfair_lock_s *p_lock;
  BOOL pairSetupWAC;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  pairSetupWAC = 0;
  if ((self->_authFeatures & 8) != 0)
    pairSetupWAC = self->_pairSetupWAC;
  os_unfair_lock_unlock(p_lock);
  return pairSetupWAC;
}

- (BOOL)isHomeKitAccessory
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_version)
    v4 = self->_authFeatures != 0;
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isAirPlayAccessory
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_supportsAirPlay && self->_version == 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSNumber)wacCategory
{
  return self->_wacCategory;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSData)bssid
{
  return self->_bssid;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (NSDictionary)rawScanResult
{
  return self->_rawScanResult;
}

- (BOOL)supportsAirPlay
{
  return self->_supportsAirPlay;
}

- (BOOL)requiresOwnershipToken
{
  return self->_requiresOwnershipToken;
}

- (unint64_t)supportedWiFiBands
{
  return self->_supportedWiFiBands;
}

- (BOOL)homeKitPaired
{
  return self->_homeKitPaired;
}

- (BOOL)pairSetupWAC
{
  return self->_pairSetupWAC;
}

- (unint64_t)authFeatures
{
  return self->_authFeatures;
}

- (unint64_t)version
{
  return self->_version;
}

- (double)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(double)a3
{
  self->_discoveryTime = a3;
}

- (CUWiFiDevice)cuWiFiDevice
{
  return self->_cuWiFiDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cuWiFiDevice, 0);
  objc_storeStrong((id *)&self->_rawScanResult, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wacCategory, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
