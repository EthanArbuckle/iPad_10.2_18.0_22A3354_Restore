@implementation LPPlayButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LPPlayButtonControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPPlayButtonControl"), CFSTR("_showPlayIndicator:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPPlayButtonControl"), CFSTR("buttonPressed:"), "v", "@", 0);

}

- (BOOL)_axIsPlaying
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsPlaying:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)accessibilityCustomActions
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LPPlayButtonControlAccessibility _axIsPlaying](self, "_axIsPlaying"))
    v4 = CFSTR("pause.button");
  else
    v4 = CFSTR("play.button");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke;
  v12 = &unk_24FEF20C8;
  objc_copyWeak(&v13, &location);
  v7 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v5, &v9);
  objc_msgSend(v3, "axSafelyAddObject:", v7, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "buttonPressed:", 0);

}

- (void)_showPlayIndicator:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPPlayButtonControlAccessibility;
  -[LPPlayButtonControlAccessibility _showPlayIndicator:](&v5, sel__showPlayIndicator_);
  -[LPPlayButtonControlAccessibility _axSetIsPlaying:](self, "_axSetIsPlaying:", !v3);
}

@end
