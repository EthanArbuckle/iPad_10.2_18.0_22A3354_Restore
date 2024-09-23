@implementation WFBackgroundFadingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFBackgroundFadingButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFBackgroundFadingButton"), CFSTR("backgroundColorsByState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFBackgroundFadingButton"), CFSTR("setBackgroundColor:forState:"), "v", "@", "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  WFBackgroundFadingButtonAccessibility *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  char v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)WFBackgroundFadingButtonAccessibility;
  -[WFBackgroundFadingButtonAccessibility _accessibilityLoadAccessibilityInformation](&v30, sel__accessibilityLoadAccessibilityInformation);
  v29 = 0;
  objc_opt_class();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __83__WFBackgroundFadingButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v20 = &unk_2503EA4B8;
  v21 = self;
  v22 = &v23;
  AXPerformSafeBlock();
  v3 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    abort();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 | 8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v31, 16);
    }
    while (v6);
  }

}

void __83__WFBackgroundFadingButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "backgroundColorsByState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFBackgroundFadingButtonAccessibility;
  -[WFBackgroundFadingButtonAccessibility setBackgroundColor:forState:](&v5, sel_setBackgroundColor_forState_, a3, a4);
  -[WFBackgroundFadingButtonAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
