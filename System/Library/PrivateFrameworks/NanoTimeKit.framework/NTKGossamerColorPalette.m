@implementation NTKGossamerColorPalette

+ (double)contentScaleForTintedBackground
{
  return 0.92;
}

- (NTKGossamerColorPalette)init
{
  uint64_t v3;
  NTKGossamerColorPalette *v4;
  NTKGossamerColorPalette *v5;
  objc_super v7;

  v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)NTKGossamerColorPalette;
  v4 = -[NTKFaceColorPalette initWithFaceClass:](&v7, sel_initWithFaceClass_, v3);
  v5 = v4;
  if (v4)
    -[NTKGossamerColorPalette invalidateCachedValues](v4, "invalidateCachedValues");
  return v5;
}

- (void)invalidateCachedValues
{
  NSString *cachedIdentifier;

  self->_isDirty = 1;
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;

}

- (id)identifier
{
  NSString *cachedIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  objc_super v10;

  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f-%f-%f"), *(_QWORD *)&self->_approximateComplicationPositions.top, *(_QWORD *)&self->_approximateComplicationPositions.center, *(_QWORD *)&self->_approximateComplicationPositions.bottom);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    v10.receiver = self;
    v10.super_class = (Class)NTKGossamerColorPalette;
    -[NTKFaceColorPalette identifier](&v10, sel_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%lu-%lu-%@"), v6, self->_backgroundStyle, self->_isEditingComplications, v4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedIdentifier;
    self->_cachedIdentifier = v7;

    cachedIdentifier = self->_cachedIdentifier;
  }
  return cachedIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  double bottom;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKGossamerColorPalette;
  v4 = -[NTKFaceColorPalette copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBackgroundStyle:", self->_backgroundStyle);
  objc_msgSend(v4, "setIsEditingComplications:", self->_isEditingComplications);
  bottom = self->_approximateComplicationPositions.bottom;
  *(_OWORD *)(v4 + 344) = *(_OWORD *)&self->_approximateComplicationPositions.top;
  *((double *)v4 + 45) = bottom;
  objc_msgSend(v4, "invalidateCachedValues");
  return v4;
}

- (id)swatchImageForSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGSize v16;

  height = a3.height;
  width = a3.width;
  if (-[NTKGossamerColorPalette isCuratedColor](self, "isCuratedColor"))
  {
    if (swatchImageForSize__onceToken != -1)
      dispatch_once(&swatchImageForSize__onceToken, &__block_literal_global_172);
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NTKFaceColorPalette configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16.width = width;
    v16.height = height;
    NSStringFromCGSize(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)swatchImageForSize__swatches, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[NTKGossamerColorPalette gradientTopColor](self, "gradientTopColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKGossamerColorPalette gradientBottomColor](self, "gradientBottomColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NTKSwatchTwoColorGradientImage(v12, v13, 0, 0.0, 1.0, width, height);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)swatchImageForSize__swatches, "setObject:forKey:", v11, v10);

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKGossamerColorPalette;
    -[NTKFaceColorPalette swatchImageForSize:](&v15, sel_swatchImageForSize_, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

void __46__NTKGossamerColorPalette_swatchImageForSize___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)swatchImageForSize__swatches;
  swatchImageForSize__swatches = v0;

}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
  -[NTKGossamerColorPalette invalidateCachedValues](self, "invalidateCachedValues");
}

- (void)setIsEditingComplications:(BOOL)a3
{
  self->_isEditingComplications = a3;
  -[NTKGossamerColorPalette invalidateCachedValues](self, "invalidateCachedValues");
}

- (void)setIsSwatchPreview:(BOOL)a3
{
  self->_isSwatchPreview = a3;
  -[NTKGossamerColorPalette invalidateCachedValues](self, "invalidateCachedValues");
}

- (void)setApproximateComplicationPositions:(id)a3
{
  self->_approximateComplicationPositions = ($08A3282CA2B764307ED9F5326E269AA3)a3;
  -[NTKGossamerColorPalette invalidateCachedValues](self, "invalidateCachedValues");
}

