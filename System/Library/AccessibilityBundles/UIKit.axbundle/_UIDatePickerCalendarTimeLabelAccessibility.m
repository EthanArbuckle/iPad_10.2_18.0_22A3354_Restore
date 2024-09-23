@implementation _UIDatePickerCalendarTimeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerCalendarTimeLabel");
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
  v3 = CFSTR("_UIDatePickerCalendarTimeView");
  objc_msgSend(location[0], "validateClass:");
  v6 = CFSTR("_UIDatePickerCalendarTimeLabel");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCalendarTimeView"), CFSTR("timeLabel"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("text"), v7, 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("pushCurrentStateIntoUIAndNotify"), 0);
  v8 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("initWithTimeFormat:minuteInterval:"), v7, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("setHourText:"), v4, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("setMinuteText:"), v4, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("hourText"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("minuteText"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("inputScope"), v8, 0);
  v5 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("hourRect"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("minuteRect"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("timeFormat"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("stateContext"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCalendarTimeLabelStateMachineContext"), CFSTR("currentState"), "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCalendarTimeFormat"), CFSTR("clock"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() != 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 49;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  _UIDatePickerCalendarTimeLabelAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v4 = 0;
    v4 = *MEMORY[0x24BEBB198];
    if (-[_UIDatePickerCalendarTimeLabelAccessibility _axSelfIsFirstResponder](v6, "_axSelfIsFirstResponder"))
      v4 |= *MEMORY[0x24BEBB128];
    return v4;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    return -[_UIDatePickerCalendarTimeLabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  }
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_axSelfIsFirstResponder
{
  char v3;
  id v4;
  id v5;
  char v6;
  SEL v7;
  _UIDatePickerCalendarTimeLabelAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = objc_msgSend(v4, "isFirstResponder");

  return v3 & 1;
}

- (BOOL)_axIsHoursEditing
{
  return -[_UIDatePickerCalendarTimeLabelAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("inputScope"), a2, self) == 2;
}

- (BOOL)_axIsMinutesEditing
{
  return -[_UIDatePickerCalendarTimeLabelAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("inputScope"), a2, self) == 3;
}

- (id)_accessibilityResponderElement
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(id *, void *);
  void *v10;
  id v11[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v4 = -[_UIDatePickerCalendarTimeLabelAccessibility accessibilityElements](self, "accessibilityElements");
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __77___UIDatePickerCalendarTimeLabelAccessibility__accessibilityResponderElement__block_invoke;
  v10 = &unk_24FF3DEE8;
  v11[0] = v12;
  v3 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:");
  v5 = (id)objc_msgSend(v3, "firstObject");

  objc_storeStrong(v11, 0);
  return v5;
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityElements"));
  if (!location[0])
  {
    location[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");

    -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySetRetainedValue:forKey:](v6, "_accessibilitySetRetainedValue:forKey:", location[0], CFSTR("accessibilityElements"));
    v3 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityHourElement](v6, "_accessibilityHourElement");
    objc_msgSend(location[0], "addObject:");

    v4 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityMinuteElement](v6, "_accessibilityMinuteElement");
    objc_msgSend(location[0], "addObject:");

  }
  v7 = location[0];
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityHourElement
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _UIDatePickerCalendarTimeLabelAccessibility *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t (*v26)(id *);
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  int v39;
  id (*v40)(uint64_t);
  void *v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48[3];
  uint64_t v49;
  int v50;
  int v51;
  void (*v52)(id *);
  void *v53;
  id v54[3];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  id v62;
  id location;
  id v64[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v65;

  v65 = self;
  v64[1] = (id)a2;
  v64[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
  v21 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v64[0], "setAccessibilityLabel:");

  objc_msgSend(v64[0], "setAccessibilityIdentifier:", CFSTR("Hours"));
  objc_initWeak(&location, v65);
  v22 = v64[0];
  v57 = MEMORY[0x24BDAC760];
  v58 = -1073741824;
  v59 = 0;
  v60 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke;
  v61 = &unk_24FF3DF10;
  objc_copyWeak(&v62, &location);
  objc_msgSend(v22, "_setAccessibilityTraitsBlock:", &v57);
  v56 = 1;
  v55 = 12;
  v19 = (id)-[_UIDatePickerCalendarTimeLabelAccessibility safeValueForKey:](v65, "safeValueForKey:", CFSTR("timeFormat"));
  v20 = objc_msgSend(v19, "safeIntegerForKey:", CFSTR("clock"));

  if (v20 <= 3)
    __asm { BR              X8 }
  v18 = v64[0];
  v49 = MEMORY[0x24BDAC760];
  v50 = -1073741824;
  v51 = 0;
  v52 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_2;
  v53 = &unk_24FF3DF60;
  objc_copyWeak(v54, &location);
  v54[1] = (id)v56;
  v54[2] = (id)v55;
  objc_msgSend(v18, "_setAccessibilityIncrementBlock:", &v49);
  v17 = v64[0];
  v43 = MEMORY[0x24BDAC760];
  v44 = -1073741824;
  v45 = 0;
  v46 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_4;
  v47 = &unk_24FF3DF60;
  objc_copyWeak(v48, &location);
  v48[1] = (id)v56;
  v48[2] = (id)v55;
  objc_msgSend(v17, "_setAccessibilityDecrementBlock:", &v43);
  v16 = v64[0];
  v37 = MEMORY[0x24BDAC760];
  v38 = -1073741824;
  v39 = 0;
  v40 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_6;
  v41 = &unk_24FF3DC00;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v16, "_setAccessibilityValueBlock:", &v37);
  v15 = v65;
  -[_UIDatePickerCalendarTimeLabelAccessibility safeCGRectForKey:](v65, "safeCGRectForKey:", CFSTR("hourRect"));
  v31 = v2;
  v32 = v3;
  v33 = v4;
  v34 = v5;
  -[_UIDatePickerCalendarTimeLabelAccessibility convertRect:fromView:](v15, "convertRect:fromView:", v65, v2, v3, v4, v5);
  *(double *)&v13 = v6;
  *((double *)&v13 + 1) = v7;
  *(double *)&v14 = v8;
  *((double *)&v14 + 1) = v9;
  v35 = v13;
  v36 = v14;
  v29 = v13;
  v30 = v14;
  objc_msgSend(v64[0], "setAccessibilityFrameInContainerSpace:", v6, v7, v8, v9);
  v12 = v64[0];
  v23 = MEMORY[0x24BDAC760];
  v24 = -1073741824;
  v25 = 0;
  v26 = __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_7;
  v27 = &unk_24FF3DA88;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v12, "_setAccessibilityActivateBlock:", &v23);
  v11 = v64[0];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v42);
  objc_destroyWeak(v48);
  objc_destroyWeak(v54);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
  objc_storeStrong(v64, 0);
  return v11;
}

- (id)_accessibilityMinuteElement
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _UIDatePickerCalendarTimeLabelAccessibility *v15;
  double v16;
  double v17;
  id *v18;
  id v19;
  uint64_t *v20;
  id *v21;
  id v22;
  uint64_t *v23;
  id *v24;
  id v25;
  uint64_t *v26;
  id v27;
  id *from;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t (*v34)(id *);
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  int v46;
  int v47;
  id (*v48)(uint64_t);
  void *v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  void (*v54)(uint64_t);
  void *v55;
  id v56[2];
  uint64_t v57;
  int v58;
  int v59;
  void (*v60)(uint64_t);
  void *v61;
  id v62[3];
  uint64_t v63;
  void *v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  id v70;
  id location;
  id v72[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v73;

  v73 = self;
  v72[1] = (id)a2;
  v72[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
  v27 = (id)accessibilityUIKitLocalizedString();
  objc_msgSend(v72[0], "setAccessibilityLabel:");

  objc_msgSend(v72[0], "setAccessibilityIdentifier:", CFSTR("Minutes"));
  from = &location;
  objc_initWeak(&location, v73);
  v29 = v72[0];
  v30 = &v65;
  v65 = MEMORY[0x24BDAC760];
  v66 = -1073741824;
  v67 = 0;
  v68 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke;
  v69 = &unk_24FF3DF10;
  objc_copyWeak(&v70, &location);
  objc_msgSend(v29, "_setAccessibilityTraitsBlock:", &v65);
  v64 = 0;
  v63 = 59;
  v25 = v72[0];
  v26 = &v57;
  v57 = MEMORY[0x24BDAC760];
  v58 = -1073741824;
  v59 = 0;
  v60 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_2;
  v61 = &unk_24FF3DF60;
  v24 = v62;
  objc_copyWeak(v62, &location);
  v62[1] = v64;
  v62[2] = (id)v63;
  objc_msgSend(v25, "_setAccessibilityIncrementBlock:", &v57);
  v22 = v72[0];
  v23 = &v51;
  v51 = MEMORY[0x24BDAC760];
  v52 = -1073741824;
  v53 = 0;
  v54 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_4;
  v55 = &unk_24FF3DF88;
  v21 = v56;
  objc_copyWeak(v56, &location);
  v56[1] = v64;
  objc_msgSend(v22, "_setAccessibilityDecrementBlock:", &v51);
  v19 = v72[0];
  v20 = &v45;
  v45 = MEMORY[0x24BDAC760];
  v46 = -1073741824;
  v47 = 0;
  v48 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_6;
  v49 = &unk_24FF3DC00;
  v18 = &v50;
  objc_copyWeak(&v50, &location);
  objc_msgSend(v19, "_setAccessibilityValueBlock:", &v45);
  v15 = v73;
  -[_UIDatePickerCalendarTimeLabelAccessibility safeCGRectForKey:](v73, "safeCGRectForKey:", CFSTR("minuteRect"));
  v16 = v2;
  v17 = v3;
  v39 = v4;
  v40 = v5;
  v41 = v16;
  v42 = v3;
  -[_UIDatePickerCalendarTimeLabelAccessibility convertRect:fromView:](v15, "convertRect:fromView:", v73, v4, v5, v16, v3);
  *(double *)&v13 = v6;
  *((double *)&v13 + 1) = v7;
  *(double *)&v14 = v8;
  *((double *)&v14 + 1) = v9;
  v43 = v13;
  v44 = v14;
  v37 = v13;
  v38 = v14;
  objc_msgSend(v72[0], "setAccessibilityFrameInContainerSpace:", v6, v7, v8, v9);
  v12 = v72[0];
  v31 = MEMORY[0x24BDAC760];
  v32 = -1073741824;
  v33 = 0;
  v34 = __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_7;
  v35 = &unk_24FF3DA88;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v12, "_setAccessibilityActivateBlock:", &v31);
  v11 = v72[0];
  objc_destroyWeak(&v36);
  objc_destroyWeak(v18);
  objc_destroyWeak(v21);
  objc_destroyWeak(v24);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&location);
  objc_storeStrong(v72, 0);
  return v11;
}

