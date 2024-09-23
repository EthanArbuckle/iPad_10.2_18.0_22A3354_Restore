@implementation NETunnelProviderProtocol

- (void)setPluginType:(id)a3
{
  NSString *v4;
  NSString *pluginType;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  NETunnelProviderProtocol *v9;
  __CFString *v10;
  id v11;

  v11 = a3;
  if (!self->_pluginType)
  {
    v4 = (NSString *)objc_msgSend(v11, "copy");
    pluginType = self->_pluginType;
    self->_pluginType = v4;

  }
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v6);

  if (v7)
  {
    self->super._keychainDomain = 0;
    v9 = self;
    v10 = 0;
  }
  else
  {
    self->super._keychainDomain = 1;
    v10 = CFSTR("com.apple.managed.vpn.shared");
    v9 = self;
  }
  objc_setProperty_atomic(v9, v8, v10, 88);

}

- (NETunnelProviderProtocol)init
{
  NETunnelProviderProtocol *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NETunnelProviderProtocol;
  result = -[NEVPNProtocol initWithType:](&v3, sel_initWithType_, 4);
  if (result)
    result->super._keychainDomain = 0;
  return result;
}

- (NETunnelProviderProtocol)initWithPluginType:(id)a3
{
  id v4;
  NETunnelProviderProtocol *v5;
  NETunnelProviderProtocol *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol initWithType:](&v8, sel_initWithType_, 4);
  v6 = v5;
  if (v5)
  {
    -[NETunnelProviderProtocol setPluginType:](v5, "setPluginType:", v4);
    v6->_authenticationMethod = 0;
  }

  return v6;
}

- (NETunnelProviderProtocol)initWithCoder:(id)a3
{
  id v4;
  NETunnelProviderProtocol *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *vendorInfo;
  uint64_t v15;
  NSString *authenticationPluginType;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *providerConfiguration;
  uint64_t v25;
  NSString *providerBundleIdentifier;
  uint64_t v27;
  NSString *designatedRequirement;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PluginType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NETunnelProviderProtocol setPluginType:](v5, "setPluginType:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("VendorInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    vendorInfo = v5->_vendorInfo;
    v5->_vendorInfo = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AuthenticationPluginType"));
    v15 = objc_claimAutoreleasedReturnValue();
    authenticationPluginType = v5->_authenticationPluginType;
    v5->_authenticationPluginType = (NSString *)v15;

    v5->_authenticationMethod = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AuthenticationMethod"));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("VendorConfiguration"));
    v23 = objc_claimAutoreleasedReturnValue();
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NEProviderBundleIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DesignatedRequirement"));
    v27 = objc_claimAutoreleasedReturnValue();
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v27;

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NETunnelProviderProtocol;
  v4 = a3;
  -[NEVPNProtocol encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[NETunnelProviderProtocol pluginType](self, "pluginType", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PluginType"));

  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("VendorInfo"));

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AuthenticationPluginType"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"), CFSTR("AuthenticationMethod"));
  -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("VendorConfiguration"));

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("NEProviderBundleIdentifier"));

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("DesignatedRequirement"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  id Property;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NETunnelProviderProtocol;
  v4 = -[NEVPNProtocol copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPluginType:", v5);

  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorInfo:", v6);

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthenticationPluginType:", v7);

  objc_msgSend(v4, "setAuthenticationMethod:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"));
  -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderConfiguration:", v8);

  if (self)
    Property = objc_getProperty(self, v9, 88, 1);
  else
    Property = 0;
  v12 = Property;
  if (v4)
    objc_setProperty_atomic(v4, v11, v12, 88);

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderBundleIdentifier:", v13);

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesignatedRequirement:", v14);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol checkValidityAndCollectErrors:](&v8, sel_checkValidityAndCollectErrors_, v4);
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing plugin type"), v4);
    v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v18.receiver = self;
  v18.super_class = (Class)NETunnelProviderProtocol;
  -[NEVPNProtocol descriptionWithIndent:options:](&v18, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  v10 = a4 & 0xFFFFFFFFFFFFFFF7;
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("pluginType"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("vendorInfo"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("authenticationPluginType"), v5, a4 & 0xFFFFFFFFFFFFFFF7);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod"), CFSTR("authenticationMethod"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 8uLL;
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("providerConfiguration"), v5, a4);

  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("providerBundleIdentifier"), v5, a4);

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("designatedRequirement"), v5, v10);

  return v9;
}

