@implementation CHSWidgetDescriptor

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 supportedFamilies:(unint64_t)a6 intentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CHSExtensionIdentity *v16;
  CHSWidgetDescriptor *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:]([CHSExtensionIdentity alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v12, v13, 0);
  v17 = -[CHSWidgetDescriptor initWithExtensionIdentity:kind:supportedFamilies:intentType:](self, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", v16, v14, a6, v15);

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disfavoredLocations, 0);
  objc_storeStrong((id *)&self->_defaultIntentReference, 0);
  objc_storeStrong((id *)&self->_defaultIntentProvider, 0);
  objc_storeStrong((id *)&self->_fetchDefaultIntentCompletions, 0);
  objc_storeStrong((id *)&self->_intentRecommendationsContainer, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CHSWidgetDescriptor *v7;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *widgetDescription;
  uint64_t v12;
  NSData *localeToken;
  uint64_t v14;
  NSString *eventMachServiceName;
  uint64_t v16;
  NSDictionary *disfavoredLocations;
  uint64_t v18;
  CHSIntentRecommendationsContainer *intentRecommendationsContainer;
  void *v20;
  CHSIntentRecommendationsContainer *v21;
  uint64_t v22;
  NSString *nativeContainerBundleIdentifier;

  v4 = a4;
  v6 = a3;
  v7 = -[CHSWidgetDescriptor initWithExtensionIdentity:kind:supportedFamilies:intentType:](self, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", *((_QWORD *)v6 + 1), *((_QWORD *)v6 + 15), *((_QWORD *)v6 + 14), *((_QWORD *)v6 + 16));
  if (v7)
  {
    v8 = objc_msgSend(*((id *)v6 + 3), "copy");
    displayName = v7->super._displayName;
    v7->super._displayName = (NSString *)v8;

    v10 = objc_msgSend(*((id *)v6 + 4), "copy");
    widgetDescription = v7->super._widgetDescription;
    v7->super._widgetDescription = (NSString *)v10;

    v7->_widgetVisibility = *((_QWORD *)v6 + 18);
    v12 = objc_msgSend(*((id *)v6 + 6), "copy");
    localeToken = v7->super._localeToken;
    v7->super._localeToken = (NSData *)v12;

    v14 = objc_msgSend(*((id *)v6 + 5), "copy");
    eventMachServiceName = v7->super._eventMachServiceName;
    v7->super._eventMachServiceName = (NSString *)v14;

    v7->super._preferredBackgroundStyle = *((_QWORD *)v6 + 7);
    v7->super._supportsVibrantContent = *((_BYTE *)v6 + 64);
    v7->_supportsAccentedContent = *((_BYTE *)v6 + 187);
    v7->_supportsInteraction = *((_BYTE *)v6 + 184);
    objc_storeStrong((id *)&v7->super._sdkVersion, *((id *)v6 + 10));
    v7->super._platform = *((_QWORD *)v6 + 11);
    v7->_enablesMultipleTapTargets = *((_BYTE *)v6 + 185);
    v7->_backgroundRemovable = *((_BYTE *)v6 + 186);
    v7->super._version = *((_QWORD *)v6 + 9);
    v16 = objc_msgSend(*((id *)v6 + 22), "copy");
    disfavoredLocations = v7->_disfavoredLocations;
    v7->_disfavoredLocations = (NSDictionary *)v16;

    if (v4)
    {
      v18 = objc_msgSend(*((id *)v6 + 17), "copy");
      intentRecommendationsContainer = v7->_intentRecommendationsContainer;
      v7->_intentRecommendationsContainer = (CHSIntentRecommendationsContainer *)v18;

      v20 = (void *)*((_QWORD *)v6 + 21);
    }
    else
    {
      v21 = v7->_intentRecommendationsContainer;
      v7->_intentRecommendationsContainer = 0;

      v20 = 0;
    }
    objc_storeStrong((id *)&v7->_defaultIntentReference, v20);
    v7->super._hiddenBySensitiveUI = *((_BYTE *)v6 + 96);
    v7->super._promptsForUserConfiguration = *((_BYTE *)v6 + 97);
    v22 = objc_msgSend(*((id *)v6 + 2), "copy");
    nativeContainerBundleIdentifier = v7->super._nativeContainerBundleIdentifier;
    v7->super._nativeContainerBundleIdentifier = (NSString *)v22;

    v7->super._enablement = *((_QWORD *)v6 + 13);
  }

  return v7;
}

- (CHSWidgetDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHSWidgetDescriptor *v13;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  NSString *intentType;
  NSDictionary *v18;
  NSDictionary *disfavoredLocations;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CHSWidgetDescriptor;
  v13 = -[CHSBaseDescriptor initWithExtensionIdentity:](&v21, sel_initWithExtensionIdentity_, v10);
  v13->_supportedFamilies = a5;
  v14 = objc_msgSend(v11, "copy");
  kind = v13->_kind;
  v13->_kind = (NSString *)v14;

  v16 = objc_msgSend(v12, "copy");
  intentType = v13->_intentType;
  v13->_intentType = (NSString *)v16;

  v13->_widgetVisibility = 0;
  v13->_supportsInteraction = 1;
  v13->_backgroundRemovable = 1;
  v13->_supportsAccentedContent = 0;
  v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  disfavoredLocations = v13->_disfavoredLocations;
  v13->_disfavoredLocations = v18;

  return v13;
}

- (id)_initWithDescriptor:(id)a3
{
  return -[CHSWidgetDescriptor initFromDescriptor:includeIntents:](self, "initFromDescriptor:includeIntents:", a3, 1);
}

- (NSString)kind
{
  return self->_kind;
}

- (INIntent)defaultIntent
{
  return -[CHSIntentReference intent](self->_defaultIntentReference, "intent");
}

- (NSArray)intentRecommendations
{
  return -[CHSIntentRecommendationsContainer recommendations](self->_intentRecommendationsContainer, "recommendations");
}

- (id)widgetForFamily:(int64_t)a3 intent:(id)a4
{
  id v6;
  CHSWidget *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (a3)
  {
    if (((1 << a3) & ~-[CHSWidgetDescriptor supportedFamilies](self, "supportedFamilies")) != 0)
    {
      a3 = 0;
    }
    else
    {
      v7 = [CHSWidget alloc];
      -[CHSBaseDescriptor extensionIdentity](self, "extensionIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetDescriptor kind](self, "kind");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](v7, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v8, v9, a3, v6, 0);

    }
  }

  return (id)a3;
}

- (BOOL)isInternal
{
  return self->_widgetVisibility == 1;
}

- (BOOL)matches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CHSBaseDescriptor extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    -[CHSWidgetDescriptor kind](self, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualStrings();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetDescriptor *v4;
  CHSWidgetDescriptor *v5;
  char v6;
  objc_super v8;

  v4 = (CHSWidgetDescriptor *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSWidgetDescriptor;
  if (!-[CHSBaseDescriptor isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_15;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_supportedFamilies == v5->_supportedFamilies
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_widgetVisibility == v5->_widgetVisibility
      && BSEqualBools()
      && BSEqualBools()
      && BSEqualBools())
    {
      v6 = BSEqualBools();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
LABEL_15:
    v6 = 0;
  }
LABEL_19:

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
  unint64_t v16;
  objc_super v18;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetDescriptor;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v18, sel_hash));
  v5 = (id)objc_msgSend(v3, "appendString:", self->_kind);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_supportedFamilies);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_intentType);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_defaultIntentReference);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_intentRecommendationsContainer);
  v10 = (id)objc_msgSend(v3, "appendInteger:", self->_widgetVisibility);
  v11 = (id)objc_msgSend(v3, "appendObject:", self->_disfavoredLocations);
  v12 = (id)objc_msgSend(v3, "appendBool:", self->_enablesMultipleTapTargets);
  v13 = (id)objc_msgSend(v3, "appendBool:", self->_backgroundRemovable);
  v14 = (id)objc_msgSend(v3, "appendBool:", self->_supportsAccentedContent);
  v15 = (id)objc_msgSend(v3, "appendBool:", self->_supportsInteraction);
  v16 = objc_msgSend(v3, "hash");

  return v16;
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  CHSWidgetDescriptor *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CHSWidgetDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

