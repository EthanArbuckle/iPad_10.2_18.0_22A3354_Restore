@implementation PKPaletteMulticolorSwatch

- (PKPaletteMulticolorSwatch)init
{
  PKPaletteMulticolorSwatch *v2;
  PKPaletteMulticolorSwatch *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaletteMulticolorSwatch;
  v2 = -[PKPaletteColorSwatch init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPaletteMulticolorSwatch setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("PKPalette-Multicolor-Swatch"));
    _PencilKitBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show More Colors"), CFSTR("Show More Colors"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMulticolorSwatch setLargeContentTitle:](v3, "setLargeContentTitle:", v5);

  }
  return v3;
}

- (id)presentationColor
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaletteMulticolorSwatch;
  -[PKPaletteColorSwatch presentationColor](&v5, sel_presentationColor);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newColorBackgroundView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("palette_multicolor_button"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v5);

  return v2;
}

- (BOOL)wantsBackgroundViewColor
{
  return 0;
}

- (BOOL)wantsColorBulletVisible
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaletteMulticolorSwatch;
  if (-[PKPaletteColorSwatch wantsColorBulletVisible](&v6, sel_wantsColorBulletVisible))
    return 1;
  -[PKPaletteColorSwatch swatchColor](self, "swatchColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

@end
