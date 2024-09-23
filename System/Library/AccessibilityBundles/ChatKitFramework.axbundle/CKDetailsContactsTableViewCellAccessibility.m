@implementation CKDetailsContactsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsContactsTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsContactsTableViewCell"), CFSTR("messageButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsContactsTableViewCell"), CFSTR("phoneButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsContactsTableViewCell"), CFSTR("facetimeVideoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsContactsTableViewCell"), CFSTR("screenSharingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsContactsTableViewCell"), CFSTR("initWithStyle: reuseIdentifier:"), "@", "q", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsContactsTableViewCellAccessibility;
  -[CKDetailsContactsTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[CKDetailsContactsTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("messageButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.message.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CKDetailsContactsTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("phoneButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.phone.button.label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[CKDetailsContactsTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("facetimeVideoButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.facetime.video.button.label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[CKDetailsContactsTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("screenSharingButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.screensharing.button.label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("more.contact.information"));
}

- (CKDetailsContactsTableViewCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsContactsTableViewCellAccessibility *v4;
  CKDetailsContactsTableViewCellAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsContactsTableViewCellAccessibility;
  v4 = -[CKDetailsContactsTableViewCellAccessibility initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKDetailsContactsTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

@end
