@implementation RoutePlanningWaypointCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RoutePlanningWaypointCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RoutePlanningWaypointCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_reorderControlImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RoutePlanningWaypointCell"), CFSTR("currentText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RoutePlanningWaypointCell"), CFSTR("_iconView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RoutePlanningWaypointCell"), CFSTR("_titleTextField"), "RoutePlanningWaypointTextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityTextElementText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[RoutePlanningWaypointCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("currentText"));
}

- (id)accessibilityHint
{
  return AXMapsLocString(CFSTR("route.cell.change.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;

  -[RoutePlanningWaypointCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __80__RoutePlanningWaypointCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349135AC](CFSTR("UITableViewCellReorderControl"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityTextElementText
{
  return (id)-[RoutePlanningWaypointCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("currentText"));
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[RoutePlanningWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_reorderControlImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoutePlanningWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RoutePlanningWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleTextField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
