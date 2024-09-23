@implementation PXPeopleScalableAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleScalableAvatarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleScalableAvatarView"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleScalableAvatarView"), CFSTR("person"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PXPerson"), CFSTR("px_localizedName"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  void *v11;

  -[PXPeopleScalableAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("person"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("px_localizedName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPhotosUICoreLocalizedString(CFSTR("avatar.for.name.label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("avatar.for.unknown.person.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXPeopleScalableAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PXPeopleScalableAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PXPeopleScalableAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
