@implementation CKQuickActionSaveButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKQuickActionSaveButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("save.photo.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKQuickActionSaveButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CKQuickActionSaveButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
