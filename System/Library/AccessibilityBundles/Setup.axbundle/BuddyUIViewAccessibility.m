@implementation BuddyUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BuddyTableViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CDPTableViewController"));

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[BuddyUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("BuddyContainerView"));

  if (v9)
  {
    -[BuddyUIViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v10, "reverseObjectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[BuddyUIViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
          objc_msgSend(v17, "_accessibilityHitTest:withEvent:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isAccessibilityElement") & 1) != 0)
          {

            goto LABEL_13;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  v20.receiver = self;
  v20.super_class = (Class)BuddyUIViewAccessibility;
  -[BuddyUIViewAccessibility _accessibilityHitTest:withEvent:](&v20, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v18;
}

@end
