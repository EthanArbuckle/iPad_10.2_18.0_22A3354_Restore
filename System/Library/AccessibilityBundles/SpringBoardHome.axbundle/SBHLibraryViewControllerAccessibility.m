@implementation SBHLibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHLibraryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHLibraryViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryViewController"), CFSTR("libraryPodFolderControllerRequestsDismissal:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHLibraryViewController"), CFSTR("_podFolderViewController"), "SBHLibraryPodFolderController");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryViewControllerAccessibility;
  -[SBHLibraryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBHLibraryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (BOOL)accessibilityPerformEscape
{
  int IsPad;

  IsPad = AXDeviceIsPad();
  if (IsPad)
    AXPerformSafeBlock();
  return IsPad;
}

void __67__SBHLibraryViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "safeValueForKey:", CFSTR("_podFolderViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "libraryPodFolderControllerRequestsDismissal:", v2);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryViewControllerAccessibility;
  -[SBHLibraryViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  if (AXDeviceIsPad())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryViewControllerAccessibility;
  -[SBHLibraryViewControllerAccessibility viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  if (AXDeviceIsPad())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
