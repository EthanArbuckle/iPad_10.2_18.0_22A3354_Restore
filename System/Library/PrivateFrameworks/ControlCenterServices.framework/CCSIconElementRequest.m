@implementation CCSIconElementRequest

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 size:(unint64_t)a6
{
  id v11;
  id v12;
  CCSIconElementRequest *v13;
  CCSIconElementRequest *v14;
  INIntent *intentConfiguration;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CCSIconElementRequest;
  v13 = -[CCSIconElementRequest init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_elementType = 1;
    intentConfiguration = v13->_intentConfiguration;
    v13->_intent = a3;
    v13->_intentConfiguration = 0;

    objc_storeStrong((id *)&v14->_moduleIdentifier, a4);
    objc_storeStrong((id *)&v14->_containerBundleIdentifier, a5);
    v14->_size = a6;
  }

  return v14;
}

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 moduleSize:(int64_t)a6
{
  id v11;
  id v12;
  CCSIconElementRequest *v13;
  CCSIconElementRequest *v14;
  INIntent *intentConfiguration;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CCSIconElementRequest;
  v13 = -[CCSIconElementRequest init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_elementType = 0;
    intentConfiguration = v13->_intentConfiguration;
    v13->_intent = a3;
    v13->_intentConfiguration = 0;

    objc_storeStrong((id *)&v14->_moduleIdentifier, a4);
    objc_storeStrong((id *)&v14->_containerBundleIdentifier, a5);
    v14->_moduleSize = a6;
  }

  return v14;
}

- (CCSIconElementRequest)initWithIntent:(int64_t)a3 controlKind:(id)a4 controlType:(unint64_t)a5 extensionBundleIdentifier:(id)a6 containerBundleIdentifier:(id)a7 size:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  CCSIconElementRequest *v18;
  CCSIconElementRequest *v19;
  INIntent *intentConfiguration;
  objc_super v22;

  v15 = a4;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CCSIconElementRequest;
  v18 = -[CCSIconElementRequest init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_elementType = 2;
    intentConfiguration = v18->_intentConfiguration;
    v18->_intentConfiguration = 0;

    v19->_intent = a3;
    objc_storeStrong((id *)&v19->_controlKind, a4);
    v19->_controlType = a5;
    objc_storeStrong((id *)&v19->_extensionBundleIdentifier, a6);
    objc_storeStrong((id *)&v19->_containerBundleIdentifier, a7);
    v19->_size = a8;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t intent;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t elementType;
  const __CFString *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  intent = self->_intent;
  if (intent > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_24D460900[intent];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("kCSSIconElementRequestIntent"));
  -[INIntent intentDescription](self->_intentConfiguration, "intentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("kCSSIconElementRequestIntentConfiguration"));

  -[CCSIconElementRequest _controlTypeString:](self, "_controlTypeString:", self->_controlType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("kCSSIconElementRequestControlType"));

  -[CCSIconElementRequest _controlSizeString:](self, "_controlSizeString:", self->_size);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v9, CFSTR("kCSSIconElementRequestSize"));

  NSStringFromCCSModuleSize(self->_moduleSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("kCSSIconElementRequestModuleSize"));

  objc_msgSend(v4, "appendString:withName:", self->_moduleIdentifier, CFSTR("kCSSIconElementRequestModuleIdentifier"));
  objc_msgSend(v4, "appendString:withName:", self->_controlKind, CFSTR("kCSSIconElementRequestControlKind"));
  objc_msgSend(v4, "appendString:withName:", self->_extensionBundleIdentifier, CFSTR("kCSSIconElementRequestExtensionBundleIdentifier"));
  objc_msgSend(v4, "appendString:withName:", self->_containerBundleIdentifier, CFSTR("kCSSIconElementRequestContainerBundleIdentifier"));
  elementType = self->_elementType;
  if (elementType > 2)
    v12 = CFSTR("unknown");
  else
    v12 = off_24D460920[elementType];
  objc_msgSend(v4, "appendString:withName:", v12, CFSTR("kCSSIconElementRequestElementType"));
  objc_msgSend(v4, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CCSIconElementRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CCSIconElementRequest *v9;
  CCSIconElementRequest *v10;
  uint64_t v11;
  void *v12;
  CCSIconElementRequest *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestIntent"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestElementType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestContainerBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v6)
  {
    case 2:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestControlKind"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestIntentConfiguration"));
      v10 = (CCSIconElementRequest *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestControlType"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestExtensionBundleIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CCSIconElementRequest initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:]([CCSIconElementRequest alloc], "initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:", v5, v8, v11, v12, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestSize")));

      -[CCSIconElementRequest setIntentConfiguration:](v13, "setIntentConfiguration:", v10);
      self = v10;
LABEL_8:

      self = v13;
      break;
    case 1:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestModuleIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CCSIconElementRequest initWithIntent:moduleIdentifier:containerBundleIdentifier:size:]([CCSIconElementRequest alloc], "initWithIntent:moduleIdentifier:containerBundleIdentifier:size:", v5, v8, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestSize")));
      goto LABEL_7;
    case 0:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCSSIconElementRequestModuleIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CCSIconElementRequest initWithIntent:moduleIdentifier:containerBundleIdentifier:moduleSize:]([CCSIconElementRequest alloc], "initWithIntent:moduleIdentifier:containerBundleIdentifier:moduleSize:", v5, v8, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCSSIconElementRequestModuleSize")));
LABEL_7:
      v13 = v9;
      goto LABEL_8;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t intent;
  id v5;

  intent = self->_intent;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", intent, CFSTR("kCSSIconElementRequestIntent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentConfiguration, CFSTR("kCSSIconElementRequestIntentConfiguration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_controlType, CFSTR("kCSSIconElementRequestControlType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_size, CFSTR("kCSSIconElementRequestSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_moduleSize, CFSTR("kCSSIconElementRequestModuleSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moduleIdentifier, CFSTR("kCSSIconElementRequestModuleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_controlKind, CFSTR("kCSSIconElementRequestControlKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("kCSSIconElementRequestExtensionBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleIdentifier, CFSTR("kCSSIconElementRequestContainerBundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_elementType, CFSTR("kCSSIconElementRequestElementType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_controlTypeString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("CHSControlTypeUnknown");
  else
    return off_24D460938[a3 - 1];
}

- (id)_controlSizeString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("CHSControlSize1x1");
  else
    return off_24D460950[a3 - 1];
}

- (int64_t)intent
{
  return self->_intent;
}

- (INIntent)intentConfiguration
{
  return self->_intentConfiguration;
}

- (void)setIntentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_intentConfiguration, a3);
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (unint64_t)size
{
  return self->_size;
}

- (int64_t)moduleSize
{
  return self->_moduleSize;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSString)controlKind
{
  return self->_controlKind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_controlKind, 0);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentConfiguration, 0);
}

@end
