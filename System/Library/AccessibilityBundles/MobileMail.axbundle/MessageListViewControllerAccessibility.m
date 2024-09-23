@implementation MessageListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessageListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("_updateBackButtonImageWithCount:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("scene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("_updateToolbarButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("shelfButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailMainScene"), CFSTR("splitViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MessageListViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("filterButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("filterPickerControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailboxFilterBarButtonItem"), CFSTR("isFilterEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListContainerViewController"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("mf_navigationItem"), "@", 0);

}

- (unint64_t)_axGetTriageActionForAnnouncement
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_axSetTriageActionForAnnouncement:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location[6];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MessageListViewControllerAccessibility;
  -[MessageListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  v3 = MEMORY[0x24BDAC760];
  location[1] = (id)MEMORY[0x24BDAC760];
  location[2] = (id)3221225472;
  location[3] = __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  location[4] = &unk_250285728;
  location[5] = self;
  AXPerformSafeBlock();
  -[MessageListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("filterButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v4);
  objc_initWeak(&from, self);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_250285F08;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

uint64_t __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateToolbarButtons");
}

id __84__MessageListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("filterPickerControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("filtersLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v1 += 5;
  v6 = objc_loadWeakRetained(v1);
  v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("_filterEnabled"));

  v8 = objc_loadWeakRetained(v1);
  if (v7)
  {
    accessibilityLocalizedString(CFSTR("toggle.filtering.on"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityValue:", v9);

    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("toggle.filtering.choose"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("toggle.filtering.off"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityValue:", v13);

    accessibilityLocalizedString(CFSTR("toggle.filtering"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessageListViewControllerAccessibility;
  -[MessageListViewControllerAccessibility viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  accessibilityLocalizedString(CFSTR("mail.message.list.name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)_updateBackButtonImageWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MessageListViewControllerAccessibility;
  -[MessageListViewControllerAccessibility _updateBackButtonImageWithCount:](&v14, sel__updateBackButtonImageWithCount_);
  objc_opt_class();
  -[MessageListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mf_navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && v7)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("unread.count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    __AXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backBarButtonItem", v11, CFSTR("__AXStringForVariablesSentinel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v12);

  }
  else
  {
    objc_msgSend(v6, "backBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", 0);
  }

}

- (id)shelfButtonItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListViewControllerAccessibility;
  -[MessageListViewControllerAccessibility shelfButtonItem](&v5, sel_shelfButtonItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("app.shelf.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
