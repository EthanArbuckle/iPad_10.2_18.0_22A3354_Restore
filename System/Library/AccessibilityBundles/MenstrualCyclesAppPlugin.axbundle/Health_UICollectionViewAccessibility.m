@implementation Health_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v4;
  char v5;
  objc_super v6;

  if (AXDoesRequestingClientDeserveAutomation())
    return 0;
  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if ((v5 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)Health_UICollectionViewAccessibility;
  return -[Health_UICollectionViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;

  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if (v4
    && (-[Health_UICollectionViewAccessibility centerCellFromCollectionView:](self, "centerCellFromCollectionView:", self), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)Health_UICollectionViewAccessibility;
    -[Health_UICollectionViewAccessibility accessibilityValue](&v11, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if (v4)
    return *MEMORY[0x24BDF73A0];
  v6.receiver = self;
  v6.super_class = (Class)Health_UICollectionViewAccessibility;
  return -[Health_UICollectionViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  objc_super v5;

  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if (v4)
    -[Health_UICollectionViewAccessibility adjustCycleTimelineCollectionViewIncrement:](self, "adjustCycleTimelineCollectionViewIncrement:", 1);
  v5.receiver = self;
  v5.super_class = (Class)Health_UICollectionViewAccessibility;
  -[Health_UICollectionViewAccessibility accessibilityIncrement](&v5, sel_accessibilityIncrement);
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  objc_super v5;

  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if (v4)
    -[Health_UICollectionViewAccessibility adjustCycleTimelineCollectionViewIncrement:](self, "adjustCycleTimelineCollectionViewIncrement:", 0);
  v5.receiver = self;
  v5.super_class = (Class)Health_UICollectionViewAccessibility;
  -[Health_UICollectionViewAccessibility accessibilityDecrement](&v5, sel_accessibilityDecrement);
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[Health_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXLoggingCardCarouselViewCollectionView")))
  {

    return 1;
  }
  -[Health_UICollectionViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXCycleTimelineCollectionView"));

  if ((v5 & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)Health_UICollectionViewAccessibility;
  return -[Health_UICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](&v7, sel_accessibilityCollectionViewBehavesLikeUIViewAccessibility);
}

- (void)adjustCycleTimelineCollectionViewIncrement:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  Health_UICollectionViewAccessibility *v16;

  v3 = a3;
  v16 = self;
  -[Health_UICollectionViewAccessibility centerCellFromCollectionView:](v16, "centerCellFromCollectionView:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[Health_UICollectionViewAccessibility indexPathForCell:](v16, "indexPathForCell:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD15D8];
    v7 = objc_msgSend(v5, "item");
    v8 = objc_msgSend(v5, "section");
    if (v3)
      v9 = v7 + 1;
    else
      v9 = v7 - 1;
    objc_msgSend(v6, "indexPathForItem:inSection:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[Health_UICollectionViewAccessibility cellForItemAtIndexPath:](v16, "cellForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "center");
      v13 = v12;
      -[Health_UICollectionViewAccessibility bounds](v16, "bounds");
      v15 = v13 + v14 * -0.5;
      -[Health_UICollectionViewAccessibility contentOffset](v16, "contentOffset");
      -[Health_UICollectionViewAccessibility setContentOffset:animated:](v16, "setContentOffset:animated:", 1, v15);
    }

  }
}

- (id)centerCellFromCollectionView:(id)a3
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

@end
