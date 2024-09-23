@implementation SKUIVerticalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIVerticalLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIViewReuseCollectionViewCell"), CFSTR("allExistingViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIVerticalLockupCollectionViewCell"), CFSTR("_lockupView"), "SKUIVerticalLockupView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUIVerticalLockupCollectionViewCell"), CFSTR("SKUICollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("SKUIImageView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIAdornedImageView"), CFSTR("_reuseView"), "SKUIAdornedImageViewReuseView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIAdornedImageViewReuseView"), CFSTR("_playButton"), "SKUIPlayButton");

}

- (BOOL)isAccessibilityElement
{
  return !-[SKUIVerticalLockupCollectionViewCellAccessibility hasOnlyStringViews](self, "hasOnlyStringViews");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)hasOnlyStringViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SKUIVerticalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockupView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SKUIAttributedStringView"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "accessibilityLabel"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v5, self, sel__playAction_);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityFindPlayButton
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySupplementaryFooterViewsForThisCell:includeText:](self, "_accessibilitySupplementaryFooterViewsForThisCell:includeText:", 1, 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "accessibilityIdentification", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PlayButton"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_playAction:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "accessibilityActivate");
  else
    v5 = 0;

  return v5;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[SKUIVerticalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockupView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v3;
  NSClassFromString(CFSTR("SKUIImageView"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v7)
  {
    v9 = 0;
    v24 = 0;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = 0;
  v24 = 0;
  v10 = *(_QWORD *)v26;
  v11 = 0x24BDF6000uLL;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "accessibilityLabel", v21, v22);
        v14 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(v13, "_accessibilityViewIsVisible"))
      {
        objc_msgSend(v13, "accessibilityLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v14;
        v22 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v15 = v11;
        v16 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v16;
        v11 = v15;
        goto LABEL_9;
      }
LABEL_10:
      ++v12;
    }
    while (v8 != v12);
    v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    v8 = v17;
  }
  while (v17);
LABEL_18:

  v18 = v24;
  if (!objc_msgSend(v24, "length"))
  {
    v19 = v9;

    v18 = v19;
  }

  return v18;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_indeterminate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    accessibilitySKUILocalizedString(CFSTR("indeterminate.playback"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViewsForThisCell:(BOOL)a3 includeText:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL8 v21;
  _BOOL8 v22;
  unint64_t v23;
  id v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v29;
  SKUIVerticalLockupCollectionViewCellAccessibility *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v5 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIVerticalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockupView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v9;
    v30 = self;
    v36 = 0;
    objc_msgSend(v9, "safeValueForKey:", CFSTR("subviews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0x24BDF6000uLL;
      v16 = CFSTR("SKUIAttributedStringView");
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        v31 = v14;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "axSafelyAddObject:", v19);
          if (v4)
          {
            NSClassFromString(&v16->isa);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v7, "axSafelyAddObject:", v19);
          }
          if (v5)
          {
            NSClassFromString(CFSTR("SKUIAdornedImageView"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = v17;
              v21 = v5;
              v22 = v4;
              v23 = v15;
              v24 = v12;
              v25 = v16;
              objc_msgSend(v19, "safeValueForKey:", CFSTR("_reuseView"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "safeValueForKey:", CFSTR("_playButton"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v27, "_accessibilityViewIsVisible"))
              {
                objc_msgSend(v27, "accessibilitySetIdentification:", CFSTR("PlayButton"));
                objc_msgSend(v7, "axSafelyAddObject:", v27);
              }

              v16 = v25;
              v12 = v24;
              v15 = v23;
              v4 = v22;
              v5 = v21;
              v17 = v20;
              v14 = v31;
            }
          }
          ++v18;
        }
        while (v14 != v18);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v14);
    }

    -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](v30, "_accessibilitySetRetainedValue:forKey:", v7, *MEMORY[0x24BEBB308]);
  }
  return v7;
}

- (id)accessibilityElements
{
  void *v3;

  if (-[SKUIVerticalLockupCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v3 = 0;
  }
  else
  {
    -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySupplementaryFooterViewsForThisCell:includeText:](self, "_accessibilitySupplementaryFooterViewsForThisCell:includeText:", 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;

  if (-[SKUIVerticalLockupCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    && (-[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySupplementaryFooterViewsForThisCell:includeText:](self, "_accessibilitySupplementaryFooterViewsForThisCell:includeText:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)automationElements
{
  return -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySupplementaryFooterViewsForThisCell:includeText:](self, "_accessibilitySupplementaryFooterViewsForThisCell:includeText:", 1, 1);
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SKUIVerticalLockupCollectionViewCellAccessibility accessibilityFrame](self, "accessibilityFrame");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIVerticalLockupCollectionViewCellAccessibility;
    -[SKUIVerticalLockupCollectionViewCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (_AXSAutomationEnabled())
  {
    -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilitySupplementaryFooterViewsForThisCell:includeText:](self, "_accessibilitySupplementaryFooterViewsForThisCell:includeText:", 1, 1);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[SKUIVerticalLockupCollectionViewCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isAccessibilityElement"))
          {
            objc_msgSend(v14, "accessibilityIdentification");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("PlayButton"));

            if ((v16 & 1) != 0)
            {
              objc_msgSend(v14, "accessibilityLabel");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setAccessibilityIdentifier:", v17);

              goto LABEL_14;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIVerticalLockupCollectionViewCellAccessibility;
  -[SKUIVerticalLockupCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v14;
}

@end
