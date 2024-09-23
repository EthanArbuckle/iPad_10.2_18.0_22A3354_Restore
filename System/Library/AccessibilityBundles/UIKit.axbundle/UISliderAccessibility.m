@implementation UISliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UISlider");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = CFSTR("UIControl");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UISlider"));
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("_thumbView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_thumbViewNeue"), v4, 0);
  v5 = "Q";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_sendActionsForEvents:withEvent:"), "Q", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("sendActionsForControlEvents:"), v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)_accessibilityAutomationType
{
  return 33;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id obj;
  uint64_t v29;
  objc_super v30;
  __int128 v31;
  int v32;
  _QWORD v33[8];
  id v34;
  _QWORD __b[8];
  void *v36;
  id location;
  __int128 v38;
  id v39;
  __int128 v40;
  id v41;
  __int128 v42;
  SEL v43;
  UISliderAccessibility *v44;
  double v45[3];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGPoint result;

  v48 = *MEMORY[0x24BDAC8D0];
  v44 = self;
  v43 = a2;
  v42 = 0uLL;
  v42 = *MEMORY[0x24BDBEFB0];
  v41 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_thumbView"));
  if (v41)
  {
    objc_msgSend(v41, "accessibilityActivationPoint");
    *(_QWORD *)&v40 = v2;
    *((_QWORD *)&v40 + 1) = v3;
    v42 = v40;
LABEL_25:
    *(_OWORD *)v45 = v42;
    v32 = 1;
    goto LABEL_26;
  }
  v39 = (id)-[UISliderAccessibility safeValueForKey:](v44, "safeValueForKey:", CFSTR("_thumbViewNeue"));
  if (v39)
  {
    objc_msgSend(v39, "accessibilityActivationPoint");
    *(_QWORD *)&v38 = v4;
    *((_QWORD *)&v38 + 1) = v5;
    v42 = v38;
LABEL_23:
    v32 = 0;
    goto LABEL_24;
  }
  location = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = (id)-[UISliderAccessibility safeArrayForKey:](v44, "safeArrayForKey:", CFSTR("subviews"));
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
  if (v29)
  {
    v25 = *(_QWORD *)__b[2];
    v26 = 0;
    v27 = v29;
    while (1)
    {
      v24 = v26;
      if (*(_QWORD *)__b[2] != v25)
        objc_enumerationMutation(obj);
      v36 = *(void **)(__b[1] + 8 * v26);
      v21 = location;
      v20 = v36;
      v23 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
      v22 = (id)objc_msgSend(v20, "_accessibilityLeafDescendantsWithOptions:");
      objc_msgSend(v21, "addObjectsFromArray:");

      ++v26;
      if (v24 + 1 >= v27)
      {
        v26 = 0;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v47, 16);
        if (!v27)
          break;
      }
    }
  }

  memset(v33, 0, sizeof(v33));
  v18 = location;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v33, v46, 16);
  if (v19)
  {
    v15 = *(_QWORD *)v33[2];
    v16 = 0;
    v17 = v19;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)v33[2] != v15)
        objc_enumerationMutation(v18);
      v34 = *(id *)(v33[1] + 8 * v16);
      v12 = (id)objc_msgSend(v34, "accessibilityIdentifier");
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AXSliderKnob"));

      if ((v13 & 1) != 0)
        break;
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v33, v46, 16);
        if (!v17)
          goto LABEL_19;
      }
    }
    objc_msgSend(v34, "accessibilityActivationPoint");
    v45[0] = v6;
    v45[1] = v7;
    v32 = 1;
  }
  else
  {
LABEL_19:
    v32 = 0;
  }

  if (!v32)
  {
    v30.receiver = v44;
    v30.super_class = (Class)UISliderAccessibility;
    -[UISliderAccessibility accessibilityActivationPoint](&v30, sel_accessibilityActivationPoint);
    *(_QWORD *)&v31 = v8;
    *((_QWORD *)&v31 + 1) = v9;
    v42 = v31;
    v32 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v32)
    goto LABEL_23;
LABEL_24:
  objc_storeStrong(&v39, 0);
  if (!v32)
    goto LABEL_25;
