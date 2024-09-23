@implementation CKTUConversationBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTUConversationBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("subtitleLabel1"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("_currentCall"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("joinButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("_joinButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTUConversationBalloonView"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("TUCall"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUCall"), CFSTR("callDuration"), "d", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  const __CFString *v10;

  -[CKTUConversationBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKTUConversationBalloonViewAccessibility _axState](self, "_axState") != 2)
  {
    -[CKTUConversationBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel1"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  -[CKTUConversationBalloonViewAccessibility _axMessageTime](self, "_axMessageTime", v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[CKTUConversationBalloonViewAccessibility _axState](self, "_axState") == 2
    && (-[CKTUConversationBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentCall")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "safeCGFloatForKey:", CFSTR("callDuration"));
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("balloon.message.facetime.elapsed.time"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXDurationStringForDuration();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTUConversationBalloonViewAccessibility;
  v3 = -[CKTUConversationBalloonViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[CKTUConversationBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF7430];
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;

  return v6;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[CKTUConversationBalloonViewAccessibility _axState](self, "_axState") == 1)
  {
    accessibilityLocalizedString(CFSTR("call.balloon.joinable.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  id v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CKTUConversationBalloonViewAccessibility *v11;
  id v12;

  if (-[CKTUConversationBalloonViewAccessibility _axState](self, "_axState") == 1)
  {
    -[CKTUConversationBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("joinButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __65__CKTUConversationBalloonViewAccessibility_accessibilityActivate__block_invoke;
    v10 = &unk_2501B1CE0;
    v11 = self;
    v12 = v3;
    v4 = v3;
    AXPerformSafeBlock();

    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTUConversationBalloonViewAccessibility;
    return -[CKTUConversationBalloonViewAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
  }
}

uint64_t __65__CKTUConversationBalloonViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_joinButtonTapped:", *(_QWORD *)(a1 + 40));
}

- (id)accessibilityCustomActions
{
  return 0;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTUConversationBalloonViewAccessibility;
    -[CKTUConversationBalloonViewAccessibility automationElements](&v8, sel_automationElements);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_axMessageTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKTUConversationBalloonViewAccessibility _axConversationItem](self, "_axConversationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXDateStringForFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axConversationItem
{
  return (id)-[CKTUConversationBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_axChatItemForBalloon.IMChatItem._item"));
}

- (unint64_t)_axState
{
  return -[CKTUConversationBalloonViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("state"));
}

@end