id __49__CHSWidgetDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("kind"));
  v2 = *(void **)(a1 + 32);
  CHSWidgetFamilyMaskDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("supportedFamilies"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168) != 0, CFSTR("hasDefaultIntent"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  CHSWidgetDescriptor *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
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
  id v25;
  _QWORD v26[4];
  id v27;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("extensionIdentity"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("kind"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayName"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("intentType"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), CFSTR("enabled"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("enablement"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("version"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("preferredBackgroundStyle"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("supportsVibrantContent"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 187), CFSTR("supportsAccentedContent"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 185), CFSTR("enablesMultipleTapTargets"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 186), CFSTR("backgroundRemovable"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("supportsInteraction"), 0);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("sdkVersion"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("platform"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168) != 0, CFSTR("hasDefaultIntent"));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 97), CFSTR("promptsForUserConfiguration"), 1);
  v15 = *(void **)(a1 + 32);
  CHSWidgetFamilyMaskDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:", v16, CFSTR("supportedFamilies"));

  v17 = *(void **)(a1 + 32);
  v18 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v26[3] = &unk_1E2A5A3F0;
  v27 = v17;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v26);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("widgetDescription"));
  v19 = *(void **)(a1 + 32);
  CHSDescriptionForWidgetVisibility(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendString:withName:", v20, CFSTR("widgetVisibility"));

  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendString:withName:", v22, CFSTR("localeToken"));

  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendString:withName:", v24, CFSTR("eventMachServiceName"));

  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("intentRecommendations"), 1);
}

