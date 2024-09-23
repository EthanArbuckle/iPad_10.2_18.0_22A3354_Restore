@implementation CKAvatarTitleCollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarTitleCollectionReusableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarTitleCollectionReusableView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAvatarTitleCollectionReusableView"), CFSTR("_avatarTitleAccessoryImageType"), "q");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarTitleCollectionReusableViewAccessibility;
  -[CKAvatarTitleCollectionReusableViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKAvatarTitleCollectionReusableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CKAvatarTitleCollectionReusableViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_avatarTitleAccessoryImageType")) == 1)
  {
    accessibilityLocalizedString(CFSTR("conversation.verified"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[CKAvatarTitleCollectionReusableViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;

  -[CKAvatarTitleCollectionReusableViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    return -[CKAvatarTitleCollectionReusableViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible");
  else
    return 0;
}

- (id)accessibilityHint
{
  void *v3;

  -[CKAvatarTitleCollectionReusableViewAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKAvatarTitleCollectionReusableViewAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  else
    accessibilityLocalizedString(CFSTR("multi.person.header.hint"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
