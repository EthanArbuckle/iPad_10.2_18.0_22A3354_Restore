@implementation SFBarRegistrationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFBarRegistration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFBarRegistration"), CFSTR("initWithBar:barManager:layout:persona:"), "@", "@", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFBarRegistration"), CFSTR("_UIBarButtonItemForBarItem:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_backItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_forwardItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_bookmarksItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_newTabItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_tabExposeItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_shareItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFBarRegistration"), CFSTR("_openInSafariItem"), "UIBarButtonItem");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SFBarRegistrationAccessibility;
  -[SFBarRegistrationAccessibility _accessibilityLoadAccessibilityInformation](&v25, sel__accessibilityLoadAccessibilityInformation);
  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.back.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.back.hint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityHint:", v8);

  }
  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_forwardItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.forward.text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookmarksItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.show.bookmarks.text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v12);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookmarksItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.bookmarks.hint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityHint:", v14);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_newTabItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("new.tab.button"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v16);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tabExposeItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.tabs.text"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v18);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tabExposeItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.tabs.hint"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityHint:", v20);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_shareItem"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("actions.button"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v22);

  -[SFBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_openInSafariItem"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("open.safari"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityLabel:", v24);

}

- (id)_UIBarButtonItemForBarItem:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBarRegistrationAccessibility;
  -[SFBarRegistrationAccessibility _UIBarButtonItemForBarItem:](&v7, sel__UIBarButtonItemForBarItem_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)(a3 + 101) <= 1)
    objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  return v5;
}

- (SFBarRegistrationAccessibility)initWithBar:(id)a3 barManager:(id)a4 layout:(int64_t)a5 persona:(int64_t)a6
{
  SFBarRegistrationAccessibility *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFBarRegistrationAccessibility;
  v6 = -[SFBarRegistrationAccessibility initWithBar:barManager:layout:persona:](&v8, sel_initWithBar_barManager_layout_persona_, a3, a4, a5, a6);
  -[SFBarRegistrationAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");

  return v6;
}

@end
