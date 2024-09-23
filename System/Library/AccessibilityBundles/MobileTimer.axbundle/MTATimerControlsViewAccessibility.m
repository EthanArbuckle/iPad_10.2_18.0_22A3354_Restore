@implementation MTATimerControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerControlsView"), CFSTR("_timePicker"), "MTATimerIntervalPickerView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerControlsView"), CFSTR("_timeView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerControlsView"), CFSTR("_state"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerControlsView"), CFSTR("setState: animate:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerControlsView"), CFSTR("_tableView"), "UITableView");

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTATimerControlsViewAccessibility;
  -[MTATimerControlsViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[MTATimerControlsViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTATimerControlsViewAccessibility;
  -[MTATimerControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("alarm.selected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTATimerControlsViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_expectedTimeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTATimerControlsViewAccessibility;
  -[MTATimerControlsViewAccessibility setState:animate:](&v5, sel_setState_animate_, a3, a4);
  -[MTATimerControlsViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

@end
