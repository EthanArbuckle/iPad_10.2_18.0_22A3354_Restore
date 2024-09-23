@implementation LNSnippetEnvironment

- (LNSnippetEnvironment)initWithSize:(CGSize)a3 locale:(id)a4 dynamicTypeSize:(int64_t)a5 legibilityWeight:(int64_t)a6 layoutDirection:(int64_t)a7 colorScheme:(int64_t)a8 colorSchemeContrast:(int64_t)a9 displayScale:(double)a10 displayGamut:(int64_t)a11 accessibilityDifferentiateWithoutColor:(BOOL)a12 accessibilityInvertColors:(BOOL)a13 accessibilityReduceMotion:(BOOL)a14 accessibilityReduceTransparency:(BOOL)a15
{
  CGFloat height;
  CGFloat width;
  id v25;
  LNSnippetEnvironment *v26;
  LNSnippetEnvironment *v27;
  LNSnippetEnvironment *v28;
  objc_super v30;

  height = a3.height;
  width = a3.width;
  v25 = a4;
  v30.receiver = self;
  v30.super_class = (Class)LNSnippetEnvironment;
  v26 = -[LNSnippetEnvironment init](&v30, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_size.width = width;
    v26->_size.height = height;
    objc_storeStrong((id *)&v26->_locale, a4);
    v27->_dynamicTypeSize = a5;
    v27->_legibilityWeight = a6;
    v27->_layoutDirection = a7;
    v27->_colorScheme = a8;
    v27->_colorSchemeContrast = a9;
    v27->_displayScale = a10;
    v27->_displayGamut = a11;
    v27->_accessibilityDifferentiateWithoutColor = a12;
    v27->_accessibilityInvertColors = a13;
    v27->_accessibilityReduceMotion = a14;
    v27->_accessibilityReduceTransparency = a15;
    v28 = v27;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  LNSnippetEnvironment *v4;
  LNSnippetEnvironment *v5;
  LNSnippetEnvironment *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  LNSnippetEnvironment *v15;
  LNSnippetEnvironment *v16;
  LNSnippetEnvironment *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  int64_t v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;

  v4 = (LNSnippetEnvironment *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[LNSnippetEnvironment size](self, "size");
        v8 = v7;
        -[LNSnippetEnvironment size](v6, "size");
        if (v8 != v9
          || (-[LNSnippetEnvironment size](self, "size"), v11 = v10,
                                                          -[LNSnippetEnvironment size](v6, "size"),
                                                          v11 != v12))
        {
          LOBYTE(v19) = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[LNSnippetEnvironment locale](self, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNSnippetEnvironment locale](v6, "locale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v13;
        v16 = v14;
        v17 = v16;
        if (v15 == v16)
        {

        }
        else
        {
          if (!v15 || !v16)
          {

            goto LABEL_28;
          }
          v18 = -[LNSnippetEnvironment isEqual:](v15, "isEqual:", v16);

          if (!v18)
            goto LABEL_28;
        }
        v20 = -[LNSnippetEnvironment dynamicTypeSize](self, "dynamicTypeSize");
        if (v20 == -[LNSnippetEnvironment dynamicTypeSize](v6, "dynamicTypeSize"))
        {
          v21 = -[LNSnippetEnvironment legibilityWeight](self, "legibilityWeight");
          if (v21 == -[LNSnippetEnvironment legibilityWeight](v6, "legibilityWeight"))
          {
            v22 = -[LNSnippetEnvironment layoutDirection](self, "layoutDirection");
            if (v22 == -[LNSnippetEnvironment layoutDirection](v6, "layoutDirection"))
            {
              v23 = -[LNSnippetEnvironment colorScheme](self, "colorScheme");
              if (v23 == -[LNSnippetEnvironment colorScheme](v6, "colorScheme"))
              {
                v24 = -[LNSnippetEnvironment colorSchemeContrast](self, "colorSchemeContrast");
                if (v24 == -[LNSnippetEnvironment colorSchemeContrast](v6, "colorSchemeContrast"))
                {
                  -[LNSnippetEnvironment displayScale](self, "displayScale");
                  v26 = v25;
                  -[LNSnippetEnvironment displayScale](v6, "displayScale");
                  if (v26 == v27)
                  {
                    v28 = -[LNSnippetEnvironment displayGamut](self, "displayGamut");
                    if (v28 == -[LNSnippetEnvironment displayGamut](v6, "displayGamut"))
                    {
                      v29 = -[LNSnippetEnvironment accessibilityDifferentiateWithoutColor](self, "accessibilityDifferentiateWithoutColor");
                      if (v29 == -[LNSnippetEnvironment accessibilityDifferentiateWithoutColor](v6, "accessibilityDifferentiateWithoutColor"))
                      {
                        v30 = -[LNSnippetEnvironment accessibilityInvertColors](self, "accessibilityInvertColors");
                        if (v30 == -[LNSnippetEnvironment accessibilityInvertColors](v6, "accessibilityInvertColors"))
                        {
                          v31 = -[LNSnippetEnvironment accessibilityReduceMotion](self, "accessibilityReduceMotion");
                          if (v31 == -[LNSnippetEnvironment accessibilityReduceMotion](v6, "accessibilityReduceMotion"))
                          {
                            v32 = -[LNSnippetEnvironment accessibilityReduceTransparency](self, "accessibilityReduceTransparency");
                            v19 = v32 ^ -[LNSnippetEnvironment accessibilityReduceTransparency](v6, "accessibilityReduceTransparency") ^ 1;
LABEL_29:

                            goto LABEL_30;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_28:
        LOBYTE(v19) = 0;
        goto LABEL_29;
      }
      LOBYTE(v19) = 0;
      v15 = v6;
      v6 = 0;
    }
    else
    {
      v15 = 0;
      LOBYTE(v19) = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  LOBYTE(v19) = 1;
LABEL_32:

  return v19;
}

- (LNSnippetEnvironment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  LNSnippetEnvironment *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lns_CGSizeValue");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dynamicTypeSize"));
    v24 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("legibilityWeight"));
    v23 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutDirection"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("displayScale"));
    v13 = v12;
    v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayGamut"));
    v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("colorScheme"));
    v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("colorSchemeContrast"));
    v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityDifferentiateWithoutColor"));
    v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityInvertColors"));
    v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityReduceMotion"));
    BYTE3(v22) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityReduceTransparency"));
    BYTE2(v22) = v19;
    BYTE1(v22) = v18;
    LOBYTE(v22) = v17;
    self = -[LNSnippetEnvironment initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:](self, "initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:", v11, v25, v24, v23, v15, v16, v8, v10, v13, v14, v22);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  -[LNSnippetEnvironment size](self, "size");
  objc_msgSend(v4, "lns_valueWithCGSize:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("size"));
  -[LNSnippetEnvironment locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("locale"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment dynamicTypeSize](self, "dynamicTypeSize"), CFSTR("dynamicTypeSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment legibilityWeight](self, "legibilityWeight"), CFSTR("legibilityWeight"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment layoutDirection](self, "layoutDirection"), CFSTR("layoutDirection"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment colorScheme](self, "colorScheme"), CFSTR("colorScheme"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment colorSchemeContrast](self, "colorSchemeContrast"), CFSTR("colorSchemeContrast"));
  -[LNSnippetEnvironment displayScale](self, "displayScale");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("displayScale"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[LNSnippetEnvironment displayGamut](self, "displayGamut"), CFSTR("displayGamut"));
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityDifferentiateWithoutColor](self, "accessibilityDifferentiateWithoutColor"), CFSTR("accessibilityDifferentiateWithoutColor"));
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityInvertColors](self, "accessibilityInvertColors"), CFSTR("accessibilityInvertColors"));
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityReduceMotion](self, "accessibilityReduceMotion"), CFSTR("accessibilityReduceMotion"));
  objc_msgSend(v5, "encodeBool:forKey:", -[LNSnippetEnvironment accessibilityReduceTransparency](self, "accessibilityReduceTransparency"), CFSTR("accessibilityReduceTransparency"));

}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int64_t)dynamicTypeSize
{
  return self->_dynamicTypeSize;
}

- (int64_t)legibilityWeight
{
  return self->_legibilityWeight;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)colorSchemeContrast
{
  return self->_colorSchemeContrast;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)displayGamut
{
  return self->_displayGamut;
}

- (BOOL)accessibilityDifferentiateWithoutColor
{
  return self->_accessibilityDifferentiateWithoutColor;
}

- (BOOL)accessibilityInvertColors
{
  return self->_accessibilityInvertColors;
}

- (BOOL)accessibilityReduceMotion
{
  return self->_accessibilityReduceMotion;
}

- (BOOL)accessibilityReduceTransparency
{
  return self->_accessibilityReduceTransparency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
