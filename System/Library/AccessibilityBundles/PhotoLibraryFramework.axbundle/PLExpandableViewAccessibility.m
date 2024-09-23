@implementation PLExpandableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLExpandableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setState:(int)a3 withDuration:(double)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLExpandableViewAccessibility;
  -[PLExpandableViewAccessibility setState:withDuration:](&v4, sel_setState_withDuration_, *(_QWORD *)&a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
