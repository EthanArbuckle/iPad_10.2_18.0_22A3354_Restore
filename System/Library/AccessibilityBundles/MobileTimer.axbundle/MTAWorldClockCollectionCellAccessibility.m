@implementation MTAWorldClockCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockCollectionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTAWorldClockCollectionCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockCollectionCell"), CFSTR("worldClockView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockCollectionCell"), CFSTR("deleteButton"), "@", 0);

}

- (MTAWorldClockCollectionCellAccessibility)initWithFrame:(CGRect)a3
{
  MTAWorldClockCollectionCellAccessibility *v3;
  MTAWorldClockCollectionCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  v3 = -[MTAWorldClockCollectionCellAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MTAWorldClockCollectionCellAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  -[MTAWorldClockCollectionCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTAWorldClockCollectionCellAccessibility _axModifyDeleteButton](self, "_axModifyDeleteButton");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[MTAWorldClockCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("worldClockView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("cityNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if ((-[MTAWorldClockCollectionCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockCollectionCellAccessibility;
  return -[MTAWorldClockCollectionCellAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

- (void)_axModifyDeleteButton
{
  void *v2;
  id v3;

  -[MTAWorldClockCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("clock.delete"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

@end
