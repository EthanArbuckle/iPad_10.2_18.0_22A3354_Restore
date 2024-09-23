@implementation PKLinkedAppViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKLinkedAppView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PKLinkedApplication"));
  objc_msgSend(v3, "validateClass:", CFSTR("ASCLockupContentView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASCLockupContentView"), CFSTR("offerButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKContinuousButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedAppView"), CFSTR("linkedAppView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedAppContentView"), CFSTR("linkedApplication"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKLinkedApplication"), CFSTR("isInstalled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axGetAppView
{
  return (id)-[PKLinkedAppViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_3);
}

uint64_t __45__PKLinkedAppViewAccessibility__axGetAppView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("ASCLockupContentView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  -[PKLinkedAppViewAccessibility _axGetAppView](self, "_axGetAppView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;

  -[PKLinkedAppViewAccessibility _axGetAppView](self, "_axGetAppView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("offerButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  -[PKLinkedAppViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("linkedAppView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("linkedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isInstalled")))
    v5 = CFSTR("passbook.app.hint.open");
  else
    v5 = CFSTR("passbook.app.hint.view");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[PKLinkedAppViewAccessibility _axGetAppView](self, "_axGetAppView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("offerButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivationPoint");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

@end