LABEL_26:
  objc_storeStrong(&v41, 0);
  v10 = v45[1];
  v11 = v45[0];
  result.y = v10;
  result.x = v11;
  return result;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  char v4;
  id v5;
  BOOL v6;
  id v7;
  id v8;
  char v9;
  SEL v10;
  UISliderAccessibility *v11;
  BOOL v12;

  v11 = self;
  v10 = a2;
  v2 = (id)-[UISliderAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v6 = v2 == 0;

  if (v6)
  {
    v9 = 0;
    objc_opt_class();
    v8 = (id)__UIAccessibilityCastAsClass();
    v7 = v8;
    objc_storeStrong(&v8, 0);
    v4 = objc_msgSend(v7, "_accessibilityViewIsVisible");

    return (v4 & 1) != 0;
  }
  else
  {
    v5 = (id)-[UISliderAccessibility isAccessibilityUserDefinedElement](v11, "isAccessibilityUserDefinedElement");
    v12 = objc_msgSend(v5, "BOOLValue") & 1;

  }
  return v12;
}

- (id)_accessibilityAbsoluteValue
{
  float v2;
  float v3;
  float v4;
  double v5;
  id v7;
  float v8;
  id v9;
  float v10;
  id v11;
  float v12;

  v7 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimumValue"));
  objc_msgSend(v7, "floatValue");
  v8 = v2;

  v9 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maximumValue"));
  objc_msgSend(v9, "floatValue");
  v10 = v3;

  v11 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  objc_msgSend(v11, "floatValue");
  v12 = v4;

  *(float *)&v5 = (float)(v12 - v8) / (float)(v10 - v8);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
}

