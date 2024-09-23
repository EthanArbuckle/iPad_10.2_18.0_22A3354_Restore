@implementation EKUIInviteesViewInviteesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIInviteesViewInviteesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKParticipantForSorting"), CFSTR("participant"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewInviteesCell"), CFSTR("commentLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewInviteesCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewInviteesCell"), CFSTR("updateWithParticipantForSorting:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIInviteesViewInviteesCell"), CFSTR("updateWithParticipantForSorting: availabilityType: showSpinner: animated:"), "v", "@", "q", "B", "B", 0);

}

- (void)updateWithParticipantForSorting:(id)a3 availabilityType:(int64_t)a4 showSpinner:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  objc_super v22;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EKUIInviteesViewInviteesCellAccessibility;
  -[EKUIInviteesViewInviteesCellAccessibility updateWithParticipantForSorting:availabilityType:showSpinner:animated:](&v22, sel_updateWithParticipantForSorting_availabilityType_showSpinner_animated_, v10, a4, v7, v6);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("participant"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewInviteesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "participantRole") == 3)
  {
    accessibilityLocalizedString(CFSTR("organizer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (objc_msgSend(v12, "participantType") == 2)
  {
    accessibilityLocalizedString(CFSTR("invitee.type.room"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 6 && ((0x6Bu >> v17) & 1) != 0)
  {
    accessibilityLocalizedString(*(&off_2501FCF58 + v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(v12, "participantStatus");
  if (v19 > 7)
  {
    v20 = 0;
  }
  else
  {
    accessibilityLocalizedString(*(&off_2501FCF90 + v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInviteesCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v21, v20, v18, v15, v16, CFSTR("__AXStringForVariablesSentinel"));

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[EKUIInviteesViewInviteesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("commentLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithParticipantForSorting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUIInviteesViewInviteesCellAccessibility;
  -[EKUIInviteesViewInviteesCellAccessibility updateWithParticipantForSorting:](&v14, sel_updateWithParticipantForSorting_, v4);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("participant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIInviteesViewInviteesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "participantRole") == 3)
  {
    accessibilityLocalizedString(CFSTR("organizer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v6, "participantType") == 2)
  {
    accessibilityLocalizedString(CFSTR("invitee.type.room"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v6, "participantStatus");
  if (v11 > 7)
  {
    v12 = 0;
  }
  else
  {
    accessibilityLocalizedString(*(&off_2501FCF90 + v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIInviteesViewInviteesCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v13, v12, v9, v10, CFSTR("__AXStringForVariablesSentinel"));

}

@end
