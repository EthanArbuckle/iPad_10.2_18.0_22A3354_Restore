@implementation MCAPNConfiguration

- (MCAPNConfiguration)initWithDictionary:(id)a3 outError:(id *)a4
{
  id v6;
  MCAPNConfiguration *v7;
  uint64_t v8;
  NSNumber *enableXLAT464;
  NSString *name;
  uint64_t v11;
  NSString *authenticationType;
  NSString *v13;
  NSNumber *v14;
  uint64_t v15;
  NSString *username;
  uint64_t v17;
  NSString *password;
  uint64_t v19;
  NSString *proxyServer;
  uint64_t v21;
  NSNumber *proxyPort;
  uint64_t v23;
  NSNumber *defaultProtocolMask;
  uint64_t v25;
  NSNumber *allowedProtocolMask;
  uint64_t v27;
  NSNumber *allowedProtocolMaskInRoaming;
  uint64_t v29;
  NSNumber *allowedProtocolMaskInDomesticRoaming;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSNumber *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MCAPNConfiguration;
  v7 = -[MCAPNConfiguration init](&v50, sel_init);
  if (!v7)
    goto LABEL_29;
  v49 = 0;
  +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v49);
  v8 = objc_claimAutoreleasedReturnValue();
  enableXLAT464 = (NSNumber *)v49;
  name = v7->_name;
  v7->_name = (NSString *)v8;

  if (!enableXLAT464)
  {
    v48 = 0;
    +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("AuthenticationType"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v48);
    v11 = objc_claimAutoreleasedReturnValue();
    enableXLAT464 = (NSNumber *)v48;
    authenticationType = v7->_authenticationType;
    v7->_authenticationType = (NSString *)v11;

  }
  v13 = v7->_authenticationType;
  if (v13)
  {
    if (!-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("CHAP"))
      && !-[NSString isEqualToString:](v7->_authenticationType, "isEqualToString:", CFSTR("PAP")))
    {
      +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("AuthenticationType"));
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    v7->_authenticationType = (NSString *)CFSTR("PAP");

  }
  if (!enableXLAT464)
  {
    v47 = 0;
    +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("Username"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v47);
    v15 = objc_claimAutoreleasedReturnValue();
    enableXLAT464 = (NSNumber *)v47;
    username = v7->_username;
    v7->_username = (NSString *)v15;

    if (!enableXLAT464)
    {
      v46 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("Password"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v46);
      v17 = objc_claimAutoreleasedReturnValue();
      enableXLAT464 = (NSNumber *)v46;
      password = v7->_password;
      v7->_password = (NSString *)v17;

      if (!enableXLAT464)
      {
        v45 = 0;
        +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("ProxyServer"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v45);
        v19 = objc_claimAutoreleasedReturnValue();
        enableXLAT464 = (NSNumber *)v45;
        proxyServer = v7->_proxyServer;
        v7->_proxyServer = (NSString *)v19;

        if (!enableXLAT464)
        {
          v44 = 0;
          +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v6, CFSTR("ProxyPort"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v44);
          v21 = objc_claimAutoreleasedReturnValue();
          enableXLAT464 = (NSNumber *)v44;
          proxyPort = v7->_proxyPort;
          v7->_proxyPort = (NSNumber *)v21;

        }
      }
    }
  }
  v43 = enableXLAT464;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DefaultProtocolMask"), 0, &v43);
  v23 = objc_claimAutoreleasedReturnValue();
  v14 = v43;

  defaultProtocolMask = v7->_defaultProtocolMask;
  v7->_defaultProtocolMask = (NSNumber *)v23;

  if (v14)
    goto LABEL_20;
  v42 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowedProtocolMask"), 0, &v42);
  v25 = objc_claimAutoreleasedReturnValue();
  v14 = (NSNumber *)v42;
  allowedProtocolMask = v7->_allowedProtocolMask;
  v7->_allowedProtocolMask = (NSNumber *)v25;

  if (v14)
    goto LABEL_20;
  v41 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowedProtocolMaskInRoaming"), 0, &v41);
  v27 = objc_claimAutoreleasedReturnValue();
  v14 = (NSNumber *)v41;
  allowedProtocolMaskInRoaming = v7->_allowedProtocolMaskInRoaming;
  v7->_allowedProtocolMaskInRoaming = (NSNumber *)v27;

  if (v14)
    goto LABEL_20;
  v40 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AllowedProtocolMaskInDomesticRoaming"), 0, &v40);
  v29 = objc_claimAutoreleasedReturnValue();
  v14 = (NSNumber *)v40;
  allowedProtocolMaskInDomesticRoaming = v7->_allowedProtocolMaskInDomesticRoaming;
  v7->_allowedProtocolMaskInDomesticRoaming = (NSNumber *)v29;

  if (v14)
    goto LABEL_20;
  v39 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EnableXLAT464"), 0, &v39);
  v38 = objc_claimAutoreleasedReturnValue();
  v14 = (NSNumber *)v39;
  enableXLAT464 = v7->_enableXLAT464;
  v7->_enableXLAT464 = (NSNumber *)v38;
LABEL_8:

  if (v14)
  {
LABEL_20:
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = (void *)objc_opt_class();
      v34 = v33;
      -[NSNumber MCVerboseDescription](v14, "MCVerboseDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v33;
      v53 = 2114;
      v54 = v35;
      _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse APN dictionary: %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v7 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    v36 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v52 = v6;
      _os_log_impl(&dword_19ECC4000, v36, OS_LOG_TYPE_INFO, "APN dictionary contains ignored fields. They are: %{public}@", buf, 0xCu);
    }
  }

LABEL_29:
  return v7;
}

