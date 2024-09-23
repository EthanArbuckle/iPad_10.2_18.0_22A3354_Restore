@implementation CHSBaseDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdkVersion, 0);
  objc_storeStrong((id *)&self->_localeToken, 0);
  objc_storeStrong((id *)&self->_eventMachServiceName, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_nativeContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

- (id)extensionBundleIdentifier
{
  return -[CHSExtensionIdentity extensionBundleIdentifier](self->_extensionIdentity, "extensionBundleIdentifier");
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (CHSBaseDescriptor)initWithExtensionIdentity:(id)a3
{
  id v4;
  CHSBaseDescriptor *v5;
  uint64_t v6;
  CHSExtensionIdentity *extensionIdentity;
  NSString *nativeContainerBundleIdentifier;
  NSString *sdkVersion;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSData *localeToken;
  id v17;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CHSBaseDescriptor;
  v5 = -[CHSBaseDescriptor init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensionIdentity = v5->_extensionIdentity;
    v5->_extensionIdentity = (CHSExtensionIdentity *)v6;

    nativeContainerBundleIdentifier = v5->_nativeContainerBundleIdentifier;
    v5->_nativeContainerBundleIdentifier = 0;

    sdkVersion = v5->_sdkVersion;
    v5->_sdkVersion = (NSString *)CFSTR("Unknown");

    v5->_platform = CHSCurrentPlatform();
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v10 = (void *)getNSLocaleClass_softClass;
    v23 = getNSLocaleClass_softClass;
    if (!getNSLocaleClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getNSLocaleClass_block_invoke;
      v19[3] = &unk_1E2A5A6E8;
      v19[4] = &v20;
      __getNSLocaleClass_block_invoke((uint64_t)v19);
      v10 = (void *)v21[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v20, 8);
    v17 = 0;
    v12 = (id)objc_msgSend(v11, "archivedPreferencesWithHash:", &v17);
    v13 = v17;
    v14 = objc_msgSend(v13, "copy");
    localeToken = v5->_localeToken;
    v5->_localeToken = (NSData *)v14;

    v5->_version = 1;
    *(_WORD *)&v5->_hiddenBySensitiveUI = 0;
    v5->_enablement = 0;

  }
  return v5;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4;
  CHSBaseDescriptor *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *widgetDescription;
  uint64_t v10;
  NSData *localeToken;
  uint64_t v12;
  NSString *eventMachServiceName;
  uint64_t v14;
  NSString *nativeContainerBundleIdentifier;

  v4 = a3;
  v5 = -[CHSBaseDescriptor initWithExtensionIdentity:](self, "initWithExtensionIdentity:", *((_QWORD *)v4 + 1));
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 3), "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v8 = objc_msgSend(*((id *)v4 + 4), "copy");
    widgetDescription = v5->_widgetDescription;
    v5->_widgetDescription = (NSString *)v8;

    v10 = objc_msgSend(*((id *)v4 + 6), "copy");
    localeToken = v5->_localeToken;
    v5->_localeToken = (NSData *)v10;

    v12 = objc_msgSend(*((id *)v4 + 5), "copy");
    eventMachServiceName = v5->_eventMachServiceName;
    v5->_eventMachServiceName = (NSString *)v12;

    v5->_preferredBackgroundStyle = *((_QWORD *)v4 + 7);
    v5->_supportsVibrantContent = *((_BYTE *)v4 + 64);
    objc_storeStrong((id *)&v5->_sdkVersion, *((id *)v4 + 10));
    v5->_platform = *((_QWORD *)v4 + 11);
    v5->_version = *((_QWORD *)v4 + 9);
    v14 = objc_msgSend(*((id *)v4 + 2), "copy");
    nativeContainerBundleIdentifier = v5->_nativeContainerBundleIdentifier;
    v5->_nativeContainerBundleIdentifier = (NSString *)v14;

    v5->_hiddenBySensitiveUI = *((_BYTE *)v4 + 96);
    v5->_promptsForUserConfiguration = *((_BYTE *)v4 + 97);
    v5->_enablement = *((_QWORD *)v4 + 13);
  }

  return v5;
}

- (BOOL)isLinkedOnOrAfter:(unint64_t)a3
{
  NSString *sdkVersion;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t platform;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  sdkVersion = self->_sdkVersion;
  if (sdkVersion && !-[NSString isEqualToString:](sdkVersion, "isEqualToString:", CFSTR("Unknown")))
  {
    platform = self->_platform;
    if (platform)
    {
      _CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform(a3, platform);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "isVersion:greaterThanOrEqualToVersion:", self->_sdkVersion, v17);

      return v14;
    }
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CHSBaseDescriptor isLinkedOnOrAfter:].cold.2(v6, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CHSBaseDescriptor isLinkedOnOrAfter:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0;
}

- (NSString)effectiveContainerBundleIdentifier
{
  NSString *nativeContainerBundleIdentifier;
  void *v4;
  void *v5;

  nativeContainerBundleIdentifier = self->_nativeContainerBundleIdentifier;
  if (nativeContainerBundleIdentifier)
  {
    v4 = (void *)-[NSString copy](nativeContainerBundleIdentifier, "copy");
  }
  else
  {
    -[CHSExtensionIdentity containerBundleIdentifier](self->_extensionIdentity, "containerBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  return (NSString *)v4;
}

- (BOOL)isInternal
{
  return 0;
}

- (BOOL)hasIntents
{
  return 0;
}

- (BOOL)isEnabled
{
  return self->_enablement < 2;
}

- (BOOL)wasEnablementExplicitlyDeclared
{
  return self->_enablement - 1 < 2;
}

- (BOOL)isEqual:(id)a3
{
  CHSBaseDescriptor *v4;
  CHSBaseDescriptor *v5;
  BOOL v6;

  v4 = (CHSBaseDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = BSEqualBools()
        && self->_platform == v5->_platform
        && self->_version == v5->_version
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualBools()
        && BSEqualBools()
        && self->_preferredBackgroundStyle == v5->_preferredBackgroundStyle
        && self->_enablement == v5->_enablement;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_extensionIdentity);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_nativeContainerBundleIdentifier);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_displayName);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_widgetDescription);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_localeToken);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_eventMachServiceName);
  v10 = (id)objc_msgSend(v3, "appendInteger:", self->_preferredBackgroundStyle);
  v11 = (id)objc_msgSend(v3, "appendBool:", self->_supportsVibrantContent);
  v12 = (id)objc_msgSend(v3, "appendString:", self->_sdkVersion);
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_platform);
  v14 = (id)objc_msgSend(v3, "appendBool:", self->_version != 0);
  v15 = (id)objc_msgSend(v3, "appendBool:", self->_hiddenBySensitiveUI);
  v16 = (id)objc_msgSend(v3, "appendBool:", self->_promptsForUserConfiguration);
  v17 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_enablement);
  v18 = objc_msgSend(v3, "hash");

  return v18;
}

