@implementation DEDDevice

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v28;

  v4 = a3;
  -[DEDDevice address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("address"));

  -[DEDDevice build](self, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("build"));

  -[DEDDevice color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("color"));

  -[DEDDevice deviceClass](self, "deviceClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("deviceClass"));

  -[DEDDevice enclosureColor](self, "enclosureColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("enclosureColor"));

  -[DEDDevice identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("identifier"));

  -[DEDDevice model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("model"));

  -[DEDDevice name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("name"));

  -[DEDDevice productType](self, "productType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("productType"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice status](self, "status"), CFSTR("status"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice transport](self, "transport"), CFSTR("transport"));
  -[DEDDevice platform](self, "platform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("platform"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice remoteTransport](self, "remoteTransport"), CFSTR("remoteTransport"));
  -[DEDDevice capabilities](self, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDCapability encodeCapabilitySet:](DEDCapability, "encodeCapabilitySet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("capabilities"));

  -[DEDDevice hardwareCodename](self, "hardwareCodename");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("hardwareCodename"));

  -[DEDDevice serialNumber](self, "serialNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("serialNumber"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice homeButtonType](self, "homeButtonType"), CFSTR("homeButtonType"));
  -[DEDDevice uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("uniformTypeIdentifier"));

  -[DEDDevice idsIdentifier](self, "idsIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("idsIdentifier"));

  -[DEDDevice companionDeviceIdentifier](self, "companionDeviceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("companionDeviceIdentifier"));

  -[DEDDevice homeTheaterSystemName](self, "homeTheaterSystemName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("homeTheaterSystemName"));

  -[DEDDevice homeTheaterSystemIdentifier](self, "homeTheaterSystemIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("homeTheaterSystemIdentifier"));

  -[DEDDevice mediaSystemName](self, "mediaSystemName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("mediaSystemName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDDevice mediaSystemRole](self, "mediaSystemRole"), CFSTR("mediaSystemRole"));
  -[DEDDevice mediaSystemIdentifier](self, "mediaSystemIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("mediaSystemIdentifier"));

  -[DEDDevice mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("mediaRemoteIdentifier"));

  -[DEDDevice homeKitIdentifier](self, "homeKitIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("homeKitIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDDevice isHomeKitResident](self, "isHomeKitResident"), CFSTR("isHomeKitResident"));
  -[DEDDevice bugSessions](self, "bugSessions");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("bugSessions"));

}

- (DEDDevice)initWithCoder:(id)a3
{
  id v4;
  DEDDevice *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *build;
  uint64_t v10;
  NSString *color;
  uint64_t v12;
  NSString *deviceClass;
  uint64_t v14;
  NSString *enclosureColor;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *model;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSString *productType;
  uint64_t v24;
  NSString *platform;
  void *v26;
  uint64_t v27;
  NSSet *capabilities;
  uint64_t v29;
  NSString *hardwareCodename;
  uint64_t v31;
  NSString *serialNumber;
  uint64_t v33;
  NSString *uniformTypeIdentifier;
  uint64_t v35;
  NSString *idsIdentifier;
  uint64_t v37;
  NSString *companionDeviceIdentifier;
  uint64_t v39;
  NSString *homeTheaterSystemName;
  uint64_t v41;
  NSString *homeTheaterSystemIdentifier;
  uint64_t v43;
  NSString *mediaSystemName;
  uint64_t v45;
  NSString *mediaSystemIdentifier;
  uint64_t v47;
  NSString *mediaRemoteIdentifier;
  uint64_t v49;
  NSString *homeKitIdentifier;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSSet *bugSessions;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)DEDDevice;
  v5 = -[DEDDevice init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v8 = objc_claimAutoreleasedReturnValue();
    build = v5->_build;
    v5->_build = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
    v12 = objc_claimAutoreleasedReturnValue();
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enclosureColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    enclosureColor = v5->_enclosureColor;
    v5->_enclosureColor = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v18 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v20 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v22 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v22;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_transport = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transport"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
    v24 = objc_claimAutoreleasedReturnValue();
    platform = v5->_platform;
    v5->_platform = (NSString *)v24;

    v5->_remoteTransport = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteTransport"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      +[DEDCapability decodeCapabilitiesString:](DEDCapability, "decodeCapabilitiesString:", v26);
    else
      +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v27 = objc_claimAutoreleasedReturnValue();
    capabilities = v5->_capabilities;
    v5->_capabilities = (NSSet *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareCodename"));
    v29 = objc_claimAutoreleasedReturnValue();
    hardwareCodename = v5->_hardwareCodename;
    v5->_hardwareCodename = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v31 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v31;

    v5->_homeButtonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("homeButtonType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniformTypeIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    uniformTypeIdentifier = v5->_uniformTypeIdentifier;
    v5->_uniformTypeIdentifier = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionDeviceIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    companionDeviceIdentifier = v5->_companionDeviceIdentifier;
    v5->_companionDeviceIdentifier = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeTheaterSystemName"));
    v39 = objc_claimAutoreleasedReturnValue();
    homeTheaterSystemName = v5->_homeTheaterSystemName;
    v5->_homeTheaterSystemName = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeTheaterSystemIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    homeTheaterSystemIdentifier = v5->_homeTheaterSystemIdentifier;
    v5->_homeTheaterSystemIdentifier = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaSystemName"));
    v43 = objc_claimAutoreleasedReturnValue();
    mediaSystemName = v5->_mediaSystemName;
    v5->_mediaSystemName = (NSString *)v43;

    v5->_mediaSystemRole = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaSystemRole"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaSystemIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    mediaSystemIdentifier = v5->_mediaSystemIdentifier;
    v5->_mediaSystemIdentifier = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRemoteIdentifier"));
    v47 = objc_claimAutoreleasedReturnValue();
    mediaRemoteIdentifier = v5->_mediaRemoteIdentifier;
    v5->_mediaRemoteIdentifier = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKitIdentifier"));
    v49 = objc_claimAutoreleasedReturnValue();
    homeKitIdentifier = v5->_homeKitIdentifier;
    v5->_homeKitIdentifier = (NSString *)v49;

    v5->_isHomeKitResident = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHomeKitResident"));
    v51 = (void *)MEMORY[0x24BDBCF20];
    v52 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("bugSessions"));
    v54 = objc_claimAutoreleasedReturnValue();
    bugSessions = v5->_bugSessions;
    v5->_bugSessions = (NSSet *)v54;

  }
  return v5;
}

+ (id)currentDevice
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAddress:", &stru_24D1E6AF0);
  +[DEDUtils osBuild](DEDUtils, "osBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBuild:", v3);

  +[DEDUtils deviceColor](DEDUtils, "deviceColor");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColor:", v5);

  +[DEDUtils deviceClass](DEDUtils, "deviceClass");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceClass:", v7);

  +[DEDUtils deviceEnclosureColor](DEDUtils, "deviceEnclosureColor");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnclosureColor:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  +[DEDUtils uniqueDeviceSpecifier](DEDUtils, "uniqueDeviceSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ded:%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v12);

  +[DEDUtils deviceModel](DEDUtils, "deviceModel");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModel:", v14);

  +[DEDUtils deviceName](DEDUtils, "deviceName");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v16);

  +[DEDUtils deviceProductType](DEDUtils, "deviceProductType");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProductType:", v18);

  objc_msgSend(v2, "setStatus:", 1);
  objc_msgSend(v2, "setTransport:", 1);
  +[DEDUtils platform](DEDUtils, "platform");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlatform:", v20);

  objc_msgSend(v2, "setRemoteTransport:", 1);
  +[DEDCapability allCapabilities](DEDCapability, "allCapabilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCapabilities:", v21);

  +[DEDUtils deviceUniformTypeIdentifier](DEDUtils, "deviceUniformTypeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUniformTypeIdentifier:", v22);

  return v2;
}

+ (id)deviceWithDictionary:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("address"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddress:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("build"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBuild:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("color"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceClass"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceClass:", v12);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enclosureColor"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnclosureColor:", v14);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v16);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("model"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModel:", v18);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v20);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productType"));
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductType:", v22);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:", objc_msgSend(v23, "integerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("transport"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransport:", objc_msgSend(v24, "integerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("platform"));
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlatform:", v26);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("remoteTransport"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteTransport:", objc_msgSend(v27, "integerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("capabilities"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    +[DEDCapability decodeCapabilitiesString:](DEDCapability, "decodeCapabilitiesString:", v28);
  else
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCapabilities:", v29);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hardwareCodename"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHardwareCodename:", v30);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSerialNumber:", v31);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeButtonType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeButtonType:", objc_msgSend(v32, "integerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uniformTypeIdentifier"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniformTypeIdentifier:", v33);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("idsIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdsIdentifier:", v34);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("companionDeviceIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompanionDeviceIdentifier:", v35);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeTheaterSystemName"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeTheaterSystemName:", v36);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeTheaterSystemIdentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeTheaterSystemIdentifier:", v37);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mediaSystemName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaSystemName:", v38);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mediaSystemRole"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaSystemRole:", objc_msgSend(v39, "integerValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mediaSystemIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaSystemIdentifier:", v40);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mediaRemoteIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaRemoteIdentifier:", v41);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homeKitIdentifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHomeKitIdentifier:", v42);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isHomeKitResident"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsHomeKitResident:", objc_msgSend(v43, "BOOLValue"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bugSessions"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bugSessions"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setWithArray:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBugSessions:", v47);

  }
  return v4;
}

+ (id)deviceForSFDevice:(id)a3 andStatus:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;

  v5 = a3;
  +[DEDDevice nilSafeDevice](DEDDevice, "nilSafeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", v9);

    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAddress:", v12);

    objc_msgSend(v6, "setBuild:", &stru_24D1E6AF0);
    objc_msgSend(v5, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDUtils deviceClassForProductType:](DEDUtils, "deviceClassForProductType:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeviceClass:", v14);

    objc_msgSend(v5, "name");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v16);

    objc_msgSend(v5, "model");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModel:", v18);

    objc_msgSend(v6, "setStatus:", a4);
    objc_msgSend(v6, "setTransport:", 3);
    objc_msgSend(v6, "setRemoteTransport:", 3);
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCapabilities:", v19);

    objc_msgSend(v6, "setSfDevice:", v5);
  }

  return v6;
}

