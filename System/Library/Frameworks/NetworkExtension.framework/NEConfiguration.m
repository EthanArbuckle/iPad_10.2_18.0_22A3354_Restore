@implementation NEConfiguration

- (NEVPN)VPN
{
  return (NEVPN *)objc_getProperty(self, a2, 80, 1);
}

- (NERelayConfiguration)relay
{
  return (NERelayConfiguration *)objc_getProperty(self, a2, 144, 1);
}

- (NEVPNApp)appVPN
{
  return (NEVPNApp *)objc_getProperty(self, a2, 96, 1);
}

- (NEAOVPN)alwaysOnVPN
{
  return (NEAOVPN *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NEConfiguration)initWithCoder:(id)a3
{
  id v4;
  NEConfiguration *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *externalIdentifier;
  uint64_t v10;
  NSString *application;
  uint64_t v12;
  NEVPN *VPN;
  uint64_t v14;
  NEAOVPN *alwaysOnVPN;
  uint64_t v16;
  NEVPNApp *appVPN;
  uint64_t v18;
  NEContentFilter *contentFilter;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NEProfileIngestionPayloadInfo *payloadInfo;
  uint64_t v24;
  NSString *applicationName;
  uint64_t v26;
  NEPathController *pathController;
  uint64_t v28;
  NEDNSProxy *dnsProxy;
  uint64_t v30;
  NEDNSSettingsBundle *dnsSettings;
  uint64_t v32;
  NEAppPush *appPush;
  uint64_t v34;
  NERelayConfiguration *relay;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NEConfiguration;
  v5 = -[NEConfiguration init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExternalIdentifierString"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Application"));
    v10 = objc_claimAutoreleasedReturnValue();
    application = v5->_application;
    v5->_application = (NSString *)v10;

    v5->_grade = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Grade"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VPN"));
    v12 = objc_claimAutoreleasedReturnValue();
    VPN = v5->_VPN;
    v5->_VPN = (NEVPN *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlwaysOnVPN"));
    v14 = objc_claimAutoreleasedReturnValue();
    alwaysOnVPN = v5->_alwaysOnVPN;
    v5->_alwaysOnVPN = (NEAOVPN *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppVPN"));
    v16 = objc_claimAutoreleasedReturnValue();
    appVPN = v5->_appVPN;
    v5->_appVPN = (NEVPNApp *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContentFilter"));
    v18 = objc_claimAutoreleasedReturnValue();
    contentFilter = v5->_contentFilter;
    v5->_contentFilter = (NEContentFilter *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
    v20 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProfileInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    payloadInfo = v5->_payloadInfo;
    v5->_payloadInfo = (NEProfileIngestionPayloadInfo *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ApplicationName"));
    v24 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v24;

    objc_storeStrong((id *)&v5->_applicationIdentifier, v5->_application);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PathController"));
    v26 = objc_claimAutoreleasedReturnValue();
    pathController = v5->_pathController;
    v5->_pathController = (NEPathController *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNSProxy"));
    v28 = objc_claimAutoreleasedReturnValue();
    dnsProxy = v5->_dnsProxy;
    v5->_dnsProxy = (NEDNSProxy *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNSSettings"));
    v30 = objc_claimAutoreleasedReturnValue();
    dnsSettings = v5->_dnsSettings;
    v5->_dnsSettings = (NEDNSSettingsBundle *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppPush"));
    v32 = objc_claimAutoreleasedReturnValue();
    appPush = v5->_appPush;
    v5->_appPush = (NEAppPush *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Relay"));
    v34 = objc_claimAutoreleasedReturnValue();
    relay = v5->_relay;
    v5->_relay = (NERelayConfiguration *)v34;

  }
  return v5;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NEPathController)pathController
{
  return (NEPathController *)objc_getProperty(self, a2, 112, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NEConfiguration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NEConfiguration)initWithName:(id)a3 grade:(int64_t)a4
{
  id v7;
  NEConfiguration *v8;
  NEConfiguration *v9;
  uint64_t v10;
  NSUUID *identifier;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEConfiguration;
  v8 = -[NEConfiguration init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_grade = a4;
    objc_storeStrong((id *)&v8->_name, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

  }
  return v9;
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
  id v19;

  v4 = a3;
  -[NEConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Identifier"));

  -[NEConfiguration externalIdentifier](self, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ExternalIdentifierString"));

  -[NEConfiguration application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Application"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEConfiguration grade](self, "grade"), CFSTR("Grade"));
  -[NEConfiguration VPN](self, "VPN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("VPN"));

  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AlwaysOnVPN"));

  -[NEConfiguration appVPN](self, "appVPN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("AppVPN"));

  -[NEConfiguration contentFilter](self, "contentFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ContentFilter"));

  -[NEConfiguration name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("Name"));

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("ProfileInfo"));

  -[NEConfiguration applicationName](self, "applicationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("ApplicationName"));

  -[NEConfiguration pathController](self, "pathController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("PathController"));

  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("DNSProxy"));

  -[NEConfiguration dnsSettings](self, "dnsSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("DNSSettings"));

  -[NEConfiguration appPush](self, "appPush");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("AppPush"));

  -[NEConfiguration relay](self, "relay");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("Relay"));

}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;

  v4 = a3;
  -[NEConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (!v5)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing configuration identifier"), v4);
  -[NEConfiguration name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing name"), v4);
    v6 = 0;
  }
  if (-[NEConfiguration grade](self, "grade") < 1 || -[NEConfiguration grade](self, "grade") >= 4)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid configuration grade"), v4);
    v6 = 0;
  }
  -[NEConfiguration VPN](self, "VPN");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NEConfiguration VPN](self, "VPN");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "checkValidityAndCollectErrors:", v4);

    v6 &= v11;
  }
  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "checkValidityAndCollectErrors:", v4);

    v6 &= v15;
  }
  -[NEConfiguration appVPN](self, "appVPN");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[NEConfiguration appVPN](self, "appVPN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "checkValidityAndCollectErrors:", v4);

    v6 &= v19;
  }
  -[NEConfiguration contentFilter](self, "contentFilter");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[NEConfiguration contentFilter](self, "contentFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "checkValidityAndCollectErrors:", v4);

    v6 &= v23;
  }
  -[NEConfiguration pathController](self, "pathController");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[NEConfiguration pathController](self, "pathController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "checkValidityAndCollectErrors:", v4);

    v6 &= v27;
  }
  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "checkValidityAndCollectErrors:", v4);

    v6 &= v31;
  }
  -[NEConfiguration dnsSettings](self, "dnsSettings");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[NEConfiguration dnsSettings](self, "dnsSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "checkValidityAndCollectErrors:", v4);

    v6 &= v35;
  }
  -[NEConfiguration appPush](self, "appPush");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[NEConfiguration appPush](self, "appPush");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "checkValidityAndCollectErrors:", v4);

    v6 &= v39;
  }
  -[NEConfiguration relay](self, "relay");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[NEConfiguration relay](self, "relay");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "checkValidityAndCollectErrors:", v4);

    v6 &= v43;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEConfiguration *v4;
  NEConfiguration *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  NSString *externalIdentifier;
  uint64_t v13;
  NSString *application;
  uint64_t v15;
  NSString *applicationName;
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
  objc_super v28;

  v4 = +[NEConfiguration allocWithZone:](NEConfiguration, "allocWithZone:", a3);
  v5 = self;
  if (v4)
  {
    v28.receiver = v4;
    v28.super_class = (Class)NEConfiguration;
    v4 = -[NEConfiguration init](&v28, sel_init);
    if (v4)
    {
      v4->_grade = -[NEConfiguration grade](v5, "grade");
      -[NEConfiguration name](v5, "name");
      v6 = objc_claimAutoreleasedReturnValue();
      name = v4->_name;
      v4->_name = (NSString *)v6;

      -[NEConfiguration identifier](v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v4->_identifier;
      v4->_identifier = (NSUUID *)v9;

      -[NEConfiguration externalIdentifier](v5, "externalIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      externalIdentifier = v4->_externalIdentifier;
      v4->_externalIdentifier = (NSString *)v11;

      -[NEConfiguration application](v5, "application");
      v13 = objc_claimAutoreleasedReturnValue();
      application = v4->_application;
      v4->_application = (NSString *)v13;

      -[NEConfiguration applicationName](v5, "applicationName");
      v15 = objc_claimAutoreleasedReturnValue();
      applicationName = v4->_applicationName;
      v4->_applicationName = (NSString *)v15;

      objc_storeStrong((id *)&v4->_applicationIdentifier, v4->_application);
    }
  }

  -[NEConfiguration VPN](v5, "VPN");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setVPN:](v4, "setVPN:", v17);

  -[NEConfiguration alwaysOnVPN](v5, "alwaysOnVPN");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setAlwaysOnVPN:](v4, "setAlwaysOnVPN:", v18);

  -[NEConfiguration appVPN](v5, "appVPN");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setAppVPN:](v4, "setAppVPN:", v19);

  -[NEConfiguration contentFilter](v5, "contentFilter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setContentFilter:](v4, "setContentFilter:", v20);

  -[NEConfiguration payloadInfo](v5, "payloadInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setPayloadInfo:](v4, "setPayloadInfo:", v21);

  -[NEConfiguration pathController](v5, "pathController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setPathController:](v4, "setPathController:", v22);

  -[NEConfiguration dnsProxy](v5, "dnsProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setDnsProxy:](v4, "setDnsProxy:", v23);

  -[NEConfiguration dnsSettings](v5, "dnsSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setDnsSettings:](v4, "setDnsSettings:", v24);

  -[NEConfiguration appPush](v5, "appPush");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setAppPush:](v4, "setAppPush:", v25);

  -[NEConfiguration relay](v5, "relay");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration setRelay:](v4, "setRelay:", v26);

  return v4;
}

- (id)copyProviderMachOUUIDs
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  id v25;
  NSArray *v26;
  NSArray *providerMachOUUIDs;
  NSArray *v28;

  if (self->_resolvedProviderMachOUUIDs)
    return self->_providerMachOUUIDs;
  -[NEConfiguration VPN](self, "VPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEConfiguration VPN](self, "VPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protocol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEConfiguration VPN](self, "VPN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NEConfiguration appVPN](self, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_31;
    -[NEConfiguration appVPN](self, "appVPN");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protocol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEConfiguration appVPN](self, "appVPN");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  v10 = objc_msgSend(v7, "tunnelType");

  v11 = 0;
  if (v6 && (unint64_t)(v10 - 1) <= 1)
  {
    if (v10 != 2)
      v10 = 5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v6, "providerBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfiguration pluginType](self, "pluginType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v12, v13, v10, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "machOUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        objc_msgSend(v14, "machOUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v17);

      }
      objc_msgSend(v6, "authenticationPluginType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v18, 0, v10, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "machOUUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        objc_msgSend(v19, "machOUUIDs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v22);

      }
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", CFSTR("com.apple.NetworkExtension.IKEv2Provider"), 0, v10, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "machOUUIDs");
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = "com.apple.racoon";
LABEL_30:
      v11 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)v24);
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.pppd");
      if (objc_msgSend(v23, "count"))
        objc_msgSend(v11, "addObjectsFromArray:", v23);
      v25 = -[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]((uint64_t)self, (uint64_t)"com.apple.racoon");
      if (objc_msgSend(v25, "count"))
        objc_msgSend(v11, "addObjectsFromArray:", v25);

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = "com.apple.pppd";
      goto LABEL_30;
    }
LABEL_31:
    v11 = 0;
  }
LABEL_32:
  self->_resolvedProviderMachOUUIDs = 1;
  if (objc_msgSend(v11, "count"))
  {
    v26 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v11);
    providerMachOUUIDs = self->_providerMachOUUIDs;
    self->_providerMachOUUIDs = v26;

  }
  v28 = self->_providerMachOUUIDs;

  return v28;
}

- (id)generateSignature
{
  return +[NEHasher hashObject:](NEHasher, "hashObject:", self);
}

- (id)description
{
  return -[NEConfiguration descriptionWithOptions:](self, "descriptionWithOptions:", 0);
}

- (id)descriptionWithOptions:(unint64_t)a3
{
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

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v5, "appendString:", CFSTR("{"));
  -[NEConfiguration name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v6, CFSTR("name"), 0, a3 | 1);

  -[NEConfiguration identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v7, CFSTR("identifier"), 0, a3);

  -[NEConfiguration externalIdentifier](self, "externalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("externalIdentifier"), 0, a3 | 1);

  -[NEConfiguration applicationName](self, "applicationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("applicationName"), 0, a3);

  -[NEConfiguration application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("application"), 0, a3);

  objc_msgSend(v5, "appendPrettyInt:withName:andIndent:options:", -[NEConfiguration grade](self, "grade"), CFSTR("grade"), 0, a3);
  -[NEConfiguration VPN](self, "VPN");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("VPN"), 0, a3);

  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("alwaysOnVPN"), 0, a3);

  -[NEConfiguration appVPN](self, "appVPN");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("appVPN"), 0, a3);

  -[NEConfiguration contentFilter](self, "contentFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("contentFilter"), 0, a3);

  -[NEConfiguration pathController](self, "pathController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("pathController"), 0, a3);

  -[NEConfiguration payloadInfo](self, "payloadInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("payloadInfo"), 0, a3);

  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("dnsProxy"), 0, a3);

  -[NEConfiguration dnsSettings](self, "dnsSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("dnsSettings"), 0, a3);

  -[NEConfiguration appPush](self, "appPush");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("appPush"), 0, a3);

  -[NEConfiguration relay](self, "relay");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("relay"), 0, a3);

  objc_msgSend(v5, "appendString:", CFSTR("\n}"));
  return v5;
}

- (void)clearSystemKeychain
{
  -[NEConfiguration clearKeychainInDomain:](self, 0);
}

- (NSString)pluginType
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;

  -[NEConfiguration VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    if (v6 == 4)
    {
      -[NEConfiguration VPN](self, "VPN");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "protocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pluginType");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  -[NEConfiguration appVPN](self, "appVPN");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NEConfiguration appVPN](self, "appVPN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "protocol");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "type");

    if (v13 == 4)
    {
      -[NEConfiguration appVPN](self, "appVPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "protocol");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pluginType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v17 = objc_msgSend(v3, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_12;
        v16 = 0;
        v14 = v3;
      }
      else
      {

      }
      v3 = v16;
    }
  }
LABEL_12:
  -[NEConfiguration contentFilter](self, "contentFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_18;
  -[NEConfiguration contentFilter](self, "contentFilter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "provider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pluginType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = objc_msgSend(v3, "isEqualToString:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_18;
    v21 = 0;
    v19 = v3;
  }
  else
  {

  }
  v3 = v21;
LABEL_18:
  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_24;
  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "protocol");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pluginType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v27 = objc_msgSend(v3, "isEqualToString:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_24;
    v26 = 0;
    v24 = v3;
  }
  else
  {

  }
  v3 = v26;
LABEL_24:
  -[NEConfiguration appPush](self, "appPush");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NEConfiguration appPush](self, "appPush");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pluginType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = v29;
      goto LABEL_29;
    }
    v31 = objc_msgSend(v3, "isEqualToString:", v30);

    if ((v31 & 1) == 0)
    {
      v30 = 0;
LABEL_29:

      v3 = v30;
    }
  }
  return (NSString *)v3;
}

- (BOOL)isTransparentProxy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[NEConfiguration VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "tunnelType") == 2)
    {
      -[NEConfiguration VPN](self, "VPN");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "protocol");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[NEConfiguration VPN](self, "VPN");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "protocol");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "type") == 4;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  void *v3;
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
  char v14;

  -[NEConfiguration VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEConfiguration VPN](self, "VPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v13 = v4;
    v14 = objc_msgSend(v4, "isEnabled");

    return v14;
  }
  -[NEConfiguration appVPN](self, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEConfiguration appVPN](self, "appVPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration pathController](self, "pathController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEConfiguration pathController](self, "pathController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration appPush](self, "appPush");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEConfiguration appPush](self, "appPush");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration contentFilter](self, "contentFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEConfiguration contentFilter](self, "contentFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration dnsSettings](self, "dnsSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEConfiguration dnsSettings](self, "dnsSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration relay](self, "relay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEConfiguration relay](self, "relay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  return 0;
}

- (void)copyPasswordsFromSystemKeychain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NEConfiguration VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protocol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[NEConfiguration appVPN](self, "appVPN"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "protocol"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    objc_msgSend(v4, "copyPasswordsFromKeychainInDomain:", 0);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NEConfiguration relay](self, "relay", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "copyPasswordsFromKeychainInDomain:", 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)applyOverrides
{
  const __SCPreferences *v3;
  const __SCPreferences *v4;
  CFPropertyListRef Value;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!os_variant_has_internal_content() || csr_check())
    return;
  v3 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEHelper control settings"), CFSTR("/Library/Preferences/com.apple.networkextension.control.plist"));
  if (v3)
  {
    v4 = v3;
    Value = SCPreferencesGetValue(v3, CFSTR("ConfigurationOverrides"));
    v6 = (void *)Value;
    if (NEInitCFTypes_onceToken == -1)
    {
      if (Value)
      {
LABEL_6:
        v7 = CFDICTIONARY_TYPE;
        if (CFGetTypeID(v6) == v7 && CFDictionaryGetCount((CFDictionaryRef)v6) >= 1)
          v6 = (void *)objc_msgSend(v6, "copy");
        else
          v6 = 0;
      }
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
      if (v6)
        goto LABEL_6;
    }
    CFRelease(v4);
    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:
  if (isa_nsdictionary(v6))
  {
    v20 = v6;
    -[NEConfiguration name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v19;
    if (isa_nsdictionary(v19))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v19;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (isa_nsstring(v14))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v14);
              v15 = objc_claimAutoreleasedReturnValue();
              if (isa_nsstring(v15)
                && -[NSObject isEqualToString:](v15, "isEqualToString:", CFSTR("nil")))
              {

                v15 = 0;
              }
              -[NEConfiguration setValue:forKeyPath:](self, "setValue:forKeyPath:", v15, v14);
              ne_log_obj();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                -[NEConfiguration name](self, "name");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v26 = v17;
                v27 = 2112;
                v28 = v14;
                v29 = 2112;
                v30 = v15;
                _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEFAULT, "%@: configuration overrides set %@ to %@", buf, 0x20u);

              }
            }
            else
            {
              ne_log_obj();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                -[NEConfiguration name](self, "name");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v26 = v18;
                v27 = 2112;
                v28 = v14;
                _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "%@: Key path in overrides is not a string: %@", buf, 0x16u);

              }
            }

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        }
        while (v11);
      }

      v9 = v19;
    }

    v6 = v20;
  }

}

- (BOOL)usesPolicyBasedRouting
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v12;

  -[NEConfiguration VPN](self, "VPN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[NEConfiguration appVPN](self, "appVPN"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[NEConfiguration relay](self, "relay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      return 0;
  }
  -[NEConfiguration VPN](self, "VPN");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 1;
  v5 = (void *)v4;
  -[NEConfiguration VPN](self, "VPN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "includeAllNetworks") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[NEConfiguration VPN](self, "VPN");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "enforceRoutes");

  }
  return v8;
}

- (int64_t)grade
{
  return self->_grade;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)externalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NEProfileIngestionPayloadInfo)payloadInfo
{
  return (NEProfileIngestionPayloadInfo *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPayloadInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setVPN:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setAlwaysOnVPN:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setAppVPN:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NEContentFilter)contentFilter
{
  return (NEContentFilter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContentFilter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setPathController:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NEDNSProxy)dnsProxy
{
  return (NEDNSProxy *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDnsProxy:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NEDNSSettingsBundle)dnsSettings
{
  return (NEDNSSettingsBundle *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDnsSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NEAppPush)appPush
{
  return (NEAppPush *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAppPush:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void)setRelay:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMachOUUIDs, 0);
  objc_storeStrong((id *)&self->_relay, 0);
  objc_storeStrong((id *)&self->_appPush, 0);
  objc_storeStrong((id *)&self->_dnsSettings, 0);
  objc_storeStrong((id *)&self->_dnsProxy, 0);
  objc_storeStrong((id *)&self->_pathController, 0);
  objc_storeStrong((id *)&self->_contentFilter, 0);
  objc_storeStrong((id *)&self->_appVPN, 0);
  objc_storeStrong((id *)&self->_alwaysOnVPN, 0);
  objc_storeStrong((id *)&self->_VPN, 0);
  objc_storeStrong((id *)&self->_payloadInfo, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)clearKeychainInDomain:(void *)a1
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (objc_msgSend(a1, "grade") == 2)
  {
    objc_msgSend(a1, "VPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") == 1)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1, "VPN");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "protocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "type") == 5;

    }
  }
  else
  {
    v6 = 0;
  }
  v9 = !v6;
  objc_msgSend(a1, "VPN");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(a1, "VPN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(a1, "VPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v19 = v14;
      objc_msgSend(v14, "protocol");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeKeychainItemsInDomain:keepIdentity:", a2, !v6);

      goto LABEL_15;
    }
  }
  objc_msgSend(a1, "appVPN");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(a1, "appVPN");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "protocol");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(a1, "appVPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  objc_msgSend(a1, "alwaysOnVPN");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
    goto LABEL_16;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(a1, "alwaysOnVPN");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "interfaceProtocolMapping");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(v19);
        v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(a1, "alwaysOnVPN");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "interfaceProtocolMapping");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "removeKeychainItemsInDomain:keepIdentity:", a2, v9);
      }
      v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v32);
  }
LABEL_15:

LABEL_16:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(a1, "relay", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "relays");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(a1, "payloadInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "clearKeychainItemsInDomain:removeItems:", a2, v28 == 0);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v24);
  }

  -[NEConfiguration syncWithKeychainInDomain:](a1, a2);
}

- (void)syncWithKeychainInDomain:(void *)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "VPN");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(a1, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "protocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "VPN");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "protocol");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syncWithKeychainInDomain:configuration:suffix:", a2, a1, 0);

    }
  }
  objc_msgSend(a1, "appVPN");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(a1, "appVPN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(a1, "appVPN");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "protocol");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syncWithKeychainInDomain:configuration:suffix:", a2, a1, 0);

    }
  }
  objc_msgSend(a1, "alwaysOnVPN");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(a1, "alwaysOnVPN");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interfaceProtocolMapping");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v22);
          objc_msgSend(a1, "alwaysOnVPN");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "interfaceProtocolMapping");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "syncWithKeychainInDomain:configuration:suffix:", a2, a1, v23);
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v20);
    }

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "relay", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "relays");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v34;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v32++), "syncWithKeychainInDomain:configuration:suffix:", a2, a1, 0);
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v30);
  }

}

- (id)copyMachOUUIDsFromBundleIdentifier:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v7;
  _QWORD applier[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[NEConfiguration copyMachOUUIDsFromBundleIdentifier:]";
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null bundleIdentifier", buf, 0xCu);
    }

    return 0;
  }
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = NEHelperCacheCopyAppUUIDMapping();
  v4 = (void *)v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812C8])
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke;
    applier[3] = &unk_1E3CC2300;
    v9 = v2;
    xpc_array_apply(v4, applier);

  }
  if (objc_msgSend(v2, "count"))
    v5 = v2;
  else
    v5 = 0;

  return v5;
}

uint64_t __54__NEConfiguration_copyMachOUUIDsFromBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A1ACFDA4](v4) == MEMORY[0x1E0C813A0])
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
    objc_msgSend(v6, "addObject:", v7);

  }
  return 1;
}