- (BOOL)isCuratedColor
{
  void *v2;
  void *v3;
  char v4;

  -[NTKFaceColorPalette configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("gossamer"));

  return v4;
}

- (BOOL)isSeasonalGradientColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("seasons.fall2023")))
  {
    -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("seasons.fall2019.alaskanBlue")) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isCuratedStarlightColor
{
  return -[NTKGossamerColorPalette curatedNumber](self, "curatedNumber") == 2;
}

- (int64_t)curatedNumber
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  if (!curatedNumber_formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = (void *)curatedNumber_formatter;
    curatedNumber_formatter = (uint64_t)v3;

  }
  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasPrefix:", CFSTR("gossamer.color")))
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("gossamer.color"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)curatedNumber_formatter, "numberFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "integerValue");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_starlightBackgroundColors
{
  if (_starlightBackgroundColors_onceToken != -1)
    dispatch_once(&_starlightBackgroundColors_onceToken, &__block_literal_global_19_0);
  return (id)_starlightBackgroundColors___colors;
}

void __53__NTKGossamerColorPalette__starlightBackgroundColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.77254902, 0.658823529, 0.443137255, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.741176471, 0.611764706, 0.4, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.682352941, 0.51372549, 0.278431373, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.670588235, 0.521568627, 0.309803922, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_starlightBackgroundColors___colors;
  _starlightBackgroundColors___colors = v4;

}

- (void)configurationDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKGossamerColorPalette;
  -[NTKFaceColorPalette configurationDidChange:](&v4, sel_configurationDidChange_, a3);
  -[NTKGossamerColorPalette invalidateCachedValues](self, "invalidateCachedValues");
}

