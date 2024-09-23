@implementation UITableViewIndexAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewIndex");
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
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("_sendActionsForEvents:withEvent:"), "v", "Q", "@", 0);
  v6 = CFSTR("UITableViewIndex");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, v7, 0);
  v4 = "q";
  v3 = CFSTR("_sectionIndexChangedToIndex:title:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), "q", v7, 0);
  v5 = CFSTR("UITableView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_sectionIndexTitlesForTableView"), "NSArray");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v6, CFSTR("UIView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("titles"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_displayTitles"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilityIndexData
{
  id v2;
  id v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    v2 = (id)objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    if (!v2)
    {
      v2 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");

      objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXInternalData"));
    }
    v4 = v2;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)_accessibilityTableIndexAdjustment
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  char v7;
  id location[3];
  int64_t v9;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewIndexAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v6 = (id)objc_msgSend(location[0], "delegate");
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v4 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("delegate"));
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityTableViewIndexAdjustment"));
    v5 = objc_msgSend(v3, "integerValue");

    v9 = v5;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)_accessibilityTableIndexTitles
{
  return (id)-[UITableViewIndexAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("titles"), a2, self);
}

- (void)_accessibilityJumpToTableIndex:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id location[2];
  UITableViewIndexAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v11 = objc_msgSend(location[0], "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v12 = v3;
    v4 = (id)objc_msgSend(location[0], "substringWithRange:", v11, v3);
    v5 = location[0];
    location[0] = v4;

  }
  v10 = (id)-[UITableViewIndexAccessibility safeArrayForKey:](v14, "safeArrayForKey:", CFSTR("titles"));
  v7 = (id)objc_msgSend(location[0], "uppercaseString");
  v8 = objc_msgSend(v10, "indexOfObject:");

  v9 = (void *)v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL
    || (v6 = (id)objc_msgSend(location[0], "lowercaseString"),
        v9 = (void *)objc_msgSend(v10, "indexOfObject:"),
        v6,
        v9 != (void *)0x7FFFFFFFFFFFFFFFLL))
  {
    -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v14, v9);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityMoveToIndexAtPosition:(void *)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11[2];
  id v12[2];
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;

  v24 = a1;
  v23 = a2;
  if (a1)
  {
    v22 = -[UITableViewIndexAccessibility _accessibilityIndexData](v24);
    v21 = (id)objc_msgSend(v24, "safeArrayForKey:", CFSTR("titles"));
    v20 = (unint64_t)v23 + objc_msgSend(v24, "_accessibilityTableIndexAdjustment");
    if ((uint64_t)v23 < 0 || (uint64_t)v23 >= objc_msgSend(v21, "count"))
    {
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], 0);
    }
    else
    {
      v19 = 0;
      if (v20 < objc_msgSend(v21, "count"))
      {
        v2 = (id)objc_msgSend(v21, "objectAtIndex:", v20);
        v3 = v19;
        v19 = v2;

      }
      v18 = -[UITableViewIndexAccessibility _accessibilityValueToPost:]((uint64_t)v24, v19);
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
      objc_msgSend(v22, "setObject:forKey:");

      v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
      objc_msgSend(v24, "setValue:forKey:");

      v12[1] = (id)MEMORY[0x24BDAC760];
      v13 = -1073741824;
      v14 = 0;
      v15 = __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke;
      v16 = &unk_24FF3DA40;
      v17 = v24;
      AXPerformSafeBlock();
      v8 = (id)objc_msgSend(v24, "traitCollection");
      v9 = objc_msgSend(v8, "userInterfaceIdiom") != 3;

      if (!v9)
      {
        v12[0] = (id)objc_msgSend(v24, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_40, 0);
        if (v12[0])
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v10 = v12[0];
            v11[1] = v23;
            v11[0] = v18;
            AXPerformSafeBlock();
            objc_storeStrong(v11, 0);
            objc_storeStrong(&v10, 0);
          }
        }
        objc_storeStrong(v12, 0);
      }
      v4 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v18);
      v5 = v18;
      v18 = v4;

      objc_msgSend(v18, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEAC0]);
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], v18);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
}

- (void)_accessibilityBumpValue:(void *)a1
{
  id v2;
  uint64_t v3;
  id location;
  char v5;
  void *v6;

  v6 = a1;
  v5 = a2 & 1;
  if (a1)
  {
    location = -[UITableViewIndexAccessibility _accessibilityIndexData](v6);
    v2 = (id)objc_msgSend(location, "objectForKey:", CFSTR("position"));
    v3 = objc_msgSend(v2, "integerValue");

    if ((v5 & 1) != 0)
      -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v6, (void *)(v3 + 1));
    else
      -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v6, (void *)(v3 - 1));
    objc_storeStrong(&location, 0);
  }
}

