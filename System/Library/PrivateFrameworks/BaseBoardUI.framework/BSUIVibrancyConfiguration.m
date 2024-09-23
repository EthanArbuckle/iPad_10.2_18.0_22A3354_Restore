@implementation BSUIVibrancyConfiguration

- (BSUIVibrancyConfiguration)init
{
  void *v3;
  BSUIVibrancyConfiguration *v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:](self, "initWithEffectType:backgroundType:color:", 0, 0, v3);

  return v4;
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5
{
  return -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](self, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", a3, a4, a5, 0, 0, 0, 0.0);
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6
{
  return -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](self, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", a3, a4, a5, a6, 0, 0, 0.0);
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6 blendConfiguration:(id)a7 blendAmount:(double)a8 alternativeVibrancyEffectLUT:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  BSUIVibrancyConfiguration *v20;
  BSUIVibrancyConfiguration *v21;
  uint64_t v22;
  UIColor *color;
  uint64_t v24;
  NSString *groupName;
  uint64_t v26;
  BSUIVibrancyConfiguration *blendConfiguration;
  uint64_t v28;
  BSUIVibrancyLUT *alternativeVibrancyEffectLUT;
  objc_super v31;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)BSUIVibrancyConfiguration;
  v20 = -[BSUIVibrancyConfiguration init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_effectType = a3;
    v20->_backgroundType = a4;
    v22 = objc_msgSend(v16, "copy");
    color = v21->_color;
    v21->_color = (UIColor *)v22;

    v24 = objc_msgSend(v17, "copy");
    groupName = v21->_groupName;
    v21->_groupName = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    blendConfiguration = v21->_blendConfiguration;
    v21->_blendConfiguration = (BSUIVibrancyConfiguration *)v26;

    v21->_blendAmount = a8;
    v28 = objc_msgSend(v19, "copy");
    alternativeVibrancyEffectLUT = v21->_alternativeVibrancyEffectLUT;
    v21->_alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)v28;

  }
  return v21;
}

- (id)copyWithGroupName:(id)a3
{
  id v4;
  BSUIVibrancyConfiguration *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  BSUIVibrancyConfiguration *v13;

  v4 = a3;
  v5 = [BSUIVibrancyConfiguration alloc];
  v6 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  v7 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v11 = v10;
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v5, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v6, v7, v8, v4, v9, v12, v11);

  return v13;
}

- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4
{
  id v6;
  BSUIVibrancyConfiguration *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BSUIVibrancyConfiguration *v13;

  v6 = a4;
  v7 = [BSUIVibrancyConfiguration alloc];
  v8 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  v9 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration color](self, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v7, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v8, v9, v10, v11, v6, v12, a3);

  return v13;
}

- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4 alternativeVibrancyEffectLUT:(id)a5
{
  id v8;
  id v9;
  BSUIVibrancyConfiguration *v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  BSUIVibrancyConfiguration *v15;

  v8 = a4;
  v9 = a5;
  v10 = [BSUIVibrancyConfiguration alloc];
  v11 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  v12 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration color](self, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v10, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v11, v12, v13, v14, v8, v9, a3);

  return v15;
}

- (id)copyWithEffectType:(int64_t)a3 color:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BSUIVibrancyConfiguration *v10;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  BSUIVibrancyConfiguration *v16;

  v6 = a4;
  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithEffectType:color:", a3, v6);

  }
  else
  {
    v9 = 0;
  }
  v10 = [BSUIVibrancyConfiguration alloc];
  v11 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v14 = v13;
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v10, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", a3, v11, v6, v12, v9, v15, v14);

  return v16;
}

- (id)copyWithWithBackgroundType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BSUIVibrancyConfiguration *v8;
  int64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  BSUIVibrancyConfiguration *v15;

  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithWithBackgroundType:", a3);

  }
  else
  {
    v7 = 0;
  }
  v8 = [BSUIVibrancyConfiguration alloc];
  v9 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  -[BSUIVibrancyConfiguration color](self, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v13 = v12;
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v8, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v9, a3, v10, v11, v7, v14, v13);

  return v15;
}

- (id)copyWithAlternativeVibrancyEffectLUT:(id)a3
{
  id v4;
  BSUIVibrancyConfiguration *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BSUIVibrancyConfiguration *v11;

  v4 = a3;
  v5 = [BSUIVibrancyConfiguration alloc];
  v6 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  v7 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v11 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v5, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v6, v7, v8, v9, v10, v4);

  return v11;
}

- (BSUIVibrancyEffectValues)effectValues
{
  BSUIVibrancyConfiguration *v2;
  BSUIVibrancyEffectValues *effectValues;
  BSUIVibrancyEffectValues *v4;
  BSUIVibrancyEffectValues *v5;
  BSUIVibrancyEffectValues *v6;

  v2 = self;
  objc_sync_enter(v2);
  effectValues = v2->_effectValues;
  if (!effectValues)
  {
    v4 = -[BSUIVibrancyValues initWithConfiguration:]([BSUIVibrancyEffectValues alloc], "initWithConfiguration:", v2);
    v5 = v2->_effectValues;
    v2->_effectValues = v4;

    effectValues = v2->_effectValues;
  }
  v6 = effectValues;
  objc_sync_exit(v2);

  return v6;
}