+ (void)addError:(void *)a3 toList:
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v4, "addObject:", v5);

}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3 grade:(int64_t)a4
{
  id v5;
  NEProfilePayloadBase *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[NEProfilePayloadBase initWithPayload:]([NEProfilePayloadBase alloc], "initWithPayload:", v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UserDefinedName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsstring(v8) & 1) == 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadDisplayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((isa_nsstring(v9) & 1) != 0)
    {
      v8 = v9;
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.webcontent-filter")))
        v10 = CFSTR("PluginBundleID");
      else
        v10 = CFSTR("VPNType");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed")))
  {
    v11 = -[NEConfiguration initWithVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
LABEL_22:
    v12 = v11;
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed.alwayson")))
  {
    v11 = -[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]((__CFString *)[NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed.applayer")))
  {
    v11 = -[NEConfiguration initWithAppLayerVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.webcontent-filter")))
  {
    v11 = -[NEConfiguration initWithContentFilterPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkusagerules")))
  {
    v11 = -[NEConfiguration initWithPathControllerPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.dnsSettings.managed")))
  {
    v11 = -[NEConfiguration initWithDNSSettingsPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.relay.managed")))
  {
    v11 = -[NEConfiguration initWithRelayPayload:configurationName:grade:]([NEConfiguration alloc], v6, v8, a4);
    goto LABEL_22;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "Failed to create a NEConfiguration from profile payload with type '%@'", (uint8_t *)&v15, 0xCu);
  }

  v12 = 0;
LABEL_23:

  return (NEConfiguration *)v12;
}

+ (NEConfiguration)configurationWithProfilePayload:(id)a3
{
  return +[NEConfiguration configurationWithProfilePayload:grade:](NEConfiguration, "configurationWithProfilePayload:grade:", a3, 1);
}

- (id)initWithIdentifier:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NEConfiguration;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[2] = (id)1;
      objc_storeStrong(v5 + 3, a2);
    }
  }

  return a1;
}

- (BOOL)setCertificates:(id)a3 keyRefs:(id)a4 specs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NEIdentityKeychainItem *v21;
  SEL v22;
  NEIdentityKeychainItem *v23;
  SEL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  char v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v56;
  const char *v57;
  const char *v58;
  id v59;
  uint64_t v60;
  unsigned int v61;
  void *v62;
  char *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && (isa_nsdictionary(v8) & 1) != 0)
  {
    -[NEConfiguration VPN](self, "VPN");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v8;
      v13 = v9;
      v14 = v10;
      if (self)
      {
        -[NEConfiguration getConfigurationProtocol](self);
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[NEConfiguration VPN](self, "VPN");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(self) = 0;
        if (v16 && v15)
        {
          v62 = v13;
          LODWORD(self) = 0;
          v17 = 0;
          v63 = 0;
          v18 = 0;
          switch(objc_msgSend(v15, "type"))
          {
            case 1:
            case 4:
              goto LABEL_35;
            case 2:
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadMachineCertificateRef"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v19;
              if (v19 && isa_nsdata(v19))
                objc_msgSend(v15, "setMachineIdentityReference:", v17);
              goto LABEL_11;
            case 3:
              break;
            case 5:
LABEL_11:
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
              v63 = (char *)objc_claimAutoreleasedReturnValue();
              ne_log_obj();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v65 = v63;
                v66 = 1024;
                LODWORD(v67) = objc_msgSend(v63, "BOOLValue");
                _os_log_debug_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesVPN: isModernSystem %@ (%d)", buf, 0x12u);
              }

              if (v18 && isa_nsdata(v18) && v17 && isa_nsdata(v17))
              {
                v21 = [NEIdentityKeychainItem alloc];
                v61 = objc_msgSend(v63, "BOOLValue");
                v60 = v15[10];
                LODWORD(self) = 1;
                v59 = objc_getProperty(v15, v22, 88, 1);
                v23 = -[NEKeychainItem initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:](v21, "initWithPersistentReference:keyReference:isModernSystem:domain:accessGroup:", v18, v17, v61, v60, v59);
                objc_setProperty_atomic(v15, v24, v23, 96);

              }
              else
              {
LABEL_35:
                v33 = v18;
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18 && isa_nsdata(v18))
                  objc_msgSend(v15, "setIdentityReferenceInternal:", v18);
                LODWORD(self) = 1;
              }
              break;
            default:
              v63 = 0;
              v18 = 0;
              break;
          }
          ne_log_obj();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = (_DWORD)self;
            _os_log_debug_impl(&dword_19BD16000, v34, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesVPN: done (OK %d)", buf, 8u);
          }

          v13 = v62;
        }

      }
      goto LABEL_85;
    }
    -[NEConfiguration appVPN](self, "appVPN");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v12 = v8;
      if (self)
      {
        -[NEConfiguration getConfigurationProtocol](self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfiguration appVPN](self, "appVPN");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(self) = 0;
        if (v28 && v27)
        {
          v29 = objc_msgSend(v27, "type");
          LODWORD(self) = 0;
          v30 = 0;
          if (v29 <= 5 && ((1 << v29) & 0x32) != 0)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v31;
            if (v31 && isa_nsdata(v31))
              objc_msgSend(v27, "setIdentityReferenceInternal:", v30);
            LODWORD(self) = 1;
          }
          ne_log_obj();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v65) = (_DWORD)self;
            _os_log_debug_impl(&dword_19BD16000, v32, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesAppVPN: done (OK %d)", buf, 8u);
          }

        }
        goto LABEL_84;
      }
LABEL_85:

      goto LABEL_86;
    }
    -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v12 = v8;
      if (!self)
        goto LABEL_85;
      -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ne_log_obj();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v27, "interfaceProtocolMapping");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = (const char *)v12;
        v66 = 2112;
        v67 = v53;
        _os_log_debug_impl(&dword_19BD16000, v36, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificatesAOVpn: certs %@, mapping %@", buf, 0x16u);

      }
      if (!v27)
        goto LABEL_55;
      objc_msgSend(v27, "interfaceProtocolMapping");
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37
        || (v38 = (void *)v37,
            objc_msgSend(v27, "interfaceProtocolMapping"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend(v39, "count"),
            v39,
            v38,
            !v40))
      {
LABEL_55:
        ne_log_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v44, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: alwaysOnVPN Tunnel Configuration missing", buf, 2u);
        }

        goto LABEL_58;
      }
      objc_msgSend(v27, "interfaceProtocolMapping");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("AlwaysOnVPNInterfaceCellular"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        if (objc_msgSend(v42, "authenticationMethod") == 1)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRefForCellular"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsdata(v43))
          {
            objc_msgSend(v42, "setIdentityReferenceInternal:", v43);
          }
          else if ((objc_msgSend(v42, "useExtendedAuthentication") & 1) == 0)
          {
            ne_log_obj();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v57 = "invalid";
              if (!v43)
                v57 = "missing";
              *(_DWORD *)buf = 136315138;
              v65 = v57;
              _os_log_error_impl(&dword_19BD16000, v54, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: tunnel cert %s for Cellular tunnel", buf, 0xCu);
            }

            goto LABEL_58;
          }
LABEL_69:
          objc_msgSend(v27, "interfaceProtocolMapping");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("AlwaysOnVPNInterfaceWiFi"));
          self = (NEConfiguration *)objc_claimAutoreleasedReturnValue();

          if (!self)
          {
            ne_log_obj();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19BD16000, v51, OS_LOG_TYPE_INFO, "NEConfiguration setCertificatesAOVpn: no WiFi tunnel config", buf, 2u);
            }

            goto LABEL_83;
          }
          if (-[NEConfiguration authenticationMethod](self, "authenticationMethod") != 1)
          {
LABEL_83:
            buf[0] = 1;

            LOBYTE(self) = buf[0];
            goto LABEL_84;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRefForWifi"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsdata(v50))
          {
            -[NEConfiguration setIdentityReferenceInternal:](self, "setIdentityReferenceInternal:", v50);
LABEL_82:
            v43 = v50;
            goto LABEL_83;
          }
          if ((-[NEConfiguration useExtendedAuthentication](self, "useExtendedAuthentication") & 1) != 0)
            goto LABEL_82;
          ne_log_obj();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v58 = "invalid";
            if (!v50)
              v58 = "missing";
            *(_DWORD *)buf = 136315138;
            v65 = v58;
            _os_log_error_impl(&dword_19BD16000, v56, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesAOVpn: tunnel cert %s for WiFi tunnel", buf, 0xCu);
          }

LABEL_58:
          LOBYTE(self) = 0;
LABEL_84:

          goto LABEL_85;
        }
      }
      else
      {
        ne_log_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v48, OS_LOG_TYPE_INFO, "NEConfiguration setCertificatesAOVpn: no cellular tunnel configs", buf, 2u);
        }

      }
      v43 = 0;
      goto LABEL_69;
    }
    -[NEConfiguration contentFilter](self, "contentFilter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v46 = -[NEConfiguration setCertificateContentFilter:](self, v12);
LABEL_64:
      LOBYTE(self) = v46;
      goto LABEL_85;
    }
    -[NEConfiguration dnsSettings](self, "dnsSettings");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PayloadCertificateRef"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v46 = -[NEConfiguration setCertificateDNSSettings:](self, v12);
      goto LABEL_64;
    }
    -[NEConfiguration relay](self, "relay");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      LOBYTE(self) = -[NEConfiguration setCertificatesRelay:keyRefs:specs:](self, v8, v9, v10);
      goto LABEL_86;
    }
  }
  else
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v65 = (const char *)v8;
      _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificates: malformed certificate references %@", buf, 0xCu);
    }

  }
  LOBYTE(self) = 0;
LABEL_86:

  return (char)self;
}

- (BOOL)setCertificates:(id)a3
{
  return -[NEConfiguration setCertificates:keyRefs:specs:](self, "setCertificates:keyRefs:specs:", a3, 0, 0);
}

- (id)getCertificates
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NEConfiguration getConfigurationProtocol](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    v7 = objc_getProperty(v4, v5, 96, 1);

    if (v7)
    {
      v9 = objc_getProperty(v6, v8, 96, 1);
      objc_msgSend(v9, "persistentReference");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v9, "accessGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v9, "persistentReference");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }

    }
  }

  return v3;
}

- (id)getPendingCertificateUUIDs:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = isa_nsstring(v12);

          if (v13)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v8);

          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)getPendingCertificateInfo:(id)a3
{
  return -[NEConfiguration getPendingCertificateUUIDsInternal:](self, a3);
}

- (id)getConfigurationIdentifier
{
  void *v2;
  void *v3;

  -[NEConfiguration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)setPayloadInfoIdentity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  const char *v57;
  NEKeychainItem *v58;
  uint64_t v59;
  id v60;
  id v61;
  NEKeychainItem *v62;
  NEKeychainItem *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *Property;
  const char *v68;
  void *v69;
  id v70;
  NEKeychainItem *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  Class isa;
  objc_class *v76;
  Class v77;
  objc_class *v78;
  void *v80;
  id v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint8_t buf[4];
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEConfiguration alwaysOnVPN](self, "alwaysOnVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentity called for AlwaysOn, not applicable", buf, 2u);
    }
    goto LABEL_70;
  }
  ne_log_large_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentity", buf, 2u);
  }

  v8 = v4;
  v9 = v8;
  if (!self)
  {

    v83 = v9;
    v6 = v83;
    goto LABEL_70;
  }
  -[NEConfiguration getConfigurationProtocol](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v80 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v91 = v80;
      v81 = v80;
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%@ setPayloadInfoIdentityUserNameAndPassword: missing protocol info", buf, 0xCu);

    }
    goto LABEL_22;
  }
  if (v9)
    v11 = (void *)v9[5];
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    if (v9)
      v13 = (void *)v9[5];
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend(v10, "setUsername:", v14);

  }
  if (v9)
    v15 = (void *)v9[6];
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    if (v9)
      v17 = (void *)v9[6];
    else
      v17 = 0;
    v18 = v17;
    -[NEConfiguration setConfigurationVPNPassword:](self, v18);
LABEL_22:

  }
  v19 = v9;
  -[NEConfiguration getConfigurationProtocol](self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v21 = (id)v19[7];
    if (v21)
    {

      goto LABEL_28;
    }
    v22 = (void *)v19[8];
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  if (!v23)
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      goto LABEL_38;
    v82 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v91 = v82;
    v40 = v82;
    _os_log_debug_impl(&dword_19BD16000, v39, OS_LOG_TYPE_DEBUG, "%@ setPayloadInfoIdentityProxy: skipped, not in payload.", buf, 0xCu);
    goto LABEL_34;
  }
LABEL_28:
  if (v20)
  {
    objc_msgSend(v20, "proxySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "HTTPServer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAuthenticationRequired:", 1);

    if (v19)
    {
      v26 = (id)v19[7];
      objc_msgSend(v20, "proxySettings");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "HTTPServer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setUsername:", v26);

      v29 = (void *)v19[8];
    }
    else
    {
      objc_msgSend(v20, "proxySettings");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "HTTPServer");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setUsername:", 0);

      v29 = 0;
    }
    v30 = v29;
    objc_msgSend(v20, "proxySettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "HTTPServer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPassword:", v30);

    objc_msgSend(v20, "proxySettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "HTTPSServer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAuthenticationRequired:", 1);

    if (v19)
    {
      v35 = (id)v19[7];
      objc_msgSend(v20, "proxySettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "HTTPSServer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setUsername:", v35);

      v38 = (void *)v19[8];
    }
    else
    {
      objc_msgSend(v20, "proxySettings");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "HTTPSServer");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setUsername:", 0);

      v38 = 0;
    }
    v39 = v38;
    objc_msgSend(v20, "proxySettings");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "HTTPSServer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setPassword:", v39);

  }
  else
  {
    ne_log_obj();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v91 = v42;
    v40 = v42;
    _os_log_error_impl(&dword_19BD16000, v39, OS_LOG_TYPE_ERROR, "%@ setPayloadInfoIdentityProxy: missing  protocol info", buf, 0xCu);
  }
LABEL_34:

LABEL_38:
  if (v19)
  {
    v43 = (__CFString *)(id)v19[9];
    if (v43)
      goto LABEL_50;
  }
  -[NEConfiguration VPN](self, "VPN");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "protocol");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "type") == 5)
  {

  }
  else
  {
    -[NEConfiguration VPN](self, "VPN");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "protocol");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "type");

    if (v48 != 1)
    {
LABEL_47:
      ne_log_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BD16000, v51, OS_LOG_TYPE_DEBUG, "setPayloadInfoIdentityIPSecSharedSecret: no SharedSecret found, set to blank", buf, 2u);
      }

      v43 = &stru_1E3CC53C8;
LABEL_50:
      v50 = v43;
      -[NEConfiguration VPN](self, "VPN");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "protocol");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "type");

      if (v54 != 5)
      {
        if (v54 == 2)
        {
          v63 = [NEKeychainItem alloc];
          -[NEConfiguration VPN](self, "VPN");
          v56 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "protocol");
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)v64;
          if (v64)
            v66 = *(_QWORD *)(v64 + 80);
          else
            v66 = 0;
          -[NEConfiguration VPN](self, "VPN");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "protocol");
          Property = (void *)objc_claimAutoreleasedReturnValue();
          v69 = Property;
          v89 = v4;
          if (Property)
            Property = objc_getProperty(Property, v68, 88, 1);
          v70 = Property;
          v71 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v63, "initWithPassword:domain:accessGroup:", v50, v66, v70);
          -[NEConfiguration VPN](self, "VPN");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "protocol");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setSharedSecretKeychainItem:", v71);

          v4 = v89;
          goto LABEL_62;
        }
        if (v54 != 1)
        {
LABEL_63:

          goto LABEL_64;
        }
      }
      -[NEConfiguration VPN](self, "VPN");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "protocol");
      v56 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      v58 = [NEKeychainItem alloc];
      if (v56)
      {
        v59 = v56[10];
        v60 = objc_getProperty(v56, v57, 88, 1);
      }
      else
      {
        v59 = 0;
        v60 = 0;
      }
      v61 = v60;
      v62 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v58, "initWithPassword:domain:accessGroup:", v50, v59, v61);
      objc_msgSend(v56, "setSharedSecretKeychainItem:", v62);

      if (!objc_msgSend(v56, "authenticationMethod"))
        objc_msgSend(v56, "setAuthenticationMethod:", 2);
LABEL_62:

      goto LABEL_63;
    }
  }
  -[NEConfiguration VPN](self, "VPN");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "protocol");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((-[__CFString authenticationMethod](v50, "authenticationMethod")
     || (-[__CFString useExtendedAuthentication](v50, "useExtendedAuthentication") & 1) == 0)
    && -[__CFString authenticationMethod](v50, "authenticationMethod") != 1)
  {

    goto LABEL_47;
  }
LABEL_64:

  v74 = v19;
  v6 = v74;
  if (v19)
    isa = v74[10].isa;
  else
    isa = 0;
  v76 = isa;

  if (v76)
  {
    if (v19)
      v77 = v6[10].isa;
    else
      v77 = 0;
    v78 = v77;
    -[NEConfiguration setConfigurationVPNPassword:](self, v78);

  }
LABEL_70:

  return 1;
}

- (BOOL)setPayloadInfoCommon:(id)a3 payloadOrganization:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NEProfileIngestionPayloadInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v16;
  _BYTE v17[24];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v17 = 138412802;
    *(_QWORD *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = v6;
    *(_WORD *)&v17[22] = 2112;
    v18 = v7;
    v16 = *(id *)&v17[4];
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%@ setPayloadInfoCommon payload UUID '%@', organization '%@'", v17, 0x20u);

  }
  -[NEConfiguration payloadInfo](self, "payloadInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (v10 = objc_alloc_init(NEProfileIngestionPayloadInfo),
        -[NEConfiguration setPayloadInfo:](self, "setPayloadInfo:", v10),
        v10,
        -[NEConfiguration payloadInfo](self, "payloadInfo"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    -[NEConfiguration payloadInfo](self, "payloadInfo", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPayloadUUID:", v6);

    -[NEConfiguration payloadInfo](self, "payloadInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPayloadOrganization:", v7);

    if (-[NEConfiguration grade](self, "grade") == 2)
      -[NEConfiguration setApplicationName:](self, "setApplicationName:", v7);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)setProfileInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NEProfileIngestionPayloadInfo *v7;
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
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_large_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v23 = 138412546;
    *(_QWORD *)&v23[4] = objc_opt_class();
    *(_WORD *)&v23[12] = 2112;
    *(_QWORD *)&v23[14] = v4;
    v22 = *(id *)&v23[4];
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ setProfileInfo %@", v23, 0x16u);

  }
  -[NEConfiguration payloadInfo](self, "payloadInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_alloc_init(NEProfileIngestionPayloadInfo),
        -[NEConfiguration setPayloadInfo:](self, "setPayloadInfo:", v7),
        v7,
        -[NEConfiguration payloadInfo](self, "payloadInfo"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"), *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadOrganization"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfiguration payloadInfo](self, "payloadInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProfileOrganization:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration payloadInfo](self, "payloadInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProfileUUID:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration payloadInfo](self, "payloadInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProfileIdentifier:", v14);

    -[NEConfiguration payloadInfo](self, "payloadInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProfileSource:", 1);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInstalledByMDM"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v17))
    {
      if (objc_msgSend(v17, "BOOLValue"))
        v18 = 2;
      else
        v18 = 1;
      -[NEConfiguration payloadInfo](self, "payloadInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProfileSource:", v18);

    }
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)setPerAppRuleSettings:(id)a3 withAppIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NEAppRule *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  __CFString *v66;
  void *v67;
  id v68;
  id v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  __CFString *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  id v82;
  __int16 v83;
  const __CFString *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  -[NEConfiguration appVPN](self, "appVPN");
  v8 = objc_claimAutoreleasedReturnValue();
  -[NEConfiguration contentFilter](self, "contentFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "perApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEConfiguration contentFilter](self, "contentFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = v11;
    objc_msgSend(v11, "perApp");
    v17 = objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[NEConfiguration dnsProxy](self, "dnsProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "perApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NEConfiguration dnsProxy](self, "dnsProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[NEConfiguration relay](self, "relay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "perApp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NEConfiguration relay](self, "relay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v17 = 0;
LABEL_8:
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v82 = (id)objc_opt_class();
    v83 = 2112;
    v84 = v7;
    v31 = v82;
    _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: appID %@", buf, 0x16u);

  }
  if (!(v8 | v17))
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v22 = 0;
      goto LABEL_68;
    }
    v50 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v82 = v50;
    v19 = v50;
    _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: perApp not initialized", buf, 0xCu);
LABEL_55:

    goto LABEL_16;
  }
  if (!v6 || !v7)
  {
    ne_log_large_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v53 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v82 = v53;
      v83 = 2112;
      v84 = v7;
      v85 = 2112;
      v86 = v6;
      v54 = v53;
      _os_log_debug_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: skip rule setting for empty ID or rules %@, %@", buf, 0x20u);

    }
    v22 = 1;
    goto LABEL_68;
  }
  v19 = -[NEAppRule initWithSigningIdentifier:]([NEAppRule alloc], "initWithSigningIdentifier:", v7);
  if (v8)
    v20 = (void *)v8;
  else
    v20 = (void *)v17;
  -[NEAppRule setNoRestriction:](v19, "setNoRestriction:", objc_msgSend(v20, "noRestriction"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AccountIdentifierMatch"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (!isa_nsarray(v23))
    {
      ne_log_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v58 = (void *)objc_opt_class();
        v71 = v58;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AccountIdentifierMatch"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v82 = v58;
        v83 = 2112;
        v84 = CFSTR("AccountIdentifierMatch");
        v85 = 2112;
        v86 = v60;
        v61 = v60;
        _os_log_error_impl(&dword_19BD16000, v30, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@", buf, 0x20u);

      }
      v22 = 0;
      v21 = v24;
      goto LABEL_68;
    }
    -[NEAppRule setMatchAccountIdentifiers:](v19, "setMatchAccountIdentifiers:", v24);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DNSDomainMatch"));
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (isa_nsarray(v21))
    {
      -[NEAppRule setMatchDomains:](v19, "setMatchDomains:", v21);
      goto LABEL_27;
    }
    ne_log_obj();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v62 = (void *)objc_opt_class();
      v69 = v62;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DNSDomainMatch"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v82 = v62;
      v83 = 2112;
      v84 = CFSTR("DNSDomainMatch");
      v85 = 2112;
      v86 = v64;
      v65 = v64;
      _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to set %@, unsupported type %@", buf, 0x20u);

    }
    goto LABEL_55;
  }
LABEL_27:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = isa_nsstring(v25);

  if (v26)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppRule setMatchPath:](v19, "setMatchPath:", v27);

  }
  if (-[NEAppRule noRestriction](v19, "noRestriction"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NoDivertDNS"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v28))
      -[NEAppRule setNoDivertDNS:](v19, "setNoDivertDNS:", objc_msgSend(v28, "BOOLValue"));

  }
  v74 = v7;
  v75 = v6;
  v72 = (void *)v17;
  v73 = (void *)v8;
  v70 = v21;
  if (v8)
    v29 = (void *)v8;
  else
    v29 = (void *)v17;
  objc_msgSend(v29, "appRules");
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v77;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v77 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend(v38, "matchSigningIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEAppRule matchSigningIdentifier](v19, "matchSigningIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqualToString:", v40);

        if (v41)
        {
          objc_msgSend(v38, "matchDomains");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule matchDomains](v19, "matchDomains");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEConfiguration mergeArray:withArray:](self, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setMatchDomains:", v45);

          objc_msgSend(v38, "matchAccountIdentifiers");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEAppRule matchAccountIdentifiers](v19, "matchAccountIdentifiers");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEConfiguration mergeArray:withArray:](self, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setMatchAccountIdentifiers:", v48);

          v49 = v33;
          v7 = v74;
          v6 = v75;
          v17 = (uint64_t)v72;
          v8 = (uint64_t)v73;
          v21 = v70;
          goto LABEL_65;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      if (v35)
        continue;
      break;
    }
  }

  if (v33)
    v42 = (id)objc_msgSend(v33, "mutableCopy");
  else
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = v42;
  v8 = (uint64_t)v73;
  v7 = v74;
  v21 = v70;
  v17 = (uint64_t)v72;
  v6 = v75;
  if (v42)
  {
    objc_msgSend(v42, "addObject:", v19);
    if (v73)
      v51 = v73;
    else
      v51 = v72;
    objc_msgSend(v51, "setAppRules:", v49);
LABEL_65:

    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      v56 = (id)objc_opt_class();
      if (v8)
        v57 = (void *)v8;
      else
        v57 = (void *)v17;
      objc_msgSend(v57, "appRules");
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v82 = v56;
      v83 = 2112;
      v84 = v66;
      _os_log_debug_impl(&dword_19BD16000, v52, OS_LOG_TYPE_DEBUG, "%@ setPerAppRuleSettings: done with %@", buf, 0x16u);

    }
    v22 = 1;
  }
  else
  {
    ne_log_obj();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v67 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v82 = v67;
      v68 = v67;
      _os_log_error_impl(&dword_19BD16000, v52, OS_LOG_TYPE_ERROR, "%@ setPerAppRuleSettings: failed to allocate for app rules", buf, 0xCu);

      v8 = (uint64_t)v73;
      v17 = (uint64_t)v72;
      v21 = v70;
    }
    v22 = 0;
  }

LABEL_68:
  return v22;
}

- (BOOL)setPerAppUUID:(id)a3 andSafariDomains:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  const __CFString *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[NEConfiguration(NEProfileIngestionMethods) setPerAppUUID:andSafariDomains:]";
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%s: perAppUUID %@", buf, 0x16u);
  }

  if (v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v6);
    -[NEConfiguration setExternalIdentifier:](self, "setExternalIdentifier:", v9);

  }
  if (objc_msgSend(v7, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("DNSDomainMatch"));
    if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v10, CFSTR("com.apple.mobilesafari")))
    {
      v16 = CFSTR("DNSDomainMatch");
      v17 = v7;
      v11 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v12, CFSTR("com.apple.webapp"));

      if (v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
LABEL_16:
        _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "setPerAppUUID could not add Safari perApp rules", buf, 2u);
      }
    }
    else
    {
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        goto LABEL_16;
      }
    }

    v11 = 0;
    goto LABEL_13;
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)setAppLayerVPNUUID:(id)a3 andSafariDomains:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "-[NEConfiguration(NEProfileIngestionMethods) setAppLayerVPNUUID:andSafariDomains:]";
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%s: vpnUUID %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[NEConfiguration setPerAppUUID:andSafariDomains:](self, "setPerAppUUID:andSafariDomains:", v6, v7);
  return v9;
}

- (BOOL)setSMBDomains:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  id v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11[0] = CFSTR("DNSDomainMatch");
    v11[1] = CFSTR("Path");
    v12[0] = v4;
    v12[1] = CFSTR("/System/Library/PrivateFrameworks/SMBClientProvider.framework/smbclientd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v5, CFSTR("com.apple.smbclientd"));
    if (!v6)
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to add an app rule for SMB domains (%@)", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)setMailDomains:(id)a3
{
  return -[NEConfiguration setMailDomains:accountIdentifiers:](self, "setMailDomains:accountIdentifiers:", a3, 0);
}

- (BOOL)setMailDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("identifier \"com.apple.mail\" and anchor apple"), CFSTR("DesignatedRequirement"));
      if (objc_msgSend(v6, "count"))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("DNSDomainMatch"));
      if (objc_msgSend(v7, "count"))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("AccountIdentifierMatch"));
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.mobilemail")))
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("/System/Library/PrivateFrameworks/EmailDaemon.framework/maild"), CFSTR("Path"));
        if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.email.maild")))
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("/System/Library/PrivateFrameworks/ExchangeSync.framework/Support/exchangesyncd"), CFSTR("Path"));
          if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.datausage.dataaccess.activesync")))
          {
            objc_msgSend(v8, "removeObjectForKey:", CFSTR("Path"));
            if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.mobilenotes")))
            {
              v9 = 1;
LABEL_26:

              goto LABEL_27;
            }
            ne_log_obj();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
LABEL_25:

              v9 = 0;
              goto LABEL_26;
            }
            v15 = 138412290;
            v16 = CFSTR("com.apple.mobilenotes");
            v11 = "Failed to add an app rule for %@";
            v12 = v10;
            v13 = 12;
LABEL_23:
            _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
            goto LABEL_25;
          }
          ne_log_obj();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          LOWORD(v15) = 0;
          v11 = "Failed to add an app rule for exchangesyncd";
        }
        else
        {
          ne_log_obj();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          LOWORD(v15) = 0;
          v11 = "Failed to add an app rule for maild";
        }
      }
      else
      {
        ne_log_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        LOWORD(v15) = 0;
        v11 = "Failed to add an app rule for Mail";
      }
      v12 = v10;
      v13 = 2;
      goto LABEL_23;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
LABEL_27:

  return v9;
}

- (BOOL)setCalendarDomains:(id)a3
{
  return -[NEConfiguration setCalendarDomains:accountIdentifiers:](self, "setCalendarDomains:accountIdentifiers:", a3, 0);
}

- (BOOL)setCalendarDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[2];
  __int16 v17;

  v6 = a3;
  v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v6, "count"))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("DNSDomainMatch"));
      if (objc_msgSend(v7, "count"))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("AccountIdentifierMatch"));
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.mobilecal")))
      {
        if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.reminders")))
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd"), CFSTR("Path"));
          if (objc_msgSend(v6, "count"))
            -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, CFSTR("DNSDomainMatch"));
          if (objc_msgSend(v7, "count"))
            -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, CFSTR("AccountIdentifierMatch"));
          if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v9, CFSTR("com.apple.dataaccessd")))
          {
            v10 = 1;
LABEL_28:

            goto LABEL_29;
          }
          ne_log_obj();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v15 = 0;
            _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "Failed to add an app rule for dataaccessd", v15, 2u);
          }

