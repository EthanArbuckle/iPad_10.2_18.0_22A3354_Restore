@implementation NCNotificationListDisplayStyleSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListDisplayStyleSelectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListDisplayStyleSelectionView"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListDisplayStyleSelectionView"), CFSTR("encapsulatedSelectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListDisplayStyleSelectionView"), CFSTR("selectionLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (-[NCNotificationListDisplayStyleSelectionViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v3 = CFSTR("encapsulatedSelectionLabel");
  else
    v3 = CFSTR("selectionLabel");
  -[NCNotificationListDisplayStyleSelectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListDisplayStyleSelectionViewAccessibility;
  v3 = -[NCNotificationListDisplayStyleSelectionViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[NCNotificationListDisplayStyleSelectionViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v5 = (_QWORD *)MEMORY[0x24BDF7400];
  if (!v4)
    v5 = (_QWORD *)MEMORY[0x24BDF73B0];
  return *v5 | v3;
}

@end
