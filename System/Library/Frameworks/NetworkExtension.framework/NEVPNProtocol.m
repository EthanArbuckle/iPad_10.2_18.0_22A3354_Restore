@implementation NEVPNProtocol

- (NEVPNProtocol)initWithType:(int64_t)a3
{
  NEVPNProtocol *v4;
  NEVPNProtocol *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NEVPNProtocol;
  v4 = -[NEVPNProtocol init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_keychainDomain = 0;
    v4->_type = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }
  return v5;
}

- (NEVPNProtocol)initWithProtocolIdentifier:(id)a3
{
  id v4;
  NEVPNProtocol *v5;
  uint64_t v6;
  NSUUID *identifier;

  v4 = a3;
  v5 = -[NEVPNProtocol init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    *(_DWORD *)&v5->_excludeLocalNetworks = 16843009;
  }

  return v5;
}

- (NEVPNProtocol)initWithCoder:(id)a3
{
  id v4;
  NEVPNProtocol *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUUID *identifier;
  uint64_t v10;
  NSData *passwordReference;
  uint64_t v12;
  NSString *serverAddress;
  uint64_t v14;
  NSString *username;
  uint64_t v16;
  NEKeychainItem *passwordKeychainItem;
  uint64_t v18;
  NSString *passwordEncryption;
  uint64_t v20;
  NEIdentityKeychainItem *identity;
  uint64_t v22;
  NSData *identityDataInternal;
  uint64_t v24;
  NSString *identityDataPassword;
  uint64_t v26;
  NEKeychainItem *identityDataPasswordKeychainItem;
  uint64_t v28;
  NSData *identityDataHash;
  uint64_t v30;
  NEProxySettings *proxySettings;
  uint64_t v32;
  NEDNSSettings *DNSSettings;
  uint64_t v34;
  NSString *extensibleSSOProvider;
  uint64_t v36;
  NSString *sliceUUID;

  v4 = a3;
  v5 = -[NEVPNProtocol init](self, "init");
  if (v5)
  {
    v5->_type = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v8;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PasswordReference"));
    v10 = objc_claimAutoreleasedReturnValue();
    passwordReference = v5->_passwordReference;
    v5->_passwordReference = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServerAddress"));
    v12 = objc_claimAutoreleasedReturnValue();
    serverAddress = v5->_serverAddress;
    v5->_serverAddress = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Username"));
    v14 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
    v16 = objc_claimAutoreleasedReturnValue();
    passwordKeychainItem = v5->_passwordKeychainItem;
    v5->_passwordKeychainItem = (NEKeychainItem *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PasswordEncryption"));
    v18 = objc_claimAutoreleasedReturnValue();
    passwordEncryption = v5->_passwordEncryption;
    v5->_passwordEncryption = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identity"));
    v20 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityData"));
    v22 = objc_claimAutoreleasedReturnValue();
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataPassword"));
    v24 = objc_claimAutoreleasedReturnValue();
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataPasswordKeychainItem"));
    v26 = objc_claimAutoreleasedReturnValue();
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v26;

    v5->_identityDataImported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IdentityDataImported"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityDataHash"));
    v28 = objc_claimAutoreleasedReturnValue();
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxySettings"));
    v30 = objc_claimAutoreleasedReturnValue();
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v30;

    v5->_disconnectOnIdle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnIdle"));
    v5->_disconnectOnIdleTimeout = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DisconnectOnIdleTimeout"));
    v5->_disconnectOnSleep = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnSleep"));
    v5->_disconnectOnWake = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnWake"));
    v5->_disconnectOnWakeTimeout = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("DisconnectOnWakeTimeout"));
    v5->_disconnectOnUserSwitch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnUserSwitch"));
    v5->_disconnectOnLogout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisconnectOnLogoutKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNSSettings"));
    v32 = objc_claimAutoreleasedReturnValue();
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v32;

    v5->_includeAllNetworks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludeAllNetworks"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ExcludeLocalNetworks")))
      v5->_excludeLocalNetworks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExcludeLocalNetworks"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ExcludeCellularServices")))
      v5->_excludeCellularServices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExcludeCellularServices"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ExcludeAPNs")))
      v5->_excludeAPNs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExcludeAPNs"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ExcludeDeviceCommunication")))
      v5->_excludeDeviceCommunication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExcludeDeviceCommunication"));
    v5->_enforceRoutes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnforceRoutes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExtensibleSSOProvider"));
    v34 = objc_claimAutoreleasedReturnValue();
    extensibleSSOProvider = v5->_extensibleSSOProvider;
    v5->_extensibleSSOProvider = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CellularSliceUUID"));
    v36 = objc_claimAutoreleasedReturnValue();
    sliceUUID = v5->_sliceUUID;
    v5->_sliceUUID = (NSString *)v36;

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
  const char *v10;
  id Property;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol type](self, "type"), CFSTR("Type"));
  -[NEVPNProtocol identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  -[NEVPNProtocol passwordReference](self, "passwordReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("PasswordReference"));

  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("ServerAddress"));

  -[NEVPNProtocol username](self, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("Username"));

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("Password"));

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("PasswordEncryption"));

  if (self)
    Property = objc_getProperty(self, v10, 96, 1);
  else
    Property = 0;
  objc_msgSend(v20, "encodeObject:forKey:", Property, CFSTR("Identity"));
  -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("IdentityData"));

  -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("IdentityDataPassword"));

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("IdentityDataPasswordKeychainItem"));

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"), CFSTR("IdentityDataImported"));
  -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("IdentityDataHash"));

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("ProxySettings"));

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"), CFSTR("DisconnectOnIdle"));
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"), CFSTR("DisconnectOnIdleTimeout"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"), CFSTR("DisconnectOnSleep"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"), CFSTR("DisconnectOnWake"));
  objc_msgSend(v20, "encodeInt32:forKey:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"), CFSTR("DisconnectOnWakeTimeout"));
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("DNSSettings"));

  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"), CFSTR("IncludeAllNetworks"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"), CFSTR("ExcludeLocalNetworks"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"), CFSTR("ExcludeCellularServices"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"), CFSTR("ExcludeAPNs"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"), CFSTR("ExcludeDeviceCommunication"));
  objc_msgSend(v20, "encodeBool:forKey:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"), CFSTR("EnforceRoutes"));
  -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v18, CFSTR("ExtensibleSSOProvider"));

  -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("CellularSliceUUID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  id Property;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t keychainDomain;
  void *v20;
  void *v21;
  void *v22;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NEVPNProtocol identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithProtocolIdentifier:", v5);

  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServerAddress:", v7);

  -[NEVPNProtocol username](self, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUsername:", v8);

  -[NEVPNProtocol passwordReference](self, "passwordReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordReference:", v9);

  if (self)
  {
    Property = objc_getProperty(self, v10, 96, 1);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  Property = 0;
  if (v6)
LABEL_3:
    objc_setProperty_atomic(v6, v10, Property, 96);
LABEL_4:
  -[NEVPNProtocol identityDataInternal](self, "identityDataInternal", Property);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityDataInternal:", v12);

  -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityDataPassword:", v13);

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityDataPasswordKeychainItem:", v14);

  objc_msgSend(v6, "setIdentityDataImported:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"));
  -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentityDataHash:", v15);

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProxySettings:", v16);

  objc_msgSend(v6, "setDisconnectOnIdle:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"));
  objc_msgSend(v6, "setDisconnectOnIdleTimeout:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  objc_msgSend(v6, "setDisconnectOnSleep:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"));
  objc_msgSend(v6, "setDisconnectOnWake:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"));
  objc_msgSend(v6, "setDisconnectOnWakeTimeout:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordKeychainItem:", v17);

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordEncryption:", v18);

  if (!self)
  {
    keychainDomain = 0;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  keychainDomain = self->_keychainDomain;
  if (v6)
LABEL_6:
    v6[10] = keychainDomain;
LABEL_7:
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDNSSettings:", v20);

  objc_msgSend(v6, "setIncludeAllNetworks:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"));
  objc_msgSend(v6, "setExcludeLocalNetworks:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"));
  objc_msgSend(v6, "setExcludeCellularServices:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"));
  objc_msgSend(v6, "setExcludeAPNs:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"));
  objc_msgSend(v6, "setExcludeDeviceCommunication:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"));
  objc_msgSend(v6, "setEnforceRoutes:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"));
  -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtensibleSSOProvider:", v21);

  -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSliceUUID:", v22);

  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  if (-[NEVPNProtocol type](self, "type") == 2
    || (-[NEVPNProtocol serverAddress](self, "serverAddress"),
        v5 = objc_claimAutoreleasedReturnValue(),
        (id)v5,
        v5))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing server address"), v4);
  }
  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v5) = v5 & v9;
  }
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[NEVPNProtocol DNSSettings](self, "DNSSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "checkValidityAndCollectErrors:", v4);

    LOBYTE(v5) = v5 & v13;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const char *v19;
  id Property;
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
  void *v31;
  void *v32;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  if (self)
  {
    v9 = -[NEVPNProtocol type](self, "type") - 1;
    if (v9 > 5)
      v10 = CFSTR("<unknown>");
    else
      v10 = off_1E3CC4370[v9];
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("type"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  -[NEVPNProtocol identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("identifier"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a4 | 9;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("serverAddress"), v5, a4 | 9);

  -[NEVPNProtocol username](self, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("username"), v5, a4 | 9);

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("password"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("passwordEncryption"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NEVPNProtocol passwordReference](self, "passwordReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a4 | 8;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("passwordReference"), v5, v18);

  if (self)
    Property = objc_getProperty(self, v19, 96, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("identity"), v5, v8);
  -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    -[NEVPNProtocol identityDataInternal](self, "identityDataInternal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%lu bytes"), objc_msgSend(v23, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v24, CFSTR("identityData"), v5, v18);

  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("identityData"), v5, v18);
  }

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol identityDataImported](self, "identityDataImported"), CFSTR("identityDataImported"), v5, v8);
  -[NEVPNProtocol identityDataHash](self, "identityDataHash");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v25, CFSTR("identityDataHash"), v5, v8);

  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v26, CFSTR("identityDataPassword"), v5, v8);

  -[NEVPNProtocol identityReference](self, "identityReference");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v27, CFSTR("identityReference"), v5, v18);

  -[NEVPNProtocol identityDataPassword](self, "identityDataPassword");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v28, CFSTR("identityDataPassword"), v5, v13);

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v29, CFSTR("proxySettings"), v5, v18);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"), CFSTR("disconnectOnSleep"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"), CFSTR("disconnectOnIdle"), v5, v8);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"), CFSTR("disconnectOnIdleTimeout"), v5, v8);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"), CFSTR("disconnectOnWake"), v5, v8);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"), CFSTR("disconnectOnWakeTimeout"), v5, v8);
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v30, CFSTR("DNSSettings"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol includeAllNetworks](self, "includeAllNetworks"), CFSTR("includeAllNetworks"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeLocalNetworks](self, "excludeLocalNetworks"), CFSTR("excludeLocalNetworks"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeCellularServices](self, "excludeCellularServices"), CFSTR("excludeCellularServices"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeAPNs](self, "excludeAPNs"), CFSTR("excludeAPNs"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol excludeDeviceCommunication](self, "excludeDeviceCommunication"), CFSTR("excludeDeviceCommunication"), v5, v18);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocol enforceRoutes](self, "enforceRoutes"), CFSTR("enforceRoutes"), v5, v18);
  -[NEVPNProtocol extensibleSSOProvider](self, "extensibleSSOProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v31, CFSTR("extensibleSSOProvider"), v5, v8);

  -[NEVPNProtocol sliceUUID](self, "sliceUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v32, CFSTR("cellularSliceUUID"), v5, v13);

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEVPNProtocol serverAddress](self, "serverAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEVPNProtocol serverAddress](self, "serverAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE90A0]);

  }
  -[NEVPNProtocol username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEVPNProtocol username](self, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8F88]);

  }
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CE91A0]);

    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "identifier");
    else
      objc_msgSend(v11, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CE8F90]);

  }
  -[NEVPNProtocol passwordReference](self, "passwordReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEVPNProtocol passwordReference](self, "passwordReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PasswordReference"));

  }
  -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CE8F98]);

  }
  if (self && objc_getProperty(self, v17, 96, 1))
  {
    objc_msgSend(objc_getProperty(self, v19, 96, 1), "persistentReference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CE8FF0]);

  }
  -[NEVPNProtocol addDisconnectOptions:](self, "addDisconnectOptions:", v3);
  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyLegacyDictionary");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CE8BA8]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NEVPNProtocol *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  NSString *serverAddress;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  NSString *username;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  NSString *passwordEncryption;
  NEKeychainItem *v35;
  void *v36;
  uint64_t v37;
  NEKeychainItem *passwordKeychainItem;
  NEKeychainItem *v39;
  void *v40;
  uint64_t v41;
  NEKeychainItem *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  NEIdentityKeychainItem *v49;
  void *v50;
  SEL v51;
  NEIdentityKeychainItem *v52;
  SEL v53;
  uint64_t v54;
  void *v55;
  int v56;
  NEProxySettings *v57;
  void *v58;
  uint64_t v59;
  NEProxySettings *proxySettings;
  NEVPNProtocol *v61;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = isa_nsuuid(v5);

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NEVPNProtocol initWithProtocolIdentifier:](self, "initWithProtocolIdentifier:", v7);

    if (!v8)
      goto LABEL_27;
  }
  else
  {
    v8 = -[NEVPNProtocol init](self, "init");
    if (!v8)
      goto LABEL_27;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = isa_nsnumber(v9);

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNProtocolType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_type = (int)objc_msgSend(v11, "intValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNKeychainDomain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = isa_nsnumber(v12);

  if (v13)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNKeychainDomain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_keychainDomain = (int)objc_msgSend(v14, "intValue");

  }
  v15 = *MEMORY[0x1E0CE90A0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE90A0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = isa_nsstring(v16);

  if (v17)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    serverAddress = v8->_serverAddress;
    v8->_serverAddress = (NSString *)v19;

  }
  else
  {
    v18 = v8->_serverAddress;
    v8->_serverAddress = (NSString *)&stru_1E3CC53C8;
  }

  v21 = *MEMORY[0x1E0CE8F88];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F88]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = isa_nsstring(v22);

  if (v23)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    username = v8->_username;
    v8->_username = (NSString *)v25;

  }
  v27 = *MEMORY[0x1E0CE8F90];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F90]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = isa_nsstring(v28);

  if (v29)
  {
    v30 = *MEMORY[0x1E0CE8F98];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F98]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = isa_nsstring(v31);

    if (v32)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v30);
      v33 = objc_claimAutoreleasedReturnValue();
      passwordEncryption = v8->_passwordEncryption;
      v8->_passwordEncryption = (NSString *)v33;

      if (-[NSString isEqualToString:](v8->_passwordEncryption, "isEqualToString:", *MEMORY[0x1E0CE91A0]))
      {
        v35 = [NEKeychainItem alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[NEKeychainItem initWithLegacyIdentifier:domain:accessGroup:](v35, "initWithLegacyIdentifier:domain:accessGroup:", v36, v8->_keychainDomain, v8->_keychainAccessGroup);
        passwordKeychainItem = v8->_passwordKeychainItem;
        v8->_passwordKeychainItem = (NEKeychainItem *)v37;

      }
    }
    if (!v8->_passwordKeychainItem)
    {
      v39 = [NEKeychainItem alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", v27);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v39, "initWithPassword:domain:accessGroup:", v40, v8->_keychainDomain, v8->_keychainAccessGroup);
      v42 = v8->_passwordKeychainItem;
      v8->_passwordKeychainItem = (NEKeychainItem *)v41;

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PasswordReference"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = isa_nsdata(v43);

  if (v44)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PasswordReference"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setPasswordReference:](v8, "setPasswordReference:", v45);

  }
  v46 = *MEMORY[0x1E0CE8FF0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FF0]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = isa_nsdata(v47);

  if (v48)
  {
    v49 = [NEIdentityKeychainItem alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v49, "initWithPersistentReference:domain:accessGroup:", v50, v8->_keychainDomain, objc_getProperty(v8, v51, 88, 1));
    objc_setProperty_atomic(v8, v53, v52, 96);

  }
  -[NEVPNProtocol initDisconnectOptions:](v8, "initDisconnectOptions:", v4);
  v54 = *MEMORY[0x1E0CE8BA8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8BA8]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = isa_nsdictionary(v55);

  if (v56)
  {
    v57 = [NEProxySettings alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", v54);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[NEProxySettings initFromLegacyDictionary:](v57, "initFromLegacyDictionary:", v58);
    proxySettings = v8->_proxySettings;
    v8->_proxySettings = (NEProxySettings *)v59;

  }
  v61 = v8;
LABEL_27:

  return v8;
}

- (void)addDisconnectOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[NEVPNProtocol disconnectOnIdle](self, "disconnectOnIdle"))
    v5 = &unk_1E3D037F0;
  else
    v5 = &unk_1E3D03808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8FC0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNProtocol disconnectOnIdleTimeout](self, "disconnectOnIdleTimeout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CE8FC8]);

  if (-[NEVPNProtocol disconnectOnSleep](self, "disconnectOnSleep"))
    v7 = &unk_1E3D037F0;
  else
    v7 = &unk_1E3D03808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8FD8]);
  if (-[NEVPNProtocol disconnectOnWake](self, "disconnectOnWake"))
    v8 = &unk_1E3D037F0;
  else
    v8 = &unk_1E3D03808;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CE8FE0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NEVPNProtocol disconnectOnWakeTimeout](self, "disconnectOnWakeTimeout"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE8FE8]);

}

