@implementation MCSharedDeviceConfigurationPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.shareddeviceconfiguration");
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

  return MCLocalizedFormat(CFSTR("SHARED_DEVICE_CONFIGURATION_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SHARED_DEVICE_CONFIGURATION_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSharedDeviceConfigurationPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCSharedDeviceConfigurationPayload *v9;
  uint64_t v10;
  id v11;
  NSString *lockScreenFootnote;
  uint64_t v13;
  NSString *assetTagInformation;
  uint64_t v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MCSharedDeviceConfigurationPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v31, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v30 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("LockScreenFootnote"), 0, &v30);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v30;
    lockScreenFootnote = v9->_lockScreenFootnote;
    v9->_lockScreenFootnote = (NSString *)v10;

    if (v11)
      goto LABEL_7;
    if (!v9->_lockScreenFootnote)
    {
      v29 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("IfLostReturnToMessage"), 0, &v29);
      v15 = objc_claimAutoreleasedReturnValue();
      v11 = v29;
      v16 = v9->_lockScreenFootnote;
      v9->_lockScreenFootnote = (NSString *)v15;

      if (v11)
        goto LABEL_7;
    }
    v28 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("AssetTagInformation"), 0, &v28);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v28;
    assetTagInformation = v9->_assetTagInformation;
    v9->_assetTagInformation = (NSString *)v13;

    if (v11)
    {
LABEL_7:
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = (void *)objc_opt_class();
        v22 = v21;
        objc_msgSend(v18, "MCVerboseDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v21;
        v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      v24 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        -[MCPayload friendlyName](v9, "friendlyName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v8;
        _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSharedDeviceConfigurationPayload lockScreenFootnote](self, "lockScreenFootnote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("LockScreenFootnote"));

  -[MCSharedDeviceConfigurationPayload assetTagInformation](self, "assetTagInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AssetTagInformation"));

  return (NSDictionary *)v3;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSharedDeviceConfigurationPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSharedDeviceConfigurationPayload configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  uint64_t v11;
  MCKeyValue *v12;
  void *v13;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCSharedDeviceConfigurationPayload lockScreenFootnote](self, "lockScreenFootnote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = [MCKeyValue alloc];
    -[MCSharedDeviceConfigurationPayload lockScreenFootnote](self, "lockScreenFootnote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("LOCK_SCREEN_FOOTNOTE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v3, "addObject:", v9);
  }
  -[MCSharedDeviceConfigurationPayload assetTagInformation](self, "assetTagInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = [MCKeyValue alloc];
    -[MCSharedDeviceConfigurationPayload assetTagInformation](self, "assetTagInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("ASSET_TAG_INFORMATION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", v13, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (objc_msgSend(v3, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSString)lockScreenFootnote
{
  return self->_lockScreenFootnote;
}

- (NSString)assetTagInformation
{
  return self->_assetTagInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTagInformation, 0);
  objc_storeStrong((id *)&self->_lockScreenFootnote, 0);
}

@end
