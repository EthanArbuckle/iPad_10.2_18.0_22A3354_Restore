@implementation CKExpandedAppViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKExpandedAppViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKExpandedAppViewController"), CFSTR("collapse"), "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __70__CKExpandedAppViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "collapse");
}

@end