- (void)initDisconnectOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsnumber(v4))
    self->_disconnectOnIdle = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v5))
    self->_disconnectOnIdleTimeout = objc_msgSend(v5, "intValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v6))
    self->_disconnectOnSleep = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v7))
    self->_disconnectOnWake = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v8))
    self->_disconnectOnWakeTimeout = objc_msgSend(v8, "intValue");

}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  char v11;

  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copyLegacyDictionary");

  }
  v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v5, (const __CFString *)*MEMORY[0x1E0CE8C00], a3);
  if (v5)
    CFRelease(v5);
  if (!v7)
    return 0;
  -[NEVPNProtocol DNSSettings](self, "DNSSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEVPNProtocol DNSSettings](self, "DNSSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const __CFDictionary *)objc_msgSend(v9, "copyLegacyDictionary");

  }
  else
  {
    v10 = 0;
  }
  v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, v10, (const __CFString *)*MEMORY[0x1E0CE8BE8], a3);
  if (v10)
    CFRelease(v10);
  return v11;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  id v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  id v10;

  v5 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E0CE8C00], a3);
  if (v5)
  {
    v6 = v5;
    v7 = -[NEProxySettings initFromLegacyDictionary:]([NEProxySettings alloc], "initFromLegacyDictionary:", v5);
    -[NEVPNProtocol setProxySettings:](self, "setProxySettings:", v7);

    CFRelease(v6);
  }
  v8 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E0CE8BE8], a3);
  if (v8)
  {
    v9 = v8;
    v10 = -[NEDNSSettings initFromLegacyDictionary:]([NEDNSSettings alloc], "initFromLegacyDictionary:", v8);
    -[NEVPNProtocol setDNSSettings:](self, "setDNSSettings:", v10);

    CFRelease(v9);
  }
  return 1;
}

