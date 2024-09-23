@implementation MRUNowPlayingTransportControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUNowPlayingTransportControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("leadingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("leftButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("centerButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("rightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("routingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("layout"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingTransportControlsView"), CFSTR("showRoutingButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUTransportButton"), CFSTR("transportControlItem"), "@", 0);

}

- (id)accessibilityElements
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  if (-[MRUNowPlayingTransportControlsViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_layout")))
  {
    v11.receiver = self;
    v11.super_class = (Class)MRUNowPlayingTransportControlsViewAccessibility;
    -[MRUNowPlayingTransportControlsViewAccessibility accessibilityElements](&v11, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_new();
    -[MRUNowPlayingTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("transportControlItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v4, "axSafelyAddObject:", v5);
    -[MRUNowPlayingTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axSafelyAddObject:", v7);

    -[MRUNowPlayingTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("centerButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axSafelyAddObject:", v8);

    -[MRUNowPlayingTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axSafelyAddObject:", v9);

    if (-[MRUNowPlayingTransportControlsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showRoutingButton")))
    {
      -[MRUNowPlayingTransportControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("routingButton"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axSafelyAddObject:", v10);

    }
    return v4;
  }
}

@end
