@implementation DirectionsStepTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DirectionsStepTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DirectionsStepTableViewCell"), CFSTR("_stepView"), "DirectionsStepView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DirectionsStepView"), CFSTR("_labelListView"), "RouteStepLabelListView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DirectionsStepView"), CFSTR("_roadDescriptionLabel"), "MKMultiPartLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DirectionsStepView"), CFSTR("setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:"), "v", "@", "@", "Q", "B", "q", 0);

}

- (void)_axAnnotateRoadDescriptionListView
{
  id v2;

  -[DirectionsStepTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_roadDescriptionLabel"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityElementsHidden:", 1);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DirectionsStepTableViewCellAccessibility;
  -[DirectionsStepTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[DirectionsStepTableViewCellAccessibility _axAnnotateRoadDescriptionListView](self, "_axAnnotateRoadDescriptionListView");
}

- (id)_axStepView
{
  return (id)-[DirectionsStepTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stepView"));
}

- (id)_axRoadDescriptionLabel
{
  void *v2;
  void *v3;

  -[DirectionsStepTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_roadDescriptionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRoute:(id)a3 step:(id)a4 stepIndex:(unint64_t)a5 alignToLeftEdgeIfNoManeuverSign:(BOOL)a6 size:(int64_t)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepTableViewCellAccessibility;
  -[DirectionsStepTableViewCellAccessibility setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:](&v8, sel_setRoute_step_stepIndex_alignToLeftEdgeIfNoManeuverSign_size_, a3, a4, a5, a6, a7);
  -[DirectionsStepTableViewCellAccessibility _axAnnotateRoadDescriptionListView](self, "_axAnnotateRoadDescriptionListView");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[DirectionsStepTableViewCellAccessibility _axStepView](self, "_axStepView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_labelListView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DirectionsStepTableViewCellAccessibility _axRoadDescriptionLabel](self, "_axRoadDescriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
