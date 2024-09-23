@implementation UICollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  id v17;
  id *v18;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v18 = location;
  v17 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = "@";
  v14 = CFSTR("UICollectionViewListCell");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_setNeedsUpdateAccessories"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_updateCurrentSystemTypeAccessoryViewsUsingState:"), v3, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_accessoryManager"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("leadingAccessoryConfigurations"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("trailingAccessoryConfigurations"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("leadingEditingAccessoryConfigurations"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("trailingEditingAccessoryConfigurations"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_toggleExpansionState"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_deleteAccessoryTriggered"), v3, 0);
  v6 = CFSTR("UICollectionViewCell");
  v10 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_expanded"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_setExpanded:"), v3, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("configurationState"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("_cellSelectionTogglesExpansionState"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICellAccessoryManager"), CFSTR("currentConfiguration"), v16, 0);
  v4 = CFSTR("UICellAccessoryConfiguration");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("leadingAccessories"), v16, 0);
  v5 = CFSTR("_UICellAccessoryConfiguration");
  v9 = CFSTR("_isSystemType");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v12 = CFSTR("_systemType");
  v13 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_identifier"), v16, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v14, v6);
  v7 = CFSTR("_UICellViewAccessory");
  objc_msgSend(location[0], "validateClass:");
  v8 = CFSTR("_UICellAccessory");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v7);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("view"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("identifier"), v16, 0);
  v11 = CFSTR("UICellAccessory");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, v12, v13, 0);
  v15 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v14);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, CFSTR("_gestureRecognizers"), v16, 0);
  objc_storeStrong(v18, v17);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(uint64_t);
  void *v6;
  UICollectionViewListCellAccessibility *v7;
  objc_super v8;
  SEL v9;
  UICollectionViewListCellAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UICollectionViewListCellAccessibility;
  -[UICollectionViewListCellAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __83__UICollectionViewListCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6 = &unk_24FF3DA40;
  v7 = v10;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v7, 0);
}

void __83__UICollectionViewListCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateAccessories");
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("configurationState"));
  objc_msgSend(v2, "_updateCurrentSystemTypeAccessoryViewsUsingState:");

}

- (id)accessibilityLabel
{
  return -[UICollectionViewListCellAccessibility _accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:](self, "_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:", 0, a2, self);
}

- (id)_accessibilityBriefLabel
{
  return -[UICollectionViewListCellAccessibility _accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:](self, "_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:", 1, a2, self);
}