- (NSString)description
{
  return (NSString *)-[CHSBaseDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSBaseDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  CHSBaseDescriptor *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CHSBaseDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

id __47__CHSBaseDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("extensionIdentity"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSBaseDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSBaseDescriptor *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CHSBaseDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __59__CHSBaseDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("extensionIdentity"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("nativeContainerBundleIdentifier"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayName"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("version"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("preferredBackgroundStyle"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("supportsVibrantContent"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("sdkVersion"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("platform"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("widgetDescription"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("localeToken"));

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("eventMachServiceName"));

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("hiddenBySensitiveUI"), 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 97), CFSTR("promptsForUserConfiguration"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), CFSTR("enabled"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("enablement"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSBaseDescriptor.m"), 275, CFSTR("Not implemented - for subclasses to provide."));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_extensionIdentity, CFSTR("extensionIdentity"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nativeContainerBundleIdentifier, CFSTR("nativeCBI"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_widgetDescription, CFSTR("widgetDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localeToken, CFSTR("localeToken"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_eventMachServiceName, CFSTR("eventMachServiceName"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_preferredBackgroundStyle, CFSTR("backgroundStyle"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsVibrantContent, CFSTR("supportsVibrantContent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sdkVersion, CFSTR("sdkVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_platform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("platform"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_version);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("version"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_hiddenBySensitiveUI, CFSTR("hiddenBySensitiveUI"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_promptsForUserConfiguration, CFSTR("promptsForUserConfiguration"));
  objc_msgSend(v6, "encodeInt32:forKey:", LODWORD(self->_enablement), CFSTR("enablement"));

}

- (CHSBaseDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CHSExtensionIdentity *v9;
  void *v10;
  char v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CHSBaseDescriptor *v18;
  void *v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  signed int v28;
  unint64_t v29;
  CHSBaseDescriptor *v30;
  uint64_t v31;
  NSString *displayName;
  uint64_t v33;
  NSString *widgetDescription;
  uint64_t v35;
  NSData *localeToken;
  uint64_t v37;
  NSString *eventMachServiceName;
  uint64_t v39;
  NSString *nativeContainerBundleIdentifier;
  char v42;
  __CFString *obj;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("extensionIdentity")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentity"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v5 = 0;
    if (v6 && v7)
    {
      v9 = [CHSExtensionIdentity alloc];
      getDeviceIDFromBundleID(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v9, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v6, v8, v10);

    }
  }
  v49 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nativeCBI"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetDescription"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeToken"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventMachServiceName"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transparent"));
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backgroundStyle"));
    v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsVibrantContent"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("promptsForUserConfiguration")))
      v42 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("promptsForUserConfiguration"));
    else
      v42 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sdkVersion")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdkVersion"));
      obj = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      obj = CFSTR("Unknown");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("platform")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      v21 = v13;

    }
    else
    {
      v21 = v13;
      v20 = 0;
    }
    v22 = v11 & (v12 == 0);
    if (v22)
      v23 = 2;
    else
      v23 = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");

    v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hiddenBySensitiveUI"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("enablement")))
    {
      v27 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("enablement"));
      if (v27 >= 3)
        v28 = 0;
      else
        v28 = v27;
      v29 = v28;
    }
    else
    {
      v29 = 0;
    }
    v30 = -[CHSBaseDescriptor initWithExtensionIdentity:](self, "initWithExtensionIdentity:", v49);
    v31 = objc_msgSend(v48, "copy");
    displayName = v30->_displayName;
    v30->_displayName = (NSString *)v31;

    v33 = objc_msgSend(v46, "copy");
    widgetDescription = v30->_widgetDescription;
    v30->_widgetDescription = (NSString *)v33;

    v35 = objc_msgSend(v45, "copy");
    localeToken = v30->_localeToken;
    v30->_localeToken = (NSData *)v35;

    v37 = objc_msgSend(v44, "copy");
    eventMachServiceName = v30->_eventMachServiceName;
    v30->_eventMachServiceName = (NSString *)v37;

    v30->_preferredBackgroundStyle = v23;
    v30->_supportsVibrantContent = (v22 | v21) & 1;
    objc_storeStrong((id *)&v30->_sdkVersion, obj);
    v30->_platform = v20;
    v30->_version = v25;
    v39 = objc_msgSend(v47, "copy");
    nativeContainerBundleIdentifier = v30->_nativeContainerBundleIdentifier;
    v30->_nativeContainerBundleIdentifier = (NSString *)v39;

    v30->_hiddenBySensitiveUI = v26;
    v30->_promptsForUserConfiguration = v42;
    v30->_enablement = v29;
    self = v30;

    v18 = self;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode base descriptor: %@"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chronoservices.descriptor"), 1, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v17);

    v18 = 0;
  }

  return v18;
}