- (void)resolveColorsIfNeeded
{
  _BOOL4 v3;
  unint64_t backgroundStyle;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  UIColor *v17;
  void *v18;
  UIColor *v19;
  UIColor *foregroundColor;
  void *v21;
  UIColor *v22;
  UIColor *accentColor;
  double v24;
  double v25;
  UIColor *v26;
  UIColor *v27;
  void *v28;
  UIColor *v29;
  UIColor *swatchComplicationPlaceholderColor;
  void *v31;
  NSNumber *v32;
  NSNumber *scaleFactor;
  _BOOL4 v34;
  int v35;
  NSNumber *monochromeFraction;
  void *v37;
  NSNumber *v38;
  NSNumber *v39;
  NSNumber *imageViewFraction;
  NSNumber *v41;
  void *v42;
  NSNumber *foregroundGradientFraction;
  NSArray *v44;
  NSArray *backgroundGradientColors;
  UIColor **p_centerAccentColor;
  UIColor **p_bottomAccentColor;
  NSArray *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  UIColor *v53;
  uint64_t v54;
  UIColor *v55;
  void *v56;
  void *v57;
  NSArray *v58;
  NSArray *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSArray *v66;
  NSArray *v67;
  void *v68;
  NSArray *v69;
  NSArray *v70;
  UIColor *v71;
  UIColor *topApproximateBackgroundColor;
  UIColor *v73;
  UIColor *centerApproximateBackgroundColor;
  UIColor *v75;
  UIColor *bottomApproximateBackgroundColor;
  char v77;
  UIColor *v78;
  void *v79;
  UIColor *v80;
  UIColor *v81;
  UIColor *v82;
  void *v83;
  UIColor *v84;
  UIColor *v85;
  UIColor *v86;
  void *v87;
  UIColor *v88;
  UIColor *v89;
  UIColor *v90;
  UIColor *modularCompactDialBackgroundColor;
  UIColor *v92;
  void *modularCompactDialDigitalTimeColor;
  void *v94;
  void *v95;
  UIColor *v96;
  UIColor *modularCompactDialForegroundSecondaryColor;
  UIColor *v98;
  UIColor *modularCompactDialSecondHandColor;
  UIColor *v100;
  UIColor *infographModularDateLabelColor;
  UIColor *v102;
  UIColor *v103;
  UIColor *infographModularTimeLabelColor;
  UIColor *v105;
  void *v106;
  UIColor *v107;
  UIColor *v108;
  UIColor *v109;
  void *v110;
  UIColor *v111;
  UIColor *xLargeSmallTimeTritiumOutlineColor;
  UIColor *v113;
  void *v114;
  UIColor *v115;
  UIColor *xLargeLargeTimeTritiumFillColor;
  UIColor *v117;
  int v118;
  int64_t v119;
  id *p_topAccentColor;
  char v121;
  void *v122;
  _BOOL4 v123;
  _BOOL4 v124;
  void *v125;
  _BOOL4 v126;
  _BOOL4 isEditingComplications;
  _BOOL4 v128;
  _BOOL4 v129;
  _QWORD v130[3];
  _QWORD v131[2];
  _QWORD v132[3];
  _QWORD v133[3];

  v133[1] = *MEMORY[0x1E0C80C00];
  if (!self->_isDirty)
    return;
  self->_isDirty = 0;
  v3 = -[NTKFaceColorPalette isTritium](self, "isTritium");
  backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
    v5 = v3;
  else
    v5 = 1;
  isEditingComplications = self->_isEditingComplications;
  v6 = -[NTKGossamerColorPalette isCuratedColor](self, "isCuratedColor");
  v126 = -[NTKGossamerColorPalette isSeasonalGradientColor](self, "isSeasonalGradientColor");
  v129 = v6;
  if (v6)
    v119 = -[NTKGossamerColorPalette curatedNumber](self, "curatedNumber");
  else
    v119 = 0;
  v128 = -[NTKFaceColorPalette isMulticolor](self, "isMulticolor");
  v7 = -[NTKFaceColorPalette hasPrimaryColorRange](self, "hasPrimaryColorRange");
  if (v5)
    v8 = &unk_1E6CA5A88;
  else
    v8 = &unk_1E6CA5A78;
  objc_storeStrong((id *)&self->_tintedFraction, v8);
  -[NTKGossamerColorPalette inputColor](self, "inputColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v7;
  if (!v7)
  {
    if (!isEditingComplications)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CLKContrastRatioForColors();
      v12 = v16;

      v125 = 0;
      v122 = 0;
      v13 = 2.7;
      goto LABEL_18;
    }
    v125 = 0;
    v122 = 0;
LABEL_16:
    v14 = 1;
    goto LABEL_19;
  }
  -[NTKGossamerColorPalette rangeLightColor](self, "rangeLightColor");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NTKGossamerColorPalette rangeDarkColor](self, "rangeDarkColor");
  v122 = (void *)v10;
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (isEditingComplications)
    goto LABEL_16;
  CLKContrastRatioForColors();
  v12 = v11;
  CLKContrastRatioForColors();
LABEL_18:
  v14 = v12 > v13;
