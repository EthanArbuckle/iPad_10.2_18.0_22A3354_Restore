@implementation _UICalendarDateViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICalendarDateViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("_UICalendarDateViewCell");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = CFSTR("UICollectionViewCell");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UICalendarDateViewCell"));
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("prepareForReuse"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_decorationContentView"), "UIView");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICalendarViewDecoration"), CFSTR("_decorationView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("configureWithDay:formatter:fontDesign:decorations:outOfRange:renderOverhangDays:highlightsToday:"), v6, v4, v4, v4, v4, "B", "B", "B", 0);
  objc_storeStrong(v8, v7);
}

- (void)configureWithDay:(id)a3 formatter:(id)a4 fontDesign:(id)a5 decorations:(id)a6 outOfRange:(BOOL)a7 renderOverhangDays:(BOOL)a8 highlightsToday:(BOOL)a9
{
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  _UICalendarDateViewCellAccessibility *v13;
  _UICalendarDateViewCellAccessibility *v14;
  _UICalendarDateViewCellAccessibility *v15;
  _UICalendarDateViewCellAccessibility *v16;
  _UICalendarDateViewCellAccessibility *v17;
  id v18;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  BOOL v31;
  uint64_t v32;
  int v33;
  int v34;
  BOOL (*v35)(uint64_t);
  void *v36;
  id v37;
  uint64_t v38;
  int v39;
  int v40;
  BOOL (*v41)(uint64_t);
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  id (*v48)(id *);
  void *v49;
  id v50[3];
  uint64_t v51;
  int v52;
  int v53;
  id (*v54)(id *);
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  id v62;
  objc_super v63;
  BOOL v64;
  BOOL v65;
  BOOL v66;
  id v67;
  id v68;
  id v69;
  id location[2];
  _UICalendarDateViewCellAccessibility *v71;

  v71 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v69 = 0;
  objc_storeStrong(&v69, a4);
  v68 = 0;
  objc_storeStrong(&v68, a5);
  v67 = 0;
  objc_storeStrong(&v67, a6);
  v66 = a7;
  v65 = a8;
  v64 = a9;
  v63.receiver = v71;
  v63.super_class = (Class)_UICalendarDateViewCellAccessibility;
  -[_UICalendarDateViewCellAccessibility configureWithDay:formatter:fontDesign:decorations:outOfRange:renderOverhangDays:highlightsToday:](&v63, sel_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday_, location[0], v69, v68, v67, a7, a8, a9);
  v61 = 0;
  objc_opt_class();
  v24 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("date"));
  v60 = (id)__UIAccessibilityCastAsClass();

  v59 = v60;
  objc_storeStrong(&v60, 0);
  v62 = v59;
  v58 = (id)AXDateStringForFormat();
  if ((objc_msgSend(location[0], "safeBoolForKey:", CFSTR("isToday")) & 1) != 0)
  {
    v18 = accessibilityLocalizedString(CFSTR("calendar.today"));
    v11 = v58;
    v12 = CFSTR("__AXStringForVariablesSentinel");
    v9 = (id)__UIAXStringForVariables();
    v10 = v58;
    v58 = v9;

  }
  -[_UICalendarDateViewCellAccessibility setAccessibilityLabel:](v71, "setAccessibilityLabel:", v58, v11, v12);
  objc_initWeak(&v57, v67);
  v17 = v71;
  v51 = MEMORY[0x24BDAC760];
  v52 = -1073741824;
  v53 = 0;
  v54 = __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke;
  v55 = &unk_24FF3DC00;
  objc_copyWeak(&v56, &v57);
  -[_UICalendarDateViewCellAccessibility _setAccessibilityValueBlock:](v17, "_setAccessibilityValueBlock:", &v51);
  v16 = v71;
  v45 = MEMORY[0x24BDAC760];
  v46 = -1073741824;
  v47 = 0;
  v48 = __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_2;
  v49 = &unk_24FF3DC00;
  objc_copyWeak(v50, &v57);
  -[_UICalendarDateViewCellAccessibility _setAccessibilityHintBlock:](v16, "_setAccessibilityHintBlock:", &v45);
  objc_initWeak(&v44, v71);
  v15 = v71;
  v38 = MEMORY[0x24BDAC760];
  v39 = -1073741824;
  v40 = 0;
  v41 = __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_3;
  v42 = &unk_24FF3DA88;
  objc_copyWeak(&v43, &v44);
  -[_UICalendarDateViewCellAccessibility _setIsAccessibilityElementBlock:](v15, "_setIsAccessibilityElementBlock:", &v38);
  v14 = v71;
  v32 = MEMORY[0x24BDAC760];
  v33 = -1073741824;
  v34 = 0;
  v35 = __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_4;
  v36 = &unk_24FF3DA88;
  objc_copyWeak(&v37, &v44);
  -[_UICalendarDateViewCellAccessibility _setAccessibilityElementsHiddenBlock:](v14, "_setAccessibilityElementsHiddenBlock:", &v32);
  v13 = v71;
  v25 = MEMORY[0x24BDAC760];
  v26 = -1073741824;
  v27 = 0;
  v28 = __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_5;
  v29 = &unk_24FF3DC28;
  objc_copyWeak(&v30, &v44);
  v31 = v66;
  -[_UICalendarDateViewCellAccessibility _setAccessibilityTraitsBlock:](v13, "_setAccessibilityTraitsBlock:", &v25);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v44);
  objc_destroyWeak(v50);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v57);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v68, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityElements
{
  return MEMORY[0x24BDBD1A8];
}

- (void)prepareForReuse
{
  objc_super v2;
  SEL v3;
  _UICalendarDateViewCellAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UICalendarDateViewCellAccessibility;
  -[_UICalendarDateViewCellAccessibility prepareForReuse](&v2, sel_prepareForReuse);
  -[_UICalendarDateViewCellAccessibility _setIsAccessibilityElementBlock:](v4, "_setIsAccessibilityElementBlock:");
  -[_UICalendarDateViewCellAccessibility setAccessibilityLabel:](v4, "setAccessibilityLabel:", 0);
  -[_UICalendarDateViewCellAccessibility _setAccessibilityTraitsBlock:](v4, "_setAccessibilityTraitsBlock:", 0);
}

- (BOOL)canBecomeFocused
{
  int v3;
  objc_super v4;
  SEL v5;
  _UICalendarDateViewCellAccessibility *v6;

  v6 = self;
  v5 = a2;
  if ((-[_UICalendarDateViewCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v3 = -[_UICalendarDateViewCellAccessibility isAccessibilityElement](v6, "isAccessibilityElement") & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)_UICalendarDateViewCellAccessibility;
    v3 = -[_UICalendarDateViewCellAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
  }
  return v3 != 0;
}

@end
