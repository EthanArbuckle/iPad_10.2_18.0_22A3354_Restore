@implementation MobileCalUITransitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AdaptiveSearchController"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UISearchBarContainerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITransitionView"), CFSTR("delegate"), "@", 0);

}

- (id)_accessibilityObscuredScreenAllowedViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  objc_super v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)MobileCalUITransitionViewAccessibility;
  -[MobileCalUITransitionViewAccessibility _accessibilityObscuredScreenAllowedViews](&v22, sel__accessibilityObscuredScreenAllowedViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_opt_class();
  -[MobileCalUITransitionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("AdaptiveSearchController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MobileCalUITransitionViewAccessibility superview](self, "superview", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          NSClassFromString(CFSTR("_UISearchBarContainerView"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v3)
            {
              objc_msgSend(v3, "arrayByAddingObject:", v14);
              v15 = objc_claimAutoreleasedReturnValue();

              v3 = (void *)v15;
            }
            else
            {
              v23 = v14;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
              v3 = (void *)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v3;
}

@end
