@implementation UIMovieScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIMovieScrubber");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIMovieScrubber"), CFSTR("_trimAnimationDidStop:glassView:"), "v", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  id v4;
  char v5;
  objc_super v6;
  char v7;
  BOOL v8;
  BOOL v9;
  SEL v10;
  UIMovieScrubberAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v4 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isEditing"));
  v5 = objc_msgSend(v4, "BOOLValue");

  v7 = v5 & 1;
  v6.receiver = v11;
  v6.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility setEditing:animated:](&v6, sel_setEditing_animated_, v9, v8);
  if ((v7 & 1) != v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setThumbIsVisible:(BOOL)a3
{
  char v3;
  id location;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  UIMovieScrubberAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility setThumbIsVisible:](&v6, sel_setThumbIsVisible_, a3);
  v5 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v9, "_accessibilityValueForKey:", CFSTR("userInfo"));
  location = (id)objc_msgSend(v5, "objectForKey:", CFSTR("Scrubber"));
  if (location)
  {
    v3 = objc_msgSend(location, "isAccessibilityElement");
    if ((v3 & 1) != v7)
    {
      objc_msgSend(location, "setIsAccessibilityElement:", v7);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
  }
  else
  {
    -[UIMovieScrubberAccessibility _accessibilityRemoveValueForKey:](v9, "_accessibilityRemoveValueForKey:", CFSTR("userInfo"));
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v5, 0);
}

- (void)setTrimStartValue:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  double v12;
  id v13;
  double v14;
  id v15;
  id v16;
  id v17;
  double v18;
  objc_super v19;
  double v20;
  double v21;
  SEL v22;
  UIMovieScrubberAccessibility *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v11 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  objc_msgSend(v11, "doubleValue");
  v12 = v3;

  v20 = v12;
  v19.receiver = v23;
  v19.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility setTrimStartValue:](&v19, sel_setTrimStartValue_, v21);
  v13 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_trimStartValue"));
  objc_msgSend(v13, "doubleValue");
  v14 = v4;

  v18 = v14;
  if (v14 != v20)
  {
    v17 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v23, "_accessibilityValueForKey:", CFSTR("userInfo"), v14);
    v16 = (id)objc_msgSend(v17, "objectForKey:", CFSTR("LeftHandle"));
    v9 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("isEditing"));
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
    {
      v8 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_minimumValue"));
      objc_msgSend(v8, "doubleValue");
      v18 = v5;

    }
    v7 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_maximumValue"));
    objc_msgSend(v7, "doubleValue");
    v15 = _createFormatDurationString(v18, v6);

    objc_msgSend(v16, "setAccessibilityValue:", v15);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], v16);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
}

- (void)setTrimEndValue:(double)a3
{
  double v3;
  double v4;
  double v5;
  id v6;
  double v7;
  id v8;
  char v9;
  id v10;
  double v11;
  id v12;
  double v13;
  id v14;
  double v15;
  id v16;
  id v17;
  double v18;
  objc_super v19;
  double v20;
  double v21;
  SEL v22;
  UIMovieScrubberAccessibility *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v10 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  objc_msgSend(v10, "doubleValue");
  v11 = v3;

  v20 = v11;
  v19.receiver = v23;
  v19.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility setTrimEndValue:](&v19, sel_setTrimEndValue_, v21);
  v12 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_trimEndValue"));
  objc_msgSend(v12, "doubleValue");
  v13 = v4;

  v18 = v13;
  if (v13 != v20)
  {
    v17 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v23, "_accessibilityValueForKey:", CFSTR("userInfo"), v13);
    v16 = (id)objc_msgSend(v17, "objectForKey:", CFSTR("RightHandle"));
    v6 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("_maximumValue"));
    objc_msgSend(v6, "doubleValue");
    v7 = v5;

    v15 = v7;
    v8 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("isEditing"));
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) == 0)
      v18 = v15;
    v14 = _createFormatDurationString(v18, v15);
    objc_msgSend(v16, "setAccessibilityValue:", v14);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], v16);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
}

