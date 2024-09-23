@implementation MUHoursSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUHoursSummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUHoursSummaryView"), CFSTR("_expanded"), "BOOL");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUHoursSummaryView"), CFSTR("_titleLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUHoursSummaryView"), CFSTR("_hoursLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUHoursSummaryView"), CFSTR("_openStateLabel"), "UIView<MULabelViewProtocol>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  if (-[MUHoursSummaryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_expanded")))
    return accessibilityLocalizedString(CFSTR("hours.view.collapse.hint"));
  else
    return accessibilityLocalizedString(CFSTR("hours.view.expand.hint"));
}

- (id)accessibilityValue
{
  if (-[MUHoursSummaryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_expanded")))
    return accessibilityLocalizedString(CFSTR("HOURS_EXPANDED"));
  else
    return accessibilityLocalizedString(CFSTR("HOURS_COLLAPSED"));
}

- (id)accessibilityLabel
{
  return (id)-[MUHoursSummaryViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _hoursLabel, _openStateLabel"));
}

@end