- (id)accessibilityValue
{
  float v2;
  float v3;
  float v4;
  id v6;
  float v7;
  id v8;
  float v9;
  id v10;
  float v11;
  id v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  id v18[2];
  UISliderAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = (id)-[UISliderAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (v18[0])
  {
    v20 = v18[0];
    v17 = 1;
  }
  else
  {
    v6 = (id)-[UISliderAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("minimumValue"));
    objc_msgSend(v6, "floatValue");
    v7 = v2;

    v16 = v7;
    v8 = (id)-[UISliderAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("maximumValue"));
    objc_msgSend(v8, "floatValue");
    v9 = v3;

    v15 = v9;
    v10 = (id)-[UISliderAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("value"));
    objc_msgSend(v10, "floatValue");
    v11 = v4;

    v14 = v11;
    v13 = (float)(v11 - v16) / (float)(v9 - v16);
    v12 = (id)AXFormatFloatWithPercentage();
    v20 = v12;
    v17 = 1;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v18, 0);
  return v20;
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;
  CGRect v10;

  -[UISliderAccessibility bounds](self, "bounds");
  -[UISliderAccessibility trackRectForBounds:](self, "trackRectForBounds:", v2, v3, v4, v5);
  CGRectGetMidY(v10);
  CGRectMake_1();
  UIAccessibilityFrameForBounds();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect rect;
  CGPoint result;
  CGRect v11;

  -[UISliderAccessibility bounds](self, "bounds");
  -[UISliderAccessibility trackRectForBounds:](self, "trackRectForBounds:", v2, v3, v4, v5);
  rect = v11;
  CGRectGetMaxX(v11);
  CGRectGetMidY(rect);
  CGRectMake_1();
  UIAccessibilityFrameForBounds();
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)_accessibilitySetValue:(id)a3
{
  id location[2];
  UISliderAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UISliderAccessibility setValue:forKey:](v4, "setValue:forKey:", location[0], CFSTR("value"));
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v3;
  uint64_t v4;
  id v6;
  BOOL v7;
  id v8;
  BOOL v9;
  objc_super v10;
  unint64_t v11;
  SEL v12;
  UISliderAccessibility *v13;
  unint64_t v14;

  v13 = self;
  v12 = a2;
  v2 = (id)-[UISliderAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v9 = v2 == 0;

  if (v9)
  {
    v11 = 0;
    v10.receiver = v13;
    v10.super_class = (Class)UISliderAccessibility;
    v11 = -[UISliderAccessibility accessibilityTraits](&v10, sel_accessibilityTraits) | *MEMORY[0x24BDF73A0];
    v3 = (id)-[UISliderAccessibility accessibilityUserDefinedTraits](v13, "accessibilityUserDefinedTraits");
    v7 = v3 == 0;

    if (!v7)
    {
      v6 = (id)-[UISliderAccessibility accessibilityUserDefinedTraits](v13, "accessibilityUserDefinedTraits");
      v4 = objc_msgSend(v6, "unsignedLongLongValue");
      v11 |= v4;

    }
    return v11;
  }
  else
  {
    v8 = (id)-[UISliderAccessibility accessibilityUserDefinedTraits](v13, "accessibilityUserDefinedTraits");
    v14 = objc_msgSend(v8, "unsignedLongLongValue");

  }
  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  char v6;
  objc_super v7;
  char v8;
  id v9;
  id location[2];
  UISliderAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UISliderAccessibility;
  v8 = -[UISliderAccessibility continueTrackingWithTouch:withEvent:](&v7, sel_continueTrackingWithTouch_withEvent_, location[0], v9);
  -[UISliderAccessibility _accessibilityAnnounceNewValue](v11, "_accessibilityAnnounceNewValue");
  v6 = v8;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  UISliderAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISliderAccessibility;
  -[UISliderAccessibility sendActionsForControlEvents:](&v3, sel_sendActionsForControlEvents_, a3);
  if (v4 == 4)
    -[UISliderAccessibility _accessibilityAnnounceNewValue](v6, "_accessibilityAnnounceNewValue");
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  UIAccessibilityNotifications notification;
  id v6;
  objc_super v7;
  id v8;
  id location[2];
  UISliderAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7.receiver = v10;
  v7.super_class = (Class)UISliderAccessibility;
  -[UISliderAccessibility endTrackingWithTouch:withEvent:](&v7, sel_endTrackingWithTouch_withEvent_, location[0], v8);
  notification = *MEMORY[0x24BDF71E8];
  v6 = (id)-[UISliderAccessibility _accessibilityAXAttributedValue](v10, "_accessibilityAXAttributedValue");
  UIAccessibilityPostNotification(notification, v6);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v11 = a3;
  -[UISliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("minimumValue"));
  v10 = v3;
  -[UISliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("maximumValue"));
  v9 = v4;
  -[UISliderAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("value"));
  v7 = (v9 - v10) / 10.0;
  if (v11)
    v8 = v5 + v7;
  else
    v8 = v5 - v7;
  if (v8 < v10 || AXCGFAbs_1(v8 - v10) < 0.001)
    return v10;
  if (v8 > v9 || AXCGFAbs_1(v8 - v9) < 0.001)
    return v9;
  return v8;
}

- (void)_accessibilityAnnounceNewValue
{
  id argument[3];

  argument[2] = self;
  argument[1] = (id)a2;
  argument[0] = (id)-[UISliderAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityAnnounceNewValue_LastOutput > 0.3
    && (objc_msgSend((id)_accessibilityAnnounceNewValue_LastValue, "isEqualToString:", argument[0]) & 1) == 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument[0]);
    objc_storeStrong((id *)&_accessibilityAnnounceNewValue_LastValue, argument[0]);
    _accessibilityAnnounceNewValue_LastOutput = CFAbsoluteTimeGetCurrent();
  }
  objc_storeStrong(argument, 0);
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9[2];
  BOOL v10;
  SEL v11;
  UISliderAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  -[UISliderAccessibility _accessibilityIncreaseAmount:](self, "_accessibilityIncreaseAmount:", a3);
  v9[1] = v3;
  *(float *)&v3 = *(double *)&v3;
  -[UISliderAccessibility setValue:animated:](v12, "setValue:animated:", 1, *(double *)&v3);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __49__UISliderAccessibility__accessibilityBumpValue___block_invoke;
  v8 = &unk_24FF3DA40;
  v9[0] = v12;
  AXPerformSafeBlock();
  objc_storeStrong(v9, 0);
}

uint64_t __49__UISliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendActionsForEvents:withEvent:", 4096, 0, a1, a1);
}

- (double)_accessibilityNumberValue
{
  float v2;
  id v4;
  double v5;

  v4 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  objc_msgSend(v4, "floatValue");
  v5 = v2;

  return v5;
}

- (double)_accessibilityMinValue
{
  float v2;
  id v4;
  double v5;

  v4 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimumValue"));
  objc_msgSend(v4, "floatValue");
  v5 = v2;

  return v5;
}