LABEL_19:
  v124 = v14;
  if (v5)
  {
    if (self->_isSwatchPreview)
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0666666667, 1.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_backgroundColor, v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
    foregroundColor = self->_foregroundColor;
    self->_foregroundColor = v19;

    if (v129)
    {
      v21 = (void *)MEMORY[0x1E0DC3658];
    }
    else
    {
      if (!v126 && !v128)
      {
        v22 = v9;
        goto LABEL_32;
      }
      v21 = (void *)MEMORY[0x1E0DC3658];
    }
    objc_msgSend(v21, "whiteColor");
    v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_32:
    accentColor = self->_accentColor;
    self->_accentColor = v22;
    v24 = 0.05;
    goto LABEL_46;
  }
  objc_storeStrong((id *)&self->_backgroundColor, v9);
  if (v129 || v128 || v126)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v124)
      v25 = 0.9;
    else
      v25 = 0.1;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v25, 1.0);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v26 = self->_foregroundColor;
  self->_foregroundColor = v17;

  if (v128)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    v27 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_45:
    accentColor = self->_accentColor;
    self->_accentColor = v27;
    v24 = 0.3;
    goto LABEL_46;
  }
  if (v129)
  {
    v28 = v9;
LABEL_44:
    v27 = v28;
    goto LABEL_45;
  }
  if (v126)
  {
    v28 = v9;
    goto LABEL_44;
  }
  if (!v123)
  {
    NTKInterpolateBetweenColors(v9, self->_foregroundColor);
    v27 = (UIColor *)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (v124)
    v62 = v122;
  else
    v62 = v125;
  v117 = v62;
  accentColor = self->_accentColor;
  self->_accentColor = v117;
  v24 = 0.3;
LABEL_46:

  -[UIColor colorWithAlphaComponent:](self->_foregroundColor, "colorWithAlphaComponent:", v24);
  v29 = (UIColor *)objc_claimAutoreleasedReturnValue();
  swatchComplicationPlaceholderColor = self->_swatchComplicationPlaceholderColor;
  self->_swatchComplicationPlaceholderColor = v29;

  if (self->_isSwatchPreview)
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    +[NTKGossamerColorPalette contentScaleForTintedBackground](NTKGossamerColorPalette, "contentScaleForTintedBackground");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    scaleFactor = self->_scaleFactor;
    self->_scaleFactor = v32;
  }
  else
  {
    if (backgroundStyle)
    {
      v37 = (void *)MEMORY[0x1E0CB37E8];
      +[NTKGossamerColorPalette contentScaleForTintedBackground](NTKGossamerColorPalette, "contentScaleForTintedBackground");
      objc_msgSend(v37, "numberWithDouble:");
      v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v39 = self->_scaleFactor;
      self->_scaleFactor = v38;

      v35 = !v128;
      goto LABEL_54;
    }
    scaleFactor = self->_scaleFactor;
    self->_scaleFactor = (NSNumber *)&unk_1E6CA5A78;
  }

  v34 = v128;
  v35 = !v128;
  if (backgroundStyle)
    v34 = 0;
  if (v34)
  {
    v121 = 0;
    monochromeFraction = self->_monochromeFraction;
    self->_monochromeFraction = (NSNumber *)&unk_1E6CA5A88;
    goto LABEL_55;
  }
LABEL_54:
  monochromeFraction = self->_monochromeFraction;
  self->_monochromeFraction = (NSNumber *)&unk_1E6CA5A78;
  v121 = 1;
LABEL_55:

  imageViewFraction = self->_imageViewFraction;
  if (v5 | v35)
    v41 = (NSNumber *)&unk_1E6CA5A88;
  else
    v41 = (NSNumber *)&unk_1E6CA5A78;
  self->_imageViewFraction = v41;

  if (self->_isEditingComplications)
    v42 = &unk_1E6CA5A78;
  else
    v42 = &unk_1E6CA5A88;
  objc_storeStrong((id *)&self->_editingComplicationsFraction, v42);
  if ((v129 & v5) == 1)
  {
    foregroundGradientFraction = self->_foregroundGradientFraction;
LABEL_64:
    self->_foregroundGradientFraction = (NSNumber *)&unk_1E6CA5A78;
    goto LABEL_66;
  }
  foregroundGradientFraction = self->_foregroundGradientFraction;
  if ((v126 & v5) == 1)
    goto LABEL_64;
  self->_foregroundGradientFraction = (NSNumber *)&unk_1E6CA5A88;
