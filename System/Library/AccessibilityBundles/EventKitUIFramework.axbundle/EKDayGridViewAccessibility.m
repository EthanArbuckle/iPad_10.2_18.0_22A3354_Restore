@implementation EKDayGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDayGridView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayView"));
  objc_msgSend(v3, "validateClass:", CFSTR("EKDayViewContent"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewController"), CFSTR("currentDayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayView"), CFSTR("dayContent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayViewContent"), CFSTR("grid"), "@", 0);

}

- (BOOL)accessibilityIsPreviewGridView
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)setAccessibilityIsPreviewGridView:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (EKDayGridViewAccessibility)initWithFrame:(CGRect)a3 backgroundColor:(id)a4 opaque:(BOOL)a5 numberOfDaysToDisplay:(unint64_t)a6
{
  EKDayGridViewAccessibility *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKDayGridViewAccessibility;
  v6 = -[EKDayGridViewAccessibility initWithFrame:backgroundColor:opaque:numberOfDaysToDisplay:](&v9, sel_initWithFrame_backgroundColor_opaque_numberOfDaysToDisplay_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__accessibilityOccurrencesChanged_, CFSTR("CalendarModelDisplayedOccurrencesChangedNotification"), 0);

  return v6;
}

- (void)_axResetChildren
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EKDayGridViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      v14 = v3;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        objc_msgSend(v6, "setAccessibilityContainer:", 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setAccessibilityDelegate:", 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "setDayGrid:", 0);
          objc_msgSend(v6, "children");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v17;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v17 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v12, "setDayGridView:", 0);
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v9);
          }

          v3 = v14;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v3);
  }

  -[EKDayGridViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (BOOL)_accessibilityHideEmptyHours
{
  void *v2;
  BOOL v3;

  -[EKDayGridViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("_NCWidgetViewControllerView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  EKDayGridViewAccessibility *v5;
  EKDayGridViewAccessibility *v6;
  BOOL v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  MobileCalHourAccessibilityElement *v36;
  MobileCalDayPlaceholderElement *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  id v63;
  void *v64;
  unint64_t v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  EKDayGridViewAccessibility *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  id v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  MobileCalDayPlaceholderElement *v120;
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  -[EKDayGridViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("currentDayView.dayContent.grid"));
  v5 = (EKDayGridViewAccessibility *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = v5 == self;
  else
    v7 = 1;
  if (v7)
  {
    v8 = (_QWORD *)MEMORY[0x24BEBB308];
    -[EKDayGridViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = v10;
LABEL_77:

      goto LABEL_78;
    }
    v10 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    -[EKDayGridViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v10, *v8);
    -[EKDayGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      NSClassFromString(CFSTR("EKDayViewContent"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _AXAssert();
        v11 = 0;
LABEL_76:

        goto LABEL_77;
      }
    }
    objc_msgSend(v12, "safeValueForKey:", CFSTR("_dayStarts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        _AXAssert();
        goto LABEL_73;
      }
      buf[0] = 0;
      objc_opt_class();
      objc_msgSend(v13, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "date");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _AXAssert();

LABEL_73:
        v11 = 0;
        goto LABEL_75;
      }
    }
    else
    {
      buf[0] = 0;
      objc_opt_class();
      objc_msgSend(v12, "safeValueForKey:", CFSTR("_startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "date");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!v11)
    {
      _AXAssert();
      goto LABEL_75;
    }
    v91 = v6;
    v92 = v4;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "components:fromDate:", 62, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHour:", 0);
    v95 = v21;
    v88 = v22;
    objc_msgSend(v21, "dateFromComponents:", v22);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v104 = -[EKDayGridViewAccessibility _accessibilityHideEmptyHours](self, "_accessibilityHideEmptyHours");
    v89 = v13;
    v23 = objc_msgSend(v13, "count");
    v90 = v12;
    objc_msgSend(v12, "safeValueForKey:", CFSTR("occurrenceViews"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v23;
    v99 = v10;
    if (v23 >= 1)
    {
      v24 = 0;
      do
      {
        v25 = (void *)objc_msgSend(objc_allocWithZone((Class)MobileCalDayContainerAccessibilityElement), "initWithAccessibilityContainer:", self);
        v26 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(v26, "setDay:", v24);
        objc_msgSend(v95, "dateByAddingComponents:toDate:options:", v26, v96, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          AXLogAppAccessibility();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v122 = v96;
            v123 = 2112;
            v124 = v26;
            _os_log_error_impl(&dword_2325DB000, v28, OS_LOG_TYPE_ERROR, "Unable to get date from start date %@ adding date components %@", buf, 0x16u);
          }

          objc_msgSend(v96, "dateByAddingTimeInterval:", (double)(86400 * v24));
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v108 = v26;
        objc_msgSend(v25, "setDate:", v27);
        objc_msgSend(v25, "setIndexInArray:", v24);
        objc_msgSend(v25, "setDayGrid:", self);
        objc_msgSend(v10, "addObject:", v25);
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = (void *)v27;
        objc_msgSend(v29, "components:fromDate:", 62, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 24);
        v32 = 0;
        v33 = 0;
        do
        {
          objc_msgSend(v30, "setHour:", v32);
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "dateFromComponents:", v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v35, "isEqualToDate:", v33) & 1) == 0)
          {
            v36 = -[MobileCalHourAccessibilityElement initWithAccessibilityContainer:]([MobileCalHourAccessibilityElement alloc], "initWithAccessibilityContainer:", v25);
            -[MobileCalHourAccessibilityElement setHourDate:](v36, "setHourDate:", v35);
            -[MobileCalHourAccessibilityElement setIsAccessibilityElement:](v36, "setIsAccessibilityElement:", !v104);
            -[MobileCalHourAccessibilityElement setDayGridView:](v36, "setDayGridView:", self);
            objc_msgSend(v31, "addObject:", v36);

          }
          ++v32;
          v33 = v35;
        }
        while (v32 != 24);
        objc_msgSend(v25, "setChildren:", v31);
        if (v104 && !objc_msgSend(v100, "count"))
        {
          v37 = -[MobileCalDayPlaceholderElement initWithAccessibilityContainer:]([MobileCalDayPlaceholderElement alloc], "initWithAccessibilityContainer:", v25);
          accessibilityLocalizedString(CFSTR("no.events.today"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[MobileCalDayPlaceholderElement setAccessibilityLabel:](v37, "setAccessibilityLabel:", v38);

          v120 = v37;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v39, "mutableCopy");
          objc_msgSend(v25, "setChildren:", v40);

        }
        ++v24;
        v10 = v99;
      }
      while (v24 != v102);
    }
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v41 = v100;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
    if (!v42)
    {
LABEL_71:

      v11 = v10;
      v6 = v91;
      v4 = v92;
      v13 = v89;
      v12 = v90;
LABEL_75:

      goto LABEL_76;
    }
    v43 = v42;
    v44 = *(_QWORD *)v115;
    v97 = v41;
    v98 = *(_QWORD *)v115;
LABEL_33:
    v45 = 0;
    v101 = v43;
    while (1)
    {
      if (*(_QWORD *)v115 != v44)
        objc_enumerationMutation(v41);
      v46 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v45);
      if (!objc_msgSend(v46, "isAccessibilityElement"))
        goto LABEL_69;
      objc_msgSend(v46, "safeValueForKey:", CFSTR("occurrence"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
        break;
LABEL_68:

LABEL_69:
      if (++v45 == v43)
      {
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
        if (!v43)
          goto LABEL_71;
        goto LABEL_33;
      }
    }
    objc_msgSend(v47, "startDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      _AXAssert();
LABEL_67:

      goto LABEL_68;
    }
    v105 = v48;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v49;
    objc_msgSend(v50, "components:fromDate:", 62, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v109 = v51;
    v52 = (void *)objc_msgSend(v51, "copyWithZone:", 0);
    objc_msgSend(v52, "setHour:", 0);
    objc_msgSend(v52, "setMinute:", 0);
    objc_msgSend(v52, "setSecond:", 0);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v52;
    objc_msgSend(v53, "dateFromComponents:", v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v55 = v10;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v111;
LABEL_41:
      v59 = 0;
      while (1)
      {
        if (*(_QWORD *)v111 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v59);
        objc_msgSend(v60, "date");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v54, "isEqualToDate:", v61);

        if ((v62 & 1) != 0)
          break;
        if (v57 == ++v59)
        {
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
          if (!v57)
          {
            v63 = v55;
            v10 = v99;
            v43 = v101;
            v41 = v97;
            v44 = v98;
            goto LABEL_65;
          }
          goto LABEL_41;
        }
      }
      v63 = v60;

      v10 = v99;
      v43 = v101;
      v41 = v97;
      v44 = v98;
      v49 = v107;
      if (!v63)
        goto LABEL_66;
      objc_msgSend(v63, "children");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        v65 = objc_msgSend(v109, "hour");
        v66 = v65 >= objc_msgSend(v64, "count");
        v43 = v101;
        if (!v66)
        {
          objc_msgSend(v64, "objectAtIndex:", objc_msgSend(v109, "hour"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v46, "setAccessibilityContainer:", v63);
            buf[0] = 0;
            objc_opt_class();
            __UIAccessibilityCastAsSafeCategory();
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (buf[0])
              goto LABEL_79;
            v69 = v68;
            objc_msgSend(v68, "_axSetDropPointDescriptorsProvider:", v67);

            objc_msgSend(v64, "replaceObjectAtIndex:withObject:", objc_msgSend(v109, "hour"), v46);
          }
          else
          {
            objc_opt_class();
            v70 = v67;
            v94 = v67;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v46, "setAccessibilityContainer:", v67);
              buf[0] = 0;
              objc_opt_class();
              objc_msgSend(v67, "children");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "firstObject");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilityCastAsSafeCategory();
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (buf[0])
                goto LABEL_79;
              objc_msgSend(v73, "_axDropPointDescriptorsProvider");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              buf[0] = 0;
              objc_opt_class();
              __UIAccessibilityCastAsSafeCategory();
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (buf[0])
                goto LABEL_79;
              v76 = v75;
              objc_msgSend(v75, "_axSetDropPointDescriptorsProvider:", v74);

              v67 = v94;
              objc_msgSend(v94, "children");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "addObject:", v46);

              v43 = v101;
            }
            else
            {
              v78 = (void *)objc_msgSend(objc_allocWithZone((Class)MobileCalOccurrencyContainerAccessibilityElement), "initWithAccessibilityContainer:", v63);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "setChildren:", v79);

              objc_msgSend(v70, "setAccessibilityContainer:", v78);
              objc_msgSend(v78, "children");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "addObject:", v70);

              v93 = v78;
              objc_msgSend(v46, "setAccessibilityContainer:", v78);
              buf[0] = 0;
              objc_opt_class();
              __UIAccessibilityCastAsSafeCategory();
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              if (buf[0]
                || (v82 = v81,
                    objc_msgSend(v81, "_axDropPointDescriptorsProvider"),
                    v83 = (void *)objc_claimAutoreleasedReturnValue(),
                    buf[0] = 0,
                    objc_opt_class(),
                    __UIAccessibilityCastAsSafeCategory(),
                    v84 = (void *)objc_claimAutoreleasedReturnValue(),
                    buf[0]))
              {
LABEL_79:
                abort();
              }
              v85 = v84;
              objc_msgSend(v84, "_axSetDropPointDescriptorsProvider:", v83);

              objc_msgSend(v93, "children");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "addObject:", v46);

              objc_msgSend(v64, "replaceObjectAtIndex:withObject:", objc_msgSend(v109, "hour"), v93);
              v43 = v101;
              v67 = v94;
            }
          }

          v44 = v98;
        }
      }

    }
    else
    {
      v63 = v55;
    }
LABEL_65:

    v49 = v107;
LABEL_66:

    v48 = v105;
    goto LABEL_67;
  }
  v11 = 0;
LABEL_78:

  return v11;
}

uint64_t __51__EKDayGridViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("EKDayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EKDayGridViewAccessibility _axResetChildren](self, "_axResetChildren");
  v4.receiver = self;
  v4.super_class = (Class)EKDayGridViewAccessibility;
  -[EKDayGridViewAccessibility dealloc](&v4, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