- (id)_accessibilityRetrieveCollectionViewListCellTextExcludingDetailText:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  char v17;
  _QWORD __b[8];
  id v19;
  char v20;
  id v21;
  objc_super v22;
  id v23;
  id v24;
  int v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  BOOL v31;
  SEL v32;
  UICollectionViewListCellAccessibility *v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32 = a2;
  v31 = a3;
  v29 = 0;
  objc_opt_class();
  v28 = (id)__UIAccessibilityCastAsClass();
  v27 = v28;
  objc_storeStrong(&v28, 0);
  v30 = v27;
  if (v31)
  {
    v26 = (id)-[UICollectionViewListCellAccessibility accessibilityUserDefinedLabel](v33, "accessibilityUserDefinedLabel");
    if (v26)
    {
      v34 = v26;
      v25 = 1;
    }
    else
    {
      v24 = (id)objc_msgSend(v30, "contentConfiguration");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = (id)objc_msgSend(v24, "text");
      else
        v34 = (id)objc_msgSend(v24, "accessibilityLabel");
      v25 = 1;
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v22.receiver = v33;
    v22.super_class = (Class)UICollectionViewListCellAccessibility;
    v23 = -[UICollectionViewListCellAccessibility accessibilityLabel](&v22, sel_accessibilityLabel);
    v20 = 0;
    v17 = 0;
    if (v23)
    {
      v21 = (id)objc_msgSend(v30, "configurationState");
      v20 = 1;
      v17 = objc_msgSend(v21, "isEditing");
    }
    if ((v20 & 1) != 0)

    if ((v17 & 1) != 0)
    {
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(v30, "accessories");
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
      if (v16)
      {
        v12 = *(_QWORD *)__b[2];
        v13 = 0;
        v14 = v16;
        while (1)
        {
          v11 = v13;
          if (*(_QWORD *)__b[2] != v12)
            objc_enumerationMutation(obj);
          v19 = *(id *)(__b[1] + 8 * v13);
          if ((objc_msgSend(v19, "isHidden", v8) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = (id)accessibilityUIKitLocalizedString();
              v8 = v23;
              v3 = (id)AXCFormattedString();
              v4 = v23;
              v23 = v3;

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v9 = (id)accessibilityUIKitLocalizedString();
                v8 = v23;
                v5 = (id)AXCFormattedString();
                v6 = v23;
                v23 = v5;

              }
            }
          }
          ++v13;
          if (v11 + 1 >= v14)
          {
            v13 = 0;
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
            if (!v14)
              break;
          }
        }
      }

    }
    v34 = v23;
    v25 = 1;
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v30, 0);
  return v34;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(_QWORD *, void *, char, uint64_t, _BYTE *);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  char v30;
  _QWORD __b[8];
  id v32;
  id location;
  objc_super v34;
  id v35[2];
  UICollectionViewListCellAccessibility *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = self;
  v35[1] = (id)a2;
  v35[0] = (id)-[UICollectionViewListCellAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (!objc_msgSend(v35[0], "length"))
  {
    v34.receiver = v36;
    v34.super_class = (Class)UICollectionViewListCellAccessibility;
    v2 = -[UICollectionViewListCellAccessibility accessibilityValue](&v34, sel_accessibilityValue);
    v3 = v35[0];
    v35[0] = v2;

    v19 = -[UICollectionViewListCellAccessibility _accessibilityTrailingViews](v36, "_accessibilityTrailingViews");
    location = (id)objc_msgSend(v19, "axFilterObjectsUsingBlock:", &__block_literal_global_15);

    memset(__b, 0, sizeof(__b));
    obj = location;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
    if (v18)
    {
      v14 = *(_QWORD *)__b[2];
      v15 = 0;
      v16 = v18;
      while (1)
      {
        v13 = v15;
        if (*(_QWORD *)__b[2] != v14)
          objc_enumerationMutation(obj);
        v32 = *(id *)(__b[1] + 8 * v15);
        v9 = (id)objc_msgSend(v32, "accessibilityLabel", v9, v11);
        v11 = CFSTR("__AXStringForVariablesSentinel");
        v4 = (id)__UIAXStringForVariables();
        v5 = v35[0];
        v35[0] = v4;

        ++v15;
        if (v13 + 1 >= v16)
        {
          v15 = 0;
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16, v9, CFSTR("__AXStringForVariablesSentinel"));
          if (!v16)
            break;
        }
      }
    }

    objc_storeStrong(&location, 0);
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x20000000;
  v29 = 32;
  v30 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = -1073741824;
  v22 = 0;
  v23 = __59__UICollectionViewListCellAccessibility_accessibilityValue__block_invoke_2;
  v24 = &unk_24FF3EAE8;
  v25 = &v26;
  -[UICollectionViewListCellAccessibility _accessibilityEnumerateCurrentConfigurationsWithBlock:](v36, &v20);
  if ((v27[3] & 1) != 0)
  {
    v10 = (id)UIKitAccessibilityLocalizedString();
    v6 = (id)__UIAXStringForVariables();
    v7 = v35[0];
    v35[0] = v6;

  }
  v12 = v35[0];
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(v35, 0);
  return v12;
}

uint64_t __59__UICollectionViewListCellAccessibility_accessibilityValue__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __59__UICollectionViewListCellAccessibility_accessibilityValue__block_invoke_2(_QWORD *a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  char v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  if (a4 == 1)
    v9 = a3 & 1;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v9 & 1;
  *a5 = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) & 1;
  objc_storeStrong(location, 0);
}

