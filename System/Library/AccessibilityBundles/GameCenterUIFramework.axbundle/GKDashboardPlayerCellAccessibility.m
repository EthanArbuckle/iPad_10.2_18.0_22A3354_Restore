@implementation GKDashboardPlayerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKDashboardPlayerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardPlayerCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardPlayerCell"), CFSTR("statusLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("GKDashboardPlayerCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("GKDashboardPlayerPickerCell"), CFSTR("GKDashboardPlayerCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardPlayerPickerCell"), CFSTR("showsPlayerSubtitle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKDashboardPlayerPickerCell"), CFSTR("showsMessagesHandleInStatusText"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  const __CFString *v3;

  MEMORY[0x23490F8D4](CFSTR("GKDashboardPlayerPickerCell"), a2);
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[GKDashboardPlayerCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsPlayerSubtitle")) & 1) != 0
    || -[GKDashboardPlayerCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsMessagesHandleInStatusText")))
  {
    v3 = CFSTR("nameLabel, statusLabel");
  }
  else
  {
    v3 = CFSTR("nameLabel");
  }
  -[GKDashboardPlayerCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v3 = -[GKDashboardPlayerCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardPlayerCellAccessibility;
  v4 = *MEMORY[0x24BDF73B0] | -[GKDashboardPlayerCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  v5 = *MEMORY[0x24BDF7400] | v4;
  v6 = v4 & ~*MEMORY[0x24BDF7400];
  if (v3)
    return v5;
  else
    return v6;
}

@end
