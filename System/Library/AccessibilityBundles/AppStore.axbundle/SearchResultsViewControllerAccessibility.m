@implementation SearchResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.SearchResultsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AppStore.SearchResultsViewController"), CFSTR("UIViewController"));
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SearchResultsViewControllerAccessibility;
  -[SearchResultsViewControllerAccessibility viewDidLoad](&v2, sel_viewDidLoad);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