- (BSUIVibrancyShadowValues)shadowValues
{
  BSUIVibrancyConfiguration *v2;
  BSUIVibrancyShadowValues *shadowValues;
  BSUIVibrancyShadowValues *v4;
  BSUIVibrancyShadowValues *v5;
  BSUIVibrancyShadowValues *v6;

  v2 = self;
  objc_sync_enter(v2);
  shadowValues = v2->_shadowValues;
  if (!shadowValues)
  {
    v4 = -[BSUIVibrancyValues initWithConfiguration:]([BSUIVibrancyShadowValues alloc], "initWithConfiguration:", v2);
    v5 = v2->_shadowValues;
    v2->_shadowValues = v4;

    shadowValues = v2->_shadowValues;
  }
  v6 = shadowValues;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BSUIVibrancyConfiguration *v4;
  BSUIVibrancyConfiguration *v5;
  BSUIVibrancyConfiguration *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  char v25;

  v4 = (BSUIVibrancyConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_10;
    -[BSUIVibrancyConfiguration color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyConfiguration color](v6, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (!v11)
      goto LABEL_10;
    -[BSUIVibrancyConfiguration groupName](self, "groupName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyConfiguration groupName](v6, "groupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualObjects();

    if (!v14)
      goto LABEL_10;
    v15 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
    if (v15 != -[BSUIVibrancyConfiguration effectType](v6, "effectType"))
      goto LABEL_10;
    v16 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
    if (v16 != -[BSUIVibrancyConfiguration backgroundType](v6, "backgroundType"))
      goto LABEL_10;
    -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIVibrancyConfiguration blendConfiguration](v6, "blendConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = BSEqualObjects();

    if (!v19)
      goto LABEL_10;
    -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
    v21 = v20;
    -[BSUIVibrancyConfiguration blendAmount](v6, "blendAmount");
    if (v21 == v22)
    {
      -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](v6, "alternativeVibrancyEffectLUT");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = BSEqualObjects();

    }
    else
    {
LABEL_10:
      v25 = 0;
    }

  }
  return v25;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  -[BSUIVibrancyConfiguration color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v7 = -[BSUIVibrancyConfiguration effectType](self, "effectType");
  v8 = -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType");
  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v12 = v11;
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  v15 = v7 - (v6 - v4 + 32 * v4) + 32 * (v6 - v4 + 32 * v4);
  v16 = (unint64_t)((double)(unint64_t)(31 * (v10 - (v8 - v15 + 32 * v15) + 32 * (v8 - v15 + 32 * v15))
                                                    + 887503681)
                         + v12 * 100.0);
  v17 = v14 - v16 + 32 * v16;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double blendAmount;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", self->_effectType, CFSTR("effectType"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_backgroundType, CFSTR("backgroundType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blendConfiguration, CFSTR("blendConfiguration"));
  blendAmount = self->_blendAmount;
  *(float *)&blendAmount = blendAmount;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("blendAmount"), blendAmount);
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeVibrancyEffectLUT, CFSTR("alternativeVibrancyEffectLUT"));

}

- (BSUIVibrancyConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  BSUIVibrancyConfiguration *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("effectType"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("backgroundType"));
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("groupName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("blendConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("blendAmount"));
  v14 = v13;
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("alternativeVibrancyEffectLUT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](self, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v5, v6, v8, v10, v12, v16, v14);
  return v17;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_effectType, CFSTR("effectType"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_backgroundType, CFSTR("backgroundType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendConfiguration, CFSTR("blendConfiguration"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("blendAmount"), self->_blendAmount);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternativeVibrancyEffectLUT, CFSTR("alternativeVibrancyEffectLUT"));

}

- (BSUIVibrancyConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  BSUIVibrancyConfiguration *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("effectType"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("backgroundType"));
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("color"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("groupName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("blendConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blendAmount"));
  v14 = v13;
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("alternativeVibrancyEffectLUT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](self, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v5, v6, v8, v10, v12, v16, v14);
  return v17;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = (id)objc_msgSend(v15, "appendInt64:withName:", -[BSUIVibrancyConfiguration effectType](self, "effectType"), CFSTR("effectType"));
  v5 = (id)objc_msgSend(v15, "appendInt64:withName:", -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType"), CFSTR("backgroundType"));
  -[BSUIVibrancyConfiguration color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v15, "appendObject:withName:", v6, CFSTR("color"));

  -[BSUIVibrancyConfiguration groupName](self, "groupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v15, "appendObject:withName:", v8, CFSTR("groupName"));

  -[BSUIVibrancyConfiguration blendConfiguration](self, "blendConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v15, "appendObject:withName:", v10, CFSTR("blendConfiguration"));

  -[BSUIVibrancyConfiguration blendAmount](self, "blendAmount");
  v12 = (id)objc_msgSend(v15, "appendFloat:withName:", CFSTR("blendAmount"));
  -[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self, "alternativeVibrancyEffectLUT");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v15, "appendObject:withName:", v13, CFSTR("alternativeVibrancyEffectLUT"));

}

- (UIColor)color
{
  return self->_color;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (BSUIVibrancyConfiguration)blendConfiguration
{
  return self->_blendConfiguration;
}

- (double)blendAmount
{
  return self->_blendAmount;
}

- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT
{
  return self->_alternativeVibrancyEffectLUT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, 0);
  objc_storeStrong((id *)&self->_blendConfiguration, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_effectValues, 0);
  objc_storeStrong((id *)&self->_shadowValues, 0);
}

@end
