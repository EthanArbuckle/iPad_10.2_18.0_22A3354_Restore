@implementation CNMeCardSharingOnboardingAvatarCarouselCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNMeCardSharingOnboardingAvatarCarouselCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCarouselItem
{
  JUMPOUT(0x23490B9A0);
}

- (void)_axSetCarouselItem:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselItem"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselItem"), CFSTR("imageType"), "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;

  -[CNMeCardSharingOnboardingAvatarCarouselCellAccessibility _axCarouselItem](self, "_axCarouselItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("imageType"));
    if (v6 > 4)
    {
      v7 = 0;
      goto LABEL_7;
    }
    accessibilityLocalizedString(off_2501D83B0[v6]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
LABEL_7:

  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  unint64_t v3;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[CNMeCardSharingOnboardingAvatarCarouselCellAccessibility _axImageType](self, "_axImageType");
  if (v3 <= 4 && ((1 << v3) & 0x1A) != 0)
    v2 |= *MEMORY[0x24BDF73C8];
  return v2;
}

- (unint64_t)_axImageType
{
  void *v2;
  unint64_t v3;

  -[CNMeCardSharingOnboardingAvatarCarouselCellAccessibility _axCarouselItem](self, "_axCarouselItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("imageType"));

  return v3;
}

@end