LABEL_27:
          v10 = 0;
          goto LABEL_28;
        }
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v11 = "Failed to add an app rule for Reminders";
        v12 = buf;
      }
      else
      {
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v17 = 0;
        v11 = "Failed to add an app rule for Calendar";
        v12 = (uint8_t *)&v17;
      }
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, v11, v12, 2u);
      goto LABEL_27;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
LABEL_29:

  return v10;
}

- (BOOL)setContactsDomains:(id)a3
{
  return -[NEConfiguration setContactsDomains:accountIdentifiers:](self, "setContactsDomains:accountIdentifiers:", a3, 0);
}

- (BOOL)setContactsDomains:(id)a3 accountIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v6)
    && -[NEConfiguration validateStrings:]((uint64_t)self, v7))
  {
    if (!objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
    {
      v10 = 1;
      goto LABEL_24;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("identifier \"com.apple.AddressBook\" and anchor apple"), CFSTR("DesignatedRequirement"));
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("DNSDomainMatch"));
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("AccountIdentifierMatch"));
    if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v8, CFSTR("com.apple.MobileAddressBook")))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Support/dataaccessd"), CFSTR("Path"));
      if (objc_msgSend(v6, "count"))
        -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, CFSTR("DNSDomainMatch"));
      if (objc_msgSend(v7, "count"))
        -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, CFSTR("AccountIdentifierMatch"));
      if (-[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v9, CFSTR("com.apple.dataaccessd")))
      {
        v10 = 1;
LABEL_23:

        goto LABEL_24;
      }
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to add an app rule for dataaccessd", v13, 2u);
      }

    }
    else
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Failed to add an app rule for Contacts", buf, 2u);
      }
    }
    v10 = 0;
    goto LABEL_23;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (BOOL)setRestrictDomains:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NEPerApp *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint8_t v15[16];

  v3 = a3;
  -[NEConfiguration appVPN](self, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEConfiguration appVPN](self, "appVPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRestrictDomains:", v3);
LABEL_8:

    return 1;
  }
  -[NEConfiguration relay](self, "relay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v3)
    {
      -[NEConfiguration relay](self, "relay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "perApp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc_init(NEPerApp);
        -[NEConfiguration relay](self, "relay");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPerApp:", v10);

      }
    }
    -[NEConfiguration relay](self, "relay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "perApp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRestrictDomains:", v3);

    goto LABEL_8;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "Cannot restrict domains, configuration is not a per-app VPN or relay configuration", v15, 2u);
  }

  return 0;
}

- (BOOL)setExcludedDomains:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  if (!-[NEConfiguration validateStrings:]((uint64_t)self, v4))
    goto LABEL_9;
  if (objc_msgSend(v4, "count"))
  {
    -[NEConfiguration appVPN](self, "appVPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NEConfiguration appVPN](self, "appVPN");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExcludedDomains:", v4);

      goto LABEL_5;
    }
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Cannot set excluded domains on a non-per-app VPN configuration", v10, 2u);
    }

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
LABEL_5:
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)setAssociatedDomains:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (-[NEConfiguration validateStrings:]((uint64_t)self, v4))
  {
    if (objc_msgSend(v4, "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("identifier \"com.apple.swcd\" and anchor apple"), CFSTR("DesignatedRequirement"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("/usr/libexec/swcd"), CFSTR("Path"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("DNSDomainMatch"));
      v6 = -[NEConfiguration setPerAppRuleSettings:withAppIdentifier:](self, "setPerAppRuleSettings:withAppIdentifier:", v5, CFSTR("com.apple.swcd"));
      if (!v6)
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to add an app rule for swcd", v9, 2u);
        }

      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)validateStrings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (!isa_nsstring(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v9)))
          {
            v10 = 0;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)mergeArray:(void *)a3 withArray:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
    if (objc_msgSend(v6, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            if ((objc_msgSend(v6, "containsObject:", v12, (_QWORD)v15) & 1) == 0)
              objc_msgSend(v6, "addObject:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    }
    else
    {
      v13 = v5;
    }
    a1 = v13;

  }
  return a1;
}

- (BOOL)setConfigurationVPNPassword:(void *)a1
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NEKeychainItem *v9;
  SEL v10;
  id v11;
  NEKeychainItem *v12;
  uint8_t v14[16];

  v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "passwordKeychainItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = v5[10];
      v9 = [NEKeychainItem alloc];
      v11 = objc_getProperty(v5, v10, 88, 1);
      v12 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v9, "initWithPassword:domain:accessGroup:", v3, v8, v11);
      objc_msgSend(v5, "setPasswordKeychainItem:", v12);

      goto LABEL_8;
    }
    objc_msgSend(v5, "passwordKeychainItem");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setPassword:](v7, "setPassword:", v3);
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "setConfigurationVPNPassword failed: VPN not allocated", v14, 2u);
    }
  }

LABEL_8:
  return v5 != 0;
}

- (id)getConfigurationProtocol
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v1 = a1;
  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v1;
  objc_msgSend(a1, "VPN");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "VPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = v4;
    objc_msgSend(v4, "protocol");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  objc_msgSend(v1, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v1, "appVPN");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = (id)objc_opt_class();
    v10 = v12;
    _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@ getConfigurationProtocol: protocol info to be initialized", (uint8_t *)&v11, 0xCu);

  }
  return 0;
}

- (id)getPendingCertificateUUIDsInternal:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  void *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    objc_msgSend(a1, "VPN");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v5;
      -[NEConfiguration getConfigurationProtocol](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "VPN");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = 0;
      if (!v9 || !v8)
        goto LABEL_61;
      switch(objc_msgSend(v8, "type"))
      {
        case 1:
        case 4:
          if (objc_msgSend(v8, "authenticationMethod") == 1)
            goto LABEL_36;
          goto LABEL_48;
        case 2:
          v27 = objc_msgSend(v8, "machineAuthenticationMethod");
          if (v27 == 2)
          {
            objc_msgSend(v8, "machineIdentityReference");
            a1 = (void *)objc_claimAutoreleasedReturnValue();
            if (!a1)
            {
              v14 = 1;
              goto LABEL_56;
            }
            if (objc_msgSend(v8, "authenticationMethod") != 3)
            {
LABEL_44:
              v14 = 0;
              goto LABEL_56;
            }
          }
          else if (objc_msgSend(v8, "authenticationMethod") != 3)
          {
LABEL_48:
            v14 = 0;
            goto LABEL_57;
          }
          objc_msgSend(v8, "identityReferenceInternal");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v30 == 0;

          if (v27 != 2)
            goto LABEL_57;
LABEL_56:

LABEL_57:
          ne_log_obj();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            goto LABEL_58;
          objc_msgSend(v7, "pendingCertificates");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v38) = 67109378;
          HIDWORD(v38) = v14;
          LOWORD(v39) = 2112;
          *(_QWORD *)((char *)&v39 + 2) = v34;
          v35 = "NEConfiguration getPendingCertificateUUIDsVPN: pending %d, cert UUIDs %@";
          break;
        case 3:
          if (objc_msgSend(v8, "authenticationMethod") != 3)
            goto LABEL_48;
LABEL_36:
          objc_msgSend(v8, "identityReferenceInternal");
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = a1 == 0;
          goto LABEL_56;
        case 5:
          objc_msgSend(v7, "pendingCertificates");
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a1)
            goto LABEL_44;
          objc_msgSend(v8, "identityReferenceInternal");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v28 == 0;

          goto LABEL_56;
        default:
          goto LABEL_48;
      }
      goto LABEL_65;
    }
    objc_msgSend(a1, "appVPN");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v7 = v5;
      -[NEConfiguration getConfigurationProtocol](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "appVPN");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      a1 = 0;
      if (!v11 || !v8)
        goto LABEL_61;
      v12 = objc_msgSend(v8, "type");
      switch(v12)
      {
        case 1:
          goto LABEL_14;
        case 5:
          objc_msgSend(v7, "pendingCertificates");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v8, "identityReferenceInternal");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v29 == 0;

          }
          else
          {
            v14 = 0;
          }
          goto LABEL_52;
        case 4:
LABEL_14:
          if (objc_msgSend(v8, "authenticationMethod") == 1)
          {
            objc_msgSend(v8, "identityReferenceInternal");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;
LABEL_52:

            goto LABEL_53;
          }
          break;
      }
      v14 = 0;
LABEL_53:
      ne_log_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        goto LABEL_58;
      objc_msgSend(v7, "pendingCertificates");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v38) = 67109378;
      HIDWORD(v38) = v14;
      LOWORD(v39) = 2112;
      *(_QWORD *)((char *)&v39 + 2) = v34;
      v35 = "NEConfiguration getPendingCertificateUUIDsAppVPN: pending %d, cert UUIDs %@";
LABEL_65:
      _os_log_debug_impl(&dword_19BD16000, v33, OS_LOG_TYPE_DEBUG, v35, (uint8_t *)&v38, 0x12u);

LABEL_58:
      if (v14)
      {
LABEL_59:
        objc_msgSend(v7, "pendingCertificates", v38, v39, v40);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    objc_msgSend(a1, "alwaysOnVPN");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(a1, "contentFilter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        objc_msgSend(a1, "dnsSettings");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          -[NEConfiguration getPendingCertificateUUIDsDNSSettings:](a1, v5);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(a1, "relay");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v37)
          {
            a1 = 0;
            goto LABEL_62;
          }
          -[NEConfiguration getPendingCertificateUUIDsRelay:](a1, v5);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        a1 = (void *)v32;
LABEL_62:

        goto LABEL_63;
      }
      v7 = v5;
      objc_msgSend(a1, "contentFilter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v26;
      if (v26)
      {
        objc_msgSend(v26, "provider");
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a1)
          goto LABEL_61;
        goto LABEL_59;
      }
LABEL_60:
      a1 = 0;
      goto LABEL_61;
    }
    v7 = v5;
    objc_msgSend(a1, "alwaysOnVPN");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v16)
    {
      objc_msgSend(v16, "interfaceProtocolMapping");
      a1 = (void *)objc_claimAutoreleasedReturnValue();

      if (a1)
      {
        objc_msgSend(v8, "interfaceProtocolMapping");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AlwaysOnVPNInterfaceCellular"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18
          && (objc_msgSend(v7, "pendingCertificates"), (v19 = objc_claimAutoreleasedReturnValue()) != 0)
          && (v20 = (void *)v19,
              objc_msgSend(v18, "identityReferenceInternal"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v21,
              v20,
              !v21))
        {
          v23 = v18;
        }
        else
        {
          objc_msgSend(v8, "interfaceProtocolMapping");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("AlwaysOnVPNInterfaceWiFi"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            goto LABEL_25;
          objc_msgSend(v7, "pendingCertificates");
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a1)
          {
LABEL_41:

LABEL_61:
            goto LABEL_62;
          }
          objc_msgSend(v23, "identityReferenceInternal");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
LABEL_25:
            a1 = 0;
            goto LABEL_41;
          }
        }
        objc_msgSend(v7, "pendingCertificates");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
    }
    else
    {
      a1 = 0;
    }
    v23 = 0;
    goto LABEL_41;
  }
LABEL_63:

  return a1;
}

- (id)getPendingCertificateUUIDsDNSSettings:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "dnsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "pendingCertificates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getPendingCertificateUUIDsRelay:(void *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(a1, "relay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "pendingCertificates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)setCertificateContentFilter:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "contentFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "provider");
      v6 = objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (isa_nsdata(v3))
        {
          objc_msgSend(v5, "provider");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setIdentityReference:", v3);

        }
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v10 = 0;
          _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificateContentFilter: done", v10, 2u);
        }

        v6 = 1;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)setCertificateDNSSettings:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[16];

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "dnsSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && isa_nsdata(v3) && (objc_msgSend(v5, "dnsProtocol") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(v5, "setIdentityReference:", v3);
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v9 = 0;
        _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "NEConfiguration setCertificateDNSSettings: done", v9, 2u);
      }

      v7 = 1;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)setCertificatesRelay:(void *)a3 keyRefs:(void *)a4 specs:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[16];

  v7 = a2;
  v33 = a3;
  v32 = a4;
  if (!a1)
    goto LABEL_27;
  objc_msgSend(a1, "relay");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_28;
  objc_msgSend(a1, "relay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  objc_msgSend(a1, "relay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relays");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v31 = v14;
  if (v14)
  {
    v15 = 0;
    v30 = a1;
    do
    {
      objc_msgSend(a1, "relay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "relays");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), CFSTR("_PayloadCertificateRef"), v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v19);
      v22 = objc_claimAutoreleasedReturnValue();
      v36 = v21;
      v37 = v19;
      v35 = (void *)v22;
      if (v21 && (v23 = v22, isa_nsdata(v21)))
      {
        if (!v23)
        {
          ne_log_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19BD16000, v28, OS_LOG_TYPE_ERROR, "NEConfiguration setCertificatesRelay: Key not in system keychain", buf, 2u);
          }

          goto LABEL_27;
        }
        objc_msgSend(v18, "setIdentityWithKey:keyRef:", v20, v21);
      }
      else if (isa_nsdata(v20))
      {
        objc_msgSend(v18, "setIdentityReference:", v20);
      }
      v34 = v18;
      v24 = 0;
      v25 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u-%u"), CFSTR("_PayloadCertificateRef"), v15, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!isa_nsdata(v27))
          break;
        if (!v25)
          v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v25, "addObject:", v27);

        v24 = (v24 + 1);
        if ((_DWORD)v24 == 4)
          goto LABEL_20;
      }

LABEL_20:
      if (v25)
        objc_msgSend(v34, "setCertificateReferences:", v25);

      ++v15;
      a1 = v30;
    }
    while (v15 != v31);
  }
  v8 = 1;
LABEL_28:

  return v8;
}

- (uint64_t)configurePluginWithPayload:(void *)a3 pluginType:(void *)a4 payloadType:(void *)a5 vpnType:
{
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __objc2_class *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NETunnelProviderProtocol *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  id v61;
  id Property;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  char isKindOfClass;
  __CFString *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  uint64_t v96;
  void *v97;
  void *v98;
  __CFString *v99;
  void *v100;
  NSObject *v101;
  __CFString *v102;
  __CFString *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  unsigned __int8 v109;
  uint8_t buf[4];
  const __CFString *v111;
  __int16 v112;
  void *v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v9, "payloadAtom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VPN"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("TransparentProxy")))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TransparentProxy"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }
  ne_log_large_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v111 = v11;
    _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "configurePluginWithPayload: start with type %@", buf, 0xCu);
  }

  if (!v14)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_29:
      v109 = 0;
      goto LABEL_103;
    }
    *(_WORD *)buf = 0;
    v44 = "configurePluginWithPayload: plugin info missing";
    v45 = v24;
    v46 = 2;
LABEL_38:
    _os_log_error_impl(&dword_19BD16000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
    goto LABEL_17;
  }
  if (!v10)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: pluginType missing", buf, 2u);
    }

    v10 = 0;
    goto LABEL_29;
  }
  if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.vpn.managed")))
  {
    objc_msgSend(v9, "pluginUpgradeInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v9, "pluginUpgradeInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PluginType"));
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v18;
    }
    objc_msgSend(a1, "VPN");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "protocol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_41;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TransparentProxy")) & 1) != 0
      || (objc_msgSend(a1, "VPN"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "tunnelType"),
          v21,
          v22 == 2))
    {
      v23 = NETransparentProxyProviderProtocol;
    }
    else
    {
      v23 = NETunnelProviderProtocol;
    }
    v47 = (void *)objc_msgSend([v23 alloc], "initWithPluginType:", v10);
    objc_msgSend(a1, "VPN");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setProtocol:", v47);

    objc_msgSend(a1, "VPN");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "protocol");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
LABEL_41:
      objc_msgSend(a1, "VPN");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "protocol");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "setServerAddress:", &stru_1E3CC53C8);
      goto LABEL_42;
    }
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v111 = CFSTR("com.apple.vpn.managed");
    v44 = "configurePluginWithPayload: failed to allocate for %@ protocol";
    v45 = v24;
    v46 = 12;
    goto LABEL_38;
  }
  if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("com.apple.vpn.managed.applayer")))
  {
    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v11;
      _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: unsupported payload type %@", buf, 0xCu);
    }

    goto LABEL_29;
  }
  objc_msgSend(v9, "pluginUpgradeInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v34 = v10;
    goto LABEL_34;
  }
  v105 = v12;
  objc_msgSend(v9, "pluginUpgradeInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PluginType"));
  v107 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pluginUpgradeInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("HasAppProxy"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isa_nsnumber(v29) & 1) != 0)
  {
    objc_msgSend(v9, "pluginUpgradeInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("HasAppProxy"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {

  }
  objc_msgSend(a1, "appVPN");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTunnelType:", 1);

LABEL_33:
  v12 = v105;
  v34 = (id)v107;
LABEL_34:
  objc_msgSend(a1, "appVPN");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "protocol");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    goto LABEL_36;
  v38 = -[NETunnelProviderProtocol initWithPluginType:]([NETunnelProviderProtocol alloc], "initWithPluginType:", v34);
  objc_msgSend(a1, "appVPN");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProtocol:", v38);

  objc_msgSend(a1, "appVPN");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "protocol");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
LABEL_36:
    objc_msgSend(a1, "appVPN");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "protocol");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v34;
LABEL_42:
    if (!+[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v10))
    {
      objc_msgSend(a1, "setApplication:", v10);
      objc_msgSend(a1, "setApplicationIdentifier:", v10);
      if (v43)
        objc_setProperty_atomic(v43, v52, CFSTR("com.apple.managed.vpn.shared"), 88);
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RemoteAddress"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setServerAddress:", v53);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AuthName"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setUsername:", v54);

    objc_msgSend(v43, "setPasswordReference:", 0);
    objc_msgSend(v43, "setPasswordKeychainItem:", 0);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfiguration setConfigurationVPNPassword:](a1, v55);

    objc_msgSend(v43, "setIdentityReferenceInternal:", 0);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = v13;
    }
    else
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v58)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        if (v90)
        {
          v61 = v12;
          v91 = v13;
        }
        else
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v93)
            goto LABEL_53;
          v61 = v12;
          v91 = v14;
        }
        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        setLocalCertificate(v60);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setIdentityReferenceInternal:", v63);
LABEL_52:

        v12 = v61;
LABEL_53:
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v64;
        if (v65
          || (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID")),
              (v65 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

        }
        else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("Certificate")) & 1) == 0)
        {
          if ((objc_msgSend(v64, "isEqualToString:", CFSTR("Password")) & 1) != 0)
          {
            v66 = 0;
          }
          else
          {
            objc_msgSend(v43, "username");
            v96 = objc_claimAutoreleasedReturnValue();
            if (!v96
              || (v97 = (void *)v96,
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AuthPassword")),
                  v98 = (void *)objc_claimAutoreleasedReturnValue(),
                  v98,
                  v97,
                  !v98))
            {
              ne_log_obj();
              v101 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              {
                v102 = (__CFString *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v111 = v102;
                v112 = 2112;
                v113 = v108;
                v103 = v102;
                _os_log_error_impl(&dword_19BD16000, v101, OS_LOG_TYPE_ERROR, "%@ configurePluginWithPayload: unsupported authen type %@.", buf, 0x16u);

              }
              v109 = 0;
              goto LABEL_101;
            }
            v66 = 0;
            v64 = v108;
          }
LABEL_57:
          objc_msgSend(v43, "setAuthenticationMethod:", v66);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VendorConfig"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (v67)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VendorConfig"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)objc_msgSend(v68, "copy");
            objc_msgSend(v43, "setProviderConfiguration:", v69);

            v64 = v108;
          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AuthPasswordPluginType"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setAuthenticationPluginType:", v70);

          if (!-[NEConfiguration ingestDisconnectOptions:](a1, v14))
          {
            v109 = 0;

LABEL_102:
            goto LABEL_103;
          }
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ProviderBundleIdentifier"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setProviderBundleIdentifier:", v71);

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExtensibleSSOProvider"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setExtensibleSSOProvider:", v72);

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("IncludeAllNetworks"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsnumber(v73))
            objc_msgSend(v43, "setIncludeAllNetworks:", objc_msgSend(v73, "BOOLValue"));
          v106 = v12;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExcludeLocalNetworks"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsnumber(v74))
            objc_msgSend(v43, "setExcludeLocalNetworks:", objc_msgSend(v74, "BOOLValue"));
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExcludeCellularServices"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsnumber(v75))
            objc_msgSend(v43, "setExcludeCellularServices:", objc_msgSend(v75, "BOOLValue"));
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExcludeAPNs"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsnumber(v76))
            objc_msgSend(v43, "setExcludeAPNs:", objc_msgSend(v76, "BOOLValue"));
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ExcludeDeviceCommunication"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsnumber(v77))
            objc_msgSend(v43, "setExcludeDeviceCommunication:", objc_msgSend(v77, "BOOLValue"));
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("EnforceRoutes"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsnumber(v78))
            objc_msgSend(v43, "setEnforceRoutes:", objc_msgSend(v78, "BOOLValue"));
          objc_msgSend(v9, "payloadAtom", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("CellularSliceUUID"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80)
          {
            objc_msgSend(v9, "payloadAtom");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("CellularSliceUUID"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setSliceUUID:", v82);

          }
          objc_msgSend(a1, "VPN");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "protocol");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Order"));
            v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (isa_nsnumber(v86))
            {
              objc_msgSend(a1, "VPN");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "protocol");
              v88 = (void *)objc_claimAutoreleasedReturnValue();

              v12 = v106;
              if (-[__CFString integerValue](v86, "integerValue") < 0
                || (unint64_t)-[__CFString unsignedIntegerValue](v86, "unsignedIntegerValue") >> 31)
              {
                ne_log_obj();
                v89 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v111 = v86;
                  _os_log_error_impl(&dword_19BD16000, v89, OS_LOG_TYPE_ERROR, "Transparent proxy order is invalid: %@", buf, 0xCu);
                }

                v109 = 0;
LABEL_100:

LABEL_101:
                goto LABEL_102;
              }
              objc_msgSend(v88, "setOrder:", -[__CFString unsignedIntegerValue](v86, "unsignedIntegerValue"));

            }
          }
          ne_log_obj();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v43, "serverAddress");
            v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "providerConfiguration");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v111 = v99;
            v112 = 2112;
            v113 = v100;
            _os_log_debug_impl(&dword_19BD16000, v94, OS_LOG_TYPE_DEBUG, "configurePluginWithPayload: done, serverAddress %@, providerConfiguration %@", buf, 0x16u);

          }
          v109 = 1;
          v12 = v106;
          goto LABEL_100;
        }
        v66 = 1;
        goto LABEL_57;
      }
      v57 = v14;
    }
    objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v12;
    if (v43)
      Property = objc_getProperty(v43, v59, 88, 1);
    else
      Property = 0;
    v63 = Property;
    objc_msgSend(v9, "addCertificatePending:certificateTag:accessGroup:", v60, CFSTR("_PayloadCertificateRef"), v63);
    goto LABEL_52;
  }
  ne_log_obj();
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v111 = CFSTR("com.apple.vpn.managed.applayer");
    _os_log_error_impl(&dword_19BD16000, v92, OS_LOG_TYPE_ERROR, "configurePluginWithPayload: failed to allocate for %@ protocol", buf, 0xCu);
  }

  v109 = 0;
  v10 = v34;
LABEL_103:

  return v109;
}

- (BOOL)ingestDisconnectOptions:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  void *v14;
  id v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v16 = 138412290;
    *(_QWORD *)&v16[4] = objc_opt_class();
    v13 = *(id *)&v16[4];
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ ingestDisconnectOptions start", v16, 0xCu);

  }
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnIdle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v6))
      objc_msgSend(v4, "setDisconnectOnIdle:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnIdleTimer"), *(_OWORD *)v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsnumber(v7))
      objc_msgSend(v4, "setDisconnectOnIdleTimeout:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnSleep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsnumber(v8))
      objc_msgSend(v4, "setDisconnectOnSleep:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnWake"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsnumber(v9))
      objc_msgSend(v4, "setDisconnectOnWake:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnWakeTimer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsnumber(v10))
      objc_msgSend(v4, "setDisconnectOnWakeTimeout:", objc_msgSend(v10, "intValue"));
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)v16 = 138412290;
      *(_QWORD *)&v16[4] = v14;
      v15 = v14;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@ ingestDisconnectOptions failed: protocol not allocated", v16, 0xCu);

    }
    v10 = 0;
  }

  return v4 != 0;
}

- (uint64_t)ingestDNSOptions:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DNS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!isa_nsdictionary(v5))
    {
      v7 = 0;
      goto LABEL_7;
    }
    if (objc_msgSend(v5, "count"))
    {
      v6 = -[NEDNSSettings initFromLegacyDictionary:]([NEDNSSettings alloc], "initFromLegacyDictionary:", v5);
      objc_msgSend(v4, "setDNSSettings:", v6);

    }
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (uint64_t)configurePPPWithVPNOptions:(void *)a3 payloadBase:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VPN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEConfiguration getConfigurationProtocol](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v21) = 0;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "configurePPPWithVPNOptions", (uint8_t *)&v21, 2u);
  }

  objc_msgSend(a1, "appVPN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "VPN");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v7 == 0;
    else
      v13 = 1;
    v11 = !v13;

    if ((v11 & 1) != 0)
    {
      if (v6)
      {
        if ((isa_nsdictionary(v6) & 1) != 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "identityReferenceInternal");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_5;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
            v17 = objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setIdentityReferenceInternal:", v18);

          }
          else
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
              goto LABEL_5;
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addCertificatePending:certificateTag:", v17, CFSTR("_PayloadCertificateRef"));
          }
LABEL_25:

          goto LABEL_26;
        }
        ne_log_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v21 = 138412290;
          v22 = CFSTR("VPN");
          _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_INFO, "configurePPPWithVPNOptions: invalid %@ dictionary", (uint8_t *)&v21, 0xCu);
        }
      }
      else
      {
        ne_log_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v21 = 138412290;
          v22 = CFSTR("VPN");
          _os_log_debug_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEBUG, "configurePPPWithVPNOptions: nothing to do, empty %@ dictionary", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "configurePPPWithVPNOptions: L2TP not initialized", (uint8_t *)&v21, 2u);
      }
    }
    v10 = 0;
    goto LABEL_25;
  }
  v10 = 0;
LABEL_5:
  v11 = 1;
LABEL_26:

  return v11;
}

