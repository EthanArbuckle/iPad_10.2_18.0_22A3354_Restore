@implementation MRUMediaControlsModuleMoreButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUMediaControlsModuleMoreButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMediaControlsModuleMoreButton"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRUMediaControlsModuleMoreButton"), CFSTR("_badge"), "MRUMediaControlsModuleBadge");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MRUMediaControlsModuleBadge"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:", CFSTR("MRUMediaControlsModuleView"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[MRUMediaControlsModuleMoreButtonAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_badge._label.text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaControlsModuleMoreButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUMediaControlsModuleMoreButtonAccessibility;
  v3 = -[MRUMediaControlsModuleMoreButtonAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
  -[MRUMediaControlsModuleMoreButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);

  return v3;
}

uint64_t __70__MRUMediaControlsModuleMoreButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MRUMediaControlsModuleView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
