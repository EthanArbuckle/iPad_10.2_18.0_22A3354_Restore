@implementation VMMessageMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VMMessageMetadataView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("shortDateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("shortDurationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("currentViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PHVoicemailMessageTableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("unreadIndicatorImageView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  void *v2;
  int64_t v3;

  -[VMMessageMetadataViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PHVoicemailMessageTableViewCell")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isExpanded")))
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  if (-[VMMessageMetadataViewAccessibility _axIsVoiceMailUnread](self, "_axIsVoiceMailUnread"))
  {
    accessibilityLocalizedString(CFSTR("voicemail.unread"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[VMMessageMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMMessageMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[VMMessageMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shortDateLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v10, 3, -[VMMessageMetadataViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[VMMessageMetadataViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[VMMessageMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shortDurationLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXLocalizeDurationTime();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  -[VMMessageMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentViewModel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "_axLocalizedSenderIdentityFullName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)_axIsVoiceMailUnread
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[VMMessageMetadataViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("PHVoicemailMessageTableViewCell")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("unreadIndicatorImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v5 = v4 > 0.0;

  return v5;
}

@end
