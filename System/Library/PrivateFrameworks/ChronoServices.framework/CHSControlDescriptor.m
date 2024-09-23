@implementation CHSControlDescriptor

- (CHSControlDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 controlType:(unint64_t)a5 intentType:(id)a6
{
  id v10;
  id v11;
  id v12;
  CHSControlDescriptor *v13;
  CHSControlDescriptor *v14;
  uint64_t v15;
  NSString *kind;
  uint64_t v17;
  NSString *intentType;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CHSControlDescriptor;
  v13 = -[CHSBaseDescriptor initWithExtensionIdentity:](&v20, sel_initWithExtensionIdentity_, v10);
  v14 = v13;
  if (v13)
  {
    v13->_controlType = a5;
    v15 = objc_msgSend(v11, "copy");
    kind = v14->_kind;
    v14->_kind = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    intentType = v14->_intentType;
    v14->_intentType = (NSString *)v17;

    v14->_visibility = 0;
    v14->_controlVersion = 1;
  }

  return v14;
}

- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CHSControlDescriptor *v7;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *widgetDescription;
  uint64_t v12;
  NSData *localeToken;
  uint64_t v14;
  NSString *eventMachServiceName;
  uint64_t v16;
  CHSControlActionMetadata *actionMetadata;
  void *v18;
  uint64_t v19;
  NSString *nativeContainerBundleIdentifier;

  v4 = a4;
  v6 = a3;
  v7 = -[CHSControlDescriptor initWithExtensionIdentity:kind:controlType:intentType:](self, "initWithExtensionIdentity:kind:controlType:intentType:", *((_QWORD *)v6 + 1), *((_QWORD *)v6 + 14), *((_QWORD *)v6 + 16), *((_QWORD *)v6 + 15));
  if (v7)
  {
    v8 = objc_msgSend(*((id *)v6 + 3), "copy");
    displayName = v7->super._displayName;
    v7->super._displayName = (NSString *)v8;

    v10 = objc_msgSend(*((id *)v6 + 4), "copy");
    widgetDescription = v7->super._widgetDescription;
    v7->super._widgetDescription = (NSString *)v10;

    v7->_visibility = *((_QWORD *)v6 + 19);
    v12 = objc_msgSend(*((id *)v6 + 6), "copy");
    localeToken = v7->super._localeToken;
    v7->super._localeToken = (NSData *)v12;

    v14 = objc_msgSend(*((id *)v6 + 5), "copy");
    eventMachServiceName = v7->super._eventMachServiceName;
    v7->super._eventMachServiceName = (NSString *)v14;

    objc_storeStrong((id *)&v7->super._sdkVersion, *((id *)v6 + 10));
    v16 = objc_msgSend(*((id *)v6 + 23), "copy");
    actionMetadata = v7->_actionMetadata;
    v7->_actionMetadata = (CHSControlActionMetadata *)v16;

    v7->_hiddenControl = *((_BYTE *)v6 + 160);
    v7->_showsContextualMenu = *((_BYTE *)v6 + 161);
    v7->_disablesControlStateCaching = *((_BYTE *)v6 + 162);
    v7->super._platform = *((_QWORD *)v6 + 11);
    v7->super._version = *((_QWORD *)v6 + 9);
    if (v4)
      v18 = (void *)*((_QWORD *)v6 + 22);
    else
      v18 = 0;
    objc_storeStrong((id *)&v7->_defaultIntentReference, v18);
    v7->super._hiddenBySensitiveUI = *((_BYTE *)v6 + 96);
    v19 = objc_msgSend(*((id *)v6 + 2), "copy");
    nativeContainerBundleIdentifier = v7->super._nativeContainerBundleIdentifier;
    v7->super._nativeContainerBundleIdentifier = (NSString *)v19;

    v7->_preferredControlSize = *((_QWORD *)v6 + 17);
    v7->_supportsPush = *((_BYTE *)v6 + 144);
    v7->super._promptsForUserConfiguration = *((_BYTE *)v6 + 97);
    v7->super._enablement = *((_QWORD *)v6 + 13);
    v7->_controlVersion = *((_QWORD *)v6 + 21);
  }

  return v7;
}

