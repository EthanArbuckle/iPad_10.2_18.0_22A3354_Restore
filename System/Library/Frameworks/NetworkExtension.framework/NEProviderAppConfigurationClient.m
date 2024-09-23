@implementation NEProviderAppConfigurationClient

- (NEProviderAppConfigurationClient)initWithClientName:(id)a3
{
  id v4;
  NEProviderAppConfigurationClient *v5;
  void *v6;
  NSString *v7;
  NSString *targetAppBundleID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEProviderAppConfigurationClient;
  v5 = -[NEUtilConfigurationClient initInternalWithClientName:](&v10, sel_initInternalWithClientName_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v7 = (NSString *)v4;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    targetAppBundleID = v5->_targetAppBundleID;
    v5->_targetAppBundleID = v7;

  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE425330);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_1E3CC39A8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v14);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_1E3CC39A8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v12);
  objc_msgSend(v7, "resume");
  if (self)
    objc_setProperty_atomic(self, v10, v7, 136);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

- (void)handleConfigChanged:(id)a3
{
  if (self)
    objc_setProperty_atomic(self, a2, 0, 120);
}

- (BOOL)enabled
{
  NEProviderAppConfigurationClient *v2;
  int *v3;
  const char *v4;

  if (self)
  {
    v2 = self;
    v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88, 1))
    {
      v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v2, v4, 96, 1))
      {
        v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v2, v4, 104, 1))
          v3 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
      }
    }
    self = (NEProviderAppConfigurationClient *)objc_getProperty(v2, v4, *v3, 1);
  }
  return -[NEProviderAppConfigurationClient isEnabled](self, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NEProviderAppConfigurationClient *v4;
  int *v5;
  const char *v6;

  v3 = a3;
  if (self)
  {
    v4 = self;
    v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    if (!objc_getProperty(self, a2, 88, 1))
    {
      v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
      if (!objc_getProperty(v4, v6, 96, 1))
      {
        v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
        if (!objc_getProperty(v4, v6, 104, 1))
          v5 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
      }
    }
    self = (NEProviderAppConfigurationClient *)objc_getProperty(v4, v6, *v5, 1);
  }
  -[NEProviderAppConfigurationClient setEnabled:](self, "setEnabled:", v3);
}

- (BOOL)onDemandEnabled
{
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
  return -[NEProviderAppConfigurationClient isOnDemandEnabled](self, "isOnDemandEnabled");
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
  -[NEProviderAppConfigurationClient setOnDemandEnabled:](self, "setOnDemandEnabled:", v3);
}

- (id)onDemandRules
{
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
  return -[NEProviderAppConfigurationClient onDemandRules](self, "onDemandRules");
}

- (void)setOnDemandRules:(id)a3
{
  const char *v4;
  id Property;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  if (self)
    Property = objc_getProperty(self, v4, 80, 1);
  else
    Property = 0;
  objc_msgSend(Property, "setOnDemandRules:", v6);

}

- (BOOL)isAlwaysOn
{
  return 0;
}

- (id)protocolForParameters:(id)a3
{
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 80, 1);
  return (id)-[NEProviderAppConfigurationClient protocolConfiguration](self, "protocolConfiguration", a3);
}

- (id)filterConfiguration
{
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 88, 1);
  return (id)-[NEProviderAppConfigurationClient providerConfiguration](self, "providerConfiguration");
}

- (id)dnsProxyConfiguration
{
  if (self)
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 96, 1);
  return (id)-[NEProviderAppConfigurationClient providerProtocol](self, "providerProtocol");
}

- (id)dnsSettingsBundle
{
  const char *v2;
  NEProviderAppConfigurationClient *v3;
  void *v4;

  if (self)
  {
    self = (NEProviderAppConfigurationClient *)objc_getProperty(self, a2, 104, 1);
    if (self)
      self = (NEProviderAppConfigurationClient *)objc_getProperty(self, v2, 40, 1);
  }
  v3 = self;
  -[NEProviderAppConfigurationClient dnsSettings](v3, "dnsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)createConfigurationWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  SEL v13;
  const char *v14;
  id v15;
  SEL v16;
  NETunnelProviderManager *v17;
  const char *v18;
  NETunnelProviderManager *v19;
  SEL v20;
  SEL v21;
  id v22;
  SEL v23;
  id v24;
  SEL v25;
  id Property;
  void *v27;
  const char *v28;
  const char *v29;
  id v30;
  SEL v31;
  id v32;
  __objc2_class *v33;
  void *v34;
  const char *v35;
  const char *v36;
  id v37;
  SEL v38;
  void *v39;
  const char *v40;
  const char *v41;
  id v42;
  SEL v43;
  id v44;
  void *v45;
  BOOL v46;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("lite")))
  {
    +[NEVPNManager sharedManager](NEVPNManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocalizedDescription:", v7);

    +[NEVPNManager sharedManager](NEVPNManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (self)
    {
      objc_setProperty_atomic(self, v11, v10, 80);

      if (!objc_getProperty(self, v13, 112, 1))
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v16, v15, 112);

      }
LABEL_10:
      v24 = objc_getProperty(self, v14, 112, 1);
      Property = objc_getProperty(self, v25, 80, 1);
LABEL_11:
      objc_msgSend(v24, "addObject:", Property);

      goto LABEL_31;
    }

    goto LABEL_36;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("packet-tunnel")))
  {
    v17 = objc_alloc_init(NETunnelProviderManager);
    v19 = v17;
    if (self)
    {
      objc_setProperty_atomic(self, v18, v17, 80);

      objc_msgSend(objc_getProperty(self, v20, 80, 1), "setLocalizedDescription:", v7);
      if (!objc_getProperty(self, v21, 112, 1))
      {
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v23, v22, 112);

      }
      goto LABEL_10;
    }

    objc_msgSend(0, "setLocalizedDescription:", v7);
