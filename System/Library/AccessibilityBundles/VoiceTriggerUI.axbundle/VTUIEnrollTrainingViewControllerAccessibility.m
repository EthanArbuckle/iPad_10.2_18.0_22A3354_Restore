@implementation VTUIEnrollTrainingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIEnrollTrainingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_continueToTrainingFromIntro"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showTrainingInstruction: afterDelay: isRetry: animate:"), "v", "q", "d", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showStatusMessage: afterDelay: completion:"), "v", "@", "d", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showEnrollmentSuccessView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showIntroView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showSiriDataSharingOptIn"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_setupEnrollTrainingView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("trainingViewMediator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_trainingPageInstructions"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_trainingManager"), "SSRVTUITrainingManager");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_currentTrainingState"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollmentSuccessView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIPagedLabel"), CFSTR("_instructionLabelLeft"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIPagedLabel"), CFSTR("_instructionLabelRight"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIPagedLabel"), CFSTR("_instructionLabelRight"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSRVTUITrainingManager"), CFSTR("setSuspendAudio:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VTUIStyle"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VTUIStyle"), CFSTR("sharedStyle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIStyle"), CFSTR("VTUIDeviceSpecificString:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_introViewController"), "UIViewController<VTUIEnrollmentSetupIntroViewControlling>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_educationViewController"), "VTUISiriEducationViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_siriDataSharingViewController"), "UIViewController");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VTUISiriEducationViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showEducationView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_startEnrollment"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_setLanguageOptionsAndContinue"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewMediatorGM"), CFSTR("trainingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_showVoiceSelectionViewForRecognitionLanguage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollTrainingViewController"), CFSTR("_siriDataSharingOptInView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollTrainingView"), CFSTR("orbView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trainingViewMediator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("trainingView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("orbView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("EnrollmentSetupIntroView"));

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__axHandleAnnouncementDidFinishNotification_, *MEMORY[0x24BDF71D0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__axHandleVoiceOverStatusChangedNotification_, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__axHandleElementFocusedNotification_, *MEMORY[0x24BDF7238], 0);

  VoiceOverStatus = UIAccessibilityIsVoiceOverRunning();
  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_educationViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilityLoadAccessibilityInformation");

  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_siriDataSharingViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityLoadAccessibilityInformation");

  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_introViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilityLoadAccessibilityInformation");

  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF71D0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7238], 0);

  -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 0);
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility dealloc](&v6, sel_dealloc);
}

- (void)_setupEnrollTrainingView
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _setupEnrollTrainingView](&v4, sel__setupEnrollTrainingView);
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
}

- (void)_showIntroView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showIntroView](&v3, sel__showIntroView);
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_showEducationView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showEducationView](&v5, sel__showEducationView);
  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_educationViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_showEnrollmentSuccessView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showEnrollmentSuccessView](&v7, sel__showEnrollmentSuccessView);
  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_flamesView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_successView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXIsInstructionLabel"));

  LODWORD(v4) = *MEMORY[0x24BDF7328];
  -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_successView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v6);

}

- (id)_axShowTrainingInstructionBlock
{
  JUMPOUT(0x234924AECLL);
}

- (void)_axSetShowTrainingInstructionBlock:(id)a3
{
  id v3;

  v3 = (id)MEMORY[0x234924C18](a3, a2);
  __UIAccessibilitySetAssociatedObject();

}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  objc_super v11;
  _QWORD v12[4];
  id v13[3];
  BOOL v14;
  BOOL v15;
  id location;

  v6 = a6;
  v7 = a5;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[VTUIEnrollTrainingViewControllerAccessibility _axAnnounceInstructionWithNumber:](self, "_axAnnounceInstructionWithNumber:", a3);
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __101__VTUIEnrollTrainingViewControllerAccessibility__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    v12[3] = &unk_2503E0B08;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    v13[2] = *(id *)&a4;
    v14 = v7;
    v15 = v6;
    -[VTUIEnrollTrainingViewControllerAccessibility _axSetShowTrainingInstructionBlock:](self, "_axSetShowTrainingInstructionBlock:", v12);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
    -[VTUIEnrollTrainingViewControllerAccessibility _showTrainingInstruction:afterDelay:isRetry:animate:](&v11, sel__showTrainingInstruction_afterDelay_isRetry_animate_, a3, v7, v6, a4);
  }
}

void __101__VTUIEnrollTrainingViewControllerAccessibility__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySuperShowTrainingInstruction:afterDelay:isRetry:animate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(double *)(a1 + 48));

}

- (void)_accessibilitySuperShowTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showTrainingInstruction:afterDelay:isRetry:animate:](&v6, sel__showTrainingInstruction_afterDelay_isRetry_animate_, a3, a5, a6, a4);
}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  v8 = a3;
  -[VTUIEnrollTrainingViewControllerAccessibility _showStatusMessage:afterDelay:completion:](&v9, sel__showStatusMessage_afterDelay_completion_, v8, a5, a4);
  -[VTUIEnrollTrainingViewControllerAccessibility _axAnnounceString:](self, "_axAnnounceString:", v8, v9.receiver, v9.super_class);

}

- (void)_continueToTrainingFromIntro
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _continueToTrainingFromIntro](&v3, sel__continueToTrainingFromIntro);
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_startEnrollment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _startEnrollment](&v3, sel__startEnrollment);
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
}

