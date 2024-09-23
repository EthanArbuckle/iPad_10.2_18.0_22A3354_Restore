@implementation BookmarksTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BookmarksTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BookmarksTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BookmarksTableViewController"), CFSTR("_bookmarkAtIndexPath:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebBookmark"), CFSTR("isFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BookmarksTableViewController"), CFSTR("_searchBar"), "UISearchBar");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewControllerAccessibility;
  -[BookmarksTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[BookmarksTableViewControllerAccessibility _axUnhideSearchBar](self, "_axUnhideSearchBar");
}

- (void)_axUnhideSearchBar
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    -[BookmarksTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "setContentInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  }

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewControllerAccessibility;
  -[BookmarksTableViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BookmarksTableViewControllerAccessibility _axUnhideSearchBar](self, "_axUnhideSearchBar");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BookmarksTableViewControllerAccessibility;
  -[BookmarksTableViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v23, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "section") == 2)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    v16 = v7;
    AXPerformSafeBlock();
    v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("isFolder"));

    if (v10)
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("textLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("bookmark.folder"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v14, v13, CFSTR("__AXStringForVariablesSentinel"));

    }
  }

  return v8;
}

void __77__BookmarksTableViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_bookmarkAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BookmarksTableViewControllerAccessibility;
  v7 = a5;
  v8 = a3;
  -[BookmarksTableViewControllerAccessibility tableView:moveRowAtIndexPath:toIndexPath:](&v11, sel_tableView_moveRowAtIndexPath_toIndexPath_, v8, a4, v7);
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7, v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_accessibilityFindDescendant:", &__block_literal_global_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v10);

}

BOOL __86__BookmarksTableViewControllerAccessibility_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  NSClassFromString(CFSTR("UITableViewCellReorderControl"));
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v2, "_accessibilityViewIsVisible") & 1) != 0;

  return v3;
}

@end
