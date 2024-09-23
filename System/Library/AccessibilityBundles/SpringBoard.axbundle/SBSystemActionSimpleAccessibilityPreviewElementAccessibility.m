@implementation SBSystemActionSimpleAccessibilityPreviewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemActionSimpleAccessibilityPreviewElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFocusEnablementIndicatorSystemApertureActivityElement"), CFSTR("initWithActivityDescription:enabled:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemAction"), CFSTR("configuredAction"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFConfiguredSystemIntentAction"), CFSTR("intent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFConfiguredStaccatoIntentAction"), CFSTR("templateParameterValues"), "@", 0);

}

- (SBSystemActionSimpleAccessibilityPreviewElementAccessibility)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSystemActionSimpleAccessibilityPreviewElementAccessibility *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  SBSystemActionSimpleAccessibilityPreviewElementAccessibility *v21;
  UIAccessibilityNotifications v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElementAccessibility;
  v11 = -[SBSystemActionSimpleAccessibilityPreviewElementAccessibility initWithSystemAction:contentProvider:keyColor:](&v29, sel_initWithSystemAction_contentProvider_keyColor_, v8, v9, v10);
  objc_msgSend(v8, "safeValueForKey:", CFSTR("configuredAction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeDictionaryForKey:", CFSTR("templateParameterValues"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDFFC58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeValueForKey:", CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  v19 = objc_msgSend(MEMORY[0x24BE00738], "stateForTripleClickOption:", v18);
  if (v19 == 2)
  {
    v28 = v10;
    v20 = v9;
    v21 = v11;
    v22 = *MEMORY[0x24BDF71E8];
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = CFSTR("ax.shortcut.on");
    goto LABEL_5;
  }
  if (v19 == 1)
  {
    v28 = v10;
    v20 = v9;
    v21 = v11;
    v22 = *MEMORY[0x24BDF71E8];
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = CFSTR("ax.shortcut.off");
LABEL_5:
    accessibilityLocalizedString(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v25, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v22, v26);

    v11 = v21;
    v9 = v20;
    v10 = v28;
  }

  return v11;
}

@end
