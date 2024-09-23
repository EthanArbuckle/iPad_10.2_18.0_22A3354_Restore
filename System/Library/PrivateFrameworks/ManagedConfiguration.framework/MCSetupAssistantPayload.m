@implementation MCSetupAssistantPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.SetupAssistant.managed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("SETUP_ASSISTANT_SETTINGS_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("SETUP_ASSISTANT_SETTINGS_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSetupAssistantPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCSetupAssistantPayload *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *skipKeys;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCSetupAssistantPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v25, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v24 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("SkipSetupItems"), 0, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;
    if (v11)
    {

      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      v13 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        v15 = (void *)objc_opt_class();
        v16 = v15;
        objc_msgSend(v10, "MCVerboseDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v15;
        v28 = 2114;
        v29 = v17;
        _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      skipKeys = v9;
      v9 = 0;
    }
    else
    {
      v19 = objc_msgSend(v10, "copy");
      skipKeys = v9->_skipKeys;
      v9->_skipKeys = (NSArray *)v19;
    }

    if (objc_msgSend(v8, "count"))
    {
      v20 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v21 = v20;
        -[MCPayload friendlyName](v9, "friendlyName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2114;
        v29 = v8;
        _os_log_impl(&dword_19ECC4000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }

  }
  return v9;
}

- (NSDictionary)configuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSetupAssistantPayload skipKeys](self, "skipKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SkipSetupItems"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSetupAssistantPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSetupAssistantPayload configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MCSetupAssistantPayload;
  -[MCPayload verboseDescription](&v8, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSetupAssistantPayload skipKeys](self, "skipKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: Skip keys:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[MCSetupAssistantPayload skipKeys](self, "skipKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("SETUP_ASSISTANT_SKIP_KEYS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (NSArray)skipKeys
{
  return self->_skipKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipKeys, 0);
}

@end
