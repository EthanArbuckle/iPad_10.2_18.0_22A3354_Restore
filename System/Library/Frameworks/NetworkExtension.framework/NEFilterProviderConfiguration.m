@implementation NEFilterProviderConfiguration

- (NEFilterProviderConfiguration)initWithCoder:(id)a3
{
  id v4;
  NEFilterProviderConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *vendorConfiguration;
  uint64_t v14;
  NSString *serverAddress;
  uint64_t v16;
  NSString *username;
  uint64_t v18;
  NSString *organization;
  uint64_t v20;
  NSData *passwordReference;
  uint64_t v22;
  NSData *identityReference;
  uint64_t v24;
  NSString *pluginType;
  uint64_t v26;
  NSString *dataProviderDesignatedRequirement;
  uint64_t v28;
  NSString *packetProviderDesignatedRequirement;
  uint64_t v30;
  NSURL *dataProviderURL;
  uint64_t v32;
  NSURL *packetProviderURL;
  uint64_t v34;
  NSString *keychainAccessGroup;
  uint64_t v36;
  NSString *filterDataProviderBundleIdentifier;
  uint64_t v38;
  NSString *filterPacketProviderBundleIdentifier;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NEFilterProviderConfiguration;
  v5 = -[NEFilterProviderConfiguration init](&v41, sel_init);
  if (v5)
  {
    v5->_filterBrowsers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FilterBrowsers"));
    v5->_filterPackets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FilterPackets"));
    v5->_filterSockets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FilterSockets"));
    v5->_disableDefaultDrop = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableDefaultDrop"));
    v5->_preserveExistingConnections = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PreserveExistingConnections"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("VendorConfiguration"));
    v12 = objc_claimAutoreleasedReturnValue();
    vendorConfiguration = v5->_vendorConfiguration;
    v5->_vendorConfiguration = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Username"));
    v16 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Organization"));
    v18 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
    v20 = objc_claimAutoreleasedReturnValue();
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identity"));
    v22 = objc_claimAutoreleasedReturnValue();
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PluginType"));
    v24 = objc_claimAutoreleasedReturnValue();
    pluginType = v5->_pluginType;
    v5->_pluginType = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataProviderDesignatedRequirement"));
    v26 = objc_claimAutoreleasedReturnValue();
    dataProviderDesignatedRequirement = v5->_dataProviderDesignatedRequirement;
    v5->_dataProviderDesignatedRequirement = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PacketProviderDesignatedRequirement"));
    v28 = objc_claimAutoreleasedReturnValue();
    packetProviderDesignatedRequirement = v5->_packetProviderDesignatedRequirement;
    v5->_packetProviderDesignatedRequirement = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataProviderURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    dataProviderURL = v5->_dataProviderURL;
    v5->_dataProviderURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PacketProviderURL"));
    v32 = objc_claimAutoreleasedReturnValue();
    packetProviderURL = v5->_packetProviderURL;
    v5->_packetProviderURL = (NSURL *)v32;

    v5->_controlProviderInitialized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ControlProviderInitialized"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeychainAccessGroup"));
    v34 = objc_claimAutoreleasedReturnValue();
    keychainAccessGroup = v5->_keychainAccessGroup;
    v5->_keychainAccessGroup = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataProviderBundleIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    filterDataProviderBundleIdentifier = v5->_filterDataProviderBundleIdentifier;
    v5->_filterDataProviderBundleIdentifier = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PacketProviderBundleIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    filterPacketProviderBundleIdentifier = v5->_filterPacketProviderBundleIdentifier;
    v5->_filterPacketProviderBundleIdentifier = (NSString *)v38;

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
  SEL v15;
  id Property;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"), CFSTR("FilterBrowsers"));
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"), CFSTR("FilterPackets"));
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"), CFSTR("FilterSockets"));
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"), CFSTR("DisableDefaultDrop"));
  objc_msgSend(v19, "encodeBool:forKey:", -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"), CFSTR("PreserveExistingConnections"));
  -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v4, CFSTR("VendorConfiguration"));

  -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("ServerAddress"));

  -[NEFilterProviderConfiguration username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v6, CFSTR("Username"));

  -[NEFilterProviderConfiguration organization](self, "organization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v7, CFSTR("Organization"));

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v8, CFSTR("Password"));

  -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v9, CFSTR("Identity"));

  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v10, CFSTR("PluginType"));

  -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v11, CFSTR("DataProviderDesignatedRequirement"));

  -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v12, CFSTR("PacketProviderDesignatedRequirement"));

  -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v13, CFSTR("DataProviderURL"));

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v14, CFSTR("PacketProviderURL"));

  if (self)
  {
    objc_msgSend(v19, "encodeBool:forKey:", self->_controlProviderInitialized, CFSTR("ControlProviderInitialized"));
    Property = objc_getProperty(self, v15, 96, 1);
  }
  else
  {
    objc_msgSend(v19, "encodeBool:forKey:", 0, CFSTR("ControlProviderInitialized"));
    Property = 0;
  }
  objc_msgSend(v19, "encodeObject:forKey:", Property, CFSTR("KeychainAccessGroup"));
  -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier](self, "filterDataProviderBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v17, CFSTR("DataProviderBundleIdentifier"));

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v18, CFSTR("PacketProviderBundleIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEFilterProviderConfiguration *v4;
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
  const char *v16;
  BOOL controlProviderInitialized;
  id Property;
  void *v19;
  void *v20;

  v4 = -[NEFilterProviderConfiguration init](+[NEFilterProviderConfiguration allocWithZone:](NEFilterProviderConfiguration, "allocWithZone:", a3), "init");
  -[NEFilterProviderConfiguration setFilterBrowsers:](v4, "setFilterBrowsers:", -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"));
  -[NEFilterProviderConfiguration setFilterPackets:](v4, "setFilterPackets:", -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"));
  -[NEFilterProviderConfiguration setFilterSockets:](v4, "setFilterSockets:", -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"));
  -[NEFilterProviderConfiguration setDisableDefaultDrop:](v4, "setDisableDefaultDrop:", -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"));
  -[NEFilterProviderConfiguration setPreserveExistingConnections:](v4, "setPreserveExistingConnections:", -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"));
  -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setVendorConfiguration:](v4, "setVendorConfiguration:", v5);

  -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setServerAddress:](v4, "setServerAddress:", v6);

  -[NEFilterProviderConfiguration username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setUsername:](v4, "setUsername:", v7);

  -[NEFilterProviderConfiguration organization](self, "organization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setOrganization:](v4, "setOrganization:", v8);

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPasswordReference:](v4, "setPasswordReference:", v9);

  -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setIdentityReference:](v4, "setIdentityReference:", v10);

  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPluginType:](v4, "setPluginType:", v11);

  -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setDataProviderDesignatedRequirement:](v4, "setDataProviderDesignatedRequirement:", v12);

  -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPacketProviderDesignatedRequirement:](v4, "setPacketProviderDesignatedRequirement:", v13);

  -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setDataProviderURL:](v4, "setDataProviderURL:", v14);

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setPacketProviderURL:](v4, "setPacketProviderURL:", v15);

  if (self)
  {
    controlProviderInitialized = self->_controlProviderInitialized;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  controlProviderInitialized = 0;
  if (v4)
LABEL_3:
    v4->_controlProviderInitialized = controlProviderInitialized;
LABEL_4:
  if (!self)
  {
    Property = 0;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  Property = objc_getProperty(self, v16, 96, 1);
  if (v4)
LABEL_6:
    objc_setProperty_atomic_copy(v4, v16, Property, 96);
LABEL_7:
  -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier](self, "filterDataProviderBundleIdentifier", Property);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setFilterDataProviderBundleIdentifier:](v4, "setFilterDataProviderBundleIdentifier:", v19);

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFilterProviderConfiguration setFilterPacketProviderBundleIdentifier:](v4, "setFilterPacketProviderBundleIdentifier:", v20);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (!v5)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing plugin type"), v4);
  if (!-[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers")
    && !-[NEFilterProviderConfiguration filterSockets](self, "filterSockets")
    && !-[NEFilterProviderConfiguration filterPackets](self, "filterPackets"))
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("At least one of filterBrowsers, filterSockets, or filterPackets must be enabled"), v4);
    v6 = 0;
  }

  return v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEFilterProviderConfiguration pluginType](self, "pluginType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("pluginType"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration dataProviderDesignatedRequirement](self, "dataProviderDesignatedRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("dataProviderDesignatedRequirement"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration packetProviderDesignatedRequirement](self, "packetProviderDesignatedRequirement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("packetProviderDesignatedRequirement"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration filterDataProviderBundleIdentifier](self, "filterDataProviderBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("dataProviderBundleIdentifier"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration filterPacketProviderBundleIdentifier](self, "filterPacketProviderBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("packetProviderBundleIdentifier"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration dataProviderURL](self, "dataProviderURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("dataProviderURL"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration packetProviderURL](self, "packetProviderURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("packetProviderURL"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEFilterProviderConfiguration vendorConfiguration](self, "vendorConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a4 | 8;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("vendorConfiguration"), v5, a4 | 8);

  -[NEFilterProviderConfiguration serverAddress](self, "serverAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 9uLL;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("serverAddress"), v5, a4);

  -[NEFilterProviderConfiguration username](self, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("username"), v5, a4);

  -[NEFilterProviderConfiguration organization](self, "organization");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("organization"), v5, a4);

  -[NEFilterProviderConfiguration passwordReference](self, "passwordReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("passwordReference"), v5, v16);

  -[NEFilterProviderConfiguration identityReference](self, "identityReference");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v21, CFSTR("identityReference"), v5, v16);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterBrowsers](self, "filterBrowsers"), CFSTR("filterBrowsers"), v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterPackets](self, "filterPackets"), CFSTR("filterPackets"), v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration filterSockets](self, "filterSockets"), CFSTR("filterSockets"), v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration disableDefaultDrop](self, "disableDefaultDrop"), CFSTR("disableDefaultDrop"), v5, v16);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEFilterProviderConfiguration preserveExistingConnections](self, "preserveExistingConnections"), CFSTR("preserveExistingConnections"), v5, v16);
  return v7;
}

