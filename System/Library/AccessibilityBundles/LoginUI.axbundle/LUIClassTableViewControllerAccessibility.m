@implementation LUIClassTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LUIClassTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIClassTableViewController"), CFSTR("footerButtonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LUIClassTableViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIClassTableViewControllerAccessibility;
  -[LUIClassTableViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[LUIClassTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)LUIClassTableViewControllerAccessibility;
  -[LUIClassTableViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_opt_class();
  -[LUIClassTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    v10 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v8)
            v10 = 0;
          else
            v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);

    if ((v10 & (v8 != 0)) == 1)
    {
      v13 = objc_msgSend(v8, "accessibilityTraits");
      objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v13);
    }
  }
  else
  {

    v8 = 0;
  }

}

- (BOOL)accessibilityPerformEscape
{
  BOOL v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  LUIClassTableViewControllerAccessibility *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __70__LUIClassTableViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  v9 = &unk_25024C718;
  v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((_BYTE *)v13 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LUIClassTableViewControllerAccessibility;
    v3 = -[LUIClassTableViewControllerAccessibility accessibilityPerformEscape](&v5, sel_accessibilityPerformEscape);
    *((_BYTE *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

uint64_t __70__LUIClassTableViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "footerButtonPressed:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