- (void)_accessibilityEnumerateCurrentConfigurationsWithBlock:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  id v8;
  void (**v9)(void);
  id v10;
  void (**v11)(void);
  id v12;
  void (**v13)(void);
  id v14;
  void (**v15)(void);
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD __b[8];
  id v20;
  char v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(_QWORD *, void *);
  void *v26;
  id v27[2];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  char v33;
  int v34;
  id location;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v36)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x20000000;
    v32 = 32;
    v33 = 0;
    v22 = MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __95__UICollectionViewListCellAccessibility__accessibilityEnumerateCurrentConfigurationsWithBlock___block_invoke;
    v26 = &unk_24FF3EC40;
    v27[1] = &v29;
    v27[0] = location;
    v28 = (id)MEMORY[0x2348C3D88](&v22);
    v21 = objc_msgSend(v36, "safeBoolForKey:", CFSTR("isEditing")) & 1;
    if (v21)
    {
      v15 = (void (**)(void))v28;
      v14 = (id)objc_msgSend(v36, "safeArrayForKey:", CFSTR("leadingEditingAccessoryConfigurations"));
      v15[2]();

      v13 = (void (**)(void))v28;
      v12 = (id)objc_msgSend(v36, "safeArrayForKey:", CFSTR("trailingEditingAccessoryConfigurations"));
      v13[2]();

    }
    else
    {
      v11 = (void (**)(void))v28;
      v10 = (id)objc_msgSend(v36, "safeArrayForKey:", CFSTR("leadingAccessoryConfigurations"));
      v11[2]();

      v9 = (void (**)(void))v28;
      v8 = (id)objc_msgSend(v36, "safeArrayForKey:", CFSTR("trailingAccessoryConfigurations"));
      v9[2]();

    }
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v36, "accessories");
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
    if (v7)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v7;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v20 = *(id *)(__b[1] + 8 * v4);
        v18 = objc_msgSend(v20, "displayedState");
        if ((objc_msgSend(v20, "isHidden") & 1) == 0
          && (!v18 || (v21 & 1) != 0 && v18 == 1 || (v21 & 1) == 0 && v18 == 2))
        {
          v17 = objc_msgSend(v20, "safeBoolForKey:", CFSTR("_isSystemType")) & 1;
          v16 = 0;
          if (v17)
            v16 = objc_msgSend(v20, "safeIntegerForKey:", CFSTR("_systemType"));
          (*((void (**)(id, _QWORD, _QWORD, uint64_t, uint64_t *))location + 2))(location, 0, v17 & 1, v16, v30 + 3);
          if ((v30[3] & 1) != 0)
            break;
        }
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
          if (!v5)
            goto LABEL_22;
        }
      }
      v34 = 2;
    }
    else
    {
LABEL_22:
      v34 = 0;
    }

    objc_storeStrong(&v28, 0);
    objc_storeStrong(v27, 0);
    _Block_object_dispose(&v29, 8);
    v34 = 0;
  }
  else
  {
    v34 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  objc_super v4;
  id location[2];
  UICollectionViewListCellAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewListCellAccessibility;
  location[0] = -[UICollectionViewListCellAccessibility _accessibilitySupplementaryFooterViews](&v4, sel__accessibilitySupplementaryFooterViews);
  if (location[0])
  {
    v7 = location[0];
  }
  else
  {
    v3 = -[UICollectionViewListCellAccessibility _accessibilityTrailingViews](v6, "_accessibilityTrailingViews");
    v7 = (id)objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_273);

  }
  objc_storeStrong(location, 0);
  return v7;
}

uint64_t __79__UICollectionViewListCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (id)_axIgnoredConfigurationIdentifiers
{
  id location;
  dispatch_once_t *v3;

  if (!a1)
    return 0;
  v3 = (dispatch_once_t *)&_axIgnoredConfigurationIdentifiers_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_274);
  if (*v3 != -1)
    dispatch_once(v3, location);
  objc_storeStrong(&location, 0);
  return (id)_axIgnoredConfigurationIdentifiers_ignoredIdentifiers;
}

