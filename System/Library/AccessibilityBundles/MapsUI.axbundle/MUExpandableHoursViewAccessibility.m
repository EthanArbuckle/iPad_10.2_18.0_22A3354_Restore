@implementation MUExpandableHoursViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUExpandableHoursView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUExpandableHoursViewAccessibility;
  -[MUExpandableHoursViewAccessibility _setExpanded:animated:](&v4, sel__setExpanded_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
