@implementation SidebarMenuViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.SidebarMenuViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("Music.SidebarMenuViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.SidebarMenuViewController"), CFSTR("setEditing:animated:"), "v", "B", "B", 0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SidebarMenuViewControllerAccessibility;
  -[SidebarMenuViewControllerAccessibility setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  if (v4)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);

  }
}

@end
