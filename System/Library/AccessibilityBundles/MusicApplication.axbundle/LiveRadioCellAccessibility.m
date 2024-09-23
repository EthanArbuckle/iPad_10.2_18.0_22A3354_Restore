@implementation LiveRadioCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.LiveRadioCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityHeaderTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityHeaderSubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityHeadline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilitySubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityAccessoryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("accessibilityAccessoryCalendarButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedMaterialCell"), CFSTR("accessibilityPlayButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.LiveRadioCell"), CFSTR("MusicApplication.FeaturedMaterialCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[LiveRadioCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityHeaderTitle, accessibilityHeaderSubtitle, accessibilityHeadline, accessibilityTitle, accessibilitySubtitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityStripUnfavorableCharacters(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[LiveRadioCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)LiveRadioCellAccessibility;
  -[LiveRadioCellAccessibility _accessibilitySupplementaryFooterViews](&v9, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[LiveRadioCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAccessoryButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);
  -[LiveRadioCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAccessoryCalendarButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", &__block_literal_global_3);
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v6);
  -[LiveRadioCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlayButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

id __68__LiveRadioCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityMusicLocalizedString(CFSTR("schedule.calendar"));
}

@end
