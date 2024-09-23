@implementation SBHUDControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHUDController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHUDController"), CFSTR("_dismissHUD:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHUDController"), CFSTR("_presentHUD:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHUDController"), CFSTR("HUDWindow"), "@", 0);

}

- (void)_dismissHUD:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHUDControllerAccessibility;
  -[SBHUDControllerAccessibility _dismissHUD:animated:](&v9, sel__dismissHUD_animated_, v6, v4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    -[SBHUDControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("HUDWindow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setEnabled:", 0);
  }

}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHUDControllerAccessibility;
  -[SBHUDControllerAccessibility _presentHUD:animated:](&v9, sel__presentHUD_animated_, v6, v4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    -[SBHUDControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("HUDWindow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setEnabled:", 1);
  }

}

@end
