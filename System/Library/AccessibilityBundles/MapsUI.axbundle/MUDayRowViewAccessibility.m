@implementation MUDayRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUDayRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUDayRowView"), CFSTR("_headerLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUDayRowView"), CFSTR("_dayLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUDayRowView"), CFSTR("_hoursLabel"), "UIView<MULabelViewProtocol>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MUDayRowViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_headerLabel, _dayLabel, _hoursLabel"));
}

@end
