@implementation _TVAlertTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVAlertTemplateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVAlertTemplateView"), CFSTR("viewsAbove"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVAlertTemplateView"), CFSTR("viewsBelow"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)_TVAlertTemplateViewAccessibility;
  -[_TVAlertTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[_TVAlertTemplateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewsAbove"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_opt_class();
  -[_TVAlertTemplateViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewsBelow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  v9 = (uint64_t *)MEMORY[0x24BDF73C0];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    v12 = *MEMORY[0x24BDF73C0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setAccessibilityTraits:", v12);
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    v18 = *v9;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "setAccessibilityTraits:", v18, (_QWORD)v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v16);
  }

}

- (void)setViewsAbove:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateViewAccessibility;
  -[_TVAlertTemplateViewAccessibility setViewsAbove:](&v4, sel_setViewsAbove_, a3);
  -[_TVAlertTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setViewsBelow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateViewAccessibility;
  -[_TVAlertTemplateViewAccessibility setViewsBelow:](&v4, sel_setViewsBelow_, a3);
  -[_TVAlertTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
