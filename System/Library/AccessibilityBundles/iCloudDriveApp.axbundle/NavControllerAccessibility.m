@implementation NavControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_UIDocumentListController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIDocumentListController"), CFSTR("_containerViewController"), "_UIDocumentPickerContainerViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDocumentPickerContainerViewController"), CFSTR("sortView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDocumentPickerSortOrderView"), CFSTR("listModeToggle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavController"), CFSTR("getTopDocumentListController"), "@", 0);

}

- (void)configureToolbar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavControllerAccessibility;
  v3 = a3;
  -[NavControllerAccessibility configureToolbar:](&v8, sel_configureToolbar_, v3);
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_containerViewController"), v8.receiver, v8.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("sortView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("listModeToggle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("listmode.label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

}

- (void)togglePickerMode:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavControllerAccessibility;
  -[NavControllerAccessibility togglePickerMode:](&v3, sel_togglePickerMode_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = v4;
  v5 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  _AXTableOrCollectionView(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], _AXTableOrCollectionViewHideElementsKey, v7, 3221225472, __59__NavControllerAccessibility_searchBarTextDidBeginEditing___block_invoke, &unk_2503F0C38);

}

id __59__NavControllerAccessibility_searchBarTextDidBeginEditing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidBeginEditing_, v1);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = v4;
  v5 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  _AXTableOrCollectionView(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", 0, _AXTableOrCollectionViewHideElementsKey, v7, 3221225472, __57__NavControllerAccessibility_searchBarTextDidEndEditing___block_invoke, &unk_2503F0C38);

}

id __57__NavControllerAccessibility_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidEndEditing_, v1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

id __54__NavControllerAccessibility_searchBar_textDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)NavControllerAccessibility;
  return objc_msgSendSuper2(&v4, sel_searchBar_textDidChange_, v2, v1);
}

@end
