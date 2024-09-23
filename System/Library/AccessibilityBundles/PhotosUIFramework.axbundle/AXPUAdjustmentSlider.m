@implementation AXPUAdjustmentSlider

- (AXPUAdjustmentSlider)initWithAccessibilityContainer:(id)a3
{
  AXPUAdjustmentSlider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXPUAdjustmentSlider;
  v3 = -[AXPUAdjustmentSlider initWithAccessibilityContainer:](&v5, sel_initWithAccessibilityContainer_, a3);
  -[AXPUAdjustmentSlider _setAXPreviousSelectedIndexPathSection:](v3, "_setAXPreviousSelectedIndexPathSection:", -1);

  return v3;
}

- (id)_axAdjustmentInfo
{
  id v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  -[AXPUAdjustmentSlider _axContainingSelectedIndexPath](self, "_axContainingSelectedIndexPath");
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void __41__AXPUAdjustmentSlider__axAdjustmentInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axSelectedAdjustmentCell
{
  void *v3;
  void *v4;
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPUAdjustmentSlider _axContainingSelectedIndexPath](self, "_axContainingSelectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v7 = v3;
  v8 = v4;
  AXPerformSafeBlock();
  v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __49__AXPUAdjustmentSlider__axSelectedAdjustmentCell__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axDataSource
{
  void *v2;
  void *v3;

  -[AXPUAdjustmentSlider _axContainerViewController](self, "_axContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axContainerViewController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[AXPUAdjustmentSlider accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axContainerCollectionView
{
  void *v2;
  void *v3;
  void *v4;

  -[AXPUAdjustmentSlider _axContainerViewController](self, "_axContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axContainingSelectedIndexPath
{
  void *v2;
  void *v3;

  -[AXPUAdjustmentSlider _axContainerViewController](self, "_axContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("selectedIndexPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;

  v3 = a3;
  -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPUAdjustmentSlider _axContainingSelectedIndexPath](self, "_axContainingSelectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numberOfSections");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "section");
    if ((v9 & 0x8000000000000000) == 0)
    {
      v10 = v9;
      if (v9 < v8)
      {
        -[AXPUAdjustmentSlider _setAXPreviousSelectedIndexPathSection:](self, "_setAXPreviousSelectedIndexPathSection:", v9);
        v11 = objc_msgSend(v6, "row");
        if (v3)
        {
          if (v11 < objc_msgSend(v5, "numberOfItemsInSection:", v10) - 1)
          {
            v12 = (void *)MEMORY[0x24BDD15D8];
            v13 = objc_msgSend(v6, "row") + 1;
LABEL_14:
            v15 = v12;
            goto LABEL_15;
          }
          if (++v10 < (unint64_t)v8)
          {
            v15 = (void *)MEMORY[0x24BDD15D8];
            v13 = 0;
LABEL_15:
            objc_msgSend(v15, "indexPathForItem:inSection:", v13, v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              v18 = objc_msgSend(v16, "item");
              if (v18 < objc_msgSend(v5, "numberOfItemsInSection:", v10))
              {
                -[AXPUAdjustmentSlider _axContainerViewController](self, "_axContainerViewController");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v19, "safeIntegerForKey:", CFSTR("layoutDirection")))
                  v20 = 2;
                else
                  v20 = 16;
                objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v17, 0, 0);
                objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v17, v20, 0);
                v22 = v19;
                v17 = v17;
                v21 = v19;
                AXPerformSafeBlock();

              }
            }
            goto LABEL_22;
          }
LABEL_21:
          v17 = 0;
LABEL_22:

          goto LABEL_23;
        }
        if (v11 < 1)
        {
          if (!v10)
            goto LABEL_21;
          --v10;
          v12 = (void *)MEMORY[0x24BDD15D8];
          v14 = objc_msgSend(v5, "numberOfItemsInSection:", v10);
        }
        else
        {
          v12 = (void *)MEMORY[0x24BDD15D8];
          v14 = objc_msgSend(v6, "row");
        }
        v13 = v14 - 1;
        goto LABEL_14;
      }
    }
  }
LABEL_23:

}

uint64_t __39__AXPUAdjustmentSlider__axAdjustValue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedIndexPath:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSliderForControlAtIndexPath:", *(_QWORD *)(a1 + 40));
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;

  -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  accessibilityPULocalizedString(CFSTR("adjustments.slider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 <= 1)
  {
    -[AXPUAdjustmentSlider _axAdjustmentInfo](self, "_axAdjustmentInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("localizedSectionName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityPULocalizedString(CFSTR("adjustments.instructions"));
}

- (int64_t)_axPreviousSelectedIndexPathSection
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_setAXPreviousSelectedIndexPathSection:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[AXPUAdjustmentSlider _axSelectedAdjustmentCell](self, "_axSelectedAdjustmentCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPUAdjustmentSlider _axAdjustmentInfo](self, "_axAdjustmentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("localizedName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXPUAdjustmentSlider _axPreviousSelectedIndexPathSection](self, "_axPreviousSelectedIndexPathSection");
  -[AXPUAdjustmentSlider _axContainingSelectedIndexPath](self, "_axContainingSelectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "section") == v6)
  {
    v8 = 0;
  }
  else
  {
    -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v7, "section")) < 2)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("localizedSectionName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEnabled")))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "accessibilityValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberOfSections");
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)accessibilityIncrement
{
  -[AXPUAdjustmentSlider _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (void)accessibilityDecrement
{
  -[AXPUAdjustmentSlider _axAdjustValue:](self, "_axAdjustValue:", 0);
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

  -[AXPUAdjustmentSlider _axContainerCollectionView](self, "_axContainerCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPUAdjustmentSlider accessibilityContainer](self, "accessibilityContainer");
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

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)_accessibilityUserTestingElementBaseType
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  BOOL v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  objc_super v11;

  -[AXPUAdjustmentSlider _axSelectedAdjustmentCell](self, "_axSelectedAdjustmentCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)AXPUAdjustmentSlider;
  v4 = -[AXPUAdjustmentSlider accessibilityActivate](&v11, sel_accessibilityActivate);
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEnabled")))
    v5 = CFSTR("adjustments.tool.off");
  else
    v5 = CFSTR("adjustments.tool.on");
  accessibilityPULocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribute:forKey:", &unk_24FF217D0, *MEMORY[0x24BDFEAD8]);
  v10 = v7;
  v8 = v7;
  AXPerformBlockOnMainThread();

  return v4;
}

void __45__AXPUAdjustmentSlider_accessibilityActivate__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

@end
