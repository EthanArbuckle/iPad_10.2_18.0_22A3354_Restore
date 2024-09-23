@implementation DataTypeDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.DataTypeDetailDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DataTypeDetailDescriptionCellAccessibility;
  -[DataTypeDetailDescriptionCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[DataTypeDetailDescriptionCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

}

BOOL __88__DataTypeDetailDescriptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "accessibilityTraits");
  return (*MEMORY[0x24BDF73D8] & v2) != 0;
}

@end