void __61__CHSWidgetDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v12, "unsignedIntegerValue");
  v7 = *(void **)(a1 + 32);
  NSStringFromCHSWidgetLocationStyleMask(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  CHSWidgetFamilyDescription(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("disfavoredLocations (%@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, v11);

}

- (id)copyWithoutIntents
{
  return -[CHSWidgetDescriptor initFromDescriptor:includeIntents:]([CHSWidgetDescriptor alloc], "initFromDescriptor:includeIntents:", self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetDescriptor initFromDescriptor:includeIntents:]([CHSMutableWidgetDescriptor alloc], "initFromDescriptor:includeIntents:", self, 1);
}

- (BOOL)hasIntents
{
  BOOL v2;
  void *v3;

  if (self->_defaultIntentReference)
    return 1;
  -[CHSIntentRecommendationsContainer recommendations](self->_intentRecommendationsContainer, "recommendations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CHSWidgetDescriptor;
  -[CHSBaseDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentType, CFSTR("intentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentRecommendationsContainer, CFSTR("intentRecommendationsContainer"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_supportedFamilies, CFSTR("supportedSizeClasses"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_widgetVisibility, CFSTR("widgetVisibility"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disfavoredLocations, CFSTR("unsupLoca"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsInteraction, CFSTR("supportsInteraction"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enablesMultipleTapTargets, CFSTR("enablesMultipleTapTargets"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_backgroundRemovable, CFSTR("backgroundRemovable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsAccentedContent, CFSTR("supportsAccentedContent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultIntentReference, CFSTR("defaultIntent2"));

}

- (CHSWidgetDescriptor)initWithCoder:(id)a3
{
  id v4;
  CHSWidgetDescriptor *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CHSWidgetDescriptor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  int v27;
  char v28;
  CHSIntentReference *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  NSString *intentType;
  uint64_t v40;
  NSString *kind;
  char v43;
  char v44;
  char v45;
  int64_t v46;
  CHSIntentRecommendationsContainer *obj;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CHSWidgetDescriptor;
  v5 = -[CHSBaseDescriptor initWithCoder:](&v50, sel_initWithCoder_, v4);
  if (!v5)
  {
LABEL_44:
    v5 = v5;
    v13 = v5;
    goto LABEL_45;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentType"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedSizeClasses"));
  if (v6)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("intentRecommendationsContainer")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentRecommendationsContainer"));
      obj = (CHSIntentRecommendationsContainer *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v52[0] = objc_opt_class();
      v52[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("intentRecommendations"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "intentReference");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "intent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        obj = -[CHSIntentRecommendationsContainer initWithSchemaIntent:recommendations:]([CHSIntentRecommendationsContainer alloc], "initWithSchemaIntent:recommendations:", v20, v17);
        v5->_didMigrateToRecommendationsContainer = 1;

      }
      else
      {
        obj = 0;
      }

    }
    v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("widgetVisibility"));
    v22 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v21;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("unsupLoca"));
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!v25)
      v25 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v45 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enablesMultipleTapTargets"));
    v26 = -[CHSBaseDescriptor isLinkedOnOrAfter:](v5, "isLinkedOnOrAfter:", 0);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("backgroundRemovable")))
      v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundRemovable"));
    v27 = objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsAccentedContent"));
    v28 = v27;
    if (v27)
      v44 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAccentedContent"));
    else
      v44 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsInteraction")))
      v43 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsInteraction"));
    else
      v43 = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("defaultIntent2")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultIntent2"));
      v29 = (CHSIntentReference *)objc_claimAutoreleasedReturnValue();
LABEL_31:
      v5->_supportedFamilies = v6;
      if (!v5->super._version)
      {
        -[CHSExtensionIdentity extensionBundleIdentifier](v5->super._extensionIdentity, "extensionBundleIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.news.widget"))
          && (objc_msgSend(v49, "isEqualToString:", CFSTR("today")) & 1) != 0)
        {
          v37 = (v5->_supportedFamilies & 0x10) == 0;

          if (!v37)
            v5->_supportedFamilies = v5->_supportedFamilies & 0xFFFFFFFFFFFFFFAFLL | 0x40;
        }
        else
        {

        }
      }
      if (v5->super._extensionIdentity && v49 && v5->_supportedFamilies)
      {
        v38 = objc_msgSend(v48, "copy");
        intentType = v5->_intentType;
        v5->_intentType = (NSString *)v38;

        v40 = objc_msgSend(v49, "copy");
        kind = v5->_kind;
        v5->_kind = (NSString *)v40;

        v5->_widgetVisibility = v46;
        objc_storeStrong((id *)&v5->_disfavoredLocations, v25);
        v5->_enablesMultipleTapTargets = v45;
        v5->_backgroundRemovable = v26;
        v5->_supportsAccentedContent = v44;
        v5->_supportsInteraction = v43;
        objc_storeStrong((id *)&v5->_defaultIntentReference, v29);
        objc_storeStrong((id *)&v5->_intentRecommendationsContainer, obj);
        if ((v28 & 1) == 0)
          -[CHSWidgetDescriptor _evaluateSupportsAccentedContent](v5, "_evaluateSupportsAccentedContent");
      }
      else
      {

        v5 = 0;
      }

      goto LABEL_44;
    }
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("defaultIntent"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v33, 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = 0;
        goto LABEL_29;
      }
      v34 = v33;
    }
    v35 = v34;
    if (v34)
    {
      v29 = -[CHSIntentReference initWithIntent:]([CHSIntentReference alloc], "initWithIntent:", v34);
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    v29 = 0;
    goto LABEL_30;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v53 = *MEMORY[0x1E0CB2D50];
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[CHSBaseDescriptor extensionIdentity](v5, "extensionIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Unable to decode widget descriptor: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.chronoservices.descriptor"), 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v12);

  v13 = 0;
