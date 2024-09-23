@implementation MTAWorldClockCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MTAWorldClockCollectionCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("MTAWorldClockView"));
  objc_msgSend(v3, "validateClass:", CFSTR("WorldClockCity"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTAWorldClockCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockCollectionCell"), CFSTR("worldClockView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("city"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WorldClockCity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionViewController"), CFSTR("_reorderingGesture"), "UILongPressGestureRecognizer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewController"), CFSTR("_installReorderingGestureIfNecessary"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  -[MTAWorldClockCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTAWorldClockCollectionViewControllerAccessibility _axModifyReorderingGesture](self, "_axModifyReorderingGesture");
  -[MTAWorldClockCollectionViewControllerAccessibility _axModifyCollectionView](self, "_axModifyCollectionView");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  -[MTAWorldClockCollectionViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MTAWorldClockCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)nameForWorldClockCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3 && (MEMORY[0x234916758](CFSTR("MTAWorldClockCollectionCell")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("worldClockView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("city"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  -[MTAWorldClockCollectionViewControllerAccessibility collectionView:moveItemAtIndexPath:toIndexPath:](&v28, sel_collectionView_moveItemAtIndexPath_toIndexPath_, v8, v9, v10);
  v11 = objc_msgSend(v8, "numberOfItemsInSection:", objc_msgSend(v10, "section"));
  if (v11 >= 2)
  {
    v12 = v11;
    objc_opt_class();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14 || !v16)
      goto LABEL_10;
    -[MTAWorldClockCollectionViewControllerAccessibility nameForWorldClockCell:](self, "nameForWorldClockCell:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "row") == v12 - 1)
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") - 1, objc_msgSend(v10, "section"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForItemAtIndexPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = CFSTR("clock.moved.after");
      if (!v20)
        goto LABEL_9;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, objc_msgSend(v10, "section"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cellForItemAtIndexPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = CFSTR("clock.moved.before");
      if (!v20)
      {
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    -[MTAWorldClockCollectionViewControllerAccessibility nameForWorldClockCell:](self, "nameForWorldClockCell:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v26, v17, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

    goto LABEL_9;
  }
LABEL_11:

}

- (void)movedItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "row");
  v9 = objc_msgSend(v7, "row");
  v10 = CFSTR("clock.moving.before");
  if (v8 < v9)
    v10 = CFSTR("clock.moving.after");
  v11 = v10;
  -[MTAWorldClockCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v12, "cellForItemAtIndexPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAWorldClockCollectionViewControllerAccessibility nameForWorldClockCell:](self, "nameForWorldClockCell:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (void)_installReorderingGestureIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockCollectionViewControllerAccessibility;
  -[MTAWorldClockCollectionViewControllerAccessibility _installReorderingGestureIfNecessary](&v3, sel__installReorderingGestureIfNecessary);
  -[MTAWorldClockCollectionViewControllerAccessibility _axModifyReorderingGesture](self, "_axModifyReorderingGesture");
}

- (void)_axModifyReorderingGesture
{
  void *v3;
  void *v4;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    -[MTAWorldClockCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reorderingGesture"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setMinimumPressDuration:", 0.1);
  }
}

- (void)_axModifyCollectionView
{
  void *v2;
  id v3;

  -[MTAWorldClockCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("world.clocks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXMTWorldClockCollectionView"));

}

@end
