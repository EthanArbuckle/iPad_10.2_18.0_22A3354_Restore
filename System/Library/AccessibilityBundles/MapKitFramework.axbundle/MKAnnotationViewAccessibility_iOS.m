@implementation MKAnnotationViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKAnnotationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKAnnotationView"), CFSTR("_disclosureCalloutButton"), "@", 0);
}

- (id)accessibilityHint
{
  void *v2;
  char isKindOfClass;
  void *v4;

  -[MKAnnotationViewAccessibility_iOS safeValueForKey:](self, "safeValueForKey:", CFSTR("annotation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FMFSAMapAnnotation"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    AXMapKitLocString(CFSTR("MAP_PIN_HINT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  -[MKAnnotationViewAccessibility_iOS accessibilityLabel](&v13, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MKAnnotationViewAccessibility_iOS annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "accessibilityLabel");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
    }
    else
    {
      v5 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "subtitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "accessibilityLabel");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
    }
    else
    {
      v8 = 0;
    }
    __UIAXStringForVariables();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length", v8, CFSTR("__AXStringForVariablesSentinel")))
    {
      AXMapKitLocString(CFSTR("MAP_PIN_TITLE"));
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  return *MEMORY[0x24BDFEFE8] | -[MKAnnotationViewAccessibility_iOS accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[MKAnnotationViewAccessibility_iOS isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  MKAnnotationViewAccessibility_iOS *v8;
  MKAnnotationViewAccessibility_iOS *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[MKAnnotationViewAccessibility_iOS isAccessibilityElement](self, "isAccessibilityElement")
    && -[MKAnnotationViewAccessibility_iOS pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MKAnnotationViewAccessibility_iOS;
    -[MKAnnotationViewAccessibility_iOS _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (MKAnnotationViewAccessibility_iOS *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  -[MKAnnotationViewAccessibility_iOS accessibilityValue](&v6, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MKAnnotationViewAccessibility_iOS annotation](self, "annotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityValueForKey:", CFSTR("AccessibilityDeterminedLocation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)accessibilityLocality
{
  void *v2;
  void *v3;

  -[MKAnnotationViewAccessibility_iOS annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityValueForKey:", CFSTR("AccessibilityDeterminedLocality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_disclosureCalloutButton
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MKAnnotationViewAccessibility_iOS;
  objc_msgSendSuper2(&v4, sel__disclosureCalloutButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("AccessibilityMoreInfoButtonIdentifier"));
  return v2;
}

@end