- (BOOL)prefersUserConfiguration
{
  return self->_promptsForUserConfiguration;
}

- (id)containerBundleIdentifier
{
  return -[CHSExtensionIdentity containerBundleIdentifier](self->_extensionIdentity, "containerBundleIdentifier");
}

- (id)sourceDeviceIdentifier
{
  return -[CHSExtensionIdentity deviceIdentifier](self->_extensionIdentity, "deviceIdentifier");
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (BOOL)hiddenBySensitiveUI
{
  return self->_hiddenBySensitiveUI;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)nativeContainerBundleIdentifier
{
  return self->_nativeContainerBundleIdentifier;
}

- (NSString)eventMachServiceName
{
  return self->_eventMachServiceName;
}

- (NSData)localeToken
{
  return self->_localeToken;
}

- (NSString)sdkVersion
{
  return self->_sdkVersion;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (BOOL)supportsVibrantContent
{
  return self->_supportsVibrantContent;
}

- (BOOL)promptsForUserConfiguration
{
  return self->_promptsForUserConfiguration;
}

- (unint64_t)enablement
{
  return self->_enablement;
}

- (void)setEnablement:(unint64_t)a3
{
  self->_enablement = a3;
}

- (void)isLinkedOnOrAfter:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isLinkedOnOrAfter:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
