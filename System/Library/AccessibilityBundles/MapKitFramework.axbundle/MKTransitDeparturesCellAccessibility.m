@implementation MKTransitDeparturesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKTransitDeparturesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsInActivate
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetIsInActivate:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MKTransitDeparturesCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKTransitDeparturesCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_primaryLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:", CFSTR("MKThemeMultiPartLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_secondaryLabel"), "MKThemeMultiPartLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_lineImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_showIncidentIcon"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_departureLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitDeparturesCell"), CFSTR("_tertiaryLabel"), "MKThemeMultiPartLabel");

}

- (BOOL)_axIsCountdownCell
{
  return -[MKTransitDeparturesCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_departureLabelStyle")) == 1;
}

- (id)tableTextAccessibleLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKTransitDeparturesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lineImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MKTransitDeparturesCellAccessibility _axIsCountdownCell](self, "_axIsCountdownCell"))
  {
    -[MKTransitDeparturesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitDeparturesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MKTransitDeparturesCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showIncidentIcon")))
    {
      AXMapKitLocString(CFSTR("HAS_INCIDENT"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[MKTransitDeparturesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_departureLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitDeparturesCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tertiaryLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length") && objc_msgSend(v16, "length"))
    {
      v22[0] = v14;
      v22[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v14, "length"))
        v19 = v14;
      else
        v19 = v16;
      v18 = v19;
    }
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MKTransitDeparturesCellAccessibility;
    -[MKTransitDeparturesCellAccessibility tableTextAccessibleLabel:](&v21, sel_tableTextAccessibleLabel_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
