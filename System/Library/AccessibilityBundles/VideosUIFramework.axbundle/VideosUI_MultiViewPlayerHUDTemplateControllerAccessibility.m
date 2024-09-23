@implementation VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MultiViewPlayerHUDTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiViewPlayerHUDTemplateController"), CFSTR("updateVisibleCellsWithPlaybackIdentifiers:"), "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  -[VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  v14 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = *MEMORY[0x24BDF73E0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setAccessibilityTraits:", v8);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v6);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  -[VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)updateVisibleCellsWithPlaybackIdentifiers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility;
  -[VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility updateVisibleCellsWithPlaybackIdentifiers:](&v4, sel_updateVisibleCellsWithPlaybackIdentifiers_, a3);
  -[VideosUI_MultiViewPlayerHUDTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
