@implementation PXPhotosUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosUIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PXPhotosUIViewController"), CFSTR("UIViewController"));
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __67__PXPhotosUIViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("presentingViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
