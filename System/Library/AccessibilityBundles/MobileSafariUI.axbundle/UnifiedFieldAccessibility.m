@implementation UnifiedFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UnifiedField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), CFSTR("_accessibilityRightButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UnifiedField"), CFSTR("UITextField"));
  objc_msgSend(v3, "validateClass:", CFSTR("_SFNavigationBar"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_URLOutline"), "_SFNavigationBarURLButton");

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("address.text"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("URL");
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[UnifiedFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityRightButtons"));
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
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UnifiedFieldAccessibility _accessibilitySupplementaryFooterViews](self, "_accessibilitySupplementaryFooterViews");
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
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isAccessibilityElement") & 1) != 0)
        {

          goto LABEL_11;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UnifiedFieldAccessibility;
  -[UnifiedFieldAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if ((AXDeviceIsPhoneIdiom() & 1) != 0)
    return 1000;
  v4.receiver = self;
  v4.super_class = (Class)UnifiedFieldAccessibility;
  return -[UnifiedFieldAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[UnifiedFieldAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_SFNavigationBar")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_URLOutline"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UnifiedFieldAccessibility;
    -[UnifiedFieldAccessibility accessibilityPath](&v8, sel_accessibilityPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
