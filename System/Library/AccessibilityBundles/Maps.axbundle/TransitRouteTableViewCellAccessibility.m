@implementation TransitRouteTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransitRouteTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TransitRouteTableViewCell"), CFSTR("_route"), "GEOComposedRoute");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("tableTextAccessibleLabel:"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TransitRouteTableViewCell"), CFSTR("RouteTableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteTableViewCell"), CFSTR("useRoutePreviewDescription"), "B", 0);

}

- (id)tableTextAccessibleLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TransitRouteTableViewCellAccessibility;
  -[TransitRouteTableViewCellAccessibility tableTextAccessibleLabel:](&v12, sel_tableTextAccessibleLabel_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[TransitRouteTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_accessibilityTransitArtworkText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("·"), CFSTR(","), v5, CFSTR("__AXStringForVariablesSentinel"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  return v9;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[TransitRouteTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("useRoutePreviewDescription")))
  {
    AXMapsLocString(CFSTR("TRANSIT_PREVIEW_HINT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TransitRouteTableViewCellAccessibility;
    -[TransitRouteTableViewCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