- (double)_accessibilityMaxValue
{
  float v2;
  id v4;
  double v5;

  v4 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maximumValue"));
  objc_msgSend(v4, "floatValue");
  v5 = v2;

  return v5;
}

- (void)accessibilityIncrement
{
  id v2;
  char v3;

  v2 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
    -[UISliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 1);
}

- (void)accessibilityDecrement
{
  id v2;
  char v3;

  v2 = (id)-[UISliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
    -[UISliderAccessibility _accessibilityBumpValue:](self, "_accessibilityBumpValue:", 0);
}

- (id)accessibilityPath
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  id v12;
  int v13;
  double v14;
  UIBezierPath *v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  SEL v20;
  UIView *v21;
  UIBezierPath *v22;

  v21 = (UIView *)self;
  v20 = a2;
  v19 = AXRequestingClient();
  if (v19 == 3 || v19 == 4)
  {
    v22 = 0;
  }
  else
  {
    if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0)
      goto LABEL_16;
    v12 = (id)-[UIView safeUIViewForKey:](v21, "safeUIViewForKey:", CFSTR("_thumbView"));
    v16 = 0;
    if (v12)
    {
      v2 = v12;
    }
    else
    {
      v17 = (id)-[UIView safeUIViewForKey:](v21, "safeUIViewForKey:", CFSTR("_thumbViewNeue"));
      v16 = 1;
      v2 = v17;
    }
    v18 = v2;
    if ((v16 & 1) != 0)

    if ((objc_msgSend(v18, "_accessibilityViewIsVisible") & 1) != 0)
    {
      v15 = (UIBezierPath *)(id)objc_msgSend(v18, "accessibilityPath");
      if (!v15)
      {
        objc_msgSend(v18, "bounds");
        objc_msgSend(v18, "convertRect:toView:", v21, v3, v4, v5, v6);
        CGRectMake_1();
        AX_CGRectGetCenter();
        UIRectCenteredAboutPoint();
        v14 = v7;
        v11 = (void *)MEMORY[0x24BDF6870];
        AX_CGRectGetCenter();
        v15 = (UIBezierPath *)(id)objc_msgSend(v11, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v9, v14 / 2.0 + 3.0, 0.0, 6.28318531);

      }
      v22 = UIAccessibilityConvertPathToScreenCoordinates(v15, v21);
      v13 = 1;
      objc_storeStrong((id *)&v15, 0);
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong(&v18, 0);
    if (!v13)
LABEL_16:
      v22 = 0;
  }
  return v22;
}

- (void)layoutSubviews
{
  void *v2;
  id v3;
  id v4;
  char v5;
  objc_super v6;
  SEL v7;
  UISliderAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UISliderAccessibility;
  -[UISliderAccessibility layoutSubviews](&v6, sel_layoutSubviews);
  if ((-[UISliderAccessibility _accessibilityIsFKARunningForFocusItem](v8, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x24BDF6A60];
    v5 = 0;
    objc_opt_class();
    v4 = (id)__UIAccessibilityCastAsClass();
    v3 = v4;
    objc_storeStrong(&v4, 0);
    objc_msgSend(v2, "updateRingForFocusItem:");

  }
}

- (id)_viewToAddFocusLayer
{
  id v2;
  id v3;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  char v10;
  char v11;
  id v12;
  id v13[2];
  UISliderAccessibility *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  v5 = (id)-[UISliderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_thumbView"));
  v11 = 0;
  if (v5)
  {
    v2 = v5;
  }
  else
  {
    v12 = (id)-[UISliderAccessibility safeUIViewForKey:](v14, "safeUIViewForKey:", CFSTR("_thumbViewNeue"));
    v11 = 1;
    v2 = v12;
  }
  v13[0] = v2;
  if ((v11 & 1) != 0)

  v6 = 0;
  if ((objc_msgSend(v13[0], "_accessibilityViewIsVisible") & 1) != 0)
  {
    v3 = v13[0];
  }
  else
  {
    v10 = 0;
    objc_opt_class();
    v9 = (id)__UIAccessibilityCastAsClass();
    v8 = v9;
    objc_storeStrong(&v9, 0);
    v7 = v8;
    v6 = 1;
    v3 = v8;
  }
  v15 = v3;
  if ((v6 & 1) != 0)

  objc_storeStrong(v13, 0);
  return v15;
}

@end
