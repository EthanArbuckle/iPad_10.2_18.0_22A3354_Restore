@implementation SPUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SPUIViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUIViewController"), CFSTR("activateViewController: animate:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUIViewController"), CFSTR("activeViewController"), "@", 0);

}

- (void)activateViewController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[SPUIViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activeViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SPUIViewControllerAccessibility;
  -[SPUIViewControllerAccessibility activateViewController:animate:](&v8, sel_activateViewController_animate_, v6, v4);

  if (v7 != v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
