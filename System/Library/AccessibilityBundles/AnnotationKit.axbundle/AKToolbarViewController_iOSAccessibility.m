@implementation AKToolbarViewController_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKToolbarViewController_iOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarViewController_iOS"), CFSTR("undoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarViewController_iOS"), CFSTR("redoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolbarViewController_iOS"), CFSTR("_buildBasicItems"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKToolbarViewController_iOSAccessibility;
  -[AKToolbarViewController_iOSAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[AKToolbarViewController_iOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("undoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("undo.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[AKToolbarViewController_iOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("redoButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("redo.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)_buildBasicItems
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKToolbarViewController_iOSAccessibility;
  -[AKToolbarViewController_iOSAccessibility _buildBasicItems](&v3, sel__buildBasicItems);
  -[AKToolbarViewController_iOSAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
