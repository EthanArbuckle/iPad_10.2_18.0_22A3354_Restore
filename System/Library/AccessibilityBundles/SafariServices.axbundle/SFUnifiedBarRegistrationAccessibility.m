@implementation SFUnifiedBarRegistrationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedBarRegistration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_makeBarItemForSFBarItem:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_bookmarksAndSidebarButton"), "SFUnifiedBarButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_backButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_forwardButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_tabGroupButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_newTabButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_tabOverviewButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_cancelButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_shareButton"), "SFUnifiedBarItem");
  objc_msgSend(v3, "validateClass:", CFSTR("SFFeatureManager"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SFFeatureManager"), CFSTR("sharedFeatureManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBarRegistration"), CFSTR("_barManager"), "_SFBarManager");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFBarManager"), CFSTR("delegate"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  -[SFUnifiedBarRegistrationAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookmarksAndSidebarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v3, 3);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v4, 0);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_forwardButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v5, 1);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tabGroupButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v6, 2);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_newTabButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v7, 7);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tabOverviewButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v8, 8);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cancelButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v9, 12);

  -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_shareButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v10, 6);

}

- (id)_makeBarItemForSFBarItem:(int64_t)a3
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  -[SFUnifiedBarRegistrationAccessibility _makeBarItemForSFBarItem:](&v7, sel__makeBarItemForSFBarItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedBarRegistrationAccessibility _axApplyLabel:withType:](self, "_axApplyLabel:withType:", v5, a3);
  return v5;
}

- (void)_axApplyLabel:(id)a3 withType:(int64_t)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;

  v12 = a3;
  switch(a4)
  {
    case 0:
      v6 = CFSTR("buttonbar.back.text");
      goto LABEL_21;
    case 1:
      v6 = CFSTR("buttonbar.forward.text");
      goto LABEL_21;
    case 2:
      accessibilityMobileSafariLocalizedString(CFSTR("tab.group.name.button"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeStringForKey:", CFSTR("title"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v9, v8);

      goto LABEL_9;
    case 3:
      -[SFUnifiedBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_barManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "safeIntegerForKey:", CFSTR("_bookmarksPresentationStyle")))
        v11 = CFSTR("buttonbar.sidebar.text");
      else
        v11 = CFSTR("buttonbar.bookmarks.text");
      accessibilitySafariServicesLocalizedString(v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v8);
LABEL_9:

      goto LABEL_22;
    case 4:
      v6 = CFSTR("buttonbar.voicesearch");
      goto LABEL_21;
    case 5:
      v6 = CFSTR("buttonbar.moreMenu");
      goto LABEL_21;
    case 6:
      v6 = CFSTR("actions.button");
      goto LABEL_21;
    case 7:
      v6 = CFSTR("new.tab.button");
      goto LABEL_21;
    case 8:
      v6 = CFSTR("buttonbar.tabs.text");
      goto LABEL_21;
    case 9:
      v6 = CFSTR("open.safari");
      goto LABEL_21;
    case 11:
      v6 = CFSTR("downloads.button");
      goto LABEL_21;
    case 12:
      v6 = CFSTR("cancel.button");
      goto LABEL_21;
    case 13:
      v6 = CFSTR("buttonbar.formatmenu");
      goto LABEL_21;
    case 14:
      v6 = CFSTR("buttonbar.stop");
      goto LABEL_21;
    case 15:
      v6 = CFSTR("buttonbar.reload");
LABEL_21:
      accessibilitySafariServicesLocalizedString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v7);
LABEL_22:

      break;
    default:
      break;
  }

}

@end
