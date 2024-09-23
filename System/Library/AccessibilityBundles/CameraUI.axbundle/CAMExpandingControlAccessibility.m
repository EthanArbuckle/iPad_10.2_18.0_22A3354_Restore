@implementation CAMExpandingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExpandingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("setExpanded:"), "v", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[CAMExpandingControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMExpandingControlAccessibility;
  return *MEMORY[0x24BDF7428] | -[CAMExpandingControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if (-[CAMExpandingControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityCameraKitLocalizedString(CFSTR("CONTROL_COLLAPSE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke;
    v17[3] = &unk_24FEDFF80;
    objc_copyWeak(&v18, &location);
    v5 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v17);

    v21[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    return v6;
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityCameraKitLocalizedString(CFSTR("CONTROL_EXPAND"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_3;
    v15 = &unk_24FEDFF80;
    objc_copyWeak(&v16, &location);
    v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, &v12);

    v20 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1, v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    return v11;
  }
}

uint64_t __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExpanded:", 0);

}

uint64_t __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExpanded:", 1);

}

- (BOOL)accessibilityPerformEscape
{
  int v2;

  v2 = -[CAMExpandingControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  if (v2)
    AXPerformSafeBlock();
  return v2;
}

void __62__CAMExpandingControlAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setExpanded:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMExpandingControlAccessibility;
  -[CAMExpandingControlAccessibility setExpanded:](&v5, sel_setExpanded_);
  if (v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
