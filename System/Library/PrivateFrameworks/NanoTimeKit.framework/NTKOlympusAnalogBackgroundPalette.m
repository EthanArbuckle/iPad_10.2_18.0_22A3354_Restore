@implementation NTKOlympusAnalogBackgroundPalette

- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3
{
  return -[NTKOlympusAnalogBackgroundPalette initWithOlympusColorPalette:alternatePalette:](self, "initWithOlympusColorPalette:alternatePalette:", a3, 0);
}

- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3 alternatePalette:(id)a4
{
  id v7;
  id v8;
  NTKOlympusAnalogBackgroundPalette *v9;
  NTKOlympusAnalogBackgroundPalette *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKOlympusAnalogBackgroundPalette;
  v9 = -[NTKOlympusAnalogBackgroundPalette init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_olympusPalette, a3);
    objc_storeStrong((id *)&v10->_tritiumPalette, a4);
  }

  return v10;
}

- (id)dotMarkerAlpha
{
  return &unk_1E6C9E188;
}

- (UIColor)backgroundColor
{
  return (UIColor *)-[NTKOlympusColorPalette primaryBackgroundColor](self->_olympusPalette, "primaryBackgroundColor");
}

- (UIColor)numbersColor
{
  return (UIColor *)-[NTKOlympusColorPalette primaryTextColor](self->_olympusPalette, "primaryTextColor");
}

- (id)logoColor
{
  return (id)-[NTKOlympusColorPalette primaryLogoColor](self->_olympusPalette, "primaryLogoColor");
}

- (UIColor)analogDotColor
{
  return 0;
}

- (BOOL)hasWhiteElements
{
  return 0;
}

- (id)_softBlackColor
{
  return (id)NTKColorWithRGBA(33, 33, 33, 1.0);
}

- (id)tritiumLargeNumbers
{
  return (id)-[NTKOlympusColorPalette primaryTextColor](self->_tritiumPalette, "primaryTextColor");
}

- (id)tritiumLargeNumbersOutline
{
  return (id)-[NTKOlympusColorPalette primaryOutlineTextColor](self->_tritiumPalette, "primaryOutlineTextColor");
}

- (id)tritiumSmallNumbers
{
  return (id)-[NTKOlympusColorPalette primaryTextColor](self->_tritiumPalette, "primaryTextColor");
}

- (id)tritiumOutlineNumbers
{
  return (id)-[NTKOlympusColorPalette primaryOutlineTextColor](self->_tritiumPalette, "primaryOutlineTextColor");
}

- (double)smallNumbersColorBrightness
{
  return 1.0;
}

- (double)smallDotsColorBrightness
{
  return 1.0;
}

- (id)tritiumBackgroundColor
{
  return (id)-[NTKOlympusColorPalette primaryBackgroundColor](self->_tritiumPalette, "primaryBackgroundColor");
}

- (BOOL)isMulticolor
{
  return -[NTKFaceColorPalette isMulticolor](self->_olympusPalette, "isMulticolor");
}

- (NTKOlympusColorPalette)olympusPalette
{
  return self->_olympusPalette;
}

- (void)setOlympusPalette:(id)a3
{
  objc_storeStrong((id *)&self->_olympusPalette, a3);
}

- (NTKOlympusColorPalette)tritiumPalette
{
  return self->_tritiumPalette;
}

- (void)setTritiumPalette:(id)a3
{
  objc_storeStrong((id *)&self->_tritiumPalette, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tritiumPalette, 0);
  objc_storeStrong((id *)&self->_olympusPalette, 0);
}

@end