LABEL_45:

  return v13;
}

- (id)_intentDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CHSExtensionIdentity extensionBundleIdentifier](self->super._extensionIdentity, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ - %@]"), v4, self->_intentType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_evaluateSupportsAccentedContent
{
  BOOL v3;

  if (-[CHSBaseDescriptor isLinkedOnOrAfter:](self, "isLinkedOnOrAfter:", 1))
    v3 = self->_supportsAccentedContent || self->_backgroundRemovable;
  else
    v3 = 0;
  self->_supportsAccentedContent = v3;
}

- (BOOL)isTransparent
{
  NSObject *v3;
  unint64_t supportedFamilies;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  CHSLogChronoServices();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CHSWidgetDescriptor isTransparent].cold.1(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  supportedFamilies = self->_supportedFamilies;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CHSWidgetDescriptor_isTransparent__block_invoke;
  v7[3] = &unk_1E2A5A418;
  v7[4] = self;
  v7[5] = &v8;
  CHSWidgetFamilyMaskEnumerateFamilies(supportedFamilies, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__CHSWidgetDescriptor_isTransparent__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isTransparentForFamily:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)isTransparentForFamily:(int64_t)a3
{
  return self->super._preferredBackgroundStyle != 0;
}

- (BOOL)wantsMaterialBackgroundForFamily:(int64_t)a3
{
  return self->super._preferredBackgroundStyle == 2;
}

- (unint64_t)locationsDisfavoredByFamily:(int64_t)a3
{
  NSDictionary *disfavoredLocations;
  void *v4;
  void *v5;
  unint64_t v6;

  disfavoredLocations = self->_disfavoredLocations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](disfavoredLocations, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (unint64_t)disfavoredFamiliesForLocation:(unint64_t)a3
{
  uint64_t v4;
  NSDictionary *disfavoredLocations;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = CHSWidgetLocationStyleMaskFromStyle(a3);
  disfavoredLocations = self->_disfavoredLocations;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CHSWidgetDescriptor_disfavoredFamiliesForLocation___block_invoke;
  v8[3] = &unk_1E2A5A440;
  v8[4] = &v9;
  v8[5] = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](disfavoredLocations, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __53__CHSWidgetDescriptor_disfavoredFamiliesForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "integerValue");
  if ((*(_QWORD *)(a1 + 40) & ~objc_msgSend(v5, "unsignedIntegerValue")) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CHSWidgetFamilyMaskFromWidgetFamily(v6) | v7;
  }

}

- (void)setDefaultIntent:(id)a3
{
  CHSIntentReference *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = -[CHSIntentReference initWithIntent:]([CHSIntentReference alloc], "initWithIntent:", v5);
    -[CHSWidgetDescriptor setDefaultIntentReference:](self, "setDefaultIntentReference:", v4);

  }
  else
  {
    -[CHSWidgetDescriptor setDefaultIntentReference:](self, "setDefaultIntentReference:", 0);
  }

}

