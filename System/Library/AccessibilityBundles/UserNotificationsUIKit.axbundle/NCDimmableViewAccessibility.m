@implementation NCDimmableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCDimmableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:", CFSTR("SBBannerWindow"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCNotificationViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationViewController"), CFSTR("_executeClearAction:"), "v", "B", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  void *v5;
  id v7;

  objc_opt_class();
  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = v4;
    AXPerformSafeBlock();

  }
  return v5 != 0;
}

uint64_t __57__NCDimmableViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeClearAction:", 1);
}

- (int64_t)accessibilityContainerType
{
  void *v2;
  int64_t v3;

  -[NCDimmableViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("SBBannerWindow"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = 4;
  else
    v3 = 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[NCDimmableViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349233D4](CFSTR("SBBannerWindow"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("notification.title"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
