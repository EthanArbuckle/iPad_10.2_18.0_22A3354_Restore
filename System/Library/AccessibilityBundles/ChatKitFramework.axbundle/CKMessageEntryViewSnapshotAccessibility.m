@implementation CKMessageEntryViewSnapshotAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryViewSnapshot");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryViewSnapshot"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryViewSnapshot"), CFSTR("browserButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewSnapshotAccessibility;
  -[CKMessageEntryViewSnapshotAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessageEntryViewSnapshotAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("browserButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("app.store.button.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
