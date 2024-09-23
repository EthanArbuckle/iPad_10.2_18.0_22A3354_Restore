@implementation InCallControlsParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallControlsParticipantCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewListCell"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("lmiApproveButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("lmiRejectButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("kickMemberButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlsParticipantCell"), CFSTR("subtitleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InCallControlsParticipantCellAccessibility;
  -[InCallControlsParticipantCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("AXRingButtonIdentification"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  -[InCallControlsParticipantCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("actionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__accessibilityActivateActionButton);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[InCallControlsParticipantCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("lmiApproveButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
  {
    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v8, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, self, sel__accessibilityActivateLmiApproveButton);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[InCallControlsParticipantCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("lmiRejectButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "_accessibilityViewIsVisible"))
  {
    v13 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v12, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:target:selector:", v14, self, sel__accessibilityActivateLmiRejectButton);
    objc_msgSend(v3, "addObject:", v15);

  }
  -[InCallControlsParticipantCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("kickMemberButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "_accessibilityViewIsVisible"))
  {
    v17 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v16, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:target:selector:", v18, self, sel__accessibilityActivateKickMemberButton);
    objc_msgSend(v3, "addObject:", v19);

  }
  return v3;
}

- (InCallControlsParticipantCellAccessibility)initWithFrame:(CGRect)a3
{
  InCallControlsParticipantCellAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InCallControlsParticipantCellAccessibility;
  v3 = -[InCallControlsParticipantCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[InCallControlsParticipantCellAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (BOOL)_accessibilityActivateActionButton
{
  void *v2;
  void *v3;

  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

- (BOOL)_accessibilityActivateLmiApproveButton
{
  void *v2;
  void *v3;

  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lmiApproveButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

- (BOOL)_accessibilityActivateLmiRejectButton
{
  void *v2;
  void *v3;

  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lmiRejectButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

- (BOOL)_accessibilityActivateKickMemberButton
{
  void *v2;
  void *v3;

  -[InCallControlsParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("kickMemberButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

@end
