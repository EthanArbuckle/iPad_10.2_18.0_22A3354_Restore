@implementation PUActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUActivityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUActivityViewControllerAccessibility;
  -[PUActivityViewControllerAccessibility viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  if (AXDeviceIsTallPhoneIdiom())
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "interfaceOrientation") - 5;

    if (v8 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      -[PUActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityViewIsModal:", 0);

    }
  }
  -[PUActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("ActivityListView"));

}

@end
