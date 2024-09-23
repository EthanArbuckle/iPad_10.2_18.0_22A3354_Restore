@implementation ParticipantMonogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantMonogramView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantMonogramView"), CFSTR("titleLabelContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantMonogramView"), CFSTR("subtitleLabelContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantMonogramView"), CFSTR("ringButton"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[ParticipantMonogramViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("subtitleLabelContainer, titleLabelContainer"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[ParticipantMonogramViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("ringButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("ring.again"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__axHandleRingMemberAction);
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (BOOL)_axHandleRingMemberAction
{
  void *v2;
  void *v3;

  -[ParticipantMonogramViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("ringButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 64);
  return v3 != 0;
}

@end
