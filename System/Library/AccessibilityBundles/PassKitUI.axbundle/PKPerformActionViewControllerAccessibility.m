@implementation PKPerformActionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPerformActionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPerformActionViewController"), CFSTR("viewDidLoad"), "v", 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPerformActionViewControllerAccessibility;
  -[PKPerformActionViewControllerAccessibility viewDidLoad](&v6, sel_viewDidLoad);
  objc_opt_class();
  -[PKPerformActionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityIsNotFirstElement:", 0);

}

@end
