@implementation HMLightProfileSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMLightProfileSettings)initWithSupportedFeatures:(unint64_t)a3 naturalLightingEnabled:(BOOL)a4
{
  HMLightProfileSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMLightProfileSettings;
  result = -[HMLightProfileSettings init](&v7, sel_init);
  if (result)
  {
    result->_naturalLightingEnabled = a4;
    result->_supportedFeatures = a3;
  }
  return result;
}

- (HMLightProfileSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hmlp.sf"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hmlp.nle"));

  return -[HMLightProfileSettings initWithSupportedFeatures:naturalLightingEnabled:](self, "initWithSupportedFeatures:naturalLightingEnabled:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMLightProfileSettings supportedFeatures](self, "supportedFeatures"), CFSTR("hmlp.sf"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMLightProfileSettings isNaturalLightingEnabled](self, "isNaturalLightingEnabled"), CFSTR("hmlp.nle"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  BOOL v8;
  unint64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMLightProfileSettings isNaturalLightingEnabled](self, "isNaturalLightingEnabled"),
        v7 == objc_msgSend(v6, "isNaturalLightingEnabled")))
  {
    v9 = -[HMLightProfileSettings supportedFeatures](self, "supportedFeatures");
    v8 = v9 == objc_msgSend(v6, "supportedFeatures");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (BOOL)isNaturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[HMLightProfileSettings isNaturalLightingEnabled](self, "isNaturalLightingEnabled");
  return -[HMLightProfileSettings supportedFeatures](self, "supportedFeatures") ^ v3;
}

- (NSString)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMLightProfileSettings isNaturalLightingEnabled](self, "isNaturalLightingEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Natural Lighting Enabled"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  HMLightProfileSupportedFeaturesAsString(-[HMLightProfileSettings supportedFeatures](self, "supportedFeatures"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Supported Features"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
