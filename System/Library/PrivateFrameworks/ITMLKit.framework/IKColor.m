@implementation IKColor

+ (id)colorMap
{
  if (colorMap_onceToken != -1)
    dispatch_once(&colorMap_onceToken, &__block_literal_global_18);
  return (id)colorMap_sCSSColorNameMap;
}

+ (void)registerColorNameMap:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "colorMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);

}

void __19__IKColor_colorMap__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)colorMap_sCSSColorNameMap;
  colorMap_sCSSColorNameMap = (uint64_t)v0;

  v21 = (void *)colorMap_sCSSColorNameMap;
  v20 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.75, 0.75, 0.75, 1.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.5, 0.0, 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.5, 0.0, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.0, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.5, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.5, 0.5, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPurpleColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBrownColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "placeholderTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "opaqueSeparatorColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "quaternarySystemFillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray4Color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray5Color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray6Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v56, CFSTR("black"), v55, CFSTR("silver"), v46, CFSTR("gray"), v54, CFSTR("white"), v43, CFSTR("maroon"), v53, CFSTR("red"), v39, CFSTR("purple"), v52, CFSTR("fuchsia"), v51,
    CFSTR("green"),
    v50,
    CFSTR("lime"),
    v49,
    CFSTR("olive"),
    v33,
    CFSTR("yellow"),
    v48,
    CFSTR("navy"),
    v47,
    CFSTR("blue"),
    v45,
    CFSTR("teal"),
    v44,
    CFSTR("aqua"),
    v42,
    CFSTR("transparent"),
    v41,
    CFSTR("systemred"),
    v40,
    CFSTR("systemgreen"),
    v38,
    CFSTR("systemblue"),
    v37,
    CFSTR("systemorange"),
    v36,
    CFSTR("systemyellow"),
    v35,
    CFSTR("systempink"),
    v28,
    CFSTR("systempurple"),
    v34,
    CFSTR("systemgray"),
    v32,
    CFSTR("systembrown"),
    v31,
    CFSTR("systemteal"),
    v30,
    CFSTR("systemindigo"),
    v29,
    CFSTR("label"),
    v27,
    CFSTR("secondarylabel"),
    v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addEntriesFromDictionary:", v4);

}

- (IKColor)initWithColorMapKey:(id)a3
{
  id v4;
  IKColor *v5;
  uint64_t v6;
  NSString *colorMapKey;

  v4 = a3;
  v5 = -[IKColor initWithColor:](self, "initWithColor:", 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    colorMapKey = v5->_colorMapKey;
    v5->_colorMapKey = (NSString *)v6;

  }
  return v5;
}

- (IKColor)initWithColor:(id)a3
{
  id v5;
  IKColor *v6;
  IKColor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKColor;
  v6 = -[IKColor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (void)setColorMapKey:(id)a3
{
  NSString *v4;
  NSString *colorMapKey;
  UIColor *color;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_colorMapKey, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    colorMapKey = self->_colorMapKey;
    self->_colorMapKey = v4;

    color = self->_color;
    self->_color = 0;

  }
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  NSString *colorMapKey;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    colorMapKey = self->_colorMapKey;
    self->_colorMapKey = 0;

    v5 = v7;
  }

}

- (UIColor)color
{
  void *v3;
  UIColor *v4;

  if (self->_colorMapKey)
  {
    objc_msgSend((id)objc_opt_class(), "colorMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", self->_colorMapKey);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_color;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[UIColor copyWithZone:](self->_color, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 48), self->_colorMapKey);
  *(_QWORD *)(v5 + 24) = self->_colorType;
  *(_QWORD *)(v5 + 32) = self->_gradientType;
  v8 = -[NSArray copyWithZone:](self->_gradientPoints, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  *(_QWORD *)(v5 + 40) = self->_gradientDirectionType;
  v10 = -[NSArray copyWithZone:](self->_gradientColors, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (void)setGradientColors:(id)a3
{
  -[IKColor setGradientColors:andPoints:](self, "setGradientColors:andPoints:", a3, 0);
}

- (void)setGradientColors:(id)a3 andPoints:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *gradientColors;
  NSArray *v19;
  NSArray *gradientPoints;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "count");
    if (v8 != objc_msgSend(v6, "count"))
    {
      ITMLKitGetLogObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[IKColor setGradientColors:andPoints:].cold.1(v9);

      v7 = 0;
    }
  }
  if (!objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "count");
    if (objc_msgSend(v6, "count"))
    {
      v12 = 0;
      v13 = 1.0 / (double)(unint64_t)(v11 - 1);
      v14 = 0.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

        ++v12;
        v14 = v13 + v14;
      }
      while (v12 < objc_msgSend(v6, "count"));
    }
    v16 = objc_msgSend(v10, "copy");

    v7 = (id)v16;
  }
  v17 = (NSArray *)objc_msgSend(v6, "copy");
  gradientColors = self->_gradientColors;
  self->_gradientColors = v17;

  v19 = (NSArray *)objc_msgSend(v7, "copy");
  gradientPoints = self->_gradientPoints;
  self->_gradientPoints = v19;

}

