@implementation UIWebPlugInViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebPlugInView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)webPlugInStart
{
  objc_super v2;
  SEL v3;
  UIWebPlugInViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIWebPlugInViewAccessibility;
  -[UIWebPlugInViewAccessibility webPlugInStart](&v2, sel_webPlugInStart);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
