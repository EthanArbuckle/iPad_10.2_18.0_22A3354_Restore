@implementation HFColorPaletteColor

- (HFColorPaletteColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  HFRGBColor *v9;
  double v10;
  double v11;
  double v12;
  HFRGBColor *v13;
  HFColorPaletteColor *v14;

  v9 = [HFRGBColor alloc];
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  v13 = -[HFRGBColor initWithRed:green:blue:](v9, "initWithRed:green:blue:", v10, v11, v12);
  v14 = -[HFColorPaletteColor initWithColorPrimitive:](self, "initWithColorPrimitive:", v13);

  return v14;
}

- (HFColorPaletteColor)initWithUIColor:(id)a3
{
  id v4;
  HFRGBColor *v5;
  HFColorCollection *v6;
  HFColorPaletteColor *v7;

  v4 = a3;
  v5 = -[HFRGBColor initWithUIColor:]([HFRGBColor alloc], "initWithUIColor:", v4);

  v6 = -[HFColorCollection initWithPrimitiveColor:]([HFColorCollection alloc], "initWithPrimitiveColor:", v5);
  v7 = -[HFColorPaletteColor initWithColorCollection:](self, "initWithColorCollection:", v6);

  return v7;
}

- (HFColorPaletteColor)initWithColorValue:(id)a3
{
  id v5;
  HFColorPaletteColor *v6;
  HFColorPaletteColor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFColorPaletteColor;
  v6 = -[HFColorPaletteColor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_colorValue, a3);

  return v7;
}

- (HFColorPaletteColor)initWithColorPrimitive:(id)a3
{
  id v4;
  HFColorCollection *v5;
  HFColorPaletteColor *v6;

  v4 = a3;
  v5 = -[HFColorCollection initWithPrimitiveColor:]([HFColorCollection alloc], "initWithPrimitiveColor:", v4);

  v6 = -[HFColorPaletteColor initWithColorValue:](self, "initWithColorValue:", v5);
  return v6;
}

- (HFColorPaletteColor)initWithNaturalLightColor
{
  HFNaturalLightColor *v3;
  HFColorPaletteColor *v4;

  v3 = objc_alloc_init(HFNaturalLightColor);
  v4 = -[HFColorPaletteColor initWithColorValue:](self, "initWithColorValue:", v3);

  return v4;
}

- (HFColorPaletteColor)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  HFRGBColor *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  HFRGBColor *v24;
  void *v25;
  void *v26;
  id v27;
  HFTemperatureColor *v28;
  HFTemperatureColor *v29;
  HFColorCollection *v30;
  HFColorPaletteColor *v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("g"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("b"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v8 && v11 && v14)
  {
    v15 = [HFRGBColor alloc];
    objc_msgSend(v8, "floatValue");
    v17 = v16;
    objc_msgSend(v11, "floatValue");
    v19 = v18;
    objc_msgSend(v14, "floatValue");
    LODWORD(v21) = v20;
    LODWORD(v22) = v17;
    LODWORD(v23) = v19;
    v24 = -[HFRGBColor initWithRed:green:blue:](v15, "initWithRed:green:blue:", v22, v23, v21);
    objc_msgSend(v5, "addObject:", v24);

  }
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("temp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (v27)
  {
    v28 = [HFTemperatureColor alloc];
    objc_msgSend(v27, "floatValue");
    v29 = -[HFTemperatureColor initWithTemperatureInKelvin:](v28, "initWithTemperatureInKelvin:");
    objc_msgSend(v5, "addObject:", v29);

  }
  if (objc_msgSend(v5, "count"))
  {
    v30 = -[HFColorCollection initWithPrimitiveColors:]([HFColorCollection alloc], "initWithPrimitiveColors:", v5);
    self = -[HFColorPaletteColor initWithColorCollection:](self, "initWithColorCollection:", v30);

    v31 = self;
  }
  else
  {
    NSLog(CFSTR("Could not find any color primitives in serialized color %@!"), v4);
    v31 = 0;
  }

  return v31;
}

- (id)dictionaryRepresentationWithPreferredPaletteType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  id v22;

  v5 = (void *)objc_opt_new();
  objc_opt_class();
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1
      || (objc_msgSend(v8, "temperatureColor"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      objc_msgSend(v8, "RGBColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "red");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("r"));

      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "green");
      objc_msgSend(v13, "numberWithFloat:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("g"));

      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "blue");
      objc_msgSend(v15, "numberWithFloat:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("b"));

    }
    objc_msgSend(v8, "temperatureColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "temperatureColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "temperatureInKelvin");
      objc_msgSend(v18, "numberWithUnsignedInteger:", (unint64_t)v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("temp"));

    }
    v22 = v5;
  }
  else
  {
    NSLog(CFSTR("Only HFColorCollection color values can be serialized."));
    v22 = 0;
  }

  return v22;
}

- (UIColor)UIColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "RGBColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UIColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v7;
}

- (id)colorByAdjustingToColorProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  HFColorPaletteColor *v8;
  HFColorPaletteColor *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_opt_class();
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = self;
  if (v7)
  {
    v9 = [HFColorPaletteColor alloc];
    objc_msgSend(v7, "colorByAdjustingForProfile:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFColorPaletteColor initWithColorCollection:](v9, "initWithColorCollection:", v10);

    v8 = (HFColorPaletteColor *)v11;
  }

  return v8;
}

- (BOOL)isSimilarToColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  v4 = a3;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_14;
  }
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "colorValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = 1;
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_opt_class();
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "RGBColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "colorValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "RGBColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "red");
  v18 = v17;
  objc_msgSend(v16, "red");
  v20 = vabds_f32(v18, v19);
  objc_msgSend(v12, "green");
  v22 = v21;
  objc_msgSend(v16, "green");
  v24 = v20 + vabds_f32(v22, v23);
  objc_msgSend(v12, "blue");
  v26 = v25;
  objc_msgSend(v16, "blue");
  v8 = (float)((float)(v24 + vabds_f32(v26, v27)) / 3.0) <= 0.03;

LABEL_14:
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFColorPaletteColor colorValue](self, "colorValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFColorPaletteColor colorValue](self, "colorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFColorPaletteColor colorValue](self, "colorValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("color"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isNaturalLightColor
{
  void *v2;
  char isKindOfClass;

  -[HFColorPaletteColor colorValue](self, "colorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HFColorCollection)colorCollection
{
  return self->_colorCollection;
}

- (HFColorLikeObject)colorValue
{
  return self->_colorValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorValue, 0);
  objc_storeStrong((id *)&self->_colorCollection, 0);
}

@end
