@implementation CKActionMenuItemImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKActionMenuItemImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKActionMenuItemImageView"), CFSTR("_enabled"), "B");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKActionMenuItemImageViewAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[CKActionMenuItemImageViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CKActionMenuItemImageViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_enabled"));
  v5 = *MEMORY[0x24BDF73E8];
  if (v4)
    v5 = 0;
  return v3 | v5;
}

@end
