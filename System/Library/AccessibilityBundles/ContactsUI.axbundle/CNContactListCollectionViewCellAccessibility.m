@implementation CNContactListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactListCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactListCollectionViewCell"), CFSTR("isEmergencyContact"), "B", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListCollectionViewCellAccessibility;
  -[CNContactListCollectionViewCellAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactListCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isEmergencyContact")))
  {
    accessibilityLocalizedString(CFSTR("contact.cell.emergency"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
