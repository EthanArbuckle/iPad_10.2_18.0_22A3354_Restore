@implementation SBSwitcherShelfViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitcherShelfView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  void *v4;

  -[SBSwitcherShelfViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_axIsShelfSwitcherVisible");

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("shelf.container"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)accessibilityContainerType
{
  void *v3;
  char v4;
  objc_super v6;

  -[SBSwitcherShelfViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_axIsShelfSwitcherVisible");

  if ((v4 & 1) != 0)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherShelfViewAccessibility;
  return -[SBSwitcherShelfViewAccessibility accessibilityContainerType](&v6, sel_accessibilityContainerType);
}

- (id)_axMainSwitcher
{
  void *v2;
  void *v3;

  objc_opt_class();
  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
