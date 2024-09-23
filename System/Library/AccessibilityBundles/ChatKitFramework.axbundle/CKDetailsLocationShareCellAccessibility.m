@implementation CKDetailsLocationShareCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsLocationShareCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsLocationShareCell"), CFSTR("button"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareCellAccessibility;
  -[CKDetailsLocationShareCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKDetailsLocationShareCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CKDetailsLocationShareCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

@end
