@implementation CARFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CARFolderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CARFolderView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CARFolderView"), CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CARTodayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CARDashboardHomeViewController"), CFSTR("todayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("pageControl"), "@", 0);

}

- (id)_accessibilityUserTestingChildrenFromSBRootFolderView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CARFolderViewAccessibility;
  -[CARFolderViewAccessibility automationElements](&v7, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CARFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  return v4;
}

- (id)automationElements
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
