@implementation PosterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.PosterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("accessibilitySubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("accessibilityDescriptionText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("accessibilityAltText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("overlayTitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PosterCell"), CFSTR("materialImage"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicCoreUI.SymbolButton"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.PosterCell"), CFSTR("isTitleChevronEnabled"), "Optional<Bool>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[PosterCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x234917594](CFSTR("MusicCoreUI.SymbolButton"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PosterCellAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isTitleChevronEnabled")))
  {
    accessibilityMusicLocalizedString(CFSTR("right.arrow.circle"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_2502CB200;
  }
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PosterCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("overlayTitleText, accessibilityAltText, accessibilityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PosterCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilitySubtitle, accessibilityDescriptionText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PosterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PosterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  return (id)-[PosterCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;
  char v6;

  v6 = 0;
  objc_opt_class();
  -[PosterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("materialImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PosterCellAccessibility;
  -[PosterCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);

}

@end
