@implementation AXMiroPhotoScrubber

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(CFSTR("memory.content.scrubber"));
}

- (id)accessibilityValue
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
  void *v12;
  void *v14;

  -[AXMiroPhotoScrubber _axContainerCollectionView](self, "_axContainerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMiroPhotoScrubber _axCurrentIndexPath](self, "_axCurrentIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityMemoriesLocalizedString(CFSTR("memory.content.scrubber.index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "row");
  AXFormatInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberOfItemsInSection:", 0);
  AXFormatInteger();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_axContainerCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[AXMiroPhotoScrubber accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axCurrentIndexPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AXMiroPhotoScrubber _axContainerCollectionView](self, "_axContainerCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("MiroEditorFlowLayout"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("snappedIndexPath"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  -[AXMiroPhotoScrubber _axCurrentIndexPath](self, "_axCurrentIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMiroPhotoScrubber _axContainerCollectionView](self, "_axContainerCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", 0);
  if (objc_msgSend(v3, "row") < v5 - 1)
  {
    v6 = v4;
    v7 = v3;
    AXPerformSafeBlock();

  }
}

void __45__AXMiroPhotoScrubber_accessibilityIncrement__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6F98];
  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 48), "row") + 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView:didSelectItemAtIndexPath:", v5, v6);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[AXMiroPhotoScrubber _axCurrentIndexPath](self, "_axCurrentIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "row") >= 1)
  {
    -[AXMiroPhotoScrubber _axContainerCollectionView](self, "_axContainerCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v5 = v4;
    AXPerformSafeBlock();

  }
}

void __45__AXMiroPhotoScrubber_accessibilityDecrement__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6F98];
  objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 48), "row") - 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView:didSelectItemAtIndexPath:", v5, v6);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[AXMiroPhotoScrubber _axContainerCollectionView](self, "_axContainerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMiroPhotoScrubber accessibilityContainer](self, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  UIAccessibilityFrameForBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end
