@implementation NavIndicatorsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavIndicatorsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavIndicatorsViewController"), CFSTR("_pressedViewOverview"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavIndicatorsViewController"), CFSTR("_pressedViewTbT"), "v", 0);

}

- (void)_pressedViewOverview
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavIndicatorsViewControllerAccessibility;
  -[NavIndicatorsViewControllerAccessibility _pressedViewOverview](&v3, sel__pressedViewOverview);
  AXMapsLocString(CFSTR("navigation.overview.announcement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (void)_pressedViewTbT
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavIndicatorsViewControllerAccessibility;
  -[NavIndicatorsViewControllerAccessibility _pressedViewTbT](&v3, sel__pressedViewTbT);
  AXMapsLocString(CFSTR("navigation.turnbyturn.announcement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
