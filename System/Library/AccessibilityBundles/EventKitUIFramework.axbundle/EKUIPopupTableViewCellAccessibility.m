@implementation EKUIPopupTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIPopupTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKUIPopupTableViewCell"), CFSTR("_popupButton"), "UIButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[EKUIPopupTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_popupButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
