@implementation MFComposeActionCardTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeActionCardTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeActionCardTitleView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFComposeActionCardTitleView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("UIDimmingView"));
  objc_msgSend(v3, "validateClass:", CFSTR("UITransitionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("UIDropShadowView"));
  objc_msgSend(v3, "validateClass:", CFSTR("MFMailComposeView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)MFComposeActionCardTitleViewAccessibility;
  -[MFComposeActionCardTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v30, sel__accessibilityLoadAccessibilityInformation);
  -[MFComposeActionCardTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  -[MFComposeActionCardTitleViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("UITransitionView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v28[3] = &unk_24FEF9F70;
  v7 = v5;
  v29 = v7;
  v8 = (id)objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", v28);
  v27 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("UIDropShadowView")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v25[3] = &unk_24FEF9F70;
  v13 = v7;
  v26 = v13;
  v14 = (id)objc_msgSend(v12, "_accessibilityFindSubviewDescendant:", v25);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v20, "setAccessibilityViewIsModal:", 0, (_QWORD)v21);
        objc_msgSend(v20, "setAccessibilityContainerType:", 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v17);
  }

}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  NSClassFromString(CFSTR("UIDimmingView"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return isKindOfClass & 1;
}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFMailComposeView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  NSClassFromString(CFSTR("UIDimmingView"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeActionCardTitleViewAccessibility;
  -[MFComposeActionCardTitleViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MFComposeActionCardTitleViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
