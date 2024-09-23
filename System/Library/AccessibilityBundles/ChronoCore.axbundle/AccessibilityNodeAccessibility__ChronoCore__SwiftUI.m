@implementation AccessibilityNodeAccessibility__ChronoCore__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  objc_super v4;

  if ((AXProcessIsChronod() & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)AccessibilityNodeAccessibility__ChronoCore__SwiftUI;
  return -[AccessibilityNodeAccessibility__ChronoCore__SwiftUI accessibilityRespondsToUserInteraction](&v4, sel_accessibilityRespondsToUserInteraction);
}

@end
