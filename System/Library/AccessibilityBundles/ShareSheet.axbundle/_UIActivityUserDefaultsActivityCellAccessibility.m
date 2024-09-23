@implementation _UIActivityUserDefaultsActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIActivityUserDefaultsActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIActivityUserDefaultsActivityCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIActivityUserDefaultsActivityCell"), CFSTR("activityProxy"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIUserDefaultsActivityProxy"), CFSTR("labelSlot"), "@", 0);

}

- (unsigned)_accessibilitySlotID
{
  void *v2;
  unsigned int v3;

  -[_UIActivityUserDefaultsActivityCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activityProxy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntForKey:", CFSTR("labelSlot"));

  return v3;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[_UIActivityUserDefaultsActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
  {
    v3 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("sharing.activity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[_UIActivityUserDefaultsActivityCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEC60]);
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
