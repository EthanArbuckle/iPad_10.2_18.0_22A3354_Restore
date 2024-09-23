@implementation SBBacklightControllerAccessibility

- (BOOL)screenIsDim
{
  objc_super v3;

  if (_SBAXScreenCurtainEnabled && *(float *)&_SBAXRealBacklightFactor != 0.0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SBBacklightControllerAccessibility;
  return -[SBBacklightControllerAccessibility screenIsDim](&v3, sel_screenIsDim);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBBacklightController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("setBacklightState:source:animated:completion:"), "v", "q", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightControllerAccessibility"), CFSTR("_factorToPublishForBacklightState:"), "f", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("screenIsOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("screenIsOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBacklightController"), CFSTR("screenIsDim"), "B", 0);

}

+ (void)isIdling
{
  IsIdling = 1;
}

- (float)_factorToPublishForBacklightState:(int64_t)a3
{
  float result;
  objc_super v4;

  if (a3 == 2)
    return 0.02;
  v4.receiver = self;
  v4.super_class = (Class)SBBacklightControllerAccessibility;
  -[SBBacklightControllerAccessibility _factorToPublishForBacklightState:](&v4, sel__factorToPublishForBacklightState_);
  return result;
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  char v17;
  int v18;
  int v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  SBBacklightControllerAccessibility *v30;
  uint64_t *v31;
  int64_t v32;
  uint64_t v33;
  float *v34;
  uint64_t v35;
  int v36;

  v6 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x23491FAEC]();
  v33 = 0;
  v34 = (float *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  v12 = MEMORY[0x24BDAC760];
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke;
  v29 = &unk_250367DB8;
  v30 = self;
  v31 = &v33;
  v32 = a3;
  AXPerformSafeBlock();
  v13 = v34[6];
  _Block_object_dispose(&v33, 8);
  if (v13 == 1.0)
  {
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_2;
    v23[3] = &unk_250368A18;
    v25 = a4;
    v24 = v10;
    v14 = MEMORY[0x23491FAEC](v23);

    v11 = (void *)v14;
  }
  v15 = fabs(v13 + -0.02) >= 0.001 && _SBAXScreenCurtainEnabled == 0;
  if (v15 || IsIdling != 1)
  {
    v17 = 0;
    goto LABEL_12;
  }
  if ((setBacklightState_source_animated_completion___AXShouldSpeakNextDimmedMessage & 1) == 0
    && UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "isMediaPlayingForApp:completionHandler:", 0, &__block_literal_global_21);

    v17 = 1;
LABEL_12:
    setBacklightState_source_animated_completion___AXShouldSpeakNextDimmedMessage = v17;
  }
  IsIdling = 0;
  v18 = setBacklightState_source_animated_completion__wasEnabled;
  v19 = _SBAXScreenCurtainEnabled;
  if (setBacklightState_source_animated_completion__wasEnabled != _SBAXScreenCurtainEnabled)
    setBacklightState_source_animated_completion__wasEnabled = _SBAXScreenCurtainEnabled;
  _SBAXRealBacklightFactor = LODWORD(v13);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (!_SBAXScreenCurtainEnabled || v13 == 0.0)
    {
      -[SBBacklightControllerAccessibility setBacklightState:source:animated:completion:](&v20, sel_setBacklightState_source_animated_completion_, a3, a4, v6, v11, self, SBBacklightControllerAccessibility);
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)SBBacklightControllerAccessibility;
      -[SBBacklightControllerAccessibility setBacklightState:source:animated:completion:](&v21, sel_setBacklightState_source_animated_completion_, 2, a4, v18 != v19, v11);
      BKSHIDServicesSetBacklightFactorPending();
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBBacklightControllerAccessibility;
    -[SBBacklightControllerAccessibility setBacklightState:source:animated:completion:](&v22, sel_setBacklightState_source_animated_completion_, a3, a4, v6, v11, v20.receiver, v20.super_class);
  }

}

uint64_t __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_factorToPublishForBacklightState:", *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 20 || v2 == 9)
  {
    UIAccessibilityPostNotification(0x41Au, 0);
    v2 = *(_QWORD *)(a1 + 40);
  }
  if (v2 == 14)
    v4 = (id *)MEMORY[0x24BDFEF70];
  else
    v4 = (id *)MEMORY[0x24BDFEF68];
  v5 = *v4;
  v8 = *MEMORY[0x24BDFEF60];
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0A0], v6);
  if (*(_QWORD *)(a1 + 40) != 14)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();

}

void __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  id argument;

  if ((a2 & 1) == 0)
  {
    v2 = (void *)MEMORY[0x24BDFEA60];
    accessibilityLocalizedString(CFSTR("screen.dimmed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "axAttributedStringWithString:", v3);
    argument = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC50]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);

  }
}

@end