void __75__UICollectionViewListCellAccessibility__axIgnoredConfigurationIdentifiers__block_invoke(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[3];

  v9[2] = a1;
  v9[1] = a1;
  v9[0] = (id)objc_opt_new();
  v3 = objc_alloc_init(MEMORY[0x24BDF7058]);
  v8 = (id)objc_msgSend(v3, "safeStringForKey:");

  objc_msgSend(v9[0], "axSafelyAddObject:", v8);
  v4 = objc_alloc_init(MEMORY[0x24BDF7060]);
  v7 = (id)objc_msgSend(v4, "safeStringForKey:", CFSTR("_identifier"));

  objc_msgSend(v9[0], "axSafelyAddObject:", v7);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF7068]), "initWithCellSelectionTogglesExpansionState:", 0);
  v6 = (id)objc_msgSend(v5, "safeStringForKey:", CFSTR("_identifier"));

  objc_msgSend(v9[0], "axSafelyAddObject:", v6);
  v1 = objc_msgSend(v9[0], "copy");
  v2 = (void *)_axIgnoredConfigurationIdentifiers_ignoredIdentifiers;
  _axIgnoredConfigurationIdentifiers_ignoredIdentifiers = v1;

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

- (id)_accessibilityTrailingViews
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[8];
  uint64_t v20;
  id location;
  char v22;
  _QWORD __b[8];
  id v24;
  id v25;
  id v26[2];
  UICollectionViewListCellAccessibility *v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26[1] = (id)a2;
  v26[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = (id)-[UICollectionViewListCellAccessibility safeValueForKey:](v27, "safeValueForKey:", CFSTR("_accessoryManager"));
  v25 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("currentConfiguration"));

  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v25, "safeArrayForKey:", CFSTR("trailingAccessories"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v18)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v18;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v24 = *(id *)(__b[1] + 8 * v14);
      v22 = 0;
      location = (id)objc_msgSend(v24, "safeStringForKey:", CFSTR("identifier"));
      memset(v19, 0, sizeof(v19));
      v10 = -[UICollectionViewListCellAccessibility _axIgnoredConfigurationIdentifiers]((uint64_t)v27);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v19, v28, 16);
      if (v11)
      {
        v7 = *(_QWORD *)v19[2];
        v8 = 0;
        v9 = v11;
        while (1)
        {
          v6 = v8;
          if (*(_QWORD *)v19[2] != v7)
            objc_enumerationMutation(v10);
          v20 = *(_QWORD *)(v19[1] + 8 * v8);
          v22 = objc_msgSend(location, "_containsSubstring:", v20) & 1;
          if (v22)
            break;
          ++v8;
          if (v6 + 1 >= v9)
          {
            v8 = 0;
            v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v19, v28, 16);
            if (!v9)
              break;
          }
        }
      }

      if ((v22 & 1) == 0)
      {
        NSClassFromString(CFSTR("_UICellViewAccessory"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v26[0];
          v5 = (id)objc_msgSend(v24, "safeValueForKey:", CFSTR("view"));
          objc_msgSend(v4, "axSafelyAddObject:");

        }
      }
      objc_storeStrong(&location, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v15)
          break;
      }
    }
  }

  v3 = v26[0];
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  return v3;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  BOOL v8;

  v2 = (id)-[UICollectionViewListCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v6 = v2 == 0;

  if (v6)
  {
    v4 = -[UICollectionViewListCellAccessibility accessibilityLabel](self, "accessibilityLabel");
    v8 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = (id)-[UICollectionViewListCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v8 = objc_msgSend(v5, "BOOLValue") & 1;

  }
  return v8;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  _QWORD __b[8];
  id v21;
  id v22;
  objc_super v23;
  unint64_t v24;
  SEL v25;
  UICollectionViewListCellAccessibility *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25 = a2;
  v24 = 0;
  v23.receiver = self;
  v23.super_class = (Class)UICollectionViewListCellAccessibility;
  v24 = -[UICollectionViewListCellAccessibility accessibilityTraits](&v23, sel_accessibilityTraits);
  if (-[UICollectionViewListCellAccessibility _accessibilityExpandedStatus](v26, "_accessibilityExpandedStatus")
    && (-[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](v26) & 1) != 0)
  {
    v24 |= *MEMORY[0x24BDF73B0];
  }
  v22 = (id)-[UICollectionViewListCellAccessibility contentView](v26, "contentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (id)objc_msgSend(v22, "configuration");
    v2 = objc_msgSend(v12, "accessibilityTraits");
    v24 |= v2;

  }
  memset(__b, 0, sizeof(__b));
  v19 = 0;
  objc_opt_class();
  v18 = (id)__UIAccessibilityCastAsClass();
  v17 = v18;
  objc_storeStrong(&v18, 0);
  obj = (id)objc_msgSend(v17, "accessories");

  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v21 = *(id *)(__b[1] + 8 * v8);
      if ((objc_msgSend(v21, "isHidden") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 |= *MEMORY[0x24BDF73B0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 |= *MEMORY[0x24BDF7400];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = 0;
          objc_opt_class();
          v14 = (id)__UIAccessibilityCastAsClass();
          if ((v15 & 1) != 0)
            abort();
          v13 = v14;
          objc_storeStrong(&v14, 0);
          v16 = (id)objc_msgSend(v13, "customView");

          if (v16)
          {
            v3 = objc_msgSend(v16, "accessibilityTraits");
            v24 |= v3;
          }
          objc_storeStrong(&v16, 0);
        }
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v9)
          break;
      }
    }
  }

  v5 = v24;
  objc_storeStrong(&v22, 0);
  return v5;
}

