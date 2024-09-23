@implementation AXSB_SBAssistantControllerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAssistantController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:"), "v", "q", "@", "@", "@", "@?", 0);
}

- (void)_axCancelDismissSiriForAssistiveTouch
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__axDismissSiriForAssistiveTouch, 0);
}

- (id)_axSiriDismissalOptions
{
  return objc_getAssociatedObject(self, &__AXSB_SBAssistantControllerSafeCategory___axSiriDismissalOptions);
}

- (void)_axSetSiriDismissalOptions:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axSiriDismissalIsForAssistiveTouch
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetSiriDismissalIsForAssistiveTouch:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_axDismissSiriForAssistiveTouch
{
  NSObject *v2;
  uint8_t buf[16];

  -[AXSB_SBAssistantControllerSafeCategory _axCancelDismissSiriForAssistiveTouch](self, "_axCancelDismissSiriForAssistiveTouch");
  ASTLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AC77000, v2, OS_LOG_TYPE_DEFAULT, "AssistiveTouch did not handle the up event. Now dismissing Siri.", buf, 2u);
  }

  AXPerformSafeBlock();
}

- (void)_axScheduleDismissSiriForAssistiveTouch
{
  -[AXSB_SBAssistantControllerSafeCategory _axCancelDismissSiriForAssistiveTouch](self, "_axCancelDismissSiriForAssistiveTouch");
  -[AXSB_SBAssistantControllerSafeCategory performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__axDismissSiriForAssistiveTouch, 0, 0.2);
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 windowScene:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[16];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "safeIntegerForKey:", CFSTR("dismissalReason")) == 23
    && _AXSAssistiveTouchEnabled()
    && !-[AXSB_SBAssistantControllerSafeCategory _axSiriDismissalIsForAssistiveTouch](self, "_axSiriDismissalIsForAssistiveTouch"))
  {
    ASTLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC77000, v16, OS_LOG_TYPE_DEFAULT, "Delaying Siri dismissal due to AssistiveTouch.", buf, 2u);
    }

    -[AXSB_SBAssistantControllerSafeCategory _axSetSiriDismissalOptions:](self, "_axSetSiriDismissalOptions:", v13);
    -[AXSB_SBAssistantControllerSafeCategory _axScheduleDismissSiriForAssistiveTouch](self, "_axScheduleDismissSiriForAssistiveTouch");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)AXSB_SBAssistantControllerSafeCategory;
    -[AXSB_SBAssistantControllerSafeCategory _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:windowScene:completion:](&v17, sel__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_windowScene_completion_, a3, v12, v13, v14, v15);
  }

}

@end
