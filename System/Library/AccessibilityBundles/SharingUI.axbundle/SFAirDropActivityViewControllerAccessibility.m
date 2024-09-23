@implementation SFAirDropActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAirDropActivityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_collectionView"), "UICollectionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_airDropIconView"), "SFAirDropIconView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_airDropActiveIconView"), "SFAirDropActiveIconView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_noWifiTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAirDropActivityViewController"), CFSTR("_instructionsTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropActivityViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropActivityViewController"), CFSTR("updateContentAreaAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropActivityViewController"), CFSTR("setSharedItemsAvailable:"), "v", "B", 0);

}

- (void)_axAddIfVisible:(id)a3 toArray:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    objc_msgSend(v5, "addObject:", v6);

}

- (void)_axAnnotateCollectionViewCellIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIAccessibilityNotifications v12;
  void *v13;
  id v14;

  -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v14;
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v6, v5);

    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v7, v5);

    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_airDropIconView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v8, v5);

    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_noWifiTextView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v9, v5);

    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_airDropActiveIconView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v10, v5);

    -[SFAirDropActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_instructionsTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropActivityViewControllerAccessibility _axAddIfVisible:toArray:](self, "_axAddIfVisible:toArray:", v11, v5);

    objc_msgSend(v14, "setAccessibilityElements:", v5);
    if (-[SFAirDropActivityViewControllerAccessibility _axDidPostScreenChangeAfterAppearance](self, "_axDidPostScreenChangeAfterAppearance"))
    {
      v12 = *MEMORY[0x24BDF72C8];
      v13 = 0;
    }
    else
    {
      -[SFAirDropActivityViewControllerAccessibility _axSetDidPostScreenChangeAfterAppearance:](self, "_axSetDidPostScreenChangeAfterAppearance:", 1);
      v12 = *MEMORY[0x24BDF7328];
      v13 = (void *)*MEMORY[0x24BDFEF20];
    }
    UIAccessibilityPostNotification(v12, v13);

    v4 = v14;
  }

}

- (BOOL)_axDidPostScreenChangeAfterAppearance
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetDidPostScreenChangeAfterAppearance:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SFAirDropActivityViewControllerAccessibility _axSetDidPostScreenChangeAfterAppearance:](self, "_axSetDidPostScreenChangeAfterAppearance:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  -[SFAirDropActivityViewControllerAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  -[SFAirDropActivityViewControllerAccessibility _axAnnotateCollectionViewCellIfNeeded](self, "_axAnnotateCollectionViewCellIfNeeded");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  -[SFAirDropActivityViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SFAirDropActivityViewControllerAccessibility _axAnnotateCollectionViewCellIfNeeded](self, "_axAnnotateCollectionViewCellIfNeeded");
}

- (void)updateContentAreaAnimated:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  -[SFAirDropActivityViewControllerAccessibility updateContentAreaAnimated:](&v5, sel_updateContentAreaAnimated_);
  if (v3)
    AXPerformBlockOnMainThreadAfterDelay();
  else
    -[SFAirDropActivityViewControllerAccessibility _axAnnotateCollectionViewCellIfNeeded](self, "_axAnnotateCollectionViewCellIfNeeded");
  -[SFAirDropActivityViewControllerAccessibility _axAnnotateCollectionViewCellIfNeeded](self, "_axAnnotateCollectionViewCellIfNeeded");
}

uint64_t __74__SFAirDropActivityViewControllerAccessibility_updateContentAreaAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axAnnotateCollectionViewCellIfNeeded");
}

- (void)setSharedItemsAvailable:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAirDropActivityViewControllerAccessibility;
  -[SFAirDropActivityViewControllerAccessibility setSharedItemsAvailable:](&v4, sel_setSharedItemsAvailable_, a3);
  -[SFAirDropActivityViewControllerAccessibility _axAnnotateCollectionViewCellIfNeeded](self, "_axAnnotateCollectionViewCellIfNeeded");
}

@end
