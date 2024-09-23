@implementation CAMControlDrawerMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlDrawerMenuButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CAMControlDrawerExpandableButton"), CFSTR("isExpanded"), 1, 1);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("CAMControlDrawerExpandableButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_setExpanded:animated:shouldNotify:"), "v", "B", "B", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[CAMControlDrawerMenuButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (BOOL)canBecomeFocused
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButtonAccessibility;
  v3 = -[CAMControlDrawerMenuButtonAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  if (-[CAMControlDrawerMenuButtonAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))v3 &= ~-[CAMControlDrawerMenuButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  return v3;
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButtonAccessibility;
  -[CAMControlDrawerMenuButtonAccessibility _setExpanded:animated:shouldNotify:](&v5, sel__setExpanded_animated_shouldNotify_, a3, a4, a5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
