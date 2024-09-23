@implementation _CAMExpandingControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CAMExpandingControlButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CAMExpandingControlButton"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CAMExpandingControlButton"), CFSTR("isSlashed"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMExpandingControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("_titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("_menuButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("menu"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("_selectedMenuItem"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_CAMExpandingControlButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_CAMExpandingControlButtonAccessibility _axCameraExpandingControl](self, "_axCameraExpandingControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  _CAMExpandingControlButtonAccessibility *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  objc_super v12;

  -[_CAMExpandingControlButtonAccessibility _axCameraExpandingControl](self, "_axCameraExpandingControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_titleView"));
  v5 = (_CAMExpandingControlButtonAccessibility *)objc_claimAutoreleasedReturnValue();
  -[_CAMExpandingControlButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != self)
  {

LABEL_4:
    v12.receiver = self;
    v12.super_class = (Class)_CAMExpandingControlButtonAccessibility;
    -[_CAMExpandingControlButtonAccessibility accessibilityValue](&v12, sel_accessibilityValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v6)
  {
    if ((-[_CAMExpandingControlButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSlashed")) & 1) != 0)
      v9 = CFSTR("EXPANDING_CONTROL_OFF");
    else
      v9 = CFSTR("EXPANDING_CONTROL_ON");
    accessibilityCameraUILocalizedString(v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "accessibilityValue");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v10;

LABEL_12:
  return v8;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CAMExpandingControlButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[_CAMExpandingControlButtonAccessibility accessibilityTraits](&v13, sel_accessibilityTraits);
  -[_CAMExpandingControlButtonAccessibility _axCameraExpandingControl](self, "_axCameraExpandingControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeArrayForKey:", CFSTR("_menuButtons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", self);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      objc_msgSend(v5, "safeArrayForKey:", CFSTR("menu"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_selectedMenuItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v3 |= *MEMORY[0x24BDF7400];
      else
        v3 &= ~*MEMORY[0x24BDF7400];

    }
  }

  return v3;
}

- (id)_axCameraExpandingControl
{
  return (id)-[_CAMExpandingControlButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 1);
}

@end
