@implementation UIStatusBarLocationItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarLocationItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarLocationItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarLocationItemViewAccessibility;
  return -[UIStatusBarLocationItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

- (id)accessibilityLabel
{
  id v3;
  int v4;

  v3 = (id)-[UIStatusBarLocationItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconType"));
  v4 = objc_msgSend(v3, "intValue");

  switch(v4)
  {
    case 0:
      return accessibilityLocalizedString(CFSTR("status.location.icon"));
    case 1:
      return accessibilityLocalizedString(CFSTR("status.location.geofence"));
    case 2:
      return accessibilityLocalizedString(CFSTR("status.location.prominent"));
  }
  return 0;
}

- (id)accessibilityIdentifier
{
  id v3;
  int v4;

  v3 = (id)-[UIStatusBarLocationItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconType"));
  v4 = objc_msgSend(v3, "intValue");

  switch(v4)
  {
    case 0:
      return CFSTR("StandardLocationTrackingOn");
    case 1:
      return CFSTR("GeofenceLocationTrackingOn");
    case 2:
      return CFSTR("ProminentLocationTrackingOn");
  }
  return 0;
}

@end