LABEL_36:

    v24 = 0;
    Property = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("filter")))
  {
    +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLocalizedDescription:", v7);

    if (self)
    {
      if (!objc_getProperty(self, v28, 112, 1))
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v31, v30, 112);

      }
      v32 = objc_getProperty(self, v29, 112, 1);
    }
    else
    {

      v32 = 0;
    }
    v33 = NEFilterManager;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("dns-proxy")))
  {
    +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLocalizedDescription:", v7);

    if (self)
    {
      if (!objc_getProperty(self, v35, 112, 1))
      {
        v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v38, v37, 112);

      }
      v32 = objc_getProperty(self, v36, 112, 1);
    }
    else
    {

      v32 = 0;
    }
    v33 = NEDNSProxyManager;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("dns-settings")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid configuration type, valid types are \"lite\", \"packet-tunnel\", \"filter\", \"dns-proxy\", and \"dns-settings\"));
      v46 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLocalizedDescription:", v7);

    if (self)
    {
      if (!objc_getProperty(self, v40, 112, 1))
      {
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setProperty_atomic(self, v43, v42, 112);

      }
      v32 = objc_getProperty(self, v41, 112, 1);
    }
    else
    {

      v32 = 0;
    }
    v33 = NEDNSSettingsManager;
  }
  v44 = v32;
  -[__objc2_class sharedManager](v33, "sharedManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObject:", v45);

LABEL_31:
  v46 = 1;
LABEL_32:

  return v46;
}

- (BOOL)setProtocolWithParameters:(id)a3 errorStr:(id *)a4
{
  const char *v6;
  void *v7;
  id Property;
  id v9;
  char isKindOfClass;
  const char *v11;
  id v12;
  id v13;
  char v14;
  const char *v15;
  objc_class *v16;
  const char *v17;
  id v18;
  id v19;
  BOOL v20;
  __CFString *v21;
  id v23;
  id v24;
  char v25;
  const char *v26;
  __objc2_class **v27;
  const char *v28;
  NEFilterProviderConfiguration *v29;
  SEL v30;
  SEL v31;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v6, 80, 1);
  else
    Property = 0;
  v9 = Property;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (!self ? (v12 = 0) : (v12 = objc_getProperty(self, v11, 80, 1)),
        v13 = v12,
        objc_opt_class(),
        v14 = objc_opt_isKindOfClass(),
        v13,
        (v14 & 1) != 0))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("provider")))
    {
      v16 = (objc_class *)NETunnelProviderProtocol;
LABEL_9:
      v18 = objc_alloc_init(v16);
      if (self)
        v19 = objc_getProperty(self, v17, 80, 1);
      else
        v19 = 0;
      objc_msgSend(v19, "setProtocolConfiguration:", v18);

      goto LABEL_12;
    }
    v20 = 0;
    v21 = CFSTR("Invalid protocol type, valid type is \"provider\");
LABEL_14:
    *a4 = v21;
    goto LABEL_15;
  }
  if (self)
    v23 = objc_getProperty(self, v15, 80, 1);
  else
    v23 = 0;
  v24 = v23;
  objc_opt_class();
  v25 = objc_opt_isKindOfClass();

  if ((v25 & 1) != 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ikev1")) & 1) != 0)
    {
      v27 = off_1E3CBBEC8;
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ikev2")) & 1) == 0)
      {
        v20 = 0;
        v21 = CFSTR("Invalid protocol type, valid types are \"ikev1\" and \"ikev2\");
        goto LABEL_14;
      }
      v27 = off_1E3CBBEC0;
    }
    v16 = (objc_class *)*v27;
    goto LABEL_9;
  }
  if (self)
  {
    if (objc_getProperty(self, v26, 88, 1))
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("provider")) & 1) == 0)
      {
        v20 = 0;
        v21 = CFSTR("Invalid filter type, valid type is \"provider\");
        goto LABEL_14;
      }
      v29 = objc_alloc_init(NEFilterProviderConfiguration);
      v20 = 1;
      objc_msgSend(objc_getProperty(self, v30, 88, 1), "setProviderConfiguration:", v29);
    }
    else
    {
      v20 = 1;
      if (!objc_getProperty(self, v28, 96, 1))
        goto LABEL_15;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("provider")) & 1) == 0)
      {
        v20 = 0;
        v21 = CFSTR("Invalid DNS proxy type, valid type is \"provider\");
        goto LABEL_14;
      }
      v29 = objc_alloc_init(NEDNSProxyProviderProtocol);
      objc_msgSend(objc_getProperty(self, v31, 96, 1), "setProviderProtocol:", v29);
    }

    goto LABEL_15;
  }
