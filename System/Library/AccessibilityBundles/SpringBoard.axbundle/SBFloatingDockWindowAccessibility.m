@implementation SBFloatingDockWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFloatingDockWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityScrollLeftPage:"), "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityScrollRightPage:"), "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("_currentFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("floatingDockController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockWindow"), CFSTR("floatingDockRootViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isPresentingLibraryInFloatingDockWindow"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockRootViewController"), CFSTR("isPresentingFolder"), "B", 0);

}

- (int64_t)_accessibilitySortPriority
{
  return -1;
}

- (id)_accessibilityKeyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockWindowAccessibility;
  -[SBFloatingDockWindowAccessibility _accessibilityKeyCommands](&v8, sel__accessibilityKeyCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A0], 0x100000, sel__axLeftArrowPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79A8], 0x100000, sel__axRightArrowPressed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)_axRightArrowPressed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AXSBIconControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_iconListViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityScrollLeftPage:", 0);

}

- (void)_axLeftArrowPressed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AXSBIconControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentFolderController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_iconListViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityScrollRightPage:", 0);

}

- (BOOL)accessibilityViewIsModal
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("floatingDockController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("floatingDockRootViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPresentingLibraryInFloatingDockWindow")) & 1) != 0
    || (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isPresentingFolder")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFloatingDockWindowAccessibility;
    v6 = -[SBFloatingDockWindowAccessibility accessibilityViewIsModal](&v8, sel_accessibilityViewIsModal);
  }

  return v6;
}

@end
