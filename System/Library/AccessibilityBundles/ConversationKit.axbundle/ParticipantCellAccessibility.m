@implementation ParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantCell"), CFSTR("participantView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantCell"), CFSTR("accessibilityDisplayName"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ParticipantCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityDisplayName"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[ParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("participantView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[ParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("participantView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  -[ParticipantCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("participantView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
