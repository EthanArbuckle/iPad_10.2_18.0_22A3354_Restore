@implementation LibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Shortcuts.LibraryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Shortcuts.LibraryViewController"), CFSTR("axCreateButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LibraryViewControllerAccessibility;
  -[LibraryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[LibraryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axCreateButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("create.shortcut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
