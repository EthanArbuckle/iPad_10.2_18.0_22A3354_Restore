@implementation MixedMediaLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.MixedMediaLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MixedMediaLockupCollectionViewCell"), CFSTR("accessibilityLockupView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MixedMediaLockupCollectionViewCell"), CFSTR("accessibilityTaglineLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MixedMediaLockupCollectionViewCell"), CFSTR("accessibilityVideoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MixedMediaLockupCollectionViewCell"), CFSTR("accessibilityMediaView"), "@", 0);

}

- (id)_axLockupView
{
  return (id)-[MixedMediaLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLockupView"));
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[MixedMediaLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessibilityElement");

  return v3;
}

- (id)accessibilityLabel
{
  return (id)-[MixedMediaLockupCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTaglineLabel, accessibilityLockupView"));
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[MixedMediaLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MixedMediaLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityVideoView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v4);
  -[MixedMediaLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityMediaView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);
  -[MixedMediaLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySupplementaryFooterViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v7);

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MixedMediaLockupCollectionViewCellAccessibility _axLockupView](self, "_axLockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