- (void)_setValue:(double)a3 andSendAction:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  double v10;
  id v11;
  double v12;
  id v13;
  id v14;
  id v15;
  double v16;
  objc_super v17;
  double v18;
  BOOL v19;
  double v20;
  SEL v21;
  UIMovieScrubberAccessibility *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v9 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  objc_msgSend(v9, "doubleValue");
  v10 = v4;

  v18 = v10;
  v17.receiver = v22;
  v17.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility _setValue:andSendAction:](&v17, sel__setValue_andSendAction_, v19, v20);
  v11 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("value"));
  objc_msgSend(v11, "doubleValue");
  v12 = v5;

  v16 = v12;
  if (v12 != v18)
  {
    v15 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v22, "_accessibilityValueForKey:", CFSTR("userInfo"), v12);
    v14 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("Scrubber"));
    v7 = v16;
    v8 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_maximumValue"));
    objc_msgSend(v8, "doubleValue");
    v13 = _createFormatDurationString(v7, v6);

    objc_msgSend(v14, "setAccessibilityValue:", v13);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
}

- (void)_initSubviews
{
  id v2;
  id v3;
  BOOL v4;
  objc_super v5;
  id location[2];
  UIMovieScrubberAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIMovieScrubberAccessibility safeValueForKey:](self, "safeValueForKey:");
  v5.receiver = v7;
  v5.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility _initSubviews](&v5, sel__initSubviews);
  v3 = location[0];
  v2 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_editingView"));
  v4 = v3 == v2;

  if (!v4)
  {
    -[UIMovieScrubberAccessibility _accessibilityRemoveValueForKey:](v7, "_accessibilityRemoveValueForKey:", CFSTR("userInfo"));
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4
{
  id v4;
  id v5;
  BOOL v6;
  objc_super v7;
  id v8;
  id location;
  BOOL v10;
  SEL v11;
  UIMovieScrubberAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v8 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v12, "safeValueForKey:");
  v7.receiver = v12;
  v7.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility _trimAnimationDidStop:glassView:](&v7, sel__trimAnimationDidStop_glassView_, v10, location);
  v5 = v8;
  v4 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("_editingView"));
  v6 = v5 == v4;

  if (!v6)
  {
    -[UIMovieScrubberAccessibility _accessibilityRemoveValueForKey:](v12, "_accessibilityRemoveValueForKey:", CFSTR("userInfo"));
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (void)_updateThumbLocation
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect rect2;
  objc_super v11;
  CGRect rect1;
  id location;
  id v14[2];
  UIMovieScrubberAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
  location = (id)objc_msgSend(v14[0], "objectForKey:", CFSTR("Scrubber"));
  objc_msgSend(location, "accessibilityFrame");
  rect1.origin.x = v2;
  rect1.origin.y = v3;
  rect1.size.width = v4;
  rect1.size.height = v5;
  v11.receiver = v15;
  v11.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility _updateThumbLocation](&v11, sel__updateThumbLocation);
  objc_msgSend(location, "accessibilityFrame");
  rect2.origin.x = v6;
  rect2.origin.y = v7;
  rect2.size.width = v8;
  rect2.size.height = v9;
  if (!CGRectEqualToRect(rect1, rect2))
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], location);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  id v3;
  id argument;
  objc_super v5;
  BOOL v6;
  SEL v7;
  UIMovieScrubberAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility _sliderAnimationDidStop:](&v5, sel__sliderAnimationDidStop_, a3);
  v3 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v8, "_accessibilityValueForKey:", CFSTR("userInfo"));
  argument = (id)objc_msgSend(v3, "objectForKey:", CFSTR("Scrubber"));

  if (argument)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], argument);
  objc_storeStrong(&argument, 0);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v11;
  UIAccessibilityNotifications v12;
  id v13;
  id v14;
  double v15;
  BOOL v16;
  UIAccessibilityNotifications v17;
  id v18;
  id v19;
  double v20;
  BOOL v21;
  UIAccessibilityNotifications notification;
  id v23;
  id v25;
  double v26;
  id v27;
  double v28;
  id v29;
  double v30;
  id v31;
  double v32;
  BOOL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  char v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id location[2];
  UIMovieScrubberAccessibility *v47;

  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v25 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:");
  objc_msgSend(v25, "doubleValue");
  v26 = v4;

  v44 = v26;
  v27 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("_trimEndValue"));
  objc_msgSend(v27, "doubleValue");
  v28 = v5;

  v43 = v28;
  v29 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("value"));
  objc_msgSend(v29, "doubleValue");
  v30 = v6;

  v42 = v30;
  v41 = 0;
  v40.receiver = v47;
  v40.super_class = (Class)UIMovieScrubberAccessibility;
  v41 = -[UIMovieScrubberAccessibility continueTrackingWithTouch:withEvent:](&v40, sel_continueTrackingWithTouch_withEvent_, location[0], v45);
  v32 = v44;
  v31 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("_trimStartValue"));
  objc_msgSend(v31, "doubleValue");
  v33 = v32 == v7;

  if (!v33)
  {
    v39 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v47, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v38 = (id)objc_msgSend(v39, "objectForKey:", CFSTR("LeftHandle"));
    notification = *MEMORY[0x24BDF71E8];
    v23 = (id)objc_msgSend(v38, "accessibilityValue");
    UIAccessibilityPostNotification(notification, v23);

    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  v20 = v43;
  v19 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("_trimEndValue"));
  objc_msgSend(v19, "doubleValue");
  v21 = v20 == v8;

  if (!v21)
  {
    v37 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v47, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v36 = (id)objc_msgSend(v37, "objectForKey:", CFSTR("RightHandle"));
    v17 = *MEMORY[0x24BDF71E8];
    v18 = (id)objc_msgSend(v36, "accessibilityValue");
    UIAccessibilityPostNotification(v17, v18);

    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  v15 = v42;
  v14 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v47, "safeValueForKey:", CFSTR("value"));
  objc_msgSend(v14, "doubleValue");
  v16 = v15 == v9;

  if (!v16)
  {
    v35 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v47, "_accessibilityValueForKey:", CFSTR("userInfo"));
    v34 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("Scrubber"));
    v12 = *MEMORY[0x24BDF71E8];
    v13 = (id)objc_msgSend(v34, "accessibilityValue");
    UIAccessibilityPostNotification(v12, v13);

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  v11 = v41;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8
{
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v37;
  CGRect v38;
  CGRect rect2;
  objc_super v40;
  CGRect rect1;
  id v42;
  CGRect v43;
  id v44;
  CGRect v45;
  id v46;
  id v47[6];
  id location[2];
  UIMovieScrubberAccessibility *v49;

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47[5] = *(id *)&a4;
  v47[4] = *(id *)&a5;
  v47[3] = *(id *)&a6;
  v47[2] = *(id *)&a7;
  v47[1] = *(id *)&a8;
  v47[0] = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v49, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v46 = (id)objc_msgSend(v47[0], "objectForKey:", CFSTR("Scrubber"));
  objc_msgSend(v46, "accessibilityFrame");
  v45.origin.x = v8;
  v45.origin.y = v9;
  v45.size.width = v10;
  v45.size.height = v11;
  v44 = (id)objc_msgSend(v47[0], "objectForKey:", CFSTR("RightHandle"));
  objc_msgSend(v44, "accessibilityFrame");
  v43.origin.x = v12;
  v43.origin.y = v13;
  v43.size.width = v14;
  v43.size.height = v15;
  v42 = (id)objc_msgSend(v47[0], "objectForKey:", CFSTR("LeftHandle"));
  objc_msgSend(v42, "accessibilityFrame");
  rect1.origin.x = v16;
  rect1.origin.y = v17;
  rect1.size.width = v18;
  rect1.size.height = v19;
  v40.receiver = v49;
  v40.super_class = (Class)UIMovieScrubberAccessibility;
  -[UIMovieScrubberAccessibility movieScrubberTrackView:clampedSizeWidthDelta:actualSizeWidthDelta:originXDelta:minimumVisibleValue:maximumVisibleValue:](&v40, sel_movieScrubberTrackView_clampedSizeWidthDelta_actualSizeWidthDelta_originXDelta_minimumVisibleValue_maximumVisibleValue_, location[0], a4, a5, a6, a7, a8);
  objc_msgSend(v46, "accessibilityFrame");
  rect2.origin.x = v20;
  rect2.origin.y = v21;
  rect2.size.width = v22;
  rect2.size.height = v23;
  if (!CGRectEqualToRect(v45, rect2))
    goto LABEL_4;
  objc_msgSend(v44, "accessibilityFrame");
  v38.origin.x = v24;
  v38.origin.y = v25;
  v38.size.width = v26;
  v38.size.height = v27;
  if (!CGRectEqualToRect(v43, v38)
    || (objc_msgSend(v42, "accessibilityFrame"),
        v37.origin.x = v28,
        v37.origin.y = v29,
        v37.size.width = v30,
        v37.size.height = v31,
        !CGRectEqualToRect(rect1, v37)))
  {
LABEL_4:
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], v46);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityClearChildren
{
  id location;
  id v2;

  v2 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v2, "_accessibilityValueForKey:", CFSTR("userInfo"));
    if (location)
      objc_msgSend(location, "removeObjectForKey:", CFSTR("Children"));
    objc_storeStrong(&location, 0);
  }
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

