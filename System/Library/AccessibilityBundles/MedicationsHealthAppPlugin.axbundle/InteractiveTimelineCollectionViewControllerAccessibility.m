@implementation InteractiveTimelineCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MedicationsHealthAppPlugin.InteractiveTimelineCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MedicationsHealthAppPlugin.InteractiveTimelineCollectionViewController"), CFSTR("UICollectionViewController"));
}

- (id)_accessibilitySafeCollectionView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[InteractiveTimelineCollectionViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)InteractiveTimelineCollectionViewControllerAccessibility;
  -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilitySafeCollectionView](self, "_accessibilitySafeCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0]);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11[3] = &unk_250279558;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_250279558;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setAccessibilityValueBlock:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v7[3] = &unk_250279580;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setAccessibilityIncrementBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v5[3] = &unk_250279580;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityDecrementBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

id __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessibilitySafeCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityCenterCellFromCollectionView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessibilitySafeCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityCenterCellFromCollectionView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityAdjustTimelineCollectionViewIncrement:", 1);

}

void __102__InteractiveTimelineCollectionViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityAdjustTimelineCollectionViewIncrement:", 0);

}

- (void)_accessibilityAdjustTimelineCollectionViewIncrement:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v3 = a3;
  -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilitySafeCollectionView](self, "_accessibilitySafeCollectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilityCenterCellFromCollectionView:](self, "_accessibilityCenterCellFromCollectionView:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v17, "indexPathForCell:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD15D8];
    v8 = objc_msgSend(v6, "item");
    v9 = objc_msgSend(v6, "section");
    if (v3)
      v10 = v8 + 1;
    else
      v10 = v8 - 1;
    objc_msgSend(v7, "indexPathForItem:inSection:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "center");
      v14 = v13;
      objc_msgSend(v17, "bounds");
      v16 = v14 + v15 * -0.5;
      objc_msgSend(v17, "contentOffset");
      objc_msgSend(v17, "setContentOffset:animated:", 1, v16);
    }

  }
}

- (id)_accessibilityCenterCellFromCollectionView:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGPoint v21;
  CGRect v22;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "bounds");
  AX_CGRectGetCenter();
  v5 = v4;
  v7 = v6;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "indexPathsForVisibleItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      objc_msgSend(v3, "convertRect:fromView:", v13);
      v21.x = v5;
      v21.y = v7;
      if (CGRectContainsPoint(v22, v21))
        break;

      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InteractiveTimelineCollectionViewControllerAccessibility;
  -[InteractiveTimelineCollectionViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[InteractiveTimelineCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
