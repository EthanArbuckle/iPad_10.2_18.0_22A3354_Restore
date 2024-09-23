@implementation ConversationControlsManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ConversationControlsManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationControlsManager"), CFSTR("joinButtonTappedWithButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ConversationControlsManager"), CFSTR("accessibilityDidAddPendingParticipant:"), "v", "@", 0);

}

- (void)accessibilityDidAddPendingParticipant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ConversationControlsManagerAccessibility;
  v3 = a3;
  -[ConversationControlsManagerAccessibility accessibilityDidAddPendingParticipant:](&v7, sel_accessibilityDidAddPendingParticipant_, v3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("request.to.join.call"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)joinButtonTappedWithButton:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationControlsManagerAccessibility;
  -[ConversationControlsManagerAccessibility joinButtonTappedWithButton:](&v4, sel_joinButtonTappedWithButton_, a3);
  accessibilityLocalizedString(CFSTR("connecting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
