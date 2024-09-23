@implementation EKEventDetailTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventDetailTitleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_titleView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_locationItems"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_dateTimeViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_recurrenceView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_statusView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_travelTimeView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailLocationItem"), CFSTR("_locationView"), "EKTextViewWithLabelTextMetrics");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_suggestedLocationCell"), "EKEventDetailSuggestedLocationCell");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailTitleCell"), CFSTR("editButtonTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailTitleCell"), CFSTR("addLocation:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailLocationItem"), CFSTR("_locationStatus"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailTitleCell"), CFSTR("_conferenceDetailView"), "EKEventDetailConferenceCell");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_openURLButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_shareButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_event"), "EKEvent");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_listView"), "UIListContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_actionButtonType"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_openURL"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDetailConferenceCell"), CFSTR("_share:"), "v", "@", 0);

}

- (void)_axAnnotateLocationViewsIfNeeded
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[EKEventDetailTitleCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_locationItems"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v22 = 0;
        objc_opt_class();
        objc_msgSend(v7, "safeValueForKey:", CFSTR("_locationView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsSafeCategory();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "accessibilityIsLocationLink");
        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v2;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "safeValueForKey:", CFSTR("_locationView"), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIsAccessibilityElement:", v11);
        objc_msgSend(v17, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 0);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v14);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailTitleCellAccessibility;
  -[EKEventDetailTitleCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKEventDetailTitleCellAccessibility _axAnnotateLocationViewsIfNeeded](self, "_axAnnotateLocationViewsIfNeeded");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)EKEventDetailTitleCellAccessibility;
  -[EKEventDetailTitleCellAccessibility accessibilityCustomActions](&v41, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[EKEventDetailTitleCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_editButton"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke;
  v38[3] = &unk_2501FCDB8;
  objc_copyWeak(&v39, &location);
  -[EKEventDetailTitleCellAccessibility _addCustomActionToActionsArray:forControl:actionBlock:](self, "_addCustomActionToActionsArray:forControl:actionBlock:", v4, v5, v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDetailTitleCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_conferenceDetailView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeUIViewForKey:", CFSTR("_openURLButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeUIViewForKey:", CFSTR("_shareButton"));
  v9 = objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_opt_class();
  -[EKEventDetailTitleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_event"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)v5;
  v31 = (void *)v9;
  objc_msgSend(v11, "virtualConference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeArrayForKey:", CFSTR("joinMethods"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "containsString:", CFSTR("facetime.apple.com")))
  {
    objc_msgSend(v8, "accessibilityLabel");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = &stru_2501FDFB0;
    if (v18)
      v20 = (__CFString *)v18;
    v21 = v20;

    accessibilityLocalizedString(CFSTR("application.name.facetime"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString containsString:](v21, "containsString:", v22) & 1) == 0)
    {
      __UIAXStringForVariables();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v23, v22, CFSTR("__AXStringForVariablesSentinel"));

    }
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v35[3] = &unk_2501FCC40;
  v24 = v7;
  v36 = v24;
  -[EKEventDetailTitleCellAccessibility _addCustomActionToActionsArray:forControl:actionBlock:](self, "_addCustomActionToActionsArray:forControl:actionBlock:", v6, v8, v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_3;
  v32[3] = &unk_2501FCDE0;
  v26 = v24;
  v33 = v26;
  v27 = v31;
  v34 = v27;
  -[EKEventDetailTitleCellAccessibility _addCustomActionToActionsArray:forControl:actionBlock:](self, "_addCustomActionToActionsArray:forControl:actionBlock:", v25, v27, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v28;
}

void __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editButtonTapped");

}

uint64_t __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openURL");
}

uint64_t __65__EKEventDetailTitleCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_share:", *(_QWORD *)(a1 + 40));
}

- (id)_addCustomActionToActionsArray:(id)a3 forControl:(id)a4 actionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "_accessibilityViewIsVisible");
  if (v9 && v10)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    objc_msgSend(v8, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke;
    v15[3] = &unk_2501FCE30;
    v16 = v9;
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v15);

    objc_msgSend(v7, "addObject:", v13);
  }

  return v7;
}