- (uint64_t)_axCellSelectionTogglesExpansionState
{
  char v2;

  if (a1)
    v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("_cellSelectionTogglesExpansionState")) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (int64_t)_accessibilityExpandedStatus
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *, char, uint64_t, _BYTE *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  SEL v16;
  UICollectionViewListCellAccessibility *v17;
  int64_t v18;

  v17 = self;
  v16 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  v15 = -[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](self) & 1;
  if ((v12[3] & 1) == 0)
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __69__UICollectionViewListCellAccessibility__accessibilityExpandedStatus__block_invoke;
    v9 = &unk_24FF3EAE8;
    v10 = &v11;
    -[UICollectionViewListCellAccessibility _accessibilityEnumerateCurrentConfigurationsWithBlock:](v17, &v5);
  }
  if ((v12[3] & 1) != 0)
  {
    v4 = -[UICollectionViewListCellAccessibility safeBoolForKey:](v17, "safeBoolForKey:", CFSTR("_expanded"));
    v2 = 2;
    if ((v4 & 1) != 0)
      v2 = 1;
    v18 = v2;
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v18;
}

void __69__UICollectionViewListCellAccessibility__accessibilityExpandedStatus__block_invoke(_QWORD *a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  char v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  if (a4 == 6)
    v9 = a3 & 1;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v9 & 1;
  *a5 = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) & 1;
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityExpandedStatusTogglesOnActivate
{
  return -[UICollectionViewListCellAccessibility _axCellSelectionTogglesExpansionState](self) & 1;
}

