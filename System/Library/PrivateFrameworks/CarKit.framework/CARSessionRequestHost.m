@implementation CARSessionRequestHost

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARSessionRequestHost)initWithDisplayName:(id)a3 wiredIPv6Addresses:(id)a4 wirelessIPv6Addresses:(id)a5 port:(int64_t)a6 carplayWiFiUUID:(id)a7 deviceIdentifier:(id)a8 publicKey:(id)a9 sourceVersion:(id)a10 supportsMutualAuthentication:(BOOL)a11 authenticationCertificateSerial:(id)a12 pairedVehicleIdentifier:(id)a13 wiredCarPlaySimulator:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  CARSessionRequestHost *v24;
  CARSessionRequestHost *v25;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v27 = a5;
  v32 = a5;
  v31 = a7;
  v29 = a8;
  v30 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a12;
  v23 = a13;
  v35.receiver = self;
  v35.super_class = (Class)CARSessionRequestHost;
  v24 = -[CARSessionRequestHost init](&v35, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_displayName, a3);
    objc_storeStrong((id *)&v25->_wiredIPv6Addresses, a4);
    objc_storeStrong((id *)&v25->_wirelessIPv6Addresses, v27);
    v25->_port = a6;
    objc_storeStrong((id *)&v25->_carplayWiFiUUID, a7);
    objc_storeStrong((id *)&v25->_deviceIdentifier, v29);
    objc_storeStrong((id *)&v25->_publicKey, a9);
    objc_storeStrong((id *)&v25->_sourceVersion, a10);
    v25->_supportsMutualAuthentication = a11;
    objc_storeStrong((id *)&v25->_authenticationCertificateSerial, a12);
    objc_storeStrong((id *)&v25->_pairedVehicleIdentifier, a13);
    v25->_wiredCarPlaySimulator = a14;
  }

  return v25;
}

