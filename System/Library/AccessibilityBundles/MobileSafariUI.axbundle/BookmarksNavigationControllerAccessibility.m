@implementation BookmarksNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BookmarksNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BookmarksNavigationController"), CFSTR("_segmentedControlItemForCollection:"), "@", "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("BookmarksNavigationControllerDelegate"), CFSTR("bookmarksNavigationControllerDidPressDoneButton:"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BookmarksNavigationController"), CFSTR("_topLevelCollections"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BookmarksNavigationController"), CFSTR("_collectionSegmentedControl"), "UISegmentedControl");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BrowserRootViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BookmarksNavigationController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BookmarksNavigationController"), CFSTR("UINavigationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationController"), CFSTR("transitionConductor:didEndTransitionFromView:toView:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("rootViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("Application"), CFSTR("_browserWindowController"), "BrowserWindowController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserWindowController"), CFSTR("browserControllers"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BookmarksNavigationControllerAccessibility;
  -[BookmarksNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[BookmarksNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionSegmentedControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    -[BookmarksNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_topLevelCollections"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "numberOfSegments"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "imageForSegmentAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v6, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[BookmarksNavigationControllerAccessibility _setAccessibilityLabelForItem:fromCollection:](self, "_setAccessibilityLabelForItem:fromCollection:", v8, v10);
        ++v7;
      }
      while (objc_msgSend(v4, "numberOfSegments") > v7);
    }

  }
}

- (id)_segmentedControlItemForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BookmarksNavigationControllerAccessibility;
  v4 = a3;
  -[BookmarksNavigationControllerAccessibility _segmentedControlItemForCollection:](&v8, sel__segmentedControlItemForCollection_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksNavigationControllerAccessibility _setAccessibilityLabelForItem:fromCollection:](self, "_setAccessibilityLabelForItem:fromCollection:", v5, v4, v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_setAccessibilityLabelForItem:(id)a3 fromCollection:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("BookmarksCollection")) & 1) != 0)
  {
    v7 = CFSTR("buttonbar.bookmarks.text");
LABEL_11:
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v8);

    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("CloudTabsCollection")) & 1) != 0)
  {
    v7 = CFSTR("bookmarks.nav.icloud");
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HistoryCollection")) & 1) != 0)
  {
    v7 = CFSTR("bookmarks.nav.history");
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ReadingListCollection")) & 1) != 0)
  {
    v7 = CFSTR("reading.list.button");
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("SocialLinksCollection")))
  {
    v7 = CFSTR("bookmarks.nav.social");
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  _UIAccessibilityBlockPostingOfNotification();
  v11.receiver = self;
  v11.super_class = (Class)BookmarksNavigationControllerAccessibility;
  -[BookmarksNavigationControllerAccessibility transitionConductor:didEndTransitionFromView:toView:](&v11, sel_transitionConductor_didEndTransitionFromView_toView_, v10, v9, v8);

  _UIAccessibilityUnblockPostingOfNotification();
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  BookmarksNavigationControllerAccessibility *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[BookmarksNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookmarksNavigationControllerDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((AXDeviceIsPad() & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v26 = 0;
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_browserWindowController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "safeArrayForKey:", CFSTR("browserControllers"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    if (v7)
    {
      v8 = v7;
      v19 = v5;
      v20 = v3;
      v9 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v26 = 0;
          objc_opt_class();
          objc_msgSend(v11, "safeValueForKey:", CFSTR("rootViewController"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            abort();
          objc_msgSend(v13, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "window");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[BookmarksNavigationControllerAccessibility view](self, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "window");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v17)
          {
            v4 = objc_msgSend(v11, "accessibilityPerformEscape");
            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
        if (v8)
          continue;
        break;
      }
      v4 = 0;
LABEL_16:
      v5 = v19;
      v3 = v20;
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __72__BookmarksNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v30 = &unk_25029F250;
    v31 = v3;
    v32 = self;
    AXPerformSafeBlock();
    v4 = 1;
    v5 = v31;
  }

  return v4;
}

uint64_t __72__BookmarksNavigationControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bookmarksNavigationControllerDidPressDoneButton:", *(_QWORD *)(a1 + 40));
}

@end
