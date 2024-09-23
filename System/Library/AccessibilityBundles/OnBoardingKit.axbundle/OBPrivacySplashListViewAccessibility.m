@implementation OBPrivacySplashListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBPrivacySplashListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OBPrivacySplashListView"), CFSTR("_textViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBPrivacySplashListView"), CFSTR("initWithContentList:dataDetectorTypes:"), "@", "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  double v7;
  double v8;
  double v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  OBPrivacySplashListViewAccessibility *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)OBPrivacySplashListViewAccessibility;
  -[OBPrivacySplashListViewAccessibility _accessibilityLoadAccessibilityInformation](&v32, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  v25 = self;
  -[OBPrivacySplashListViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("OBPrivacySplashController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v4, "contentSize"), v8 = v7, objc_msgSend(v4, "bounds"), v8 > v9)
    && _AXSAssistiveTouchScannerEnabled())
  {
    v10 = MEMORY[0x2349181FC]() ^ 1;
  }
  else
  {
    v10 = 0;
  }
  v31 = 0;
  objc_opt_class();
  -[OBPrivacySplashListViewAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_textViews"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v23 = v12;
    v24 = v4;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (!v13)
      goto LABEL_23;
    v14 = v13;
    v15 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v31 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          abort();
        v18 = v17;
        objc_msgSend(v17, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {

        }
        else
        {
          objc_msgSend(v18, "attributedText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "string");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          if (!v22)
          {
            objc_msgSend(v18, "setIsAccessibilityElement:", 0);
            goto LABEL_21;
          }
        }
        objc_msgSend(v18, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1, v23, v24);
        if (v10)
          -[OBPrivacySplashListViewAccessibility _axSetupTextViewForSwitchControl:](v25, "_axSetupTextViewForSwitchControl:", v18);
LABEL_21:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (!v14)
      {
LABEL_23:

        v12 = v23;
        v4 = v24;
        break;
      }
    }
  }

}

uint64_t __82__OBPrivacySplashListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (OBPrivacySplashListViewAccessibility)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4
{
  OBPrivacySplashListViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashListViewAccessibility;
  v4 = -[OBPrivacySplashListViewAccessibility initWithContentList:dataDetectorTypes:](&v6, sel_initWithContentList_dataDetectorTypes_, a3, a4);
  -[OBPrivacySplashListViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_axSetupTextViewForSwitchControl:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAccessibilityRespondsToUserInteraction:", 1, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(v3, "setIsAccessibilityElement:", 1);
    objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1);
  }

}

@end
