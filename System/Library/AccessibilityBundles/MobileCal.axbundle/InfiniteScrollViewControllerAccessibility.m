@implementation InfiniteScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("InfiniteScrollViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("InfiniteScrollViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("InfiniteScrollViewController"), CFSTR("scrollView"), "@", 0);

}

- (void)_axAnnotateViews
{
  id v2;

  -[InfiniteScrollViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsAccessibilityOpaqueElementProvider:", 1);
  objc_msgSend(v2, "setAccessibilityContainerType:", 4);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewControllerAccessibility;
  -[InfiniteScrollViewControllerAccessibility loadView](&v3, sel_loadView);
  -[InfiniteScrollViewControllerAccessibility _axAnnotateViews](self, "_axAnnotateViews");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewControllerAccessibility;
  -[InfiniteScrollViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[InfiniteScrollViewControllerAccessibility _axAnnotateViews](self, "_axAnnotateViews");
}

@end
