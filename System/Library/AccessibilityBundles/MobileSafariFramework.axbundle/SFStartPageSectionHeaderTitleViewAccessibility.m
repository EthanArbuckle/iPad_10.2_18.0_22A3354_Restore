@implementation SFStartPageSectionHeaderTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFStartPageSectionHeaderTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageSectionHeaderTitleView"), CFSTR("_button"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageSectionHeaderTitleView"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageSectionHeaderTitleView"), CFSTR("_title"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageSectionHeaderTitleView"), CFSTR("_image"), "UIImage");

}

- (SFStartPageSectionHeaderTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  SFStartPageSectionHeaderTitleViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartPageSectionHeaderTitleViewAccessibility;
  v3 = -[SFStartPageSectionHeaderTitleViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SFStartPageSectionHeaderTitleViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFStartPageSectionHeaderTitleViewAccessibility;
  -[SFStartPageSectionHeaderTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[SFStartPageSectionHeaderTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v4, "menu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB150] | objc_msgSend(v4, "accessibilityTraits"));
  LOBYTE(location) = 0;
  objc_opt_class();
  -[SFStartPageSectionHeaderTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__SFStartPageSectionHeaderTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250296AA0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "setAccessibilityLabelBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __92__SFStartPageSectionHeaderTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_browserWindowController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("browserControllers"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v26 = v2;
    v5 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v33 = 0;
        objc_opt_class();
        objc_msgSend(v7, "safeValueForKey:", CFSTR("rootViewController"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          abort();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        objc_msgSend(WeakRetained, "window");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v13)
        {
          v14 = v7;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v4)
        continue;
      break;
    }
    v14 = 0;
LABEL_13:
    v2 = v26;
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v14, "safeStringForKey:", CFSTR("_profileTitleInScene"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_21;
  objc_msgSend(v14, "safeValueForKey:", CFSTR("activeProfileIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("DefaultProfile")))
  {

  }
  else
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v17, "safeStringForKey:", CFSTR("_title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsString:", v15);

    if ((v19 & 1) != 0)
    {
LABEL_21:
      v22 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v22, "safeStringForKey:", CFSTR("_title"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  v20 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v20, "safeValueForKey:", CFSTR("_image"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_21;
  v22 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v22, "safeStringForKey:", CFSTR("_title"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v23;
}

@end
