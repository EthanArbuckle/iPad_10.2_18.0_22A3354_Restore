@implementation JSSettingsContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.JSSettingsContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.JSSettingsContainerViewController"), CFSTR("UIViewController"));
}

- (BOOL)accessibilityPerformEscape
{
  id v2;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

void __76__JSSettingsContainerViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