LABEL_66:

  v133[0] = self->_backgroundColor;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 1);
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
  backgroundGradientColors = self->_backgroundGradientColors;
  self->_backgroundGradientColors = v44;

  p_topAccentColor = (id *)&self->_topAccentColor;
  objc_storeStrong((id *)&self->_topAccentColor, self->_accentColor);
  p_centerAccentColor = &self->_centerAccentColor;
  objc_storeStrong((id *)&self->_centerAccentColor, self->_accentColor);
  p_bottomAccentColor = &self->_bottomAccentColor;
  objc_storeStrong((id *)&self->_bottomAccentColor, self->_accentColor);
  if (v129)
  {
    if ((v5 & 1) == 0)
    {
      if (v119 == 2)
      {
        -[NTKGossamerColorPalette _starlightBackgroundColors](self, "_starlightBackgroundColors");
        v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v49 = self->_backgroundGradientColors;
        self->_backgroundGradientColors = v48;
      }
      else
      {
        -[NTKGossamerColorPalette gradientTopColor](self, "gradientTopColor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v132[0] = v49;
        -[NTKGossamerColorPalette gradientMidColor](self, "gradientMidColor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v132[1] = v56;
        -[NTKGossamerColorPalette gradientBottomColor](self, "gradientBottomColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v132[2] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
        v58 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v59 = self->_backgroundGradientColors;
        self->_backgroundGradientColors = v58;

      }
      goto LABEL_85;
    }
LABEL_72:
    -[NTKGossamerColorPalette backgroundOffGradientTopColor](self, "backgroundOffGradientTopColor");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = *p_topAccentColor;
    *p_topAccentColor = (id)v50;

    -[NTKGossamerColorPalette backgroundOffGradientMidColor](self, "backgroundOffGradientMidColor");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = *p_centerAccentColor;
    *p_centerAccentColor = (UIColor *)v52;

    -[NTKGossamerColorPalette backgroundOffGradientBottomColor](self, "backgroundOffGradientBottomColor");
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = *p_bottomAccentColor;
    *p_bottomAccentColor = (UIColor *)v54;

LABEL_87:
    -[NTKGossamerColorPalette _setApproximateComplicationBackgroundColors](self, "_setApproximateComplicationBackgroundColors");
    goto LABEL_89;
  }
  if (!v126)
    goto LABEL_86;
  if ((v5 & 1) != 0)
    goto LABEL_72;
  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "fullname");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v61, "isEqualToString:", CFSTR("seasons.fall2023.mulberry")))
  {

  }
  else
  {
    -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "fullname");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v64, "isEqualToString:", CFSTR("seasons.fall2023.winterBlue"));

    if (!v118)
    {
      -[NTKGossamerColorPalette gradientTopColor](self, "gradientTopColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v130[0] = v49;
      -[NTKGossamerColorPalette gradientMidColor](self, "gradientMidColor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v130[1] = v65;
      -[NTKGossamerColorPalette gradientBottomColor](self, "gradientBottomColor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v130[2] = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 3);
      v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v70 = self->_backgroundGradientColors;
      self->_backgroundGradientColors = v69;

      goto LABEL_84;
    }
  }
  -[NTKGossamerColorPalette gradientTopColor](self, "gradientTopColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v49;
  -[NTKGossamerColorPalette gradientBottomColor](self, "gradientBottomColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
  v66 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v67 = self->_backgroundGradientColors;
  self->_backgroundGradientColors = v66;

LABEL_84:
LABEL_85:

LABEL_86:
  if (((v35 | v5) & 1) != 0)
    goto LABEL_87;
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v71 = (UIColor *)objc_claimAutoreleasedReturnValue();
  topApproximateBackgroundColor = self->_topApproximateBackgroundColor;
  self->_topApproximateBackgroundColor = v71;

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v73 = (UIColor *)objc_claimAutoreleasedReturnValue();
  centerApproximateBackgroundColor = self->_centerApproximateBackgroundColor;
  self->_centerApproximateBackgroundColor = v73;

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v75 = (UIColor *)objc_claimAutoreleasedReturnValue();
  bottomApproximateBackgroundColor = self->_bottomApproximateBackgroundColor;
  self->_bottomApproximateBackgroundColor = v75;

LABEL_89:
  if (isEditingComplications)
    v77 = v5;
  else
    v77 = 1;
  if ((v77 & 1) == 0)
  {
    v78 = self->_topApproximateBackgroundColor;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v78, v79);
    v80 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v81 = self->_topApproximateBackgroundColor;
    self->_topApproximateBackgroundColor = v80;

    v82 = self->_centerApproximateBackgroundColor;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v82, v83);
    v84 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v85 = self->_centerApproximateBackgroundColor;
    self->_centerApproximateBackgroundColor = v84;

    v86 = self->_bottomApproximateBackgroundColor;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v86, v87);
    v88 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v89 = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v88;

  }
  if (((v5 | !v123) & 1) != 0)
  {
    -[UIColor colorWithAlphaComponent:](self->_foregroundColor, "colorWithAlphaComponent:", 0.2);
    v90 = (UIColor *)objc_claimAutoreleasedReturnValue();
    modularCompactDialBackgroundColor = self->_modularCompactDialBackgroundColor;
    self->_modularCompactDialBackgroundColor = v90;

    objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, self->_foregroundColor);
    v92 = self->_foregroundColor;
    modularCompactDialDigitalTimeColor = self->_modularCompactDialDigitalTimeColor;
    self->_modularCompactDialDigitalTimeColor = v92;
  }
  else
  {
    if (v124)
      v94 = v122;
    else
      v94 = v125;
    if (v124)
      v95 = v125;
    else
      v95 = v122;
    objc_storeStrong((id *)&self->_modularCompactDialBackgroundColor, v94);
    objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, v95);
    if (v124)
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    modularCompactDialDigitalTimeColor = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_modularCompactDialDigitalTimeColor, modularCompactDialDigitalTimeColor);
  }

  -[UIColor colorWithAlphaComponent:](self->_modularCompactDialForegroundPrimaryColor, "colorWithAlphaComponent:", 0.4);
  v96 = (UIColor *)objc_claimAutoreleasedReturnValue();
  modularCompactDialForegroundSecondaryColor = self->_modularCompactDialForegroundSecondaryColor;
  self->_modularCompactDialForegroundSecondaryColor = v96;

  if (v128)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v98 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v98 = self->_accentColor;
  }
  modularCompactDialSecondHandColor = self->_modularCompactDialSecondHandColor;
  self->_modularCompactDialSecondHandColor = v98;

  if ((v121 & 1) != 0)
  {
    if (((!v129 | v5) & 1) != 0 || (v119 | 4) != 6)
    {
      v102 = (UIColor *)*p_topAccentColor;
      infographModularDateLabelColor = self->_infographModularDateLabelColor;
      self->_infographModularDateLabelColor = v102;
      goto LABEL_116;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v100 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v100 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  infographModularDateLabelColor = self->_infographModularDateLabelColor;
  self->_infographModularDateLabelColor = v100;
LABEL_116:

  if (v126)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v103 = (UIColor *)objc_claimAutoreleasedReturnValue();
    infographModularTimeLabelColor = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v103;
  }
  else
  {
    if (((v5 | v129 | (v128 || v124)) & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v105 = (UIColor *)objc_claimAutoreleasedReturnValue();
    infographModularTimeLabelColor = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v105;
  }

  if (isEditingComplications)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v106, self->_infographModularTimeLabelColor);
    v107 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v108 = self->_infographModularTimeLabelColor;
    self->_infographModularTimeLabelColor = v107;

  }
  objc_storeStrong((id *)&self->_infographModularDateAccentColor, self->_foregroundColor);
  v109 = self->_accentColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v109, v110);
  v111 = (UIColor *)objc_claimAutoreleasedReturnValue();
  xLargeSmallTimeTritiumOutlineColor = self->_xLargeSmallTimeTritiumOutlineColor;
  self->_xLargeSmallTimeTritiumOutlineColor = v111;

  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumOutlineColor, self->_accentColor);
  v113 = self->_accentColor;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v113, v114);
  v115 = (UIColor *)objc_claimAutoreleasedReturnValue();
  xLargeLargeTimeTritiumFillColor = self->_xLargeLargeTimeTritiumFillColor;
  self->_xLargeLargeTimeTritiumFillColor = v115;

}