- (void)setDefaultIntentReference:(id)a3
{
  CHSIntentReference *v5;
  CHSIntentReference *v6;

  v5 = (CHSIntentReference *)a3;
  if (self->_defaultIntentReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_defaultIntentReference, a3);
    v5 = v6;
  }

}

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 supportedFamilies:(unint64_t)a5 intentType:(id)a6
{
  return -[CHSWidgetDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:", a3, 0, a4, a5, a6);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (unint64_t)supportedFamilies
{
  return self->_supportedFamilies;
}

- (int64_t)widgetVisibility
{
  return self->_widgetVisibility;
}

- (BOOL)enablesMultipleTapTargets
{
  return self->_enablesMultipleTapTargets;
}

- (BOOL)isBackgroundRemovable
{
  return self->_backgroundRemovable;
}

- (BOOL)supportsInteraction
{
  return self->_supportsInteraction;
}

- (CHSIntentReference)defaultIntentReference
{
  return self->_defaultIntentReference;
}

- (NSDictionary)disfavoredLocations
{
  return self->_disfavoredLocations;
}

- (CHSIntentRecommendationsContainer)intentRecommendationsContainer
{
  return self->_intentRecommendationsContainer;
}

- (BOOL)_didMigrateToRecommendationsContainer
{
  return self->_didMigrateToRecommendationsContainer;
}

- (BOOL)supportsAccentedContent
{
  return self->_supportsAccentedContent;
}

- (CHSWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 displayName:(id)a6 intentType:(id)a7 supportedSizeClasses:(unint64_t)a8 widgetDescription:(id)a9 widgetVisibility:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CHSWidgetDescriptor *v22;
  uint64_t v23;
  NSString *displayName;
  uint64_t v25;
  NSString *widgetDescription;
  NSDictionary *v27;
  NSDictionary *disfavoredLocations;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = -[CHSWidgetDescriptor initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:](self, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:supportedFamilies:intentType:", v16, v17, v18, a8, v20);
  if (v22)
  {
    v23 = objc_msgSend(v19, "copy");
    displayName = v22->super._displayName;
    v22->super._displayName = (NSString *)v23;

    v25 = objc_msgSend(v21, "copy");
    widgetDescription = v22->super._widgetDescription;
    v22->super._widgetDescription = (NSString *)v25;

    v22->_widgetVisibility = a10;
    v27 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    disfavoredLocations = v22->_disfavoredLocations;
    v22->_disfavoredLocations = v27;

    v22->_supportsInteraction = 1;
  }

  return v22;
}

- (unint64_t)supportedSizeClasses
{
  return self->_supportedFamilies;
}

- (void)loadDefaultIntent:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSMutableArray *fetchDefaultIntentCompletions;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[CHSWidgetDescriptor defaultIntent](self, "defaultIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    -[CHSWidgetDescriptor intentType](self, "intentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      fetchDefaultIntentCompletions = self->_fetchDefaultIntentCompletions;
      if (fetchDefaultIntentCompletions)
      {
        v8 = (void *)objc_msgSend(v4, "copy");
        v9 = _Block_copy(v8);
        -[NSMutableArray addObject:](fetchDefaultIntentCompletions, "addObject:", v9);

      }
      else
      {
        CHSLogChronoServices();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[CHSWidgetDescriptor _intentDescription](self, "_intentDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, "Begin loading default intent for %{public}@", buf, 0xCu);

        }
        v12 = objc_alloc_init(MEMORY[0x1E0D3E550]);
        -[CHSBaseDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setExtensionBundleIdentifier:", v13);

        objc_msgSend(v12, "setIntentType:", v6);
        v14 = objc_alloc_init(MEMORY[0x1E0D3E548]);
        objc_storeStrong((id *)&self->_defaultIntentProvider, v14);
        v15 = (void *)MEMORY[0x1E0C99DE8];
        v16 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(v15, "arrayWithObject:", v16);
        v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        v18 = self->_fetchDefaultIntentCompletions;
        self->_fetchDefaultIntentCompletions = v17;
        v19 = v17;

        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke;
        v20[3] = &unk_1E2A5A490;
        v20[4] = self;
        objc_msgSend(v14, "provideIntentWithOptions:completionHandler:", v12, v20);

      }
    }
    else
    {
      v4[2](v4, 0);
    }

  }
}

void __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke_2;
  block[3] = &unk_1E2A5A468;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__CHSWidgetDescriptor_Deprecated__loadDefaultIntent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "_intentDescription");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error: %@"), *(_QWORD *)(a1 + 40));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("success");
    }
    *(_DWORD *)buf = 138543618;
    v20 = v3;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Completed loading default intent for %{public}@: %{public}@", buf, 0x16u);
    if (v4)

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = 0;

  objc_msgSend(*(id *)(a1 + 32), "setDefaultIntent:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)matchesPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[CHSBaseDescriptor extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {
    -[CHSWidgetDescriptor kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BSEqualStrings();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyAsCHSAvocadoDescriptor
{
  return -[CHSWidgetDescriptor _initWithDescriptor:]([CHSAvocadoDescriptor alloc], "_initWithDescriptor:", self);
}

- (void)isTransparent
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

@end
