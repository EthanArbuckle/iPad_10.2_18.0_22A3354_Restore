@implementation WeekAllDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeekAllDayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("_dayWidth"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("firstEventYOffset"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("_dayIndexForToday"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekAllDayView"), CFSTR("setOccurrences:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekAllDayView"), CFSTR("_dayStarts"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekAllDayView"), CFSTR("_layedOutRows"), "NSMutableArray");

}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WeekAllDayViewAccessibility;
  -[WeekAllDayViewAccessibility setOccurrences:animated:](&v5, sel_setOccurrences_animated_, a3, a4);
  -[WeekAllDayViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t i;
  WeekAllDayDayContainerAccessibilityElement *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  WeekAllDayLabelAccessibilityElement *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  WeekAllDayViewAccessibility *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[WeekAllDayViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v44 = self;
    -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayStarts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v4;
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        v7 = -[WeekAllDayDayContainerAccessibilityElement initWithAccessibilityContainer:]([WeekAllDayDayContainerAccessibilityElement alloc], "initWithAccessibilityContainer:", self);
        -[WeekAllDayDayContainerAccessibilityElement setDayIndex:](v7, "setDayIndex:", i);
        objc_msgSend(v4, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WeekAllDayDayContainerAccessibilityElement setDate:](v7, "setDate:", v9);

        -[WeekAllDayDayContainerAccessibilityElement setAllDayView:](v7, "setAllDayView:", self);
        objc_msgSend(v3, "addObject:", v7);

      }
      if (v5 > 1)
      {
        -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayWidth"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");

        -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bounds"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "CGRectValue");

        -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("firstEventYOffset"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");

        -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayIndexForToday"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v13, "integerValue");

        for (j = 0; j != v5; ++j)
        {
          objc_msgSend(v3, "objectAtIndex:", j);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndex:", j);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[WeekAllDayLabelAccessibilityElement initWithAccessibilityContainer:]([WeekAllDayLabelAccessibilityElement alloc], "initWithAccessibilityContainer:", v15);
          objc_msgSend(v16, "date");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          _AXGetStringsForDate(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WeekAllDayLabelAccessibilityElement setAccessibilityLabel:](v17, "setAccessibilityLabel:", v19);

          if (v48 == j)
          {
            accessibilityLocalizedString(CFSTR("today.indicator"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[WeekAllDayLabelAccessibilityElement accessibilityLabel](v17, "accessibilityLabel");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAXStringForVariables();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[WeekAllDayLabelAccessibilityElement setAccessibilityLabel:](v17, "setAccessibilityLabel:", v22, v21, CFSTR("__AXStringForVariablesSentinel"));

          }
          if ((EKUICurrentWidthSizeClassIsCompactInViewHierarchy() & 1) != 0)
          {
            objc_msgSend(v16, "day");
            AXFormatInteger();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v16, "date");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x2349148A0]();
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v25 = (void *)MEMORY[0x24BDBCE30];
          -[WeekAllDayLabelAccessibilityElement accessibilityLabel](v17, "accessibilityLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "axArrayByIgnoringNilElementsWithCount:", 2, v23, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WeekAllDayLabelAccessibilityElement setAccessibilityUserInputLabels:](v17, "setAccessibilityUserInputLabels:", v27);

          -[WeekAllDayLabelAccessibilityElement setDayIndex:](v17, "setDayIndex:", j);
          -[WeekAllDayLabelAccessibilityElement setAllDayView:](v17, "setAllDayView:", self);
          objc_msgSend(v15, "children");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v17);

          v4 = v43;
        }
      }
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[WeekAllDayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layedOutRows"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v55;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v55 != v46)
            objc_enumerationMutation(obj);
          v49 = v29;
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v29);
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v30, "safeValueForKey:", CFSTR("occurrenceBlocks"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v51;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v51 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
                objc_msgSend(v36, "safeValueForKey:", CFSTR("occurrenceView"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "safeValueForKey:", CFSTR("rangeStart"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "integerValue");

                objc_msgSend(v3, "objectAtIndex:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "children");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addObject:", v37);

                objc_msgSend(v37, "setAccessibilityContainer:", v40);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            }
            while (v33);
          }

          v29 = v49 + 1;
        }
        while (v49 + 1 != v47);
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v47);
    }

    -[WeekAllDayViewAccessibility _accessibilitySetRetainedValue:forKey:](v44, "_accessibilitySetRetainedValue:forKey:", v3, *MEMORY[0x24BEBB308]);
  }
  return v3;
}

@end
