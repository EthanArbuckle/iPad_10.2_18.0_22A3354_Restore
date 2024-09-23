@implementation PosterRackCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterRackCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("pageControl"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("centeredPosterIndexPath"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("scrollView"), "@");
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.PosterSectionRemovalView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterSectionRemovalView"), CFSTR("deleteButton"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("layoutMode"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("addPosterButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("centeredPoster"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterPair"), CFSTR("localizedTitle"), "@", 0);

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PosterRackCollectionViewControllerAccessibility *v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;

  objc_opt_class();
  -[PosterRackCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PosterRackCollectionViewControllerAccessibility _axCollectionView](self, "_axCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[PosterRackCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("centeredPosterIndexPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("scrollView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PosterRackCollectionViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("layoutMode")) == 1)
  {
    switch(a3)
    {
      case 1:
        v13 = self;
        v14 = 0;
        goto LABEL_10;
      case 2:
        v13 = self;
        v14 = 1;
LABEL_10:
        v16 = -[PosterRackCollectionViewControllerAccessibility _axScrollLeft:pageControl:collectionView:](v13, "_axScrollLeft:pageControl:collectionView:", v14, v6, v7);
        goto LABEL_13;
      case 3:
        v15 = 1;
        objc_msgSend(v12, "setContentOffset:animated:", 1, 0.0, 0.0);
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
        break;
      case 4:
        v16 = -[PosterRackCollectionViewControllerAccessibility _axScrollDown:scrollView:](self, "_axScrollDown:scrollView:", v7, v12);
LABEL_13:
        v15 = v16;
        break;
      default:
        v15 = 1;
        break;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)viewDidLayoutSubviews
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PosterRackCollectionViewControllerAccessibility;
  -[PosterRackCollectionViewControllerAccessibility viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  v3 = -[PosterRackCollectionViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("layoutMode")) == 4;
  -[PosterRackCollectionViewControllerAccessibility _axCollectionView](self, "_axCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", v3);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __72__PosterRackCollectionViewControllerAccessibility_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axSetPageControlValue");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PosterRackCollectionViewControllerAccessibility;
  -[PosterRackCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PosterRackCollectionViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("addPosterButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("poster.gallery.affordance.cell.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[PosterRackCollectionViewControllerAccessibility _axSetPageControlValue](self, "_axSetPageControlValue");
}

- (id)_axCollectionView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axScrollDown:(id)a3 scrollView:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = AXLockScreenPostersCount(v5);
  if (v7 != 1)
  {
    objc_msgSend(v6, "contentSize");
    v9 = v8;
    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v9 - v10);
    v12 = v5;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v7 != 1;
}

void __76__PosterRackCollectionViewControllerAccessibility__axScrollDown_scrollView___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessibilityElements", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v1);
      v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
      MEMORY[0x23491A0AC](CFSTR("PosterBoard.PosterSectionRemovalView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    objc_msgSend(v6, "safeValueForKey:", CFSTR("deleteButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v7);
    v1 = v7;
  }
LABEL_12:

}

- (BOOL)_axScrollLeft:(BOOL)a3 pageControl:(id)a4 collectionView:(id)a5
{
  if (a3)
    objc_msgSend(a4, "accessibilityIncrement");
  else
    objc_msgSend(a4, "accessibilityDecrement");
  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __92__PosterRackCollectionViewControllerAccessibility__axScrollLeft_pageControl_collectionView___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF71E8];
  objc_msgSend(*(id *)(a1 + 32), "_axCollectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)_axSetPageControlValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_opt_class();
  -[PosterRackCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "currentPage");
  v6 = objc_msgSend(v4, "numberOfPages") - 1;
  -[PosterRackCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("centeredPoster"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("localizedTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1)
  {
    accessibilityLocalizedString(CFSTR("page.control.one.wallpaper.available.value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 >= v6)
    {
      v10 = 0;
      goto LABEL_7;
    }
    accessibilityLocalizedString(CFSTR("page.control.format.text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  AXCFormattedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v11, v10, CFSTR("__AXStringForVariablesSentinel"));

}

@end