- (id)copyLegacyDictionary
{
  id v3;
  int64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NETunnelProviderProtocol;
  v3 = -[NEVPNProtocol copyLegacyDictionary](&v12, sel_copyLegacyDictionary);
  v4 = -[NETunnelProviderProtocol authenticationMethod](self, "authenticationMethod");
  if (v4)
  {
    if (v4 != 1)
      goto LABEL_6;
    v5 = (_QWORD *)MEMORY[0x1E0CE91A8];
  }
  else
  {
    v5 = (_QWORD *)MEMORY[0x1E0CE91B0];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v5, *MEMORY[0x1E0CE8FA8]);
LABEL_6:
  -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NETunnelProviderProtocol authenticationPluginType](self, "authenticationPluginType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8FA0]);

  }
  -[NETunnelProviderProtocol vendorInfo](self, "vendorInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_vendorInfo);
  -[NETunnelProviderProtocol providerBundleIdentifier](self, "providerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("NEProviderBundleIdentifier"));

  -[NETunnelProviderProtocol designatedRequirement](self, "designatedRequirement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("DesignatedRequirement"));

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol initFromLegacyDictionary:](&v24, sel_initFromLegacyDictionary_, v4);
  if (!v5)
    goto LABEL_15;
  if (initFromLegacyDictionary__initOurKeys != -1)
    dispatch_once(&initFromLegacyDictionary__initOurKeys, &__block_literal_global_20977);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("__NEVPNPluginType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPluginType:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v7))
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE91B0]) & 1) != 0)
    {
      v8 = 0;
LABEL_9:
      v5[28] = v8;
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CE91A8]))
    {
      v8 = 1;
      goto LABEL_9;
    }
  }
LABEL_10:
  v9 = *MEMORY[0x1E0CE8FA0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8FA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = isa_nsstring(v10);

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    v14 = (void *)v5[26];
    v5[26] = v13;

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  objc_msgSend(v15, "removeObjectsForKeys:", initFromLegacyDictionary__nsprotocolkeys);
  if (!objc_msgSend(v15, "count"))
  {

    v15 = 0;
  }
  v16 = (void *)v5[27];
  v5[27] = v15;
  v17 = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NEProviderBundleIdentifier"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v5[23];
  v5[23] = v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DesignatedRequirement"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v5[25];
  v5[25] = v20;

  v22 = v5;
LABEL_15:

  return v5;
}