- (CARSessionRequestHost)initWithHostProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CARSessionRequestHost *v38;
  void *v39;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    CRLocalizedStringForKey(CFSTR("CARPLAY"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v39 = v7;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wiredIPAddresses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyStringArray(v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wirelessIPAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyStringArray(v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("port"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  CARVerifyClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v11;
  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("carplayWiFiUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  if (v13)
  {
    CARVerifyString(v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyString(v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("publicKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sourceVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CARVerifyString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsMutualAuth"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CARVerifyBool(v19);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("authenticationCertificateSerial"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  CARVerifyClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pairedVehicleIdentifier"));
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_opt_class();
    CARVerifyClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wiredCarPlaySimulator"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CARVerifyBool(v26);

  LOBYTE(v30) = v27;
  LOBYTE(v29) = v20;
  v38 = -[CARSessionRequestHost initWithDisplayName:wiredIPv6Addresses:wirelessIPv6Addresses:port:carplayWiFiUUID:deviceIdentifier:publicKey:sourceVersion:supportsMutualAuthentication:authenticationCertificateSerial:pairedVehicleIdentifier:wiredCarPlaySimulator:](self, "initWithDisplayName:wiredIPv6Addresses:wirelessIPv6Addresses:port:carplayWiFiUUID:deviceIdentifier:publicKey:sourceVersion:supportsMutualAuthentication:authenticationCertificateSerial:pairedVehicleIdentifier:wiredCarPlaySimulator:", v39, v36, v35, v12, v32, v31, v16, v18, v29, v22, v25, v30);

  return v38;
}

- (CARSessionRequestHost)initWithCoder:(id)a3
{
  id v4;
  CARSessionRequestHost *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *wiredIPv6Addresses;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *wirelessIPv6Addresses;
  uint64_t v19;
  NSString *carplayWiFiUUID;
  uint64_t v21;
  NSString *deviceIdentifier;
  uint64_t v23;
  NSString *publicKey;
  uint64_t v25;
  NSString *sourceVersion;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CARSessionRequestHost;
  v5 = -[CARSessionRequestHost init](&v34, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("displayName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = (__CFString *)v6;
      else
        v8 = &stru_1E542A520;
      objc_storeStrong((id *)&v5->_displayName, v8);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wiredIPAddresses")))
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("wiredIPAddresses"));
      v12 = objc_claimAutoreleasedReturnValue();
      wiredIPv6Addresses = v5->_wiredIPv6Addresses;
      v5->_wiredIPv6Addresses = (NSArray *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wirelessIPAddresses")))
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("wirelessIPAddresses"));
      v17 = objc_claimAutoreleasedReturnValue();
      wirelessIPv6Addresses = v5->_wirelessIPv6Addresses;
      v5->_wirelessIPv6Addresses = (NSArray *)v17;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("port")))
      v5->_port = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("port"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("carplayWiFiUUID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carplayWiFiUUID"));
      v19 = objc_claimAutoreleasedReturnValue();
      carplayWiFiUUID = v5->_carplayWiFiUUID;
      v5->_carplayWiFiUUID = (NSString *)v19;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
      v21 = objc_claimAutoreleasedReturnValue();
      deviceIdentifier = v5->_deviceIdentifier;
      v5->_deviceIdentifier = (NSString *)v21;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("publicKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
      v23 = objc_claimAutoreleasedReturnValue();
      publicKey = v5->_publicKey;
      v5->_publicKey = (NSString *)v23;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sourceVersion")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceVersion"));
      v25 = objc_claimAutoreleasedReturnValue();
      sourceVersion = v5->_sourceVersion;
      v5->_sourceVersion = (NSString *)v25;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsMutualAuth")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsMutualAuth"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
        v5->_supportsMutualAuthentication = objc_msgSend(v27, "BOOLValue");

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("authenticationCertificateSerial")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationCertificateSerial"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        objc_storeStrong((id *)&v5->_authenticationCertificateSerial, v29);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pairedVehicleIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedVehicleIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        objc_storeStrong((id *)&v5->_pairedVehicleIdentifier, v30);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wiredCarPlaySimulator")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wiredCarPlaySimulator"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        v5->_wiredCarPlaySimulator = objc_msgSend(v31, "BOOLValue");

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  id v24;

  v24 = a3;
  -[CARSessionRequestHost displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CARSessionRequestHost displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v5, CFSTR("displayName"));

  }
  -[CARSessionRequestHost wiredIPv6Addresses](self, "wiredIPv6Addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CARSessionRequestHost wiredIPv6Addresses](self, "wiredIPv6Addresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v7, CFSTR("wiredIPAddresses"));

  }
  -[CARSessionRequestHost wirelessIPv6Addresses](self, "wirelessIPv6Addresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CARSessionRequestHost wirelessIPv6Addresses](self, "wirelessIPv6Addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v9, CFSTR("wirelessIPAddresses"));

  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[CARSessionRequestHost port](self, "port"), CFSTR("port"));
  -[CARSessionRequestHost carplayWiFiUUID](self, "carplayWiFiUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CARSessionRequestHost carplayWiFiUUID](self, "carplayWiFiUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v11, CFSTR("carplayWiFiUUID"));

  }
  -[CARSessionRequestHost deviceIdentifier](self, "deviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CARSessionRequestHost deviceIdentifier](self, "deviceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v13, CFSTR("deviceID"));

  }
  -[CARSessionRequestHost publicKey](self, "publicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CARSessionRequestHost publicKey](self, "publicKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v15, CFSTR("publicKey"));

  }
  -[CARSessionRequestHost sourceVersion](self, "sourceVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CARSessionRequestHost sourceVersion](self, "sourceVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v17, CFSTR("sourceVersion"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CARSessionRequestHost supportsMutualAuthentication](self, "supportsMutualAuthentication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v18, CFSTR("supportsMutualAuth"));

  -[CARSessionRequestHost authenticationCertificateSerial](self, "authenticationCertificateSerial");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CARSessionRequestHost authenticationCertificateSerial](self, "authenticationCertificateSerial");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v20, CFSTR("authenticationCertificateSerial"));

  }
  -[CARSessionRequestHost pairedVehicleIdentifier](self, "pairedVehicleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CARSessionRequestHost pairedVehicleIdentifier](self, "pairedVehicleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v22, CFSTR("pairedVehicleIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CARSessionRequestHost isWiredCarPlaySimulator](self, "isWiredCarPlaySimulator"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("wiredCarPlaySimulator"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CARSessionRequestHost;
  -[CARSessionRequestHost description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionRequestHost displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionRequestHost wiredIPv6Addresses](self, "wiredIPv6Addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSessionRequestHost wirelessIPv6Addresses](self, "wirelessIPv6Addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CARSessionRequestHost port](self, "port");
  v9 = -[CARSessionRequestHost supportsMutualAuthentication](self, "supportsMutualAuthentication");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [name: %@, wired IPs: %@, wireless IPs: %@, port: %ld, supportsMutualAuth: %@]"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)wiredIPv6Addresses
{
  return self->_wiredIPv6Addresses;
}

- (void)setWiredIPv6Addresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)wirelessIPv6Addresses
{
  return self->_wirelessIPv6Addresses;
}

- (void)setWirelessIPv6Addresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (NSString)carplayWiFiUUID
{
  return self->_carplayWiFiUUID;
}

- (void)setCarplayWiFiUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)supportsMutualAuthentication
{
  return self->_supportsMutualAuthentication;
}

- (void)setSupportsMutualAuthentication:(BOOL)a3
{
  self->_supportsMutualAuthentication = a3;
}

- (NSData)authenticationCertificateSerial
{
  return self->_authenticationCertificateSerial;
}

- (void)setAuthenticationCertificateSerial:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUUID)pairedVehicleIdentifier
{
  return self->_pairedVehicleIdentifier;
}

- (void)setPairedVehicleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isWiredCarPlaySimulator
{
  return self->_wiredCarPlaySimulator;
}

- (void)setWiredCarPlaySimulator:(BOOL)a3
{
  self->_wiredCarPlaySimulator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationCertificateSerial, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_carplayWiFiUUID, 0);
  objc_storeStrong((id *)&self->_wirelessIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_wiredIPv6Addresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