- (BOOL)filterBrowsers
{
  return self->_filterBrowsers;
}

- (void)setFilterBrowsers:(BOOL)filterBrowsers
{
  self->_filterBrowsers = filterBrowsers;
}

- (BOOL)filterSockets
{
  return self->_filterSockets;
}

- (void)setFilterSockets:(BOOL)filterSockets
{
  self->_filterSockets = filterSockets;
}

- (BOOL)filterPackets
{
  return self->_filterPackets;
}

- (void)setFilterPackets:(BOOL)filterPackets
{
  self->_filterPackets = filterPackets;
}

- (NSDictionary)vendorConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVendorConfiguration:(NSDictionary *)vendorConfiguration
{
  objc_setProperty_atomic_copy(self, a2, vendorConfiguration, 16);
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
  objc_setProperty_atomic_copy(self, a2, serverAddress, 24);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUsername:(NSString *)username
{
  objc_setProperty_atomic_copy(self, a2, username, 32);
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOrganization:(NSString *)organization
{
  objc_setProperty_atomic_copy(self, a2, organization, 40);
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
  objc_setProperty_atomic_copy(self, a2, passwordReference, 48);
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentityReference:(NSData *)identityReference
{
  objc_setProperty_atomic_copy(self, a2, identityReference, 56);
}

- (NSString)filterDataProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilterDataProviderBundleIdentifier:(NSString *)filterDataProviderBundleIdentifier
{
  objc_setProperty_atomic_copy(self, a2, filterDataProviderBundleIdentifier, 64);
}

- (NSString)filterPacketProviderBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFilterPacketProviderBundleIdentifier:(NSString *)filterPacketProviderBundleIdentifier
{
  objc_setProperty_atomic_copy(self, a2, filterPacketProviderBundleIdentifier, 72);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPluginType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)packetProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPacketProviderDesignatedRequirement:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)disableDefaultDrop
{
  return self->_disableDefaultDrop;
}

- (void)setDisableDefaultDrop:(BOOL)a3
{
  self->_disableDefaultDrop = a3;
}

- (BOOL)preserveExistingConnections
{
  return self->_preserveExistingConnections;
}

- (void)setPreserveExistingConnections:(BOOL)a3
{
  self->_preserveExistingConnections = a3;
}

- (NSURL)dataProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDataProviderURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSURL)packetProviderURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPacketProviderURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)dataProviderDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataProviderDesignatedRequirement:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_packetProviderURL, 0);
  objc_storeStrong((id *)&self->_dataProviderURL, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_packetProviderDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_filterPacketProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_filterDataProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityReference, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);
  objc_storeStrong((id *)&self->_vendorConfiguration, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