- (void)_setLanguageOptionsAndContinue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _setLanguageOptionsAndContinue](&v3, sel__setLanguageOptionsAndContinue);
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
}

- (void)_showSiriDataSharingOptIn
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showSiriDataSharingOptIn](&v4, sel__showSiriDataSharingOptIn);
  -[VTUIEnrollTrainingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_siriDataSharingOptInView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewControllerAccessibility;
  -[VTUIEnrollTrainingViewControllerAccessibility _showVoiceSelectionViewForRecognitionLanguage:](&v4, sel__showVoiceSelectionViewForRecognitionLanguage_, a3);
  -[VTUIEnrollTrainingViewControllerAccessibility _accessibilitySetAccessibilityElementsIfNeeded](self, "_accessibilitySetAccessibilityElementsIfNeeded");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_axAnnounceInstructionWithNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[VTUIEnrollTrainingViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_trainingPageInstructions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") > (unint64_t)a3)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("step.announcement"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "count");
    AXFormatInteger();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)MEMORY[0x234924A74](CFSTR("VTUIStyle")), "safeValueForKey:", CFSTR("sharedStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    objc_opt_class();
    objc_msgSend(v5, "axSafeObjectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Instruction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x24BDAC760];
    v18 = v11;
    v19 = v14;
    AXPerformSafeBlock();
    v16 = v21[5];
    __AXStringForVariables();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingViewControllerAccessibility _axAnnounceString:](self, "_axAnnounceString:", v15, v16, CFSTR("__AXStringForVariablesSentinel"), v17, 3221225472, __82__VTUIEnrollTrainingViewControllerAccessibility__axAnnounceInstructionWithNumber___block_invoke, &unk_2503E0B30);

    _Block_object_dispose(&v20, 8);
  }

}

void __82__VTUIEnrollTrainingViewControllerAccessibility__axAnnounceInstructionWithNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "VTUIDeviceSpecificString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axAnnounceString:(id)a3
{
  _BOOL4 IsVoiceOverRunning;
  id v5;

  v5 = a3;
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (v5 && IsVoiceOverRunning)
  {
    -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 1);
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }

}

- (void)_axHandleAnnouncementDidFinishNotification:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[VTUIEnrollTrainingViewControllerAccessibility _axShowTrainingInstructionBlock](self, "_axShowTrainingInstructionBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VTUIEnrollTrainingViewControllerAccessibility _axShowTrainingInstructionBlock](self, "_axShowTrainingInstructionBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    -[VTUIEnrollTrainingViewControllerAccessibility _axSetShowTrainingInstructionBlock:](self, "_axSetShowTrainingInstructionBlock:", 0);
  }
  -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 0);
}

- (void)_axHandleVoiceOverStatusChangedNotification:(id)a3
{
  id v4;

  v4 = a3;
  if (VoiceOverStatus && !UIAccessibilityIsVoiceOverRunning())
    -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 0);
  VoiceOverStatus = UIAccessibilityIsVoiceOverRunning();

}

- (id)AXSuspendAudioTimer
{
  JUMPOUT(0x234924AECLL);
}

- (void)setAXSuspendAudioTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axHandleElementFocusedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7248]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_accessibilityValueForKey:", CFSTR("AXIsInstructionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 1);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axHandleSuspendAudioTimerFired_, 0, 0, 1.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingViewControllerAccessibility setAXSuspendAudioTimer:](self, "setAXSuspendAudioTimer:", v7);

  }
}

- (void)_axHandleSuspendAudioTimerFired:(id)a3
{
  -[VTUIEnrollTrainingViewControllerAccessibility _axSuspendAudio:](self, "_axSuspendAudio:", 0);
}

- (void)_axSuspendAudio:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;

  v3 = a3;
  -[VTUIEnrollTrainingViewControllerAccessibility AXSuspendAudioTimer](self, "AXSuspendAudioTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  if (!v3 || UIAccessibilityIsVoiceOverRunning())
    AXPerformSafeBlock();
}

void __65__VTUIEnrollTrainingViewControllerAccessibility__axSuspendAudio___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_trainingManager"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuspendAudio:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_accessibilitySetAccessibilityElementsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[VTUIEnrollTrainingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (PSIsRunningInAssistant())
  {
    -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_educationViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeUIViewForKey:", CFSTR("view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_siriDataSharingOptInView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollTrainingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_introViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeUIViewForKey:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "accessibilityViewIsModal")
      && objc_msgSend(v5, "_accessibilityViewIsVisible"))
    {
      v13[0] = v5;
      v9 = (void **)v13;
    }
    else if (objc_msgSend(v6, "accessibilityViewIsModal")
           && objc_msgSend(v6, "_accessibilityViewIsVisible"))
    {
      v12 = v6;
      v9 = &v12;
    }
    else
    {
      if (!objc_msgSend(v8, "accessibilityViewIsModal")
        || !objc_msgSend(v8, "_accessibilityViewIsVisible"))
      {
        v10 = 0;
        goto LABEL_14;
      }
      v11 = v8;
      v9 = &v11;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1, v11, v12, v13[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    objc_msgSend(v3, "setAccessibilityElements:", v10);

    goto LABEL_15;
  }
  objc_msgSend(v3, "setAccessibilityElements:", 0);
LABEL_15:

}

@end
