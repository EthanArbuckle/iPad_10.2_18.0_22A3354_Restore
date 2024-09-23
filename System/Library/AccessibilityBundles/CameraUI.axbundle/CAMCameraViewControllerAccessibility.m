@implementation CAMCameraViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMCameraViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCameraViewController"), CFSTR("handleReviewButtonReleased:"), "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __66__CAMCameraViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleReviewButtonReleased:", 0);
}

@end
