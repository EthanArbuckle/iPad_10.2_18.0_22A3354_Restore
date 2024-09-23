@implementation GuidanceManeuverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GuidanceManeuverView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceManeuverView"), CFSTR("maneuverArtwork"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceManeuverArtwork"), CFSTR("maneuver"), "i", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[GuidanceManeuverViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maneuverArtwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntForKey:", CFSTR("maneuver"));

  if (v3)
  {
    AXMapsStringForManeuverType(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_25025B660;
  }
  return v4;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
