@implementation MSDKPeerDemoDevice

- (MSDKPeerDemoDevice)initWithDeviceProperties:(id)a3
{
  id v4;
  MSDKPeerDemoDevice *v5;
  MSDKPeerDemoDevice *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDKPeerDemoDevice;
  v5 = -[MSDKPeerDemoDevice init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MSDKPeerDemoDevice refreshDevicePropertiesUsingProperties:](v5, "refreshDevicePropertiesUsingProperties:", v4);

  return v6;
}

- (void)refreshDevicePropertiesUsingProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
        {
          -[MSDKPeerDemoDevice setValue:forKey:](self, "setValue:forKey:", 0, v11);
          objc_msgSend(v5, "removeObjectForKey:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("activeEnvironment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoDevice setActiveEnvironment:](self, "setActiveEnvironment:", v15);

      objc_msgSend(v5, "removeObjectForKey:", CFSTR("activeEnvironment"));
    }
  }
  -[MSDKPeerDemoDevice setValuesForKeysWithDictionary:](self, "setValuesForKeysWithDictionary:", v5, (_QWORD)v16);

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MSDKPeerDemoDevice valueForUndefinedKey:].cold.1((uint64_t)self, (uint64_t)v4, v5);

  return 0;
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
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice identifier](self, "identifier");
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

  -[MSDKPeerDemoDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice deviceName](self, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d IsInBubble=%d>"), v5, self, v6, v7, -[MSDKPeerDemoDevice pairingMode](self, "pairingMode"), -[MSDKPeerDemoDevice authenticated](self, "authenticated"), -[MSDKPeerDemoDevice isInBubble](self, "isInBubble"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  void *v19;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;

  -[MSDKPeerDemoDevice ipAddresses](self, "ipAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = CFSTR("nil");
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[MSDKPeerDemoDevice ipAddresses](self, "ipAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[ %@ ]"), v6);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v31 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice deviceName](self, "deviceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MSDKPeerDemoDevice pairingMode](self, "pairingMode");
  v26 = -[MSDKPeerDemoDevice authenticated](self, "authenticated");
  v25 = -[MSDKPeerDemoDevice isInBubble](self, "isInBubble");
  -[MSDKPeerDemoDevice productType](self, "productType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice serialNumber](self, "serialNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice osVersion](self, "osVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MSDKPeerDemoDevice batteryCapacity](self, "batteryCapacity");
  -[MSDKPeerDemoDevice wifiNetworkName](self, "wifiNetworkName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSDKPeerDemoDevice wifiSignalStrength](self, "wifiSignalStrength");
  -[MSDKPeerDemoDevice iCloudAccountName](self, "iCloudAccountName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice activeEnvironment](self, "activeEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDevice mainVolume](self, "mainVolume");
  v13 = v12;
  -[MSDKPeerDemoDevice environmentVolume](self, "environmentVolume");
  v15 = v14;
  -[MSDKPeerDemoDevice phoneCallVolume](self, "phoneCallVolume");
  v17 = v16;
  -[MSDKPeerDemoDevice audioVideoVolume](self, "audioVideoVolume");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@[%p]: Identifier=%@ DeviceName=%@ PairingMode=%d Authenticated=%d IsInBubble=%d ProductType=%@ SerialNumber=%@ OSVersion=%@ BatteryCapacity=%lu WiFiNetworkName=%@ WiFiSignalStrength=%ld iCloudAccountName=%@ ActiveEnvironment=%@ MainVolume=%f EnvironmentVolume=%f PhoneCallVolume=%f AudioVideoVolume=%f ContentFrozen=%d AirPlayAssistedReady=%d ThermalMitigationNeeded=%d BuddyInProgress=%d IpAddresses=%@ ProtocolVersion=%lu>"), v30, self, v29, v28, v27, v26, v25, v24, v23, v22, v21, v8, v9, v10, v11, *(_QWORD *)&v13,
    *(_QWORD *)&v15,
    *(_QWORD *)&v17,
    v18,
    -[MSDKPeerDemoDevice contentFrozen](self, "contentFrozen"),
    -[MSDKPeerDemoDevice airPlayAssistedReady](self, "airPlayAssistedReady"),
    -[MSDKPeerDemoDevice thermalMitigationNeeded](self, "thermalMitigationNeeded"),
    -[MSDKPeerDemoDevice buddyInProgress](self, "buddyInProgress"),
    v32,
    -[MSDKPeerDemoDevice protocolVersion](self, "protocolVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoDevice)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSDKPeerDemoDevice;
  v5 = -[MSDKPeerDemoDevice init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setDeviceName:](v5, "setDeviceName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setPairingMode:](v5, "setPairingMode:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setAuthenticated:](v5, "setAuthenticated:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInBubble"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setIsInBubble:](v5, "setIsInBubble:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setProductType:](v5, "setProductType:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setSerialNumber:](v5, "setSerialNumber:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setOsVersion:](v5, "setOsVersion:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batteryCapacity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setBatteryCapacity:](v5, "setBatteryCapacity:", objc_msgSend(v14, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wifiNetworkName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setWifiNetworkName:](v5, "setWifiNetworkName:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wifiSignalStrength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setWifiSignalStrength:](v5, "setWifiSignalStrength:", objc_msgSend(v16, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudAccountName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setICloudAccountName:](v5, "setICloudAccountName:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeEnvironment"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setActiveEnvironment:](v5, "setActiveEnvironment:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainVolume"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    -[MSDKPeerDemoDevice setMainVolume:](v5, "setMainVolume:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environmentVolume"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    -[MSDKPeerDemoDevice setEnvironmentVolume:](v5, "setEnvironmentVolume:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneCallVolume"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    -[MSDKPeerDemoDevice setPhoneCallVolume:](v5, "setPhoneCallVolume:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioVideoVolume"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    -[MSDKPeerDemoDevice setAudioVideoVolume:](v5, "setAudioVideoVolume:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentFrozen"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setContentFrozen:](v5, "setContentFrozen:", objc_msgSend(v23, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airPlayAssistedReady"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setAirPlayAssistedReady:](v5, "setAirPlayAssistedReady:", objc_msgSend(v24, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thermalMitigationNeeded"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDevice setThermalMitigationNeeded:](v5, "setThermalMitigationNeeded:", objc_msgSend(v25, "BOOLValue"));

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("buddyInProgress")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buddyInProgress"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoDevice setBuddyInProgress:](v5, "setBuddyInProgress:", objc_msgSend(v26, "BOOLValue"));

    }
    else
    {
      -[MSDKPeerDemoDevice setBuddyInProgress:](v5, "setBuddyInProgress:", 0);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ipAddresses")))
    {
      v27 = (void *)MEMORY[0x24BDBCF20];
      v28 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("ipAddresses"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoDevice setIpAddresses:](v5, "setIpAddresses:", v30);

    }
    else
    {
      -[MSDKPeerDemoDevice setIpAddresses:](v5, "setIpAddresses:", 0);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("protocolVersion")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocolVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDKPeerDemoDevice setProtocolVersion:](v5, "setProtocolVersion:", objc_msgSend(v31, "unsignedIntegerValue"));

    }
    else
    {
      -[MSDKPeerDemoDevice setProtocolVersion:](v5, "setProtocolVersion:", 0);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v4 = a3;
  -[MSDKPeerDemoDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[MSDKPeerDemoDevice deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice pairingMode](self, "pairingMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pairingMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice authenticated](self, "authenticated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("authenticated"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice isInBubble](self, "isInBubble"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("isInBubble"));

  -[MSDKPeerDemoDevice productType](self, "productType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("productType"));

  -[MSDKPeerDemoDevice serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("serialNumber"));

  -[MSDKPeerDemoDevice osVersion](self, "osVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("osVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MSDKPeerDemoDevice batteryCapacity](self, "batteryCapacity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("batteryCapacity"));

  -[MSDKPeerDemoDevice wifiNetworkName](self, "wifiNetworkName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("wifiNetworkName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MSDKPeerDemoDevice wifiSignalStrength](self, "wifiSignalStrength"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("wifiSignalStrength"));

  -[MSDKPeerDemoDevice iCloudAccountName](self, "iCloudAccountName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("iCloudAccountName"));

  -[MSDKPeerDemoDevice activeEnvironment](self, "activeEnvironment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("activeEnvironment"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoDevice mainVolume](self, "mainVolume");
  objc_msgSend(v18, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("mainVolume"));

  v20 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoDevice environmentVolume](self, "environmentVolume");
  objc_msgSend(v20, "numberWithFloat:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("environmentVolume"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoDevice phoneCallVolume](self, "phoneCallVolume");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("phoneCallVolume"));

  v24 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoDevice audioVideoVolume](self, "audioVideoVolume");
  objc_msgSend(v24, "numberWithFloat:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("audioVideoVolume"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice contentFrozen](self, "contentFrozen"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("contentFrozen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice airPlayAssistedReady](self, "airPlayAssistedReady"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("airPlayAssistedReady"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice thermalMitigationNeeded](self, "thermalMitigationNeeded"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("thermalMitigationNeeded"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MSDKPeerDemoDevice buddyInProgress](self, "buddyInProgress"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("buddyInProgress"));

  -[MSDKPeerDemoDevice ipAddresses](self, "ipAddresses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("ipAddresses"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoDevice protocolVersion](self, "protocolVersion"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("protocolVersion"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (BOOL)pairingMode
{
  return self->_pairingMode;
}

- (void)setPairingMode:(BOOL)a3
{
  self->_pairingMode = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isInBubble
{
  return self->_isInBubble;
}

- (void)setIsInBubble:(BOOL)a3
{
  self->_isInBubble = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (int64_t)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(int64_t)a3
{
  self->_batteryCapacity = a3;
}

- (NSString)wifiNetworkName
{
  return self->_wifiNetworkName;
}

- (void)setWifiNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_wifiNetworkName, a3);
}

- (int64_t)wifiSignalStrength
{
  return self->_wifiSignalStrength;
}

- (void)setWifiSignalStrength:(int64_t)a3
{
  self->_wifiSignalStrength = a3;
}

- (NSString)iCloudAccountName
{
  return self->_iCloudAccountName;
}

- (void)setICloudAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudAccountName, a3);
}

- (MSDKPeerDemoEnvironment)activeEnvironment
{
  return self->_activeEnvironment;
}

- (void)setActiveEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnvironment, a3);
}

- (float)mainVolume
{
  return self->_mainVolume;
}

- (void)setMainVolume:(float)a3
{
  self->_mainVolume = a3;
}

- (float)environmentVolume
{
  return self->_environmentVolume;
}

- (void)setEnvironmentVolume:(float)a3
{
  self->_environmentVolume = a3;
}

- (float)phoneCallVolume
{
  return self->_phoneCallVolume;
}

- (void)setPhoneCallVolume:(float)a3
{
  self->_phoneCallVolume = a3;
}

- (float)audioVideoVolume
{
  return self->_audioVideoVolume;
}

- (void)setAudioVideoVolume:(float)a3
{
  self->_audioVideoVolume = a3;
}

- (BOOL)contentFrozen
{
  return self->_contentFrozen;
}

- (void)setContentFrozen:(BOOL)a3
{
  self->_contentFrozen = a3;
}

- (BOOL)airPlayAssistedReady
{
  return self->_airPlayAssistedReady;
}

- (void)setAirPlayAssistedReady:(BOOL)a3
{
  self->_airPlayAssistedReady = a3;
}

- (BOOL)thermalMitigationNeeded
{
  return self->_thermalMitigationNeeded;
}

- (void)setThermalMitigationNeeded:(BOOL)a3
{
  self->_thermalMitigationNeeded = a3;
}

- (BOOL)buddyInProgress
{
  return self->_buddyInProgress;
}

- (void)setBuddyInProgress:(BOOL)a3
{
  self->_buddyInProgress = a3;
}

- (NSArray)ipAddresses
{
  return self->_ipAddresses;
}

- (void)setIpAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddresses, a3);
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (MSDRapportDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_ipAddresses, 0);
  objc_storeStrong((id *)&self->_activeEnvironment, 0);
  objc_storeStrong((id *)&self->_iCloudAccountName, 0);
  objc_storeStrong((id *)&self->_wifiNetworkName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)valueForUndefinedKey:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "%{public}@: Encountered undefined key: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
