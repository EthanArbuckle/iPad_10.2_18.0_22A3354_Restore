@implementation CLKFullColorSymbolImageProvider

- (CLKFullColorSymbolImageProvider)initWithSystemName:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *symbolImage;
  UIImage *v7;
  CLKFullColorSymbolImageProvider *v8;
  uint64_t v9;
  NSString *systemName;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;

  v7 = self->_symbolImage;
  v13.receiver = self;
  v13.super_class = (Class)CLKFullColorSymbolImageProvider;
  v8 = -[CLKFullColorImageProvider initWithFullColorImage:](&v13, sel_initWithFullColorImage_, v7);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    systemName = v8->_systemName;
    v8->_systemName = (NSString *)v9;

    +[CLKSymbolImageProvider symbolImageProviderWithSystemName:](CLKSymbolImageProvider, "symbolImageProviderWithSystemName:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFullColorImageProvider setTintedImageProvider:](v8, "setTintedImageProvider:", v11);

  }
  return v8;
}

- (id)_initWithSystemName:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *symbolImage;
  UIImage *v7;
  CLKFullColorSymbolImageProvider *v8;
  uint64_t v9;
  NSString *privateSystemName;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v4);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  symbolImage = self->_symbolImage;
  self->_symbolImage = v5;

  v7 = self->_symbolImage;
  v13.receiver = self;
  v13.super_class = (Class)CLKFullColorSymbolImageProvider;
  v8 = -[CLKFullColorImageProvider initWithFullColorImage:](&v13, sel_initWithFullColorImage_, v7);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    privateSystemName = v8->_privateSystemName;
    v8->_privateSystemName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_systemName, v8->_privateSystemName);
    +[CLKSymbolImageProvider _symbolImageProviderWithSystemName:](CLKSymbolImageProvider, "_symbolImageProviderWithSystemName:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFullColorImageProvider setTintedImageProvider:](v8, "setTintedImageProvider:", v11);

  }
  return v8;
}

- (BOOL)_isHierarchicalSymbol
{
  return -[UIImage _isHierarchicalColorSymbolImage](self->_symbolImage, "_isHierarchicalColorSymbolImage");
}

+ (id)symbolImageProviderWithSystemName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSystemName:", v4);

  return v5;
}

+ (id)_symbolImageProviderWithSystemName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSystemName:", v4);

  return v5;
}

- (BOOL)prefersFilterOverTransition
{
  return 0;
}

- (void)setOverridePointSize:(id)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_overridePointSize, a3);
  -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverridePointSize:", v8);

  }
}

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 cornerRadius:(double)a7
{
  double height;
  double width;
  double v10;
  double v11;
  id v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  objc_super v20;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLKFullColorSymbolImageProvider;
  -[CLKFullColorImageProvider finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:](&v20, sel_finalizeWithMaxSDKSize_maxDeviceSize_cornerRadius_, v11, v10, width, height, a7);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
    -[CLKFullColorSymbolImageProvider createSymbolImage](self, "createSymbolImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFullColorImageProvider setImage:](self, "setImage:", v16);

    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:cornerRadius:", v15, a4, v11, v10, width, height, a7);

    }
  }

}

- (void)setIgnoreHierarchicalLayers:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  self->_ignoreHierarchicalLayers = a3;
  -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CLKFullColorImageProvider tintedImageProvider](self, "tintedImageProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIgnoreHierarchicalLayers:", v3);

  }
}

