@implementation UIIndexBarAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIIndexBarAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  int v9;
  int v10;
  id v11;
  id *v12;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIIndexBarAccessoryView");
  v5 = CFSTR("UIIndexBarView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIIndexBarView"), CFSTR("UIControl"));
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIIndexBarAccessoryView"), CFSTR("scrollView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("entries"), v6, 0);
  v8 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_didSelectEntry:atIndex:location:"), "B", v6, "q", "{CGPoint=dd}", 0);
  v4 = CFSTR("UIIndexBarEntry");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("type"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("indexPath"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("delegate"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("displayEntries"), v6, 0);
  v7 = CFSTR("UIIndexBarDisplayEntry");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("entryIndex"), v8, 0);
  v9 = 1;
  v10 = 0;
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("UIIndexBarAccessoryViewDelegate"), CFSTR("indexBarAccessoryView:contentOffsetForEntry:atIndex:"), 1, 0);
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("UIIndexBarViewDelegate"), CFSTR("indexBarView:didSelectEntry:atIndex:"), v9 & 1, v10 & 1);
  objc_storeStrong(v12, v11);
}

- (BOOL)isAccessibilityElement
{
  char v3;
  id v4;
  char v5;
  id location[2];
  UIIndexBarAccessoryViewAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIIndexBarAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v4 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v7);
  v5 = 0;
  if (objc_msgSend(v4, "count"))
  {
    objc_opt_class();
    v3 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v3 = -[UIIndexBarAccessoryViewAccessibility _accessibilityIsDelegateSelectable](v7, "_accessibilityIsDelegateSelectable");
    v5 = v3;
  }

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_axEntries
{
  if (a1)
    return (id)objc_msgSend(a1, "safeArrayForKey:", CFSTR("entries"));
  else
    return 0;
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
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5 = accessibilityLocalizedString(CFSTR("section.index.label"));
  v6[0] = v5;
  v3 = accessibilityLocalizedString(CFSTR("scroll.bar"));
  v6[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB190] | *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  NSObject *log;
  os_log_t oslog;
  int v4;
  id location;
  id v6;
  id v7[2];
  id v8;
  id v9;
  uint64_t i;
  SEL v11;
  UIIndexBarAccessoryViewAccessibility *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  v11 = a2;
  for (i = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](self); i > 0; --i)
  {
    v9 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v12);
    v8 = (id)objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v7[1] = (id)(i - 1);
    v7[0] = (id)objc_msgSend(v9, "objectAtIndexedSubscript:", i - 1);
    v6 = (id)objc_msgSend(v8, "safeValueForKey:");
    location = (id)objc_msgSend(v7[0], "safeValueForKey:", CFSTR("indexPath"));
    if (v6 && location)
    {
      v4 = (objc_msgSend(v6, "isEqual:", location) & 1) != 0 ? 0 : 2;
    }
    else
    {
      oslog = (os_log_t)(id)AXLogAppAccessibility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v12);
        _os_log_error_impl(&dword_230C4A000, log, OS_LOG_TYPE_ERROR, "Unexpectedly had no index paths for index bar in collection view: %@", v13, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = 2;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    if (v4)
      break;
  }
  if (i > 0)
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](v12, (void *)(i - 1));
}

- (uint64_t)_axCurrentPosition
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  id v6[3];
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;

  v11 = a1;
  if (!a1)
    return 0;
  v9 = 0;
  objc_opt_class();
  v4 = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("scrollView"));
  v8 = (id)__UIAccessibilityCastAsClass();

  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10 = v7;
  objc_msgSend(v7, "contentOffset");
  v6[1] = v1;
  v6[2] = v2;
  v6[0] = -[UIIndexBarAccessoryViewAccessibility _accessibiityDisplayEntryNearestToContentOffset:](v11, *(double *)&v1, *(double *)&v2);
  v5 = 0;
  if (v6[0])
    v5 = objc_msgSend(v6[0], "safeIntegerForKey:", CFSTR("entryIndex"));
  v12 = v5;
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v10, 0);
  return v12;
}

- (void)_accessibilityMoveToIndexAtPosition:(void *)a1
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9[2];
  id v10;
  void *v11;
  void *v12;

  v12 = a1;
  v11 = a2;
  if (a1)
  {
    v2 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v12);
    v10 = (id)objc_msgSend(v2, "objectAtIndexedSubscript:", v11);

    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __76__UIIndexBarAccessoryViewAccessibility__accessibilityMoveToIndexAtPosition___block_invoke;
    v7 = &unk_24FF3E138;
    v8 = v12;
    v9[0] = v10;
    v9[1] = v11;
    AXPerformSafeBlock();
    -[UIIndexBarAccessoryViewAccessibility _axPostNotificationForEntry:]((uint64_t)v12, v10);
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v10, 0);
  }
}

- (void)accessibilityDecrement
{
  id v2;
  uint64_t v3;
  unint64_t v4;

  v4 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](self);
  v2 = -[UIIndexBarAccessoryViewAccessibility _axEntries](self);
  v3 = objc_msgSend(v2, "count");

  if (v4 < v3 - 1)
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](self, (void *)(v4 + 1));
}