- (id)stubDictionary
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAPNConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Name"));

  -[MCAPNConfiguration authenticationType](self, "authenticationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AuthenticationType"));

  -[MCAPNConfiguration username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Username"));

  -[MCAPNConfiguration proxyServer](self, "proxyServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ProxyServer"));

  -[MCAPNConfiguration proxyPort](self, "proxyPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ProxyPort"));

  -[MCAPNConfiguration defaultProtocolMask](self, "defaultProtocolMask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("DefaultProtocolMask"));

  -[MCAPNConfiguration allowedProtocolMask](self, "allowedProtocolMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("AllowedProtocolMask"));

  -[MCAPNConfiguration allowedProtocolMaskInRoaming](self, "allowedProtocolMaskInRoaming");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("AllowedProtocolMaskInRoaming"));

  -[MCAPNConfiguration allowedProtocolMaskInDomesticRoaming](self, "allowedProtocolMaskInDomesticRoaming");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("AllowedProtocolMaskInDomesticRoaming"));

  -[MCAPNConfiguration enableXLAT464](self, "enableXLAT464");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("EnableXLAT464"));

  return v3;
}

- (id)description
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
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAPNConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCAPNConfiguration name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  Name        : %@\n"), v5);

  }
  -[MCAPNConfiguration authenticationType](self, "authenticationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCAPNConfiguration authenticationType](self, "authenticationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  Auth        : %@\n"), v7);

  }
  -[MCAPNConfiguration username](self, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCAPNConfiguration username](self, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  Username    : %@\n"), v9);

  }
  -[MCAPNConfiguration proxyServer](self, "proxyServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCAPNConfiguration proxyServer](self, "proxyServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  Proxy       : %@\n"), v11);

  }
  -[MCAPNConfiguration proxyPort](self, "proxyPort");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCAPNConfiguration proxyPort](self, "proxyPort");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  Port        : %@\n"), v13);

  }
  -[MCAPNConfiguration enableXLAT464](self, "enableXLAT464");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MCAPNConfiguration enableXLAT464](self, "enableXLAT464");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  XLAT464     : %@\n"), v15);

  }
  return v3;
}

- (id)localizedAuthenticationType
{
  __CFString *v3;
  void *v4;

  if (-[NSString isEqualToString:](self->_authenticationType, "isEqualToString:", CFSTR("CHAP")))
  {
    v3 = CFSTR("AUTHENTICATION_TYPE_CHAP");
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_authenticationType, "isEqualToString:", CFSTR("PAP")))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("AUTHENTICATION_TYPE_PAP");
  }
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (NSDictionary)telephonyRepresentation
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCAPNConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("apn"));

  -[MCAPNConfiguration authenticationType](self, "authenticationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("auth_type"));

  -[MCAPNConfiguration username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("username"));

  -[MCAPNConfiguration password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("password"));

  -[MCAPNConfiguration proxyServer](self, "proxyServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E4212838, CFSTR("HTTPEnable"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E4212838, CFSTR("HTTPSEnable"));
    -[MCAPNConfiguration proxyServer](self, "proxyServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("HTTPProxy"));

    -[MCAPNConfiguration proxyServer](self, "proxyServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("HTTPSProxy"));

    -[MCAPNConfiguration proxyPort](self, "proxyPort");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MCAPNConfiguration proxyPort](self, "proxyPort");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("HTTPPort"));

      -[MCAPNConfiguration proxyPort](self, "proxyPort");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("HTTPSPort"));

    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ProxyConfiguration"));

  }
  -[MCAPNConfiguration defaultProtocolMask](self, "defaultProtocolMask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("DefaultProtocolMask"));

  -[MCAPNConfiguration allowedProtocolMask](self, "allowedProtocolMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("AllowedProtocolMask"));

  -[MCAPNConfiguration allowedProtocolMaskInRoaming](self, "allowedProtocolMaskInRoaming");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("AllowedProtocolMaskInRoaming"));

  -[MCAPNConfiguration allowedProtocolMaskInDomesticRoaming](self, "allowedProtocolMaskInDomesticRoaming");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("AllowedProtocolMaskInDomesticRoaming"));

  -[MCAPNConfiguration enableXLAT464](self, "enableXLAT464");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("enableXLAT464"));

  return (NSDictionary *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServer, a3);
}

- (NSNumber)proxyPort
{
  return self->_proxyPort;
}

- (void)setProxyPort:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPort, a3);
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationType, a3);
}

- (NSNumber)defaultProtocolMask
{
  return self->_defaultProtocolMask;
}

- (void)setDefaultProtocolMask:(id)a3
{
  objc_storeStrong((id *)&self->_defaultProtocolMask, a3);
}

- (NSNumber)allowedProtocolMask
{
  return self->_allowedProtocolMask;
}

- (void)setAllowedProtocolMask:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProtocolMask, a3);
}

- (NSNumber)allowedProtocolMaskInRoaming
{
  return self->_allowedProtocolMaskInRoaming;
}

- (void)setAllowedProtocolMaskInRoaming:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProtocolMaskInRoaming, a3);
}

- (NSNumber)allowedProtocolMaskInDomesticRoaming
{
  return self->_allowedProtocolMaskInDomesticRoaming;
}

- (void)setAllowedProtocolMaskInDomesticRoaming:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProtocolMaskInDomesticRoaming, a3);
}

- (NSNumber)enableXLAT464
{
  return self->_enableXLAT464;
}

- (void)setEnableXLAT464:(id)a3
{
  objc_storeStrong((id *)&self->_enableXLAT464, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableXLAT464, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMaskInDomesticRoaming, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMaskInRoaming, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_defaultProtocolMask, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
