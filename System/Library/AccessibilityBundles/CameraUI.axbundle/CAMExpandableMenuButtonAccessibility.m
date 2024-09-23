@implementation CAMExpandableMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExpandableMenuButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandableMenuButton"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMExpandableMenuButton"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandableMenuButton"), CFSTR("startCollapsingWithProposedFrame:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[CAMExpandableMenuButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (BOOL)canBecomeFocused
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMExpandableMenuButtonAccessibility;
  v3 = -[CAMExpandableMenuButtonAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  if (-[CAMExpandableMenuButtonAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))v3 &= ~-[CAMExpandableMenuButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  return v3;
}

- (void)startCollapsingWithProposedFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMExpandableMenuButtonAccessibility;
  -[CAMExpandableMenuButtonAccessibility startCollapsingWithProposedFrame:](&v3, sel_startCollapsingWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