- (uint64_t)ingestProxyOptions:(void *)a1
{
  id v3;
  void *v4;
  NEProxySettings *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[NEConfiguration getConfigurationProtocol](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    ne_log_obj();
    v5 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = (id)objc_opt_class();
      v8 = v18;
      _os_log_error_impl(&dword_19BD16000, &v5->super, OS_LOG_TYPE_ERROR, "%@ ingestProxyOptions: missing protocol info", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Proxies"));
  v5 = (NEProxySettings *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = (id)objc_opt_class();
    v12 = v18;
    _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ ingestProxyOptions", (uint8_t *)&v17, 0xCu);

  }
  if (!v5)
  {
    v5 = objc_alloc_init(NEProxySettings);
    objc_msgSend(v4, "setProxySettings:", v5);
    goto LABEL_10;
  }
  if (!isa_nsdictionary(v5))
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      v15 = (void *)objc_opt_class();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      v16 = v15;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%@ ingestProxyOptions: unsupported proxy data type %@", (uint8_t *)&v17, 0x16u);

    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v7 = -[NEProxySettings initFromLegacyDictionary:]([NEProxySettings alloc], "initFromLegacyDictionary:", v5);
  objc_msgSend(v4, "setProxySettings:", v7);

LABEL_10:
  v9 = 1;
LABEL_15:

  return v9;
}

- (uint64_t)configureIKE:(void *)a3 vpnType:(void *)a4 payloadBase:(void *)a5 vpn:
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  __objc2_class *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NEVPNProtocolIKEv2 *v21;
  NEVPNProtocolIKEv2 *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NEKeychainItem *v55;
  Class isa;
  SEL v57;
  id v58;
  NEKeychainItem *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NEVPNIKEv1ProposalParameters *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NEKeychainItem *v84;
  void *v85;
  uint64_t v86;
  SEL v87;
  id Property;
  SEL v89;
  id v90;
  NEKeychainItem *v91;
  void *v92;
  uint64_t v93;
  const char *v94;
  NEKeychainItem *v95;
  uint64_t v96;
  id v97;
  NEKeychainItem *v98;
  NSObject *v99;
  Class v100;
  void *v101;
  void *v102;
  __CFString *v103;
  void *v104;
  __CFString *v105;
  SEL v106;
  id v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  const char *v114;
  uint64_t v115;
  const __CFString *v116;
  void *v117;
  int v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  id v132;
  char v133;
  NSObject *v134;
  NSObject *v135;
  uint64_t v136;
  void *v137;
  NSObject *v138;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  NSObject *self;
  void *v158;
  id v159;
  NSObject *v160;
  _QWORD *v161;
  _QWORD *v162;
  void *v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t buf[4];
  id v169;
  __int16 v170;
  void *v171;
  _BYTE v172[128];
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  ne_log_large_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v18 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v169 = v18;
    _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "%@ configureIKE", buf, 0xCu);

  }
  if (!v12)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "configureIKE: protocol not initialized", buf, 2u);
    }
    goto LABEL_197;
  }
  objc_msgSend(v12, "protocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("IPSec")))
    {
      v15 = NEVPNProtocolIPSec;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("L2TP")))
      {
        objc_msgSend(v11, "payloadAtom");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = isa_nsstring(v19);

        if (v20)
        {
          v21 = [NEVPNProtocolIKEv2 alloc];
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
          v22 = (NEVPNProtocolIKEv2 *)objc_claimAutoreleasedReturnValue();
          v23 = -[NEVPNProtocolIKEv2 initWithPluginType:](v21, v22);
          objc_msgSend(v12, "setProtocol:", v23);

        }
        else
        {
          v22 = objc_alloc_init(NEVPNProtocolIKEv2);
          objc_msgSend(v12, "setProtocol:", v22);
        }

        goto LABEL_16;
      }
      v15 = NEVPNProtocolL2TP;
    }
    v17 = objc_alloc_init(v15);
    objc_msgSend(v12, "setProtocol:", v17);
LABEL_16:

  }
  v158 = a1;
  objc_msgSend(v12, "protocol");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_197;
    v27 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v169 = v27;
    v28 = v27;
    _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%@ configureIKE failed to locate protocol for ipsec", buf, 0xCu);
    goto LABEL_111;
  }
  v16 = v24;
  objc_msgSend(v12, "protocol");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "type");

  if (v26 == 5)
  {
    objc_msgSend(v12, "protocol");
    v162 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v160 = 0;
LABEL_26:
    v161 = 0;
    goto LABEL_27;
  }
  if (v26 == 2)
  {
    objc_msgSend(v12, "protocol");
    v160 = objc_claimAutoreleasedReturnValue();
    v162 = 0;
    goto LABEL_26;
  }
  if (v26 != 1)
  {
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v143 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v169 = v143;
      v144 = v143;
      _os_log_error_impl(&dword_19BD16000, v28, OS_LOG_TYPE_ERROR, "%@ configureIKE failed to find protocol object for ipsec", buf, 0xCu);

    }
LABEL_111:

    goto LABEL_197;
  }
  objc_msgSend(v12, "protocol");
  v160 = 0;
  v161 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v162 = 0;
LABEL_27:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RemoteAddress"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v29))
  {
    objc_msgSend(v12, "protocol");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setServerAddress:", v29);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EnforceRoutes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v31))
  {
    v32 = objc_msgSend(v31, "BOOLValue");
    objc_msgSend(v12, "protocol");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setEnforceRoutes:", v32);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExcludeLocalNetworks"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v34))
  {
    v35 = objc_msgSend(v34, "BOOLValue");
    objc_msgSend(v12, "protocol");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setExcludeLocalNetworks:", v35);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExcludeCellularServices"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v37))
  {
    v38 = objc_msgSend(v37, "BOOLValue");
    objc_msgSend(v12, "protocol");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setExcludeCellularServices:", v38);

  }
  self = v16;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExcludeAPNs"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v40))
  {
    v41 = objc_msgSend(v40, "BOOLValue");
    objc_msgSend(v12, "protocol");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setExcludeAPNs:", v41);

  }
  v159 = v12;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExcludeDeviceCommunication"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v43))
  {
    v44 = objc_msgSend(v43, "BOOLValue");
    objc_msgSend(v12, "protocol");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setExcludeDeviceCommunication:", v44);

  }
  objc_msgSend(v11, "payloadAtom");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CellularSliceUUID"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v11, "payloadAtom");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("CellularSliceUUID"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocol");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSliceUUID:", v49);

  }
  if (!v160)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PasswordReference"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsdata(v51))
    {
      objc_msgSend(v12, "protocol");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setPasswordReference:", v51);

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SharedSecretReference"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsdata(v53))
      -[NSObject setSharedSecretReference:](self, "setSharedSecretReference:", v53);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XAuthPasswordEncryption"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsstring(v54) && objc_msgSend(v54, "isEqualToString:", CFSTR("Prompt")))
      -[NSObject setExtendedAuthPasswordPrompt:](self, "setExtendedAuthPasswordPrompt:", 1);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IdentityDataPasswordKeyStr"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v55 = [NEKeychainItem alloc];
      isa = self[10].isa;
      v58 = objc_getProperty(self, v57, 88, 1);
      v59 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v55, "initWithPassword:domain:accessGroup:", v43, isa, v58);
      -[NSObject setIdentityDataPasswordKeychainItem:](self, "setIdentityDataPasswordKeychainItem:", v59);

    }
  }
  if (!v161)
  {
    if (v162)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AuthName"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v80 && isa_nsstring(v80))
        objc_msgSend(v162, "setUsername:", v80);
      objc_msgSend(v162, "pluginType");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(v162, "pluginType");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setApplication:", v82);

      }
      goto LABEL_113;
    }
    goto LABEL_122;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XAuthName"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60 && isa_nsstring(v60))
    objc_msgSend(v161, "setUsername:", v60);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExchangeMode"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61 && isa_nsarray(v61))
    objc_msgSend(v161, "setLegacyExchangeMode:", v61);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Proposals"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62 || !isa_nsarray(v62))
    goto LABEL_100;
  v63 = v62;
  if (!objc_msgSend(v63, "count"))
    goto LABEL_99;
  v153 = v62;
  v154 = v11;
  v155 = v10;
  v156 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v152 = v63;
  v64 = v63;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
  if (!v65)
    goto LABEL_96;
  v66 = v65;
  v67 = *(_QWORD *)v165;
  do
  {
    v68 = 0;
    do
    {
      if (*(_QWORD *)v165 != v67)
        objc_enumerationMutation(v64);
      v69 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * v68);
      if (isa_nsdictionary(v69))
      {
        v70 = objc_alloc_init(NEVPNIKEv1ProposalParameters);
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("EncryptionAlgorithm"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("HashAlgorithm"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("DHGroup"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("Lifetime"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (!isa_nsstring(v71))
          goto LABEL_77;
        if ((objc_msgSend(v71, "isEqualToString:", CFSTR("DES")) & 1) != 0)
        {
          v75 = 1;
          goto LABEL_76;
        }
        if ((objc_msgSend(v71, "isEqualToString:", CFSTR("3DES")) & 1) != 0)
        {
          v75 = 2;
          goto LABEL_76;
        }
        if ((objc_msgSend(v71, "isEqualToString:", CFSTR("AES")) & 1) != 0)
        {
          v75 = 3;
          goto LABEL_76;
        }
        if (objc_msgSend(v71, "isEqualToString:", CFSTR("AES256")))
        {
          v75 = 4;
LABEL_76:
          -[NEVPNIKEv1ProposalParameters setEncryptionAlgorithm:](v70, "setEncryptionAlgorithm:", v75, v152);
          v76 = 1;
        }
        else
        {
LABEL_77:
          v76 = 0;
        }
        if (isa_nsstring(v72))
        {
          if ((objc_msgSend(v72, "isEqualToString:", CFSTR("SHA1")) & 1) != 0)
          {
            v77 = 1;
            goto LABEL_83;
          }
          if (objc_msgSend(v72, "isEqualToString:", CFSTR("MD5")))
          {
            v77 = 2;
LABEL_83:
            -[NEVPNIKEv1ProposalParameters setIntegrityAlgorithm:](v70, "setIntegrityAlgorithm:", v77, v152);
            v76 = 1;
          }
        }
        if ((isa_nsnumber(v73) & 1) != 0)
        {
          -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:](v70, "setDiffieHellmanGroup:", objc_msgSend(v73, "intValue"));
          if (!isa_nsnumber(v74))
          {
LABEL_89:
            objc_msgSend(v163, "addObject:", v70, v152);
            goto LABEL_90;
          }
        }
        else if ((isa_nsnumber(v74) & 1) == 0)
        {
          if (v76)
            goto LABEL_89;
LABEL_90:

          goto LABEL_91;
        }
        -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:](v70, "setLifetimeSeconds:", objc_msgSend(v74, "intValue", v152));
        goto LABEL_89;
      }
LABEL_91:
      ++v68;
    }
    while (v66 != v68);
    v78 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
    v66 = v78;
  }
  while (v78);
LABEL_96:

  if (objc_msgSend(v163, "count"))
    objc_msgSend(v161, "setLegacyProposals:", v163);

  v10 = v155;
  v9 = v156;
  v62 = v153;
  v11 = v154;
  v63 = v152;
LABEL_99:

LABEL_100:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XAuthPassword"), v152);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    if (isa_nsdata(v43))
    {
      v79 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v43, 4);

      v43 = (void *)v79;
      goto LABEL_118;
    }
    if ((isa_nsstring(v43) & 1) != 0)
    {
LABEL_118:
      v84 = [NEKeychainItem alloc];
      v85 = v161;
      v86 = v161[10];
      Property = objc_getProperty(v161, v87, 88, 1);
      goto LABEL_121;
    }
    ne_log_obj();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v110 = (void *)objc_opt_class();
      v111 = v110;
      v112 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v169 = v110;
      v170 = 2112;
      v171 = v112;
      v113 = v112;
      v114 = "%@ configureIKE: unsupported Xauth password data type %@";
      goto LABEL_200;
    }
    goto LABEL_145;
  }
  v80 = 0;
  if (!v162)
    goto LABEL_122;
LABEL_113:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XAuthPassword"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
      goto LABEL_122;
  }
  if (!isa_nsdata(v43))
  {
    if ((isa_nsstring(v43) & 1) != 0)
      goto LABEL_120;
    ne_log_obj();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      v149 = (void *)objc_opt_class();
      v111 = v149;
      v150 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v169 = v149;
      v170 = 2112;
      v171 = v150;
      v113 = v150;
      v114 = "%@ configureIKE: unsupported password data type %@";
LABEL_200:
      _os_log_error_impl(&dword_19BD16000, v109, OS_LOG_TYPE_ERROR, v114, buf, 0x16u);

    }
LABEL_145:

    v115 = 0;
    v12 = v159;
    v16 = self;
    goto LABEL_198;
  }
  v83 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v43, 4);

  v43 = (void *)v83;
LABEL_120:
  v84 = [NEKeychainItem alloc];
  v85 = v162;
  v86 = v162[10];
  Property = objc_getProperty(v162, v89, 88, 1);
LABEL_121:
  v90 = Property;
  v91 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v84, "initWithPassword:domain:accessGroup:", v43, v86, v90);
  objc_msgSend(v85, "setPasswordKeychainItem:", v91);

LABEL_122:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SharedSecret"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v159;
  v16 = self;
  if (!v92)
  {
LABEL_130:
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v101;
    if (v101 && isa_nsdata(v101))
    {
      setLocalCertificate(v102);
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v160)
        -[NSObject setMachineIdentityReference:](v160, "setMachineIdentityReference:", v103);
      else
        -[NSObject setIdentityReferenceInternal:](self, "setIdentityReferenceInternal:", v103);
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v104 || !isa_nsstring(v104))
      {
LABEL_148:
        if (v161
          && (v116 = (const __CFString *)*MEMORY[0x1E0CE8C90],
              objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C90]),
              v117 = (void *)objc_claimAutoreleasedReturnValue(),
              v118 = isa_nsnumber(v117),
              v117,
              v118))
        {
          v119 = v9;
          v120 = v116;
        }
        else
        {
          if (!v162
            || (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled")),
                v121 = (void *)objc_claimAutoreleasedReturnValue(),
                v122 = isa_nsnumber(v121),
                v121,
                !v122))
          {
LABEL_155:
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LocalIdentifier"));
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            if (v124 && isa_nsstring(v124))
            {
              v125 = v160;
              if (!v160)
                v125 = self;
              -[NSObject setLocalIdentifier:](v125, "setLocalIdentifier:", v124);
            }
            if (v162)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RemoteIdentifier"));
              v126 = (void *)objc_claimAutoreleasedReturnValue();

              if (isa_nsstring(v126))
                objc_msgSend(v162, "setRemoteIdentifier:", v126);
            }
            else
            {
              v126 = v124;
            }
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
            v127 = (void *)objc_claimAutoreleasedReturnValue();

            if (isa_nsstring(v127))
            {
              if (objc_msgSend(v127, "isEqualToString:", CFSTR("SharedSecret")))
              {
                v128 = v160;
                if (v160)
                {
                  v129 = 1;
LABEL_173:
                  -[NSObject setMachineAuthenticationMethod:](v128, "setMachineAuthenticationMethod:", v129);
                  goto LABEL_185;
                }
                v135 = self;
                v136 = 2;
LABEL_184:
                -[NSObject setAuthenticationMethod:](v135, "setAuthenticationMethod:", v136);
                goto LABEL_185;
              }
              if (objc_msgSend(v127, "isEqualToString:", CFSTR("Certificate")))
              {
                v128 = v160;
                if (v160)
                {
                  v129 = 2;
                  goto LABEL_173;
                }
                v135 = self;
                v136 = 1;
                goto LABEL_184;
              }
              v133 = objc_msgSend(v127, "isEqualToString:", CFSTR("None"));
              v130 = v162;
              if (!v162 || (v133 & 1) == 0)
              {
                ne_log_obj();
                v134 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v151 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  v169 = v151;
                  v170 = 2112;
                  v171 = v127;
                  _os_log_error_impl(&dword_19BD16000, v134, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported authentication type %@.", buf, 0x16u);

                }
LABEL_185:
                if (v162)
                  goto LABEL_186;
LABEL_191:
                if (!-[NEConfiguration ingestDisconnectOptions:](v158, v9))
                {

                  goto LABEL_196;
                }
                ne_log_obj();
                v138 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
                {
                  v140 = (id)objc_opt_class();
                  objc_msgSend(v158, "VPN");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "protocol");
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v169 = v140;
                  v170 = 2112;
                  v171 = v142;
                  _os_log_debug_impl(&dword_19BD16000, v138, OS_LOG_TYPE_DEBUG, "%@ configureIKE, done with %@", buf, 0x16u);

                }
                v115 = 1;
                goto LABEL_198;
              }
            }
            else
            {
              v130 = v162;
              if (!v162)
              {
                if (v127)
                {
                  ne_log_obj();
                  v131 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                  {
                    v132 = (id)objc_opt_class();
                    *(_DWORD *)buf = 138412546;
                    v169 = v132;
                    v170 = 2112;
                    v171 = v127;
                    _os_log_error_impl(&dword_19BD16000, v131, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported authentication type %@.", buf, 0x16u);

                  }
                  goto LABEL_190;
                }
                goto LABEL_191;
              }
            }
            objc_msgSend(v130, "setAuthenticationMethod:", 0);
LABEL_186:
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IncludeAllNetworks"));
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            if (isa_nsnumber(v137))
              objc_msgSend(v162, "setIncludeAllNetworks:", objc_msgSend(v137, "BOOLValue"));
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EnableFallback"));
            v131 = objc_claimAutoreleasedReturnValue();

            if (isa_nsnumber(v131))
              objc_msgSend(v162, "setEnableFallback:", -[NSObject BOOLValue](v131, "BOOLValue"));
LABEL_190:

            goto LABEL_191;
          }
          v120 = CFSTR("ExtendedAuthEnabled");
          v119 = v9;
        }
        objc_msgSend(v119, "objectForKeyedSubscript:", v120);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setUseExtendedAuthentication:](self, "setUseExtendedAuthentication:", objc_msgSend(v123, "BOOLValue"));

        goto LABEL_155;
      }
      v105 = CFSTR("_PayloadMachineCertificateRef");
      if (!v160)
        v105 = CFSTR("_PayloadCertificateRef");
      v103 = v105;
      v107 = objc_getProperty(self, v106, 88, 1);
      objc_msgSend(v11, "addCertificatePending:certificateTag:accessGroup:", v104, v103, v107);

      v102 = v104;
    }

    v104 = v102;
    goto LABEL_148;
  }
  if (isa_nsdata(v92))
  {
    v93 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v92, 4);

    v92 = (void *)v93;
    goto LABEL_126;
  }
  if ((isa_nsstring(v92) & 1) != 0)
  {
LABEL_126:
    v95 = [NEKeychainItem alloc];
    if (v160)
    {
      v96 = (uint64_t)v160[10].isa;
      v97 = objc_getProperty(v160, v94, 88, 1);
      v98 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v95, "initWithPassword:domain:accessGroup:", v92, v96, v97);
      v99 = v160;
    }
    else
    {
      v100 = self[10].isa;
      v97 = objc_getProperty(self, v94, 88, 1);
      v98 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v95, "initWithPassword:domain:accessGroup:", v92, v100, v97);
      v99 = self;
    }
    -[NSObject setSharedSecretKeychainItem:](v99, "setSharedSecretKeychainItem:", v98);

    goto LABEL_130;
  }
  ne_log_obj();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
  {
    v145 = (void *)objc_opt_class();
    v146 = v145;
    v147 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v169 = v145;
    v170 = 2112;
    v171 = v147;
    v148 = v147;
    _os_log_error_impl(&dword_19BD16000, v108, OS_LOG_TYPE_ERROR, "%@ configureIKE: unsupported shared secret data type %@", buf, 0x16u);

  }
LABEL_196:

LABEL_197:
  v115 = 0;
LABEL_198:

  return v115;
}

- (BOOL)configureVpnOnDemandRules:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  void *v19;
  id v20;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "VPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "VPN");
  else
    objc_msgSend(a1, "appVPN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ne_log_large_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v21 = 138412290;
    *(_QWORD *)&v21[4] = objc_opt_class();
    v18 = *(id *)&v21[4];
    _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ configureVpnOnDemandRules: start", v21, 0xCu);

  }
  if (v5)
  {
    objc_msgSend(v5, "onDemandRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v9;
        v10 = v9;
        v11 = "%@ configureVpnOnDemandRules: VPN OnDemand rules already ingested. Skip current dictionary.";
LABEL_12:
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, v11, v21, 0xCu);

      }
    }
    else
    {
      +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOnDemandRules:", v13);

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnDemandEnabled"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (isa_nsnumber(v14))
        objc_msgSend(v5, "setOnDemandEnabled:", objc_msgSend(v14, "BOOLValue"));
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DisconnectOnDemandEnabled"), *(_OWORD *)v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (isa_nsnumber(v15))
        objc_msgSend(v5, "setDisconnectOnDemandEnabled:", objc_msgSend(v15, "BOOLValue"));
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnDemandUserOverrideDisabled"));
      v8 = objc_claimAutoreleasedReturnValue();

      if (isa_nsnumber(v8))
        objc_msgSend(v5, "setOnDemandUserOverrideDisabled:", -[NSObject BOOLValue](v8, "BOOLValue"));
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)v21 = 138412546;
        *(_QWORD *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2112;
        *(_QWORD *)&v21[14] = v5;
        v20 = v19;
        _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@ configureVpnOnDemandRules done: onDemand rules %@", v21, 0x16u);

      }
    }
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)v21 = 138412290;
      *(_QWORD *)&v21[4] = v12;
      v10 = v12;
      v11 = "%@ configureVpnOnDemandRules failed: VPN not initialized";
      goto LABEL_12;
    }
  }

  return v5 != 0;
}

- (BOOL)configureVpnOnDemand:(void *)a3 vpnType:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("L2TP")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PPP"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (!v7 || !-[NEConfiguration configureVpnOnDemandRules:](a1, v7))
    goto LABEL_8;

  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("L2TP")))
  {
    v7 = 0;
LABEL_10:
    v9 = -[NEConfiguration configureVpnOnDemandRules:](a1, v5);
    goto LABEL_11;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IPSec"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || -[NEConfiguration configureVpnOnDemandRules:](a1, v7))
    goto LABEL_10;
LABEL_8:
  v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)ingestIPSecDict:(void *)a3 vpnType:(void *)a4 vpn:
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  const __CFString *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2"));
  v12 = CFSTR("IPSec");
  if (v11)
    v12 = CFSTR("IKEv2");
  v13 = v12;
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v58 = (id)objc_opt_class();
    v59 = 2112;
    v60 = v8;
    v35 = v58;
    _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "%@ ingestIPSecDict for type %@", buf, 0x16u);

  }
  if (!v14)
  {
    v16 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("L2TP"));
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v16 & 1) == 0)
    {
      if (v17)
      {
        v43 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v58 = v43;
        v59 = 2112;
        v60 = v13;
        v44 = v43;
        _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ ingestIPSecDict: empty %@ dict", buf, 0x16u);

      }
      goto LABEL_31;
    }
    if (v17)
    {
      v41 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v58 = v41;
      v42 = v41;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@ ingestIPSecDict: empty IPSec dict for L2TP. Apply defaults.", buf, 0xCu);

    }
    v14 = MEMORY[0x1E0C9AA70];
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v14);
  if (!v18)
  {
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v58 = v29;
      v30 = v29;
      _os_log_impl(&dword_19BD16000, v28, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: can't alloc dictionary", buf, 0xCu);

    }
LABEL_31:
    v33 = 0;
    goto LABEL_46;
  }
  v19 = (void *)v18;
  v56 = v9;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_certificateData"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = v13;
    v23 = a1;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_certificatePassphrase"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      +[NEIdentityKeychainItem importPKCS12Data:passphrase:](NEIdentityKeychainItem, "importPKCS12Data:passphrase:", v21, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 && objc_msgSend(v25, "count"))
      {
        objc_msgSend(v26, "objectAtIndex:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v55 = v27;
          objc_msgSend(v19, "setObject:forKey:", v27, CFSTR("LocalCertificate"));
          if (!-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2"))
            || (objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod")),
                v54 = (void *)objc_claimAutoreleasedReturnValue(),
                v54,
                v27 = v55,
                !v54))
          {
            objc_msgSend(v19, "setObject:forKey:", CFSTR("Certificate"), CFSTR("AuthenticationMethod"));
            v27 = v55;
          }
        }

      }
    }

    a1 = v23;
    v13 = v22;
    goto LABEL_39;
  }
  -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v21 = (void *)v31;
    if (!-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2"))
      || (objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod")),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v32,
          !v32))
    {
      objc_msgSend(v19, "setObject:forKey:", CFSTR("Certificate"), CFSTR("AuthenticationMethod"));
    }
    goto LABEL_39;
  }
  -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

LABEL_35:
    if (!-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2"))
      || (objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod")),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v37,
          !v37))
    {
      objc_msgSend(v19, "setObject:forKey:", CFSTR("Certificate"), CFSTR("AuthenticationMethod"));
    }
    goto LABEL_38;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    goto LABEL_35;
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2"))
    && (-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensibleSSOProvider")),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v45,
        v45))
  {
    ne_log_obj();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v58 = v47;
      v48 = v47;
      _os_log_impl(&dword_19BD16000, v46, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: assuming authentication by certificate", buf, 0xCu);

    }
    v49 = CFSTR("Certificate");
  }
  else
  {
    ne_log_obj();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v58 = v51;
      v52 = v51;
      _os_log_impl(&dword_19BD16000, v50, OS_LOG_TYPE_INFO, "%@ ingestIPSecDict: assuming authentication by sharedsecret", buf, 0xCu);

    }
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2")))
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
        goto LABEL_58;
    }
    v49 = CFSTR("SharedSecret");
  }
  objc_msgSend(v19, "setObject:forKey:", v49, CFSTR("AuthenticationMethod"));
LABEL_58:
  objc_msgSend(v19, "removeObjectForKey:", CFSTR("ExportedSharedSecret"));
  objc_msgSend(v19, "removeObjectForKey:", CFSTR("IPSecSharedSecretObf"));
LABEL_38:
  v21 = 0;
LABEL_39:
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("IKEv2")) & 1) == 0)
  {
    if (objc_msgSend(v38, "isEqualToString:", CFSTR("Certificate")))
    {
      objc_msgSend(v19, "removeObjectForKey:", CFSTR("LocalIdentifier"));
      v39 = CFSTR("LocalIdentifierType");
    }
    else
    {
      v39 = CFSTR("LocalCertificate");
    }
    objc_msgSend(v19, "removeObjectForKey:", v39);
  }
  v33 = -[NEConfiguration configureIKE:vpnType:payloadBase:vpn:](a1, v19, v8, v7, v56);

  v9 = v56;
LABEL_46:

  return v33;
}