LABEL_12:
  v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)setPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id Property;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  id v22;

  v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("password"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = isa_nsstring(v8);

  if (v9)
  {
    objc_msgSend(v7, "passwordReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("password"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    if (self)
      Property = objc_getProperty(self, v13, 80, 1);
    else
      Property = 0;
    objc_msgSend(Property, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.PASSWORD"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:](self, v12, v17, (uint64_t *)&v22);
    v19 = v22;

    v20 = (_DWORD)v18 == 0;
    if ((_DWORD)v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set the password in the keychain: %d"), v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "setPasswordReference:", v19);
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (BOOL)unsetPasswordWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("password"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = isa_nsstring(v8);
  if ((_DWORD)v6
    && (objc_msgSend(v7, "passwordReference"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
    && (objc_msgSend(v7, "passwordReference"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        (_DWORD)v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to delete the password keychain item: %d"), v11);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)setSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id Property;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  BOOL v20;
  id v22;

  v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-secret"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = isa_nsstring(v8);

  if (v9)
  {
    objc_msgSend(v7, "sharedSecretReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-secret"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    if (self)
      Property = objc_getProperty(self, v13, 80, 1);
    else
      Property = 0;
    objc_msgSend(Property, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.SHAREDSECRET"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v18 = -[NEProviderAppConfigurationClient setKeychainItemData:withName:persistentReference:](self, v12, v17, (uint64_t *)&v22);
    v19 = v22;

    v20 = (_DWORD)v18 == 0;
    if ((_DWORD)v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set the shared secret in the keychain: %d"), v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "setSharedSecretReference:", v19);
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (BOOL)unsetSharedSecretWithParameters:(id)a3 errorStr:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v6 = a3;
  -[NEProviderAppConfigurationClient protocolForParameters:](self, "protocolForParameters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shared-secret"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = isa_nsstring(v8);
  if ((_DWORD)v6
    && (objc_msgSend(v7, "sharedSecretReference"), v9 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9)
    && (objc_msgSend(v7, "sharedSecretReference"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NEProviderAppConfigurationClient deleteKeychainItemWithPersistentReference:]((uint64_t)self, v10),
        v10,
        (_DWORD)v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to delete the shared secret keychain item: %d"), v11);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)setProviderTypeWithParameters:(id)a3 errorStr:(id *)a4
{
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("provider-type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *a4 = CFSTR("The provider type cannot be specified for this configuration type");
  return v5 == 0;
}

- (void)handleCommand:(int)a3 forConfigWithName:(id)a4 withParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  const char *v15;
  SEL v16;
  SEL v17;
  void *v18;
  id v19;
  _QWORD *v20;
  id v21;
  _QWORD *v22;
  id v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  id v28;
  id v29;
  void *v30;
  const char *v31;
  void *v32;
  id Property;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  NEProviderAppConfigurationClient *v40;
  id v41;
  id v42;
  int v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  id location[5];
  id v57;
  id v58;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v13 = a6;
  if (self && self->_isServerMode)
  {
    if ((_DWORD)v8 == 31)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_133;
      v44[3] = &unk_1E3CC3C18;
      v44[4] = self;
      v45 = v28;
      v46 = v13;
      v29 = v28;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v44);

      v30 = v45;
    }
    else
    {
      if ((_DWORD)v8 != 30 || objc_msgSend(v10, "length"))
      {
        v18 = (void *)MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3;
        v38[3] = &unk_1E3CC3898;
        v39 = v10;
        v43 = v8;
        v42 = v13;
        v40 = self;
        v41 = v11;
        v19 = v39;
        v20 = v38;
        location[0] = v18;
        location[1] = (id)3221225472;
        location[2] = __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke;
        location[3] = &unk_1E3CC3C18;
        location[4] = self;
        v21 = v19;
        v57 = v21;
        v22 = v20;
        v58 = v22;
        -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, location);

        goto LABEL_22;
      }
      v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_128;
      v47[3] = &unk_1E3CC3C18;
      v47[4] = self;
      v48 = v37;
      v49 = v13;
      v29 = v37;
      -[NEProviderAppConfigurationClient loadAllWithCompletionHandler:](self, v47);

      v30 = v48;
    }

    goto LABEL_22;
  }
  if ((_DWORD)v8 == 102 || (_DWORD)v8 == 36)
  {
    -[NEUtilConfigurationClient clientName](self, "clientName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEUtilConfigurationClient removeClientWithName:](NEUtilConfigurationClient, "removeClientWithName:", v14);

    if (self)
    {
      objc_msgSend(objc_getProperty(self, v15, 136, 1), "invalidate");
      objc_setProperty_atomic(self, v16, 0, 136);
      objc_setProperty_atomic(self, v17, 0, 144);
    }
    else
    {
      objc_msgSend(0, "invalidate");
    }
    (*((void (**)(id, _QWORD))v13 + 2))(v13, MEMORY[0x1E0C9AA60]);
  }
  else if (self
         && (v23 = objc_getProperty(self, v12, 136, 1)) != 0
         && (v25 = v23, v26 = objc_getProperty(self, v24, 144, 1), v25, v26))
  {
    objc_msgSend(objc_getProperty(self, v27, 144, 1), "handleCommand:forConfigWithName:withParameters:completionHandler:", v8, v10, v11, v13);
  }
  else
  {
    objc_initWeak(location, self);
    +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      Property = objc_getProperty(self, v31, 128, 1);
    else
      Property = 0;
    v34 = Property;
    v35 = MEMORY[0x1E0C80D38];
    v36 = MEMORY[0x1E0C80D38];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke;
    v50[3] = &unk_1E3CC3848;
    objc_copyWeak(&v54, location);
    v55 = v8;
    v51 = v10;
    v52 = v11;
    v53 = v13;
    objc_msgSend(v32, "fetchClientListenerWithBundleID:completionQueue:handler:", v34, v35, v50);

    objc_destroyWeak(&v54);
    objc_destroyWeak(location);
  }
LABEL_22:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_targetAppBundleID, 0);
  objc_storeStrong((id *)&self->_currentManagers, 0);
  objc_storeStrong((id *)&self->_createdManagers, 0);
  objc_storeStrong((id *)&self->_dnsSettingsManager, 0);
  objc_storeStrong((id *)&self->_dnsProxyManager, 0);
  objc_storeStrong((id *)&self->_filterManager, 0);
  objc_storeStrong((id *)&self->_currentManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id WeakRetained;
  BOOL v6;
  void *v7;
  id Property;
  void *v9;
  id v10;
  void *v11;
  SEL v12;
  void *v13;
  SEL v14;
  SEL v15;
  id v16;
  id v17;
  void *v18;
  SEL v19;
  SEL v20;
  SEL v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v3 || (MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C81308] ? (v6 = WeakRetained == 0) : (v6 = 1), v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (WeakRetained)
      Property = objc_getProperty(WeakRetained, v4, 128, 1);
    else
      Property = 0;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Failed to establish an IPC connection to target app %@"), Property);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    objc_msgSend(v10, "_setEndpoint:", v3);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v10);
    objc_setProperty_atomic(WeakRetained, v12, v11, 136);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE425330);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(WeakRetained, v14, 136, 1), "setRemoteObjectInterface:", v13);

    v16 = objc_getProperty(WeakRetained, v15, 136, 1);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2;
    v22[3] = &unk_1E3CC45C8;
    v17 = WeakRetained;
    v23 = v17;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v17, v19, v18, 144);

    objc_msgSend(objc_getProperty(v17, v20, 136, 1), "resume");
    objc_msgSend(objc_getProperty(v17, v21, 144, 1), "handleCommand:forConfigWithName:withParameters:completionHandler:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v3, 120, 1);
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  v14 = *(id *)(a1 + 32);
  if (v14)
    v14 = objc_getProperty(v14, v13, 112, 1);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("Newly-created (unsaved) configurations:\n"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = *(id *)(a1 + 32);
    if (v16)
      v16 = objc_getProperty(v16, v15, 112, 1);
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)loadAllWithCompletionHandler:(void *)a1
{
  id v3;
  SEL v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  if (objc_getProperty(a1, v4, 120, 1))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E3CC4720;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v5 = v8;
  }
  else
  {
    +[NEVPNManager sharedManager](NEVPNManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E3CC4748;
    v9[4] = a1;
    v10 = v3;
    objc_msgSend(v6, "loadFromPreferencesWithCompletionHandler:", v9);

    v5 = v10;
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_133(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  Property = *(id *)(a1 + 32);
  v34 = v4;
  if (Property)
    Property = objc_getProperty(Property, v3, 120, 1);
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = *(void **)(a1 + 40);
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "localizedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (filter)"), v14, v34);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = *(void **)(a1 + 40);
            v15 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v11, "localizedDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (app-proxy)"), v14, v34);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = *(void **)(a1 + 40);
              v16 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v11, "localizedDescription");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (packet-tunnel)"), v14, v34);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v12 = *(void **)(a1 + 40);
                v17 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v11, "localizedDescription");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (lite)"), v14, v34);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v12 = *(void **)(a1 + 40);
                  v18 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v11, "localizedDescription");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (dns-proxy)"), v14, v34);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_21;
                  v12 = *(void **)(a1 + 40);
                  v19 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v11, "localizedDescription");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (dns-settings)"), v14, v34);
                }
              }
            }
          }
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

LABEL_21:
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }

  v22 = *(id *)(a1 + 32);
  if (v22)
    v22 = objc_getProperty(v22, v21, 112, 1);
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("Newly-created (unsaved) configurations:\n"));
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = *(id *)(a1 + 32);
    if (v24)
      v24 = objc_getProperty(v24, v23, 112, 1);
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(a1 + 40);
          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v29), "localizedDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ (packet-tunnel)\n"), v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v33);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  int *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  const char *v32;
  id v33;
  id v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  id Property;
  const char *v73;
  id v74;
  _QWORD *v75;
  id v76;
  uint64_t v77;
  id v78;
  const char *v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  const char *v97;
  void *v98;
  void *v99;
  const char *v100;
  id v101;
  void *v102;
  uint64_t v103;
  const char *v104;
  id v105;
  uint64_t v106;
  const char *v107;
  id v108;
  uint64_t v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  id v116;
  uint64_t v117;
  const char *v118;
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  _QWORD v134[8];
  _QWORD v135[8];
  _QWORD v136[8];
  _QWORD v137[8];
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  _QWORD v153[8];
  _QWORD v154[8];
  _QWORD v155[8];
  _QWORD v156[8];
  void *v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  uint64_t v164;
  _QWORD v165[2];

  v165[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v158 = 0;
  v159 = &v158;
  v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__19902;
  v162 = __Block_byref_object_dispose__19903;
  v163 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load configuration %@: %@"), *(_QWORD *)(a1 + 32), v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v159[5];
    v159[5] = v9;

    v11 = *(_QWORD *)(a1 + 56);
    v165[0] = v159[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    goto LABEL_3;
  }
  if (!v5 && *(_DWORD *)(a1 + 64) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuration with name \"%@\" does not exist"), *(_QWORD *)(a1 + 32));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v159[5];
    v159[5] = v23;

    v25 = *(_QWORD *)(a1 + 56);
    v164 = v159[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v164, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v12);
    goto LABEL_3;
  }
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    objc_setProperty_atomic(v13, v7, 0, 80);
    v15 = *(void **)(a1 + 40);
    if (v15)
    {
      objc_setProperty_atomic(v15, v14, 0, 88);
      v17 = *(void **)(a1 + 40);
      if (v17)
      {
        objc_setProperty_atomic(v17, v16, 0, 96);
        v19 = *(void **)(a1 + 40);
        if (v19)
          objc_setProperty_atomic(v19, v18, 0, 104);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(void **)(a1 + 40);
    if (!v21)
      goto LABEL_25;
    v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__currentManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(void **)(a1 + 40);
    if (!v21)
      goto LABEL_25;
    v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__filterManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(void **)(a1 + 40);
    if (!v21)
      goto LABEL_25;
    v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsProxyManager;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = *(void **)(a1 + 40);
    if (v21)
    {
      v22 = &OBJC_IVAR___NEProviderAppConfigurationClient__dnsSettingsManager;
LABEL_24:
      objc_setProperty_atomic(v21, v20, v5, *v22);
    }
  }
LABEL_25:
  v26 = *(_DWORD *)(a1 + 64);
  switch(v26)
  {
    case 1:
      v27 = *(void **)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v157 = (void *)v159[5];
      objc_msgSend(v27, "createConfigurationWithParameters:errorStr:", v28, &v157);
      v30 = v157;
      goto LABEL_64;
    case 2:
      v37 = *(void **)(a1 + 40);
      v38 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v152 = (void *)v159[5];
      objc_msgSend(v37, "setProtocolWithParameters:errorStr:", v38, &v152);
      v30 = v152;
      goto LABEL_64;
    case 3:
      v39 = *(void **)(a1 + 40);
      v40 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v151 = (void *)v159[5];
      objc_msgSend(v39, "setFilterPluginWithParameters:errorStr:", v40, &v151);
      v30 = v151;
      goto LABEL_64;
    case 4:
      v41 = *(void **)(a1 + 40);
      v42 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v150 = (void *)v159[5];
      objc_msgSend(v41, "unsetFilterPluginParameters:errorStr:", v42, &v150);
      v30 = v150;
      goto LABEL_64;
    case 5:
      v43 = *(void **)(a1 + 40);
      v44 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v149 = (void *)v159[5];
      objc_msgSend(v43, "setDNSProxyWithParameters:errorStr:", v44, &v149);
      v30 = v149;
      goto LABEL_64;
    case 6:
      v45 = *(void **)(a1 + 40);
      v46 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v148 = (void *)v159[5];
      objc_msgSend(v45, "unsetDNSProxyWithParameters:errorStr:", v46, &v148);
      v30 = v148;
      goto LABEL_64;
    case 7:
      v47 = *(void **)(a1 + 40);
      v48 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v147 = (void *)v159[5];
      objc_msgSend(v47, "setCommonParameters:errorStr:", v48, &v147);
      v30 = v147;
      goto LABEL_64;
    case 8:
      v49 = *(void **)(a1 + 40);
      v50 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v146 = (void *)v159[5];
      objc_msgSend(v49, "unsetCommonParameters:errorStr:", v50, &v146);
      v30 = v146;
      goto LABEL_64;
    case 9:
      v51 = *(void **)(a1 + 40);
      v52 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v145 = (void *)v159[5];
      objc_msgSend(v51, "setIPSecParameters:errorStr:", v52, &v145);
      v30 = v145;
      goto LABEL_64;
    case 10:
      v53 = *(void **)(a1 + 40);
      v54 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v144 = (void *)v159[5];
      objc_msgSend(v53, "unsetIPSecParameters:errorStr:", v54, &v144);
      v30 = v144;
      goto LABEL_64;
    case 11:
    case 12:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 31:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
LABEL_81:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown command"));
      v103 = objc_claimAutoreleasedReturnValue();
      v71 = (id)v159[5];
      v159[5] = v103;
      goto LABEL_65;
    case 13:
      v55 = *(void **)(a1 + 40);
      v56 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v143 = (void *)v159[5];
      objc_msgSend(v55, "addOnDemandRuleWithParameters:errorStr:", v56, &v143);
      v30 = v143;
      goto LABEL_64;
    case 14:
      v57 = *(void **)(a1 + 40);
      v58 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v142 = (void *)v159[5];
      objc_msgSend(v57, "removeOnDemandRuleWithParameters:errorStr:", v58, &v142);
      v30 = v142;
      goto LABEL_64;
    case 15:
      v59 = *(void **)(a1 + 40);
      v60 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v129 = (void *)v159[5];
      objc_msgSend(v59, "setProxyParameters:errorStr:", v60, &v129);
      v30 = v129;
      goto LABEL_64;
    case 16:
      v61 = *(void **)(a1 + 40);
      v62 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v128 = (void *)v159[5];
      objc_msgSend(v61, "unsetProxyParameters:errorStr:", v62, &v128);
      v30 = v128;
      goto LABEL_64;
    case 17:
      v63 = *(void **)(a1 + 40);
      v64 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v127 = (void *)v159[5];
      objc_msgSend(v63, "setProxyServer:errorStr:", v64, &v127);
      v30 = v127;
      goto LABEL_64;
    case 18:
      v65 = *(void **)(a1 + 40);
      v66 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v126 = (void *)v159[5];
      objc_msgSend(v65, "unsetProxyServer:errorStr:", v66, &v126);
      v30 = v126;
      goto LABEL_64;
    case 19:
      v67 = *(void **)(a1 + 40);
      v68 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v133 = (void *)v159[5];
      objc_msgSend(v67, "setDNSParameters:errorStr:", v68, &v133);
      v30 = v133;
      goto LABEL_64;
    case 20:
      v69 = *(void **)(a1 + 40);
      v70 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v132 = (void *)v159[5];
      objc_msgSend(v69, "unsetDNSParameters:errorStr:", v70, &v132);
      v30 = v132;
      goto LABEL_64;
    case 30:
      objc_msgSend(v5, "description");
      v71 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v71);
      goto LABEL_65;
    case 32:
      Property = *(id *)(a1 + 40);
      if (!Property)
        goto LABEL_102;
      if (objc_getProperty(Property, v20, 88, 1))
      {
        +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v137[0] = MEMORY[0x1E0C809B0];
        v137[1] = 3221225472;
        v137[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_5;
        v137[3] = &unk_1E3CC3870;
        v137[7] = &v158;
        v75 = v137;
        v76 = *(id *)(a1 + 32);
        v77 = *(_QWORD *)(a1 + 40);
        v137[4] = v76;
        v137[5] = v77;
        v137[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "saveToPreferencesWithCompletionHandler:", v137);
        goto LABEL_106;
      }
      Property = *(id *)(a1 + 40);
      if (!Property)
        goto LABEL_102;
      if (objc_getProperty(Property, v73, 96, 1))
      {
        +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_6;
        v136[3] = &unk_1E3CC3870;
        v136[7] = &v158;
        v75 = v136;
        v105 = *(id *)(a1 + 32);
        v106 = *(_QWORD *)(a1 + 40);
        v136[4] = v105;
        v136[5] = v106;
        v136[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "saveToPreferencesWithCompletionHandler:", v136);
        goto LABEL_106;
      }
      Property = *(id *)(a1 + 40);
      if (!Property)
        goto LABEL_102;
      if (objc_getProperty(Property, v104, 104, 1))
      {
        +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v135[0] = MEMORY[0x1E0C809B0];
        v135[1] = 3221225472;
        v135[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_7;
        v135[3] = &unk_1E3CC3870;
        v135[7] = &v158;
        v75 = v135;
        v116 = *(id *)(a1 + 32);
        v117 = *(_QWORD *)(a1 + 40);
        v135[4] = v116;
        v135[5] = v117;
        v135[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "saveToPreferencesWithCompletionHandler:", v135);
      }
      else
      {
        Property = *(id *)(a1 + 40);
        if (Property)
          Property = objc_getProperty(Property, v115, 80, 1);
LABEL_102:
        v74 = Property;
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_8;
        v134[3] = &unk_1E3CC3870;
        v134[7] = &v158;
        v75 = v134;
        v121 = *(id *)(a1 + 32);
        v122 = *(_QWORD *)(a1 + 40);
        v134[4] = v121;
        v134[5] = v122;
        v134[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "saveToPreferencesWithCompletionHandler:", v134);
      }
      goto LABEL_106;
    case 33:
      v78 = *(id *)(a1 + 40);
      if (!v78)
        goto LABEL_105;
      if (objc_getProperty(v78, v20, 88, 1))
      {
        +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v156[0] = MEMORY[0x1E0C809B0];
        v156[1] = 3221225472;
        v156[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_152;
        v156[3] = &unk_1E3CC3870;
        v156[7] = &v158;
        v75 = v156;
        v80 = *(id *)(a1 + 32);
        v81 = *(_QWORD *)(a1 + 40);
        v156[4] = v80;
        v156[5] = v81;
        v156[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "removeFromPreferencesWithCompletionHandler:", v156);
        goto LABEL_106;
      }
      v78 = *(id *)(a1 + 40);
      if (!v78)
        goto LABEL_105;
      if (objc_getProperty(v78, v79, 96, 1))
      {
        +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v155[0] = MEMORY[0x1E0C809B0];
        v155[1] = 3221225472;
        v155[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_155;
        v155[3] = &unk_1E3CC3870;
        v155[7] = &v158;
        v75 = v155;
        v108 = *(id *)(a1 + 32);
        v109 = *(_QWORD *)(a1 + 40);
        v155[4] = v108;
        v155[5] = v109;
        v155[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "removeFromPreferencesWithCompletionHandler:", v155);
        goto LABEL_106;
      }
      v78 = *(id *)(a1 + 40);
      if (!v78)
        goto LABEL_105;
      if (objc_getProperty(v78, v107, 104, 1))
      {
        +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v154[0] = MEMORY[0x1E0C809B0];
        v154[1] = 3221225472;
        v154[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_156;
        v154[3] = &unk_1E3CC3870;
        v154[7] = &v158;
        v75 = v154;
        v119 = *(id *)(a1 + 32);
        v120 = *(_QWORD *)(a1 + 40);
        v154[4] = v119;
        v154[5] = v120;
        v154[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "removeFromPreferencesWithCompletionHandler:", v154);
      }
      else
      {
        v78 = *(id *)(a1 + 40);
        if (v78)
          v78 = objc_getProperty(v78, v118, 80, 1);
LABEL_105:
        v74 = v78;
        v153[0] = MEMORY[0x1E0C809B0];
        v153[1] = 3221225472;
        v153[2] = __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_4;
        v153[3] = &unk_1E3CC3870;
        v153[7] = &v158;
        v75 = v153;
        v123 = *(id *)(a1 + 32);
        v124 = *(_QWORD *)(a1 + 40);
        v153[4] = v123;
        v153[5] = v124;
        v153[6] = *(id *)(a1 + 56);
        objc_msgSend(v74, "removeFromPreferencesWithCompletionHandler:", v153);
      }
LABEL_106:

      v12 = (void *)v75[4];
      break;
    case 44:
      v82 = *(void **)(a1 + 40);
      v83 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v131 = (void *)v159[5];
      objc_msgSend(v82, "setAppPushParameters:errorStr:", v83, &v131);
      v30 = v131;
      goto LABEL_64;
    case 45:
      v84 = *(void **)(a1 + 40);
      v85 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v130 = (void *)v159[5];
      objc_msgSend(v84, "unsetAppPushParameters:errorStr:", v85, &v130);
      v30 = v130;
      goto LABEL_64;
    case 46:
      v86 = *(void **)(a1 + 40);
      v87 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v141 = (void *)v159[5];
      objc_msgSend(v86, "addRelayWithParameters:errorStr:", v87, &v141);
      v30 = v141;
      goto LABEL_64;
    case 47:
      v88 = *(void **)(a1 + 40);
      v89 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v140 = (void *)v159[5];
      objc_msgSend(v88, "removeRelayWithParameters:errorStr:", v89, &v140);
      v30 = v140;
      goto LABEL_64;
    case 48:
      v90 = *(void **)(a1 + 40);
      v91 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v139 = (void *)v159[5];
      objc_msgSend(v90, "setRelayConditionsWithParameters:errorStr:", v91, &v139);
      v30 = v139;
      goto LABEL_64;
    case 49:
      v92 = *(void **)(a1 + 40);
      v93 = *(_QWORD *)(a1 + 48);
      v29 = v159;
      v138 = (void *)v159[5];
      objc_msgSend(v92, "unsetRelayConditionsWithParameters:errorStr:", v93, &v138);
      v30 = v138;
LABEL_64:
      v94 = v30;
      v71 = (id)v29[5];
      v29[5] = (uint64_t)v94;
      goto LABEL_65;
    default:
      switch(v26)
      {
        case 'e':
          goto LABEL_66;
        case 'g':
        case 'h':
          v31 = *(void **)(a1 + 40);
          if (v31 && objc_getProperty(v31, v20, 80, 1))
          {
            v33 = *(id *)(a1 + 40);
            if (v33)
              v33 = objc_getProperty(v33, v32, 80, 1);
            v34 = v33;
            objc_msgSend(v34, "connection");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "status");

            if (v36 <= 5)
              objc_msgSend(v8, "addObject:", off_1E3CC38B8[v36]);
          }
          goto LABEL_66;
        case 'i':
          v95 = *(void **)(a1 + 40);
          if (!v95 || !objc_getProperty(v95, v20, 80, 1))
            goto LABEL_66;
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("stop-current-session"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v96))
          {
            if (objc_msgSend(v96, "BOOLValue"))
              v98 = &unk_1E3D03B30;
            else
              v98 = 0;
          }
          else
          {
            v98 = 0;
          }
          v110 = *(id *)(a1 + 40);
          if (v110)
            v110 = objc_getProperty(v110, v97, 80, 1);
          v111 = v110;
          objc_msgSend(v111, "connection");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 0;
          objc_msgSend(v112, "startVPNTunnelWithOptions:andReturnError:", v98, &v125);
          v71 = v125;

          if (v71)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to start the tunnel: %@"), v71);
            v113 = objc_claimAutoreleasedReturnValue();
            v114 = (void *)v159[5];
            v159[5] = v113;

          }
          break;
        case 'j':
          v99 = *(void **)(a1 + 40);
          if (!v99 || !objc_getProperty(v99, v20, 80, 1))
            goto LABEL_66;
          v101 = *(id *)(a1 + 40);
          if (v101)
            v101 = objc_getProperty(v101, v100, 80, 1);
          v71 = v101;
          objc_msgSend(v71, "connection");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "stopVPNTunnel");

          break;
        default:
          goto LABEL_81;
      }
LABEL_65:

LABEL_66:
      if (v159[5])
        objc_msgSend(v8, "addObject:");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_69;
  }
LABEL_3:

LABEL_69:
  _Block_object_dispose(&v158, 8);

}