- (id)_accessibilityValueToPost:(uint64_t)a1
{
  id v2;
  id v3;
  id v5;
  int v6;
  id location;
  uint64_t v8;
  id v9;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    v5 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
    if (!objc_msgSend(v5, "length"))
    {
      if ((objc_msgSend(location, "isEqualToString:", *MEMORY[0x24BDF7DF0]) & 1) != 0)
        v2 = accessibilityLocalizedString(CFSTR("search.button"));
      else
        v2 = (id)objc_msgSend(location, "lowercaseString");
      v3 = v5;
      v5 = v2;

    }
    v9 = v5;
    v6 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v9 = 0;
    v6 = 1;
  }
  objc_storeStrong(&location, 0);
  return v9;
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendActionsForEvents:withEvent:", 4096, 0, a1, a1);
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke_2(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionIndexChangedToIndex:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)accessibilityIncrement
{
  -[UITableViewIndexAccessibility _accessibilityBumpValue:](self, 0);
}

- (void)accessibilityDecrement
{
  -[UITableViewIndexAccessibility _accessibilityBumpValue:](self, 1);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[UITableViewIndexAccessibility bounds](self, "bounds", 0, 0, 0, 0, a2);
  UIAccessibilityPointForPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)_axDetermineTableCellLabel:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id location[3];
  id v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (id)objc_msgSend(location[0], "accessibilityLabel");
  if (!objc_msgSend(v9, "length"))
  {
    v3 = (id)objc_msgSend(location[0], "accessibilityValue");
    v4 = v9;
    v9 = v3;

  }
  if (!objc_msgSend(v9, "length"))
  {
    v8 = (id)objc_msgSend(location[0], "textLabel");
    v5 = (id)objc_msgSend(v8, "text");
    v6 = v9;
    v9 = v5;

  }
  if (objc_msgSend(v9, "length"))
    v11 = (id)objc_msgSend(v9, "lowercaseString");
  else
    v11 = 0;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)accessibilityFlowToElements
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  UITableViewIndexAccessibility *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unsigned __int16 v52;
  id v53;
  id v54;
  uint64_t v55;
  unsigned __int16 v56;
  id v57;
  id v58;
  uint64_t v59;
  double v60;
  id v61;
  _QWORD v62[8];
  id v63;
  id v64;
  id v65;
  id v66[5];
  _QWORD v67[8];
  id v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  id v77;
  id v78;
  id v79;
  CGRect v80;
  double v81;
  _QWORD __b[8];
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  unsigned __int16 v87;
  id v88;
  CGRect v89;
  double v90;
  id obj;
  uint64_t i;
  uint64_t v93;
  id v94;
  unsigned __int16 v95;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  int v100;
  id location;
  CGRect rect;
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107[2];
  double v108;
  double v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113[2];
  UITableViewIndexAccessibility *v114;
  id v115;
  id v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  id v120;
  _QWORD v121[2];
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v121[1] = *MEMORY[0x24BDAC8D0];
  v114 = self;
  v113[1] = (id)a2;
  v113[0] = (id)-[UITableViewIndexAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  if ((objc_msgSend(v113[0], "isAccessibilityOpaqueElementProvider") & 1) != 0)
  {
    objc_msgSend(v113[0], "_accessibilityVisibleContentInset");
    v109 = v2;
    v110 = v3;
    v111 = v4;
    v112 = v5;
    objc_msgSend(v113[0], "_accessibilityContentOffset");
    v107[1] = v6;
    v108 = v7;
    v107[0] = (id)objc_msgSend(v113[0], "tableHeaderView");
    if (!v107[0])
      goto LABEL_8;
    objc_msgSend(v113[0], "adjustedContentInset");
    v103 = v8;
    v104 = v9;
    v105 = v10;
    v106 = v11;
    v60 = v8 + v108;
    objc_msgSend(v107[0], "frame");
    rect = v122;
    if (v60 >= CGRectGetMaxY(v122))
      goto LABEL_8;
    location = (id)objc_msgSend(v107[0], "_accessibilityUnignoredDescendant", v60);
    if (location)
    {
      v121[0] = location;
      v115 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 1);
      v100 = 1;
    }
    else
    {
      v100 = 0;
    }
    objc_storeStrong(&location, 0);
    if (!v100)
    {
LABEL_8:
      v99 = (id)objc_msgSend(v113[0], "safeArrayForKey:", CFSTR("_sectionIndexTitlesForTableView"));
      v98 = -[UITableViewIndexAccessibility _accessibilityIndexData](v114);
      v58 = (id)objc_msgSend(v98, "objectForKey:", CFSTR("position"));
      v59 = objc_msgSend(v58, "integerValue");

      v97 = v59;
      if (objc_msgSend(v99, "count") && v97 >= 0 && v97 < (unint64_t)objc_msgSend(v99, "count"))
      {
        v57 = (id)objc_msgSend(v99, "objectAtIndexedSubscript:", v97);
        v96 = (id)objc_msgSend(v57, "lowercaseString");

        v95 = 0;
        if (objc_msgSend(v96, "length"))
          v56 = objc_msgSend(v96, "characterAtIndex:", 0);
        else
          v56 = 0;
        v95 = v56;
        if (v56)
        {
          v94 = 0;
          v54 = (id)objc_msgSend(v113[0], "visibleCells");
          v55 = objc_msgSend(v54, "count");

          v93 = v55;
          if (v55)
          {
            for (i = 0; i < v93; ++i)
            {
              v53 = (id)objc_msgSend(v113[0], "visibleCells");
              obj = (id)objc_msgSend(v53, "objectAtIndexedSubscript:", i);

              v90 = 0.0;
              objc_msgSend(obj, "frame");
              v89 = v123;
              v90 = CGRectGetMinY(v123) - v108;
              if (v90 < v109
                || ((v88 = -[UITableViewIndexAccessibility _axDetermineTableCellLabel:](v114, "_axDetermineTableCellLabel:", obj), v87 = 0, !objc_msgSend(v88, "length"))? (v52 = 0): (v52 = objc_msgSend(v88, "characterAtIndex:", 0)), (v87 = v52) == 0 || v87 != v95? (v87 <= (int)v95? (v100 = 0): (v100 = 2)): (objc_storeStrong(&v94, obj), v100 = 2), objc_storeStrong(&v88, 0), !v100))
              {
                v100 = 0;
              }
              objc_storeStrong(&obj, 0);
              if (v100)
                break;
            }
            if (!v94)
            {
              v86 = 0;
              if (i)
                v51 = i - 1;
              else
                v51 = 0;
              v86 = v51;
              v50 = (id)objc_msgSend(v113[0], "visibleCells");
              v12 = (id)objc_msgSend(v50, "objectAtIndexedSubscript:", v51);
              v13 = v94;
              v94 = v12;

            }
            v85 = (id)objc_msgSend(v94, "_accessibilityFindDescendant:", &__block_literal_global_246);
            if (v85)
            {
              v120 = v85;
              v115 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
            }
            else
            {
              v115 = MEMORY[0x24BDBD1A8];
            }
            v100 = 1;
            objc_storeStrong(&v85, 0);
          }
          else
          {
            v115 = MEMORY[0x24BDBD1A8];
            v100 = 1;
          }
          objc_storeStrong(&v94, 0);
        }
        else
        {
          v115 = MEMORY[0x24BDBD1A8];
          v100 = 1;
        }
        objc_storeStrong(&v96, 0);
      }
      else
      {
        v84 = 0;
        memset(__b, 0, sizeof(__b));
        v48 = (id)objc_msgSend(v113[0], "visibleCells");
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", __b, v119, 16);
        if (v49)
        {
          v45 = *(_QWORD *)__b[2];
          v46 = 0;
          v47 = v49;
          while (1)
          {
            v44 = v46;
            if (*(_QWORD *)__b[2] != v45)
              objc_enumerationMutation(v48);
            v83 = *(id *)(__b[1] + 8 * v46);
            objc_msgSend(v83, "frame");
            v80 = v124;
            v81 = CGRectGetMinY(v124) - v108;
            if (v81 >= v109)
              break;
            ++v46;
            if (v44 + 1 >= v47)
            {
              v46 = 0;
              v47 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", __b, v119, 16);
              if (!v47)
                goto LABEL_53;
            }
          }
          objc_storeStrong(&v84, v83);
          v100 = 5;
        }
        else
        {
LABEL_53:
          v100 = 0;
        }

        v79 = (id)objc_msgSend(v84, "_accessibilityFindDescendant:", &__block_literal_global_247);
        if (v79 == v114)
        {
          v78 = (id)objc_msgSend(v113[0], "_accessibilitySortedElementsWithin");
          v42 = (UITableViewIndexAccessibility *)(id)objc_msgSend(v78, "firstObject");
          v43 = 0;
          if (v42 == v114)
            v43 = (unint64_t)objc_msgSend(v78, "count") > 1;

          if (v43)
          {
            v41 = (id)objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
            v14 = (id)objc_msgSend(v41, "_accessibilityUnignoredDescendant");
            v15 = v79;
            v79 = v14;

          }
          objc_storeStrong(&v78, 0);
        }
        v115 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v79);
        v100 = 1;
        objc_storeStrong(&v79, 0);
        objc_storeStrong(&v84, 0);
      }
      objc_storeStrong(&v98, 0);
      objc_storeStrong(&v99, 0);
    }
    objc_storeStrong(v107, 0);
  }
  else
  {
    v77 = (id)objc_msgSend(v113[0], "safeValueForKey:", CFSTR("_accessibilityVisibleHeaderSections"));
    if (!objc_msgSend(v77, "count"))
      goto LABEL_74;
    objc_msgSend(v113[0], "adjustedContentInset");
    v72 = v16;
    v73 = v17;
    v74 = v18;
    v75 = v19;
    v76 = v16;
    objc_msgSend(v113[0], "contentOffset");
    v69 = v20;
    v70 = v21;
    v71 = v21;
    memset(v67, 0, sizeof(v67));
    v39 = v77;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", v67, v118, 16);
    if (v40)
    {
      v36 = *(_QWORD *)v67[2];
      v37 = 0;
      v38 = v40;
      while (1)
      {
        v35 = v37;
        if (*(_QWORD *)v67[2] != v36)
          objc_enumerationMutation(v39);
        v68 = *(id *)(v67[1] + 8 * v37);
        objc_msgSend(v113[0], "rectForHeaderInSection:", -[UITableViewSectionElement section]((uint64_t)v68));
        v66[1] = v22;
        v66[2] = v23;
        v66[3] = v24;
        v66[4] = v25;
        if (*(double *)&v23 - (v71 + v76) >= 0.0)
          break;
        ++v37;
        if (v35 + 1 >= v38)
        {
          v37 = 0;
          v38 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", v67, v118, 16);
          if (!v38)
            goto LABEL_72;
        }
      }
      v66[0] = v68;
      v33 = (void *)MEMORY[0x24BDBCEB8];
      v34 = -[UITableViewSectionElement accessibilityChildren]((id *)v66[0]);
      v65 = (id)objc_msgSend(v33, "arrayWithArray:");

      objc_msgSend(v65, "insertObject:atIndex:", v66[0], 0);
      v115 = v65;
      v100 = 1;
      objc_storeStrong(&v65, 0);
      objc_storeStrong(v66, 0);
    }
    else
    {
LABEL_72:
      v100 = 0;
    }

    if (!v100)
    {
LABEL_74:
      v64 = (id)objc_msgSend(v113[0], "safeValueForKey:", CFSTR("_accessibilityUserTestingVisibleCells"));
      if (!objc_msgSend(v64, "count"))
        goto LABEL_88;
      memset(v62, 0, sizeof(v62));
      v31 = v64;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", v62, v117, 16);
      if (v32)
      {
        v28 = *(_QWORD *)v62[2];
        v29 = 0;
        v30 = v32;
        while (1)
        {
          v27 = v29;
          if (*(_QWORD *)v62[2] != v28)
            objc_enumerationMutation(v31);
          v63 = *(id *)(v62[1] + 8 * v29);
          if ((objc_msgSend(v63, "_accessibilityIsFrameOutOfBounds") & 1) == 0)
          {
            v61 = (id)objc_msgSend(v63, "_accessibilityUnignoredDescendant");
            if (v61)
            {
              v116 = v61;
              v115 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
              v100 = 1;
            }
            else
            {
              v100 = 10;
            }
            objc_storeStrong(&v61, 0);
            if (v100 != 10)
              break;
          }
          ++v29;
          if (v27 + 1 >= v30)
          {
            v29 = 0;
            v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", v62, v117, 16);
            if (!v30)
              goto LABEL_86;
          }
        }
      }
      else
      {
LABEL_86:
        v100 = 0;
      }

      if (!v100)
      {
LABEL_88:
        v115 = 0;
        v100 = 1;
      }
      objc_storeStrong(&v64, 0);
    }
    objc_storeStrong(&v77, 0);
  }
  objc_storeStrong(v113, 0);
  return v115;
}

