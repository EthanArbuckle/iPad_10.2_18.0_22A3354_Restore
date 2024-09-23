@implementation UIMapsSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TransportTypePicker"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UISegmentedControl"), CFSTR("_segments"), "NSMutableArray");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  UIMapsSegmentAccessibility *v6;
  UIMapsSegmentAccessibility *v7;
  void *v8;
  __CFString *v10;
  objc_super v11;

  -[UIMapsSegmentAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("arrowsButton")))
    goto LABEL_6;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_segments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (UIMapsSegmentAccessibility *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      v10 = CFSTR("BACK_DIRECTION");
    }
    else
    {
      objc_msgSend(v5, "objectAtIndex:", 1);
      v7 = (UIMapsSegmentAccessibility *)objc_claimAutoreleasedReturnValue();

      if (v7 != self)
        goto LABEL_5;
      v10 = CFSTR("FORWARD_DIRECTION");
    }
    AXMapsLocString(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_5:

LABEL_6:
  v11.receiver = self;
  v11.super_class = (Class)UIMapsSegmentAccessibility;
  -[UIMapsSegmentAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

@end
