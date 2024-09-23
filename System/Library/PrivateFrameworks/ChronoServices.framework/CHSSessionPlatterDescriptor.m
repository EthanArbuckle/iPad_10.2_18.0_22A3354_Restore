@implementation CHSSessionPlatterDescriptor

- (CHSSessionPlatterDescriptor)initWithExtensionIdentity:(id)a3 activityAttributesType:(id)a4
{
  id v6;
  id v7;
  CHSSessionPlatterDescriptor *v8;
  uint64_t v9;
  NSData *activityAttributesType;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHSSessionPlatterDescriptor;
  v8 = -[CHSBaseDescriptor initWithExtensionIdentity:](&v12, sel_initWithExtensionIdentity_, v6);
  v9 = objc_msgSend(v7, "copy");
  activityAttributesType = v8->_activityAttributesType;
  v8->_activityAttributesType = (NSData *)v9;

  return v8;
}

- (id)_initWithDescriptor:(id)a3
{
  id v4;
  CHSSessionPlatterDescriptor *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *widgetDescription;
  uint64_t v10;
  NSData *localeToken;
  uint64_t v12;
  NSString *eventMachServiceName;

  v4 = a3;
  v5 = -[CHSSessionPlatterDescriptor initWithExtensionIdentity:activityAttributesType:](self, "initWithExtensionIdentity:activityAttributesType:", *((_QWORD *)v4 + 1), *((_QWORD *)v4 + 14));
  v6 = objc_msgSend(*((id *)v4 + 3), "copy");
  displayName = v5->super._displayName;
  v5->super._displayName = (NSString *)v6;

  v8 = objc_msgSend(*((id *)v4 + 4), "copy");
  widgetDescription = v5->super._widgetDescription;
  v5->super._widgetDescription = (NSString *)v8;

  v10 = objc_msgSend(*((id *)v4 + 6), "copy");
  localeToken = v5->super._localeToken;
  v5->super._localeToken = (NSData *)v10;

  v12 = objc_msgSend(*((id *)v4 + 5), "copy");
  eventMachServiceName = v5->super._eventMachServiceName;
  v5->super._eventMachServiceName = (NSString *)v12;

  v5->super._preferredBackgroundStyle = *((_QWORD *)v4 + 7);
  v5->super._supportsVibrantContent = *((_BYTE *)v4 + 64);
  objc_storeStrong((id *)&v5->super._sdkVersion, *((id *)v4 + 10));
  v5->super._version = *((_QWORD *)v4 + 9);

  return v5;
}

- (id)widgetForFamily:(int64_t)a3 activityIdentifier:(id)a4
{
  id v6;
  CHSWidget *v7;
  void *v8;

  v6 = a4;
  if (a3)
  {
    v7 = [CHSWidget alloc];
    -[CHSBaseDescriptor extensionIdentity](self, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = -[CHSWidget initWithExtensionIdentity:kind:family:intent:activityIdentifier:](v7, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v8, CFSTR("sessionPlatter"), a3, 0, v6);

  }
  return (id)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSData *activityAttributesType;
  id v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHSSessionPlatterDescriptor;
  if (-[CHSBaseDescriptor isEqual:](&v16, sel_isEqual_, v4))
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = v4;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (v10)
    {
      activityAttributesType = self->_activityAttributesType;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __39__CHSSessionPlatterDescriptor_isEqual___block_invoke;
      v14[3] = &unk_1E2A5A268;
      v15 = v10;
      v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", activityAttributesType, v14);
      v9 = objc_msgSend(v5, "isEqual");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __39__CHSSessionPlatterDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CHSSessionPlatterDescriptor;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v8, sel_hash));
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_activityAttributesType);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  return -[CHSSessionPlatterDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSSessionPlatterDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  CHSSessionPlatterDescriptor *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CHSSessionPlatterDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E2A5A290;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", self, v7);
  v5 = v4;

  return v5;
}

uint64_t __57__CHSSessionPlatterDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayName"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSSessionPlatterDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  CHSSessionPlatterDescriptor *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__CHSSessionPlatterDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  return v7;
}

void __69__CHSSessionPlatterDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("extensionIdentity"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("displayName"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("version"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("preferredBackgroundStyle"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("supportsVibrantContent"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("sdkVersion"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("widgetDescription"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "base64EncodedStringWithOptions:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "description");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:");

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSSessionPlatterDescriptor _initWithDescriptor:]([CHSMutableSessionPlatterDescriptor alloc], "_initWithDescriptor:", self);
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
  v5.super_class = (Class)CHSSessionPlatterDescriptor;
  -[CHSBaseDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityAttributesType, CFSTR("activityAttributesType"));

}

- (CHSSessionPlatterDescriptor)initWithCoder:(id)a3
{
  id v4;
  CHSSessionPlatterDescriptor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *activityAttributesType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSSessionPlatterDescriptor;
  v5 = -[CHSBaseDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityAttributesType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "copy");
      activityAttributesType = v5->_activityAttributesType;
      v5->_activityAttributesType = (NSData *)v8;
    }
    else
    {
      activityAttributesType = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (NSData)activityAttributesType
{
  return self->_activityAttributesType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttributesType, 0);
}

@end
