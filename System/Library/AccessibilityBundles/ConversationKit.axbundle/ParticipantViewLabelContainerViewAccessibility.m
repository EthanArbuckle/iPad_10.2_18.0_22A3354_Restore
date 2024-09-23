@implementation ParticipantViewLabelContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantViewLabelContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.ParticipantViewLabelContainerView"), CFSTR("label"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ParticipantViewLabelContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
