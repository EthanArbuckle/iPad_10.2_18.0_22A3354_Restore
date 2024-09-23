@implementation PKPassColorProfileAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassColorProfile");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_imageForGlyph:(id)a3 color:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassColorProfileAccessibility;
  v5 = a3;
  -[PKPassColorProfileAccessibility _imageForGlyph:color:](&v9, sel__imageForGlyph_color_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);
  return v6;
}

@end