- (id)_privateAccessibilityCustomActions
{
  id v3;
  id v4;
  UICollectionViewListCellAccessibility *v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, char, unint64_t, void *);
  void *v11;
  UICollectionViewListCellAccessibility *v12;
  id v13;
  objc_super v14;
  id v15[2];
  UICollectionViewListCellAccessibility *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = v15[0];
  v14.receiver = v16;
  v14.super_class = (Class)UICollectionViewListCellAccessibility;
  v4 = -[UICollectionViewListCellAccessibility _privateAccessibilityCustomActions](&v14, sel__privateAccessibilityCustomActions);
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

  v5 = v16;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke;
  v11 = &unk_24FF3EBF0;
  v12 = v16;
  v13 = v15[0];
  -[UICollectionViewListCellAccessibility _accessibilityEnumerateCurrentConfigurationsWithBlock:](v5, &v7);
  v6 = v15[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(v15, 0);
  return v6;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke(id *a1, void *a2, char a3, unint64_t a4, void *a5)
{
  id v9[3];
  unint64_t v10;
  char v11;
  id location[19];

  location[18] = *(id *)MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = a3 & 1;
  v10 = a4;
  v9[2] = a5;
  v9[1] = a1;
  v9[0] = 0;
  if ((a3 & 1) != 0 && v10 <= 0xA)
    __asm { BR              X8 }
  objc_msgSend(a1[5], "axSafelyAddObject:", v9[0]);
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(id *a1, void *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_3;
  v8 = &unk_24FF3DA40;
  v9[0] = a1[4];
  AXPerformSafeBlock();
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v1;
  void (**v2)(void);
  BOOL v4;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v4 = v1 == 0;

  if (!v4)
  {
    v2 = (void (**)(void))(id)objc_msgSend(*(id *)(a1 + 32), "actionHandler");
    v2[2]();

  }
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_4(id *a1, void *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_5;
  v8 = &unk_24FF3EB78;
  v9 = a1[4];
  objc_copyWeak(v10, a1 + 5);
  AXPerformSafeBlock();
  objc_destroyWeak(v10);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id v1;
  id WeakRetained;
  void (**v3)(void);
  BOOL v5;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v5 = v1 == 0;

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_deleteAccessoryTriggered");

  }
  else
  {
    v3 = (void (**)(void))(id)objc_msgSend(*(id *)(a1 + 32), "actionHandler");
    v3[2]();

  }
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_6(id *a1, void *a2)
{
  void (**v4)(void);
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (void (**)(void))(id)objc_msgSend(a1[4], "actionHandler");
  v4[2]();

  objc_storeStrong(location, 0);
  return 1;
}

uint64_t __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_7(uint64_t a1, void *a2)
{
  id v4;
  char v5;
  uint64_t v6;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = a1;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = *(_BYTE *)(a1 + 40) & 1;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(0x416u, 0);
  objc_destroyWeak(&v4);
  objc_storeStrong(location, 0);
  return 1;
}

void __75__UICollectionViewListCellAccessibility__privateAccessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setExpanded:", (*(_BYTE *)(a1 + 40) ^ 1) & 1);

  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "_toggleExpansionState");

}

- (id)automationElements
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[8];
  uint64_t v20;
  _QWORD __b[8];
  uint64_t v22;
  id location;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t *, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;
  id v33[2];
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = self;
  v33[1] = (id)a2;
  v33[0] = (id)objc_opt_new();
  v14 = v33[0];
  v32.receiver = v34;
  v32.super_class = (Class)UICollectionViewListCellAccessibility;
  v15 = -[UICollectionViewListCellAccessibility automationElements](&v32, sel_automationElements);
  objc_msgSend(v14, "axSafelyAddObjectsFromArray:");

  v24 = MEMORY[0x24BDAC760];
  v25 = -1073741824;
  v26 = 0;
  v27 = __59__UICollectionViewListCellAccessibility_automationElements__block_invoke;
  v28 = &unk_24FF3EC18;
  v29 = v34;
  v30 = v33[0];
  v31 = (id)MEMORY[0x2348C3D88](&v24);
  v16 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("_accessoryManager"));
  location = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("currentConfiguration"));

  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(location, "safeArrayForKey:", CFSTR("trailingAccessories"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
  if (v18)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v18;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v22 = *(_QWORD *)(__b[1] + 8 * v12);
      (*((void (**)(id, uint64_t))v31 + 2))(v31, v22);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (!v13)
          break;
      }
    }
  }

  memset(v19, 0, sizeof(v19));
  v8 = (id)objc_msgSend(location, "safeArrayForKey:", CFSTR("leadingAccessories"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v35, 16);
  if (v9)
  {
    v5 = *(_QWORD *)v19[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)v19[2] != v5)
        objc_enumerationMutation(v8);
      v20 = *(_QWORD *)(v19[1] + 8 * v6);
      (*((void (**)(id, uint64_t))v31 + 2))(v31, v20);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v35, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v33[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v33, 0);
  return v3;
}

