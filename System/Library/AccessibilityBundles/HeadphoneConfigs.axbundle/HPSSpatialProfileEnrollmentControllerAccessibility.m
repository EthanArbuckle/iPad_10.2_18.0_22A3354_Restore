@implementation HPSSpatialProfileEnrollmentControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HPSSpatialProfileEnrollmentController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_stepSerialQueue"), "NSObject<OS_dispatch_queue>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_previousStep"), "i");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_currentStep"), "i");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_infoView"), "OBHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_enrollView"), "HPSSpatialProfileUIPearlEnrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("_continueButton"), "OBTrayButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HPSSpatialProfileEnrollmentController"), CFSTR("moveToStep:"), "v", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("detailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OBTemplateHeaderDetailLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollView"), CFSTR("_pillContainer"), "BKUIPearlPillContainerView");

}

- (id)_axContinueButton
{
  return (id)-[HPSSpatialProfileEnrollmentControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_continueButton"));
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  char isKindOfClass;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileEnrollmentControllerAccessibility;
  -[HPSSpatialProfileEnrollmentControllerAccessibility viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HPSSpatialProfileEnrollmentControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_currentStep"));
  objc_msgSend(v3, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && !v4)
  {
    v7 = *MEMORY[0x24BDF72C8];
    -[HPSSpatialProfileEnrollmentControllerAccessibility _axContinueButton](self, "_axContinueButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

  }
}

- (void)moveToStep:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileEnrollmentControllerAccessibility;
  -[HPSSpatialProfileEnrollmentControllerAccessibility moveToStep:](&v8, sel_moveToStep_);
  -[HPSSpatialProfileEnrollmentControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stepSerialQueue"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke;
  v6[3] = &unk_25021E948;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD v3[5];
  int v4;
  int v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("_previousStep"));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_2;
  v3[3] = &unk_25021E8B0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIAccessibilityNotifications v8;
  void *v9;
  UIAccessibilityNotifications v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_infoView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("detailLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_enrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("pillContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v7 = v6;
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 32);
  AXPerformSafeBlock();
  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 0xA:
    case 0xB:
      v8 = *MEMORY[0x24BDF7328];
      goto LABEL_3;
    case 2:
      v8 = *MEMORY[0x24BDF72C8];
      if (*(_DWORD *)(a1 + 44) == 1)
LABEL_3:
        v9 = v2;
      else
        v9 = v3;
      goto LABEL_4;
    case 3:
      v8 = *MEMORY[0x24BDF7328];
      v9 = v5;
LABEL_4:
      UIAccessibilityPostNotification(v8, v9);
      break;
    case 4:
    case 8:
    case 0x10:
      UIAccessibilitySpeakAndDoNotBeInterrupted();
      v10 = *MEMORY[0x24BDF72C8];
      objc_msgSend(*(id *)(a1 + 32), "_axContinueButton", v12, 3221225472, __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_3, &unk_25021E920, v7, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v10, v11);

      break;
    case 0xC:
      UIAccessibilitySpeakAndDoNotBeInterrupted();
      break;
    default:
      break;
  }

}

uint64_t __65__HPSSpatialProfileEnrollmentControllerAccessibility_moveToStep___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetPearlEnrollViewController:", *(_QWORD *)(a1 + 40));
}

@end
