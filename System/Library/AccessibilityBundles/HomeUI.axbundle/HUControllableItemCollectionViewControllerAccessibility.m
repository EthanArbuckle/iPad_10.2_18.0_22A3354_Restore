@implementation HUControllableItemCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUControllableItemCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUControllableItemCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUControllableItemCollectionViewController"), CFSTR("_quickControlPresentationCoordinator"), "HUQuickControlPresentationCoordinator");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("setPresentationContext:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("setPresentationContext:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("_preparePressedItemContextForItem:startApplier:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("_beginControlPresentationAnimated:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("_pressGestureDidBeginWithLocation:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("_pressGestureDidEnd:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlPresentationCoordinator"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("HUQuickControlPresentationCoordinatorDelegate"), CFSTR("presentationCoordinator:contextForPresentationAtPoint:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridServiceCell"), CFSTR("HUGridCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UICollectionViewCell"), CFSTR("UICollectionReusableView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionReusableView"), CFSTR("_collectionView"), "UICollectionView");
  objc_msgSend(v3, "validateClass:", CFSTR("HFAbstractControlStatusItem"));

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[HUControllableItemCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  if (a3 == 1)
  {
    v7 = objc_msgSend(v5, "accessibilityScrollRightPage");
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    v7 = objc_msgSend(v5, "accessibilityScrollLeftPage");
  }
  else
  {
LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
    v7 = -[HUControllableItemCollectionViewControllerAccessibility accessibilityScroll:](&v10, sel_accessibilityScroll_, a3);
  }
LABEL_7:
  v8 = v7;

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
  -[HUControllableItemCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, AXOpenControlsNotification, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__axOpenControls_, AXOpenControlsNotification, 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUControllableItemCollectionViewControllerAccessibility;
  -[HUControllableItemCollectionViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUControllableItemCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axOpenControls:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("_collectionView.delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUControllableItemCollectionViewControllerAccessibility isEqual:](self, "isEqual:", v7))
  {
    objc_msgSend(v6, "center");
    objc_msgSend(v6, "safeValueForKey:", CFSTR("item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234911848](CFSTR("HUGridCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
    {
      -[HUControllableItemCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_quickControlPresentationCoordinator"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x234911848](CFSTR("HUQuickControlPresentationCoordinator"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        NSProtocolFromString(CFSTR("HUQuickControlPresentationCoordinatorDelegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "conformsToProtocol:", v11);

        if (v12)
        {
          v13 = v9;
          v14 = v10;
          v15 = v8;
          AXPerformSafeBlock();

        }
      }

    }
  }

}

id __75__HUControllableItemCollectionViewControllerAccessibility__axOpenControls___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "presentationCoordinator:contextForPresentationAtPoint:", v2, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentationContext:", v3);

  MEMORY[0x234911848](CFSTR("HFAbstractControlStatusItem"));
  LOBYTE(v2) = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 32), "_preparePressedItemContextForItem:startApplier:", *(_QWORD *)(a1 + 48), (v2 & 1) == 0);
  result = (id)objc_msgSend(*(id *)(a1 + 32), "_beginControlPresentationAnimated:", 1);
  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_pressGestureDidBeginWithLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    return (id)objc_msgSend(*(id *)(a1 + 32), "_pressGestureDidEnd:", 1);
  }
  return result;
}

@end
