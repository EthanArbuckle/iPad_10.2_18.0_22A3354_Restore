@implementation VideoConferenceControlCenterModuleEffectControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideoConferenceControlCenterModule.EffectControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("isExpanded"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("buttonTitle"), "String");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("controlType"), "ControlType");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideoConferenceControlCenterModule.EffectControl"), CFSTR("expandChevron"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  return -[VideoConferenceControlCenterModuleEffectControlAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isExpanded")) ^ 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[VideoConferenceControlCenterModuleEffectControlAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("buttonTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VideoConferenceControlCenterModuleEffectControlAccessibility;
    -[VideoConferenceControlCenterModuleEffectControlAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VideoConferenceControlCenterModuleEffectControlAccessibility;
  -[VideoConferenceControlCenterModuleEffectControlAccessibility accessibilityCustomActions](&v18, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VideoConferenceControlCenterModuleEffectControlAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("controlType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSwiftEnumCase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("expandable"));

  if (v7)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("expand.button.label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_2503CEB70;
    objc_copyWeak(&v16, &location);
    v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, &v12);

    objc_msgSend(v4, "axSafelyAddObject:", v10, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v4;
}

uint64_t __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __90__VideoConferenceControlCenterModuleEffectControlAccessibility_accessibilityCustomActions__block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("expandChevron"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendActionsForControlEvents:", 64);
  LODWORD(WeakRetained) = *MEMORY[0x24BDF7328];
  v5 = objc_loadWeakRetained(a1);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)WeakRetained, v5);

}

@end
