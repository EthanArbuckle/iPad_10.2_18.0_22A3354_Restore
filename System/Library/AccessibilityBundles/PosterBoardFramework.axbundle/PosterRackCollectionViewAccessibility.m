@implementation PosterRackCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterRackCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.PosterRackCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("centeredPosterIndexPath"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("layoutMode"), "Q", 0);

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  objc_super v9;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityHint](&v6, sel_accessibilityHint);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility accessibilityElements](self, "accessibilityElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    return -[PosterRackCollectionViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }
  return v4;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
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
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityFrame](&v20, sel_accessibilityFrame);
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityPath](&v6, sel_accessibilityPath);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityCustomActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityCustomActions](&v6, sel_accessibilityCustomActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityTraits");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    return -[PosterRackCollectionViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility accessibilityElements](&v7, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __62__PosterRackCollectionViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  MEMORY[0x23491A0AC](CFSTR("PosterBoard.PosterSectionRemovalView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[PosterRackCollectionViewAccessibility _axIsPosterSwitcher](self, "_axIsPosterSwitcher"))
  {
    -[PosterRackCollectionViewAccessibility _axCenteredPoster](self, "_axCenteredPoster");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilitySupplementaryFooterViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PosterRackCollectionViewAccessibility;
    -[PosterRackCollectionViewAccessibility _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (id)_axCollectionViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axIsPosterSwitcher
{
  void *v2;
  uint64_t v3;

  -[PosterRackCollectionViewAccessibility _axCollectionViewController](self, "_axCollectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("layoutMode"));

  return v3 == 1;
}

- (id)_axCenteredPoster
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[PosterRackCollectionViewAccessibility _axCollectionViewController](self, "_axCollectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("centeredPosterIndexPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "cellForItemAtIndexPath:", v5),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleCells", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
          MEMORY[0x23491A0AC](CFSTR("PosterBoard.PosterGalleryAffordanceCollectionViewCell"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = v14;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_13:

  }
  return v7;
}

@end
