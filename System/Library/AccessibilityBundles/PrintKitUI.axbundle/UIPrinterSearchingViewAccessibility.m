@implementation UIPrinterSearchingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPrinterSearchingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPrinterSearchingViewAccessibility;
  -[UIPrinterSearchingViewAccessibility layoutSubviews](&v6, sel_layoutSubviews);
  -[UIPrinterSearchingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterSearchingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("messageAndSpinner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("messageText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

}

@end