- (id)initWithVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NEVPN *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  NSObject *v35;
  id v37;
  void *v38;
  id v39;
  const char *v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  NEVPNProtocolL2TP *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  const char *v82;
  void *v83;
  BOOL v84;
  char v85;
  NSObject *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  id v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  __CFString *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  SEL v110;
  NEKeychainItem *v111;
  void *v112;
  int v113;
  void *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  __CFString *v125;
  __CFString *v126;
  void *v127;
  int v128;
  NSObject *v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  NSObject *log;
  NEKeychainItem *loga;
  char v136;
  id v137;
  _QWORD *self;
  id v139;
  void *v140;
  void *v141;
  NSObject *v142;
  NSObject *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  int v150;
  void *v151;
  id v152;
  void *v153;
  _QWORD v154[4];
  uint8_t buf[4];
  id v156;
  __int16 v157;
  const __CFString *v158;
  __int16 v159;
  void *v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v34 = 0;
    goto LABEL_44;
  }
  v9 = v7;
  objc_msgSend(v9, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v156 = (id)objc_opt_class();
    v37 = v156;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload", buf, 0xCu);

  }
  if (!v10)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v31 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v156 = v31;
    v32 = v31;
    v33 = "%@ initWithVPNPayload: empty payload atom";
LABEL_65:
    _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);

    goto LABEL_32;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNType"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    v154[0] = CFSTR("IPSec");
    v154[1] = CFSTR("L2TP");
    v154[2] = CFSTR("IKEv2");
    v154[3] = CFSTR("VPN");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v13) & 1) != 0)
    {
      v15 = objc_msgSend(a1, "initWithName:grade:", v8, a4);
      if (!v15)
      {
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v68 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v156 = v68;
          v157 = 2112;
          v158 = v8;
          v69 = v68;
          _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "%@ initWithVPNPayload failed for config '%@'", buf, 0x16u);

        }
        v19 = 0;
        a1 = 0;
        goto LABEL_38;
      }
      a1 = (id)v15;
      v16 = objc_alloc_init(NEVPN);
      objc_msgSend(a1, "setVPN:", v16);

      objc_msgSend(a1, "VPN");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(a1, "VPN");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnabled:", 1);

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Enabled"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (isa_nsnumber(v19))
        {
          v20 = objc_msgSend(v19, "BOOLValue");
          objc_msgSend(a1, "VPN");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setEnabled:", v20);

        }
        v153 = v14;
        if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("L2TP")))
        {
          if ((-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IPSec")) & 1) != 0
            || -[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IKEv2")))
          {
            ne_log_obj();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v72 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v156 = v72;
              v157 = 2112;
              v158 = (const __CFString *)v13;
              v73 = v72;
              _os_log_debug_impl(&dword_19BD16000, v41, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload: ingest %@", buf, 0x16u);

            }
          }
LABEL_52:
          if ((-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IPSec")) & 1) == 0
            && (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("L2TP")) & 1) == 0
            && !-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IKEv2")))
          {
            goto LABEL_178;
          }
          objc_msgSend(a1, "VPN");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[NEConfiguration ingestIPSecDict:vpnType:vpn:](a1, v9, v13, v42);

          if (v43)
          {
            if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IKEv2")))
              goto LABEL_178;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IKEv2"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "VPN");
            v147 = v19;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "protocol");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = ingestIKEv2Dict(v44, v45, v47);

            v14 = v153;
            v19 = v147;

            if (v150)
            {
LABEL_178:
              if ((-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("VPN")) & 1) != 0
                || -[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("TransparentProxy")))
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("VPN")))
                {
                  v151 = v48;
                  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("ProviderType"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (isa_nsstring(v50)
                    && objc_msgSend(v50, "isEqualToString:", CFSTR("app-proxy")))
                  {
                    objc_msgSend(a1, "VPN");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v51;
                    v53 = 2;
                  }
                  else
                  {
                    objc_msgSend(a1, "VPN");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v51;
                    v53 = 1;
                  }
                  objc_msgSend(v51, "setTunnelType:", v53);

                  v48 = v151;
                }
                else
                {
                  objc_msgSend(a1, "VPN");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "setTunnelType:", 2);
                }

                v60 = -[NEConfiguration configurePluginWithPayload:pluginType:payloadType:vpnType:](a1, v9, v48, CFSTR("com.apple.vpn.managed"), v13);
                if (!v60)
                  goto LABEL_80;
              }
              if (!-[NEConfiguration configureVpnOnDemand:vpnType:](a1, v10, v13))
              {
LABEL_80:
                v14 = v153;
              }
              else
              {
                v61 = v19;
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PayloadCertificateHash"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = isa_nsdata(v62);

                if (v63)
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PayloadCertificateHash"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "VPN");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "protocol");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setIdentityDataHash:", v64);

                }
                v14 = v153;
                v19 = v61;
                if (-[NEConfiguration ingestDNSOptions:](a1, v10)
                  && -[NEConfiguration ingestProxyOptions:](a1, v10))
                {
                  ne_log_obj();
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    v94 = (void *)objc_opt_class();
                    v152 = v94;
                    objc_msgSend(a1, "VPN");
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v148, "protocol");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v145, "serverAddress");
                    v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v156 = v94;
                    v14 = v153;
                    v157 = 2112;
                    v158 = v95;
                    _os_log_debug_impl(&dword_19BD16000, v67, OS_LOG_TYPE_DEBUG, "%@ initWithVPNPayload: done, serverAddress %@", buf, 0x16u);

                    v19 = v61;
                  }

                  a1 = a1;
                  v34 = a1;
LABEL_42:

                  goto LABEL_43;
                }
              }
            }
          }
LABEL_39:
          ne_log_obj();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v54 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v156 = v54;
            v55 = v19;
            v56 = v14;
            v57 = v54;
            _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "%@ initWithVPNPayload: failed", buf, 0xCu);

            v14 = v56;
            v19 = v55;
          }

          v34 = 0;
          goto LABEL_42;
        }
        v146 = v19;
        v22 = v10;
        v149 = v13;
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("PPP"));
        v23 = objc_claimAutoreleasedReturnValue();
        ne_log_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v70 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v156 = v70;
          v157 = 2112;
          v158 = (const __CFString *)v149;
          v71 = v70;
          _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "%@ ingestPPPData for %@", buf, 0x16u);

        }
        v144 = (void *)v23;
        if (!v23)
          goto LABEL_27;
        if (!-[NSObject isEqualToString:](v149, "isEqualToString:", CFSTR("L2TP")))
        {
LABEL_104:

          v14 = v153;
          v19 = v146;
          goto LABEL_38;
        }
        v143 = v22;
        -[NEConfiguration getConfigurationProtocol](a1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        ne_log_obj();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEBUG, "configureL2TPwithPPPOptions", buf, 2u);
        }

        objc_msgSend(a1, "appVPN");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          goto LABEL_26;
        if (v25)
        {
LABEL_20:
          v142 = v143;
          -[NEConfiguration getConfigurationProtocol](a1);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          ne_log_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19BD16000, v28, OS_LOG_TYPE_DEBUG, "configurePPPCommon start", buf, 2u);
          }

          objc_msgSend(a1, "appVPN");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29 || objc_msgSend(a1, "grade") == 2)
          {
            v30 = 0;
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          v140 = v25;
          objc_msgSend(a1, "VPN");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if (v83)
            v84 = v141 == 0;
          else
            v84 = 1;
          v85 = !v84;

          if ((v85 & 1) == 0)
          {
            ne_log_obj();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v92, OS_LOG_TYPE_ERROR, "configurePPPCommon failed: VPN not initialized", buf, 2u);
            }
            v93 = 0;
            goto LABEL_132;
          }
          v136 = v85;
          -[NSObject objectForKeyedSubscript:](v142, "objectForKeyedSubscript:", CFSTR("PPP"));
          v139 = (id)objc_claimAutoreleasedReturnValue();
          -[NEConfiguration getConfigurationProtocol](a1);
          self = (_QWORD *)objc_claimAutoreleasedReturnValue();
          ne_log_large_obj();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19BD16000, v86, OS_LOG_TYPE_DEBUG, "ingestPPPDict start", buf, 2u);
          }

          objc_msgSend(a1, "appVPN");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (v87 || objc_msgSend(a1, "grade") == 2)
          {
LABEL_98:

            v88 = v142;
            -[NSObject objectForKeyedSubscript:](v142, "objectForKeyedSubscript:", CFSTR("IPv4"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (isa_nsdictionary(v89))
            {
              v90 = -[NEIPv4Settings initFromLegacyDictionary:]([NEIPv4Settings alloc], "initFromLegacyDictionary:", v89);
              if (v90)
              {
                objc_msgSend(v141, "setIPv4Settings:", v90);
              }
              else
              {
                ne_log_large_obj();
                v103 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_19BD16000, v103, OS_LOG_TYPE_DEBUG, "configurePPPCommon: IPv4 settings are Off for payload dictionary", buf, 2u);
                }

              }
              v88 = v142;
            }
            -[NSObject objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("IPv6"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!isa_nsdictionary(v30))
            {
              v25 = v140;
              goto LABEL_25;
            }
            v93 = v30;
            v104 = -[NEIPv6Settings initFromLegacyDictionary:]([NEIPv6Settings alloc], "initFromLegacyDictionary:", v30);
            if (v104)
            {
              v92 = v104;
              objc_msgSend(v141, "setIPv6Settings:", v104);
            }
            else
            {
              ne_log_obj();
              v105 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_19BD16000, v105, OS_LOG_TYPE_ERROR, "configurePPPCommon: invalid IPv6 dictionary", buf, 2u);
              }

              v92 = 0;
            }
            v85 = v136;
LABEL_132:

            if ((v85 & 1) == 0)
              goto LABEL_104;
LABEL_27:

            v14 = v153;
            v19 = v146;
            if ((-[NEConfiguration configurePPPWithVPNOptions:payloadBase:](a1, v22, v9) & 1) == 0)
              goto LABEL_39;
            goto LABEL_52;
          }
          objc_msgSend(a1, "VPN");
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v96 || !self)
          {
            ne_log_obj();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, log, OS_LOG_TYPE_ERROR, "ingestPPPDict failed: VPN not initialized", buf, 2u);
            }
            goto LABEL_138;
          }
          if (!v139)
          {
LABEL_139:

            v91 = v140;
            v81 = v142;
            goto LABEL_103;
          }
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("CommRemoteAddress"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v97;
          if (v97 && isa_nsstring(v97))
            objc_msgSend(self, "setServerAddress:", v98);
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("AuthName"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          if (v99 && isa_nsstring(v99))
            objc_msgSend(self, "setUsername:", v99);
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
          v100 = objc_claimAutoreleasedReturnValue();

          log = v100;
          if (v100)
          {
            if (isa_nsdata(v100))
            {
              v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v100, 4);

              v102 = v101;
LABEL_149:
              v108 = v102;
              loga = [NEKeychainItem alloc];
              v109 = self[10];
              v133 = objc_getProperty(self, v110, 88, 1);
              v111 = -[NEKeychainItem initWithPassword:domain:accessGroup:](loga, "initWithPassword:domain:accessGroup:", v108, v109, v133);
              objc_msgSend(self, "setPasswordKeychainItem:", v111);

              objc_msgSend(self, "setAuthenticationMethod:", 1);
              log = v108;

LABEL_150:
              objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("VerboseLogging"));
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = isa_nsnumber(v112);

              if (v113)
              {
                objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("VerboseLogging"));
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(self, "setVerboseLoggingEnabled:", objc_msgSend(v114, "BOOLValue"));

              }
              -[NEConfiguration ingestDisconnectOptions:](a1, v139);
              ne_log_obj();
              v115 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
              {
                v117 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v156 = v117;
                v118 = v117;
                _os_log_debug_impl(&dword_19BD16000, v115, OS_LOG_TYPE_DEBUG, "%@ ingestPPPDict: done", buf, 0xCu);

              }
              goto LABEL_98;
            }
            if ((isa_nsstring(v100) & 1) != 0)
            {
              v102 = v100;
              goto LABEL_149;
            }
            ne_log_obj();
            v116 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              v123 = (void *)objc_opt_class();
              v124 = v123;
              v125 = (__CFString *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v156 = v123;
              v157 = 2112;
              v158 = v125;
              v126 = v125;
              _os_log_error_impl(&dword_19BD16000, v116, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: unsupported password data type %@", buf, 0x16u);

            }
            goto LABEL_138;
          }
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("AuthProtocol"));
          log = objc_claimAutoreleasedReturnValue();
          if (isa_nsarray(log)
            && -[NSObject containsObject:](log, "containsObject:", CFSTR("EAP")))
          {
            objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("AuthEAPPlugins"));
            v106 = objc_claimAutoreleasedReturnValue();
            if (!isa_nsarray(v106) || !-[NSObject count](v106, "count"))
              goto LABEL_170;
            -[NSObject objectAtIndexedSubscript:](v106, "objectAtIndexedSubscript:", 0);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            if (!isa_nsstring(v132))
            {
LABEL_169:

LABEL_170:
LABEL_171:
              objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("TokenCard"));
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v128 = isa_nsnumber(v127);

              if (v128)
                objc_msgSend(self, "setAuthenticationMethod:", 5);
              goto LABEL_150;
            }
            if ((objc_msgSend(v132, "isEqualToString:", CFSTR("EAP-RSA")) & 1) != 0)
            {
              v107 = 2;
LABEL_168:
              objc_msgSend(self, "setAuthenticationMethod:", v107);
              goto LABEL_169;
            }
            if ((objc_msgSend(v132, "isEqualToString:", CFSTR("EAP-TLS")) & 1) != 0)
            {
              v107 = 3;
              goto LABEL_168;
            }
            if ((objc_msgSend(v132, "isEqualToString:", CFSTR("EAP-KRB")) & 1) != 0)
            {
              v107 = 4;
              goto LABEL_168;
            }
            ne_log_obj();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              v130 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v156 = v130;
              v157 = 2112;
              v158 = CFSTR("AuthEAPPlugins");
              v159 = 2112;
              v160 = v132;
              v131 = v130;
              _os_log_error_impl(&dword_19BD16000, v129, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: unsupported %@ type %@", buf, 0x20u);

            }
            v122 = v132;
          }
          else
          {
            if (!log)
              goto LABEL_171;
            ne_log_obj();
            v106 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
              goto LABEL_157;
            v119 = (void *)objc_opt_class();
            v137 = v119;
            v120 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v156 = v119;
            v157 = 2112;
            v158 = CFSTR("AuthProtocol");
            v159 = 2112;
            v160 = v120;
            v121 = v120;
            _os_log_error_impl(&dword_19BD16000, v106, OS_LOG_TYPE_ERROR, "%@ ingestPPPDict: invalid %@ type %@", buf, 0x20u);

            v122 = v137;
          }

LABEL_157:
LABEL_138:

          goto LABEL_139;
        }
        objc_msgSend(a1, "VPN");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (v74)
        {
          objc_msgSend(a1, "VPN");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "protocol");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v76)
          {
            v77 = objc_alloc_init(NEVPNProtocolL2TP);
            objc_msgSend(a1, "VPN");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setProtocol:", v77);

          }
          objc_msgSend(a1, "VPN");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "protocol");
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80)
            goto LABEL_20;
          ne_log_obj();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v82 = "configureL2TPwithPPPOptions failed to allocate for L2TP";
LABEL_135:
            _os_log_error_impl(&dword_19BD16000, v81, OS_LOG_TYPE_ERROR, v82, buf, 2u);
          }
        }
        else
        {
          ne_log_obj();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v82 = "configureL2TPwithPPPOptions failed: app-layer VPN not supported";
            goto LABEL_135;
          }
        }
        v91 = 0;
LABEL_103:

        goto LABEL_104;
      }
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v38 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v156 = v38;
        v157 = 2112;
        v158 = v8;
        v39 = v38;
        v40 = "%@ initWithVPNPayload failed, can't create VPN for config '%@'";
LABEL_67:
        _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);

      }
    }
    else
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v59 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v156 = v59;
        v157 = 2112;
        v158 = (const __CFString *)v13;
        v39 = v59;
        v40 = "%@ initWithVPNPayload : VPN type '%@' not supported";
        goto LABEL_67;
      }
    }
    v19 = 0;
LABEL_38:

    goto LABEL_39;
  }
  ne_log_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v58 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v156 = v58;
    v32 = v58;
    v33 = "%@ initWithVPNPayload: couldn't extract VPN type from payload";
    goto LABEL_65;
  }
LABEL_32:
  v34 = 0;
LABEL_43:

LABEL_44:
  return v34;
}

- (id)initWithAppLayerVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NEVPNApp *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  const char *v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  const char *v51;
  NSObject *v52;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  NSObject *v95;
  void *v96;
  id v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  NSObject *v121;
  NSObject *v122;
  void *v123;
  uint64_t v124;
  id v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t buf[4];
  id v140;
  __int16 v141;
  _BYTE v142[10];
  _BYTE v143[128];
  _BYTE v144[128];
  _QWORD v145[6];

  v145[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_40;
  }
  v9 = v7;
  objc_msgSend(v9, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v140 = (id)objc_opt_class();
    v47 = v10;
    v48 = v140;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload", buf, 0xCu);

    v10 = v47;
  }

  if (!v10)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v41 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v140 = v41;
    v42 = v41;
    v43 = "%@ initWithAppLayerVPNPayload: empty payload atom";
LABEL_43:
    _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

    goto LABEL_24;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNType"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    v145[0] = CFSTR("IPSec");
    v145[1] = CFSTR("IKEv2");
    v145[2] = CFSTR("VPN");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v13) & 1) != 0)
    {
      v15 = objc_msgSend(a1, "initWithName:grade:", v8, a4);
      if (!v15)
      {
        v45 = v14;
        ne_log_obj();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v93 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v140 = v93;
          v141 = 2112;
          *(_QWORD *)v142 = v8;
          v94 = v93;
          _os_log_error_impl(&dword_19BD16000, v46, OS_LOG_TYPE_ERROR, "%@ initWithAppLayerVPNPayload: initWithName failed for '%@'", buf, 0x16u);

        }
        v20 = 0;
        a1 = 0;
        goto LABEL_34;
      }
      a1 = (id)v15;
      v16 = objc_alloc_init(NEVPNApp);
      objc_msgSend(a1, "setAppVPN:", v16);

      objc_msgSend(a1, "appVPN");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(a1, "appVPN");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnabled:", 1);

        objc_msgSend(a1, "appVPN");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNoRestriction:", 1);

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Enabled"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (isa_nsnumber(v20))
        {
          v21 = objc_msgSend(v20, "BOOLValue");
          objc_msgSend(a1, "appVPN");
          v22 = v13;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setEnabled:", v21);

          v13 = v22;
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v127 = v9;
          if ((-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IPSec")) & 1) != 0
            || -[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("IKEv2")))
          {
            objc_msgSend(a1, "appVPN");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setTunnelType:", 1);

            objc_msgSend(a1, "appVPN");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v13;
            v28 = -[NEConfiguration ingestIPSecDict:vpnType:vpn:](a1, v9, v13, v26);

            if (!v28)
            {
              v13 = v27;
              goto LABEL_35;
            }
            v13 = v27;
            if (-[NSObject isEqualToString:](v27, "isEqualToString:", CFSTR("IKEv2")))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IKEv2"));
              v121 = v27;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "appVPN");
              v120 = v14;
              v31 = v10;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "protocol");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = ingestIKEv2Dict(v29, v30, v33);

              v9 = v127;
              v10 = v31;
              v14 = v120;

              v13 = v121;
              if (!v34)
                goto LABEL_35;
            }
          }
          v123 = v10;
          if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("VPN")))
            goto LABEL_48;
          v35 = v13;
          objc_msgSend(v10, "objectForKeyedSubscript:", v13);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ProviderType"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (isa_nsstring(v37)
            && objc_msgSend(v37, "isEqualToString:", CFSTR("packet-tunnel")))
          {
            objc_msgSend(a1, "appVPN");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            v40 = 1;
          }
          else
          {
            objc_msgSend(a1, "appVPN");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v38;
            v40 = 2;
          }
          objc_msgSend(v38, "setTunnelType:", v40);

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[NEConfiguration configurePluginWithPayload:pluginType:payloadType:vpnType:](a1, v9, v59, CFSTR("com.apple.vpn.managed.applayer"), v35);

          v13 = v35;
          if (!v60)
          {
            v10 = v123;
          }
          else
          {
LABEL_48:
            v10 = v123;
            if (-[NEConfiguration configureVpnOnDemand:vpnType:](a1, v123, v13)
              && -[NEConfiguration ingestProxyOptions:](a1, v123))
            {
              objc_msgSend(v123, "objectForKeyedSubscript:", v13);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("OnDemandMatchAppEnabled"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              v63 = v62;
              if (isa_nsnumber(v62))
              {
                v64 = objc_msgSend(v62, "BOOLValue");
                objc_msgSend(a1, "appVPN");
                v65 = v13;
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "setOnDemandEnabled:", v64);

                v13 = v65;
              }
              v118 = v63;
              v119 = v8;
              v122 = v13;
              if (ne_session_disable_restrictions())
              {
                objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("AppRules"));
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                if (isa_nsdictionary(v67))
                {
                  v117 = v7;
                  v137 = 0u;
                  v138 = 0u;
                  v135 = 0u;
                  v136 = 0u;
                  v68 = v67;
                  v129 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
                  if (v129)
                  {
                    v69 = *(_QWORD *)v136;
                    v125 = v68;
                    v126 = v67;
                    v124 = *(_QWORD *)v136;
                    do
                    {
                      for (i = 0; i != v129; ++i)
                      {
                        if (*(_QWORD *)v136 != v69)
                          objc_enumerationMutation(v68);
                        objc_msgSend(v68, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i), v117);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        if (isa_nsdictionary(v71))
                        {
                          v128 = i;
                          v72 = v9;
                          objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ExecutableMatch"));
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          if (isa_nsarray(v73))
                          {
                            v133 = 0u;
                            v134 = 0u;
                            v131 = 0u;
                            v132 = 0u;
                            v74 = v73;
                            v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
                            v76 = v73;
                            if (v75)
                            {
                              v77 = v75;
                              v78 = *(_QWORD *)v132;
                              do
                              {
                                for (j = 0; j != v77; ++j)
                                {
                                  if (*(_QWORD *)v132 != v78)
                                    objc_enumerationMutation(v74);
                                  v80 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                                  if (isa_nsdictionary(v80))
                                  {
                                    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("SigningIdentifier"));
                                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (isa_nsstring(v81))
                                    {
                                      objc_msgSend(a1, "appVPN");
                                      v82 = v76;
                                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v83, "removeAppRuleByID:", v81);

                                      v76 = v82;
                                      if ((objc_msgSend(a1, "setPerAppRuleSettings:withAppIdentifier:", v71, v81) & 1) == 0)
                                      {
                                        ne_log_obj();
                                        v84 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_DWORD *)buf = 138412290;
                                          v140 = v81;
                                          _os_log_error_impl(&dword_19BD16000, v84, OS_LOG_TYPE_ERROR, "initWithAppLayerVPNPayload: Could not set App-layer VPN rule for identifier %@", buf, 0xCu);
                                        }

                                        v76 = v82;
                                      }
                                    }

                                  }
                                }
                                v77 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
                              }
                              while (v77);
                            }

                            v67 = v126;
                            v72 = v127;
                            v73 = v76;
                            v69 = v124;
                            v68 = v125;
                          }

                          v9 = v72;
                          i = v128;
                        }

                      }
                      v129 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
                    }
                    while (v129);
                  }

                  v7 = v117;
                }

              }
              objc_msgSend(a1, "appVPN", v117);
              v85 = objc_claimAutoreleasedReturnValue();
              -[NSObject protocol](v85, "protocol");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "sliceUUID");
              v87 = objc_claimAutoreleasedReturnValue();
              if (v87)
              {
                v88 = (void *)v87;
                v89 = v14;
                v90 = v7;
                objc_msgSend(a1, "appVPN");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "protocol");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v92, "disconnectOnIdle") & 1) != 0)
                {

                  v9 = v127;
                  v10 = v123;
                  v14 = v89;
                }
                else
                {
                  objc_msgSend(a1, "appVPN");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = objc_msgSend(v98, "isOnDemandEnabled");

                  v9 = v127;
                  v10 = v123;
                  v14 = v89;
                  if (!v99)
                    goto LABEL_87;
                  objc_msgSend(a1, "appVPN");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "protocol");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "setDisconnectOnIdle:", 1);

                  objc_msgSend(a1, "appVPN");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "protocol");
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "setDisconnectOnIdleTimeout:", 60);

                  ne_log_obj();
                  v85 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                  {
                    v104 = (void *)objc_opt_class();
                    v130 = v104;
                    objc_msgSend(a1, "appVPN");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v105, "protocol");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v107 = objc_msgSend(v106, "disconnectOnIdle");
                    objc_msgSend(a1, "appVPN");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "protocol");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = objc_msgSend(v109, "disconnectOnIdleTimeout");
                    *(_DWORD *)buf = 138412802;
                    v140 = v104;
                    v141 = 1024;
                    *(_DWORD *)v142 = v107;
                    v14 = v89;
                    *(_WORD *)&v142[4] = 1024;
                    *(_DWORD *)&v142[6] = v110;
                    _os_log_impl(&dword_19BD16000, v85, OS_LOG_TYPE_INFO, "%@ VPN Slice: onDemand on slice - disconnectOnIdle %d disconnectOnIdleTimeout %d", buf, 0x18u);

                    v9 = v127;
                    v10 = v123;

                  }
                }
              }
              else
              {
                v90 = v7;

                v10 = v123;
              }

LABEL_87:
              ne_log_obj();
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                v111 = (void *)objc_opt_class();
                v112 = v111;
                objc_msgSend(a1, "appVPN");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "protocol");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "serverAddress");
                v115 = v14;
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v140 = v111;
                v10 = v123;
                v141 = 2112;
                *(_QWORD *)v142 = v116;
                _os_log_debug_impl(&dword_19BD16000, v95, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload: done, serverAddress %@", buf, 0x16u);

                v14 = v115;
                v9 = v127;

              }
              a1 = a1;
              v44 = a1;
              v7 = v90;
              v20 = v118;
              v8 = v119;
              v13 = v122;
LABEL_38:

              goto LABEL_39;
            }
          }
LABEL_35:
          ne_log_obj();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            v54 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v140 = v54;
            v55 = v13;
            v56 = v54;
            _os_log_debug_impl(&dword_19BD16000, v52, OS_LOG_TYPE_DEBUG, "%@ initWithAppLayerVPNPayload: failed", buf, 0xCu);

            v13 = v55;
          }

          v44 = 0;
          goto LABEL_38;
        }
        v45 = v14;
        ne_log_obj();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v96 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v140 = v96;
          v141 = 2112;
          *(_QWORD *)v142 = v13;
          v97 = v96;
          _os_log_error_impl(&dword_19BD16000, v46, OS_LOG_TYPE_ERROR, "%@ initWithAppLayerVPNPayload failed, missing %@ configuration", buf, 0x16u);

        }