void __59__UICollectionViewListCellAccessibility_automationElements__block_invoke(uint64_t *a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  uint64_t v12;
  id v13[2];
  id location[2];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[1] = a1;
  v13[0] = (id)objc_msgSend(location[0], "safeStringForKey:", CFSTR("identifier"));
  memset(__b, 0, sizeof(__b));
  obj = -[UICollectionViewListCellAccessibility _axIgnoredConfigurationIdentifiers](a1[4]);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(__b[1] + 8 * v6);
      if ((objc_msgSend(v13[0], "_containsSubstring:", v12) & 1) != 0)
      {
        NSClassFromString(CFSTR("_UICellViewAccessory"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = (void *)a1[5];
          v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("view"));
          objc_msgSend(v2, "axSafelyAddObject:");

        }
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (void)accessibilityElementDidBecomeFocused
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  id v8;
  id v9;
  char v10;
  int v11[2];
  _QWORD __b[9];
  id v13;
  objc_super v14;
  SEL v15;
  UICollectionViewListCellAccessibility *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)UICollectionViewListCellAccessibility;
  -[UICollectionViewListCellAccessibility accessibilityElementDidBecomeFocused](&v14, sel_accessibilityElementDidBecomeFocused);
  v13 = (id)-[UICollectionViewListCellAccessibility safeArrayForKey:](v16, "safeArrayForKey:", CFSTR("_gestureRecognizers"));
  memset(__b, 0, 0x40uLL);
  obj = v13;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v7)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v7;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      __b[8] = *(_QWORD *)(__b[1] + 8 * v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = 0;
        objc_opt_class();
        v9 = (id)__UIAccessibilityCastAsSafeCategory();
        if ((v10 & 1) != 0)
          abort();
        v8 = v9;
        objc_storeStrong(&v9, 0);
        *(_QWORD *)v11 = v8;
        -[UIHoverGestureRecognizerAccessibility _axSetOverrideStateEnabled:forFocusedElement:](v8, 1, v16);
        objc_storeStrong((id *)v11, 0);
      }
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_storeStrong(&v13, 0);
}

