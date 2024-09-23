@implementation AppTrailerLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.AppTrailerLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.SmallLockupView"), CFSTR("accessibilityAdLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.MixedMediaLockupCollectionViewCell"), CFSTR("accessibilityTaglineLabel"), "@", 0);

}

- (id)_axTaglineLabel
{
  return (id)-[AppTrailerLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTaglineLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[AppTrailerLockupCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityLockupView.accessibilityAdLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTrailerLockupCollectionViewCellAccessibility _axTaglineLabel](self, "_axTaglineLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[AppTrailerLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

@end