uint64_t __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __93__EKEventDetailTitleCellAccessibility__addCustomActionToActionsArray_forControl_actionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)accessibilityCustomContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id AXCustomContentClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  __CFString *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  EKEventDetailTitleCellAccessibility *v63;
  id obj;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v63 = self;
  -[EKEventDetailTitleCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_locationItems"));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v72 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v7, "safeValueForKey:", CFSTR("_locationView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && (objc_msgSend(v8, "isAccessibilityElement") & 1) == 0)
        {
          v10 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("_locationStatus"));
          objc_msgSend(v9, "accessibilityAttributedValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventDetailTitleCellAccessibility _accessibilityImageLabelforAttributedLocationName:andLocationStatus:](v63, "_accessibilityImageLabelforAttributedLocationName:andLocationStatus:", v11, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          AXCustomContentClass = getAXCustomContentClass();
          accessibilityLocalizedString(CFSTR("location.title"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessibilityValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(AXCustomContentClass, "customContentWithLabel:value:", v14, v16, v12, CFSTR("__AXStringForVariablesSentinel"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "addObject:", v17);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v4);
  }

  -[EKEventDetailTitleCellAccessibility safeUIViewForKey:](v63, "safeUIViewForKey:", CFSTR("_conferenceDetailView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "_accessibilityViewIsVisible"))
  {
    v70 = 0;
    objc_opt_class();
    objc_msgSend(v18, "safeValueForKey:", CFSTR("_listView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "safeIntegerForKey:", CFSTR("_actionButtonType")) == 3)
    {
      objc_msgSend(v20, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDFEA60];
        objc_msgSend(v20, "configuration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "text");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "axAttributedStringWithString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC08]);
        v28 = getAXCustomContentClass();
        v29 = objc_alloc(MEMORY[0x24BDD1458]);
        accessibilityLocalizedString(CFSTR("phone.title"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithString:", v30);
        objc_msgSend(v27, "attributedString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "customContentWithAttributedLabel:attributedValue:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "addObject:", v33);
      }
    }

  }
  v62 = v18;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[EKEventDetailTitleCellAccessibility safeArrayForKey:](v63, "safeArrayForKey:", CFSTR("_dateTimeViews"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v35)
  {
    v36 = v35;
    v37 = 0;
    v38 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v67 != v38)
          objc_enumerationMutation(v34);
        v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        if (!(v37 + j))
        {
          v41 = CFSTR("date.title");
          goto LABEL_25;
        }
        if (v37 + j == 1)
        {
          v41 = CFSTR("time.title");
LABEL_25:
          accessibilityLocalizedString(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v42 = 0;
LABEL_27:
        v43 = getAXCustomContentClass();
        objc_msgSend(v40, "accessibilityLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "customContentWithLabel:value:", v42, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "setImportance:", 1);
        objc_msgSend(v65, "addObject:", v45);

      }
      v37 += v36;
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v36);
  }

  -[EKEventDetailTitleCellAccessibility safeValueForKey:](v63, "safeValueForKey:", CFSTR("_travelTimeView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "accessibilityLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = getAXCustomContentClass();
    accessibilityLocalizedString(CFSTR("travel.time.title"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "customContentWithLabel:value:", v49, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "addObject:", v50);
  }
  -[EKEventDetailTitleCellAccessibility safeValueForKey:](v63, "safeValueForKey:", CFSTR("_recurrenceView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "accessibilityLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v53 = getAXCustomContentClass();
    accessibilityLocalizedString(CFSTR("recurrence.title"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "customContentWithLabel:value:", v54, v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "addObject:", v55);
  }
  -[EKEventDetailTitleCellAccessibility safeValueForKey:](v63, "safeValueForKey:", CFSTR("_statusView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "accessibilityLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v58 = getAXCustomContentClass();
    accessibilityLocalizedString(CFSTR("status.title"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "customContentWithLabel:value:", v59, v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "addObject:", v60);
  }

  return v65;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[EKEventDetailTitleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addLocation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCellAccessibility;
  -[EKEventDetailTitleCellAccessibility addLocation:](&v4, sel_addLocation_, a3);
  -[EKEventDetailTitleCellAccessibility _axAnnotateLocationViewsIfNeeded](self, "_axAnnotateLocationViewsIfNeeded");
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKEventDetailTitleCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_suggestedLocationCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKEventDetailTitleCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_locationItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __77__EKEventDetailTitleCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeValueForKey:", CFSTR("_locationView"));
}

- (id)_accessibilityImageLabelforAttributedLocationName:(id)a3 andLocationStatus:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v7 = *MEMORY[0x24BDFEAE0];
  v8 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __107__EKEventDetailTitleCellAccessibility__accessibilityImageLabelforAttributedLocationName_andLocationStatus___block_invoke;
  v11[3] = &unk_2501FCE78;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a4;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __107__EKEventDetailTitleCellAccessibility__accessibilityImageLabelforAttributedLocationName_andLocationStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityImageLabelforStatus:", *(_QWORD *)(a1 + 48));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)_accessibilityImageLabelforStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return accessibilityLocalizedString(CFSTR("location.status.pending"));
  else
    return accessibilityLocalizedString(off_2501FCED8[a3 - 2]);
}

@end