+ (id)deviceForSFDevice:(id)a3 systemInfo:(id)a4 andStatus:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;

  v7 = a3;
  v8 = a4;
  +[DEDDevice nilSafeDevice](DEDDevice, "nilSafeDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v12);

    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAddress:", v15);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("osBuild"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBuild:", v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("model"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDUtils deviceClassForProductType:](DEDUtils, "deviceClassForProductType:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceClass:", v19);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("name"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v21);

    objc_msgSend(v7, "model");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22
      && (v23 = (void *)v22,
          objc_msgSend(v7, "model"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "length"),
          v24,
          v23,
          v25))
    {
      objc_msgSend(v7, "model");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      stringIfNil(v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("model"));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      +[DEDUtils modelForProductType:](DEDUtils, "modelForProductType:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v27;
    objc_msgSend(v9, "setModel:", v27);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("model"));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProductType:", v30);

    objc_msgSend(v9, "setTransport:", 3);
    objc_msgSend(v9, "setRemoteTransport:", 3);
    objc_msgSend(v9, "setStatus:", a5);
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCapabilities:", v31);

    objc_msgSend(v9, "setSfDevice:", v7);
  }

  return v9;
}

+ (id)idsDeviceWithDevice:(id)a3 address:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = (__CFString *)a4;
  +[DEDDevice nilSafeDevice](DEDDevice, "nilSafeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    stringIfNil(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v8);

    stringIfNil(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAddress:", v9);

    objc_msgSend(v5, "productBuildVersion");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBuild:", v11);

    objc_msgSend(v5, "modelIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDUtils deviceClassForProductType:](DEDUtils, "deviceClassForProductType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceClass:", v13);

    objc_msgSend(v5, "name");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v15);

    objc_msgSend(v5, "productName");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModel:", v17);

    objc_msgSend(v5, "modelIdentifier");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    stringIfNil(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProductType:", v19);

    objc_msgSend(v7, "setTransport:", 4);
    objc_msgSend(v7, "setRemoteTransport:", 4);
    objc_msgSend(v7, "setStatus:", 3);
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCapabilities:", v20);

    objc_msgSend(v5, "uniqueIDOverride");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdsIdentifier:", v21);

  }
  return v7;
}

- (id)serialize
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice address](self, "address");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("address"));

  -[DEDDevice build](self, "build");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("build"));

  -[DEDDevice color](self, "color");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  -[DEDDevice deviceClass](self, "deviceClass");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceClass"));

  -[DEDDevice enclosureColor](self, "enclosureColor");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("enclosureColor"));

  -[DEDDevice identifier](self, "identifier");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("identifier"));

  -[DEDDevice model](self, "model");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("model"));

  -[DEDDevice name](self, "name");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("name"));

  -[DEDDevice productType](self, "productType");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("productType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DEDDevice status](self, "status"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("status"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DEDDevice transport](self, "transport"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("transport"));

  -[DEDDevice platform](self, "platform");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  stringIfNil(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("platform"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DEDDevice remoteTransport](self, "remoteTransport"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("remoteTransport"));

  -[DEDDevice capabilities](self, "capabilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDCapability encodeCapabilitySet:](DEDCapability, "encodeCapabilitySet:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("capabilities"));

  -[DEDDevice hardwareCodename](self, "hardwareCodename");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("hardwareCodename"));

  -[DEDDevice serialNumber](self, "serialNumber");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("serialNumber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DEDDevice homeButtonType](self, "homeButtonType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("homeButtonType"));

  -[DEDDevice uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("uniformTypeIdentifier"));

  -[DEDDevice idsIdentifier](self, "idsIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("idsIdentifier"));

  -[DEDDevice companionDeviceIdentifier](self, "companionDeviceIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("companionDeviceIdentifier"));

  -[DEDDevice homeTheaterSystemName](self, "homeTheaterSystemName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("homeTheaterSystemName"));

  -[DEDDevice homeTheaterSystemIdentifier](self, "homeTheaterSystemIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("homeTheaterSystemIdentifier"));

  -[DEDDevice mediaSystemName](self, "mediaSystemName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("mediaSystemName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DEDDevice mediaSystemRole](self, "mediaSystemRole"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("mediaSystemRole"));

  -[DEDDevice mediaSystemIdentifier](self, "mediaSystemIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("mediaSystemIdentifier"));

  -[DEDDevice mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("mediaRemoteIdentifier"));

  -[DEDDevice homeKitIdentifier](self, "homeKitIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("homeKitIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DEDDevice isHomeKitResident](self, "isHomeKitResident"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isHomeKitResident"));

  -[DEDDevice bugSessions](self, "bugSessions");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[DEDDevice bugSessions](self, "bugSessions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "allObjects");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("bugSessions"));

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[DEDDevice serialize](self, "serialize", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDDevice deviceWithDictionary:](DEDDevice, "deviceWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_currentDeviceId
{
  if (_currentDeviceId_onceToken != -1)
    dispatch_once(&_currentDeviceId_onceToken, &__block_literal_global_10);
  return (id)_currentDeviceId_selfIdentifier;
}

void __29__DEDDevice__currentDeviceId__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_currentDeviceId_selfIdentifier;
  _currentDeviceId_selfIdentifier = v0;

}

- (BOOL)isCurrentDevice
{
  void *v2;
  void *v3;
  char v4;

  -[DEDDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_currentDeviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice platform](self, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice productType](self, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DEDDevice status](self, "status");
  if ((unint64_t)(v7 - 1) > 3)
    v8 = "Unknown";
  else
    v8 = off_24D1E5380[v7 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR("\nDEDDevice: %@ %@ (%@) -- %s"), v4, v5, v6, v8);

  v9 = -[DEDDevice transport](self, "transport");
  if (v9 > 4)
    v10 = "Unknown";
  else
    v10 = off_24D1E53A0[v9];
  -[DEDDevice publicLogSafeIdentifier](self, "publicLogSafeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%s (%@)"), v10, v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)publicLogDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DEDDevice productType](self, "productType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[DEDDevice isEqualToDevice:](self, "isEqualToDevice:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DEDDevice;
    v5 = -[DEDDevice isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEqualToDevice:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (self == a3)
    return 1;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)hashingKey
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int64_t v7;

  -[DEDDevice _hashingKey](self, "_hashingKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_7;
  if (-[DEDDevice isCurrentDevice](self, "isCurrentDevice"))
  {
    -[DEDDevice identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i-%@"), 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    -[DEDDevice set_hashingKey:](self, "set_hashingKey:", v5);

LABEL_7:
    -[DEDDevice _hashingKey](self, "_hashingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v6 = -[DEDDevice isTemporaryDevice](self, "isTemporaryDevice");
  -[DEDDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DEDDevice remoteTransport](self, "remoteTransport");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i-%@"), v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;

  return v5;
}

- (BOOL)isLikeDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(v4, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
    goto LABEL_8;
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[DEDDevice deviceClass](self, "deviceClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[DEDDevice name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[DEDDevice build](self, "build");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "build");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

      }
      else
      {
        v13 = 0;
      }

      goto LABEL_12;
    }
LABEL_8:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)isMoreCompleteThan:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[DEDDevice isTemporaryDevice](self, "isTemporaryDevice");
  LODWORD(v6) = objc_msgSend(v4, "isTemporaryDevice");
  if (v5 == (_DWORD)v6)
  {
    -[DEDDevice serialize](self, "serialize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __32__DEDDevice_isMoreCompleteThan___block_invoke((uint64_t)v7, v7);
    objc_msgSend(v4, "serialize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v6 > __32__DEDDevice_isMoreCompleteThan___block_invoke((uint64_t)v8, v8);

  }
  return v6;
}

uint64_t __32__DEDDevice_isMoreCompleteThan___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v12 = a2;
  objc_msgSend(v12, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;

          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("unspecified")) & 1) == 0
            && (objc_msgSend(v10, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
          {
            v6 += objc_msgSend(v10, "length");
          }
          v5 = v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return v6;
}

+ (id)nilSafeDevice
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAddress:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setBuild:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setColor:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setDeviceClass:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setEnclosureColor:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setIdentifier:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setModel:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setName:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setProductType:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setPlatform:", &stru_24D1E6AF0);
  objc_msgSend(v2, "setSfDevice:", 0);
  +[DEDCapability allCapabilities](DEDCapability, "allCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCapabilities:", v3);

  return v2;
}

- (BOOL)hasCapabilities:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[DEDDevice capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isSubsetOfSet:", v5);

  return v6;
}

- (BOOL)isRemote
{
  return -[DEDDevice remoteTransport](self, "remoteTransport") != 1;
}

- (NSString)publicLogSafeIdentifier
{
  void *v3;

  if (-[DEDDevice status](self, "status") == 3
    && (-[DEDDevice transport](self, "transport") == 4 || -[DEDDevice remoteTransport](self, "remoteTransport") == 4))
  {
    -[DEDDevice idsIdentifier](self, "idsIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DEDDevice identifier](self, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)isTemporaryDevice
{
  void *v3;
  void *v4;
  char v5;

  -[DEDDevice identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)hashingKeyForTempDevice
{
  void *v3;
  int64_t v4;
  void *v5;

  -[DEDDevice address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DEDDevice remoteTransport](self, "remoteTransport");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i-%@"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)currentDeviceWithDaemonInfo
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
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

  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDUtils deviceHardwareCodename](DEDUtils, "deviceHardwareCodename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHardwareCodename:", v3);

  +[DEDUtils deviceSerialNumber](DEDUtils, "deviceSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSerialNumber:", v4);

  v5 = +[DEDUtils deviceHomeButtonType](DEDUtils, "deviceHomeButtonType");
  if (v5 < 3)
    v6 = v5 + 1;
  else
    v6 = 0;
  objc_msgSend(v2, "setHomeButtonType:", v6);
  v7 = (void *)IDSCopyLocalDeviceUniqueID();
  objc_msgSend(v2, "setIdsIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForProperty:", *MEMORY[0x24BE6B400]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ded:%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCompanionDeviceIdentifier:", v11);

  }
  +[DEDHomeKitManager sharedInstance](DEDHomeKitManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeTheaterSystemName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHomeTheaterSystemName:", v13);

  +[DEDHomeKitManager sharedInstance](DEDHomeKitManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeTheaterSystemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHomeTheaterSystemIdentifier:", v15);

  +[DEDRapportManager sharedInstance](DEDRapportManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaSystemName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaSystemName:", v17);

  +[DEDRapportManager sharedInstance](DEDRapportManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaSystemRole:", objc_msgSend(v18, "mediaSystemRole"));

  +[DEDRapportManager sharedInstance](DEDRapportManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mediaSystemIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaSystemIdentifier:", v20);

  +[DEDRapportManager sharedInstance](DEDRapportManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mediaRemoteIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaRemoteIdentifier:", v22);

  +[DEDHomeKitManager sharedInstance](DEDHomeKitManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "homeKitIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHomeKitIdentifier:", v24);

  +[DEDHomeKitManager sharedInstance](DEDHomeKitManager, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsHomeKitResident:", objc_msgSend(v25, "isHomeKitResident"));

  +[DEDPersistence sharedInstance](DEDPersistence, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bugSessionIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBugSessions:", v27);

  return v2;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuild:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)color
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)enclosureColor
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnclosureColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)productType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProductType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)bugSessions
{
  return self->_bugSessions;
}

- (void)setBugSessions:(id)a3
{
  objc_storeStrong((id *)&self->_bugSessions, a3);
}

- (NSSet)capabilities
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (int64_t)remoteTransport
{
  return self->_remoteTransport;
}

- (void)setRemoteTransport:(int64_t)a3
{
  self->_remoteTransport = a3;
}

- (SFDevice)sfDevice
{
  return (SFDevice *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSfDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)hardwareCodename
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHardwareCodename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (NSString)uniformTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)idsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)companionDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCompanionDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)homeTheaterSystemName
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHomeTheaterSystemName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)homeTheaterSystemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setHomeTheaterSystemIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)mediaSystemName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMediaSystemName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (int64_t)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (void)setMediaSystemRole:(int64_t)a3
{
  self->_mediaSystemRole = a3;
}

- (NSString)mediaSystemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setMediaSystemIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)mediaRemoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setMediaRemoteIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)homeKitIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHomeKitIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)isHomeKitResident
{
  return self->_isHomeKitResident;
}

- (void)setIsHomeKitResident:(BOOL)a3
{
  self->_isHomeKitResident = a3;
}

- (NSString)_hashingKey
{
  return self->__hashingKey;
}

- (void)set_hashingKey:(id)a3
{
  objc_storeStrong((id *)&self->__hashingKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hashingKey, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemName, 0);
  objc_storeStrong((id *)&self->_homeTheaterSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeTheaterSystemName, 0);
  objc_storeStrong((id *)&self->_companionDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_hardwareCodename, 0);
  objc_storeStrong((id *)&self->_sfDevice, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_bugSessions, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)fetchIconImageDataForScale:(float)a3 completionCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  float v14;
  _QWORD block[5];
  id v16;

  v6 = a4;
  -[DEDDevice imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke;
    block[3] = &unk_24D1E4628;
    block[4] = self;
    v16 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v9 = v16;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_2;
    v12[3] = &unk_24D1E5DB0;
    v14 = a3;
    v12[4] = self;
    v13 = v6;
    v11 = v6;
    dispatch_async(v10, v12);

    v9 = v13;
  }

}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_2(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "imageURLForScale:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDImageResourceManager sharedInstance](DEDImageResourceManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_3;
  v6[3] = &unk_24D1E5D88;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "asynchronousDataFromURL:key:completionBlock:", v3, v5, v6);

}

void __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_4;
  v6[3] = &unk_24D1E4628;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __65__DEDDevice_UI__fetchIconImageDataForScale_completionCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)imageData
{
  DEDDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[DEDDevice identifier](v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[DEDImageResourceManager sharedInstance](DEDImageResourceManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDDevice identifier](v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedImageFromKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)imageURLForScale:(float)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v20;
  int v21;

  -[DEDDevice color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
    goto LABEL_7;
  -[DEDDevice enclosureColor](self, "enclosureColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[DEDDevice color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDDevice enclosureColor](self, "enclosureColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDDevice color](self, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("unknown")))
    {

    }
    else
    {
      -[DEDDevice enclosureColor](self, "enclosureColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("unknown"));

      if ((v14 & 1) == 0)
      {
        -[DEDDevice enclosureColor](self, "enclosureColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "intValue");

        if (v21)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-0"), v5);
        else
          objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_24D1E6AF0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
LABEL_7:
    v12 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:
  -[DEDDevice deviceClass](self, "deviceClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDevice productType](self, "productType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a3;
  -[DEDDevice imageURLForDeviceClass:deviceModel:deviceColor:size:variant:scale:](self, "imageURLForDeviceClass:deviceModel:deviceColor:size:variant:scale:", v15, v16, v12, 0, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 size:(int64_t)a6 variant:(int64_t)a7 scale:(float)a8
{
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;

  v13 = (__CFString *)a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://statici.icloud.com/fmipmobile/deviceImages-9.0/"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if ((unint64_t)a6 > 2)
    v19 = CFSTR("nolocation-ipad");
  else
    v19 = off_24D1E5DD0[a6];
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("AudioAccessory")))
  {

    v13 = CFSTR("HomePod");
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("%@/"), v21);

  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("%@"), v23);

  if (v15 && objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("-%@"), v25);

  }
  objc_msgSend(v18, "appendString:", CFSTR("/"));
  if ((unint64_t)(a7 - 1) > 2)
    v26 = CFSTR("online");
  else
    v26 = off_24D1E5DE8[a7 - 1];
  if (a8 <= 1.0)
    v27 = &stru_24D1E6AF0;
  else
    v27 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("__%.0fx"), a8);
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("RealityDevice")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://appleid.cdn-apple.com/static/deviceImages-12.0/RealityDevice/%@/online-sourcelist%@.png"), v14, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v18, "appendFormat:", CFSTR("%@-%@%@.png"), v26, v19, v27);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[DEDUtils sharedLog](DEDUtils, "sharedLog");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[DEDDevice(UI) imageURLForDeviceClass:deviceModel:deviceColor:size:variant:scale:].cold.1((uint64_t)v29, v30);

  return v29;
}

@end
