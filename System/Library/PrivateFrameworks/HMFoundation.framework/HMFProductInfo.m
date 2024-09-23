@implementation HMFProductInfo

- (int64_t)productVariant
{
  return self->_productVariant;
}

- (int64_t)productClass
{
  if (self->_productClass >= 0xCuLL)
    return 0;
  else
    return self->_productClass;
}

+ (id)productInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMFProductInfo_productInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED012FC8 != -1)
    dispatch_once(&qword_1ED012FC8, block);
  return (id)_MergedGlobals_3_13;
}

- (int64_t)productPlatform
{
  if (self->_productPlatform >= 6uLL)
    return 0;
  else
    return self->_productPlatform;
}

void __29__HMFProductInfo_productInfo__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[HMFSystemInfo systemInfo](HMFSystemInfo, "systemInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(*(Class *)(a1 + 32));
  v3 = objc_msgSend(v11, "productPlatform");
  v4 = objc_msgSend(v11, "productClass");
  v5 = objc_msgSend(v11, "productVariant");
  objc_msgSend(v11, "softwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "productColor");
  objc_msgSend(v11, "modelIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v2, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", v3, v4, v5, v6, v7, v8);
  v10 = (void *)_MergedGlobals_3_13;
  _MergedGlobals_3_13 = v9;

}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7 modelIdentifier:(id)a8
{
  id v15;
  id v16;
  HMFProductInfo *v17;
  HMFProductInfo *v18;
  objc_super v20;

  v15 = a6;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HMFProductInfo;
  v17 = -[HMFProductInfo init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_productPlatform = a3;
    v17->_productClass = a4;
    v17->_productVariant = a5;
    objc_storeStrong((id *)&v17->_softwareVersion, a6);
    v18->_productColor = a7;
    objc_storeStrong((id *)&v18->_modelIdentifier, a8);
  }

  return v18;
}

- (HMFProductInfo)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5
{
  return -[HMFProductInfo initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:](self, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", a3, a4, 0, a5, 0, 0);
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6
{
  return -[HMFProductInfo initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:](self, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", a3, a4, a5, a6, 0, 0);
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 variant:(int64_t)a5 softwareVersion:(id)a6 color:(int64_t)a7
{
  return -[HMFProductInfo initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:](self, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", a3, a4, a5, a6, a7, 0);
}

- (HMFProductInfo)initWithPlatform:(int64_t)a3 class:(int64_t)a4 softwareVersion:(id)a5 modelIdentifier:(id)a6
{
  return -[HMFProductInfo initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:](self, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", a3, a4, 0, a5, 0, a6);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  unint64_t v4;
  const __CFString *v5;
  HMFAttributeDescription *v6;
  unint64_t v7;
  const __CFString *v8;
  HMFAttributeDescription *v9;
  HMFAttributeDescription *v10;
  unint64_t v11;
  const __CFString *v12;
  HMFAttributeDescription *v13;
  HMFAttributeDescription *v14;
  void *v15;
  void *v16;
  HMFAttributeDescription *v17;
  HMFAttributeDescription *v18;
  void *v19;
  HMFAttributeDescription *v20;
  HMFAttributeDescription *v21;
  void *v22;
  HMFAttributeDescription *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  v4 = -[HMFProductInfo productPlatform](self, "productPlatform") - 1;
  if (v4 > 4)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E3B390A0[v4];
  v26 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Platform"), v5);
  v28[0] = v26;
  v6 = [HMFAttributeDescription alloc];
  v7 = -[HMFProductInfo productClass](self, "productClass") - 1;
  if (v7 > 0xA)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E3B390C8[v7];
  v9 = -[HMFAttributeDescription initWithName:value:](v6, "initWithName:value:", CFSTR("Product Class"), v8, v26, v28[0]);
  v28[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  v11 = -[HMFProductInfo productVariant](self, "productVariant") - 1;
  if (v11 > 2)
    v12 = CFSTR("Customer");
  else
    v12 = off_1E3B39120[v11];
  v13 = -[HMFAttributeDescription initWithName:value:](v10, "initWithName:value:", CFSTR("Product Variant"), v12);
  v28[2] = v13;
  v14 = [HMFAttributeDescription alloc];
  -[HMFProductInfo softwareVersion](self, "softwareVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "versionString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMFAttributeDescription initWithName:value:](v14, "initWithName:value:", CFSTR("Software Version"), v16);
  v28[3] = v17;
  v18 = [HMFAttributeDescription alloc];
  HMFProductColorToString(-[HMFProductInfo productColor](self, "productColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMFAttributeDescription initWithName:value:](v18, "initWithName:value:", CFSTR("Product Color"), v19);
  v28[4] = v20;
  v21 = [HMFAttributeDescription alloc];
  -[HMFProductInfo modelIdentifier](self, "modelIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMFAttributeDescription initWithName:value:](v21, "initWithName:value:", CFSTR("Model Identifier"), v22);
  v28[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFProductInfo softwareVersion](self, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFProductInfo *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMFProductInfo *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    -[HMFProductInfo softwareVersion](self, "softwareVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFProductInfo softwareVersion](v4, "softwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v7)
      goto LABEL_9;
    v8 = -[HMFProductInfo productPlatform](self, "productPlatform");
    if (v8 == -[HMFProductInfo productPlatform](v4, "productPlatform")
      && (v9 = -[HMFProductInfo productClass](self, "productClass"),
          v9 == -[HMFProductInfo productClass](v4, "productClass"))
      && (v10 = -[HMFProductInfo productVariant](self, "productVariant"),
          v10 == -[HMFProductInfo productVariant](v4, "productVariant"))
      && (v11 = -[HMFProductInfo productColor](self, "productColor"),
          v11 == -[HMFProductInfo productColor](v4, "productColor")))
    {
      -[HMFProductInfo modelIdentifier](self, "modelIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFProductInfo modelIdentifier](v4, "modelIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

    }
    else
    {
LABEL_9:
      v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodeSoftwareVersionWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];

  v3 = a3;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("HMF.softwareVersion")))
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.softwareVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HMF.majorVersion"));
    v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HMF.minorVersion"));
    v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HMF.patchVersion"));

    v9[0] = v6;
    v9[1] = v7;
    v9[2] = v8;
    +[HMFSoftwareVersion versionFromOperatingSystemVersion:](HMFSoftwareVersion, "versionFromOperatingSystemVersion:", v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (void)encodeSoftwareVersion:(id)a3 withCoder:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  v5 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HMF.softwareVersion"));
  objc_msgSend(v7, "encodeInteger:forKey:", objc_msgSend(v5, "majorVersion"), CFSTR("HMF.majorVersion"));
  objc_msgSend(v7, "encodeInteger:forKey:", objc_msgSend(v5, "minorVersion"), CFSTR("HMF.minorVersion"));
  v6 = objc_msgSend(v5, "updateVersion");

  objc_msgSend(v7, "encodeInteger:forKey:", v6, CFSTR("HMF.patchVersion"));
}

- (HMFProductInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMFProductInfo *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.platform"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.class"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.variant"));
  +[HMFProductInfo decodeSoftwareVersionWithCoder:](HMFProductInfo, "decodeSoftwareVersionWithCoder:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMF.color"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.modelIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMFProductInfo initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:](self, "initWithPlatform:class:variant:softwareVersion:color:modelIdentifier:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productPlatform](self, "productPlatform"), CFSTR("HMF.platform"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productClass](self, "productClass"), CFSTR("HMF.class"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productVariant](self, "productVariant"), CFSTR("HMF.variant"));
  -[HMFProductInfo softwareVersion](self, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMFProductInfo encodeSoftwareVersion:withCoder:](HMFProductInfo, "encodeSoftwareVersion:withCoder:", v5, v4);

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMFProductInfo productColor](self, "productColor"), CFSTR("HMF.color"));
  -[HMFProductInfo modelIdentifier](self, "modelIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMF.modelIdentifier"));

}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (HMFSoftwareVersion)softwareVersion
{
  return self->_softwareVersion;
}

- (int64_t)productColor
{
  return self->_productColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

@end
