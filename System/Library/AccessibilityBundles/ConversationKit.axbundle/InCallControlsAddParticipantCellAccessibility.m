@implementation InCallControlsAddParticipantCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallControlsAddParticipantCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InCallControlsAddParticipantCellAccessibility;
  v2 = -[InCallControlsAddParticipantCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF73B0] | v2;
  LODWORD(v2) = objc_msgSend(v3, "isUserInteractionEnabled");

  v5 = *MEMORY[0x24BDF73E8];
  if ((_DWORD)v2)
    v5 = 0;
  return v4 | v5;
}

@end
