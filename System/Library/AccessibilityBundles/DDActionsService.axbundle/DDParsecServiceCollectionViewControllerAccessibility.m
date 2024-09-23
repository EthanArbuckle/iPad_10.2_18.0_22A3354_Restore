@implementation DDParsecServiceCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DDParsecServiceCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DDParsecServiceCollectionViewController"), CFSTR("doneButtonPressed:"), "v", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __82__DDParsecServiceCollectionViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doneButtonPressed:", 0);
}

@end