- (__SCNetworkInterface)createInterface
{
  return 0;
}

- (void)setIdentityReferenceInternal:(id)a3
{
  NEVPNProtocol *v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  NEIdentityKeychainItem *v9;
  int64_t keychainDomain;
  id Property;
  const char *v12;
  NEIdentityKeychainItem *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v14)
  {
    if (v4 && objc_getProperty(v4, v5, 96, 1))
    {
      v7 = objc_getProperty(v4, v6, 96, 1);
      objc_msgSend(v7, "setPersistentReference:", v14);
    }
    else
    {
      v9 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        keychainDomain = v4->_keychainDomain;
        Property = objc_getProperty(v4, v8, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v7 = Property;
      v13 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:](v9, "initWithPersistentReference:domain:accessGroup:", v14, keychainDomain, v7);
      if (v4)
        objc_setProperty_atomic(v4, v12, v13, 96);

    }
  }
  else if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 96);
  }
  objc_sync_exit(v4);

}

- (NSData)identityReferenceInternal
{
  NEVPNProtocol *v2;
  const char *v3;
  const char *v4;
  id v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96, 1))
  {
    v5 = objc_getProperty(v2, v4, 96, 1);
    objc_msgSend(v5, "persistentReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSData *)v6;
}

- (void)setIdentityData:(NSData *)identityData
{
  NSData *v4;
  NSData *v5;
  void *v6;
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = identityData;
  -[NEVPNProtocol setIdentityDataInternal:](self, "setIdentityDataInternal:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CC_SHA1_Init(&v7);
    v5 = objc_retainAutorelease(v4);
    CC_SHA1_Update(&v7, -[NSData bytes](v5, "bytes"), -[NSData length](v5, "length"));
    CC_SHA1_Final(md, &v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNProtocol setIdentityDataHash:](self, "setIdentityDataHash:", v6);

  }
  else
  {
    -[NEVPNProtocol setIdentityDataHash:](self, "setIdentityDataHash:", 0);
  }

}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  id v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (self)
  {
    v5 = objc_getProperty(self, a2, 96, 1);
    if (v5)
    {
      v7 = v5;
      v8 = objc_msgSend(objc_getProperty(self, v6, 96, 1), "domain");

      if (v8 == a3)
        objc_msgSend(objc_getProperty(self, v9, 96, 1), "sync");
    }
  }
  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "HTTPServer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v12);

      objc_msgSend(v11, "HTTPSServer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v13);

      objc_msgSend(v11, "FTPServer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v14);

      objc_msgSend(v11, "RTSPServer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v15);

      objc_msgSend(v11, "gopherServer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v16);

      objc_msgSend(v11, "SOCKSServer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer syncWithKeychain](v17);

    }
    -[NEVPNProtocol setIdentityDataPassword:](self, "setIdentityDataPassword:", 0);
  }
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NEKeychainItem *v12;
  void *v13;
  const char *v14;
  void *v15;
  int64_t keychainDomain;
  id Property;
  NEKeychainItem *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v8 = a5;
  -[NEVPNProtocol syncWithKeychainInDomainCommon:](self, "syncWithKeychainInDomainCommon:", a3);
  -[NEVPNProtocol username](self, "username");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [NEKeychainItem alloc];
      objc_msgSend(v25, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        keychainDomain = self->_keychainDomain;
        Property = objc_getProperty(self, v14, 88, 1);
      }
      else
      {
        keychainDomain = 0;
        Property = 0;
      }
      v18 = -[NEKeychainItem initWithIdentifier:domain:accessGroup:](v12, "initWithIdentifier:domain:accessGroup:", v15, keychainDomain, Property);
      -[NEVPNProtocol setPasswordKeychainItem:](self, "setPasswordKeychainItem:", v18);

    }
  }
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "domain");

    if (v22 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol username](self, "username");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", v25, v24, 0, v8);

    }
  }

}

