@implementation ShowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.ShowcaseCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ShowcaseCell"), CFSTR("accessibilityIsExplicit"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ShowcaseCell"), CFSTR("accessibilityHeadline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ShowcaseCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.ShowcaseCell"), CFSTR("accessibilitySubtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[ShowcaseCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit"));
  -[ShowcaseCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityHeadline, accessibilityTitle, accessibilitySubtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

@end