void __80__NEProviderAppConfigurationClient_loadConfigurationWithName_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  const char *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  Property = (id)a1[4];
  v24 = v4;
  if (Property)
    Property = objc_getProperty(Property, v3, 120, 1);
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          objc_opt_isKindOfClass();
        }
      }
      objc_msgSend(v11, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", a1[5]);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
    v16 = v11;

    v15 = v24;
    if (v16)
      goto LABEL_29;
  }
  else
  {
LABEL_14:

    v15 = v24;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = (id)a1[4];
  if (v17)
    v17 = objc_getProperty(v17, v14, 112, 1);
  v18 = v17;
  v16 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v19 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v18);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "localizedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", a1[5]);

        if (v23)
        {
          v16 = v21;
          goto LABEL_28;
        }
      }
      v16 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_28:

LABEL_29:
  (*(void (**)(void))(a1[6] + 16))();

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_152(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v3, 120, 1);
    v9 = Property;
    +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectIdenticalTo:", v7);

  }
  v10 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v12[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2_155(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v3, 120, 1);
    v9 = Property;
    +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectIdenticalTo:", v7);

  }
  v10 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v12[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_3_156(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v3, 120, 1);
    v9 = Property;
    +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectIdenticalTo:", v7);

  }
  v10 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v12[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id Property;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(id *)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v3, 112, 1);
    v10 = Property;
    v11 = (void *)a1[5];
    if (v11)
      v12 = objc_getProperty(v11, v9, 80, 1);
    else
      v12 = 0;
    objc_msgSend(v10, "removeObjectIdenticalTo:", v12);

    v14 = (id)a1[5];
    if (v14)
      v14 = objc_getProperty(v14, v13, 120, 1);
    v7 = v14;
    v16 = (void *)a1[5];
    if (v16)
      v17 = objc_getProperty(v16, v15, 80, 1);
    else
      v17 = 0;
    objc_msgSend(v7, "removeObjectIdenticalTo:", v17);
  }

  v18 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v20[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v18 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_5(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (void *)a1[5];
  if (v8)
    objc_setProperty_atomic(v8, v3, 0, 120);
  v9 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v11[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_6(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (void *)a1[5];
  if (v8)
    objc_setProperty_atomic(v8, v3, 0, 120);
  v9 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v11[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_7(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  v8 = (void *)a1[5];
  if (v8)
    objc_setProperty_atomic(v8, v3, 0, 120);
  v9 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v11[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 16))(a1[6], 0);
  }

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_8(_QWORD *a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id Property;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save configuration \"%@\": %@"), a1[4], v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(id *)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    Property = (id)a1[5];
    if (Property)
      Property = objc_getProperty(Property, v3, 112, 1);
    v7 = Property;
    v10 = (void *)a1[5];
    if (v10)
      v11 = objc_getProperty(v10, v9, 80, 1);
    else
      v11 = 0;
    objc_msgSend(v7, "removeObjectIdenticalTo:", v11);
  }

  v13 = (void *)a1[5];
  if (v13)
    objc_setProperty_atomic(v13, v12, 0, 120);
  v14 = a1[6];
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v16[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v14 + 16))(a1[6], 0);
  }

}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  +[NEVPNManager sharedManager](NEVPNManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    +[NEVPNManager sharedManager](NEVPNManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, 0);
    v9 = *(void **)(a1 + 32);
    if (v9)
      objc_setProperty_atomic(v9, v7, v8, 120);

  }
  +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E3CC4748;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  objc_msgSend(v10, "loadFromPreferencesWithCompletionHandler:", v12);

}

