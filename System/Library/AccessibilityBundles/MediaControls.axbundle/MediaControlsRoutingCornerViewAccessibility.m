@implementation MediaControlsRoutingCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsRoutingCornerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRoutingCornerView"), CFSTR("isRouting"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsRoutingCornerView"), CFSTR("routesAreAvailable"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    v4 = -[MediaControlsRoutingCornerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("routesAreAvailable"));
  else
    v4 = 0;

  return v4;
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;

  if ((-[MediaControlsRoutingCornerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isRouting")) & 1) != 0)
  {
    v3 = CFSTR("connected.route");
  }
  else
  {
    if (!-[MediaControlsRoutingCornerViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("routesAreAvailable")))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("available.route");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
