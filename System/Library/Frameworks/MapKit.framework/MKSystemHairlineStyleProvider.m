@implementation MKSystemHairlineStyleProvider

- (UIColor)fillColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
}

- (id)vibrancyEffectForTraitCollection:(id)a3
{
  return 0;
}

@end