LABEL_34:

        v14 = v45;
        goto LABEL_35;
      }
      v45 = v14;
      ne_log_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v49 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v140 = v49;
        v141 = 2112;
        *(_QWORD *)v142 = v8;
        v50 = v49;
        v51 = "%@ initWithAppLayerVPNPayload failed, can't create VPN for config '%@'";
LABEL_45:
        _os_log_error_impl(&dword_19BD16000, v46, OS_LOG_TYPE_ERROR, v51, buf, 0x16u);

      }
    }
    else
    {
      v45 = v14;
      ne_log_obj();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v58 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v140 = v58;
        v141 = 2112;
        *(_QWORD *)v142 = v13;
        v50 = v58;
        v51 = "%@ initWithVPNPayload : VPN type '%@' not supported";
        goto LABEL_45;
      }
    }
    v20 = 0;
    goto LABEL_34;
  }
  ne_log_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v57 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v140 = v57;
    v42 = v57;
    v43 = "%@ initWithAppLayerVPNPayload: VPN type missing";
    goto LABEL_43;
  }
LABEL_24:
  v44 = 0;
LABEL_39:

LABEL_40:
  return v44;
}

- (__CFString)initWithAlwaysOnVPNPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NEAOVPN *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NEAOVPNException *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _UNKNOWN **v39;
  uint64_t i;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  _UNKNOWN **v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  NEAOVPNException *v61;
  NEAOVPNException *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  NEVPNProtocolIKEv2 *v69;
  uint64_t v70;
  uint64_t v71;
  NEVPNProtocolIKEv2 *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char v80;
  uint64_t v81;
  uint64_t k;
  uint64_t v83;
  int v84;
  int v85;
  void *v86;
  __CFString *v87;
  id v88;
  __CFString *v89;
  NEVPNProtocolIKEv2 *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  int v96;
  void *v97;
  __CFString *v98;
  __CFString *v99;
  int v100;
  id v101;
  uint64_t v102;
  NSObject *v103;
  NEKeychainItem *v104;
  int64_t keychainDomain;
  SEL v106;
  id v107;
  NEKeychainItem *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  __CFString *v114;
  uint64_t v115;
  NSObject *v116;
  NSObject *v117;
  void *v118;
  id v119;
  id v120;
  __CFString *v121;
  __CFString *v122;
  __CFString *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NEVPNProtocolIKEv2 *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  id v136;
  NSObject *v137;
  const char *v138;
  uint32_t v139;
  NEKeychainItem *v140;
  int64_t v141;
  SEL v142;
  id v143;
  NEKeychainItem *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  uint64_t v149;
  BOOL v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  __CFString *v159;
  __CFString *v160;
  void *v161;
  id v162;
  uint64_t v163;
  NSObject *v164;
  __CFString *v165;
  NSObject *v166;
  void *v167;
  id v168;
  const char *v169;
  NSObject *v170;
  uint32_t v171;
  __CFString *v172;
  id v173;
  NSObject *v174;
  NSObject *v175;
  void *v176;
  id v177;
  void *v178;
  NSObject *v179;
  char v180;
  NSObject *v181;
  NEVPNProtocolIKEv2 *v182;
  void *v183;
  id v184;
  NSObject *v185;
  NSObject *v186;
  void *v187;
  id v188;
  const char *v189;
  void *v190;
  NSObject *v191;
  uint32_t v192;
  void *v194;
  id v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  void *v206;
  id v207;
  id v208;
  __CFString *v209;
  uint64_t v210;
  uint64_t v211;
  char v212;
  id v213;
  id obj;
  void *v215;
  void *v216;
  void *v217;
  int v218;
  void *v219;
  NEVPNProtocolIKEv2 *v220;
  NEVPNProtocolIKEv2 *v221;
  void *v222;
  int v223;
  id v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  const __CFString *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  NSObject *v234;
  id v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  uint8_t v260[128];
  uint8_t buf[4];
  id v262;
  __int16 v263;
  const __CFString *v264;
  __int16 v265;
  const __CFString *v266;
  __int16 v267;
  uint64_t v268;
  uint64_t v269;

  v269 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v165 = 0;
    goto LABEL_228;
  }
  v9 = v7;
  objc_msgSend(v9, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v262 = (id)objc_opt_class();
    v172 = a1;
    v173 = v262;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithAlwaysOnVPNPayload", buf, 0xCu);

    a1 = v172;
  }

  if (!v10)
  {
    ne_log_obj();
    v164 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      v176 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v262 = v176;
      v177 = v176;
      _os_log_error_impl(&dword_19BD16000, v164, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: empty payload atom", buf, 0xCu);

    }
    v165 = 0;
    goto LABEL_227;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AlwaysOn"));
  v12 = objc_claimAutoreleasedReturnValue();
  if ((isa_nsdictionary(v12) & 1) == 0)
  {
    ne_log_obj();
    v166 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      v178 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v262 = v178;
      v263 = 2112;
      v264 = CFSTR("AlwaysOn");
      v168 = v178;
      v169 = "%@ initWithAlwaysOnVPNPayload: missing %@ dictionary";
      v170 = v166;
      v171 = 22;
      goto LABEL_202;
    }
LABEL_188:

    goto LABEL_189;
  }
  v13 = -[__CFString initWithName:grade:](a1, "initWithName:grade:", v8, a4);
  if (!v13)
  {
    ne_log_obj();
    v164 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      v183 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v262 = v183;
      v184 = v183;
      _os_log_error_impl(&dword_19BD16000, v164, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload failed", buf, 0xCu);

    }
    v165 = 0;
    a1 = (__CFString *)v12;
    goto LABEL_227;
  }
  a1 = (__CFString *)v13;
  v14 = objc_alloc_init(NEAOVPN);
  -[__CFString setAlwaysOnVPN:](a1, "setAlwaysOnVPN:", v14);

  -[__CFString alwaysOnVPN](a1, "alwaysOnVPN");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    ne_log_obj();
    v166 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
    {
      v167 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v262 = v167;
      v168 = v167;
      v169 = "%@ initWithAlwaysOnVPNPayload failed, can't create VPN";
      v170 = v166;
      v171 = 12;
LABEL_202:
      _os_log_error_impl(&dword_19BD16000, v170, OS_LOG_TYPE_ERROR, v169, buf, v171);

      goto LABEL_188;
    }
    goto LABEL_188;
  }
  -[__CFString alwaysOnVPN](a1, "alwaysOnVPN");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", 1);
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("UIToggleEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsnumber(v17))
    objc_msgSend(v16, "setToggleEnabled:", objc_msgSend(v17, "BOOLValue"));
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("AllowCaptiveWebSheet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsnumber(v18))
    objc_msgSend(v16, "setAllowCaptiveWebSheet:", objc_msgSend(v18, "BOOLValue"));
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("AllowAllCaptiveNetworkPlugins"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v227 = v19;
  if (isa_nsnumber(v19))
    objc_msgSend(v16, "setAllowAllCaptiveNetworkPlugins:", objc_msgSend(v19, "BOOLValue"));
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("ServiceExceptions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = v8;
  v225 = v7;
  v228 = v9;
  v229 = v10;
  v230 = a1;
  v234 = v12;
  if (!isa_nsarray(v20) || !objc_msgSend(v20, "count"))
  {
LABEL_36:
    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("ApplicationExceptions"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v32;
    if (isa_nsarray(v32) && objc_msgSend(v32, "count"))
    {
      v216 = v16;
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
      v248 = 0u;
      v249 = 0u;
      v250 = 0u;
      v251 = 0u;
      v232 = v33;
      v35 = v33;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v248, v259, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v249;
        v39 = &off_1E3CBB000;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v249 != v38)
              objc_enumerationMutation(v35);
            v41 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * i);
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (isa_nsstring(v42))
            {
              v43 = objc_alloc_init((Class)v39[208]);
              v44 = v43;
              if (v43)
              {
                objc_msgSend(v43, "setBundleIdentifier:", v42);
                objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("LimitToProtocols"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (isa_nsarray(v45) && objc_msgSend(v45, "count"))
                {
                  v46 = v35;
                  v47 = v39;
                  v48 = v34;
                  v49 = (void *)objc_msgSend(v45, "copy");
                  objc_msgSend(v44, "setLimitToProtocols:", v49);

                  v34 = v48;
                  v39 = v47;
                  v35 = v46;
                }
                objc_msgSend(v44, "setAction:", 1);
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v44, v42);

              }
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v248, v259, 16);
        }
        while (v37);
      }

      v16 = v216;
      if (objc_msgSend(v34, "count"))
        objc_msgSend(v216, "setApplicationExceptions:", v34);

      v8 = v224;
      v7 = v225;
      v9 = v228;
      v10 = v229;
      a1 = (__CFString *)v230;
      v33 = v232;
      v12 = v234;
    }
    -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("AllowedCaptiveNetworkPlugins"));
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v33;
    v52 = (void *)v50;

    v226 = v52;
    if (isa_nsarray(v52) && objc_msgSend(v52, "count"))
    {
      v53 = v16;
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
      v244 = 0u;
      v245 = 0u;
      v246 = 0u;
      v247 = 0u;
      v55 = v52;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v244, v258, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v245;
        do
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v245 != v58)
              objc_enumerationMutation(v55);
            objc_msgSend(*(id *)(*((_QWORD *)&v244 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (isa_nsstring(v60))
            {
              v61 = objc_alloc_init(NEAOVPNException);
              v62 = v61;
              if (v61)
              {
                -[NEAOVPNException setBundleIdentifier:](v61, "setBundleIdentifier:", v60);
                -[NEAOVPNException setAction:](v62, "setAction:", 1);
                objc_msgSend(v54, "setObject:forKeyedSubscript:", v62, v60);
              }

            }
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v244, v258, 16);
        }
        while (v57);
      }

      v16 = v53;
      if (objc_msgSend(v54, "count"))
        objc_msgSend(v53, "setAllowedCaptiveNetworkPlugins:", v54);

      v8 = v224;
      v7 = v225;
      v9 = v228;
      v10 = v229;
      a1 = (__CFString *)v230;
      v12 = v234;
    }
    v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v63)
    {
      v222 = v63;
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("TunnelConfigurations"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isa_nsarray(v64) & 1) == 0)
      {
        ne_log_obj();
        v175 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
        {
          v196 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v262 = v196;
          v263 = 2112;
          v264 = CFSTR("TunnelConfigurations");
          v197 = v196;
          _os_log_error_impl(&dword_19BD16000, v175, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: missing %@ array", buf, 0x16u);

        }
        v165 = 0;
        v164 = v12;
        goto LABEL_206;
      }
      v217 = v16;
      v242 = 0u;
      v243 = 0u;
      v240 = 0u;
      v241 = 0u;
      obj = v64;
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v257, 16);
      if (!v65)
      {
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        v69 = 0;
        a1 = (__CFString *)v230;
LABEL_208:

        v180 = v67;
        v8 = v224;
        v7 = v225;
        v9 = v228;
        v10 = v229;
        if ((v180 & 1) != 0 || (v68 & 1) != 0)
        {
          v182 = v69;
          v73 = v234;
LABEL_215:
          objc_msgSend(v217, "setInterfaceProtocolMapping:", v222);
          ne_log_obj();
          v185 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
          {
            v200 = (void *)objc_opt_class();
            v235 = v200;
            objc_msgSend(v217, "interfaceProtocolMapping");
            v201 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v262 = v200;
            v263 = 2112;
            v264 = (const __CFString *)v201;
            v202 = (void *)v201;
            v265 = 2112;
            v266 = v230;
            _os_log_debug_impl(&dword_19BD16000, v185, OS_LOG_TYPE_DEBUG, "%@ initWithAlwaysOnVPNPayload: aovpn tunnel configs %@, self %@", buf, 0x20u);

            a1 = (__CFString *)v230;
          }

          a1 = a1;
          v164 = v73;
          v165 = a1;
        }
        else
        {
          ne_log_obj();
          v181 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          {
            v203 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v262 = v203;
            v263 = 2112;
            v264 = CFSTR("Cellular");
            v265 = 2112;
            v266 = CFSTR("WiFi");
            v204 = v203;
            _os_log_error_impl(&dword_19BD16000, v181, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: must have one of %@ or %@ configs", buf, 0x20u);

          }
          v165 = 0;
          v164 = v234;
        }
        goto LABEL_227;
      }
      v66 = v65;
      v67 = 0;
      v68 = 0;
      v69 = 0;
      v70 = *(_QWORD *)v241;
      a1 = (__CFString *)v230;
      v210 = *(_QWORD *)v241;
LABEL_75:
      v71 = 0;
      v72 = v69;
      v211 = v66;
      while (1)
      {
        if (*(_QWORD *)v241 != v70)
          objc_enumerationMutation(obj);
        v73 = v234;
        if ((v68 & v67 & 1) != 0)
        {
          v182 = v72;

          v8 = v224;
          v7 = v225;
          v9 = v228;
          v10 = v229;
          goto LABEL_215;
        }
        v233 = v71;
        v74 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * v71);
        if (isa_nsdictionary(v74))
          break;
        v69 = v72;
LABEL_158:
        v71 = v233 + 1;
        if (v233 + 1 == v66)
        {
          v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v257, 16);
          v66 = v163;
          if (!v163)
            goto LABEL_208;
          goto LABEL_75;
        }
      }
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Interfaces"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = v75;
      v220 = v72;
      v218 = v68;
      v223 = v67;
      if (isa_nsarray(v75))
      {
        v238 = 0u;
        v239 = 0u;
        v236 = 0u;
        v237 = 0u;
        v76 = v75;
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v236, v256, 16);
        if (v77)
        {
          v78 = v77;
          v79 = 0;
          v80 = 0;
          v81 = *(_QWORD *)v237;
          do
          {
            for (k = 0; k != v78; ++k)
            {
              if (*(_QWORD *)v237 != v81)
                objc_enumerationMutation(v76);
              v83 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * k);
              if ((objc_msgSend(CFSTR("Cellular"), "isEqualToString:", v83) & 1) != 0)
              {
                v80 = 1;
              }
              else if (objc_msgSend(CFSTR("WiFi"), "isEqualToString:", v83))
              {
                v79 = 1;
              }
            }
            v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v236, v256, 16);
          }
          while (v78);
        }
        else
        {
          v79 = 0;
          v80 = 0;
        }

        v84 = v79 & 1;
        v85 = v80 & 1;
        a1 = (__CFString *)v230;
        v73 = v234;
        v68 = v218;
        v67 = v223;
      }
      else
      {
        v84 = 1;
        v85 = 1;
      }
      if ((v85 & v67) == 1)
      {
        ne_log_obj();
        v186 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
        {
          v187 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v262 = v187;
          v263 = 2112;
          v264 = CFSTR("Cellular");
          v188 = v187;
          v189 = "%@ initWithAlwaysOnVPNPayload: multiple %@ configurations detected";
          goto LABEL_222;
        }
LABEL_224:
        v8 = v224;
        v7 = v225;
        v9 = v228;
        v10 = v229;

LABEL_226:
        v165 = 0;
        v164 = v73;
        goto LABEL_227;
      }
      if ((v84 & v68) == 1)
      {
        ne_log_obj();
        v186 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
          goto LABEL_224;
        v190 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v262 = v190;
        v263 = 2112;
        v264 = CFSTR("WiFi");
        v188 = v190;
        v189 = "%@ initWithAlwaysOnVPNPayload: multiple %@ configurations detected";
LABEL_222:
        v191 = v186;
        v192 = 22;
LABEL_230:
        _os_log_error_impl(&dword_19BD16000, v191, OS_LOG_TYPE_ERROR, v189, buf, v192);

        goto LABEL_224;
      }
      if (((v85 | v84) & 1) == 0)
      {
        ne_log_obj();
        v186 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
          goto LABEL_224;
        v205 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v262 = v205;
        v188 = v205;
        v189 = "%@ initWithAlwaysOnVPNPayload: invalid tunnel configuration interfaces";
        v191 = v186;
        v192 = 12;
        goto LABEL_230;
      }
      v212 = v85;
      objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (v84)
        v87 = CFSTR("WiFi");
      else
        v87 = CFSTR("Cellular");
      v213 = v86;
      v88 = v74;
      v89 = v87;
      v90 = objc_alloc_init(NEVPNProtocolIKEv2);
      ne_log_large_obj();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BD16000, v91, OS_LOG_TYPE_DEBUG, "NEConfiguration configureAOVPNTunnelFromTunnelDict called", buf, 2u);
      }

      if (!v90)
      {
        ne_log_obj();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v103, OS_LOG_TYPE_ERROR, "NEConfiguration configureAOVPNTunnelFromTunnelDict failed to create object", buf, 2u);
        }

        v99 = 0;
        goto LABEL_142;
      }
      objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("RemoteAddress"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol setServerAddress:](v90, "setServerAddress:", v92);

      objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("AuthName"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEVPNProtocol setUsername:](v90, "setUsername:", v93);

      -[NEVPNProtocol setDisconnectOnIdleTimeout:](v90, "setDisconnectOnIdleTimeout:", 0);
      -[NEVPNProtocol setDisconnectOnSleep:](v90, "setDisconnectOnSleep:", 0);
      -[NEVPNProtocol setIdentityReferenceInternal:](v90, "setIdentityReferenceInternal:", 0);
      v90->_wakeForRekey = 1;
      -[NEVPNProtocolIKEv2 setNatKeepAliveOffloadEnable:](v90, "setNatKeepAliveOffloadEnable:", 2);
      if (-[__CFString isEqualToString:](v89, "isEqualToString:", CFSTR("WiFi")))
        v94 = 20;
      else
        v94 = 110;
      -[NEVPNProtocolIKEv2 setNatKeepAliveOffloadInterval:](v90, "setNatKeepAliveOffloadInterval:", v94);
      -[NEVPNProtocol setIncludeAllNetworks:](v90, "setIncludeAllNetworks:", 0);
      -[NEVPNProtocol setExcludeLocalNetworks:](v90, "setExcludeLocalNetworks:", 0);
      -[NEVPNProtocol setExcludeCellularServices:](v90, "setExcludeCellularServices:", 0);
      -[NEVPNProtocol setExcludeAPNs:](v90, "setExcludeAPNs:", 0);
      -[NEVPNProtocol setExcludeDeviceCommunication:](v90, "setExcludeDeviceCommunication:", 0);
      -[NEVPNProtocol setEnforceRoutes:](v90, "setEnforceRoutes:", 0);
      -[NEVPNProtocol setSliceUUID:](v90, "setSliceUUID:", 0);
      objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = isa_nsnumber(v95);

      if (v96)
      {
        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v90, "setUseExtendedAuthentication:", objc_msgSend(v97, "BOOLValue"));

      }
      objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v99 = v98;
      if (v98)
      {
        if (isa_nsdata(v98))
        {
          v209 = v89;
          v100 = v84;
          v101 = v88;
          v102 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v99, 4);

          v99 = (__CFString *)v102;
        }
        else
        {
          if ((isa_nsstring(v99) & 1) == 0)
          {
            ne_log_obj();
            v117 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              v118 = (void *)objc_opt_class();
              v119 = v88;
              v120 = v118;
              v121 = (__CFString *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v262 = v118;
              v263 = 2112;
              v264 = v121;
              v122 = v121;
              _os_log_error_impl(&dword_19BD16000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: unsupported password data type %@", buf, 0x16u);

              a1 = (__CFString *)v230;
              v88 = v119;
            }
            goto LABEL_141;
          }
          v209 = v89;
          v100 = v84;
          v101 = v88;
        }
        v104 = [NEKeychainItem alloc];
        keychainDomain = v90->super.super._keychainDomain;
        v107 = objc_getProperty(v90, v106, 88, 1);
        v108 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v104, "initWithPassword:domain:accessGroup:", v99, keychainDomain, v107);
        -[NEVPNProtocol setPasswordKeychainItem:](v90, "setPasswordKeychainItem:", v108);

        v88 = v101;
        v84 = v100;
        v89 = v209;
      }
      if (-[NEVPNProtocolIPSec useExtendedAuthentication](v90, "useExtendedAuthentication")
        && (-[NEVPNProtocol username](v90, "username"), (v109 = objc_claimAutoreleasedReturnValue()) != 0)
        && (v110 = (void *)v109,
            -[NEVPNProtocol passwordKeychainItem](v90, "passwordKeychainItem"),
            v111 = (void *)objc_claimAutoreleasedReturnValue(),
            v111,
            v110,
            !v111))
      {
        ne_log_obj();
        v134 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
        {
          v161 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138413058;
          v262 = v161;
          v263 = 2112;
          v264 = CFSTR("AuthPassword");
          v265 = 2112;
          v266 = CFSTR("AuthName");
          v267 = 2112;
          v268 = (uint64_t)CFSTR("ExtendedAuthEnabled");
          v162 = v161;
          _os_log_error_impl(&dword_19BD16000, v134, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: %@ required for %@ with %@ method", buf, 0x2Au);

        }
        v69 = 0;
        a1 = (__CFString *)v230;
      }
      else
      {
        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("LocalIdentifier"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPNProtocolIPSec setLocalIdentifier:](v90, "setLocalIdentifier:", v112);

        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("RemoteIdentifier"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEVPNProtocolIPSec setRemoteIdentifier:](v90, "setRemoteIdentifier:", v113);

        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
        v114 = (__CFString *)objc_claimAutoreleasedReturnValue();

        a1 = (__CFString *)v230;
        if (!v114)
          goto LABEL_134;
        if (isa_nsstring(v114))
        {
          if ((-[__CFString isEqualToString:](v114, "isEqualToString:", CFSTR("SharedSecret")) & 1) != 0)
            v115 = 2;
          else
            v115 = -[__CFString isEqualToString:](v114, "isEqualToString:", CFSTR("Certificate"));
          -[NEVPNProtocolIPSec setAuthenticationMethod:](v90, "setAuthenticationMethod:", v115);
LABEL_134:
          objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("ProtocolType"));
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v99
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("IKEv2")) & 1) != 0)
          {
            objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("SharedSecret"));
            v123 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v123)
            {
              if (isa_nsdata(v123))
              {
                v124 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v123, 4);

                v123 = (__CFString *)v124;
              }
              else if ((isa_nsstring(v123) & 1) == 0)
              {
                v99 = v123;
                ne_log_obj();
                v117 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
                  goto LABEL_141;
                v158 = (void *)objc_opt_class();
                v136 = v158;
                v159 = (__CFString *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v262 = v158;
                v263 = 2112;
                v264 = v159;
                v160 = v159;
                _os_log_error_impl(&dword_19BD16000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: unsupported shared secret data type %@", buf, 0x16u);

                goto LABEL_166;
              }
              v140 = [NEKeychainItem alloc];
              v141 = v90->super.super._keychainDomain;
              v143 = objc_getProperty(v90, v142, 88, 1);
              v144 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v140, "initWithPassword:domain:accessGroup:", v123, v141, v143);
              -[NEVPNProtocolIPSec setSharedSecretKeychainItem:](v90, "setSharedSecretKeychainItem:", v144);

              v99 = v123;
              a1 = (__CFString *)v230;
            }
            else
            {
              v99 = 0;
            }
            if (-[NEVPNProtocolIPSec authenticationMethod](v90, "authenticationMethod") != NEVPNIKEAuthenticationMethodSharedSecret
              || (-[NEVPNProtocolIPSec sharedSecretKeychainItem](v90, "sharedSecretKeychainItem"),
                  v145 = (void *)objc_claimAutoreleasedReturnValue(),
                  v145,
                  v145))
            {
              if (!ingestIKEv2Dict(v213, v88, v90))
                goto LABEL_142;
              -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](v90, "IKESecurityAssociationParameters");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v146, "diffieHellmanGroup") <= 13)
              {

              }
              else
              {
                -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](v90, "childSecurityAssociationParameters");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                v148 = v88;
                v149 = objc_msgSend(v147, "diffieHellmanGroup");

                a1 = (__CFString *)v230;
                v150 = v149 <= 13;
                v88 = v148;
                if (!v150)
                {
                  v69 = v90;
                  goto LABEL_143;
                }
              }
              ne_log_obj();
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              {
                v151 = (void *)objc_opt_class();
                v207 = v151;
                -[NEVPNProtocolIKEv2 IKESecurityAssociationParameters](v90, "IKESecurityAssociationParameters");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                v208 = v88;
                v152 = objc_msgSend(v206, "diffieHellmanGroup");
                -[NEVPNProtocolIKEv2 childSecurityAssociationParameters](v90, "childSecurityAssociationParameters");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                v154 = objc_msgSend(v153, "diffieHellmanGroup");
                *(_DWORD *)buf = 138413058;
                v262 = v151;
                a1 = (__CFString *)v230;
                v263 = 2048;
                v264 = (const __CFString *)v152;
                v88 = v208;
                v265 = 2048;
                v266 = (const __CFString *)v154;
                v267 = 2048;
                v268 = 14;
                _os_log_error_impl(&dword_19BD16000, v117, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: Invalid DH group (parent %ld child %ld), mininum allowed is %ld", buf, 0x2Au);

              }
LABEL_141:

LABEL_142:
              v69 = 0;
              goto LABEL_143;
            }
            ne_log_obj();
            v117 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v157 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v262 = v157;
            v263 = 2112;
            v264 = CFSTR("SharedSecret");
            v265 = 2112;
            v266 = CFSTR("SharedSecret");
            v136 = v157;
            v137 = v117;
            v138 = "%@ configureAOVPNTunnelFromTunnelDict: %@ required with %@ method";
            v139 = 32;
          }
          else
          {
            ne_log_obj();
            v117 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v135 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v262 = v135;
            v263 = 2112;
            v264 = v99;
            v136 = v135;
            v137 = v117;
            v138 = "%@ configureAOVPNTunnelFromTunnelDict: invalid ProtocolType (%@),  IKEv2 expected";
            v139 = 22;
          }
          _os_log_error_impl(&dword_19BD16000, v137, OS_LOG_TYPE_ERROR, v138, buf, v139);
LABEL_166:

          a1 = (__CFString *)v230;
          goto LABEL_141;
        }
        ne_log_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          v155 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v262 = v155;
          v263 = 2112;
          v264 = v114;
          v156 = v155;
          _os_log_error_impl(&dword_19BD16000, v116, OS_LOG_TYPE_ERROR, "%@ configureAOVPNTunnelFromTunnelDict: invalid authen type %@.", buf, 0x16u);

          a1 = (__CFString *)v230;
        }

        v69 = 0;
        v99 = v114;
      }
