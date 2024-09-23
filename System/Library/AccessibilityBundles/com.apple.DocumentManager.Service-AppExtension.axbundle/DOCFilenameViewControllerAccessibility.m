@implementation DOCFilenameViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCFilenameViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("com_apple_DocumentManager_Service.DOCFilenameViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCFilenameViewController"), CFSTR("filenameView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCFilenameViewController"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCFilenameView"), CFSTR("textField"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCFilenameViewControllerAccessibility;
  -[DOCFilenameViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[DOCFilenameViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("filenameView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("textField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__DOCFilenameViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503ED9A0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __84__DOCFilenameViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isFolder"))
    v5 = CFSTR("folder.name");
  else
    v5 = CFSTR("file.name");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCFilenameViewControllerAccessibility;
  -[DOCFilenameViewControllerAccessibility loadView](&v3, sel_loadView);
  -[DOCFilenameViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
