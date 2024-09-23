@implementation _SFNavigationBarURLButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFNavigationBarURLButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_progressView"), "_SFFluidProgressView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_URLLabel"), "SFURLLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFNavigationBar"), CFSTR("_URLOutline"), "_SFNavigationBarURLButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFFluidProgressView"), CFSTR("_state"), "WBSFluidProgressState");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SFNavigationBarURLButton"), CFSTR("UIButton"));

}

- (id)accessibilityLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_SFNavigationBarURLButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar"), a2, a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_URLOutline"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits:(id)a3
{
  return *MEMORY[0x24BDF7430];
}

- (CGRect)accessibilityFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[_SFNavigationBarURLButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_URLLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accessibilityFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[_SFNavigationBarURLButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar"), a2, a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_progressView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("fluidProgressValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = 0;
  if (v8 < 1.0 && v8 > 0.0)
  {
    AXFormatFloatWithPercentage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_URLOutline"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)accessibilityElementsHidden
{
  return -[_SFNavigationBarURLButtonAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!-[_SFNavigationBarURLButtonAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled"))return 0;
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[_SFNavigationBarURLButtonAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v5, "setAccessibilityDelegate:", self);
    -[_SFNavigationBarURLButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", v6);

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDF67B0]);
    accessibilitySafariServicesLocalizedString(CFSTR("drop.onto.address.bar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:view:", v9, v7);

    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityDropPointDescriptors:", v11);

    objc_msgSend(v4, "addObject:", v5);
    -[_SFNavigationBarURLButtonAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);

  }
  v12 = (void *)objc_msgSend(v4, "mutableCopy");

  -[_SFNavigationBarURLButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibleSubviews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);
  objc_msgSend(v12, "sortUsingSelector:", sel_accessibilityCompareGeometry_);

  return v12;
}

- (CGRect)accessibilityFrame
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  -[_SFNavigationBarURLButtonAccessibility bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (AXRequestingClient() && AXRequestingClient() != 10)
  {
    v14.origin.x = v3;
    v14.origin.y = v5;
    v14.size.width = v7;
    v14.size.height = v9;
    CGRectInset(v14, 10.0, 0.0);
  }
  UIAccessibilityFrameForBounds();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 0;
}

@end
