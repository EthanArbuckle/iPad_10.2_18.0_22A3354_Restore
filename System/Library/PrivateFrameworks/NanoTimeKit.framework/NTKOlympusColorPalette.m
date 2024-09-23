@implementation NTKOlympusColorPalette

- (NTKOlympusColorPalette)init
{
  void *v3;
  void *v4;
  NTKOlympusColorPalette *v5;
  objc_super v7;

  +[NTKOlympusColorEditOption pigmentFaceDomain](NTKOlympusColorEditOption, "pigmentFaceDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)NTKOlympusColorPalette;
  v5 = -[NTKFaceColorPalette initWithDomainName:inBundle:](&v7, sel_initWithDomainName_inBundle_, v3, v4);

  if (v5)
    -[NTKOlympusColorPalette setDial:](v5, "setDial:", 0);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKOlympusColorPalette;
  v4 = -[NTKFaceColorPalette copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStyle:", -[NTKOlympusColorPalette style](self, "style"));
  objc_msgSend(v4, "setDial:", -[NTKOlympusColorPalette dial](self, "dial"));
  objc_msgSend(v4, "setUseSmallFont:", -[NTKOlympusColorPalette useSmallFont](self, "useSmallFont"));
  return v4;
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)NTKOlympusColorPalette;
  -[NTKFaceColorPalette identifier](&v7, sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu-%lu-%lu"), v4, self->_style, self->_dial, self->_useSmallFont);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isMulticolorPalette
{
  return 0;
}

- (id)mainColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKOlympusColorPalette colorBrightness:](self, "colorBrightness:", v4);
    v8 = v7;
    -[NTKOlympusColorPalette colorBrightness:](self, "colorBrightness:", v6);
    if (v8 <= v9)
      v10 = v6;
    else
      v10 = v4;
    v11 = v10;

  }
  else
  {
    -[NTKOlympusColorPalette primaryColor](self, "primaryColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)_primaryTextColor
{
  void *v3;
  void *v4;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKOlympusColorPalette digits](self, "digits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_digits
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[NTKOlympusColorPalette darker](self, "darker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKFaceColorPalette isNotFoundColor:](self, "isNotFoundColor:", v3))
  {
    if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
    {
      -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "primaryColor");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = v4;
    }
    else
    {
      -[NTKOlympusColorPalette primaryColor](self, "primaryColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_darker
{
  void *v2;
  void *v3;

  -[NTKOlympusColorPalette primaryColor](self, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorByApplyingBlackOverlay(v2, 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_primaryBackgroundColor
{
  void *v3;
  void *v4;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isBlackColor"))
      -[NTKOlympusColorPalette _customBlack](self, "_customBlack");
    else
      objc_msgSend(v3, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKOlympusColorPalette primaryColor](self, "primaryColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_logo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isBlackColor");

    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", v4 != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKOlympusColorPalette orangeLogo](self, "orangeLogo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_secondHandColor
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[NTKFaceColorPalette pigmentEditOption](self, "pigmentEditOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
  {
    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBlackColor");

    -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pigmentEditOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  -[NTKOlympusColorPalette _secondHandForColorName:](self, "_secondHandForColorName:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_secondHandForColorName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("victory.limeBlast")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("victory.spruceAura")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("victory.blueBlack")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("victory.hasta")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("victory.chlorineBlue")) & 1) != 0
    || objc_msgSend(v4, "isEqual:", CFSTR("victory.ironstone")))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKOlympusColorPalette logo](self, "logo");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_largeHandsColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)_circularDialSubtickColor
{
  void *v2;
  void *v3;

  -[NTKOlympusColorPalette ticks](self, "ticks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_circularDialFillColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (UIColor)secondaryBackgroundColor
{
  void *v3;
  void *v4;

  if (!-[NTKFaceColorPalette isCompositePalette](self, "isCompositePalette"))
    goto LABEL_5;
  -[NTKFaceColorPalette paletteAtIndex:](self, "paletteAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isBlackColor") & 1) == 0)
  {

LABEL_5:
    -[NTKOlympusColorPalette primaryTextColor](self, "primaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return (UIColor *)v4;
  }
  -[NTKOlympusColorPalette _customBlack](self, "_customBlack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (double)colorBrightness:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  if (!a3)
    return 0.0;
  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  return (v6 * 587.0 + v7 * 299.0 + v5 * 114.0) / 1000.0;
}

- (id)_customBlack
{
  void *v2;

  if (self->_useSmallFont)
  {
    -[NTKOlympusColorPalette softBlack](self, "softBlack");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_dial || self->_style != 2)
  {
    -[NTKOlympusColorPalette black](self, "black");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKOlympusColorPalette softerBlack](self, "softerBlack");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (void)setDial:(unint64_t)a3
{
  self->_dial = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

@end
