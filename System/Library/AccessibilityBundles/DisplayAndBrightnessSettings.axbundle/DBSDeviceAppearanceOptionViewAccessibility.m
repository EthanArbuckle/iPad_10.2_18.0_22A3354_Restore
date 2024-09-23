@implementation DBSDeviceAppearanceOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DBSDeviceAppearanceOptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSDeviceAppearanceOptionView"), CFSTR("_label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSDeviceAppearanceOptionView"), CFSTR("_checkmarkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSCheckmarkView"), CFSTR("isSelected"), "B", 0);

}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73B0];
  -[DBSDeviceAppearanceOptionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_checkmarkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSelected"));

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[DBSDeviceAppearanceOptionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)_accessibilityActivationDelay
{
  return 0.1;
}

@end
