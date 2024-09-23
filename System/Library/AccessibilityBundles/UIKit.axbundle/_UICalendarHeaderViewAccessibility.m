@implementation _UICalendarHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICalendarHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIDatePickerLinkedLabel"), CFSTR("_renderingLabel"), "UILabel");
  v5 = CFSTR("_UICalendarHeaderView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UICalendarHeaderTitleButton"), CFSTR("_monthYearLabel"), "_UIDatePickerLinkedLabel");
  v3 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UICalendarHeaderView"), CFSTR("_nextMonthButton"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UICalendarHeaderView"), CFSTR("_previousMonthButton"), "UIButton");
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UICalendarHeaderView"), CFSTR("isExpanded"), 0);
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("setExpanded:animated:"), v4, v4, 0);
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("delegate"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_setupViewHierarchy"), v8, 0);
  v7 = CFSTR("UICalendarView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("headerViewDidStepBackward:"), v8, v6, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  id v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  SEL v10;
  _UICalendarHeaderViewAccessibility *v11;
  char v12;

  v11 = self;
  v10 = a2;
  v8 = 0;
  v3 = 0;
  if (AXRequestingClient() == 4)
  {
    v9 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v8 = 1;
    v3 = objc_msgSend(v9, "switchControlTapBehavior") == 2;
  }
  if ((v8 & 1) != 0)

  if (v3)
  {
    v12 = 0;
  }
  else
  {
    v6 = 0;
    objc_opt_class();
    v5 = (id)__UIAccessibilityCastAsClass();
    v4 = v5;
    objc_storeStrong(&v5, 0);
    v7 = v4;
    if ((objc_msgSend(v4, "_accessibilityViewIsVisible") & 1) != 0)
      v12 = (-[_UICalendarHeaderViewAccessibility safeBoolForKey:](v11, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1) & 1;
    else
      v12 = 0;
    objc_storeStrong(&v7, 0);
  }
  return v12 & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("calendar.month"));
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v5 = (id)-[_UICalendarHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_monthYearButton"));
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_monthYearLabel"));
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_renderingLabel"));
  v8[0] = (id)objc_msgSend(v3, "accessibilityLabel");

  v7 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8[0]);
  objc_msgSend(v7, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB10]);
  v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("calendar.change.year.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  id v2;
  _UICalendarHeaderViewAccessibility *v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  _UICalendarHeaderViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v6 = 0;
  objc_opt_class();
  v2 = (id)-[_UICalendarHeaderViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_nextMonthButton"));
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
  {
    v3 = v8;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v3, 0);
  }
  objc_storeStrong(v7, 0);
}

- (void)accessibilityDecrement
{
  id v2;
  _UICalendarHeaderViewAccessibility *v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  _UICalendarHeaderViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v6 = 0;
  objc_opt_class();
  v2 = (id)-[_UICalendarHeaderViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_previousMonthButton"));
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
  {
    v3 = v8;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v3, 0);
  }
  objc_storeStrong(v7, 0);
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  double v8;
  double v9;
  CGPoint result;

  v7 = (id)-[_UICalendarHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_monthYearButton"));
  v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_monthYearLabel"));
  objc_msgSend(v6, "accessibilityActivationPoint");
  v8 = v2;
  v9 = v3;

  v4 = v8;
  v5 = v9;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)automationElements
{
  id v3;
  id v4;
  id v5;
  char v6;
  SEL v7;
  _UICalendarHeaderViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = (id)objc_msgSend(v4, "subviews");

  return v3;
}

- (BOOL)_accessibilityFKAShouldProcessChildren
{
  return !-[_UICalendarHeaderViewAccessibility isAccessibilityElement](self, "isAccessibilityElement", a2, self);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UICalendarHeaderViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UICalendarHeaderViewAccessibility;
  -[_UICalendarHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UICalendarHeaderViewAccessibility _axMarkupMonthSelector](v4);
}

- (void)_axMarkupMonthSelector
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  double (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  __CFString *(*v27)(uint64_t);
  void *v28;
  id v29;
  uint64_t v30;
  int v31;
  int v32;
  id (*v33)(uint64_t);
  void *v34;
  id v35;
  id v36;
  id v37;
  id location;
  id v39;

  v39 = a1;
  if (a1)
  {
    objc_initWeak(&location, v39);
    v37 = (id)objc_msgSend(v39, "safeUIViewForKey:", CFSTR("_monthYearButton"));
    v36 = (id)objc_msgSend(v37, "safeUIViewForKey:", CFSTR("_monthYearLabel"));
    objc_msgSend(v36, "setIsAccessibilityElement:", 0);
    objc_msgSend(v37, "setIsAccessibilityElement:", 1);
    v10 = v37;
    v30 = MEMORY[0x24BDAC760];
    v31 = -1073741824;
    v32 = 0;
    v33 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke;
    v34 = &unk_24FF3DC00;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v10, "_setAccessibilityLabelBlock:", &v30);
    v9 = v37;
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_2;
    v28 = &unk_24FF3DC00;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v9, "setAccessibilityIdentifierBlock:", &v24);
    objc_msgSend(v37, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    v8 = v37;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_3;
    v22 = &unk_24FF3DC00;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v8, "_setAccessibilityValueBlock:", &v18);
    objc_initWeak(&v17, v37);
    v7 = v37;
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __60___UICalendarHeaderViewAccessibility__axMarkupMonthSelector__block_invoke_4;
    v15 = &unk_24FF3E000;
    objc_copyWeak(&v16, &v17);
    objc_msgSend(v7, "_setAccessibilityActivationPointBlock:", &v11);
    v6 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("_nextMonthButton"));
    v5 = accessibilityLocalizedString(CFSTR("calendar.change.month.increment"));
    objc_msgSend(v6, "setAccessibilityLabel:");

    v4 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("_nextMonthButton"));
    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("DatePicker.NextMonth"));

    v3 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("_previousMonthButton"));
    v2 = accessibilityLocalizedString(CFSTR("calendar.change.month.decrement"));
    objc_msgSend(v3, "setAccessibilityLabel:");

    v1 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("_previousMonthButton"));
    objc_msgSend(v1, "setAccessibilityIdentifier:", CFSTR("DatePicker.PreviousMonth"));

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v35);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_destroyWeak(&location);
  }
}

- (void)_setupViewHierarchy
{
  objc_super v2;
  SEL v3;
  _UICalendarHeaderViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UICalendarHeaderViewAccessibility;
  -[_UICalendarHeaderViewAccessibility _setupViewHierarchy](&v2, sel__setupViewHierarchy);
  -[_UICalendarHeaderViewAccessibility _axMarkupMonthSelector](v4);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _UICalendarHeaderViewAccessibility *v4;
  BOOL v5;
  objc_super v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  _UICalendarHeaderViewAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6.receiver = self;
  v6.super_class = (Class)_UICalendarHeaderViewAccessibility;
  -[_UICalendarHeaderViewAccessibility setExpanded:animated:](&v6, sel_setExpanded_animated_, a3, a4);
  v4 = v10;
  v5 = v8;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v4, 0);
}

@end