uint64_t __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  id Property;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 120, 1);
      v8 = Property;
      +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      +[NEFilterManager sharedManager](NEFilterManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
      v12 = *(void **)(a1 + 32);
      if (v12)
        objc_setProperty_atomic(v12, v11, v8, 120);
    }

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E3CC46D0;
  v13 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v13;
  +[NETunnelProviderManager loadAllFromPreferencesWithCompletionHandler:](NETunnelProviderManager, "loadAllFromPreferencesWithCompletionHandler:", v14);

}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  id Property;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 120, 1);
      objc_msgSend(Property, "addObjectsFromArray:", v3);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
      v10 = *(void **)(a1 + 32);
      if (v10)
        objc_setProperty_atomic(v10, v8, v9, 120);

    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E3CC46D0;
  v11 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v11;
  +[NEAppProxyProviderManager loadAllFromPreferencesWithCompletionHandler:](NEAppProxyProviderManager, "loadAllFromPreferencesWithCompletionHandler:", v12);

}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  id Property;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v5 = *(void **)(a1 + 32);
    if (v5 && objc_getProperty(v5, v4, 120, 1))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v6, 120, 1);
      objc_msgSend(Property, "addObjectsFromArray:", v3);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
      v10 = *(void **)(a1 + 32);
      if (v10)
        objc_setProperty_atomic(v10, v8, v9, 120);

    }
  }
  +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5;
  v13[3] = &unk_1E3CC4748;
  v12 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v12;
  objc_msgSend(v11, "loadFromPreferencesWithCompletionHandler:", v13);

}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  const char *v6;
  id Property;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v4 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v3, 120, 1))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v6, 120, 1);
    v8 = Property;
    +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    +[NEDNSProxyManager sharedManager](NEDNSProxyManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v10, "initWithObjects:", v9, 0);
    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_setProperty_atomic(v12, v11, v8, 120);
  }

  +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6;
  v15[3] = &unk_1E3CC4748;
  v14 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v14;
  objc_msgSend(v13, "loadFromPreferencesWithCompletionHandler:", v15);

}