- (id)accessibilityElements
{
  id v2;
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v13;
  id v14;
  id *v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  double v28;
  id v29;
  char v30;
  id v31;
  double v32;
  id *v33;
  id v34;
  id v35[2];
  id *v36;
  id v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  double v43;
  id *v44;
  id v45;
  double v46;
  char v47;
  char v48;
  id v49;
  int v50;
  id v51;
  id v52[2];
  UIMovieScrubberAccessibility *v53;
  id v54;

  v53 = self;
  v52[1] = (id)a2;
  v52[0] = 0;
  v51 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("userInfo"));
  if (v51)
  {
    v4 = (id)objc_msgSend(v51, "objectForKey:", CFSTR("Children"));
    v5 = v52[0];
    v52[0] = v4;

    if (v52[0])
    {
      v54 = v52[0];
      v50 = 1;
      goto LABEL_27;
    }
    v52[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");

    objc_msgSend(v51, "setObject:forKey:", v52[0], CFSTR("Children"));
  }
  else
  {
    v51 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");

    v2 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = v52[0];
    v52[0] = v2;

    objc_msgSend(v51, "setObject:forKey:", v52[0], CFSTR("Children"));
    -[UIMovieScrubberAccessibility _accessibilitySetRetainedValue:forKey:](v53, "_accessibilitySetRetainedValue:forKey:", v51, CFSTR("userInfo"));
  }
  v49 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_editingView"));
  v23 = (id)objc_msgSend(v49, "safeValueForKey:", CFSTR("isEnabled"));
  v24 = objc_msgSend(v23, "BOOLValue");

  v48 = v24 & 1;
  v25 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("isEditing"));
  v26 = objc_msgSend(v25, "BOOLValue");

  v47 = v26 & 1;
  v27 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_maximumValue"));
  objc_msgSend(v27, "doubleValue");
  v28 = v6;

  v46 = v28;
  v45 = (id)objc_msgSend(v49, "safeValueForKey:", CFSTR("_leftImageView"));
  if (v45 && (v48 & 1) != 0)
  {
    v44 = (id *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityElementMockSlider), "initWithAccessibilityContainer:", v53);
    -[UIAccessibilityElementMockSlider setView:](v44, v45);
    -[UIAccessibilityElementMockSlider setDelegate:](v44, v53);
    objc_msgSend(v44, "setIsAccessibilityElement:", 1);
    v22 = accessibilityLocalizedString(CFSTR("trim.beginning.slider"));
    objc_msgSend(v44, "setAccessibilityLabel:");

    v43 = 0.0;
    v41 = 0;
    v39 = 0;
    if ((v47 & 1) != 0)
    {
      v42 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_trimStartValue"));
      v41 = 1;
      objc_msgSend(v42, "doubleValue");
    }
    else
    {
      v40 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_minimumValue"));
      v39 = 1;
      objc_msgSend(v40, "doubleValue");
    }
    v21 = v7;
    if ((v39 & 1) != 0)

    if ((v41 & 1) != 0)
    v43 = v21;
    v38 = _createFormatDurationString(v21, v46);
    objc_msgSend(v44, "setAccessibilityValue:", v38);
    objc_msgSend(v52[0], "addObject:", v44);
    objc_msgSend(v51, "setObject:forKey:", v44, CFSTR("LeftHandle"));
    objc_storeStrong(&v38, 0);
    objc_storeStrong((id *)&v44, 0);
  }
  v37 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_thumbView"));
  if (v37)
  {
    v8 = objc_allocWithZone((Class)UIAccessibilityElementMockSlider);
    v36 = (id *)objc_msgSend(v8, "initWithAccessibilityContainer:", v53);
    -[UIAccessibilityElementMockSlider setView:](v36, v37);
    -[UIAccessibilityElementMockSlider setDelegate:](v36, v53);
    v15 = v36;
    v16 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("thumbIsVisible"));
    objc_msgSend(v15, "setIsAccessibilityElement:", objc_msgSend(v16, "BOOLValue") & 1);

    v17 = v36;
    v18 = accessibilityLocalizedString(CFSTR("current.position.slider"));
    objc_msgSend(v17, "setAccessibilityLabel:");

    v19 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("value"));
    objc_msgSend(v19, "doubleValue");
    v20 = v9;

    v35[1] = v20;
    v35[0] = _createFormatDurationString(*(double *)&v20, v46);
    objc_msgSend(v36, "setAccessibilityValue:", v35[0]);
    objc_msgSend(v52[0], "addObject:", v36);
    objc_msgSend(v51, "setObject:forKey:", v36, CFSTR("Scrubber"));
    objc_storeStrong(v35, 0);
    objc_storeStrong((id *)&v36, 0);
  }
  v34 = (id)objc_msgSend(v49, "safeValueForKey:", CFSTR("_rightImageView"));
  if (v34 && (v48 & 1) != 0)
  {
    v10 = objc_allocWithZone((Class)UIAccessibilityElementMockSlider);
    v33 = (id *)objc_msgSend(v10, "initWithAccessibilityContainer:", v53);
    -[UIAccessibilityElementMockSlider setView:](v33, v34);
    -[UIAccessibilityElementMockSlider setDelegate:](v33, v53);
    objc_msgSend(v33, "setIsAccessibilityElement:", 1);
    v14 = accessibilityLocalizedString(CFSTR("trim.end.slider"));
    objc_msgSend(v33, "setAccessibilityLabel:");

    v32 = 0.0;
    v30 = 0;
    if ((v47 & 1) != 0)
    {
      v31 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v53, "safeValueForKey:", CFSTR("_trimEndValue"));
      v30 = 1;
      objc_msgSend(v31, "doubleValue");
      v13 = v11;
    }
    else
    {
      v13 = v46;
    }
    if ((v30 & 1) != 0)

    v32 = v13;
    v29 = _createFormatDurationString(v13, v46);
    objc_msgSend(v33, "setAccessibilityValue:", v29);
    objc_msgSend(v52[0], "addObject:", v33);
    objc_msgSend(v51, "setObject:forKey:", v33, CFSTR("RightHandle"));
    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v33, 0);
  }
  v54 = v52[0];
  v50 = 1;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v49, 0);
