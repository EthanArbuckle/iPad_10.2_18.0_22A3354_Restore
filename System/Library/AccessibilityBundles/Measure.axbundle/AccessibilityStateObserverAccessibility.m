@implementation AccessibilityStateObserverAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.AccessibilityStateObserver");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("didUpdate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("snapWorldPointType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("worldLines"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("worldRectangles"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("worldPoints"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("orderedWorldLineIDs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("snapDivisionsDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("snapDivisionsLineID"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.AccessibilityStateObserver"), CFSTR("isModeForMeasuring"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MeasureFoundation.MeasureObject"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MeasureFoundation.WorldPoint"), CFSTR("MeasureFoundation.MeasureObject"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MeasureFoundation.WorldRectangle"), CFSTR("MeasureFoundation.MeasureObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MeasureFoundation.WorldPoint"), CFSTR("lines"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MeasureFoundation.WorldLine"), CFSTR("MeasureFoundation.MeasureObject"));

}

- (id)axDescriptionForNumberOfPointsAndLines
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  unint64_t v19;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[AccessibilityStateObserverAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("worldLines"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v4);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "safeIntegerForKey:", CFSTR("state"));
        if (v11 == 9)
          ++v7;
        if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0)
          ++v8;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[AccessibilityStateObserverAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("worldPoints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v14)
  {
    v15 = v14;
    v39 = 0;
    v40 = 0;
    v16 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        v19 = objc_msgSend(v18, "safeIntegerForKey:", CFSTR("state"));
        if (v19 <= 9 && ((1 << v19) & 0x245) != 0)
        {
          v21 = v19;
          objc_msgSend(v18, "safeArrayForKey:", CFSTR("lines"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23)
          {
            if (v21 == 9)
              ++v40;
            else
              ++v39;
          }
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v15);
  }
  else
  {
    v39 = 0;
    v40 = 0;
  }

  AXMeasureSpeakableDescriptionForLastSavedMeasurement();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("DID_UPDATE_POINTS"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v26, v39 + v40, v8 + v7, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40 > 0 || v7)
    {
      v28 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("NUMBER_OF_POINTS"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v29, v40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("NUMBER_OF_LINES"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringWithFormat:", v32, v7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("WILL_CLEAR_POINTS"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v35, v30, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v36 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v36;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)axWorldLines
{
  return (id)-[AccessibilityStateObserverAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("worldLines"));
}

- (id)axWorldRectangles
{
  return (id)-[AccessibilityStateObserverAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("worldRectangles"));
}

- (id)axOrderedWorldLineIDs
{
  return (id)-[AccessibilityStateObserverAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("orderedWorldLineIDs"));
}

- (BOOL)_axHasRectangleWithState:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AccessibilityStateObserverAccessibility axWorldRectangles](self, "axWorldRectangles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "safeIntegerForKey:", CFSTR("state")) == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)axHasConfirmedRectangle
{
  return -[AccessibilityStateObserverAccessibility _axHasRectangleWithState:](self, "_axHasRectangleWithState:", 5);
}

- (BOOL)axHasSuggestedRectangle
{
  return -[AccessibilityStateObserverAccessibility _axHasRectangleWithState:](self, "_axHasRectangleWithState:", 6);
}

- (BOOL)axIsModeForMeasuring
{
  return -[AccessibilityStateObserverAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isModeForMeasuring"));
}

- (BOOL)_axNeedsAnnouncementForContinueMeasurement
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetNeedsAnnouncementForContinueMeasurement:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (int64_t)_axLastWorldPointType
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_axSetLastWorldPointType:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (id)_axLastSnapDivisionsLineID
{
  JUMPOUT(0x234913D78);
}

- (void)_axSetLastSnapDivisionsLineID:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axLastSnapDivisionsDescription
{
  JUMPOUT(0x234913D78);
}

- (void)_axSetLastSnapDivisionsDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)didUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccessibilityStateObserverAccessibility;
  -[AccessibilityStateObserverAccessibility didUpdate](&v3, sel_didUpdate);
  -[AccessibilityStateObserverAccessibility _axUpdateForState](self, "_axUpdateForState");
}

- (void)_axUpdateForState
{
  OUTLINED_FUNCTION_0(&dword_232731000, a1, a3, "Unable to get ordered world line IDs even though snap divisions line ID was present.", a5, a6, a7, a8, 0);
}

@end
