@implementation HUTimerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTimerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTimerTableViewCell"), CFSTR("timerNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTimerTableViewCell"), CFSTR("timerTimeLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[HUTimerTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("timerNameLabel, timerTimeLabel"));
}

@end
