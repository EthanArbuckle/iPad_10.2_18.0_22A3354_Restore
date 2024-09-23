@implementation SocialPersonVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SocialPersonVerticalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonVerticalCell"), CFSTR("accessibilityPersonName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonVerticalCell"), CFSTR("accessibilityPersonSubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonVerticalCell"), CFSTR("accessibilityFollowButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonVerticalCell"), CFSTR("accessibilityCloseButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SocialPersonVerticalCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityPersonName, accessibilityPersonSubtitle"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocialPersonVerticalCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SocialPersonVerticalCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SocialPersonVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFollowButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SocialPersonVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPersonName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v5);

  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[SocialPersonVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCloseButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMusicLocalizedString(CFSTR("close.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  -[SocialPersonVerticalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPersonName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityValue:", v8);

  if (v6)
    objc_msgSend(v3, "addObject:", v6);

  return v3;
}

@end
