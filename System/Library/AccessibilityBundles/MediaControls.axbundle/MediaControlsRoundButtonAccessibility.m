@implementation MediaControlsRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaControlsRoundButton"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRoundButton"), CFSTR("assetView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUAssetView"), CFSTR("packageView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MediaControlsRoundButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[MediaControlsRoundButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("assetView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("packageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoundButtonAccessibility;
  return (*MEMORY[0x24BDF73B0] | -[MediaControlsRoundButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BDF73E8];
}

@end
