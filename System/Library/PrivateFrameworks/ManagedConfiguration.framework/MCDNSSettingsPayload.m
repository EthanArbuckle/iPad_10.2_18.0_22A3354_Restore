@implementation MCDNSSettingsPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.dnsSettings.managed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(CFSTR("DNS_SETTINGS_SINGULAR"));
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(CFSTR("DNS_SETTINGS_PLURAL"));
}

- (MCDNSSettingsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCDNSSettingsPayload *v9;
  uint64_t v10;
  id v11;
  NSDictionary *dnsSettings;
  uint64_t v13;
  NSArray *onDemandRules;
  uint64_t v15;
  NSNumber *prohibitDisablement;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MCDNSSettingsPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v34, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_21;
  v33 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DNSSettings"), 1, &v33);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v33;
  dnsSettings = v9->_dnsSettings;
  v9->_dnsSettings = (NSDictionary *)v10;

  if (!v11)
  {
    v32 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OnDemandRules"), 0, &v32);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v32;
    onDemandRules = v9->_onDemandRules;
    v9->_onDemandRules = (NSArray *)v13;

    if (!v11)
    {
      v31 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProhibitDisablement"), 0, &v31);
      v15 = objc_claimAutoreleasedReturnValue();
      v11 = v31;
      prohibitDisablement = v9->_prohibitDisablement;
      v9->_prohibitDisablement = (NSNumber *)v15;

      if (!v11)
      {
        -[MCPayload profile](v9, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isStub") & 1) != 0 || !-[NSNumber BOOLValue](v9->_prohibitDisablement, "BOOLValue"))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D44768], "sharedConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isSupervised");

          if ((v19 & 1) == 0)
          {
            +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("ProhibitDisablement"));
            v11 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
        }
        v11 = 0;
      }
    }
  }
LABEL_11:
  if (objc_msgSend(v8, "count"))
  {
    v20 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      -[MCPayload friendlyName](v9, "friendlyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      v37 = 2114;
      v38 = v8;
      _os_log_impl(&dword_19ECC4000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }
  if (v11)
  {
    -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v24, "MCVerboseDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_19ECC4000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

LABEL_21:
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
  v8.super_class = (Class)MCDNSSettingsPayload;
  -[MCPayload stubDictionary](&v8, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNSSettingsPayload dnsSettings](self, "dnsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DNSSettings"));

  -[MCDNSSettingsPayload onDemandRules](self, "onDemandRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("OnDemandRules"));

  -[MCDNSSettingsPayload prohibitDisablement](self, "prohibitDisablement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ProhibitDisablement"));

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

  -[MCDNSSettingsPayload dnsSettings](self, "dnsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DNSSettings"));

  -[MCDNSSettingsPayload onDemandRules](self, "onDemandRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("OnDemandRules"));

  -[MCDNSSettingsPayload prohibitDisablement](self, "prohibitDisablement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ProhibitDisablement"));

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCDNSSettingsPayload;
  -[MCPayload verboseDescription](&v11, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCDNSSettingsPayload dnsSettings](self, "dnsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("DNS Settings: %@\n"), v5);

  -[MCDNSSettingsPayload onDemandRules](self, "onDemandRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCDNSSettingsPayload onDemandRules](self, "onDemandRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("On Demand Rules: %@\n"), v7);

  }
  -[MCDNSSettingsPayload prohibitDisablement](self, "prohibitDisablement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCDNSSettingsPayload prohibitDisablement](self, "prohibitDisablement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Prohibit Disablement: %@\n"), v9);

  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  MCKeyValue *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  MCKeyValue *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDNSSettingsPayload dnsSettings](self, "dnsSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ServerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("DNS_SETTINGS_SERVER_NAME"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v5, v7);
    objc_msgSend(v3, "addObject:", v8);

  }
  -[MCDNSSettingsPayload dnsSettings](self, "dnsSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ServerURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("DNS_SETTINGS_SERVER_URL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v10, v12);
    objc_msgSend(v3, "addObject:", v13);

  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  MCLocalizedString(CFSTR("INSTALL_WARNING_DNS_SETTINGS_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_DNS_SETTINGS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)dnsSettings
{
  return self->_dnsSettings;
}

- (NSArray)onDemandRules
{
  return self->_onDemandRules;
}

- (NSNumber)prohibitDisablement
{
  return self->_prohibitDisablement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitDisablement, 0);
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_dnsSettings, 0);
}

@end
