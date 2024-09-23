@implementation UIReferenceLibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIReferenceLibraryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  id location;
  objc_super v3;
  SEL v4;
  UIReferenceLibraryViewControllerAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  -[UIReferenceLibraryViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  location = (id)-[UIReferenceLibraryViewControllerAccessibility safeValueForKey:](v5, "safeValueForKey:", CFSTR("view"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(location, "setAccessibilityViewIsModal:", 1);
  objc_storeStrong(&location, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  id v4;
  id location;
  objc_super v6;
  BOOL v7;
  SEL v8;
  UIReferenceLibraryViewControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  -[UIReferenceLibraryViewControllerAccessibility viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  location = (id)-[UIReferenceLibraryViewControllerAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("view"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(location, "window");
    objc_msgSend(v3, "_setAccessibilityIsMainWindow:", 0);

    v4 = (id)objc_msgSend(location, "superview");
    objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  id location;
  objc_super v6;
  BOOL v7;
  SEL v8;
  UIReferenceLibraryViewControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIReferenceLibraryViewControllerAccessibility;
  -[UIReferenceLibraryViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  location = (id)-[UIReferenceLibraryViewControllerAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("view"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(location, "window");
    objc_msgSend(v3, "_setAccessibilityIsMainWindow:", 1);

    v4 = (id)objc_msgSend(location, "superview");
    objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_storeStrong(&location, 0);
}

@end