- (id)_accessibilityTableIndexTitles
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id location;
  _QWORD __b[8];
  void *v12;
  id v13[2];
  UIIndexBarAccessoryViewAccessibility *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = -[UIIndexBarAccessoryViewAccessibility _axEntries](v14);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v12 = *(void **)(__b[1] + 8 * v6);
      location = -[UIIndexBarAccessoryViewAccessibility _axLabelForEntry:]((uint64_t)v14, v12);
      if (objc_msgSend(location, "length"))
        objc_msgSend(v13[0], "addObject:", location);
      objc_storeStrong(&location, 0);
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

  v3 = v13[0];
  objc_storeStrong(v13, 0);
  return v3;
}

- (id)_axLabelForEntry:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  uint64_t v8;
  id v9;
  int v10;
  id location;
  uint64_t v12;
  id v13;

  v12 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v12)
  {
    v9 = 0;
    v8 = objc_msgSend(location, "safeIntegerForKey:", CFSTR("type"));
    if (v8 == 2)
    {
      v4 = accessibilityLocalizedString(CFSTR("section.index.numbers.label"));
      v5 = v9;
      v9 = v4;

    }
    else
    {
      if (v8 == 3)
        v2 = accessibilityLocalizedString(CFSTR("section.index.search.label"));
      else
        v2 = (id)objc_msgSend(location, "safeStringForKey:", CFSTR("title"));
      v3 = v9;
      v9 = v2;

    }
    v7 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
    objc_msgSend(v7, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEAC0]);
    v13 = v7;
    v10 = 1;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v13 = 0;
    v10 = 1;
  }
  objc_storeStrong(&location, 0);
  return v13;
}

- (id)accessibilityFlowToElements
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id obj;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  _QWORD __b[8];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  objc_super v31;
  id v32[2];
  UIIndexBarAccessoryViewAccessibility *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UIIndexBarAccessoryViewAccessibility;
  v32[0] = -[UIIndexBarAccessoryViewAccessibility accessibilityFlowToElements](&v31, sel_accessibilityFlowToElements);
  v30 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v33);
  if (objc_msgSend(v30, "count"))
  {
    v29 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](v33);
    if (v29 < 0 || v29 >= (unint64_t)objc_msgSend(v30, "count"))
    {
      v3 = v29;
      v4 = objc_msgSend(v30, "count");
      _AXAssert();
    }
    if (v29 >= 0 && v29 < (unint64_t)objc_msgSend(v30, "count"))
    {
      v28 = (id)objc_msgSend(v30, "objectAtIndexedSubscript:", v29);
      v26 = 0;
      objc_opt_class();
      v16 = (id)objc_msgSend(v28, "safeValueForKey:", CFSTR("indexPath"));
      v25 = (id)__UIAccessibilityCastAsClass();

      v24 = v25;
      objc_storeStrong(&v25, 0);
      v27 = v24;
      v23 = (id)-[UIIndexBarAccessoryViewAccessibility safeValueForKey:](v33, "safeValueForKey:", CFSTR("scrollView"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v23;
        v13 = (id)objc_msgSend(v22, "indexPathsForVisibleItems");
        v21 = (id)objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);

        memset(__b, 0, sizeof(__b));
        obj = v21;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (v15)
        {
          v10 = *(_QWORD *)__b[2];
          v11 = 0;
          v12 = v15;
          while (1)
          {
            v9 = v11;
            if (*(_QWORD *)__b[2] != v10)
              objc_enumerationMutation(obj);
            v20 = *(id *)(__b[1] + 8 * v11);
            v8 = objc_msgSend(v20, "section", v3, v4);
            if (v8 >= objc_msgSend(v27, "section"))
            {
              v7 = (id)objc_msgSend(v22, "cellForItemAtIndexPath:", v20);
              v6 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
              v18 = (id)objc_msgSend(v7, "_accessibilityLeafDescendantsWithCount:options:", 1);

              if (objc_msgSend(v18, "count"))
              {
                objc_storeStrong(v32, v18);
                v17 = 4;
              }
              else
              {
                v17 = 0;
              }
              objc_storeStrong(&v18, 0);
              if (v17)
                break;
            }
            ++v11;
            if (v9 + 1 >= v12)
            {
              v11 = 0;
              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
              if (!v12)
                break;
            }
          }
        }

        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
      }
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
  }
  v5 = v32[0];
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v32, 0);
  return v5;
}