- (void)_setApproximateComplicationBackgroundColors
{
  NSUInteger v3;
  UIColor *v4;
  UIColor *bottomApproximateBackgroundColor;
  NSUInteger v6;
  void *v7;
  NSArray *backgroundGradientColors;
  uint64_t v9;
  id v10;
  NTKColorCurve *v11;
  void *v12;
  NTKColorCurve *v13;
  uint64_t v14;
  double (**v15)(double);
  double v16;
  UIColor *v17;
  UIColor *topApproximateBackgroundColor;
  double v19;
  UIColor *v20;
  UIColor *centerApproximateBackgroundColor;
  double v22;
  UIColor *v23;
  UIColor *v24;
  _QWORD aBlock[5];
  _QWORD v26[4];
  id v27;
  NSUInteger v28;

  v3 = -[NSArray count](self->_backgroundGradientColors, "count");
  if (v3 == 1)
  {
    -[NSArray firstObject](self->_backgroundGradientColors, "firstObject");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_topApproximateBackgroundColor, v4);
    objc_storeStrong((id *)&self->_centerApproximateBackgroundColor, v4);
    bottomApproximateBackgroundColor = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v4;

  }
  else
  {
    v6 = v3;
    v7 = (void *)objc_opt_new();
    backgroundGradientColors = self->_backgroundGradientColors;
    v9 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke;
    v26[3] = &unk_1E6BDC3B0;
    v27 = v7;
    v28 = v6;
    v10 = v7;
    -[NSArray enumerateObjectsUsingBlock:](backgroundGradientColors, "enumerateObjectsUsingBlock:", v26);
    v11 = [NTKColorCurve alloc];
    v12 = (void *)objc_msgSend(v10, "copy");
    v13 = -[NTKColorCurve initWithColorCurveElements:](v11, "initWithColorCurveElements:", v12);

    -[NSNumber doubleValue](self->_scaleFactor, "doubleValue");
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    aBlock[4] = v14;
    v15 = (double (**)(double))_Block_copy(aBlock);
    v16 = v15[2](self->_approximateComplicationPositions.top);
    *(float *)&v16 = v16;
    -[NTKColorCurve colorForFraction:](v13, "colorForFraction:", v16);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    topApproximateBackgroundColor = self->_topApproximateBackgroundColor;
    self->_topApproximateBackgroundColor = v17;

    v19 = ((double (*)(double (**)(double), double))v15[2])(v15, self->_approximateComplicationPositions.center);
    *(float *)&v19 = v19;
    -[NTKColorCurve colorForFraction:](v13, "colorForFraction:", v19);
    v20 = (UIColor *)objc_claimAutoreleasedReturnValue();
    centerApproximateBackgroundColor = self->_centerApproximateBackgroundColor;
    self->_centerApproximateBackgroundColor = v20;

    v22 = ((double (*)(double (**)(double), double))v15[2])(v15, self->_approximateComplicationPositions.bottom);
    *(float *)&v22 = v22;
    -[NTKColorCurve colorForFraction:](v13, "colorForFraction:", v22);
    v23 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v24 = self->_bottomApproximateBackgroundColor;
    self->_bottomApproximateBackgroundColor = v23;

  }
}

