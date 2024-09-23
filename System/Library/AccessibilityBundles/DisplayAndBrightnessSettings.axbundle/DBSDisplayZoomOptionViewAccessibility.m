@implementation DBSDisplayZoomOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DBSDisplayZoomOptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSDisplayZoomOptionView"), CFSTR("optionNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSDisplayZoomOptionView"), CFSTR("isSelected"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[DBSDisplayZoomOptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("optionNameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBSDisplayZoomOptionViewAccessibility;
  v3 = -[DBSDisplayZoomOptionViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[DBSDisplayZoomOptionViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