LABEL_143:

      if (!v69)
      {
        v220 = 0;
        v8 = v224;
        v7 = v225;
        v9 = v228;
        v10 = v229;
        v73 = v234;
        goto LABEL_226;
      }
      if (v84)
      {
        v221 = v69;
        objc_msgSend(v222, "setObject:forKey:", v69, CFSTR("AlwaysOnVPNInterfaceWiFi"));
        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        if (v125)
        {
          objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v228, "addCertificatePending:certificateTag:", v126, CFSTR("_PayloadCertificateRefForWifi"));

        }
        v127 = v88;
        v128 = v219;
        v66 = v211;
        v67 = v223;
        if ((v212 & 1) == 0)
        {
          v68 = 1;
LABEL_155:
          v69 = v221;
LABEL_157:

          v72 = v69;
          v70 = v210;
          goto LABEL_158;
        }
        v129 = (void *)-[NEVPNProtocolIKEv2 copy](v221, "copy");
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setIdentifier:", v130);

        objc_msgSend(v222, "setObject:forKey:", v129, CFSTR("AlwaysOnVPNInterfaceCellular"));
        v68 = 1;
      }
      else
      {
        if ((v212 & 1) == 0)
        {
          v128 = v219;
          v66 = v211;
          v68 = v218;
          v67 = v223;
          goto LABEL_157;
        }
        v131 = v69;
        v127 = v88;
        v221 = v131;
        objc_msgSend(v222, "setObject:forKey:");
        v128 = v219;
        v66 = v211;
        v68 = v218;
      }
      objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      if (v132)
      {
        objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v228, "addCertificatePending:certificateTag:", v133, CFSTR("_PayloadCertificateRefForCellular"));

      }
      v67 = 1;
      goto LABEL_155;
    }
    ne_log_obj();
    v174 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
    {
      v194 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v262 = v194;
      v195 = v194;
      _os_log_error_impl(&dword_19BD16000, v174, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: failed to create tunnel configs", buf, 0xCu);

    }
LABEL_189:
    v165 = 0;
    v164 = v12;
    goto LABEL_227;
  }
  v215 = v16;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v252 = 0u;
  v253 = 0u;
  v254 = 0u;
  v255 = 0u;
  v231 = v20;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v252, v260, 16);
  if (!v23)
    goto LABEL_33;
  v24 = v23;
  v25 = *(_QWORD *)v253;
LABEL_18:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v253 != v25)
      objc_enumerationMutation(v22);
    v27 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * v26);
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ServiceName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!isa_nsstring(v28))
      goto LABEL_31;
    v29 = objc_alloc_init(NEAOVPNException);
    if (v29)
      break;
LABEL_30:

LABEL_31:
    if (v24 == ++v26)
    {
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v252, v260, 16);
      if (!v24)
      {
LABEL_33:

        v16 = v215;
        if (objc_msgSend(v21, "count"))
          objc_msgSend(v215, "setServiceExceptions:", v21);

        v7 = v225;
        v9 = v228;
        v10 = v229;
        v20 = v231;
        v12 = v234;
        goto LABEL_36;
      }
      goto LABEL_18;
    }
  }
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Action"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v30))
  {
LABEL_29:
    -[NEAOVPNException setServiceName:](v29, "setServiceName:", v28);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v28);

    goto LABEL_30;
  }
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("Allow")) & 1) != 0)
  {
    v31 = 1;
LABEL_28:
    -[NEAOVPNException setAction:](v29, "setAction:", v31);
    goto LABEL_29;
  }
  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("Drop")) & 1) != 0)
  {
    v31 = 2;
    goto LABEL_28;
  }
  ne_log_obj();
  v179 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
  {
    v198 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v262 = v198;
    v263 = 2112;
    v264 = CFSTR("ServiceExceptions");
    v265 = 2112;
    v266 = CFSTR("Action");
    v267 = 2112;
    v268 = (uint64_t)v30;
    v199 = v198;
    _os_log_error_impl(&dword_19BD16000, v179, OS_LOG_TYPE_ERROR, "%@ initWithAlwaysOnVPNPayload: invalid %@ %@ option '%@'", buf, 0x2Au);

  }
  v165 = 0;
  v164 = v234;
  v7 = v225;
  v9 = v228;
  v10 = v229;
LABEL_206:
  a1 = (__CFString *)v230;
LABEL_227:

LABEL_228:
  return v165;
}

- (NSObject)initWithContentFilterPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v4;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NEContentFilter *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  NEFilterProviderConfiguration *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  const char *v81;
  NEKeychainItem *v82;
  id Property;
  id v84;
  NEKeychainItem *v85;
  void *v86;
  void *v87;
  const char *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (!a1)
  {
    v23 = 0;
    goto LABEL_20;
  }
  v10 = v8;
  objc_msgSend(v10, "payloadAtom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v106 = (id)objc_opt_class();
    v4 = v106;
    _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "%@ initWithContentFilterPayload", buf, 0xCu);

  }
  if (!v11)
    goto LABEL_16;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterType"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("Plugin"), "isEqualToString:", v4) & 1) == 0)
    {

LABEL_16:
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v106 = v29;
      v27 = v29;
      v28 = "%@ initWithContentFilterPayload: empty payload atom or plugin type, or wrong filter type";
LABEL_26:
      _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);

      goto LABEL_17;
    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PluginBundleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {

  }
  if (!v14)
    goto LABEL_16;
  v15 = -[NSObject initWithName:grade:](a1, "initWithName:grade:", v9, a4);
  if (v15)
  {
    a1 = v15;
    v16 = objc_alloc_init(NEContentFilter);
    -[NSObject setContentFilter:](a1, "setContentFilter:", v16);

    -[NSObject contentFilter](a1, "contentFilter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v26 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v106 = v26;
      v27 = v26;
      v28 = "%@ initWithContentFilterPayload failed, can't create content filter";
      goto LABEL_26;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterGrade"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v18))
    {
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("firewall")))
      {
        -[NSObject contentFilter](a1, "contentFilter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = 1;
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("inspector")))
        {
          ne_log_obj();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v106 = v18;
            _os_log_error_impl(&dword_19BD16000, v50, OS_LOG_TYPE_ERROR, "Invalid filter grade: %@", buf, 0xCu);
          }
          goto LABEL_71;
        }
        -[NSObject contentFilter](a1, "contentFilter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = 2;
      }
      objc_msgSend(v19, "setGrade:", v21);

    }
    v30 = objc_alloc_init(NEFilterProviderConfiguration);
    -[NSObject contentFilter](a1, "contentFilter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setProvider:", v30);

    -[NSObject contentFilter](a1, "contentFilter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "provider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PluginBundleID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject contentFilter](a1, "contentFilter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "provider");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPluginType:", v34);

      -[NSObject contentFilter](a1, "contentFilter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "provider");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v38;
      if (v38)
        objc_setProperty_atomic_copy(v38, v39, CFSTR("com.apple.managed.vpn.shared"), 96);

      -[NSObject contentFilter](a1, "contentFilter");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "provider");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "pluginType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplication:](a1, "setApplication:", v43);

      -[NSObject contentFilter](a1, "contentFilter");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "provider");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "pluginType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setApplicationIdentifier:](a1, "setApplicationIdentifier:", v46);

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Enabled"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isa_nsnumber(v47) & 1) != 0)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Enabled"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "BOOLValue");

        if (!v49)
        {
LABEL_40:
          -[NSObject contentFilter](a1, "contentFilter");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "provider");
          v50 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VendorConfig"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setVendorConfiguration:](v50, "setVendorConfiguration:", v55);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ServerAddress"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setServerAddress:](v50, "setServerAddress:", v56);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UserName"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setUsername:](v50, "setUsername:", v57);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Organization"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setOrganization:](v50, "setOrganization:", v58);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterDataProviderDesignatedRequirement"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setDataProviderDesignatedRequirement:](v50, "setDataProviderDesignatedRequirement:", v59);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterDataProviderBundleIdentifier"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setFilterDataProviderBundleIdentifier:](v50, "setFilterDataProviderBundleIdentifier:", v60);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterPacketProviderDesignatedRequirement"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setPacketProviderDesignatedRequirement:](v50, "setPacketProviderDesignatedRequirement:", v61);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterPacketProviderBundleIdentifier"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setFilterPacketProviderBundleIdentifier:](v50, "setFilterPacketProviderBundleIdentifier:", v62);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterSockets"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = isa_nsnumber(v63);

          if (v64)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterSockets"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFilterSockets:](v50, "setFilterSockets:", objc_msgSend(v65, "BOOLValue"));

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterPackets"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = isa_nsnumber(v66);

          if (v67)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterPackets"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFilterPackets:](v50, "setFilterPackets:", objc_msgSend(v68, "BOOLValue"));

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DisableDefaultDrop"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = isa_nsnumber(v69);

          if (v70)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DisableDefaultDrop"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setDisableDefaultDrop:](v50, "setDisableDefaultDrop:", objc_msgSend(v71, "BOOLValue"));

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterBrowsers"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = isa_nsnumber(v72);

          if (v73)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FilterBrowsers"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFilterBrowsers:](v50, "setFilterBrowsers:", objc_msgSend(v74, "BOOLValue"));

          }
          if ((-[NSObject filterSockets](v50, "filterSockets") & 1) == 0
            && (-[NSObject filterBrowsers](v50, "filterBrowsers") & 1) == 0
            && (-[NSObject filterPackets](v50, "filterPackets") & 1) == 0)
          {
            -[NSObject contentFilter](a1, "contentFilter");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setEnabled:", 0);

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Password"));
          v76 = objc_claimAutoreleasedReturnValue();
          if (v76)
          {
            v77 = (void *)v76;
            -[NSObject username](v50, "username");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v18;
            if (isa_nsdata(v77))
            {
              v79 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v77, 4);

              v77 = (void *)v79;
            }
            else if ((isa_nsstring(v77) & 1) == 0)
            {
              ne_log_obj();
              v94 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                v98 = (void *)objc_opt_class();
                v100 = v98;
                v99 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v106 = v98;
                v107 = 2112;
                v108 = v99;
                v102 = v99;
                _os_log_error_impl(&dword_19BD16000, v94, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload: unsupported password data type %@", buf, 0x16u);

              }
              v23 = 0;
              v18 = v103;
              goto LABEL_72;
            }
            v80 = v77;
            v82 = [NEKeychainItem alloc];
            if (v50)
              Property = objc_getProperty(v50, v81, 96, 1);
            else
              Property = 0;
            v84 = Property;
            v85 = -[NEKeychainItem initWithPassword:domain:accessGroup:](v82, "initWithPassword:domain:accessGroup:", v80, 1, v84);

            -[NEKeychainItem syncUsingConfiguration:accountName:passwordType:identifierSuffix:](v85, "syncUsingConfiguration:accountName:passwordType:identifierSuffix:", a1, v78, 0, 0);
            -[NEKeychainItem persistentReference](v85, "persistentReference");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setPasswordReference:](v50, "setPasswordReference:", v86);

            v18 = v103;
          }
          -[NSObject setIdentityReference:](v50, "setIdentityReference:", 0);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (v87)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
              v90 = objc_getProperty(v50, v88, 96, 1);
            else
              v90 = 0;
            v91 = v90;
            objc_msgSend(v10, "addCertificatePending:certificateTag:accessGroup:", v89, CFSTR("_PayloadCertificateRef"), v91);
          }
          else
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v92)
            {
LABEL_66:
              ne_log_obj();
              v93 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                v95 = (void *)objc_opt_class();
                v101 = v95;
                -[NSObject contentFilter](a1, "contentFilter");
                v104 = v18;
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "provider");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v106 = v95;
                v107 = 2112;
                v108 = v97;
                _os_log_debug_impl(&dword_19BD16000, v93, OS_LOG_TYPE_DEBUG, "%@ initWithContentFilterPayload: provider %@", buf, 0x16u);

                v18 = v104;
              }

              v23 = a1;
              goto LABEL_72;
            }
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v89);
            v91 = (id)objc_claimAutoreleasedReturnValue();
            -[NSObject setIdentityReference:](v50, "setIdentityReference:", v91);
          }

          goto LABEL_66;
        }
      }
      else
      {

      }
      -[NSObject contentFilter](a1, "contentFilter");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setEnabled:", 1);

      goto LABEL_40;
    }
    ne_log_obj();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v106 = v51;
      v52 = v51;
      _os_log_error_impl(&dword_19BD16000, v50, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload failed, can't create provider", buf, 0xCu);

    }
LABEL_71:
    v23 = 0;
LABEL_72:

    goto LABEL_19;
  }
  ne_log_obj();
  a1 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
    goto LABEL_18;
  v25 = (void *)objc_opt_class();
  *(_DWORD *)buf = 138412290;
  v106 = v25;
  v22 = v25;
  _os_log_error_impl(&dword_19BD16000, a1, OS_LOG_TYPE_ERROR, "%@ initWithContentFilterPayload failed", buf, 0xCu);
LABEL_17:

LABEL_18:
  v23 = 0;
LABEL_19:

LABEL_20:
  return v23;
}

- (id)initWithPathControllerPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NEPathController *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  const char *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v35 = 0;
    goto LABEL_47;
  }
  objc_msgSend(v7, "payloadAtom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v78 = (id)objc_opt_class();
    v41 = v78;
    _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload", buf, 0xCu);

  }
  if ((isa_nsdictionary(v9) & 1) == 0)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v78 = v36;
      v37 = v36;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: empty payload atom", buf, 0xCu);

    }
    goto LABEL_45;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ApplicationRules"));
  v11 = objc_claimAutoreleasedReturnValue();
  if ((isa_nsarray(v11) & 1) == 0)
  {
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v78 = v48;
      v47 = v48;
      _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: ApplicationRules missing", buf, 0xCu);
      goto LABEL_54;
    }
LABEL_39:

LABEL_45:
    v35 = 0;
    goto LABEL_46;
  }
  v68 = a4;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v11 = v11;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (!v12)
    goto LABEL_29;
  v13 = v12;
  v14 = *(_QWORD *)v74;
  v66 = v8;
  v67 = v7;
  v64 = *(_QWORD *)v74;
  v65 = v9;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v74 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
      if ((isa_nsdictionary(v16) & 1) == 0)
      {
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v78 = v49;
          v50 = v49;
          _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: ApplicationRules malformed", buf, 0xCu);

        }
LABEL_66:
        v8 = v66;
        v7 = v67;
        v9 = v65;
LABEL_44:

        goto LABEL_45;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AppIdentifierMatches"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if ((isa_nsarray(v17) & 1) == 0)
        {
          ne_log_obj();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v53 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v78 = v53;
            v54 = v53;
            _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AppIdentifierMatches malformed", buf, 0xCu);

          }
LABEL_43:
          v8 = v66;
          v7 = v67;
          v9 = v65;

          goto LABEL_44;
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v19 = v18;
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v70;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v70 != v22)
                objc_enumerationMutation(v19);
              if ((isa_nsstring(*(void **)(*((_QWORD *)&v69 + 1) + 8 * j)) & 1) == 0)
              {
                ne_log_obj();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  v51 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138412290;
                  v78 = v51;
                  v52 = v51;
                  _os_log_error_impl(&dword_19BD16000, v39, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AppIdentifierMatches malformed", buf, 0xCu);

                }
                v18 = v19;
                goto LABEL_43;
              }
            }
            v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            if (v21)
              continue;
            break;
          }
        }

        v14 = v64;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AllowRoamingCellularData"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24 && (isa_nsnumber(v24) & 1) == 0)
      {
        ne_log_obj();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v60 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v78 = v60;
          v61 = v60;
          _os_log_error_impl(&dword_19BD16000, v55, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AllowRoamingCellularData malformed", buf, 0xCu);

        }
LABEL_65:

        goto LABEL_66;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AllowCellularData"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 && (isa_nsnumber(v26) & 1) == 0)
      {
        ne_log_obj();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v62 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v78 = v62;
          v63 = v62;
          _os_log_error_impl(&dword_19BD16000, v56, OS_LOG_TYPE_ERROR, "%@ initWithPathControllerPayload: AllowCellularData malformed", buf, 0xCu);

        }
        goto LABEL_65;
      }

    }
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    v8 = v66;
    v7 = v67;
    v9 = v65;
    if (v13)
      continue;
    break;
  }
LABEL_29:

  a1 = (id)objc_msgSend(a1, "initWithName:grade:", v8, v68);
  if (!a1)
  {
    ne_log_obj();
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    v43 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v78 = v43;
    v79 = 2112;
    v80 = v8;
    v44 = v43;
    v45 = "%@ initWithPathControllerPayload: initWithName failed for '%@'";
    goto LABEL_68;
  }
  v28 = objc_alloc_init(NEPathController);
  objc_msgSend(a1, "setPathController:", v28);

  objc_msgSend(a1, "pathController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    ne_log_obj();
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    v59 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v78 = v59;
    v79 = 2112;
    v80 = v8;
    v44 = v59;
    v45 = "%@ initWithPathControllerPayload failed, could not create Path Controller for config '%@'";
LABEL_68:
    _os_log_error_impl(&dword_19BD16000, v42, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);

LABEL_51:
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v46 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v78 = v46;
      v47 = v46;
      _os_log_debug_impl(&dword_19BD16000, v38, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload: failed", buf, 0xCu);
LABEL_54:

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  objc_msgSend(a1, "pathController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEnabled:", 1);

  objc_msgSend(a1, "pathController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31;
  if (v31)
    objc_setProperty_atomic_copy(v31, v32, v11, 32);

  ne_log_obj();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v57 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v78 = v57;
    v58 = v57;
    _os_log_debug_impl(&dword_19BD16000, v34, OS_LOG_TYPE_DEBUG, "%@ initWithPathControllerPayload: done", buf, 0xCu);

  }
  a1 = a1;
  v35 = a1;
LABEL_46:

LABEL_47:
  return v35;
}

- (id)initWithDNSProxyPayload:(id)a1 configurationName:(void *)a2 grade:(void *)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NEDNSProxy *v9;
  void *v10;
  void *v11;
  NEDNSProxyProviderProtocol *v12;
  void *v13;
  NEDNSProxyProviderProtocol *v14;
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
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  const char *v32;
  NSObject *v33;
  void *v34;
  id v35;
  const char *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  int v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v28 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v5, "payloadAtom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v44 = 138412290;
    v45 = (id)objc_opt_class();
    v39 = v45;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload", (uint8_t *)&v44, 0xCu);

  }
  if (v7)
  {
    a1 = (id)objc_msgSend(a1, "initWithName:grade:", v6, 1);
    if (a1)
    {
      v9 = objc_alloc_init(NEDNSProxy);
      objc_msgSend(a1, "setDnsProxy:", v9);

      objc_msgSend(a1, "dnsProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(a1, "dnsProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setEnabled:", 1);

        v12 = [NEDNSProxyProviderProtocol alloc];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppBundleIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NEDNSProxyProviderProtocol initWithPluginType:](v12, "initWithPluginType:", v13);
        objc_msgSend(a1, "dnsProxy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProtocol:", v14);

        objc_msgSend(a1, "dnsProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "protocol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProviderBundleIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "dnsProxy");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "protocol");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setProviderBundleIdentifier:", v18);

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProviderConfiguration"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "dnsProxy");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "protocol");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setProviderConfiguration:", v21);

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProviderDesignatedRequirement"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "dnsProxy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "protocol");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setDesignatedRequirement:", v24);

          ne_log_obj();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v41 = (void *)objc_opt_class();
            v44 = 138412290;
            v45 = v41;
            v42 = v41;
            _os_log_debug_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload: done", (uint8_t *)&v44, 0xCu);

          }
          a1 = a1;
          v28 = a1;
          goto LABEL_19;
        }
        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v38 = (void *)objc_opt_class();
          v44 = 138412290;
          v45 = v38;
          v31 = v38;
          v32 = "%@ initWithDNSProxyPayload failed to allocate protocol";
          goto LABEL_13;
        }
        goto LABEL_18;
      }
      ne_log_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v40 = (void *)objc_opt_class();
          v44 = 138412290;
          v45 = v40;
          v31 = v40;
          _os_log_debug_impl(&dword_19BD16000, v29, OS_LOG_TYPE_DEBUG, "%@ initWithDNSProxyPayload: failed", (uint8_t *)&v44, 0xCu);
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      v43 = (void *)objc_opt_class();
      v44 = 138412546;
      v45 = v43;
      v46 = 2112;
      v47 = v6;
      v35 = v43;
      v36 = "%@ initWithDNSProxyPayload failed, can't create dnsProxy for config '%@'";
    }
    else
    {
      ne_log_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v34 = (void *)objc_opt_class();
      v44 = 138412546;
      v45 = v34;
      v46 = 2112;
      v47 = v6;
      v35 = v34;
      v36 = "%@ initWithDNSProxyPayload: initWithName failed for '%@'";
    }
    _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v44, 0x16u);

    goto LABEL_17;
  }
  ne_log_obj();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_opt_class();
    v44 = 138412290;
    v45 = v30;
    v31 = v30;
    v32 = "%@ initWithDNSProxyPayload: empty payload atom";
LABEL_13:
    _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v44, 0xCu);
LABEL_24:

  }
LABEL_18:

  v28 = 0;
LABEL_19:

LABEL_20:
  return v28;
}

- (id)initWithDNSSettingsPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  __objc2_class **v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NEDNSSettingsBundle *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_46;
  }
  v9 = v7;
  objc_msgSend(v9, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_large_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v56 = (id)objc_opt_class();
    v32 = v56;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload", buf, 0xCu);

  }
  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v45 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v56 = v45;
      v46 = v45;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: empty payload atom", buf, 0xCu);

    }
    v20 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DNSSettings"));
  v12 = objc_claimAutoreleasedReturnValue();
  if ((isa_nsdictionary(v12) & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProhibitDisablement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = isa_nsnumber(v13);

    if (v14)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ProhibitDisablement"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
        a4 = 1;
    }
    v17 = v12;
    objc_opt_self();
    -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("DNSProtocol"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v18))
    {
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("HTTPS")) & 1) != 0)
      {
        v19 = off_1E3CBB710;
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("TLS")))
        {
          v21 = 0;
LABEL_19:

          if (!v21)
          {
            ne_log_obj();
            v26 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              goto LABEL_40;
            v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v56 = v27;
            v28 = v27;
            v29 = "%@ initWithDNSSettingsPayload: failed to parse DNSSettings";
            v30 = v26;
            v31 = 12;
LABEL_49:
            _os_log_error_impl(&dword_19BD16000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

LABEL_40:
            ne_log_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v47 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v56 = v47;
              v48 = v47;
              _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload: failed", buf, 0xCu);

            }
            goto LABEL_42;
          }
          -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addCertificatePending:certificateTag:", v25, CFSTR("_PayloadCertificateRef"));
          }
          else
          {
            -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              goto LABEL_31;
            v34 = -[NSObject dnsProtocol](v21, "dnsProtocol");
            if (v34 != 3 && v34 != 2)
              goto LABEL_31;
            v35 = v21;
            -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            setLocalCertificate(v25);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setIdentityReference:](v35, "setIdentityReference:", v54);

          }
LABEL_31:
          v36 = objc_msgSend(a1, "initWithName:grade:", v8, a4);
          if (!v36)
          {
            ne_log_obj();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v51 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v56 = v51;
              v57 = 2112;
              v58 = v8;
              v52 = v51;
              _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: initWithName failed for '%@'", buf, 0x16u);

            }
            a1 = 0;
            goto LABEL_40;
          }
          a1 = (id)v36;
          v37 = objc_alloc_init(NEDNSSettingsBundle);
          objc_msgSend(a1, "setDnsSettings:", v37);

          objc_msgSend(a1, "dnsSettings");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(a1, "dnsSettings");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setSettings:", v21);

            +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v10);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "dnsSettings");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setOnDemandRules:", v40);

            objc_msgSend(a1, "dnsSettings");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setEnabled:", 1);

            ne_log_obj();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              v49 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v56 = v49;
              v50 = v49;
              _os_log_debug_impl(&dword_19BD16000, v43, OS_LOG_TYPE_DEBUG, "%@ initWithDNSSettingsPayload: done", buf, 0xCu);

            }
            a1 = a1;
            v20 = a1;
            goto LABEL_44;
          }
          ne_log_obj();
          v26 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            goto LABEL_40;
          v53 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v56 = v53;
          v57 = 2112;
          v58 = v8;
          v28 = v53;
          v29 = "%@ initWithDNSSettingsPayload failed, could not create DNS Settings for config '%@'";
          v30 = v26;
          v31 = 22;
          goto LABEL_49;
        }
        v19 = off_1E3CBB718;
      }
    }
    else
    {
      v19 = off_1E3CBB750;
    }
    v21 = objc_msgSend(objc_alloc(*v19), "initFromLegacyDictionary:", v17);
    goto LABEL_19;
  }
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v56 = v22;
    v23 = v22;
    _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "%@ initWithDNSSettingsPayload: DNSSettings missing", buf, 0xCu);
LABEL_42:

  }
  v20 = 0;
LABEL_44:

LABEL_45:
LABEL_46:

  return v20;
}

- (id)initWithRelayPayload:(void *)a3 configurationName:(uint64_t)a4 grade:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NERelayConfiguration *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  id v74;
  void *v75;
  id v76;
  const char *v77;
  id v78;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  NERelay *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint8_t v137[128];
  uint8_t buf[4];
  id v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v74 = 0;
    goto LABEL_110;
  }
  v9 = v7;
  objc_msgSend(v9, "payloadAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v139 = (id)objc_opt_class();
    v78 = v139;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ initWithRelayPayload", buf, 0xCu);

  }
  if ((isa_nsdictionary(v10) & 1) == 0)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v81 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v139 = v81;
      v82 = v81;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, empty payload atom", buf, 0xCu);

    }
    v74 = 0;
    goto LABEL_109;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Relays"));
  v12 = objc_claimAutoreleasedReturnValue();
  if ((isa_nsarray(v12) & 1) == 0)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_107:
      v74 = 0;
      goto LABEL_108;
    }
    v75 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v139 = v75;
    v76 = v75;
    v77 = "%@ initWithRelayPayload failed, relays missing";
