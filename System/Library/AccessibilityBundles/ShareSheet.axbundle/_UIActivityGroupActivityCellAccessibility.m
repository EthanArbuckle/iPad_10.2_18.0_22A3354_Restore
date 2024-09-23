@implementation _UIActivityGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIActivityGroupActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIActivityGroupActivityCell"), CFSTR("UICollectionReusableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIActivityGroupActivityCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionReusableView"), CFSTR("reuseIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIActivityGroupActivityCell"), CFSTR("activityProxy"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIHostActivityProxy"), CFSTR("labelSlotID"), "I", 0);

}

- (unsigned)_accessibilitySlotID
{
  void *v2;
  unsigned int v3;

  -[_UIActivityGroupActivityCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activityProxy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntForKey:", CFSTR("labelSlotID"));

  return v3;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[_UIActivityGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
  {
    v3 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("sharing.activity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[_UIActivityGroupActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEC60]);
  }
  else
  {
    -[_UIActivityGroupActivityCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIActivityGroupActivityCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[_UIActivityGroupActivityCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
