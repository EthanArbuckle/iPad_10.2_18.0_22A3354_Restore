@implementation ParticipantInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantInfoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantInfoView"), CFSTR("nameLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[ParticipantInfoViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("nameLabel"));
}

@end
