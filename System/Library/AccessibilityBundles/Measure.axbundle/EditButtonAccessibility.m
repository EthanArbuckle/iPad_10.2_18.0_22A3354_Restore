@implementation EditButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.EditButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.EditButton"), CFSTR("editEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.EditButton"), CFSTR("isInputEnabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("ADD_BUTTON"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  AXMeasureSpeakableDescriptionForCurrentMeasurement();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("ADD_BUTTON_LAST_MEASUREMENT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;

  v3 = *MEMORY[0x24BDF7430] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF7408];
  if (!-[EditButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("editEnabled"))
    || (-[EditButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isInputEnabled")) & 1) == 0)
  {
    v3 |= *MEMORY[0x24BDF73E8];
  }
  return v3;
}

@end