- (CHSControlActionMetadata)actionMetadata
{
  CHSControlActionMetadata *actionMetadata;
  CHSControlActionMetadata *v4;
  CHSControlActionMetadata *v5;

  actionMetadata = self->_actionMetadata;
  if (!actionMetadata)
  {
    v4 = -[CHSControlActionMetadata initWithIntentType:]([CHSControlActionMetadata alloc], "initWithIntentType:", 0);
    v5 = self->_actionMetadata;
    self->_actionMetadata = v4;

    actionMetadata = self->_actionMetadata;
  }
  return actionMetadata;
}

- (NSString)actionIntentType
{
  return -[CHSControlActionMetadata intentType](self->_actionMetadata, "intentType");
}

- (BOOL)isInternal
{
  return self->_visibility == 1;
}

- (BOOL)hasIntents
{
  return self->_defaultIntentReference != 0;
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
    -[CHSControlDescriptor kind](self, "kind");
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
  CHSControlDescriptor *v4;
  CHSControlDescriptor *v5;
  char v6;
  objc_super v8;

  v4 = (CHSControlDescriptor *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSControlDescriptor;
  if (!-[CHSBaseDescriptor isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_16;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (BSEqualObjects()
      && self->_controlType == v5->_controlType
      && self->_preferredControlSize == v5->_preferredControlSize
      && self->_supportsPush == v5->_supportsPush
      && self->_controlVersion == v5->_controlVersion
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_hiddenControl == v5->_hiddenControl
      && self->_showsContextualMenu == v5->_showsContextualMenu
      && self->_disablesControlStateCaching == v5->_disablesControlStateCaching
      && self->_visibility == v5->_visibility)
    {
      v6 = BSEqualObjects();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
LABEL_16:
    v6 = 0;
  }
LABEL_20:

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
  unint64_t v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)CHSControlDescriptor;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v19, sel_hash));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_controlType);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_preferredControlSize);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_supportsPush);
  v8 = (id)objc_msgSend(v3, "appendString:", self->_kind);
  v9 = (id)objc_msgSend(v3, "appendString:", self->_intentType);
  v10 = (id)objc_msgSend(v3, "appendObject:", self->_defaultIntentReference);
  v11 = (id)objc_msgSend(v3, "appendInt64:", self->_controlVersion);
  v12 = (id)objc_msgSend(v3, "appendInteger:", self->_visibility);
  v13 = (id)objc_msgSend(v3, "appendBool:", self->_hiddenControl);
  v14 = (id)objc_msgSend(v3, "appendBool:", self->_showsContextualMenu);
  v15 = (id)objc_msgSend(v3, "appendBool:", self->_disablesControlStateCaching);
  v16 = (id)objc_msgSend(v3, "appendObject:", self->_actionMetadata);
  v17 = objc_msgSend(v3, "hash");

  return v17;
}