void __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v4;
  id v5;
  NTKColorCurveElement *v6;
  double v7;
  NTKColorCurveElement *v8;

  v4 = (double)a3 / (double)(unint64_t)(*(_QWORD *)(a1 + 40) - 1);
  v5 = a2;
  v6 = [NTKColorCurveElement alloc];
  *(float *)&v7 = v4;
  v8 = -[NTKColorCurveElement initWithColor:fraction:](v6, "initWithColor:fraction:", v5, v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

double __70__NTKGossamerColorPalette__setApproximateComplicationBackgroundColors__block_invoke_2(uint64_t a1, double a2)
{
  return (1.0 - *(double *)(a1 + 32)) * 0.5 + a2 * *(double *)(a1 + 32);
}

- (UIColor)accentColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_accentColor;
}

- (UIColor)foregroundColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_foregroundColor;
}

- (UIColor)topAccentColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_topAccentColor;
}

- (UIColor)centerAccentColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_centerAccentColor;
}

- (UIColor)bottomAccentColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_bottomAccentColor;
}

- (UIColor)swatchComplicationPlaceholderColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_swatchComplicationPlaceholderColor;
}

- (UIColor)dialColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialBackgroundColor;
}

- (UIColor)hourTickColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialForegroundPrimaryColor;
}

- (UIColor)minuteTickColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialForegroundSecondaryColor;
}

- (UIColor)secondTickActiveColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialForegroundPrimaryColor;
}

- (UIColor)secondTickInactiveColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialForegroundSecondaryColor;
}

- (UIColor)hourMinuteHandFillColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_foregroundColor;
}

- (UIColor)hourMinuteHandStrokeColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIColor)secondHandColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialSecondHandColor;
}

