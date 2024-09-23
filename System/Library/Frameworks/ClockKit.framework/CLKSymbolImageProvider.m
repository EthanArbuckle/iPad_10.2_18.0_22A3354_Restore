@implementation CLKSymbolImageProvider

- (CLKSymbolImageProvider)initWithSystemName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CLKSymbolImageProvider *v13;
  uint64_t v14;
  NSString *systemName;
  objc_super v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CLKLoggingObjectForDomain(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CLKSymbolImageProvider initWithSystemName:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  self->_hierarchicalSymbol = objc_msgSend(v5, "_isHierarchicalColorSymbolImage");
  v17.receiver = self;
  v17.super_class = (Class)CLKSymbolImageProvider;
  v13 = -[CLKImageProvider initWithOnePieceImage:](&v17, sel_initWithOnePieceImage_, v5);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    systemName = v13->_systemName;
    v13->_systemName = (NSString *)v14;

  }
  return v13;
}

- (id)_initWithSystemName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CLKSymbolImageProvider *v13;
  uint64_t v14;
  NSString *privateSystemName;
  objc_super v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CLKLoggingObjectForDomain(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CLKSymbolImageProvider _initWithSystemName:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  self->_hierarchicalSymbol = objc_msgSend(v5, "_isHierarchicalColorSymbolImage");
  v17.receiver = self;
  v17.super_class = (Class)CLKSymbolImageProvider;
  v13 = -[CLKImageProvider initWithOnePieceImage:](&v17, sel_initWithOnePieceImage_, v5);
  if (v13)
  {
    v14 = objc_msgSend(v4, "copy");
    privateSystemName = v13->_privateSystemName;
    v13->_privateSystemName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_systemName, v13->_privateSystemName);
  }

  return v13;
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

- (void)finalizeWithPointSize:(id)a3 weight:(int64_t)a4 maxSDKSize:(CGSize)a5 maxDeviceSize:(CGSize)a6 maskToCircle:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double v10;
  double v11;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v15 = a3;
  if (!self->_finalized)
  {
    -[CLKSymbolImageProvider createSymbolImage](self, "createSymbolImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKImageProvider setOnePieceImage:](self, "setOnePieceImage:", v16);

    if (-[CLKSymbolImageProvider isTwoPiece](self, "isTwoPiece"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKSymbolImageProvider createSymbolImageForType:color:](self, "createSymbolImageForType:color:", 3, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKImageProvider setTwoPieceImageBackground:](self, "setTwoPieceImageBackground:", v18);

      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKSymbolImageProvider createSymbolImageForType:color:](self, "createSymbolImageForType:color:", 2, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKImageProvider setTwoPieceImageForeground:](self, "setTwoPieceImageForeground:", v20);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CLKSymbolImageProvider;
  -[CLKImageProvider finalizeWithMaxSDKSize:maxDeviceSize:maskToCircle:](&v21, sel_finalizeWithMaxSDKSize_maxDeviceSize_maskToCircle_, v7, v11, v10, width, height);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
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
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v15 = a3;
  if (!self->_finalized)
  {
    -[CLKSymbolImageProvider createSymbolImage](self, "createSymbolImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKImageProvider setOnePieceImage:](self, "setOnePieceImage:", v16);

    if (-[CLKSymbolImageProvider isTwoPiece](self, "isTwoPiece"))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKSymbolImageProvider createSymbolImageForType:color:](self, "createSymbolImageForType:color:", 3, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKImageProvider setTwoPieceImageBackground:](self, "setTwoPieceImageBackground:", v18);

      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKSymbolImageProvider createSymbolImageForType:color:](self, "createSymbolImageForType:color:", 2, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKImageProvider setTwoPieceImageForeground:](self, "setTwoPieceImageForeground:", v20);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)CLKSymbolImageProvider;
  -[CLKImageProvider finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:](&v21, sel_finalizeWithMaxSDKSize_maxDeviceSize_cornerRadius_, v11, v10, width, height, a7);
  if (!self->_finalized)
  {
    self->_finalized = 1;
    objc_storeStrong((id *)&self->_pointSize, a3);
    self->_weight = a4;
  }

}

- (BOOL)isTwoPiece
{
  return self->_hierarchicalSymbol && !self->_ignoreHierarchicalLayers;
}

- (id)_configuration
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *pointSize;
  void *v7;

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
  return v5;
}

- (id)_createSymbolImageWithConfiguration:(id)a3
{
  NSString *privateSystemName;
  void *v6;
  void *v7;

  privateSystemName = self->_privateSystemName;
  if (privateSystemName)
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", privateSystemName, a3);
  else
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", self->_systemName, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKImageProvider accessibilityLabel](self, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  return v6;
}