void __65__NEProviderAppConfigurationClient_loadAllWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4 && objc_getProperty(v4, v3, 120, 1))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 120, 1);
    v7 = Property;
    +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    +[NEDNSSettingsManager sharedManager](NEDNSSettingsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v9, "initWithObjects:", v8, 0, v13);
    v11 = *(void **)(a1 + 32);
    if (v11)
      objc_setProperty_atomic(v11, v10, v7, 120);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

}

void __101__NEProviderAppConfigurationClient_handleCommand_forConfigWithName_withParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Got an error on the connection with the app: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_setProperty_atomic(v6, v5, 0, 136);
    v8 = *(void **)(a1 + 32);
    if (v8)
      objc_setProperty_atomic(v8, v7, 0, 144);
  }

}

- (uint64_t)deleteKeychainItemWithPersistentReference:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *MEMORY[0x1E0CD6CA8];
  v3 = *MEMORY[0x1E0CD70E0];
  v9[0] = *MEMORY[0x1E0CD6C98];
  v9[1] = v3;
  v10[0] = v2;
  v10[1] = a2;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v7 = SecItemDelete(v6);
  return v7;
}

- (uint64_t)setKeychainItemData:(void *)a3 withName:(uint64_t *)a4 persistentReference:
{
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v34;
  id v35;
  CFTypeRef result;
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[3];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v9 = a3;
  if (a1)
  {
    v10 = *a4;
    v11 = *MEMORY[0x1E0C9AE50];
    v12 = *MEMORY[0x1E0CD70C0];
    v13 = 0x1E0C99000uLL;
    if (!*a4)
      goto LABEL_5;
    v14 = *MEMORY[0x1E0CD7010];
    v39[0] = *MEMORY[0x1E0CD70E0];
    v39[1] = v14;
    v40[0] = v10;
    v40[1] = v11;
    v39[2] = v12;
    v40[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    result = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v15, &result))
    {

      goto LABEL_5;
    }
    v27 = (id)result;
    v28 = isa_nsdictionary(v27);
    if (v28)
    {
      v35 = v9;
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
      v30 = *MEMORY[0x1E0CD6B58];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
      v34 = v28;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, v30);

      objc_msgSend(v29, "setObject:forKeyedSubscript:", v11, v12);
      v32 = (void *)objc_msgSend(v27, "mutableCopy");
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD70D8]);
      v24 = SecItemUpdate((CFDictionaryRef)v29, (CFDictionaryRef)v32);

      v28 = v34;
      v9 = v35;
      if ((_DWORD)v24 != -25300)
      {

LABEL_14:
        goto LABEL_15;
      }
    }

    v13 = 0x1E0C99000;
    if (((*a4 != 0) & ~v28) == 0)
    {
LABEL_5:
      v37[0] = *MEMORY[0x1E0CD6B58];
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(objc_getProperty(a1, v8, 80, 1), "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.PASSWORD"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0CD70D8];
      v38[0] = v18;
      v38[1] = v7;
      v20 = *MEMORY[0x1E0CD68A0];
      v37[1] = v19;
      v37[2] = v20;
      v21 = *MEMORY[0x1E0CD6C98];
      v22 = *MEMORY[0x1E0CD6CA8];
      v38[2] = *MEMORY[0x1E0CD68A8];
      v38[3] = v22;
      v23 = *MEMORY[0x1E0CD7020];
      v37[3] = v21;
      v37[4] = v23;
      v37[5] = v12;
      v38[4] = v11;
      v38[5] = v11;
      objc_msgSend(*(id *)(v13 + 3456), "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      result = 0;
      v24 = SecItemAdd((CFDictionaryRef)v15, &result);
      if (!(_DWORD)v24)
      {
        v25 = (id)result;
        if (isa_nsdata(v25))
        {
          v26 = objc_retainAutorelease(v25);
          *a4 = (uint64_t)v26;

        }
        else
        {

          v24 = 4294965226;
        }
      }
      goto LABEL_14;
    }
  }
  v24 = 0;
LABEL_15:

  return v24;
}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  const char *v1;
  SEL v2;
  SEL v3;
  id self;

  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0, 80);
    objc_setProperty_atomic(self, v2, 0, 120);
    objc_setProperty_atomic(self, v3, 0, 112);
  }

}

void __71__NEProviderAppConfigurationClient_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  const char *v1;
  SEL v2;
  SEL v3;
  id self;

  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    objc_setProperty_atomic(self, v1, 0, 80);
    objc_setProperty_atomic(self, v2, 0, 120);
    objc_setProperty_atomic(self, v3, 0, 112);
  }

}

- (id)listenerEndpoint
{
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, a2, 72, 1), "endpoint");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
