@implementation NavSignManeuverCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavSignManeuverCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverCell"), CFSTR("primaryTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverCell"), CFSTR("secondaryTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverCell"), CFSTR("guidanceManeuverView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceManeuverView"), CFSTR("maneuverArtwork"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceManeuverArtwork"), CFSTR("maneuver"), "i", 0);

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
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v12;
  const __CFString *v13;

  -[NavSignManeuverCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("primaryTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_25025B660;
  }
  -[NavSignManeuverCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("secondaryTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v5, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  -[NavSignManeuverCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("guidanceManeuverView.maneuverArtwork"), v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeIntForKey:", CFSTR("maneuver"));

  if (v8)
  {
    AXMapsStringForManeuverType(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_25025B660;
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
