@implementation EKUIInviteesViewTimeSlotCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIInviteesViewTimeSlotCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewTimeSlotCell"), CFSTR("checked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewTimeSlotCell"), CFSTR("topTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewTimeSlotCell"), CFSTR("bottomTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewTimeSlotCell"), CFSTR("participantsTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewTimeSlotCell"), CFSTR("initWithStyle: reuseIdentifier:"), "@", "q", "@", 0);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  v3 = -[EKUIInviteesViewTimeSlotCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[EKUIInviteesViewTimeSlotCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("checked"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[EKUIInviteesViewTimeSlotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("topTimeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewTimeSlotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("participantsTextView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  -[EKUIInviteesViewTimeSlotCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[EKUIInviteesViewTimeSlotCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("participantsTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (EKUIInviteesViewTimeSlotCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIInviteesViewTimeSlotCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIInviteesViewTimeSlotCellAccessibility;
  v4 = -[EKUIInviteesViewTimeSlotCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[EKUIInviteesViewTimeSlotCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
