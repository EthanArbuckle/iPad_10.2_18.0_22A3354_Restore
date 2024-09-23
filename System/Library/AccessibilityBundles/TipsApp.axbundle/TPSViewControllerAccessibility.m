@implementation TPSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPSViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPSViewController"), CFSTR("setLoading:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TPSViewController"), CFSTR("_loading"), "B");

}

- (void)setLoading:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[TPSViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_loading"));
  v6.receiver = self;
  v6.super_class = (Class)TPSViewControllerAccessibility;
  -[TPSViewControllerAccessibility setLoading:](&v6, sel_setLoading_, v3);
  if (v5 != v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
