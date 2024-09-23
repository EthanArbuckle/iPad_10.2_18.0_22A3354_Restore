@implementation SBUISystemApertureElementSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUISystemApertureElementSource");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUISystemApertureElementSource"), CFSTR("layoutMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUISystemApertureElementSource"), CFSTR("_handleSceneResizeAction:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUISystemApertureElementSource"), CFSTR("systemApertureElementViewController"), "@", 0);

}

- (BOOL)_handleSceneResizeAction:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBUISystemApertureElementSourceAccessibility;
  v5 = -[SBUISystemApertureElementSourceAccessibility _handleSceneResizeAction:](&v22, sel__handleSceneResizeAction_, v4);
  if (UIAccessibilityIsVoiceOverRunning()
    && -[SBUISystemApertureElementSourceAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("layoutMode")) == 4)
  {
    v21 = 0;
    objc_opt_class();
    -[SBUISystemApertureElementSourceAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("systemApertureElementViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBUISystemApertureElementSourceAccessibility traverseTreeForElementsFromView:](self, "traverseTreeForElementsFromView:", v9);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(v15, "_accessibilityViewIsVisible", (_QWORD)v17) & 1) != 0)
          {
            UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v15);
            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v5;
}

- (id)traverseTreeForElementsFromView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySubviews");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAccessibilityElement", (_QWORD)v16))
        {
          objc_msgSend(v5, "axSafelyAddObject:", v11);
          goto LABEL_13;
        }
        objc_msgSend(v11, "accessibilityElements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "accessibilityElements");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v14);

          goto LABEL_13;
        }
        -[SBUISystemApertureElementSourceAccessibility traverseTreeForElementsFromView:](self, "traverseTreeForElementsFromView:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

@end
