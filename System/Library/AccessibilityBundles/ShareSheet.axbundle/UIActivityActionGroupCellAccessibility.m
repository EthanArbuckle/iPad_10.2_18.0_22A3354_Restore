@implementation UIActivityActionGroupCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIActivityActionGroupCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityActionGroupCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityActionGroupCell"), CFSTR("activityProxy"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIHostActivityProxy"), CFSTR("labelSlotID"), "I", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityActionGroupCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UIActivityActionGroupCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (unsigned)_accessibilitySlotID
{
  void *v2;
  unsigned int v3;

  -[UIActivityActionGroupCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activityProxy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntForKey:", CFSTR("labelSlotID"));

  return v3;
}

- (id)_accessibilityAXAttributedLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[UIActivityActionGroupCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
  {
    v3 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("sharing.activity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIActivityActionGroupCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEC60]);
  }
  else
  {
    -[UIActivityActionGroupCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
