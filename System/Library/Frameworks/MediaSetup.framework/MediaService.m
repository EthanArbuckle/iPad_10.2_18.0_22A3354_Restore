@implementation MediaService

- (MediaService)initWithServiceAccount:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MediaService *v10;
  MediaService *v11;
  uint64_t v12;
  NSString *serviceName;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *accountName;
  uint64_t v18;
  NSURL *configURL;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CMSAuthenticationConfiguration *authConfiguration;
  void *v27;
  uint64_t v28;
  NSUUID *v29;
  const __CFString *v30;
  uint64_t v31;
  MediaService *v32;
  uint64_t v33;
  NSUUID *serviceID;
  _BOOL4 v35;
  BOOL v36;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MediaService;
  v10 = -[MediaService init](&v38, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_37:
    v32 = v11;
    goto LABEL_38;
  }
  if (!v8)
  {
    if (a5)
    {
      v30 = CFSTR("setupContext");
      v31 = 6;
      goto LABEL_30;
    }
LABEL_31:
    v32 = 0;
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  if (!v9)
  {
    if (a5)
    {
      v30 = CFSTR("bundleIdentifier");
      v10 = v11;
      v31 = 8;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "serviceName");
  v12 = objc_claimAutoreleasedReturnValue();
  serviceName = v11->_serviceName;
  v11->_serviceName = (NSString *)v12;

  if (!v12)
  {
    if (a5)
    {
      v30 = CFSTR("serviceName");
      v10 = v11;
      v31 = 0;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "clientID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (a5)
    {
      v30 = CFSTR("clientID");
      v10 = v11;
      v31 = 2;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "clientSecret");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (a5)
    {
      v30 = CFSTR("clientSecret");
      v10 = v11;
      v31 = 3;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "accountName");
  v16 = objc_claimAutoreleasedReturnValue();
  accountName = v11->_accountName;
  v11->_accountName = (NSString *)v16;

  if (!v16)
  {
    if (a5)
    {
      v30 = CFSTR("accountName");
      v10 = v11;
      v31 = 1;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "configurationURL");
  v18 = objc_claimAutoreleasedReturnValue();
  configURL = v11->_configURL;
  v11->_configURL = (NSURL *)v18;

  if (!v18)
  {
    if (a5)
    {
      v30 = CFSTR("configURL");
      v10 = v11;
      v31 = 5;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "authorizationTokenURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    if (a5)
    {
      v30 = CFSTR("authorizationTokenURL");
      v10 = v11;
      v31 = 7;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  objc_msgSend(v8, "authorizationScope");

  objc_msgSend(v8, "clientID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientSecret");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationTokenURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationScope");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMSAuthenticationConfiguration authConfigurationWithClientID:clientSecret:authorizationURL:scope:](CMSAuthenticationConfiguration, "authConfigurationWithClientID:clientSecret:authorizationURL:scope:", v21, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  authConfiguration = v11->_authConfiguration;
  v11->_authConfiguration = (CMSAuthenticationConfiguration *)v25;

  objc_msgSend(v8, "serviceID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    NSLog(CFSTR("Using random UUID for serviceID"));
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v33 = objc_claimAutoreleasedReturnValue();
    serviceID = v11->_serviceID;
    v11->_serviceID = (NSUUID *)v33;

    goto LABEL_33;
  }
  objc_msgSend(v8, "serviceID");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v11->_serviceID;
  v11->_serviceID = (NSUUID *)v28;

  if (v11->_serviceID)
  {
LABEL_33:
    v35 = +[MSAssistantPreferences isMultiUserEnabledForSiri](MSAssistantPreferences, "isMultiUserEnabledForSiri");
    v36 = v35;
    if (v35)
      NSLog(CFSTR("Device Siri language supports MU, Setting Initial Update Listening History : YES"));
    else
      NSLog(CFSTR("Device Siri language does not support MU, Setting Initial Update Listening History : NO"));
    v11->_updateListeningHistoryEnabled = v36;
    goto LABEL_37;
  }
  if (!a5)
    goto LABEL_31;
  NSLog(CFSTR("Malformed ServiceID passed"));
  v30 = CFSTR("serviceIdentifier");
  v10 = v11;
  v31 = 9;
LABEL_30:
  -[MediaService _failWithError:errorString:](v10, "_failWithError:errorString:", v31, v30);
  v32 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v32;
}

- (id)_failWithError:(unint64_t)a3 errorString:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize MediaService object, Nil %@"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v5);
  v6 = (void *)MEMORY[0x24BDD1540];
  v10 = CFSTR("MSUserInfoErrorStringKey");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.serviceonboarding.errorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isServiceRemovable
{
  return !-[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", CFSTR("com.apple.Music"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[MediaService basicPropertiesDictionary](self, "basicPropertiesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<MediaService = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_authCredential)
    objc_msgSend(v4, "appendFormat:", CFSTR(" AuthCredential = %@"), self->_authCredential);
  if (self->_authConfiguration)
    objc_msgSend(v5, "appendFormat:", CFSTR(" AuthConfiguration = %@"), self->_authConfiguration);
  if (self->_alternateBundleIdentifiers)
    objc_msgSend(v5, "appendFormat:", CFSTR(" AlternateBundleIdentifiers = %@>"), self->_alternateBundleIdentifiers);

  return v5;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMSAuthenticationCredential *authCredential;
  void *v10;
  CMSAuthenticationConfiguration *authConfiguration;
  void *v12;
  NSArray *alternateBundleIdentifiers;

  -[MediaService basicPropertiesDictionary](self, "basicPropertiesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v3);
  -[NSUUID UUIDString](self->_serviceID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("serviceIdentifier"));

  -[NSURL absoluteString](self->_configURL, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("configURL"));

  -[NSURL absoluteString](self->_iconImageURL, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("iconImageURL"));

  -[NSURL absoluteString](self->_remoteIconURL, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("remoteIconImageURL"));

  authCredential = self->_authCredential;
  if (authCredential)
  {
    -[CMSAuthenticationCredential jsonDictionary](authCredential, "jsonDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("authCredential"));

  }
  authConfiguration = self->_authConfiguration;
  if (authConfiguration)
  {
    -[CMSAuthenticationConfiguration jsonDictionary](authConfiguration, "jsonDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, CFSTR("authConfiguration"));

  }
  alternateBundleIdentifiers = self->_alternateBundleIdentifiers;
  if (alternateBundleIdentifiers)
    objc_msgSend(v4, "na_safeSetObject:forKey:", alternateBundleIdentifiers, CFSTR("alternateBundleIdentifiers"));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MediaService)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *serviceID;
  void *v7;
  MediaService *v8;
  uint64_t v9;
  NSString *serviceName;
  uint64_t v11;
  NSString *bundleIdentifier;
  uint64_t v13;
  NSString *accountName;
  uint64_t v15;
  NSString *serviceType;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CMSAuthenticationCredential *authCredential;
  void *v22;
  uint64_t v23;
  CMSAuthenticationConfiguration *authConfiguration;
  void *v25;
  uint64_t v26;
  CMSAuthenticationCredential *v27;
  void *v28;
  uint64_t v29;
  CMSAuthenticationConfiguration *v30;
  void *v31;
  uint64_t v32;
  NSString *configPublicKey;
  uint64_t v34;
  NSString *configETag;
  uint64_t v36;
  NSURL *configURL;
  uint64_t v38;
  NSData *configAsset;
  uint64_t v40;
  NSURL *iconImageURL;
  uint64_t v42;
  NSURL *remoteIconURL;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSArray *alternateBundleIdentifiers;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSServiceIdentifierEncodedKey"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  serviceID = self->_serviceID;
  self->_serviceID = v5;

  -[NSUUID UUIDString](self->_serviceID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MediaService initWithMediaServiceIdentifier:](self, "initWithMediaServiceIdentifier:", v7);

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSServiceNameEncodedKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSBundleIdentifierEncodedKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAccountNameEncodedKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    accountName = v8->_accountName;
    v8->_accountName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceType"));
    v15 = objc_claimAutoreleasedReturnValue();
    serviceType = v8->_serviceType;
    v8->_serviceType = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSServiceRemovableEncodedKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_serviceRemovable = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSUpdateListeningHistoryEncodedKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_updateListeningHistoryEnabled = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthCredentialEncodedKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v19, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      authCredential = v8->_authCredential;
      v8->_authCredential = (CMSAuthenticationCredential *)v20;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthConfigurationEncodedKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      authConfiguration = v8->_authConfiguration;
      v8->_authConfiguration = (CMSAuthenticationConfiguration *)v23;

    }
    if (!v8->_authCredential)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthCredentialObjectEncodedKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "credential");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v8->_authCredential;
      v8->_authCredential = (CMSAuthenticationCredential *)v26;

    }
    if (!v8->_authConfiguration)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthConfigurationObjectEncodedKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "configuration");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v8->_authConfiguration;
      v8->_authConfiguration = (CMSAuthenticationConfiguration *)v29;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSAuthFatalErrorEncodedKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_authFatalError = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSConfigPublicKeyEncodedKey"));
    v32 = objc_claimAutoreleasedReturnValue();
    configPublicKey = v8->_configPublicKey;
    v8->_configPublicKey = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSConfigETagEncodedKey"));
    v34 = objc_claimAutoreleasedReturnValue();
    configETag = v8->_configETag;
    v8->_configETag = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSconfigURLEncodedKey"));
    v36 = objc_claimAutoreleasedReturnValue();
    configURL = v8->_configURL;
    v8->_configURL = (NSURL *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSConfigAssetEncodedKey"));
    v38 = objc_claimAutoreleasedReturnValue();
    configAsset = v8->_configAsset;
    v8->_configAsset = (NSData *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSiconImageURLEncodedKey"));
    v40 = objc_claimAutoreleasedReturnValue();
    iconImageURL = v8->_iconImageURL;
    v8->_iconImageURL = (NSURL *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSRemoteIconURLEncodedKey"));
    v42 = objc_claimAutoreleasedReturnValue();
    remoteIconURL = v8->_remoteIconURL;
    v8->_remoteIconURL = (NSURL *)v42;

    v44 = (void *)MEMORY[0x24BDBCF20];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("MSAlternateBundleIdentifiersEncodedKey"));
    v47 = objc_claimAutoreleasedReturnValue();
    alternateBundleIdentifiers = v8->_alternateBundleIdentifiers;
    v8->_alternateBundleIdentifiers = (NSArray *)v47;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceName;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  serviceName = self->_serviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceName, CFSTR("MSServiceNameEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("MSBundleIdentifierEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountName, CFSTR("MSAccountNameEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("MSServiceIdentifierEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceType, CFSTR("ServiceType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_serviceRemovable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("MSServiceRemovableEncodedKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_updateListeningHistoryEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("MSUpdateListeningHistoryEncodedKey"));

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_authCredential, 1, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("MSAuthCredentialEncodedKey"));
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_authConfiguration, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("MSAuthConfigurationEncodedKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_authFatalError);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("MSAuthFatalErrorEncodedKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_iconImageURL, CFSTR("MSiconImageURLEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteIconURL, CFSTR("MSRemoteIconURLEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configPublicKey, CFSTR("MSConfigPublicKeyEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configURL, CFSTR("MSconfigURLEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configETag, CFSTR("MSConfigETagEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configAsset, CFSTR("MSConfigAssetEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateBundleIdentifiers, CFSTR("MSAlternateBundleIdentifiersEncodedKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSUUID copyWithZone:](self->_serviceID, "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceID:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_accountName, "copyWithZone:", a3);
  objc_msgSend(v5, "setAccountName:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceName:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_serviceType, "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceType:", v10);

  v11 = -[CMSAuthenticationCredential copyWithZone:](self->_authCredential, "copyWithZone:", a3);
  objc_msgSend(v5, "setAuthCredential:", v11);

  v12 = -[CMSAuthenticationConfiguration copyWithZone:](self->_authConfiguration, "copyWithZone:", a3);
  objc_msgSend(v5, "setAuthConfiguration:", v12);

  objc_msgSend(v5, "setAuthFatalError:", -[MediaService authFatalError](self, "authFatalError"));
  objc_msgSend(v5, "setUpdateListeningHistoryEnabled:", -[MediaService updateListeningHistoryEnabled](self, "updateListeningHistoryEnabled"));
  objc_msgSend(v5, "setServiceRemovable:", -[MediaService isServiceRemovable](self, "isServiceRemovable"));
  v13 = (void *)-[NSURL copyWithZone:](self->_remoteIconURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setRemoteIconURL:", v13);

  v14 = (void *)-[NSURL copyWithZone:](self->_iconImageURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setIconImageURL:", v14);

  v15 = (void *)-[NSData copyWithZone:](self->_configAsset, "copyWithZone:", a3);
  objc_msgSend(v5, "setConfigAsset:", v15);

  v16 = (void *)-[NSString copyWithZone:](self->_configPublicKey, "copyWithZone:", a3);
  objc_msgSend(v5, "setConfigPublicKey:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_configETag, "copyWithZone:", a3);
  objc_msgSend(v5, "setConfigETag:", v17);

  v18 = (void *)-[NSURL copyWithZone:](self->_configURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setConfigURL:", v18);

  v19 = (void *)-[NSArray copyWithZone:](self->_alternateBundleIdentifiers, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlternateBundleIdentifiers:", v19);

  return v5;
}

- (MediaService)initWithMediaServiceIdentifier:(id)a3
{
  id v4;
  MediaService *v5;
  uint64_t v6;
  NSUUID *serviceID;
  MediaService *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MediaService;
  v5 = -[MediaService init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      NSLog(CFSTR("Failed to initialize MediaService object, Nil serviceIdentifier"));
      v8 = 0;
      goto LABEL_6;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSUUID *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (id)basicPropertiesDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, CFSTR("serviceIdentifier"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_accountName, CFSTR("accountName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_updateListeningHistoryEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, CFSTR("updateListeningHistoryEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MediaService isServiceRemovable](self, "isServiceRemovable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, CFSTR("serviceRemovable"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_authFatalError);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v6, CFSTR("authFatalError"));

  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configURL, CFSTR("configURL"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_iconImageURL, CFSTR("iconImageURL"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configPublicKey, CFSTR("configPublicKey"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_remoteIconURL, CFSTR("remoteIconImageURL"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configETag, CFSTR("configETag"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceType, CFSTR("serviceType"));
  return v3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setServiceRemovable:(BOOL)a3
{
  self->_serviceRemovable = a3;
}

- (BOOL)updateListeningHistoryEnabled
{
  return self->_updateListeningHistoryEnabled;
}

- (void)setUpdateListeningHistoryEnabled:(BOOL)a3
{
  self->_updateListeningHistoryEnabled = a3;
}

- (NSURL)iconImageURL
{
  return self->_iconImageURL;
}

- (void)setIconImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageURL, a3);
}

- (BOOL)authFatalError
{
  return self->_authFatalError;
}

- (void)setAuthFatalError:(BOOL)a3
{
  self->_authFatalError = a3;
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CMSAuthenticationConfiguration)authConfiguration
{
  return self->_authConfiguration;
}

- (void)setAuthConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_authConfiguration, a3);
}

- (CMSAuthenticationCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
{
  objc_storeStrong((id *)&self->_authCredential, a3);
}

- (NSURL)configURL
{
  return self->_configURL;
}

- (void)setConfigURL:(id)a3
{
  objc_storeStrong((id *)&self->_configURL, a3);
}

- (NSString)configPublicKey
{
  return self->_configPublicKey;
}

- (void)setConfigPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)configETag
{
  return self->_configETag;
}

- (void)setConfigETag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)configAsset
{
  return self->_configAsset;
}

- (void)setConfigAsset:(id)a3
{
  objc_storeStrong((id *)&self->_configAsset, a3);
}

- (NSURL)remoteIconURL
{
  return self->_remoteIconURL;
}

- (void)setRemoteIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteIconURL, a3);
}

- (NSArray)alternateBundleIdentifiers
{
  return self->_alternateBundleIdentifiers;
}

- (void)setAlternateBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_alternateBundleIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteIconURL, 0);
  objc_storeStrong((id *)&self->_configAsset, 0);
  objc_storeStrong((id *)&self->_configETag, 0);
  objc_storeStrong((id *)&self->_configPublicKey, 0);
  objc_storeStrong((id *)&self->_configURL, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_authConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_iconImageURL, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