- (BOOL)needToUpdateKeychain
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL updated;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v25;

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "password");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
        return 1;
    }
    else
    {

    }
  }
  -[NEVPNProtocol proxySettings](self, "proxySettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "HTTPServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    updated = -[NEProxyServer needToUpdateKeychain](v14);

    if (updated)
      goto LABEL_12;
    objc_msgSend(v13, "HTTPSServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NEProxyServer needToUpdateKeychain](v16);

    if (v17)
      goto LABEL_12;
    objc_msgSend(v13, "FTPServer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NEProxyServer needToUpdateKeychain](v18);

    if (v19)
      goto LABEL_12;
    objc_msgSend(v13, "RTSPServer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NEProxyServer needToUpdateKeychain](v20);

    if (v21
      || (objc_msgSend(v13, "gopherServer"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = -[NEProxyServer needToUpdateKeychain](v22),
          v22,
          v23))
    {
LABEL_12:
      v11 = 1;
    }
    else
    {
      objc_msgSend(v13, "SOCKSServer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NEProxyServer needToUpdateKeychain](v25);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "domain");

    if (v10 == a3)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIdentifier:", 0);

    }
  }
  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "HTTPServer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v14);

      objc_msgSend(v13, "HTTPSServer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v15);

      objc_msgSend(v13, "FTPServer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v16);

      objc_msgSend(v13, "RTSPServer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v17);

      objc_msgSend(v13, "gopherServer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v18);

      objc_msgSend(v13, "SOCKSServer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEProxyServer removeFromKeychain](v19);

    }
  }
  -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v22 = (void *)v20;
    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "domain");

    if (v24 == a3)
    {
      -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setIdentifier:", 0);

    }
  }
  if (!a4 && self)
  {
    if (objc_getProperty(self, v21, 96, 1))
    {
      objc_msgSend(objc_getProperty(self, v26, 96, 1), "remove");
      -[NEVPNProtocol setIdentityData:](self, "setIdentityData:", 0);
    }
  }
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  id v4;

  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migrateFromPreferences:", a3);

}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!a3)
  {
    -[NEVPNProtocol proxySettings](self, "proxySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "copyPasswordsFromKeychain");

    -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NEVPNProtocol identityDataPasswordKeychainItem](self, "identityDataPasswordKeychainItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "copyPassword");
      -[NEVPNProtocol setIdentityDataPassword:](self, "setIdentityDataPassword:", v6);

    }
  }
}

- (id)description
{
  return -[NEVPNProtocol descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerAddress:(NSString *)serverAddress
{
  objc_setProperty_atomic_copy(self, a2, serverAddress, 32);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsername:(NSString *)username
{
  objc_setProperty_atomic_copy(self, a2, username, 40);
}

- (NSData)passwordReference
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPasswordReference:(NSData *)passwordReference
{
  objc_setProperty_atomic_copy(self, a2, passwordReference, 48);
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
  objc_setProperty_atomic_copy(self, a2, identityDataPassword, 56);
}

- (BOOL)disconnectOnSleep
{
  return self->_disconnectOnSleep;
}

- (void)setDisconnectOnSleep:(BOOL)disconnectOnSleep
{
  self->_disconnectOnSleep = disconnectOnSleep;
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
{
  objc_setProperty_atomic_copy(self, a2, proxySettings, 64);
}

- (BOOL)includeAllNetworks
{
  return self->_includeAllNetworks;
}

- (void)setIncludeAllNetworks:(BOOL)includeAllNetworks
{
  self->_includeAllNetworks = includeAllNetworks;
}

- (BOOL)excludeLocalNetworks
{
  return self->_excludeLocalNetworks;
}

- (void)setExcludeLocalNetworks:(BOOL)excludeLocalNetworks
{
  self->_excludeLocalNetworks = excludeLocalNetworks;
}

- (BOOL)excludeCellularServices
{
  return self->_excludeCellularServices;
}

- (void)setExcludeCellularServices:(BOOL)excludeCellularServices
{
  self->_excludeCellularServices = excludeCellularServices;
}

- (BOOL)excludeAPNs
{
  return self->_excludeAPNs;
}

- (void)setExcludeAPNs:(BOOL)excludeAPNs
{
  self->_excludeAPNs = excludeAPNs;
}

- (BOOL)excludeDeviceCommunication
{
  return self->_excludeDeviceCommunication;
}

- (void)setExcludeDeviceCommunication:(BOOL)a3
{
  self->_excludeDeviceCommunication = a3;
}

- (BOOL)enforceRoutes
{
  return self->_enforceRoutes;
}

- (void)setEnforceRoutes:(BOOL)enforceRoutes
{
  self->_enforceRoutes = enforceRoutes;
}

- (NSString)sliceUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSliceUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)disconnectOnWake
{
  return self->_disconnectOnWake;
}

- (void)setDisconnectOnWake:(BOOL)a3
{
  self->_disconnectOnWake = a3;
}

- (int)disconnectOnWakeTimeout
{
  return self->_disconnectOnWakeTimeout;
}

- (void)setDisconnectOnWakeTimeout:(int)a3
{
  self->_disconnectOnWakeTimeout = a3;
}

- (NEKeychainItem)passwordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPasswordKeychainItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)passwordEncryption
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPasswordEncryption:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIdentityDataInternal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIdentityDataHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 152, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDNSSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSString)extensibleSSOProvider
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExtensibleSSOProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (BOOL)disconnectOnIdle
{
  return self->_disconnectOnIdle;
}

- (void)setDisconnectOnIdle:(BOOL)a3
{
  self->_disconnectOnIdle = a3;
}

- (int)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setDisconnectOnIdleTimeout:(int)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (BOOL)disconnectOnUserSwitch
{
  return self->_disconnectOnUserSwitch;
}

- (void)setDisconnectOnUserSwitch:(BOOL)a3
{
  self->_disconnectOnUserSwitch = a3;
}

- (BOOL)disconnectOnLogout
{
  return self->_disconnectOnLogout;
}

- (void)setDisconnectOnLogout:(BOOL)a3
{
  self->_disconnectOnLogout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensibleSSOProvider, 0);
  objc_storeStrong((id *)&self->_DNSSettings, 0);
  objc_storeStrong((id *)&self->_identityDataPasswordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identityDataHash, 0);
  objc_storeStrong((id *)&self->_identityDataInternal, 0);
  objc_storeStrong((id *)&self->_passwordEncryption, 0);
  objc_storeStrong((id *)&self->_passwordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_sliceUUID, 0);
  objc_storeStrong((id *)&self->_proxySettings, 0);
  objc_storeStrong((id *)&self->_identityDataPassword, 0);
  objc_storeStrong((id *)&self->_passwordReference, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
