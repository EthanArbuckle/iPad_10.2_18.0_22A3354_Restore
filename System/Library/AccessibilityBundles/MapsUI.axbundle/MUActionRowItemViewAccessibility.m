@implementation MUActionRowItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUActionRowItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUActionRowItemView"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUActionRowItemView"), CFSTR("glyphName"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  -[MUActionRowItemViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActionRowItemTypeDirections")) & 1) != 0)
    -[MUActionRowItemViewAccessibility _axNavigationDirectionsLabelHelper](self, "_axNavigationDirectionsLabelHelper");
  else
    -[MUActionRowItemViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axNavigationDirectionsLabelHelper
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;

  -[MUActionRowItemViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("glyphName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUActionRowItemViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("car.fill")) & 1) != 0)
  {
    v5 = CFSTR("travel.time.driving");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("figure.walk")) & 1) != 0)
  {
    v5 = CFSTR("travel.time.walking");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tram.fill")) & 1) != 0)
  {
    v5 = CFSTR("travel.time.transit");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("bicycle")))
  {
    v5 = CFSTR("travel.time.bike");
  }
  else
  {
    v5 = &stru_25026A470;
  }
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_25026A470))
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
