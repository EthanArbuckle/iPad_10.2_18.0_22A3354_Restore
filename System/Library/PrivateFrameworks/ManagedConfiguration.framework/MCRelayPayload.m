@implementation MCRelayPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.relay.managed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(CFSTR("RELAY_SINGULAR"));
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(CFSTR("RELAY_PLURAL"));
}

- (MCRelayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCRelayPayload *v9;
  MCRelayPayload *v10;
  uint64_t v11;
  id v12;
  NSString *relayUUID;
  uint64_t v14;
  NSArray *relays;
  uint64_t v16;
  NSArray *matchDomains;
  uint64_t v18;
  NSArray *excludedDomains;
  uint64_t v20;
  NSArray *onDemandRules;
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
  id v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MCRelayPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v38, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_restrictDomains = 0;
    v37 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("RelayUUID"), 0, &v37);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v37;
    relayUUID = v10->_relayUUID;
    v10->_relayUUID = (NSString *)v11;

    if (!v12)
    {
      v36 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Relays"), 1, &v36);
      v14 = objc_claimAutoreleasedReturnValue();
      v12 = v36;
      relays = v10->_relays;
      v10->_relays = (NSArray *)v14;

      if (!v12)
      {
        v35 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MatchDomains"), 0, &v35);
        v16 = objc_claimAutoreleasedReturnValue();
        v12 = v35;
        matchDomains = v10->_matchDomains;
        v10->_matchDomains = (NSArray *)v16;

        if (!v12)
        {
          v34 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ExcludedDomains"), 0, &v34);
          v18 = objc_claimAutoreleasedReturnValue();
          v12 = v34;
          excludedDomains = v10->_excludedDomains;
          v10->_excludedDomains = (NSArray *)v18;

          if (!v12)
          {
            v33 = 0;
            objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OnDemandRules"), 0, &v33);
            v20 = objc_claimAutoreleasedReturnValue();
            v12 = v33;
            onDemandRules = v10->_onDemandRules;
            v10->_onDemandRules = (NSArray *)v20;

          }
        }
      }
    }
    if (objc_msgSend(v8, "count"))
    {
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        -[MCPayload friendlyName](v10, "friendlyName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2114;
        v42 = v8;
        _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }
    if (v12)
    {
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
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
        v40 = v29;
        v41 = 2114;
        v42 = v31;
        _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
    }

  }
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCRelayPayload;
  -[MCPayload stubDictionary](&v10, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCRelayPayload relays](self, "relays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Relays"));

  -[MCRelayPayload matchDomains](self, "matchDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MatchDomains"));

  -[MCRelayPayload excludedDomains](self, "excludedDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ExcludedDomains"));

  -[MCRelayPayload relayUUID](self, "relayUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("RelayUUID"));

  -[MCRelayPayload onDemandRules](self, "onDemandRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("OnDemandRules"));

  return v3;
}

- (NSDictionary)configurationDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPayload displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PayloadDisplayName"));

  -[MCRelayPayload relays](self, "relays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Relays"));

  -[MCRelayPayload matchDomains](self, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("MatchDomains"));

  -[MCRelayPayload excludedDomains](self, "excludedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ExcludedDomains"));

  -[MCRelayPayload onDemandRules](self, "onDemandRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("OnDemandRules"));

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
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCRelayPayload;
  -[MCPayload verboseDescription](&v15, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCRelayPayload relays](self, "relays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Relays: %@\n"), v5);

  -[MCRelayPayload matchDomains](self, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCRelayPayload matchDomains](self, "matchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Match Domains: %@\n"), v7);

  }
  -[MCRelayPayload excludedDomains](self, "excludedDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCRelayPayload excludedDomains](self, "excludedDomains");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Excluded Domains: %@\n"), v9);

  }
  -[MCRelayPayload relayUUID](self, "relayUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCRelayPayload relayUUID](self, "relayUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("RelayUUID: %@\n"), v11);

  }
  -[MCRelayPayload onDemandRules](self, "onDemandRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCRelayPayload onDemandRules](self, "onDemandRules");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("On Demand Rules: %@\n"), v13);

  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  MCKeyValue *v13;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  void *v17;
  MCKeyValue *v18;
  void *v19;
  void *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[MCRelayPayload relays](self, "relays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v4)
    goto LABEL_16;
  v5 = v4;
  v6 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v37 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HTTP3RelayURL"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HTTP2RelayURL"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("RELAY_URL"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          v14 = v9;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            continue;
          }
          v15 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("RELAY_URL"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v15;
          v14 = v10;
        }
        v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", v14, v12);
        objc_msgSend(v35, "addObject:", v16);

        goto LABEL_16;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v5)
      continue;
    break;
  }
LABEL_16:

  -[MCRelayPayload relayUUID](self, "relayUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [MCKeyValue alloc];
    -[MCRelayPayload relayUUID](self, "relayUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("RELAY_RELAYUUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCKeyValue initWithLocalizedString:localizedKey:](v18, "initWithLocalizedString:localizedKey:", v19, v20);

    objc_msgSend(v35, "addObject:", v21);
  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v22);

  -[MCRelayPayload matchDomains](self, "matchDomains");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    -[MCRelayPayload matchDomains](self, "matchDomains");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("RELAY_MATCH_DOMAINS"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "addObject:", v27);
  }
  -[MCRelayPayload excludedDomains](self, "excludedDomains");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    -[MCRelayPayload excludedDomains](self, "excludedDomains");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("RELAY_EXCLUDED_DOMAINS"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v30, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "addObject:", v32);
  }

  return v34;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  MCLocalizedString(CFSTR("INSTALL_WARNING_RELAY_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_RELAY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  self->_restrictDomains = 1;
  return 0;
}

- (NSArray)relays
{
  return self->_relays;
}

- (NSArray)matchDomains
{
  return self->_matchDomains;
}

- (NSArray)excludedDomains
{
  return self->_excludedDomains;
}

- (NSString)relayUUID
{
  return self->_relayUUID;
}

- (void)setRelayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)onDemandRules
{
  return self->_onDemandRules;
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_relayUUID, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_relays, 0);
}

@end