LABEL_102:
    _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, v77, buf, 0xCu);

    goto LABEL_107;
  }
  v13 = objc_msgSend(a1, "initWithName:grade:", v8, a4);
  if (!v13)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v87 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v139 = v87;
      v88 = v87;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, cannot initialize", buf, 0xCu);

    }
    a1 = 0;
    goto LABEL_107;
  }
  a1 = (void *)v13;
  v14 = objc_alloc_init(NERelayConfiguration);
  objc_msgSend(a1, "setRelay:", v14);

  objc_msgSend(a1, "relay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_107;
    v89 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v139 = v89;
    v76 = v89;
    v77 = "%@ initWithRelayPayload failed, cannot create relay";
    goto LABEL_102;
  }
  v95 = v8;
  v96 = v7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v98 = -[NSObject count](v12, "count");
  if (!v98)
  {
LABEL_72:
    objc_msgSend(a1, "relay");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setRelays:", v16);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MatchDomains"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v56))
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v57 = v56;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v113;
LABEL_75:
        v61 = 0;
        while (1)
        {
          if (*(_QWORD *)v113 != v60)
            objc_enumerationMutation(v57);
          if (!isa_nsstring(*(void **)(*((_QWORD *)&v112 + 1) + 8 * v61)))
            break;
          if (v59 == ++v61)
          {
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
            if (v59)
              goto LABEL_75;
            goto LABEL_81;
          }
        }
      }
      else
      {
LABEL_81:

        objc_msgSend(a1, "relay");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setMatchDomains:", v57);
        v57 = v62;
      }

    }
    v102 = v56;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ExcludedDomains"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v96;
    if (isa_nsarray(v103))
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v63 = v103;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v109;
LABEL_86:
        v67 = 0;
        while (1)
        {
          if (*(_QWORD *)v109 != v66)
            objc_enumerationMutation(v63);
          if (!isa_nsstring(*(void **)(*((_QWORD *)&v108 + 1) + 8 * v67)))
            break;
          if (v65 == ++v67)
          {
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
            if (v65)
              goto LABEL_86;
            goto LABEL_92;
          }
        }
      }
      else
      {
LABEL_92:

        objc_msgSend(a1, "relay");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setExcludedDomains:", v63);
        v63 = v68;
      }

    }
    +[NEOnDemandRule createOnDemandRulesFromLegacyDictionary:]((uint64_t)NEOnDemandRule, v10);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "relay");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setOnDemandRules:", v69);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Enabled"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsnumber(v71) & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Enabled"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "BOOLValue");

      v8 = v95;
      if (!v73)
        goto LABEL_113;
    }
    else
    {

      v8 = v95;
    }
    objc_msgSend(a1, "relay");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setEnabled:", 1);

LABEL_113:
    v74 = a1;
    goto LABEL_120;
  }
  v17 = 0;
  v93 = v12;
  v94 = a1;
  v92 = v16;
  while (1)
  {
    -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v18;
    if ((isa_nsdictionary(v18) & 1) == 0)
      break;
    v104 = v17;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HTTP3RelayURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HTTP2RelayURL"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v19;
    if ((isa_nsstring(v19) & 1) == 0 && (isa_nsstring(v106) & 1) == 0)
    {
      ne_log_obj();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v90 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v139 = v90;
        v91 = v90;
        _os_log_error_impl(&dword_19BD16000, v86, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, relay dictionary has no URL", buf, 0xCu);

      }
      goto LABEL_119;
    }
    v107 = objc_alloc_init(NERelay);
    if (isa_nsstring(v19))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP3RelayURL:](v107, "setHTTP3RelayURL:", v20);

    }
    if (isa_nsstring(v106))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v106);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setHTTP2RelayURL:](v107, "setHTTP2RelayURL:", v21);

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DNSOverHTTPSURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v22))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NERelay setDnsOverHTTPSURL:](v107, "setDnsOverHTTPSURL:", v23);

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SyntheticDNSAnswerIPv4Prefix"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v24))
      -[NERelay setSyntheticDNSAnswerIPv4Prefix:](v107, "setSyntheticDNSAnswerIPv4Prefix:", v24);
    v100 = v24;
    v101 = v22;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SyntheticDNSAnswerIPv6Prefix"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsstring(v25))
      -[NERelay setSyntheticDNSAnswerIPv6Prefix:](v107, "setSyntheticDNSAnswerIPv6Prefix:", v25);
    v99 = v25;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AdditionalHTTPHeaderFields"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsdictionary(v105))
    {
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      objc_msgSend(v105, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v129;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v129 != v29)
              objc_enumerationMutation(v26);
            if (!isa_nsstring(*(void **)(*((_QWORD *)&v128 + 1) + 8 * i)))
            {
              v31 = 0;
              goto LABEL_34;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
          if (v28)
            continue;
          break;
        }
      }
      v31 = 1;
LABEL_34:

      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      objc_msgSend(v105, "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v125;
        while (2)
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v125 != v35)
              objc_enumerationMutation(v32);
            if (!isa_nsstring(*(void **)(*((_QWORD *)&v124 + 1) + 8 * j)))
            {

              v18 = v102;
              v19 = v103;
              goto LABEL_45;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
          v19 = v103;
          if (v34)
            continue;
          break;
        }
      }

      v18 = v102;
      if (v31)
        -[NERelay setAdditionalHTTPHeaderFields:](v107, "setAdditionalHTTPHeaderFields:", v105);
    }
LABEL_45:
    -[NERelay setIdentityReference:](v107, "setIdentityReference:", 0);
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), CFSTR("_PayloadCertificateRef"), v104);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addCertificatePending:certificateTag:", v39, v38);

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PayloadIntermediateCertificateUUIDs"));
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (isa_nsarray(v40) && (unint64_t)objc_msgSend(v40, "count") <= 4)
      {
        v97 = v38;
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v40 = v40;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
        if (v41)
        {
          v42 = v41;
          v43 = 0;
          v44 = *(_QWORD *)v121;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v121 != v44)
                objc_enumerationMutation(v40);
              v46 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
              if (isa_nsstring(v46))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u-%u"), CFSTR("_PayloadCertificateRef"), v104, v43);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addCertificatePending:certificateTag:", v46, v47);
                v43 = (v43 + 1);

              }
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
          }
          while (v42);
        }

        v12 = v93;
        a1 = v94;
        v16 = v92;
        v18 = v102;
        v19 = v103;
        v38 = v97;
      }
      goto LABEL_60;
    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      setLocalCertificate(v38);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      -[NERelay setIdentityReference:](v107, "setIdentityReference:", v40);
LABEL_60:

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("RawPublicKeys"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v49))
    {
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v50 = v49;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v117;
LABEL_64:
        v54 = 0;
        while (1)
        {
          if (*(_QWORD *)v117 != v53)
            objc_enumerationMutation(v50);
          if (!isa_nsdata(*(void **)(*((_QWORD *)&v116 + 1) + 8 * v54)))
            break;
          if (v52 == ++v54)
          {
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
            if (v52)
              goto LABEL_64;
            break;
          }
        }
      }

      -[NERelay setRawPublicKeys:](v107, "setRawPublicKeys:", v50);
      v18 = v102;
      v19 = v103;
    }
    -[NSObject addObject:](v16, "addObject:", v107);

    v17 = v104 + 1;
    if (v104 + 1 == v98)
      goto LABEL_72;
  }
  ne_log_obj();
  v83 = objc_claimAutoreleasedReturnValue();
  v103 = v83;
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    v84 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v139 = v84;
    v85 = v84;
    _os_log_error_impl(&dword_19BD16000, v83, OS_LOG_TYPE_ERROR, "%@ initWithRelayPayload failed, relay is not dictionary", buf, 0xCu);

  }
LABEL_119:
  v74 = 0;
  v7 = v96;
  v8 = v95;
LABEL_120:

LABEL_108:
LABEL_109:

LABEL_110:
  return v74;
}

- (BOOL)isSupportedBySC
{
  _BOOL8 v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "VPN");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend((id)v1, "VPN");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "protocol");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend((id)v1, "VPN");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "protocol");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "type") == 5)
        {
          v1 = 0;
        }
        else
        {
          objc_msgSend((id)v1, "VPN");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v1 = objc_msgSend(v7, "tunnelType") != 2 && objc_msgSend((id)v1, "grade") != 2;

        }
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)applyChangesToSCServiceInPreferences:(void *)a1
{
  uint64_t v2;
  __CFString *v4;
  void *v5;
  const __SCNetworkService *v6;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v8;
  const __CFString *InterfaceType;
  void *v10;
  const __SCNetworkService *v11;
  const __CFString *Name;
  __CFString *v13;
  const __CFString *i;
  CFStringRef v15;
  void *v16;
  void *v17;
  const __SCNetworkInterface *v18;
  void *v19;
  int v20;
  __CFString *v21;
  int v22;
  CFStringRef v23;
  const __CFString *v24;
  NSObject *v25;
  const __SCNetworkInterface *v26;
  const __CFString *v27;
  NSObject *v28;
  const __SCNetworkService *v29;
  int v30;
  const char *v31;
  const char *v32;
  const __CFString *v33;
  void *v34;
  int v35;
  SCNetworkInterfaceRef v36;
  const __SCNetworkInterface *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  NSObject *v44;
  int v45;
  const char *v46;
  int v47;
  const char *v48;
  const __SCNetworkService *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  NSObject *v53;
  int v54;
  const char *v55;
  int v56;
  const char *v57;
  int v58;
  const char *v59;
  SCNetworkSetRef v60;
  SCNetworkSetRef v61;
  const __CFString *v62;
  int v63;
  int v64;
  const char *v65;
  NSObject *v66;
  const __SCNetworkService *v67;
  const char *v68;
  const __SCNetworkService *v70;
  const __SCNetworkService *v71;
  int v72;
  const char *v73;
  CFErrorRef Error;
  int v75;
  const __SCNetworkService *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v2 = (uint64_t)a1;
  v79 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v2;
  if (!-[NEConfiguration isSupportedBySC](a1))
    return 1;
  objc_msgSend((id)v2, "pluginType");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = SCNetworkServiceCopy(a2, (CFStringRef)objc_msgSend(v5, "UUIDString"));

    if (v6)
    {
      Interface = SCNetworkServiceGetInterface(v6);
      if (Interface)
      {
        v8 = Interface;
        InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
        if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E0CE8BE0], 0) == kCFCompareEqualTo)
        {
          v26 = SCNetworkInterfaceGetInterface(v8);
          if (v26)
          {
            v27 = SCNetworkInterfaceGetInterfaceType(v26);
            if (v27)
            {
              if (CFStringCompare(v27, v4, 0) && !SCNetworkServiceRemove(v6))
              {
                ne_log_obj();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  Error = SCCopyLastError();
                  v75 = 138412546;
                  v76 = v6;
                  v77 = 2112;
                  v78 = Error;
                  _os_log_error_impl(&dword_19BD16000, v28, OS_LOG_TYPE_ERROR, "Failed to remove SCNetworkService %@: %@", (uint8_t *)&v75, 0x16u);

                }
              }
            }
          }
        }
      }
      CFRelease(v6);
    }
  }
  objc_msgSend((id)v2, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SCNetworkServiceCopy(a2, (CFStringRef)objc_msgSend(v10, "UUIDString"));

  if (v11)
  {
    Name = SCNetworkServiceGetName(v11);
    objc_msgSend((id)v2, "name");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (Name && v13 && !CFStringHasPrefix(Name, v13))
    {
      objc_msgSend((id)v2, "name");
      for (i = (const __CFString *)objc_claimAutoreleasedReturnValue(); ; i = v15)
      {
        if (SCNetworkServiceSetName(v11, i))
        {
          v33 = i;
          goto LABEL_36;
        }
        if (SCError() != 1005)
          break;
        v15 = copyNextName(i);
        CFRelease(i);
      }
      ne_log_obj();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v2, "name");
        v71 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
        v72 = SCError();
        v73 = SCErrorString(v72);
        v75 = 138412546;
        v76 = v71;
        v77 = 2080;
        v78 = (void *)v73;
        _os_log_error_impl(&dword_19BD16000, v53, OS_LOG_TYPE_ERROR, "Failed to set the serve name for configuration \"%@\": %s", (uint8_t *)&v75, 0x16u);

      }
      CFRelease(i);
      goto LABEL_85;
    }
  }
  else
  {
    objc_msgSend((id)v2, "VPN");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "protocol");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (const __SCNetworkInterface *)objc_msgSend(v17, "createInterface");

    if (!v18)
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v2, "name");
        v70 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
        v75 = 138412290;
        v76 = v70;
        _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "Failed to create interface for configuration \"%@\", (uint8_t *)&v75, 0xCu);

      }
      v11 = 0;
      goto LABEL_84;
    }
    v11 = SCNetworkServiceCreate(a2, v18);
    CFRelease(v18);
    objc_msgSend((id)v2, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = _SCNetworkServiceSetServiceID();

    if (!v20)
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_84:

LABEL_85:
        v2 = 0;
        goto LABEL_86;
      }
      objc_msgSend((id)v2, "name");
      v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v30 = SCError();
      v31 = SCErrorString(v30);
      v75 = 138412546;
      v76 = v29;
      v77 = 2080;
      v78 = (void *)v31;
      v32 = "Failed to re-set the service ID for configuration \"%@\": %s";
LABEL_78:
      _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v75, 0x16u);

      goto LABEL_84;
    }
    objc_msgSend((id)v2, "name");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = SCNetworkServiceSetName(v11, v21);

    if (!v22)
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_84;
      objc_msgSend((id)v2, "name");
      v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v54 = SCError();
      v55 = SCErrorString(v54);
      v75 = 138412546;
      v76 = v29;
      v77 = 2080;
      v78 = (void *)v55;
      v32 = "Failed to set the service name for configuration \"%@\": %s";
      goto LABEL_78;
    }
    if (!SCNetworkServiceEstablishDefaultConfiguration(v11))
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_84;
      objc_msgSend((id)v2, "name");
      v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v58 = SCError();
      v59 = SCErrorString(v58);
      v75 = 138412546;
      v76 = v29;
      v77 = 2080;
      v78 = (void *)v59;
      v32 = "Failed to set up default service configuration for configuration \"%@\": %s";
      goto LABEL_78;
    }
    v23 = SCNetworkServiceGetName(v11);
    if (v23)
      v24 = (const __CFString *)CFRetain(v23);
    else
      v24 = 0;
    v60 = SCNetworkSetCopyCurrent(a2);
    if (!v60)
    {
LABEL_74:
      if (v24)
        CFRelease(v24);
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_84;
      objc_msgSend((id)v2, "name");
      v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v64 = SCError();
      v65 = SCErrorString(v64);
      v75 = 138412546;
      v76 = v29;
      v77 = 2080;
      v78 = (void *)v65;
      v32 = "Failed to add the network service for configuration \"%@\" to the current network set: %s";
      goto LABEL_78;
    }
    v61 = v60;
    while (!SCNetworkSetAddService(v61, v11))
    {
      if (SCError() != 1005)
      {
        v62 = v24;
LABEL_73:
        CFRelease(v61);
        v24 = v62;
        goto LABEL_74;
      }
      v62 = copyNextName(v24);
      v63 = SCNetworkServiceSetName(v11, v62);
      CFRelease(v24);
      v24 = v62;
      if (!v63)
        goto LABEL_73;
    }
    CFRelease(v61);
    if (v24)
    {
      v33 = v24;
LABEL_36:
      CFRelease(v33);
    }
  }
  objc_msgSend((id)v2, "VPN");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = SCNetworkServiceSetEnabled(v11, objc_msgSend(v34, "isEnabled"));

  if (!v35)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_84;
    objc_msgSend((id)v2, "name");
    v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
    v45 = SCError();
    v46 = SCErrorString(v45);
    v75 = 138412546;
    v76 = v29;
    v77 = 2080;
    v78 = (void *)v46;
    v32 = "SCNetworkServiceSetEnabled failed for configuration \"%@\": %s";
    goto LABEL_78;
  }
  v36 = SCNetworkServiceGetInterface(v11);
  if (!v36)
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_84;
    objc_msgSend((id)v2, "name");
    v29 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
    v47 = SCError();
    v48 = SCErrorString(v47);
    v75 = 138412546;
    v76 = v29;
    v77 = 2080;
    v78 = (void *)v48;
    v32 = "SCNetworkInterface for configuration \"%@\" is NULL: %s";
    goto LABEL_78;
  }
  v37 = v36;
  objc_msgSend((id)v2, "VPN");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v38, "copyLegacyDictionary");

  if (!v25)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v2, "name");
      v49 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v75 = 138412290;
      v76 = v49;
      v50 = "Failed to create a legacy dictionary for configuration \"%@\";
      v51 = v44;
      v52 = 12;
LABEL_60:
      _os_log_error_impl(&dword_19BD16000, v51, OS_LOG_TYPE_ERROR, v50, (uint8_t *)&v75, v52);

    }
LABEL_83:

    goto LABEL_84;
  }
  if (!SCNetworkInterfaceSetConfiguration(v37, (CFDictionaryRef)v25))
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v2, "name");
      v49 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v56 = SCError();
      v57 = SCErrorString(v56);
      v75 = 138412546;
      v76 = v49;
      v77 = 2080;
      v78 = (void *)v57;
      v50 = "Failed to set the interface configuration for configuration \"%@\": %s";
      v51 = v44;
      v52 = 22;
      goto LABEL_60;
    }
    goto LABEL_83;
  }
  objc_msgSend((id)v2, "VPN");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "protocol");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "setServiceProtocolsInService:", v11);

  if (!v41)
    goto LABEL_84;
  objc_msgSend((id)v2, "payloadInfo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend((id)v2, "payloadInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copyLegacyDictionary");

    if (v44)
    {
      if ((+[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v44, CFSTR("com.apple.payload"), v11) & 1) != 0)
      {

        goto LABEL_46;
      }
      ne_log_obj();
      v66 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        goto LABEL_82;
      objc_msgSend((id)v2, "name");
      v67 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v75 = 138412290;
      v76 = v67;
      v68 = "Failed to set the profile payload info for configuration \"%@\";
    }
    else
    {
      ne_log_obj();
      v66 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
LABEL_82:

        goto LABEL_83;
      }
      objc_msgSend((id)v2, "name");
      v67 = (const __SCNetworkService *)objc_claimAutoreleasedReturnValue();
      v75 = 138412290;
      v76 = v67;
      v68 = "Failed to create a legacy profile payload dictionary for configuration \"%@\";
    }
    _os_log_error_impl(&dword_19BD16000, v66, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&v75, 0xCu);

    goto LABEL_82;
  }
LABEL_46:

  v2 = 1;
LABEL_86:
  if (v11)
    CFRelease(v11);

  return v2;
}

+ (uint64_t)setConfiguration:(const __CFString *)a3 forProtocol:(const __SCNetworkService *)a4 inService:
{
  SCNetworkProtocolRef v7;
  SCNetworkProtocolRef v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  int v15;
  int v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = SCNetworkServiceCopyProtocol(a4, a3);
  v8 = v7;
  if (a2 && !v7)
  {
    if (!SCNetworkServiceAddProtocolType(a4, a3))
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = SCError();
        v17 = 138412546;
        v18 = a3;
        v19 = 2080;
        v20 = SCErrorString(v15);
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "SCNetworkServiceAddProtocolType(%@) failed: %s", (uint8_t *)&v17, 0x16u);
      }

      return 0;
    }
    v8 = SCNetworkServiceCopyProtocol(a4, a3);
  }
  if (v8)
  {
    if (a2 && !SCNetworkProtocolSetConfiguration(v8, a2))
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = SCError();
        v17 = 138412546;
        v18 = a3;
        v19 = 2080;
        v20 = SCErrorString(v16);
        v13 = "SCNetworkProtocolSetConfiguration(%@) failed: %s";
        goto LABEL_21;
      }
    }
    else
    {
      if (SCNetworkProtocolSetEnabled(v8, a2 != 0))
      {
        v9 = 1;
LABEL_18:
        CFRelease(v8);
        return v9;
      }
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = SCError();
        v17 = 138412546;
        v18 = a3;
        v19 = 2080;
        v20 = SCErrorString(v12);
        v13 = "SCNetworkProtocolSetEnabled(%@) failed: %s";
LABEL_21:
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x16u);
      }
    }

    v9 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (uint64_t)updateFromSCService:(void *)a1
{
  const __SCNetworkInterface *Interface;
  void *v5;
  void *v6;
  const __CFString *InterfaceType;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __SCNetworkInterface *v14;
  CFStringRef v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int Enabled;
  void *v20;
  uint64_t v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  const __SCNetworkInterface *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  SCPreferencesRef v72;
  SCPreferencesRef v73;
  void *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  int v84;
  int v85;
  void *Name;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  Interface = SCNetworkServiceGetInterface(service);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", SCNetworkServiceGetName(service));
  objc_msgSend(a1, "setName:", v5);

  if (Interface)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", SCNetworkInterfaceGetConfiguration(Interface));
    InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    v8 = (void *)SCNetworkServiceCopyExternalID();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F78]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsarray(v9) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9010]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = isa_nsnumber(v12);
      if (v8)
        v10 = 1;
      else
        v10 = v13;

    }
    objc_msgSend(a1, "setExternalIdentifier:", v8);

    if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E0CE8BC8], 0))
    {
      if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E0CE8BD8], 0))
      {
        if (CFStringCompare(InterfaceType, (CFStringRef)*MEMORY[0x1E0CE8BE0], 0) == kCFCompareEqualTo)
        {
          v14 = SCNetworkInterfaceGetInterface(Interface);
          if (v14)
          {
            v15 = SCNetworkInterfaceGetInterfaceType(v14);
            if (v15)
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v15);
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("__NEVPNPluginType"));

              v17 = 4;
              goto LABEL_16;
            }
          }
        }
LABEL_37:
        v11 = 0;
LABEL_63:

        return v11;
      }
      v66 = SCNetworkInterfaceGetInterface(Interface);
      if (!v66)
        goto LABEL_37;
      v67 = SCNetworkInterfaceGetInterfaceType(v66);
      if (CFStringCompare(v67, (CFStringRef)*MEMORY[0x1E0CE8BD0], 0))
        goto LABEL_37;
      v17 = 2;
    }
    else
    {
      v17 = 1;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("__NEVPNProtocolType"));

    Enabled = SCNetworkServiceGetEnabled(service);
    if (v10)
    {
      objc_msgSend(a1, "appVPN");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "protocol");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(a1, "appVPN");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "protocol");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
LABEL_21:
          objc_msgSend(a1, "appVPN");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "protocol");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "passwordKeychainItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            v31 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(a1, "appVPN");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "protocol");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "passwordKeychainItem");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v34, "domain"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("__NEVPNKeychainDomain"));

          }
          objc_msgSend(a1, "appVPN");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isDisconnectOnDemandEnabled");

          v38 = -[NEVPNApp initFromLegacyDictionary:]([NEVPNApp alloc], "initFromLegacyDictionary:", v6);
          objc_msgSend(a1, "setAppVPN:", v38);

          objc_msgSend(a1, "appVPN");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(a1, "appVPN");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setEnabled:", Enabled != 0);

            objc_msgSend(a1, "appVPN");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          ne_log_obj();
          v77 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            goto LABEL_61;
          v85 = 138412290;
          Name = (void *)SCNetworkServiceGetName(service);
          v78 = "Failed to initialize an NEVPNApp object from service %@";
          goto LABEL_60;
        }
        objc_msgSend(a1, "appVPN");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "protocol");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("__NEVPNProtocolIdentifier"));

      }
      goto LABEL_21;
    }
    objc_msgSend(a1, "VPN");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "protocol");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)v43;
      objc_msgSend(a1, "VPN");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "protocol");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
LABEL_29:
        objc_msgSend(a1, "VPN");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "protocol");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "passwordKeychainItem");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v53 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(a1, "VPN");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "protocol");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "passwordKeychainItem");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v56, "domain"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("__NEVPNKeychainDomain"));

        }
        objc_msgSend(a1, "VPN");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v58, "isDisconnectOnDemandEnabled");

        v59 = -[NEVPN initFromLegacyDictionary:]([NEVPN alloc], "initFromLegacyDictionary:", v6);
        objc_msgSend(a1, "setVPN:", v59);

        objc_msgSend(a1, "VPN");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(a1, "VPN");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setEnabled:", Enabled != 0);

          objc_msgSend(a1, "VPN");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
          v62 = v41;
          objc_msgSend(v41, "setDisconnectOnDemandEnabled:", v37);

          objc_msgSend(a1, "VPN");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "protocol");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (v64)
          {
            objc_msgSend(a1, "VPN");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
          objc_msgSend(a1, "appVPN");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "protocol");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
          {
            objc_msgSend(a1, "appVPN");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
            v70 = v65;
            objc_msgSend(v65, "protocol");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "updateWithServiceProtocolsFromService:", service);

            v72 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NE migrate passwords"), 0, 0);
            if (!v72)
            {
              ne_log_obj();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                v84 = SCError();
                v85 = 136315138;
                Name = (void *)SCErrorString(v84);
                _os_log_error_impl(&dword_19BD16000, v76, OS_LOG_TYPE_ERROR, "Failed to create a SCPreferencesRef for migrating passwords: %s", (uint8_t *)&v85, 0xCu);
              }

              goto LABEL_54;
            }
            v73 = v72;
            objc_msgSend(a1, "VPN");
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            if (v74)
            {
              objc_msgSend(a1, "VPN");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(a1, "appVPN");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v79)
              {
LABEL_53:
                CFRelease(v73);
LABEL_54:
                v77 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, CFSTR("com.apple.payload"), service);
                if (v77)
                {
                  v82 = -[NEProfileIngestionPayloadInfo initFromLegacyDictionary:]([NEProfileIngestionPayloadInfo alloc], "initFromLegacyDictionary:", v77);
                  objc_msgSend(a1, "setPayloadInfo:", v82);

                }
                v11 = 1;
                goto LABEL_62;
              }
              objc_msgSend(a1, "appVPN");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v80 = v75;
            objc_msgSend(v75, "protocol");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "migratePasswordsFromPreferences:", v73);

            goto LABEL_53;
          }
          ne_log_obj();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            v85 = 138412290;
            Name = (void *)SCNetworkServiceGetName(service);
            v78 = "Failed to initialize the NEVPNProtocol from service %@";
            goto LABEL_60;
          }
LABEL_61:
          v11 = 0;
LABEL_62:

          goto LABEL_63;
        }
        ne_log_obj();
        v77 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          goto LABEL_61;
        v85 = 138412290;
        Name = (void *)SCNetworkServiceGetName(service);
        v78 = "Failed to initialize an NEVPN object from service %@";
LABEL_60:
        _os_log_error_impl(&dword_19BD16000, v77, OS_LOG_TYPE_ERROR, v78, (uint8_t *)&v85, 0xCu);
        goto LABEL_61;
      }
      objc_msgSend(a1, "VPN");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "protocol");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("__NEVPNProtocolIdentifier"));

    }
    goto LABEL_29;
  }
  return 1;
}

+ (CFDictionaryRef)copyConfigurationForProtocol:(const __SCNetworkService *)a3 inService:
{
  const __SCNetworkProtocol *v5;
  const __SCNetworkProtocol *v6;
  CFDictionaryRef Configuration;
  CFDictionaryRef v8;

  objc_opt_self();
  v5 = SCNetworkServiceCopyProtocol(a3, a2);
  if (!v5)
    return 0;
  v6 = v5;
  Configuration = SCNetworkProtocolGetConfiguration(v5);
  v8 = Configuration;
  if (Configuration)
    CFRetain(Configuration);
  CFRelease(v6);
  return v8;
}

@end
