@implementation VideosUI_CardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.CardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_TVProgressView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityLabelViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityAppImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityOverlayView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIBadgeViewWrapper"), CFSTR("badgeElement"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("IKImageElement"), CFSTR("url"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITextLayout"), CFSTR("textStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILabel"), CFSTR("textLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VUIPlaybackManager"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VUIPlaybackManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPlaybackManager"), CFSTR("multiviewPlayerCount"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPlaybackManager"), CFSTR("maxMultiviewPlayerCount"), "q", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("isLockupSelected"), "Bool");
  objc_msgSend(v3, "validateClass:", CFSTR("VUIDownloadButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.ContextMenuButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.CardCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityButton"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadButton"), CFSTR("viewModel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIDownloadButtonViewModel"), CFSTR("downloadState"), "Q");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)VideosUI_CardViewAccessibility;
  -[VideosUI_CardViewAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[VideosUI_CardViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    v7 = *MEMORY[0x24BDF73E0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAccessibilityTraits:", v7);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (id)automationElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosUI_CardViewAccessibility;
  -[VideosUI_CardViewAccessibility automationElements](&v8, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObject:", v6);

  return v5;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349244BC](CFSTR("VUIDownloadButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[VideosUI_CardViewAccessibility _accessibilityDownloadState](self, "_accessibilityDownloadState");
    if (v5 > 4)
      v6 = CFSTR("download.button.stop.action");
    else
      v6 = off_2503D27E8[v5];
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v7, self, sel__axDownloadButtonPressed_);
    objc_msgSend(v3, "axSafelyAddObject:", v8);

  }
  MEMORY[0x2349244BC](CFSTR("VideosUI.ContextMenuButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("tv.button.contextmenu"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v10 = objc_alloc(MEMORY[0x24BDF6788]);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __60__VideosUI_CardViewAccessibility_accessibilityCustomActions__block_invoke;
    v28[3] = &unk_2503D25D8;
    objc_copyWeak(&v29, &location);
    v11 = (void *)objc_msgSend(v10, "initWithName:actionHandler:", v9, v28);
    objc_msgSend(v3, "axSafelyAddObject:", v11);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  -[VideosUI_CardViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityLabelViews"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("tv.details"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_CardViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349244BC](CFSTR("VideosUI.CardCollectionViewCell")));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v13, "accessibilityLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v14);

    if (v18)
    {
      v27.receiver = self;
      v27.super_class = (Class)VideosUI_CardViewAccessibility;
      -[VideosUI_CardViewAccessibility accessibilityActivationPoint](&v27, sel_accessibilityActivationPoint);
      v20 = v19;
      v22 = v21;
      -[VideosUI_CardViewAccessibility accessibilityFrame](self, "accessibilityFrame");
      v24 = v22 + (v22 - v23) * 0.5;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:actionHandler:", v14, &__block_literal_global_262);
      objc_msgSend(v25, "setActivationPoint:", v20, v24);
      objc_msgSend(v3, "axSafelyAddObject:", v25);

    }
  }

  return v3;
}

- (BOOL)_axDownloadButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendActionsForControlEvents:", 64);
  return 1;
}

- (unint64_t)_accessibilityDownloadState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("downloadState"));

  return v4;
}

- (int64_t)_axCompareStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  int64_t result;
  unint64_t v5;
  uint64_t v7;

  if ((unint64_t)a3 > 0x12 || ((1 << a3) & 0x401C0) == 0)
    goto LABEL_38;
  result = 1;
  if ((unint64_t)a4 > 0x12 || ((1 << a4) & 0x401C0) == 0)
    return result;
  if (((1 << a3) & 0x401C0) == 0)
  {
LABEL_38:
    if ((unint64_t)a4 <= 0x12 && ((1 << a4) & 0x401C0) != 0)
      return -1;
    if ((unint64_t)a3 <= 5)
    {
      if ((unint64_t)a4 >= 6)
        return 1;
      goto LABEL_15;
    }
    if ((unint64_t)a4 < 6)
      return -1;
  }
  v5 = a4 - 9;
  if ((unint64_t)(a3 - 9) <= 2)
  {
    if (v5 >= 3)
      return 1;
    goto LABEL_15;
  }
  if (v5 < 3)
    return -1;
LABEL_15:
  if (a3 == 20 || a3 == 14)
  {
    if (a4 != 14 && a4 != 20)
      return -1;
  }
  else
  {
    result = 1;
    if (a4 == 14 || a4 == 20)
      return result;
  }
  if (a3 != 19 && a3 != 13)
    return a4 == 19 || a4 == 13;
  v7 = a4 != 19 && a4 != 13;
  return v7 << 63 >> 63;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  _QWORD v51[5];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[VideosUI_CardViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityLabelViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __52__VideosUI_CardViewAccessibility_accessibilityLabel__block_invoke;
  v51[3] = &unk_2503D2748;
  v51[4] = self;
  objc_msgSend(v4, "sortUsingComparator:", v51);
  v50 = 0;
  objc_opt_class();
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOverlayView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v6;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v47;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(obj);
        v50 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
          abort();
        v14 = v13;
        objc_msgSend(v13, "accessibilityLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16, v35, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v9, "length"))
  {
    v15 = v39;
  }
  else
  {
    -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityImageView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAppImageView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    objc_msgSend(v39, "safeValueForKey:", CFSTR("titleLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "accessibilityLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFSTR("__AXStringForVariablesSentinel");
    v34 = v18;
    v36 = v19;
    __UIAXStringForVariables();
    v21 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v21;
  }
  MEMORY[0x2349244BC](CFSTR("VideosUI.UnifiedOverlayView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "accessibilityLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v22;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v15, "safeArrayForKey:", CFSTR("badgeViewWrappers"));
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v40);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance", v34, v36, v37, v38);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "safeValueForKeyPath:", CFSTR("badgeElement.url"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "accessibilityIdentifierForResourceURL:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v30, "isEqualToString:", CFSTR("Badge-Play")) & 1) == 0)
          {
            v34 = v30;
            v36 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v31 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v31;
          }

        }
        v24 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v24);
    }

    v15 = v39;
  }
  v32 = v9;

  return v32;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  v10.receiver = self;
  v10.super_class = (Class)VideosUI_CardViewAccessibility;
  -[VideosUI_CardViewAccessibility accessibilityUserInputLabels](&v10, sel_accessibilityUserInputLabels);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosUI_CardViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityLabelViews"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_282_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v7);

  objc_msgSend(v5, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityAttributedValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD1688]);
  -[VideosUI_CardViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_286_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length", v25, CFSTR("__AXStringForVariablesSentinel")))
    v8 = v7;
  else
    v8 = &stru_2503D3D30;
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349244BC](CFSTR("VUIDownloadButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length", v27, CFSTR("__AXStringForVariablesSentinel")))
    {
      v26 = v11;
      v28 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v12;
    }

  }
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOverlayView"), v26, v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("textLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    v16 = objc_alloc(MEMORY[0x24BDD1458]);
    v29 = *MEMORY[0x24BDFEB28];
    v30[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v15, v17);

    accessibilityLocalizedString(CFSTR("playback.time.remaining"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v20, v8, CFSTR("__AXStringForVariablesSentinel"));
    v22 = objc_msgSend(v20, "rangeOfString:", CFSTR("%@"));
    objc_msgSend(v21, "replaceCharactersInRange:withAttributedString:", v22, v23, v18);
    objc_msgSend(v3, "appendAttributedString:", v21);

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosUI_CardViewAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[VideosUI_CardViewAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[VideosUI_CardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOverlayView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeSwiftBoolForKey:", CFSTR("isLockupSelected"));
  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  v7 = v3 | v6;

  return v7;
}

- (id)accessibilityHint
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  _QWORD v12[5];
  char v13;

  v3 = MEMORY[0x2349244BC](CFSTR("VideosUI.MultiViewPlayerHUDTemplateController"), a2);
  v13 = 0;
  objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__VideosUI_CardViewAccessibility_accessibilityHint__block_invoke;
  v12[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v12[4] = v3;
  -[VideosUI_CardViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", v12, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    abort();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)MEMORY[0x2349244BC](CFSTR("VUIPlaybackManager")), "safeValueForKey:", CFSTR("sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("multiviewPlayerCount"));
    if (v8 >= objc_msgSend(v7, "safeIntegerForKey:", CFSTR("maxMultiviewPlayerCount")))
    {
      accessibilityLocalizedString(CFSTR("multiview.hint.max.cells.reached"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)VideosUI_CardViewAccessibility;
  -[VideosUI_CardViewAccessibility accessibilityHint](&v11, sel_accessibilityHint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

@end
