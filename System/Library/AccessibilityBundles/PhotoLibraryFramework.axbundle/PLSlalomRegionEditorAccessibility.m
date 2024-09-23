@implementation PLSlalomRegionEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLSlalomRegionEditor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PLSlalomRegionEditor"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLSlalomRegionEditor"), CFSTR("setStartValue: notify:"), "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLSlalomRegionEditor"), CFSTR("setEndValue: notify:"), "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_startValue"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_endValue"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_maxValue"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_minValue"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_delegate"), "<PLSlalomRegionEditorDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_startHandleView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_endHandleView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLSlalomRegionEditor"), CFSTR("_trackImageView"), "UIImageView");

}

- (void)setStartValue:(double)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a4;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v22.receiver = self;
  v22.super_class = (Class)PLSlalomRegionEditorAccessibility;
  -[PLSlalomRegionEditorAccessibility setStartValue:notify:](&v22, sel_setStartValue_notify_, v4, a3);
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 != v9)
  {
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("StartHandle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_maxValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    _createFormatDurationString(v20, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityValue:", v21);

  }
}

- (void)setEndValue:(double)a3 notify:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a4;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v22.receiver = self;
  v22.super_class = (Class)PLSlalomRegionEditorAccessibility;
  -[PLSlalomRegionEditorAccessibility setEndValue:notify:](&v22, sel_setEndValue_notify_, v4, a3);
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v12 != v9)
  {
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("EndHandle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_maxValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    _createFormatDurationString(v20, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityValue:", v21);

  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  double v16;
  double v17;
  UIAccessibilityNotifications *v18;
  void *v19;
  void *v20;
  UIAccessibilityNotifications v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  UIAccessibilityNotifications v28;
  void *v29;
  objc_super v31;

  v6 = a4;
  v7 = a3;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v31.receiver = self;
  v31.super_class = (Class)PLSlalomRegionEditorAccessibility;
  v14 = -[PLSlalomRegionEditorAccessibility continueTrackingWithTouch:withEvent:](&v31, sel_continueTrackingWithTouch_withEvent_, v7, v6);

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
  if (v10 != v17)
  {
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("StartHandle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *v18;
    objc_msgSend(v20, "accessibilityValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v21, v22);

  }
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  if (v13 != v25)
  {
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("EndHandle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *v18;
    objc_msgSend(v27, "accessibilityValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v28, v29);

  }
  return v14;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  UIAccessibilityNotifications *v26;
  UIAccessibilityNotifications v27;
  void *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  UIAccessibilityNotifications v34;
  void *v35;
  void *v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startHandleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endHandleView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v37.receiver = self;
  v37.super_class = (Class)PLSlalomRegionEditorAccessibility;
  -[PLSlalomRegionEditorAccessibility layoutSubviews](&v37, sel_layoutSubviews);
  objc_msgSend(v3, "accessibilityFrame");
  v40.origin.x = v21;
  v40.origin.y = v22;
  v40.size.width = v23;
  v40.size.height = v24;
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  v25 = CGRectEqualToRect(v38, v40);
  v26 = (UIAccessibilityNotifications *)MEMORY[0x24BEBAF98];
  if (!v25)
  {
    v27 = *MEMORY[0x24BEBAF98];
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("StartHandle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v27, v29);

  }
  objc_msgSend(v12, "accessibilityFrame");
  v41.origin.x = v30;
  v41.origin.y = v31;
  v41.size.width = v32;
  v41.size.height = v33;
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  if (!CGRectEqualToRect(v39, v41))
  {
    v34 = *v26;
    -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", CFSTR("EndHandle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v34, v36);

  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "objectForKey:", CFSTR("Children"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Children"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Children"));
    -[PLSlalomRegionEditorAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("userInfo"));
  }
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_maxValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startHandleView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_allocWithZone((Class)PLUIAccessibilityMockSlider), "initWithAccessibilityContainer:", self);
    objc_msgSend(v12, "setView:", v11);
    objc_msgSend(v12, "setMockSliderDelegate:", self);
    objc_msgSend(v12, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("slomo.trim.begin"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityLabel:", v13);

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    _createFormatDurationString(v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityValue:", v17);
    objc_msgSend(v7, "addObject:", v12);
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("StartHandle"));

  }
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endHandleView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_allocWithZone((Class)PLUIAccessibilityMockSlider), "initWithAccessibilityContainer:", self);
    objc_msgSend(v19, "setView:", v18);
    objc_msgSend(v19, "setMockSliderDelegate:", self);
    objc_msgSend(v19, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("slomo.trim.end"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityLabel:", v20);

    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    _createFormatDurationString(v23, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityValue:", v24);
    objc_msgSend(v7, "addObject:", v19);
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("EndHandle"));

  }
  v6 = v7;

LABEL_11:
  return v6;
}

- (double)_accessibilitySliderDeltaForFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_minValue"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_maxValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trackImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = (v9 - v6) * (4.0 / v11);

  return v12;
}

- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v4 = a4;
  v35 = a3;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("StartHandle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v35)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "slalomRegionEditorDidBeginEditing:withStartHandle:", self, 1);
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startHandleView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v24, v26, v28, v30);
    if (v4)
      v34 = v34 * 5.0;
    -[PLSlalomRegionEditorAccessibility setStartValue:notify:](self, "setStartValue:notify:", 1, v33 + v34);
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("EndHandle"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v35)
      goto LABEL_16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "slalomRegionEditorDidBeginEditing:withStartHandle:", self, 0);
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endHandleView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v12, v14, v16, v18);
    if (v4)
      v22 = v22 * 5.0;
    -[PLSlalomRegionEditorAccessibility setEndValue:notify:](self, "setEndValue:notify:", 1, v21 + v22);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "slalomRegionEditorDidEndEditing:", self);

LABEL_16:
}

- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v4 = a4;
  v35 = a3;
  -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSlalomRegionEditorAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("StartHandle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v35)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "slalomRegionEditorDidBeginEditing:withStartHandle:", self, 1);
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startHandleView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v24, v26, v28, v30);
    if (v4)
      v34 = v34 * 5.0;
    -[PLSlalomRegionEditorAccessibility setStartValue:notify:](self, "setStartValue:notify:", 1, v33 - v34);
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("EndHandle"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v35)
      goto LABEL_16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "slalomRegionEditorDidBeginEditing:withStartHandle:", self, 0);
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endHandleView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PLSlalomRegionEditorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    -[PLSlalomRegionEditorAccessibility _accessibilitySliderDeltaForFrame:](self, "_accessibilitySliderDeltaForFrame:", v12, v14, v16, v18);
    if (v4)
      v22 = v22 * 5.0;
    -[PLSlalomRegionEditorAccessibility setEndValue:notify:](self, "setEndValue:notify:", 1, v21 - v22);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "slalomRegionEditorDidEndEditing:", self);

LABEL_16:
}

@end