- (UIColor)digitalTimeLabelColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_modularCompactDialDigitalTimeColor;
}

- (UIColor)dateLabelAccentColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_infographModularDateAccentColor;
}

- (UIColor)dateLabelTextColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_infographModularDateLabelColor;
}

- (UIColor)timeLabelColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_infographModularTimeLabelColor;
}

- (UIColor)smallTimeTritiumOutlineColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_xLargeSmallTimeTritiumOutlineColor;
}

- (UIColor)largeTimeTritiumOutlineColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_xLargeLargeTimeTritiumOutlineColor;
}

- (UIColor)largeTimeTritiumFillColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_xLargeLargeTimeTritiumFillColor;
}

- (NSNumber)scaleFactor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_scaleFactor;
}

- (NSNumber)monochromeFraction
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_monochromeFraction;
}

- (NSNumber)imageViewFraction
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_imageViewFraction;
}

- (NSNumber)editingComplicationsFraction
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_editingComplicationsFraction;
}

- (NSNumber)foregroundGradientFraction
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_foregroundGradientFraction;
}

- (NSNumber)tintedFraction
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_tintedFraction;
}

- (NSArray)backgroundGradientColors
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_backgroundGradientColors;
}

- (UIColor)topApproximateBackgroundColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_topApproximateBackgroundColor;
}

- (UIColor)centerApproximateBackgroundColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_centerApproximateBackgroundColor;
}

- (UIColor)bottomApproximateBackgroundColor
{
  -[NTKGossamerColorPalette resolveColorsIfNeeded](self, "resolveColorsIfNeeded");
  return self->_bottomApproximateBackgroundColor;
}

- (id)_gradientBottomColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)_gradientMidColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)_gradientTopColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)_rangeLightColor
{
  return -[NTKFaceColorPalette primaryColorWithFraction:](self, "primaryColorWithFraction:", 0.0);
}

- (id)_rangeDarkColor
{
  return -[NTKFaceColorPalette primaryColorWithFraction:](self, "primaryColorWithFraction:", 1.0);
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)isEditingComplications
{
  return self->_isEditingComplications;
}

- ($1AB5FA073B851C12C2339EC22442E995)approximateComplicationPositions
{
  double top;
  double center;
  double bottom;
  $1AB5FA073B851C12C2339EC22442E995 result;

  top = self->_approximateComplicationPositions.top;
  center = self->_approximateComplicationPositions.center;
  bottom = self->_approximateComplicationPositions.bottom;
  result.var2 = bottom;
  result.var1 = center;
  result.var0 = top;
  return result;
}

- (BOOL)isSwatchPreview
{
  return self->_isSwatchPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);
  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumFillColor, 0);
  objc_storeStrong((id *)&self->_xLargeLargeTimeTritiumOutlineColor, 0);
  objc_storeStrong((id *)&self->_xLargeSmallTimeTritiumOutlineColor, 0);
  objc_storeStrong((id *)&self->_infographModularTimeLabelColor, 0);
  objc_storeStrong((id *)&self->_infographModularDateAccentColor, 0);
  objc_storeStrong((id *)&self->_infographModularDateLabelColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialDigitalTimeColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialSecondHandColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialForegroundSecondaryColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialForegroundPrimaryColor, 0);
  objc_storeStrong((id *)&self->_modularCompactDialBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintedFraction, 0);
  objc_storeStrong((id *)&self->_foregroundGradientFraction, 0);
  objc_storeStrong((id *)&self->_editingComplicationsFraction, 0);
  objc_storeStrong((id *)&self->_imageViewFraction, 0);
  objc_storeStrong((id *)&self->_monochromeFraction, 0);
  objc_storeStrong((id *)&self->_scaleFactor, 0);
  objc_storeStrong((id *)&self->_swatchComplicationPlaceholderColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradientColors, 0);
  objc_storeStrong((id *)&self->_bottomApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_centerApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_topApproximateBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bottomAccentColor, 0);
  objc_storeStrong((id *)&self->_centerAccentColor, 0);
  objc_storeStrong((id *)&self->_topAccentColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
