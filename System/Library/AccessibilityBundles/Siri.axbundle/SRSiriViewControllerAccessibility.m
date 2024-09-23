@implementation SRSiriViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRSiriViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSiriViewController"), CFSTR("speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSiriViewController"), CFSTR("speechSynthesisDidStartSpeakingWithIdentifier:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSiriViewController"), CFSTR("siriDidDeactivateWithCompletion:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSiriViewController"), CFSTR("siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:"), "v", "q", "q", "q", "d", 0);

}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __69__SRSiriViewControllerAccessibility_siriDidDeactivateWithCompletion___block_invoke;
  v6[3] = &unk_2503590B0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SRSiriViewControllerAccessibility;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SRSiriViewControllerAccessibility siriDidDeactivateWithCompletion:](&v5, sel_siriDidDeactivateWithCompletion_, v6);

}

void __69__SRSiriViewControllerAccessibility_siriDidDeactivateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SRSiriViewControllerAccessibility;
  -[SRSiriViewControllerAccessibility speechSynthesisDidStartSpeakingWithIdentifier:](&v3, sel_speechSynthesisDidStartSpeakingWithIdentifier_, a3);
  UIAccessibilityPostNotification(0x1644u, 0);
}

- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4
{
  _BOOL4 v4;
  objc_super v5;

  v4 = a4;
  v5.receiver = self;
  v5.super_class = (Class)SRSiriViewControllerAccessibility;
  -[SRSiriViewControllerAccessibility speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:](&v5, sel_speechSynthesisDidStopSpeakingWithIdentifier_queueIsEmpty_, a3);
  if (v4)
    UIAccessibilityPostNotification(0x1645u, 0);
}

- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  UIAccessibilityNotifications v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SRSiriViewControllerAccessibility;
  -[SRSiriViewControllerAccessibility siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:](&v9, sel_siriSessionDidTransitionFromState_toState_event_machAbsoluteTransitionTime_, a3, a4, a5, a6);
  if (a4 == 1)
  {
    v8 = 5702;
  }
  else
  {
    if (a3 != 1)
      return;
    v8 = 5703;
  }
  UIAccessibilityPostNotification(v8, 0);
}

@end