uint64_t __60__UITableViewIndexAccessibility_accessibilityFlowToElements__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "isAccessibilityElement");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __60__UITableViewIndexAccessibility_accessibilityFlowToElements__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "isAccessibilityElement");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  char v30;
  id v31;
  id location[2];
  UITableViewIndexAccessibility *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  v29.receiver = v33;
  v29.super_class = (Class)UITableViewIndexAccessibility;
  v30 = -[UITableViewIndexAccessibility _updateSectionForTouch:withEvent:](&v29, sel__updateSectionForTouch_withEvent_, location[0], v31);
  if (v30)
  {
    v28 = (id)-[UITableViewIndexAccessibility safeValueForKey:](v33, "safeValueForKey:", CFSTR("selectedSectionTitle"));
    v27 = (id)-[UITableViewIndexAccessibility _accessibilityViewAncestorIsKindOf:](v33, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v19 = (id)objc_msgSend(v27, "delegate");
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v26 = (id)-[UITableViewIndexAccessibility safeArrayForKey:](v33, "safeArrayForKey:", CFSTR("titles"));
      v17 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("delegate"));
      v16 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("_accessibilityTableViewIndexAdjustment"));
      v18 = objc_msgSend(v16, "integerValue");

      v25 = v18;
      if (v18 > 0)
      {
        v14 = (id)-[UITableViewIndexAccessibility safeValueForKey:](v33, "safeValueForKey:", CFSTR("_selectedSection"));
        v15 = objc_msgSend(v14, "integerValue");

        v24 = v15;
        if (v15 + v25 < (unint64_t)objc_msgSend(v26, "count"))
        {
          v4 = (id)objc_msgSend(v26, "objectAtIndex:", v24 + v25);
          v5 = v28;
          v28 = v4;

        }
      }
      objc_storeStrong(&v26, 0);
    }
    if (objc_msgSend(v28, "length") && v28 != (id)_updateSectionForTouch_withEvent__LastLetter)
    {
      v23 = -[UITableViewIndexAccessibility _accessibilityValueToPost:]((uint64_t)v33, v28);
      v6 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v23);
      v7 = v23;
      v23 = v6;

      objc_msgSend(v23, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEAC0]);
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], v23);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong((id *)&_updateSectionForTouch_withEvent__LastLetter, v28);
    v22 = -[UITableViewIndexAccessibility _accessibilityIndexData](v33);
    v10 = (id)-[UITableViewIndexAccessibility safeValueForKey:](v33, "safeValueForKey:", CFSTR("_selectedSection"));
    v11 = objc_msgSend(v10, "integerValue");

    v12 = v22;
    v13 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    objc_msgSend(v12, "setObject:forKey:");

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  v9 = v30;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("section.index.label"));
}

