@implementation _TVListTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVListTemplateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListTemplateView"), CFSTR("setBannerView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListTemplateView"), CFSTR("setListView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVListTemplateView"), CFSTR("setPreviewView:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  Class v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _TVListTemplateViewAccessibility *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)_TVListTemplateViewAccessibility;
  -[_TVListTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](&v39, sel__accessibilityLoadAccessibilityInformation);
  v3 = NSClassFromString(CFSTR("_TVLabel"));
  NSClassFromString(CFSTR("_TVCollectionWrappingView"));
  NSClassFromString(CFSTR("_TVListView"));
  v29 = self;
  -[_TVListTemplateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bannerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __78___TVListTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v34[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v34[4] = v3;
  v28 = v4;
  objc_msgSend(v4, "_accessibilityFindSubviewDescendantsPassingTest:", v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v9 = *MEMORY[0x24BDF73C0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "setAccessibilityTraits:", v9 | objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v10), "accessibilityTraits"));
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  -[_TVListTemplateViewAccessibility safeValueForKey:](v29, "safeValueForKey:", CFSTR("listView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v11;
    objc_msgSend(v11, "subviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "setAccessibilityContainerType:", 4);
            UIKitAccessibilityLocalizedString();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "accessibilityLabel");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "containsString:", v18) & 1) == 0)
            {
              __UIAXStringForVariables();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setAccessibilityLabel:", v20, v19, CFSTR("__AXStringForVariablesSentinel"));

            }
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v14);
    }

    v11 = v27;
  }
  -[_TVListTemplateViewAccessibility safeValueForKey:](v29, "safeValueForKey:", CFSTR("previewView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeafNodePredicate:", &__block_literal_global_5);
    objc_msgSend(v21, "_accessibilityLeafDescendantsWithCount:options:", 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v22, "setLeafNodePredicate:", &__block_literal_global_209);
      objc_msgSend(v21, "_accessibilityLeafDescendantsWithCount:options:", 1, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "_accessibilitySetUserDefinedIsGuideElement:", 1);
    }

  }
}

- (void)setBannerView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  -[_TVListTemplateViewAccessibility setBannerView:](&v4, sel_setBannerView_, a3);
  -[_TVListTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setListView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  -[_TVListTemplateViewAccessibility setListView:](&v4, sel_setListView_, a3);
  -[_TVListTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setPreviewView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListTemplateViewAccessibility;
  -[_TVListTemplateViewAccessibility setPreviewView:](&v4, sel_setPreviewView_, a3);
  -[_TVListTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
