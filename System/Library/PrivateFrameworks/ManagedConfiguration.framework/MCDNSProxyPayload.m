@implementation MCDNSProxyPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.dnsProxy.managed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(CFSTR("DNS_PROXY_SINGULAR"));
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(CFSTR("DNS_PROXY_PLURAL"));
}

- (MCDNSProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCDNSProxyPayload *v9;
  uint64_t v10;
  id v11;
  NSString *appBundleIdentifier;
  uint64_t v13;
  id v14;
  NSString *providerBundleIdentifier;
  BOOL v16;
  uint64_t v17;
  NSDictionary *providerConfiguration;
  uint64_t v19;
  id v20;
  NSString *dnsProxyUUID;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MCDNSProxyPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v37, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v36 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AppBundleIdentifier"), 1, &v36);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v36;
    appBundleIdentifier = v9->_appBundleIdentifier;
    v9->_appBundleIdentifier = (NSString *)v10;

    if (v9->_appBundleIdentifier)
    {
      v35 = v11;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProviderBundleIdentifier"), 0, &v35);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v35;

      providerBundleIdentifier = v9->_providerBundleIdentifier;
      v9->_providerBundleIdentifier = (NSString *)v13;

      if (v9->_providerBundleIdentifier)
        v16 = 1;
      else
        v16 = v14 == 0;
      if (v16)
      {
        v34 = v14;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProviderConfiguration"), 0, &v34);
        v17 = objc_claimAutoreleasedReturnValue();
        v11 = v34;

        providerConfiguration = v9->_providerConfiguration;
        v9->_providerConfiguration = (NSDictionary *)v17;

        if (v9->_providerBundleIdentifier || !v11)
        {
          v33 = v11;
          objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DNSProxyUUID"), 0, &v33);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v33;

          dnsProxyUUID = v9->_dnsProxyUUID;
          v9->_dnsProxyUUID = (NSString *)v19;

          v11 = v20;
        }
      }
      else
      {
        v11 = v14;
      }
    }
    if (objc_msgSend(v8, "count"))
    {
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        -[MCPayload friendlyName](v9, "friendlyName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v24;
        v40 = 2114;
        v41 = v8;
        _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }
    if (v11)
    {
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a5)
        *a5 = objc_retainAutorelease(v25);
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend(v26, "MCVerboseDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v29;
        v40 = 2114;
        v41 = v31;
        _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }

  }
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCDNSProxyPayload;
  -[MCPayload stubDictionary](&v8, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNSProxyPayload appBundleIdentifier](self, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AppBundleIdentifier"));

  -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ProviderBundleIdentifier"));

  -[MCDNSProxyPayload dnsProxyUUID](self, "dnsProxyUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DNSProxyUUID"));

  return v3;
}

- (NSDictionary)configurationDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPayload displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PayloadDisplayName"));

  -[MCDNSProxyPayload appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AppBundleIdentifier"));

  -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ProviderBundleIdentifier"));

  -[MCDNSProxyPayload providerConfiguration](self, "providerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ProviderConfiguration"));

  return (NSDictionary *)v3;
}

- (id)verboseDescription
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MCDNSProxyPayload;
  -[MCPayload verboseDescription](&v13, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCDNSProxyPayload appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("App: %@\n"), v5);

  -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("App's provider: %@\n"), v7);

  }
  -[MCDNSProxyPayload providerConfiguration](self, "providerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCDNSProxyPayload providerConfiguration](self, "providerConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Provider's configuration: %@\n"), v9);

  }
  -[MCDNSProxyPayload dnsProxyUUID](self, "dnsProxyUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCDNSProxyPayload dnsProxyUUID](self, "dnsProxyUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("DNSProxyUUID            : %@\n"), v11);

  }
  return v4;
}

- (id)subtitle1Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("DNS_PROXY_APP_COLON"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle2Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;

  -[MCDNSProxyPayload subtitle2Description](self, "subtitle2Description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    MCLocalizedFormat(CFSTR("DNS_PROXY_PROVIDER_BUNDLE_COLON"), v2, v3, v4, v5, v6, v7, v8, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  MCKeyValue *v4;
  void *v5;
  void *v6;
  MCKeyValue *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  void *v11;
  MCKeyValue *v12;
  void *v13;
  MCKeyValue *v14;
  void *v15;
  void *v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MCKeyValue alloc];
  -[MCDNSProxyPayload appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("DNS_PROXY_APP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v4, "initWithLocalizedString:localizedKey:", v5, v6);
  objc_msgSend(v3, "addObject:", v7);

  -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [MCKeyValue alloc];
    -[MCDNSProxyPayload providerBundleIdentifier](self, "providerBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("DNS_PROXY_PROVIDER_BUNDLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MCKeyValue initWithLocalizedString:localizedKey:](v9, "initWithLocalizedString:localizedKey:", v10, v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  -[MCDNSProxyPayload dnsProxyUUID](self, "dnsProxyUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [MCKeyValue alloc];
    -[MCDNSProxyPayload dnsProxyUUID](self, "dnsProxyUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("DNS_PROXY_UUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCKeyValue initWithLocalizedString:localizedKey:](v14, "initWithLocalizedString:localizedKey:", v15, v16);
    objc_msgSend(v3, "addObject:", v17);

  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  MCLocalizedString(CFSTR("INSTALL_WARNING_DNS_PROXY_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_DNS_PROXY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (NSDictionary)providerConfiguration
{
  return self->_providerConfiguration;
}

- (NSString)dnsProxyUUID
{
  return self->_dnsProxyUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsProxyUUID, 0);
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
