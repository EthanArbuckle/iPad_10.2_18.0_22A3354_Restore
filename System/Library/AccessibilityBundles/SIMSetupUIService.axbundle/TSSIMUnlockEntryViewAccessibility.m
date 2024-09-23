@implementation TSSIMUnlockEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TSSIMUnlockEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TSSIMUnlockEntryView"), CFSTR("_entryField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TSSIMUnlockEntryView"), CFSTR("_detailLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TSSIMUnlockEntryView"), CFSTR("initWithActionType:actionSubtype:"), "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TSSIMUnlockEntryView"), CFSTR("_configureDetailLabelText"), "v", 0);

}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return (id)-[TSSIMUnlockEntryViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_detailLabel"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  -[TSSIMUnlockEntryViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[TSSIMUnlockEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entryField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("enter.sim.pin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (TSSIMUnlockEntryViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  TSSIMUnlockEntryViewAccessibility *v4;
  TSSIMUnlockEntryViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  v4 = -[TSSIMUnlockEntryViewAccessibility initWithActionType:actionSubtype:](&v7, sel_initWithActionType_actionSubtype_, a3, a4);
  v5 = v4;
  if (v4)
    -[TSSIMUnlockEntryViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

- (void)_configureDetailLabelText
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSSIMUnlockEntryViewAccessibility;
  -[TSSIMUnlockEntryViewAccessibility _configureDetailLabelText](&v6, sel__configureDetailLabelText);
  v3 = *MEMORY[0x24BDF71E8];
  -[TSSIMUnlockEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

@end