- (id)description
{
  return -[CHSControlDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSControlDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  CHSControlDescriptor *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CHSControlDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

void __50__CHSControlDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("kind"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("type"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("intentType"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) != 0, CFSTR("hasDefaultIntent"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "succinctDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:");

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSControlDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  CHSControlDescriptor *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CHSControlDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

id __62__CHSControlDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("baseVersion"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168), CFSTR("controlVersion"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("extensionIdentity"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("kind"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("type"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayName"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("intentType"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), CFSTR("enabled"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("enablement"));
  v8 = *(void **)(a1 + 32);
  NSStringFromCHSControlSize(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("preferredControlSize"));

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("supportsPush"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("sdkVersion"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 160), CFSTR("isHidden"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 161), CFSTR("showsContextMenu"), 1);
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 162), CFSTR("cachingDisabled"));
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "succinctDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "appendObject:withName:", v15, CFSTR("actionMetadata"));

  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("platform"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) != 0, CFSTR("hasDefaultIntent"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("widgetDescription"));
  v19 = *(void **)(a1 + 32);
  CHSDescriptionForWidgetVisibility(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
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

  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 97), CFSTR("promptsForUserConfiguration"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) != 0, CFSTR("isApple"));
}

- (id)copyWithoutIntents
{
  return -[CHSControlDescriptor initFromDescriptor:includeIntents:]([CHSControlDescriptor alloc], "initFromDescriptor:includeIntents:", self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSControlDescriptor initFromDescriptor:includeIntents:]([CHSMutableControlDescriptor alloc], "initFromDescriptor:includeIntents:", self, 1);
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
  v5.super_class = (Class)CHSControlDescriptor;
  -[CHSBaseDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_controlType, CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preferredControlSize, CFSTR("size"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsPush, CFSTR("supportsPush"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentType, CFSTR("intentType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_visibility, CFSTR("widgetVisibility"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultIntentReference, CFSTR("defaultIntentRef"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hiddenControl, CFSTR("hiddenControl"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsContextualMenu, CFSTR("showContextualMenu"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disablesControlStateCaching, CFSTR("disablesControlStateCaching"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionMetadata, CFSTR("actionMetadata"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_controlVersion, CFSTR("controlVersion"));

}

- (CHSControlDescriptor)initWithCoder:(id)a3
{
  id v4;
  CHSControlDescriptor *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  CHSMutableControlActionMetadata *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *intentType;
  uint64_t v18;
  NSString *kind;
  uint64_t v20;
  CHSControlActionMetadata *actionMetadata;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CHSControlDescriptor;
  v5 = -[CHSBaseDescriptor initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
    v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsPush"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("widgetVisibility"));
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hiddenControl"));
    v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showContextualMenu"));
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disablesControlStateCaching"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionMetadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIntentType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[CHSControlActionMetadata initWithIntentType:]([CHSMutableControlActionMetadata alloc], "initWithIntentType:", v12);
        v11 = (void *)-[CHSMutableControlActionMetadata copy](v13, "copy");

      }
      else
      {
        v11 = 0;
      }

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("controlVersion")))
      v14 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("controlVersion"));
    else
      v14 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("defaultIntentRef")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultIntentRef"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    if (v5->super._extensionIdentity && v6)
    {
      v16 = objc_msgSend(v26, "copy");
      intentType = v5->_intentType;
      v5->_intentType = (NSString *)v16;

      v18 = objc_msgSend(v6, "copy");
      kind = v5->_kind;
      v5->_kind = (NSString *)v18;

      v5->_controlType = v25;
      v5->_preferredControlSize = v24;
      v5->_supportsPush = v23;
      v5->_visibility = v7;
      objc_storeStrong((id *)&v5->_defaultIntentReference, v15);
      v5->_hiddenControl = v8;
      v5->_showsContextualMenu = v9;
      v5->_disablesControlStateCaching = v10;
      v20 = objc_msgSend(v11, "copy");
      actionMetadata = v5->_actionMetadata;
      v5->_actionMetadata = (CHSControlActionMetadata *)v20;

      v5->_controlVersion = v14;
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
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

- (NSString)kind
{
  return self->_kind;
}

- (NSString)intentType
{
  return self->_intentType;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (CHSIntentReference)defaultIntentReference
{
  return self->_defaultIntentReference;
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (unint64_t)preferredControlSize
{
  return self->_preferredControlSize;
}

- (BOOL)supportsPush
{
  return self->_supportsPush;
}

- (unint64_t)controlVersion
{
  return self->_controlVersion;
}

- (BOOL)showsContextualMenu
{
  return self->_showsContextualMenu;
}

- (BOOL)hiddenControl
{
  return self->_hiddenControl;
}

- (BOOL)disablesControlStateCaching
{
  return self->_disablesControlStateCaching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_defaultIntentReference, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