- (id)accessibilityLabel
{
  id v3;
  id location[3];
  id v5;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerCalendarTimeView")));
  if (location[0])
  {
    v3 = (id)objc_msgSend(location[0], "safeUIViewForKey:", CFSTR("timeLabel"));
    v5 = (id)objc_msgSend(v3, "accessibilityLabel");

  }
  else
  {
    v5 = accessibilityLocalizedString(CFSTR("calendar.time"));
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
  id v18;
  objc_super v19;
  int v20;
  CGRect r2;
  objc_super v22;
  CGRect v23;
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v25;
  CGRect v26;
  CGRect result;

  v25 = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerCalendarTimeView")));
  if (location[0])
  {
    v22.receiver = v25;
    v22.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    -[_UIDatePickerCalendarTimeLabelAccessibility accessibilityFrame](&v22, sel_accessibilityFrame);
    v23.origin.x = v2;
    v23.origin.y = v3;
    v23.size.width = v4;
    v23.size.height = v5;
    v18 = (id)objc_msgSend(location[0], "safeUIViewForKey:", CFSTR("timeLabel"));
    objc_msgSend(v18, "accessibilityFrame");
    r2.origin.x = v6;
    r2.origin.y = v7;
    r2.size.width = v8;
    r2.size.height = v9;
    v26 = CGRectUnion(v23, r2);

  }
  else
  {
    v19.receiver = v25;
    v19.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    -[_UIDatePickerCalendarTimeLabelAccessibility accessibilityFrame](&v19, sel_accessibilityFrame);
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = v12;
    v26.size.height = v13;
  }
  v20 = 1;
  objc_storeStrong(location, 0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_accessibilityInternalData
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1;
  if (a1)
  {
    v3 = (id)objc_msgSend(v4, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    if (!v3)
    {
      v3 = (id)objc_opt_new();

      v7 = 0;
      v6 = 0;
      v8 = 0;
      v9 = 0;
      v2 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, 0);
      objc_msgSend(v3, "setValue:forKey:");

      objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXInternalData"));
    }
    v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)_accessibilityInternalSelectedTextRange
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a1;
  if (a1)
  {
    v4 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalData](v5);
    v3 = (id)objc_msgSend(v4, "objectForKey:", CFSTR("AXInternalRange"));
    v6 = objc_msgSend(v3, "rangeValue");
    v7 = v1;
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  return v6;
}

- (void)_accessibilitySetInternalSelectedTextRange:(uint64_t)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a2;
  v8 = a3;
  v6 = a1;
  if (a1)
  {
    v5 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalData](v6);
    v3 = v5;
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v8);
    objc_msgSend(v3, "setObject:forKey:");

    objc_storeStrong(&v5, 0);
  }
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  objc_super v5;
  int v6;
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v8;
  uint64_t v9;
  NSUInteger v10;
  _NSRange result;

  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCalendarTimeLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
  if (objc_msgSend(location[0], "length"))
  {
    v9 = -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityInternalSelectedTextRange](v8);
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
    v9 = (uint64_t)-[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySelectedTextRange](&v5, sel__accessibilitySelectedTextRange);
  }
  v10 = v2;
  v6 = 1;
  objc_storeStrong(location, 0);
  v3 = v9;
  v4 = v10;
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  objc_super v3;
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v5;
  _NSRange v6;

  v6 = a3;
  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIDatePickerCalendarTimeLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
  if (objc_msgSend(location[0], "length"))
  {
    -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySetInternalSelectedTextRange:](v5, v6.location, v6.length);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySetSelectedTextRange:](&v3, sel__accessibilitySetSelectedTextRange_, v6.location, v6.length);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusChanged:(id)a3
{
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5 = 0;
  v7 = 0;
  v8 = 0;
  -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilitySetInternalSelectedTextRange:](v4, 0, 0);
  objc_storeStrong(location, 0);
}

