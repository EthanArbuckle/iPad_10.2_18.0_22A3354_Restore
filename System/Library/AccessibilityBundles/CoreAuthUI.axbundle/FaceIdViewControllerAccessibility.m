@implementation FaceIdViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FaceIdViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FaceIdViewController"), CFSTR("mechanismEvent:value:reply:"), "v", "q", "@", "@?", 0);
}

- (id)_axNotificationFeedbackGenerator
{
  JUMPOUT(0x23490C470);
}

- (void)_setAXNotificationFeedbackGenerator:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityNotificationFeedbackGenerator
{
  id v3;

  -[FaceIdViewControllerAccessibility _axNotificationFeedbackGenerator](self, "_axNotificationFeedbackGenerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6C10]);
    -[FaceIdViewControllerAccessibility _setAXNotificationFeedbackGenerator:](self, "_setAXNotificationFeedbackGenerator:", v3);
  }
  return v3;
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FaceIdViewControllerAccessibility;
  -[FaceIdViewControllerAccessibility mechanismEvent:value:reply:](&v5, sel_mechanismEvent_value_reply_, a3, a4, a5);
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __64__FaceIdViewControllerAccessibility_mechanismEvent_value_reply___block_invoke(uint64_t a1)
{
  void *v1;
  UIAccessibilityNotifications v2;
  id v3;

  switch(*(_QWORD *)(a1 + 40))
  {
    case 1:
    case 6:
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityNotificationFeedbackGenerator");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationOccurred:", 2);
      goto LABEL_5;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityNotificationFeedbackGenerator");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationOccurred:", 0);
      accessibilityLocalizedString(CFSTR("pearl.authentication.success"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

      goto LABEL_5;
    case 5:
      v2 = *MEMORY[0x24BDF71E8];
      accessibilityLocalizedString(CFSTR("pearl.authentication.acquiring"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v2, v3);
LABEL_5:

      break;
    default:
      return;
  }
}

@end