- (void)_updateSystemTypeAccessoryView:(id)a3 withCellAccessory:(id)a4 orConfiguration:(id)a5 usingState:(id)a6
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  BOOL v29;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  objc_super v49;
  id v50;
  id v51;
  id v52;
  id location[2];
  UICollectionViewListCellAccessibility *v54;

  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = 0;
  objc_storeStrong(&v52, a4);
  v51 = 0;
  objc_storeStrong(&v51, a5);
  v50 = 0;
  objc_storeStrong(&v50, a6);
  v49.receiver = v54;
  v49.super_class = (Class)UICollectionViewListCellAccessibility;
  -[UICollectionViewListCellAccessibility _updateSystemTypeAccessoryView:withCellAccessory:orConfiguration:usingState:](&v49, sel__updateSystemTypeAccessoryView_withCellAccessory_orConfiguration_usingState_, location[0], v52, v51, v50);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = (id)-[UICollectionViewListCellAccessibility accessibilityIdentifier](v54, "accessibilityIdentifier");
        v47 = 0;
        v29 = 0;
        if (v28)
        {
          v48 = (id)objc_msgSend(location[0], "accessibilityIdentifier");
          v47 = 1;
          v29 = v48 == 0;
        }
        if ((v47 & 1) != 0)

        if (v29)
        {
          v27 = (id)-[UICollectionViewListCellAccessibility accessibilityIdentifier](v54, "accessibilityIdentifier");
          objc_msgSend(location[0], "setAccessibilityIdentifier:");

        }
        v25 = -[UICollectionViewListCellAccessibility accessibilityLabel](v54, "accessibilityLabel");
        v45 = 0;
        v26 = 0;
        if (v25)
        {
          v46 = (id)objc_msgSend(location[0], "accessibilityLabel");
          v45 = 1;
          v26 = v46 == 0;
        }
        if ((v45 & 1) != 0)

        if (v26)
        {
          v24 = -[UICollectionViewListCellAccessibility accessibilityLabel](v54, "accessibilityLabel");
          objc_msgSend(location[0], "setAccessibilityLabel:");

        }
        v22 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedLabel](v54, "accessibilityAttributedLabel");
        v43 = 0;
        v23 = 0;
        if (v22)
        {
          v44 = (id)objc_msgSend(location[0], "accessibilityAttributedLabel");
          v43 = 1;
          v23 = v44 == 0;
        }
        if ((v43 & 1) != 0)

        if (v23)
        {
          v21 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedLabel](v54, "accessibilityAttributedLabel");
          objc_msgSend(location[0], "setAccessibilityAttributedLabel:");

        }
        v19 = -[UICollectionViewListCellAccessibility accessibilityValue](v54, "accessibilityValue");
        v41 = 0;
        v20 = 0;
        if (v19)
        {
          v42 = (id)objc_msgSend(location[0], "accessibilityValue");
          v41 = 1;
          v20 = v42 == 0;
        }
        if ((v41 & 1) != 0)

        if (v20)
        {
          v18 = -[UICollectionViewListCellAccessibility accessibilityValue](v54, "accessibilityValue");
          objc_msgSend(location[0], "setAccessibilityValue:");

        }
        v16 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedValue](v54, "accessibilityAttributedValue");
        v39 = 0;
        v17 = 0;
        if (v16)
        {
          v40 = (id)objc_msgSend(location[0], "accessibilityAttributedValue");
          v39 = 1;
          v17 = v40 == 0;
        }
        if ((v39 & 1) != 0)

        if (v17)
        {
          v15 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedValue](v54, "accessibilityAttributedValue");
          objc_msgSend(location[0], "setAccessibilityAttributedValue:");

        }
        v13 = (id)-[UICollectionViewListCellAccessibility accessibilityHint](v54, "accessibilityHint");
        v37 = 0;
        v14 = 0;
        if (v13)
        {
          v38 = (id)objc_msgSend(location[0], "accessibilityHint");
          v37 = 1;
          v14 = v38 == 0;
        }
        if ((v37 & 1) != 0)

        if (v14)
        {
          v12 = (id)-[UICollectionViewListCellAccessibility accessibilityHint](v54, "accessibilityHint");
          objc_msgSend(location[0], "setAccessibilityHint:");

        }
        v10 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedHint](v54, "accessibilityAttributedHint");
        v35 = 0;
        v11 = 0;
        if (v10)
        {
          v36 = (id)objc_msgSend(location[0], "accessibilityAttributedHint");
          v35 = 1;
          v11 = v36 == 0;
        }
        if ((v35 & 1) != 0)

        if (v11)
        {
          v9 = (id)-[UICollectionViewListCellAccessibility accessibilityAttributedHint](v54, "accessibilityAttributedHint");
          objc_msgSend(location[0], "setAccessibilityAttributedHint:");

        }
        v7 = (id)-[UICollectionViewListCellAccessibility accessibilityUserInputLabels](v54, "accessibilityUserInputLabels");
        v33 = 0;
        v8 = 0;
        if (v7)
        {
          v34 = (id)objc_msgSend(location[0], "accessibilityUserInputLabels");
          v33 = 1;
          v8 = v34 == 0;
        }
        if ((v33 & 1) != 0)

        if (v8)
        {
          v6 = (id)-[UICollectionViewListCellAccessibility accessibilityUserInputLabels](v54, "accessibilityUserInputLabels");
          objc_msgSend(location[0], "setAccessibilityUserInputLabels:");

        }
      }
    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
}

void __95__UICollectionViewListCellAccessibility__accessibilityEnumerateCurrentConfigurationsWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  _QWORD *v11;
  id location[2];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = a1;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v8;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v4);
      if ((*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) & 1) != 0)
        break;
      if ((objc_msgSend(v10, "safeBoolForKey:", CFSTR("_isSystemType")) & 1) != 0)
        objc_msgSend(v10, "safeIntegerForKey:", CFSTR("_systemType"));
      (*(void (**)(void))(a1[4] + 16))();
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_storeStrong(location, 0);
}

@end
