@implementation SyncFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SyncFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)updateProgress:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void);
  void *v9;
  BOOL v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__SyncFooterViewAccessibility_updateProgress_dataSource___block_invoke;
  v14[3] = &unk_25014B988;
  v14[4] = self;
  v6 = a4;
  v7 = a3;
  v8 = (void (**)(void))MEMORY[0x234905554](v14);
  v8[2]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SyncFooterViewAccessibility;
  v10 = -[SyncFooterViewAccessibility updateProgress:dataSource:](&v13, sel_updateProgress_dataSource_, v7, v6);

  ((void (*)(void (**)(void)))v8[2])(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToSet:", v11) & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

  return v10;
}

id __57__SyncFooterViewAccessibility_updateProgress_dataSource___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isHidden") & 1) == 0)
        {
          if (!v6)
            v6 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (!v6)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v10;
}

- (id)accessibilityElements
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SyncFooterViewAccessibility subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = kIsHitTestingSyncFooterView;
  v8 = a4;
  v9 = -[SyncFooterViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", v7);
  -[SyncFooterViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, kIsHitTestingSyncFooterView);
  v12.receiver = self;
  v12.super_class = (Class)SyncFooterViewAccessibility;
  -[SyncFooterViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v8, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SyncFooterViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", v9, kIsHitTestingSyncFooterView);
  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SyncFooterViewAccessibility *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[SyncFooterViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", kIsHitTestingSyncFooterView))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = self;
      -[SyncFooterViewAccessibility subviews](v8, "subviews");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            -[SyncFooterViewAccessibility convertPoint:toView:](v8, "convertPoint:toView:", v14, x, y);
            if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
            {

              v15 = 1;
              goto LABEL_13;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SyncFooterViewAccessibility;
  v15 = -[SyncFooterViewAccessibility pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v7, x, y);
LABEL_13:

  return v15;
}

@end
