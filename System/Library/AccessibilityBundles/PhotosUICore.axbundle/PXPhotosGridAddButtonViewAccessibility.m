@implementation PXPhotosGridAddButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosGridAddButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("add.photo"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridAddButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PXPhotosGridAddButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
