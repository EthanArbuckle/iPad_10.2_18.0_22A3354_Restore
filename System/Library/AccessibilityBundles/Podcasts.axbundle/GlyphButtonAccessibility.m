@implementation GlyphButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.GlyphButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.GlyphButton"), CFSTR("accessibilityGlyphView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  -[GlyphButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityGlyphView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GlyphButtonAccessibility;
  -[GlyphButtonAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_imageAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeStringForKey:", CFSTR("assetName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    AXSSAccessibilityDescriptionForSymbolName();
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return v4;
}

@end
