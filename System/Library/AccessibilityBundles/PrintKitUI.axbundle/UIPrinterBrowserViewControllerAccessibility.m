@implementation UIPrinterBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrinterBrowserViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrintMessageAndSpinnerView"), CFSTR("messageText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrinterSearchingView"), CFSTR("messageAndSpinner"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPrinterBrowserViewController"), CFSTR("updateSearching"), "v", 0);

}

- (void)updateSearching
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPrinterBrowserViewControllerAccessibility;
  -[UIPrinterBrowserViewControllerAccessibility updateSearching](&v7, sel_updateSearching);
  -[UIPrinterBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("messageAndSpinner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("messageText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

}

@end
