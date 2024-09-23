@implementation SBHAddWidgetDetailSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHAddWidgetDetailSheetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("widgetGalleryStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("widgetGalleryScrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("_createViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("_addPage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("scrollViewDidScroll:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("addButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHAddWidgetDetailSheetViewController"), CFSTR("applicationWidgetCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHApplicationWidgetCollection"), CFSTR("displayName"), "@", 0);

}

- (void)_createViews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  -[SBHAddWidgetDetailSheetViewControllerAccessibility _createViews](&v4, sel__createViews);
  -[SBHAddWidgetDetailSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("widgetGalleryScrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetPagingEnabled:", 1);

}

- (void)_addPage:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id val;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id location;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  v10 = a3;
  -[SBHAddWidgetDetailSheetViewControllerAccessibility _addPage:](&v22, sel__addPage_);
  -[SBHAddWidgetDetailSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("widgetGalleryStackView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("widgetGalleryScrollView"));
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v11, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_initWeak(&from, v9);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __63__SBHAddWidgetDetailSheetViewControllerAccessibility__addPage___block_invoke;
        v13[3] = &unk_250383B40;
        objc_copyWeak(&v14, &from);
        objc_copyWeak(&v15, &location);
        objc_msgSend(v9, "_setAccessibilityElementsHiddenBlock:", v13);
        objc_destroyWeak(&v15);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&from);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

uint64_t __63__SBHAddWidgetDetailSheetViewControllerAccessibility__addPage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  CGRect v18;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "accessibilityFrame");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  CGRectIntersection(v18, v19);
  v16 = AX_CGRectAlmostEqualToRect() ^ 1;

  return v16;
}

- (void)addButtonTapped:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  -[SBHAddWidgetDetailSheetViewControllerAccessibility addButtonTapped:](&v11, sel_addButtonTapped_, a3);
  -[SBHAddWidgetDetailSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_applicationWidgetCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("displayName"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("widget.added"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_250385500;
  if (v5)
    v8 = v5;
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttribute:forKey:", &unk_25038F638, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);

}

@end