- (id)_accessibiityDisplayEntryNearestToContentOffset:(double)a3
{
  id v4;
  id v5;
  id v6[2];
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  id v16;
  __int128 v17;
  id v18;

  *(double *)&v17 = a2;
  *((double *)&v17 + 1) = a3;
  v16 = a1;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 838860800;
    v12 = 48;
    v13 = __Block_byref_object_copy__10;
    v14 = __Block_byref_object_dispose__10;
    v15 = 0;
    v8 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("delegate"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (id)objc_msgSend(v16, "safeArrayForKey:", CFSTR("displayEntries"));
      v5 = v8;
      v6[0] = v16;
      v7 = v17;
      v6[1] = &v9;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:");

      objc_storeStrong(v6, 0);
      objc_storeStrong(&v5, 0);
    }
    v18 = (id)v10[5];
    objc_storeStrong(&v8, 0);
    _Block_object_dispose(&v9, 8);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

void __88__UIIndexBarAccessoryViewAccessibility__accessibiityDisplayEntryNearestToContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v4;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  id v22[2];
  _BYTE *v23;
  uint64_t v24;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v24 = a3;
  v23 = a4;
  v22[1] = (id)a1;
  v22[0] = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("entry"));
  if (v22[0])
  {
    if (objc_msgSend(v22[0], "safeIntegerForKey:", CFSTR("type")) == 1)
    {
      v21 = 1;
    }
    else
    {
      v20 = 0uLL;
      v13 = 0;
      v14 = &v13;
      v15 = 0x10000000;
      v16 = 48;
      v17 = &unk_230DEFD8E;
      v18 = 0;
      v19 = 0;
      v12[1] = &v13;
      v9 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      v11 = v22[0];
      v12[0] = location[0];
      AXPerformSafeBlock();
      v20 = *((_OWORD *)v14 + 2);
      objc_storeStrong(v12, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v9, 0);
      _Block_object_dispose(&v13, 8);
      if (*((double *)&v20 + 1) > *(double *)(a1 + 64)
        && ((v8 = *((double *)&v20 + 1) - *(double *)(a1 + 64), v8 >= 0.0)
          ? (v4 = *((double *)&v20 + 1) - *(double *)(a1 + 64))
          : (v4 = -v8),
            v4 >= 5.0))
      {
        *v23 = 1;
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), location[0]);
      }
      v21 = 0;
    }
  }
  else
  {
    v21 = 1;
  }
  objc_storeStrong(v22, 0);
  if (!v21)
    v21 = 0;
  objc_storeStrong(location, 0);
}

__n128 __88__UIIndexBarAccessoryViewAccessibility__accessibiityDisplayEntryNearestToContentOffset___block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  __n128 result;
  __n128 v5;

  objc_msgSend(*(id *)(a1 + 32), "indexBarAccessoryView:contentOffsetForEntry:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "safeIntegerForKey:", CFSTR("entryIndex")));
  v5.n128_u64[0] = v1;
  v5.n128_u64[1] = v2;
  result = v5;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v5;
  return result;
}

- (void)_accessibilityJumpToTableIndex:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL (*v10)(_QWORD *, void *);
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id location[2];
  UIIndexBarAccessoryViewAccessibility *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v15 = objc_msgSend(location[0], "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v16 = v3;
    v4 = (id)objc_msgSend(location[0], "substringWithRange:", v15, v3);
    v5 = location[0];
    location[0] = v4;

  }
  v14 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v18);
  v13 = 0;
  v6 = v14;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __71__UIIndexBarAccessoryViewAccessibility__accessibilityJumpToTableIndex___block_invoke;
  v11 = &unk_24FF3E640;
  v12 = location[0];
  v13 = (void *)objc_msgSend(v6, "indexOfObjectPassingTest:", &v7);
  if (v13 != (void *)0x7FFFFFFFFFFFFFFFLL)
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](v18, v13);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

BOOL __71__UIIndexBarAccessoryViewAccessibility__accessibilityJumpToTableIndex___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  BOOL v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(location[0], "safeStringForKey:", CFSTR("title"));
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", a1[4]) == 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (void)_axPostNotificationForEntry:(uint64_t)a1
{
  UIAccessibilityNotifications notification;
  id v3;
  id location;
  uint64_t v5;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    notification = *MEMORY[0x24BEBB010];
    v3 = -[UIIndexBarAccessoryViewAccessibility _axLabelForEntry:](v5, location);
    UIAccessibilityPostNotification(notification, v3);

  }
  objc_storeStrong(&location, 0);
}

uint64_t __76__UIIndexBarAccessoryViewAccessibility__accessibilityMoveToIndexAtPosition___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  CGPointMake_4();
  objc_msgSend(v4, "_didSelectEntry:atIndex:location:", v5, v6, v1, v2);
  return objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
}

- (BOOL)_accessibilityIsDelegateSelectable
{
  char v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UIIndexBarAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = objc_opt_respondsToSelector();
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5
{
  char v6;
  objc_super v8;
  char v9;
  uint64_t v10;
  int64_t v11;
  id location[2];
  UIIndexBarAccessoryViewAccessibility *v13;
  CGPoint v14;

  v14 = a5;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](v13);
  v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)UIIndexBarAccessoryViewAccessibility;
  v9 = -[UIIndexBarAccessoryViewAccessibility _didSelectEntry:atIndex:location:](&v8, sel__didSelectEntry_atIndex_location_, location[0], a4, v14.x, v14.y);
  if (v9 && v10 != v11)
    -[UIIndexBarAccessoryViewAccessibility _axPostNotificationForEntry:]((uint64_t)v13, location[0]);
  v6 = v9;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

@end