- (id)createSymbolImage
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *pointSize;
  void *v7;
  void *v8;
  void *v9;
  NSString *privateSystemName;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v16;
  UIColor *secondaryTintColor;
  UIColor *v18;
  UIColor *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  if (self->_overridePointSize)
  {
    +[CLKDevice currentDevice](CLKDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSNumber doubleValue](self->_overridePointSize, "doubleValue");
    objc_msgSend(v4, "scaledValue:");
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", self->_weight);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pointSize = self->_pointSize;
    v7 = (void *)MEMORY[0x24BEBD660];
    if (pointSize)
    {
      -[NSNumber doubleValue](pointSize, "doubleValue");
      objc_msgSend(v7, "configurationWithPointSize:weight:", self->_weight);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", self->_weight);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CLKFullColorImageProvider tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && !self->_ignoreHierarchicalLayers)
  {
    v16 = -[CLKFullColorSymbolImageProvider _isHierarchicalSymbol](self, "_isHierarchicalSymbol");

    if (v16)
    {
      secondaryTintColor = self->_secondaryTintColor;
      if (secondaryTintColor)
      {
        v18 = secondaryTintColor;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;
      v20 = (void *)MEMORY[0x24BEBD660];
      v25[0] = v18;
      -[CLKFullColorImageProvider tintColor](self, "tintColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_configurationWithHierarchicalColors:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "configurationByApplyingConfiguration:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v24;
    }
  }
  else
  {

  }
  privateSystemName = self->_privateSystemName;
  if (privateSystemName)
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", privateSystemName, v5);
  else
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", self->_systemName, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKFullColorImageProvider tintColor](self, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v11, "imageWithRenderingMode:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  -[CLKFullColorImageProvider accessibilityLabel](self, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v14);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKFullColorSymbolImageProvider;
  v4 = a3;
  -[CLKFullColorImageProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemName, CFSTR("SystemName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_privateSystemName, CFSTR("PrivateSystemName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pointSize, CFSTR("PointSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overridePointSize, CFSTR("OverridePointSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_weight, CFSTR("Weight"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryTintColor, CFSTR("SecondaryTintColor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoreHierarchicalLayers, CFSTR("IgnoreHierarchicalLayers"));

}

- (CLKFullColorSymbolImageProvider)initWithCoder:(id)a3
{
  id v4;
  CLKFullColorSymbolImageProvider *v5;
  uint64_t v6;
  NSString *systemName;
  uint64_t v8;
  NSString *privateSystemName;
  uint64_t v10;
  NSNumber *pointSize;
  uint64_t v12;
  NSNumber *overridePointSize;
  uint64_t v14;
  UIColor *secondaryTintColor;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CLKFullColorSymbolImageProvider;
  v5 = -[CLKFullColorImageProvider initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SystemName"));
    v6 = objc_claimAutoreleasedReturnValue();
    systemName = v5->_systemName;
    v5->_systemName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivateSystemName"));
    v8 = objc_claimAutoreleasedReturnValue();
    privateSystemName = v5->_privateSystemName;
    v5->_privateSystemName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PointSize"));
    v10 = objc_claimAutoreleasedReturnValue();
    pointSize = v5->_pointSize;
    v5->_pointSize = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OverridePointSize"));
    v12 = objc_claimAutoreleasedReturnValue();
    overridePointSize = v5->_overridePointSize;
    v5->_overridePointSize = (NSNumber *)v12;

    v5->_weight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Weight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondaryTintColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryTintColor = v5->_secondaryTintColor;
    v5->_secondaryTintColor = (UIColor *)v14;

    v5->_ignoreHierarchicalLayers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IgnoreHierarchicalLayers"));
    if (v5->_privateSystemName)
      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:");
    else
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v5->_systemName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v5->_symbolImage, v16);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  BOOL v5;
  objc_super v7;

  v4 = (void **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)CLKFullColorSymbolImageProvider,
        -[CLKFullColorImageProvider isEqual:](&v7, sel_isEqual_, v4))
    && CLKEqualObjects(self->_systemName, v4[14])
    && CLKEqualObjects(self->_privateSystemName, v4[10])
    && CLKEqualObjects(self->_pointSize, v4[15])
    && CLKEqualObjects(self->_overridePointSize, v4[13])
    && (void *)self->_weight == v4[16]
    && CLKEqualObjects(self->_secondaryTintColor, v4[17])
    && self->_ignoreHierarchicalLayers == *((unsigned __int8 *)v4 + 96);

  return v5;
}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLKFullColorSymbolImageProvider;
  v3 = -[CLKFullColorImageProvider hash](&v12, sel_hash);
  v4 = (NSUInteger)v3 + 2 * -[NSString hash](self->_systemName, "hash");
  v5 = v4 + 4 * -[NSNumber hash](self->_pointSize, "hash");
  v6 = v5 + 8 * -[NSNumber hash](self->_overridePointSize, "hash") + 16 * self->_weight;
  v7 = v6 + 32 * -[NSString hash](self->_privateSystemName, "hash");
  v8 = v7 + (-[UIColor hash](self->_secondaryTintColor, "hash") << 6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ignoreHierarchicalLayers);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 + (objc_msgSend(v9, "hash") << 7);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLKFullColorSymbolImageProvider;
  v5 = -[CLKFullColorImageProvider copyWithZone:](&v17, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_systemName, "copyWithZone:", a3);
  v7 = (void *)v5[14];
  v5[14] = v6;

  v8 = -[NSString copyWithZone:](self->_privateSystemName, "copyWithZone:", a3);
  v9 = (void *)v5[10];
  v5[10] = v8;

  v10 = -[NSNumber copyWithZone:](self->_pointSize, "copyWithZone:", a3);
  v11 = (void *)v5[15];
  v5[15] = v10;

  v12 = -[NSNumber copyWithZone:](self->_overridePointSize, "copyWithZone:", a3);
  v13 = (void *)v5[13];
  v5[13] = v12;

  v5[16] = self->_weight;
  v14 = -[UIColor copyWithZone:](self->_secondaryTintColor, "copyWithZone:", a3);
  v15 = (void *)v5[17];
  v5[17] = v14;

  *((_BYTE *)v5 + 96) = self->_ignoreHierarchicalLayers;
  return v5;
}

- (CLKFullColorSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  CLKFullColorSymbolImageProvider *v7;
  uint64_t v8;
  NSString *systemName;
  uint64_t v10;
  NSString *privateSystemName;
  uint64_t v12;
  NSNumber *pointSize;
  uint64_t v14;
  NSNumber *overridePointSize;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  UIColor *secondaryTintColor;
  void *v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CLKFullColorSymbolImageProvider;
  v7 = -[CLKFullColorImageProvider initWithJSONObjectRepresentation:bundle:](&v25, sel_initWithJSONObjectRepresentation_bundle_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SystemName"));
    v8 = objc_claimAutoreleasedReturnValue();
    systemName = v7->_systemName;
    v7->_systemName = (NSString *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrivateSystemName"));
    v10 = objc_claimAutoreleasedReturnValue();
    privateSystemName = v7->_privateSystemName;
    v7->_privateSystemName = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PointSize"));
    v12 = objc_claimAutoreleasedReturnValue();
    pointSize = v7->_pointSize;
    v7->_pointSize = (NSNumber *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OverridePointSize"));
    v14 = objc_claimAutoreleasedReturnValue();
    overridePointSize = v7->_overridePointSize;
    v7->_overridePointSize = (NSNumber *)v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Weight"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_weight = objc_msgSend(v16, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SecondaryTintColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BEBD4B8]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SecondaryTintColor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithJSONObjectRepresentation:", v19);
      secondaryTintColor = v7->_secondaryTintColor;
      v7->_secondaryTintColor = (UIColor *)v20;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IgnoreHierarchicalLayers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_ignoreHierarchicalLayers = objc_msgSend(v22, "BOOLValue");

    if (v7->_privateSystemName)
      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:");
    else
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v7->_systemName);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_symbolImage, v23);

  }
  return v7;
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3
{
  void *v4;
  void *v5;
  NSString *systemName;
  NSString *privateSystemName;
  NSNumber *pointSize;
  NSNumber *overridePointSize;
  void *v10;
  UIColor *secondaryTintColor;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLKFullColorSymbolImageProvider;
  -[CLKFullColorImageProvider JSONObjectRepresentationWritingResourcesToBundlePath:](&v15, sel_JSONObjectRepresentationWritingResourcesToBundlePath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  systemName = self->_systemName;
  if (systemName)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", systemName, CFSTR("SystemName"));
  privateSystemName = self->_privateSystemName;
  if (privateSystemName)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", privateSystemName, CFSTR("PrivateSystemName"));
  pointSize = self->_pointSize;
  if (pointSize)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", pointSize, CFSTR("PointSize"));
  overridePointSize = self->_overridePointSize;
  if (overridePointSize)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", overridePointSize, CFSTR("OverridePointSize"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_weight);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("Weight"));

  secondaryTintColor = self->_secondaryTintColor;
  if (secondaryTintColor)
  {
    -[UIColor JSONObjectRepresentation](secondaryTintColor, "JSONObjectRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("SecondaryTintColor"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ignoreHierarchicalLayers);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("IgnoreHierarchicalLayers"));

  return v5;
}

- (NSNumber)overridePointSize
{
  return self->_overridePointSize;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSNumber)pointSize
{
  return self->_pointSize;
}

- (int64_t)weight
{
  return self->_weight;
}

- (BOOL)ignoreHierarchicalLayers
{
  return self->_ignoreHierarchicalLayers;
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (void)setSecondaryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_pointSize, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_overridePointSize, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_privateSystemName, 0);
}

@end