- (BOOL)isEqual:(id)a3
{
  IKColor *v4;
  id *p_isa;
  int64_t colorType;
  NSString *colorMapKey;
  NSArray *v8;
  UIColor *color;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CGColor *v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;

  v4 = (IKColor *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4)
    goto LABEL_22;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_28;
  }
  colorType = self->_colorType;
  if (colorType == 3)
  {
    if (self->_gradientType == v4->_gradientType && self->_gradientDirectionType == v4->_gradientDirectionType)
    {
      v8 = v4->_gradientColors;
      v11 = p_isa[7];
      v12 = -[NSArray count](v8, "count");
      if (v12 == -[NSArray count](self->_gradientColors, "count"))
      {
        v13 = objc_msgSend(v11, "count");
        if (v13 == -[NSArray count](self->_gradientPoints, "count"))
        {
          if (!-[NSArray count](self->_gradientColors, "count"))
          {
LABEL_17:
            if (-[NSArray count](self->_gradientPoints, "count"))
            {
              v20 = 0;
              do
              {
                -[NSArray objectAtIndex:](self->_gradientPoints, "objectAtIndex:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "objectAtIndex:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = objc_msgSend(v21, "isEqualToNumber:", v22);

                if ((v10 & 1) == 0)
                  break;
                ++v20;
              }
              while (-[NSArray count](self->_gradientPoints, "count") > v20);
            }
            else
            {
              v10 = 1;
            }
            goto LABEL_26;
          }
          v14 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_gradientColors, "objectAtIndex:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray objectAtIndex:](v8, "objectAtIndex:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_retainAutorelease(v15);
            v18 = (CGColor *)objc_msgSend(v17, "CGColor");
            v19 = objc_retainAutorelease(v16);
            LOBYTE(v18) = CGColorEqualToColor(v18, (CGColorRef)objc_msgSend(v19, "CGColor"));

            if ((v18 & 1) == 0)
              break;
            if (-[NSArray count](self->_gradientColors, "count") <= ++v14)
              goto LABEL_17;
          }
        }
      }
      v10 = 0;
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
LABEL_22:
    v10 = 0;
    goto LABEL_28;
  }
  if (!colorType)
  {
    colorMapKey = self->_colorMapKey;
    -[IKColor colorMapKey](v4, "colorMapKey");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqualToString:](colorMapKey, "isEqualToString:", v8)
       || (color = self->_color, color == p_isa[1])
       || CGColorEqualToColor(-[UIColor CGColor](color, "CGColor"), (CGColorRef)objc_msgSend(p_isa[1], "CGColor"));
    goto LABEL_27;
  }
  v10 = colorType == v4->_colorType;
LABEL_28:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IKColor color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKColor colorMapKey](self, "colorMapKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKColor colorType](self, "colorType");
  v7 = -[IKColor gradientType](self, "gradientType");
  v8 = -[IKColor gradientDirectionType](self, "gradientDirectionType");
  -[IKColor gradientColors](self, "gradientColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IKColor color: %@ colorKey: %@ colorType:%ld gradientType:%ld gradientDirectionType:%ld gradientColors:%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)colorMapKey
{
  return self->_colorMapKey;
}

- (int64_t)colorType
{
  return self->_colorType;
}

- (void)setColorType:(int64_t)a3
{
  self->_colorType = a3;
}

- (NSArray)gradientPoints
{
  return self->_gradientPoints;
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (int64_t)gradientType
{
  return self->_gradientType;
}

- (void)setGradientType:(int64_t)a3
{
  self->_gradientType = a3;
}

- (int64_t)gradientDirectionType
{
  return self->_gradientDirectionType;
}

- (void)setGradientDirectionType:(int64_t)a3
{
  self->_gradientDirectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientPoints, 0);
  objc_storeStrong((id *)&self->_colorMapKey, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)setGradientColors:(os_log_t)log andPoints:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D95F2000, log, OS_LOG_TYPE_ERROR, "Gradient not set with consistent points", v1, 2u);
}

@end