LABEL_27:
  objc_storeStrong(&v51, 0);
  objc_storeStrong(v52, 0);
  return v54;
}

- (double)_accessibilitySliderDeltaForFrame:(double)a3
{
  double v5;
  double v6;
  double v7;
  id v9;
  double v10;
  id v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v16 = a1;
  if (!a1)
    return 0.0;
  v9 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_minimumValue"));
  objc_msgSend(v9, "doubleValue");
  v10 = v5;

  v15 = v10;
  v11 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_maximumValue"));
  objc_msgSend(v11, "doubleValue");
  v12 = v6;

  v14 = v12;
  v13 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_trackView"));
  objc_msgSend(v13, "frame");
  v21 = (v14 - v15) * (v19 * 0.200000003 / v7);
  objc_storeStrong(&v13, 0);
  return v21;
}

- (void)_accessibilityIncrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  id v26;
  BOOL v27;
  id v28;
  double v29;
  id v30;
  id v31;
  double v32;
  id v33;
  BOOL v34;
  id v35;
  double v36;
  id v37;
  id v38;
  double v39;
  id v41;
  BOOL v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  id v63;
  BOOL v64;
  id location[2];
  UIMovieScrubberAccessibility *v66;

  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = a4;
  v63 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v66, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v41 = location[0];
  v4 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("LeftHandle"));
  v42 = v41 != v4;

  if (v42)
  {
    v33 = location[0];
    v11 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("RightHandle"));
    v34 = v33 != v11;

    if (v34)
    {
      v26 = location[0];
      v18 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("Scrubber"));
      v27 = v26 != v18;

      if (!v27)
      {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 0);
        v44 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_thumbView"));
        objc_msgSend(v44, "frame");
        v43 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v19, v20, v21, v22);
        if (v64)
          v43 = v43 * *(float *)&LargeStepMultiplier;
        v24 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("value"));
        objc_msgSend(v24, "doubleValue");
        v25 = v23 + v43;

        -[UIMovieScrubberAccessibility _setValue:andSendAction:](v66, "_setValue:andSendAction:", 1, v25);
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 0);
        objc_storeStrong(&v44, 0);
      }
    }
    else
    {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
      -[UIMovieScrubberAccessibility setEditing:animated:](v66, "setEditing:animated:", 1, 0);
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 2u);
      v30 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_editingView"));
      v53 = (id)objc_msgSend(v30, "safeValueForKey:", CFSTR("_rightImageView"));

      objc_msgSend(v53, "frame");
      v49 = v12;
      v50 = v13;
      v51 = v14;
      v52 = v15;
      v31 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimEndValue"));
      objc_msgSend(v31, "doubleValue");
      v32 = v16;

      v48 = v32;
      v47 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v49, v50, v51, v52);
      if (v64)
        v47 = v47 * *(float *)&LargeStepMultiplier;
      v46 = v48 + v47;
      -[UIMovieScrubberAccessibility setTrimEndValue:](v66, "setTrimEndValue:", v48 + v47);
      v28 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimEndValue"));
      objc_msgSend(v28, "doubleValue");
      v29 = v17;

      v45 = v29;
      if (v48 != v29)
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingEndValueDidChange:](v66, v45);
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 2u);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
    -[UIMovieScrubberAccessibility setEditing:animated:](v66, "setEditing:animated:", 1, 0);
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 1u);
    v37 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_editingView"));
    v62 = (id)objc_msgSend(v37, "safeValueForKey:", CFSTR("_leftImageView"));

    objc_msgSend(v62, "frame");
    v58 = v5;
    v59 = v6;
    v60 = v7;
    v61 = v8;
    v38 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimStartValue"));
    objc_msgSend(v38, "doubleValue");
    v39 = v9;

    v57 = v39;
    v56 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v58, v59, v60, v61);
    if (v64)
      v56 = v56 * *(float *)&LargeStepMultiplier;
    v55 = v57 + v56;
    -[UIMovieScrubberAccessibility setTrimStartValue:](v66, "setTrimStartValue:", v57 + v56);
    v35 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimStartValue"));
    objc_msgSend(v35, "doubleValue");
    v36 = v10;

    v54 = v36;
    if (v57 != v36)
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingStartValueDidChange:](v66, v54);
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 1u);
    objc_storeStrong(&v62, 0);
  }
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityNotifyDelegateWillBeginEditing
{
  id location;
  id v2;

  v2 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("_delegate"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(location, "movieScrubberWillBeginEditing:", v2);
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:(void *)a1
{
  id location;
  unsigned int v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (a1)
  {
    location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_delegate"));
    if (location)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(location, "movieScrubberDidBeginScrubbing:withHandle:", v4, v3);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateEditingStartValueDidChange:(void *)a1
{
  id location;
  double v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (a1)
  {
    location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_delegate"));
    if (location)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(location, "movieScrubber:editingStartValueDidChange:", v4, v3);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:(void *)a1
{
  id location;
  unsigned int v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (a1)
  {
    location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_delegate"));
    if (location)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(location, "movieScrubberDidEndScrubbing:withHandle:", v4, v3);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityNotifyDelegateEditingEndValueDidChange:(void *)a1
{
  id location;
  double v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if (a1)
  {
    location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_delegate"));
    if (location)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(location, "movieScrubber:editingEndValueDidChange:", v4, v3);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)_accessibilityDecrementMockSlider:(id)a3 largeStep:(BOOL)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  id v26;
  BOOL v27;
  id v28;
  double v29;
  id v30;
  id v31;
  double v32;
  id v33;
  BOOL v34;
  id v35;
  double v36;
  id v37;
  id v38;
  double v39;
  id v41;
  BOOL v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  id v63;
  BOOL v64;
  id location[2];
  UIMovieScrubberAccessibility *v66;

  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = a4;
  v63 = (id)-[UIMovieScrubberAccessibility _accessibilityValueForKey:](v66, "_accessibilityValueForKey:", CFSTR("userInfo"));
  v41 = location[0];
  v4 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("LeftHandle"));
  v42 = v41 != v4;

  if (v42)
  {
    v33 = location[0];
    v11 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("RightHandle"));
    v34 = v33 != v11;

    if (v34)
    {
      v26 = location[0];
      v18 = (id)objc_msgSend(v63, "objectForKey:", CFSTR("Scrubber"));
      v27 = v26 != v18;

      if (!v27)
      {
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 0);
        v44 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_thumbView"));
        objc_msgSend(v44, "frame");
        v43 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v19, v20, v21, v22);
        if (v64)
          v43 = v43 * *(float *)&LargeStepMultiplier;
        v24 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("value"));
        objc_msgSend(v24, "doubleValue");
        v25 = v23 - v43;

        -[UIMovieScrubberAccessibility _setValue:andSendAction:](v66, "_setValue:andSendAction:", 1, v25);
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 0);
        objc_storeStrong(&v44, 0);
      }
    }
    else
    {
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
      -[UIMovieScrubberAccessibility setEditing:animated:](v66, "setEditing:animated:", 1, 0);
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 2u);
      v30 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_editingView"));
      v53 = (id)objc_msgSend(v30, "safeValueForKey:", CFSTR("_rightImageView"));

      objc_msgSend(v53, "frame");
      v49 = v12;
      v50 = v13;
      v51 = v14;
      v52 = v15;
      v31 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimEndValue"));
      objc_msgSend(v31, "doubleValue");
      v32 = v16;

      v48 = v32;
      v47 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v49, v50, v51, v52);
      if (v64)
        v47 = v47 * *(float *)&LargeStepMultiplier;
      v46 = v48 - v47;
      -[UIMovieScrubberAccessibility setTrimEndValue:](v66, "setTrimEndValue:", v48 - v47);
      v28 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimEndValue"));
      objc_msgSend(v28, "doubleValue");
      v29 = v17;

      v45 = v29;
      if (v48 != v29)
        -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingEndValueDidChange:](v66, v45);
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 2u);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateWillBeginEditing](v66);
    -[UIMovieScrubberAccessibility setEditing:animated:](v66, "setEditing:animated:", 1, 0);
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidBeginScrubbingWithHandle:](v66, 1u);
    v37 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_editingView"));
    v62 = (id)objc_msgSend(v37, "safeValueForKey:", CFSTR("_leftImageView"));

    objc_msgSend(v62, "frame");
    v58 = v5;
    v59 = v6;
    v60 = v7;
    v61 = v8;
    v38 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimStartValue"));
    objc_msgSend(v38, "doubleValue");
    v39 = v9;

    v57 = v39;
    v56 = -[UIMovieScrubberAccessibility _accessibilitySliderDeltaForFrame:](v66, v58, v59, v60, v61);
    if (v64)
      v56 = v56 * *(float *)&LargeStepMultiplier;
    v55 = v57 - v56;
    -[UIMovieScrubberAccessibility setTrimStartValue:](v66, "setTrimStartValue:", v57 - v56);
    v35 = (id)-[UIMovieScrubberAccessibility safeValueForKey:](v66, "safeValueForKey:", CFSTR("_trimStartValue"));
    objc_msgSend(v35, "doubleValue");
    v36 = v10;

    v54 = v36;
    if (v57 != v36)
      -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateEditingStartValueDidChange:](v66, v54);
    -[UIMovieScrubberAccessibility _accessibilityNotifyDelegateScrubberDidEndScrubbingWithHandle:](v66, 1u);
    objc_storeStrong(&v62, 0);
  }
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
}

@end
