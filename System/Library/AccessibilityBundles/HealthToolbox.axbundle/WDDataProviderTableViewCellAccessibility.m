@implementation WDDataProviderTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDDataProviderTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDDataProviderTableViewCell"), CFSTR("_checkmarkButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDDataProviderTableViewCell"), CFSTR("_inactiveLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WDDataProviderTableViewCell"), CFSTR("UITableViewCell"));

}

- (id)accessibilityLabel
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;

  -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkmarkButton"));
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_232672796;
  v20 = 0u;
  v21 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v4 = v17[6];

  _Block_object_dispose(&v16, 8);
  if (v4 <= 0.0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("currentTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("hidden"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  LOBYTE(v16) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_BYTE)v16)
    abort();
  v11 = v10;
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __62__WDDataProviderTableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDDataProviderTableViewCellAccessibility;
  -[WDDataProviderTableViewCellAccessibility _setupUI](&v6, sel__setupUI);
  -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  -[WDDataProviderTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkmarkButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

@end
