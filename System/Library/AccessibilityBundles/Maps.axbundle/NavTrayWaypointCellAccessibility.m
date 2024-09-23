@implementation NavTrayWaypointCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavTrayWaypointCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayWaypointCell"), CFSTR("_leadingImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayWaypointCell"), CFSTR("_titleLabel"), "MapsFadingLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayWaypointCell"), CFSTR("_subtitleLabel"), "MapsFadingLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayWaypointCell"), CFSTR("_deleteView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NavTrayWaypointCell"), CFSTR("_phoneCallView"), "UIView");

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
  void *v7;

  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leadingImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;

  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_phoneCallView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  char v11;

  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_phoneCallView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_opt_class();
  -[NavTrayWaypointCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  AXMapsLocString(CFSTR("CALL_LOCATION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityLabel:", v9);
  v10.receiver = self;
  v10.super_class = (Class)NavTrayWaypointCellAccessibility;
  -[NavTrayWaypointCellAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);

}

@end
