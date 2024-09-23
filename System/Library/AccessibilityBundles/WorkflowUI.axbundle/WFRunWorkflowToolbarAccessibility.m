@implementation WFRunWorkflowToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFRunWorkflowToolbar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFRunWorkflowToolbar"), CFSTR("toolbar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("tintColor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFRunWorkflowToolbar"), CFSTR("shareItem"), "@", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  -[WFRunWorkflowToolbarAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[WFRunWorkflowToolbarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  -[WFRunWorkflowToolbarAccessibility _accessibilityLoadAccessibilityInformation](&v21, sel__accessibilityLoadAccessibilityInformation);
  v20 = 0;
  objc_opt_class();
  -[WFRunWorkflowToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toolbar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = v4;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "tintColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          objc_msgSend(v10, "safeValueForKey:", CFSTR("view"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setIsAccessibilityElement:", 0);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

}

- (void)updateShareButtonVisibility
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  -[WFRunWorkflowToolbarAccessibility updateShareButtonVisibility](&v8, sel_updateShareButtonVisibility);
  -[WFRunWorkflowToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shareItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("UIBarButtonItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("tintColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsAccessibilityElement:", 0);

    }
  }

}

@end