- (id)accessibilityUserInputLabels
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v6 = accessibilityLocalizedString(CFSTR("section.index.label"));
  v8[0] = v6;
  v5 = accessibilityLocalizedString(CFSTR("scroll.bar"));
  v8[1] = v5;
  v3 = -[UITableViewIndexAccessibility _accessibilityDisplayTitle](self, "_accessibilityDisplayTitle");
  v8[2] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);

  return v4;
}

- (id)_accessibilityDisplayTitle
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  id v14;
  _QWORD __b[8];
  id v16;
  id v17;
  id v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18[2] = self;
  v18[1] = (id)a2;
  v18[0] = (id)-[UITableViewIndexAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_displayTitles"));
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  memset(__b, 0, sizeof(__b));
  obj = v18[0];
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v16 = *(id *)(__b[1] + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v16;
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("•")) & 1) != 0)
        {
          v2 = accessibilityLocalizedString(CFSTR("scroll.bar.to"));
          v3 = v14;
          v14 = v2;

        }
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("#")) & 1) != 0)
        {
          v4 = accessibilityLocalizedString(CFSTR("scroll.bar.hashtag"));
          v5 = v14;
          v14 = v4;

        }
        objc_msgSend(v17, "addObject:", v14);
        objc_storeStrong(&v14, 0);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v11)
          break;
      }
    }
  }

  v7 = (id)objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" "));
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  v3 = (id)-[UITableViewIndexAccessibility accessibilityContainer](self, "accessibilityContainer");
  v5 = objc_msgSend(v3, "accessibilityTraits");
  v4 = *MEMORY[0x24BDFEEC8];

  if ((v5 & v4) != 0)
    v6 = *MEMORY[0x24BDFEEC8];
  return *MEMORY[0x24BEBB190] | *MEMORY[0x24BDF73A0] | v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (id)_accessibilityKeyCommands
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79B0]);
  v6[0] = v5;
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7990], 0, sel_accessibilityDecrement);
  v6[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);

  return v4;
}

@end
