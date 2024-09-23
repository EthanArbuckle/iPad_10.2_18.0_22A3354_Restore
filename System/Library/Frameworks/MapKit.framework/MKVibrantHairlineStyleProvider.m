@implementation MKVibrantHairlineStyleProvider

- (UIColor)fillColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
}

- (id)vibrancyEffectForTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v3, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
