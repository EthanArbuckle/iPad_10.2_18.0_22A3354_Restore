@implementation EKEventEstimatedTravelTimeResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventEstimatedTravelTimeResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKEventEstimatedTravelTimeResultCell"), CFSTR("EKCalendarChooserCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKCalendarChooserCell"), CFSTR("_colorDot"), "UIImage");

}

- (id)accessibilityLabel
{
  EKEventEstimatedTravelTimeResultCellAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EKEventEstimatedTravelTimeResultCellAccessibility *v14;
  void *v15;

  v2 = self;
  objc_opt_class();
  -[EKEventEstimatedTravelTimeResultCellAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("_colorDot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CarImage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v8 = CFSTR("travel.time.estimate.car");
LABEL_6:
    accessibilityLocalizedString(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  WalkmanImage();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    v8 = CFSTR("travel.time.estimate.walking");
    goto LABEL_6;
  }
  v14 = v2;
  _AXAssert();
  v7 = 0;
LABEL_7:
  -[EKEventEstimatedTravelTimeResultCellAccessibility textLabel](v2, "textLabel", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEstimatedTravelTimeResultCellAccessibility detailTextLabel](v2, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
