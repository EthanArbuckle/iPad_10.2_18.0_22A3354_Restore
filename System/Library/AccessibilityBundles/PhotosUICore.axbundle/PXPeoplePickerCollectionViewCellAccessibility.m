@implementation PXPeoplePickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeoplePickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeoplePickerCollectionViewCell"), CFSTR("nameLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PXPeoplePickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("people.name.unknown"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