- (id)_createSymbolImageWithForeground:(id)a3 background:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  CGSize v17;

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[CLKSymbolImageProvider _configuration](self, "_configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBD660];
  v16[0] = v7;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithPaletteColors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "configurationByApplyingConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKSymbolImageProvider _createSymbolImageWithConfiguration:](self, "_createSymbolImageWithConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  objc_msgSend(v13, "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v14;
}

- (id)createSymbolImage
{
  void *v3;
  void *v4;

  -[CLKSymbolImageProvider _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKSymbolImageProvider _createSymbolImageWithConfiguration:](self, "_createSymbolImageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createSymbolImageForType:(int64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  CLKSymbolImageProvider *v8;
  id v9;
  id v10;

  v6 = a4;
  switch(a3)
  {
    case 0:
    case 1:
      -[CLKSymbolImageProvider createSymbolImage](self, "createSymbolImage");
      self = (CLKSymbolImageProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self;
      v9 = v6;
      v10 = v7;
      goto LABEL_5;
    case 3:
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self;
      v9 = v7;
      v10 = v6;
LABEL_5:
      -[CLKSymbolImageProvider _createSymbolImageWithForeground:background:](v8, "_createSymbolImageWithForeground:background:", v9, v10);
      self = (CLKSymbolImageProvider *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return self;
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
  v5.super_class = (Class)CLKSymbolImageProvider;
  v4 = a3;
  -[CLKImageProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemName, CFSTR("SystemName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_privateSystemName, CFSTR("PrivateSystemName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pointSize, CFSTR("PointSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overridePointSize, CFSTR("OverridePointSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_weight, CFSTR("Weight"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryTintColor, CFSTR("SecondaryTintColor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoreHierarchicalLayers, CFSTR("IgnoreHierarchicalLayers"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hierarchicalSymbol, CFSTR("HierarchicalSymbol"));

}

- (CLKSymbolImageProvider)initWithCoder:(id)a3
{
  id v4;
  CLKSymbolImageProvider *v5;
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
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLKSymbolImageProvider;
  v5 = -[CLKImageProvider initWithCoder:](&v17, sel_initWithCoder_, v4);
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
    v5->_hierarchicalSymbol = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HierarchicalSymbol"));
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
        v7.super_class = (Class)CLKSymbolImageProvider,
        -[CLKImageProvider isEqual:](&v7, sel_isEqual_, v4))
    && CLKEqualObjects(self->_systemName, v4[16])
    && CLKEqualObjects(self->_privateSystemName, v4[13])
    && CLKEqualObjects(self->_pointSize, v4[17])
    && CLKEqualObjects(self->_overridePointSize, v4[15])
    && (void *)self->_weight == v4[18]
    && CLKEqualObjects(self->_secondaryTintColor, v4[19])
    && self->_ignoreHierarchicalLayers == *((unsigned __int8 *)v4 + 113);

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
  v12.super_class = (Class)CLKSymbolImageProvider;
  v3 = -[CLKImageProvider hash](&v12, sel_hash);
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
  v17.super_class = (Class)CLKSymbolImageProvider;
  v5 = -[CLKImageProvider copyWithZone:](&v17, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_systemName, "copyWithZone:", a3);
  v7 = (void *)v5[16];
  v5[16] = v6;

  v8 = -[NSString copyWithZone:](self->_privateSystemName, "copyWithZone:", a3);
  v9 = (void *)v5[13];
  v5[13] = v8;

  v10 = -[NSNumber copyWithZone:](self->_pointSize, "copyWithZone:", a3);
  v11 = (void *)v5[17];
  v5[17] = v10;

  v12 = -[NSNumber copyWithZone:](self->_overridePointSize, "copyWithZone:", a3);
  v13 = (void *)v5[15];
  v5[15] = v12;

  v5[18] = self->_weight;
  v14 = -[UIColor copyWithZone:](self->_secondaryTintColor, "copyWithZone:", a3);
  v15 = (void *)v5[19];
  v5[19] = v14;

  *((_BYTE *)v5 + 113) = self->_ignoreHierarchicalLayers;
  *((_BYTE *)v5 + 112) = self->_hierarchicalSymbol;
  return v5;
}

- (CLKSymbolImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v6;
  CLKSymbolImageProvider *v7;
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
  v25.super_class = (Class)CLKSymbolImageProvider;
  v7 = -[CLKImageProvider initWithJSONObjectRepresentation:bundle:](&v25, sel_initWithJSONObjectRepresentation_bundle_, v6, a4);
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

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HierarchicalSymbol"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hierarchicalSymbol = objc_msgSend(v23, "BOOLValue");

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
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLKSymbolImageProvider;
  -[CLKImageProvider JSONObjectRepresentationWritingResourcesToBundlePath:](&v16, sel_JSONObjectRepresentationWritingResourcesToBundlePath_, a3);
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

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hierarchicalSymbol);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("HierarchicalSymbol"));

  return v5;
}

- (NSNumber)overridePointSize
{
  return self->_overridePointSize;
}

- (void)setOverridePointSize:(id)a3
{
  objc_storeStrong((id *)&self->_overridePointSize, a3);
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

- (void)setIgnoreHierarchicalLayers:(BOOL)a3
{
  self->_ignoreHierarchicalLayers = a3;
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
  objc_storeStrong((id *)&self->_privateSystemName, 0);
}

- (void)initWithSystemName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Attempted to create symbol image provider with invalid symbol \"%@\", a5, a6, a7, a8, 2u);
}

- (void)_initWithSystemName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2114F4000, a2, a3, "Attempted to create private symbol image provider with invalid symbol \"%@\", a5, a6, a7, a8, 2u);
}

@end
