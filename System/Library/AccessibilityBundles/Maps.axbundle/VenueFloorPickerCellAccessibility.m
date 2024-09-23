@implementation VenueFloorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VenueFloorPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorPickerCell"), CFSTR("floorName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorPickerCell"), CFSTR("floorOrdinal"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorPickerCell"), CFSTR("isUserLocation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorPickerCell"), CFSTR("lacksSearchResults"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorViewController"), CFSTR("isOpen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorViewController"), CFSTR("venue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKVenueFeatureMarker"), CFSTR("buildings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKVenueBuildingFeatureMarker"), CFSTR("floorNames"), "@", 0);

}

- (id)_axVenueFloorViewController
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[VenueFloorPickerCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[VenueFloorPickerCellAccessibility _axVenueFloorViewController](self, "_axVenueFloorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isOpen")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isSelected");

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return !-[VenueFloorPickerCellAccessibility isAccessibilityElement](self, "isAccessibilityElement");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[VenueFloorPickerCellAccessibility _axVenueFloorViewController](self, "_axVenueFloorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("venue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_opt_class();
  v23 = v4;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("buildings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v29 = 0;
        objc_opt_class();
        objc_msgSend(v11, "safeValueForKey:", CFSTR("floorNames"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
LABEL_20:
          abort();
        -[VenueFloorPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("floorOrdinal"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v29 = 0;
          objc_opt_class();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            goto LABEL_20;
          if (v16)
          {

            goto LABEL_15;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[VenueFloorPickerCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("floorName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  if (-[VenueFloorPickerCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUserLocation")))
  {
    AXMapsLocString(CFSTR("CURRENT_FLOOR"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  if (-[VenueFloorPickerCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("lacksSearchResults"), v20, v22))
  {
    AXMapsLocString(CFSTR("NO_POIS_ON_FLOOR"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }

  return v16;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VenueFloorPickerCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[VenueFloorPickerCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[VenueFloorPickerCellAccessibility _axVenueFloorViewController](self, "_axVenueFloorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isOpen"));

  if (v5)
    v6 = -1;
  else
    v6 = ~*MEMORY[0x24BDF7400];
  return v6 & v3;
}

@end