- (_UIDatePickerCalendarTimeLabelAccessibility)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  _UIDatePickerCalendarTimeLabelAccessibility *v4;
  _UIDatePickerCalendarTimeLabelAccessibility *v6;
  id v7;
  objc_super v9;
  int64_t v10;
  id location[2];
  _UIDatePickerCalendarTimeLabelAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  v12 = -[_UIDatePickerCalendarTimeLabelAccessibility initWithTimeFormat:minuteInterval:](&v9, sel_initWithTimeFormat_minuteInterval_, location[0], a4);
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v12, sel__accessibilityFocusChanged_, *MEMORY[0x24BDF7238], 0);

  }
  v6 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIDatePickerCalendarTimeLabelAccessibility *v5;

  v5 = self;
  v4 = a2;
  -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v5, *MEMORY[0x24BDF7238], 0);

  v3.receiver = v5;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  -[_UIDatePickerCalendarTimeLabelAccessibility dealloc](&v3, sel_dealloc);
}

- (void)pushCurrentStateIntoUIAndNotify
{
  objc_super v2;
  SEL v3;
  _UIDatePickerCalendarTimeLabelAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIDatePickerCalendarTimeLabelAccessibility;
  -[_UIDatePickerCalendarTimeLabelAccessibility pushCurrentStateIntoUIAndNotify](&v2, sel_pushCurrentStateIntoUIAndNotify);
  -[_UIDatePickerCalendarTimeLabelAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v4, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF100]);
}

@end
