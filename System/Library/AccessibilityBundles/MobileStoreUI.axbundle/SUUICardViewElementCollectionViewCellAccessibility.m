@implementation SUUICardViewElementCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUICardViewElementCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SUUIStackListCollectionViewCell"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axLockupElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[SUUICardViewElementCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("allExistingViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        NSClassFromString(CFSTR("SUUIHorizontalLockupView"));
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (NSClassFromString(CFSTR("SUUIHorizontalListView")), (objc_opt_isKindOfClass() & 1) != 0)
          || (NSClassFromString(CFSTR("SUUIAttributedStringView")), (objc_opt_isKindOfClass() & 1) != 0)
          || (NSClassFromString(CFSTR("SUUIStyledButton")), (objc_opt_isKindOfClass() & 1) != 0)
          || (NSClassFromString(CFSTR("SUUIStackListCollectionViewCell")), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_axAdornedImageElement
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[SUUICardViewElementCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("allExistingViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        NSClassFromString(CFSTR("SUUIAdornedImageView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;
  const __CFString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SUUICardViewElementCollectionViewCellAccessibility _axLockupElements](self, "_axLockupElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "accessibilityLabel", v16, v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16, v16, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (!objc_msgSend(v6, "length"))
  {
    objc_opt_class();
    -[SUUICardViewElementCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("allExistingViews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234916290]();
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  if (!objc_msgSend(v6, "length"))
  {
    -[SUUICardViewElementCollectionViewCellAccessibility _axAdornedImageElement](self, "_axAdornedImageElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      accessibilityLocalizedString(CFSTR("play"));
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
  }
  return v6;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[SUUICardViewElementCollectionViewCellAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SUUICardViewElementCollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](self, "_accessibilitySupplementaryFooterViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[SUUICardViewElementCollectionViewCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isAccessibilityElement") & 1) != 0)
          {

            goto LABEL_13;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16.receiver = self;
    v16.super_class = (Class)SUUICardViewElementCollectionViewCellAccessibility;
    -[SUUICardViewElementCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (id)_accessibilityFindPlayButton
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SUUICardViewElementCollectionViewCellAccessibility _axAdornedImageElement](self, "_axAdornedImageElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_reuseView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_playButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  char v5;

  -[SUUICardViewElementCollectionViewCellAccessibility _axAdornedImageElement](self, "_axAdornedImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SUUICardViewElementCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityActivate");

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SUUICardViewElementCollectionViewCellAccessibility _axLockupElements](self, "_axLockupElements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v17 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      v18 = v4;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v6);
        NSClassFromString(CFSTR("SUUIStyledButton"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "addObject:", v7);
        }
        else
        {
          objc_msgSend(v7, "_accessibilitySupplementaryFooterViews");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
                NSClassFromString(CFSTR("SUUIHorizontalListView"));
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (NSClassFromString(CFSTR("SUUIImageView")), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_msgSend(v9, "addObject:", v15, v17);
                }
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v12);
          }

          if (objc_msgSend(v9, "count"))
            objc_msgSend(v20, "addObjectsFromArray:", v9);

          v5 = v17;
          v4 = v18;
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

  return v20;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[SUUICardViewElementCollectionViewCellAccessibility _axAdornedImageElement](self, "_axAdornedImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUICardViewElementCollectionViewCellAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityActivationPoint");
    v6 = v5;
    v8 = v7;

    v9 = v6;
    v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUICardViewElementCollectionViewCellAccessibility;
    -[SUUICardViewElementCollectionViewCellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUICardViewElementCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SUUICardViewElementCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SUUICardViewElementCollectionViewCellAccessibility _axLockupElements](self, "_axLockupElements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        NSClassFromString(CFSTR("SUUIHorizontalLockupView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "accessibilityCustomActions");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "count");

          if (v9)
          {
            objc_msgSend(v7, "accessibilityCustomActions");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

@end
