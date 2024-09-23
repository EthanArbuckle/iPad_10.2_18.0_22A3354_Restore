@implementation MobileSafariUIViewAccessibility

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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("setShowingReader: animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("goBack"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_tabController"), "TabController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("activeTabDocument"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("canGoBack"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("rootViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("Application"), CFSTR("_browserWindowController"), "BrowserWindowController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserWindowController"), CFSTR("browserControllers"), "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v26;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[MobileSafariUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PageView"));

  if (v4)
  {
    -[MobileSafariUIViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIDimmingView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      return 0;
    }
    else
    {
      v42 = 0;
      objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_browserWindowController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v8, "safeArrayForKey:", CFSTR("browserControllers"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v10)
      {
        v11 = v10;
        v26 = v8;
        v12 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v39 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v42 = 0;
            objc_opt_class();
            objc_msgSend(v14, "safeValueForKey:", CFSTR("rootViewController"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
              abort();
            objc_msgSend(v16, "view");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "window");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[MobileSafariUIViewAccessibility window](self, "window");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 == v19)
            {
              v20 = v14;
              goto LABEL_17;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          if (v11)
            continue;
          break;
        }
        v20 = 0;
LABEL_17:
        v8 = v26;
      }
      else
      {
        v20 = 0;
      }

      objc_msgSend(v20, "safeValueForKey:", CFSTR("isShowingReader"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
      {
        v33 = MEMORY[0x24BDAC760];
        v34 = 3221225472;
        v35 = __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke;
        v36 = &unk_25029F0D0;
        v37 = v20;
        AXPerformSafeBlock();
        v6 = 1;
        v23 = v37;
      }
      else
      {
        objc_msgSend(v20, "safeValueForKey:", CFSTR("_tabController"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "safeValueForKey:", CFSTR("activeTabDocument"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "safeBoolForKey:", CFSTR("canGoBack")))
        {
          v28 = MEMORY[0x24BDAC760];
          v29 = 3221225472;
          v30 = __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke_2;
          v31 = &unk_25029F0D0;
          v32 = v20;
          AXPerformSafeBlock();

          v6 = 1;
        }
        else
        {
          v6 = 0;
        }
      }

    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)MobileSafariUIViewAccessibility;
    return -[MobileSafariUIViewAccessibility accessibilityPerformEscape](&v27, sel_accessibilityPerformEscape);
  }
  return v6;
}

uint64_t __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingReader:animated:", 0, 1);
}

void __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_goBack);
  v1 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("previous.page.action"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  void *v3;
  char v4;
  objc_super v6;

  -[MobileSafariUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("titleTextViewContainer"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)MobileSafariUIViewAccessibility;
  return -[MobileSafariUIViewAccessibility _accessibilityIsFrameOutOfBounds](&v6, sel__accessibilityIsFrameOutOfBounds);
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[MobileSafariUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("titleTextViewContainer"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MobileSafariUIViewAccessibility;
  return -[MobileSafariUIViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[MobileSafariUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("titleTextViewContainer"));

  if (!v4)
  {
    v22.receiver = self;
    v22.super_class = (Class)MobileSafariUIViewAccessibility;
    -[MobileSafariUIViewAccessibility accessibilityLabel](&v22, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MobileSafariUIViewAccessibility subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v12, "accessibilityIdentification");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v9 && (objc_msgSend(v13, "isEqualToString:", CFSTR("titleTextView")) & 1) != 0)
      {
        v9 = v12;
LABEL_13:
        v15 = v12;
        goto LABEL_15;
      }
      if (v8)
        goto LABEL_15;
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("lockView")))
      {
        v8 = v12;
        goto LABEL_13;
      }
      v8 = 0;
LABEL_15:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);
LABEL_20:

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
    objc_msgSend(v17, "appendString:", v18);
  objc_msgSend(v8, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    if (objc_msgSend(v17, "length"))
      objc_msgSend(v17, "appendString:", CFSTR(" "));
    objc_msgSend(v17, "appendString:", v19);
  }
  if (objc_msgSend(v17, "length"))
    v20 = v17;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

@end