- (__SCNetworkInterface)createInterface
{
  const __SCNetworkInterface *v2;
  __CFString *v3;
  const __SCNetworkInterface *v4;
  __SCNetworkInterface *v5;

  v2 = (const __SCNetworkInterface *)*MEMORY[0x1E0CE8BB8];
  -[NETunnelProviderProtocol pluginType](self, "pluginType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = SCNetworkInterfaceCreateWithInterface(v2, v3);

  if (!v4)
    return 0;
  v5 = SCNetworkInterfaceCreateWithInterface(v4, (CFStringRef)*MEMORY[0x1E0CE8BE0]);
  CFRelease(v4);
  return v5;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  _BOOL4 v5;
  const __SCNetworkInterface *Interface;
  SCNetworkInterfaceRef v7;
  const __SCNetworkInterface *v8;
  const __CFDictionary *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol setServiceProtocolsInService:](&v14, sel_setServiceProtocolsInService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface
      && (v7 = SCNetworkInterfaceGetInterface(Interface)) != 0
      && (v8 = v7,
          -[NETunnelProviderProtocol providerConfiguration](self, "providerConfiguration"),
          v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v8) = SCNetworkInterfaceSetConfiguration(v8, v9),
          v9,
          !(_DWORD)v8))
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = SCError();
        v12 = SCErrorString(v11);
        *(_DWORD *)buf = 136315394;
        v16 = "-[NETunnelProviderProtocol setServiceProtocolsInService:]";
        v17 = 2080;
        v18 = v12;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%s: SCNetworkInterfaceSetConfiguration failed: %s", buf, 0x16u);
      }

      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  _BOOL4 v5;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NETunnelProviderProtocol;
  v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v9, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    Interface = SCNetworkServiceGetInterface(a3);
    if (Interface)
    {
      v7 = SCNetworkInterfaceGetInterface(Interface);
      if (v7)
        -[NETunnelProviderProtocol setProviderConfiguration:](self, "setProviderConfiguration:", SCNetworkInterfaceGetConfiguration(v7));
    }
  }
  return v5;
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NETunnelProviderProtocol;
  -[NEVPNProtocol copyPasswordsFromKeychainInDomain:](&v16, sel_copyPasswordsFromKeychainInDomain_);
  -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "domain");

    if (v8 == a3)
    {
      -[NEVPNProtocol passwordEncryption](self, "passwordEncryption");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9
        || (v10 = (void *)v9,
            -[NEVPNProtocol passwordEncryption](self, "passwordEncryption"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CE91A0]),
            v11,
            v10,
            (v12 & 1) == 0))
      {
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copyData");
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setData:", v14);

      }
    }
  }
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  if (a3 == 1)
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem", 1, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "domain") == 1)
    {
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdentifier:", 0);
    }

    return;
  }
  if (!a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)NETunnelProviderProtocol;
    -[NEVPNProtocol removeKeychainItemsInDomain:keepIdentity:](&v8, sel_removeKeychainItemsInDomain_keepIdentity_, 0, a4);
  }
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NETunnelProviderProtocol;
  -[NEVPNProtocol syncWithKeychainInDomain:configuration:suffix:](&v14, sel_syncWithKeychainInDomain_configuration_suffix_, a3, a4, a5);
  if (a3 == 1)
  {
    -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "domain") == 1)
      {
        -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "persistentReference");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          -[NEVPNProtocol passwordReference](self, "passwordReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            return;
          -[NEVPNProtocol passwordKeychainItem](self, "passwordKeychainItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "persistentReference");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEVPNProtocol setPasswordReference:](self, "setPasswordReference:", v9);
        }
        else
        {

        }
      }

    }
  }
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
  objc_setProperty_atomic_copy(self, a2, providerConfiguration, 176);
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
  objc_setProperty_atomic_copy(self, a2, providerBundleIdentifier, 184);
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDesignatedRequirement:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSString)authenticationPluginType
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAuthenticationPluginType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSDictionary)vendorInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setVendorInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorInfo, 0);
  objc_storeStrong((id *)&self->_authenticationPluginType, 0);
  objc_storeStrong((id *)&self->_designatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

void __53__NETunnelProviderProtocol_initFromLegacyDictionary___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[37];

  v16[36] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CE8F80];
  v16[0] = *MEMORY[0x1E0CE8F78];
  v16[1] = v0;
  v1 = *MEMORY[0x1E0CE8F90];
  v16[2] = *MEMORY[0x1E0CE8F88];
  v16[3] = v1;
  v2 = *MEMORY[0x1E0CE8FA0];
  v16[4] = *MEMORY[0x1E0CE8F98];
  v16[5] = v2;
  v3 = *MEMORY[0x1E0CE8FB0];
  v16[6] = *MEMORY[0x1E0CE8FA8];
  v16[7] = v3;
  v4 = *MEMORY[0x1E0CE8FC0];
  v16[8] = *MEMORY[0x1E0CE8FB8];
  v16[9] = v4;
  v5 = *MEMORY[0x1E0CE8FD0];
  v16[10] = *MEMORY[0x1E0CE8FC8];
  v16[11] = v5;
  v6 = *MEMORY[0x1E0CE8FE0];
  v16[12] = *MEMORY[0x1E0CE8FD8];
  v16[13] = v6;
  v7 = *MEMORY[0x1E0CE8FF0];
  v16[14] = *MEMORY[0x1E0CE8FE8];
  v16[15] = v7;
  v8 = *MEMORY[0x1E0CE9000];
  v16[16] = *MEMORY[0x1E0CE8FF8];
  v16[17] = v8;
  v9 = *MEMORY[0x1E0CE9010];
  v16[18] = *MEMORY[0x1E0CE9008];
  v16[19] = v9;
  v10 = *MEMORY[0x1E0CE9028];
  v16[20] = *MEMORY[0x1E0CE9018];
  v16[21] = v10;
  v11 = *MEMORY[0x1E0CE9088];
  v16[22] = *MEMORY[0x1E0CE9020];
  v16[23] = v11;
  v12 = *MEMORY[0x1E0CE9098];
  v16[24] = *MEMORY[0x1E0CE9090];
  v16[25] = v12;
  v13 = *MEMORY[0x1E0CE90A8];
  v16[26] = *MEMORY[0x1E0CE90A0];
  v16[27] = v13;
  v16[28] = *MEMORY[0x1E0CE90B0];
  v16[29] = CFSTR("ReassertionTimer");
  v16[30] = *MEMORY[0x1E0CE8BA8];
  v16[31] = CFSTR("__NEVPNProtocolType");
  v16[32] = CFSTR("__NEVPNPluginType");
  v16[33] = CFSTR("__NEVPNProtocolIdentifier");
  v16[34] = CFSTR("NEProviderBundleIdentifier");
  v16[35] = CFSTR("DesignatedRequirement");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 36);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)initFromLegacyDictionary__nsprotocolkeys;
  initFromLegacyDictionary__nsprotocolkeys = v14;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isLegacyPluginType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.cisco.anyconnect.applevpn.plugin")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ac-otc-authen.vpn.plugin")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("net.juniper.sslvpn")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".vpnplugin"));
  }

  return v4;
}

@end
