@implementation RadioStationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.RadioStationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RadioStationCell"), CFSTR("supertitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RadioStationCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RadioStationCell"), CFSTR("stationDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.RadioStationCell"), CFSTR("accessibilityIsExplicit"), "B", 0);

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
  void *v8;

  -[RadioStationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("supertitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioStationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioStationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stationDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[RadioStationCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")) & 1) != 0)
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;

  -[RadioStationCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("supertitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RadioStationCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RadioStationCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[RadioStationCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
