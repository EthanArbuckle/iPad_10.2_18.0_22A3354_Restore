@implementation PBA_SBUICallToActionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUICallToActionLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADeviceUnlockViewController"), CFSTR("_homeButtonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBADataRecoveryViewController"), CFSTR("_pushPasscodeView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUICallToActionLabel"), CFSTR("label"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBA_SBUICallToActionLabelAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PBA_SBUICallToActionLabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke;
  v9[3] = &unk_2503113F0;
  v9[4] = &v14;
  v9[5] = &v10;
  -[PBA_SBUICallToActionLabelAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v9, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*((_BYTE *)v15 + 24))
  {
    v8[0] = v2;
    v8[1] = 3221225472;
    v8[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_2;
    v8[3] = &unk_250311418;
    v5 = v8;
    v8[4] = v3;
    AXPerformSafeBlock();
LABEL_5:

    goto LABEL_6;
  }
  if (*((_BYTE *)v11 + 24))
  {
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_3;
    v7[3] = &unk_250311418;
    v5 = v7;
    v7[4] = v3;
    AXPerformSafeBlock();
    goto LABEL_5;
  }
LABEL_6:

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PBA_SBUICallToActionLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
