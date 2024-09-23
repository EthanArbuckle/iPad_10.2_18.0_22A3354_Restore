@implementation SUUIGiftComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIGiftComposeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIGiftComposeViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIGiftComposeViewController"), CFSTR("_tableView"), "UITableView");

}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftComposeViewControllerAccessibility;
  -[SUUIGiftComposeViewControllerAccessibility loadView](&v4, sel_loadView);
  -[SUUIGiftComposeViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("GiftTableView"));

}

@end
