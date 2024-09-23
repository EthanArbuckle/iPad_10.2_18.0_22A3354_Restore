@implementation ETCompositionUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  char v13;

  -[ETCompositionUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ETCompositionExpandColorPickerButton"));

  if (v4
    && (v13 = 0,
        objc_opt_class(),
        __UIAccessibilityCastAsClass(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        (v6 = v5) != 0))
  {
    v7 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithCGColor:", objc_msgSend(v8, "borderColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "safeValueForKey:", CFSTR("_accessibilityColorDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ETCompositionUIButtonAccessibility;
    -[ETCompositionUIButtonAccessibility accessibilityValue](&v12, sel_accessibilityValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  -[ETCompositionUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ETCompositionExpandColorPickerButton")))
  {

  }
  else
  {
    -[ETCompositionUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ETCompositionExpandToCameraButton"));

    if (!v5)
    {
      v8.receiver = self;
      v8.super_class = (Class)ETCompositionUIButtonAccessibility;
      -[ETCompositionUIButtonAccessibility accessibilityPath](&v8, sel_accessibilityPath);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  -[ETCompositionUIButtonAccessibility _accessibilityCirclePathBasedOnBoundsWidth](self, "_accessibilityCirclePathBasedOnBoundsWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

@end
