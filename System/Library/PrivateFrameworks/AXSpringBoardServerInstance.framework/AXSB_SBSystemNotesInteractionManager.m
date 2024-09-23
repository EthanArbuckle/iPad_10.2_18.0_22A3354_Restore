@implementation AXSB_SBSystemNotesInteractionManager

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemNotesInteractionManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSystemNotesInteractionManager"), CFSTR("gestureRecognizerShouldBegin:"), "B", "@", 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  objc_super v10;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areSystemGesturesDisabledByAccessibility");

  if (v6)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AC77000, v7, OS_LOG_TYPE_INFO, "Quick Notes disabled by accessibility gestures", buf, 2u);
    }

    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AXSB_SBSystemNotesInteractionManager;
    v8 = -[AXSB_SBSystemNotesInteractionManager gestureRecognizerShouldBegin:](&v10, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v8;
}

@end
