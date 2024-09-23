@implementation _TVOrganizerCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVOrganizerCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_TVMLShelfView"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_TVOrganizerCellViewAccessibility;
  -[_TVOrganizerCellViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVOrganizerCellViewAccessibility;
  -[_TVOrganizerCellViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[_TVOrganizerCellViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilitySubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  objc_super v30;

  -[_TVOrganizerCellViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_TVMLShelfView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVOrganizerCellViewAccessibility subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 2)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessibilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "uppercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v6);

      if (v8)
      {
        objc_msgSend(v4, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;

        objc_msgSend(v4, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frame");
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;

        if (v13 < v22)
        {
          objc_msgSend(v4, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setAccessibilityFrame:", v20, v22, v24, v26);

          objc_msgSend(v4, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setAccessibilityFrame:", v11, v13, v15, v17);

        }
      }

    }
  }
  v30.receiver = self;
  v30.super_class = (Class)_TVOrganizerCellViewAccessibility;
  -[_TVOrganizerCellViewAccessibility _accessibilitySubviews](&v30, sel__accessibilitySubviews);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
