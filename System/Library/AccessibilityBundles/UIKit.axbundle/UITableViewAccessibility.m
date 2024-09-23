@implementation UITableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityUseOpaqueElements
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UITableViewAccessibility___accessibilityUseOpaqueElements);
  else
    return 0;
}

- (uint64_t)_accessibilityShouldConsiderSwipeDeletionCommitted
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_accessibilitySetShouldConsiderSwipeDeletionCommitted:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  const __CFString *v11;
  const char *v12;
  const __CFString *v13;
  const char *v14;
  const char *v15;
  const __CFString *v16;
  const char *v17;
  id v18;
  id *v19;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v19 = location;
  v18 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = CFSTR("UITableView");
  v15 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("cellForRowAtIndexPath:"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("dequeueReusableCellWithIdentifier:"), v15, 0);
  v10 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("indexPathForRowAtGlobalRow:"), v15, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("numberOfRowsInSection:"), v10, 0);
  v3 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("rectForFooterInSection:"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("rectForHeaderInSection:"), v3, v10, 0);
  v12 = "B";
  v17 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("scrollToRowAtIndexPath: atScrollPosition: animated:"), v15, v10, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("setCountString:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_dataSourceImplementsTitleForFooterInSection"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateImplementsViewForFooterInSection"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateImplementsViewForHeaderInSection"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateWantsFooterForSection:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateWantsFooterTitleForSection:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateWantsHeaderForSection:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateWantsHeaderTitleForSection:"), v12, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_endReorderingForCell: wasCancelled: animated:"), v17, v15, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_performAction: forCell: sender:"), v17, ":", v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_reorderingSupport"), v15, 0);
  v4 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_visibleGlobalRows"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_hasSwipeToDeleteRow"), v12, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("UISwipeActionPullView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_updateVisibleCellsImmediatelyIfNecessary"), v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_floatingRectForHeaderInSection: heightCanBeGuessed:"), v3, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_floatingRectForFooterInSection: heightCanBeGuessed:"), v3, v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_sectionsInRect:"), v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_sectionForHeaderView:"), v10, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_visibleHeaderFooterViews"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchDisplayControllerContainerView"), CFSTR("behindView"), v15, 0);
  v5 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_nibMapForType:"), v15, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_createPreparedCellForRowAtIndexPath: willDisplay:"), v15, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_dragAndDropUsedForReordering"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_reorderPositionChangedForCell:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateViewForFooterInSection:"), v15, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_delegateViewForHeaderInSection:"), v15, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_configureCellForDisplay: forIndexPath:"), v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_reuseTableViewSubview: viewType:"), v17, v15, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_setupCell:forEditing:atIndexPath:animated:updateSeparators:"), v17, v15, v12, v15, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_updateDropTargetAppearanceWithTargetIndexPath:dropProposal:dropSession:"), v17, v15, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_gapIndexPath"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_draggedIndexPath"), v15, 0);
  v13 = CFSTR("UIScrollView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16);
  v6 = CFSTR("UILayoutContainerView");
  v9 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISplitViewControllerPanelImplView"), v6);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, CFSTR("contentSize"), "{CGSize=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("setContentOffset:"), v17, "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISwipeActionController"), CFSTR("currentSwipeOccurrence"), v15, 0);
  v8 = CFSTR("UISwipeOccurrence");
  v7 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_pullViewForSwipeDirection:"), v15, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_swipeDeletionCommitted"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_childFocusViews"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("preferredFocusedView"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("canBecomeFocused"), v12, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16, v9);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_isFocusedOrAncestorOfFocusedView"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_didUpdateFocusInContext:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_numberOfSections"), v10, 0);
  v11 = CFSTR("UIResponder");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("canResignFirstResponder"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("becomeFirstResponder"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("pressesBegan:withEvent:"), v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("pressesEnded:withEvent:"), v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("pressesCancelled:withEvent:"), v17, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_shouldSelectionFollowFocusForIndexPath:initiatedBySelection:"), v15, v12, 0);
  v14 = "UIView<_UIScrollViewScrollIndicator>";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v13, CFSTR("_verticalScrollIndicator"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v13, CFSTR("_horizontalScrollIndicator"), v14);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_cellDidShowSelectedBackground:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_cellDidHideSelectedBackground:"), v17, v15, 0);
  objc_storeStrong(v19, v18);
}

- (unint64_t)_accessibilityAutomationType
{
  return 26;
}

- (id)indexPathsForRowsInRect:(CGRect)a3
{
  objc_super v4;
  SEL v5;
  UITableViewAccessibility *v6;
  CGRect v7;
  id v8;

  v7 = a3;
  v6 = self;
  v5 = a2;
  if (-[UITableViewAccessibility _axNumberOfSections](self))
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITableViewAccessibility;
    v8 = -[UITableViewAccessibility indexPathsForRowsInRect:](&v4, sel_indexPathsForRowsInRect_, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)_axNumberOfSections
{
  uint64_t v2;
  os_log_t oslog;
  uint64_t v4;
  id location;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  if (!a1)
    return 0;
  v7 = objc_msgSend(v8, "numberOfSections");
  v6 = v7;
  location = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_numberOfSections"));
  if (location)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(location, "integerValue");
      if (v7 != v4)
      {
        oslog = (os_log_t)(id)AXLogAppAccessibility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v10, v7, v4);
          _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "Number of sections from table view (%ld) and data source (%ld) differed while initializing accessibility data.", v10, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      if (v7 >= v4)
        v2 = v4;
      else
        v2 = v7;
      v6 = v2;
    }
  }
  v9 = v6;
  objc_storeStrong(&location, 0);
  return v9;
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v12;
  unsigned __int8 v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  id location[2];
  UITableViewAccessibility *v22;
  __int128 v23;
  __int128 v24;

  *(CGFloat *)&v23 = a3.origin.x;
  *((_QWORD *)&v23 + 1) = *(_QWORD *)&a3.origin.y;
  *(CGFloat *)&v24 = a3.size.width;
  *((_QWORD *)&v24 + 1) = *(_QWORD *)&a3.size.height;
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (location[0])
  {
    UIEdgeInsetsMake();
    v17 = v4;
    v18 = v5;
    v19 = v6;
    v20 = v7;
    *(_QWORD *)&v15 = UIEdgeInsetsInsetRect_1(*(double *)&v23, *((double *)&v23 + 1), *(double *)&v24, *((double *)&v24 + 1), v4, v5);
    *((_QWORD *)&v15 + 1) = v8;
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    v23 = v15;
    v24 = v16;
  }
  v14.receiver = v22;
  v14.super_class = (Class)UITableViewAccessibility;
  v13 = -[UITableViewAccessibility _accessibilityScrollToFrame:forView:](&v14, sel__accessibilityScrollToFrame_forView_, location[0], v23, v24, location);
  objc_storeStrong(v12, 0);
  return v13 & 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTableViewOpaqueScrollsIntoViewKey"));
  if (location[0])
    v4 = objc_msgSend(location[0], "BOOLValue") & 1;
  else
    v4 = 1;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = -[UITableViewAccessibility _accessibilityUseOpaqueElements](self);
  v5 = v2 == 0;

  if (v5)
    return -[UITableViewAccessibility _automationPrefersRealElements](self)
        || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0;
  v4 = -[UITableViewAccessibility _accessibilityUseOpaqueElements](self);
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)_automationPrefersRealElements
{
  if (a1)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      if ((objc_msgSend(a1, "_accessibilityFauxTableViewCellsDisabled") & 1) != 0)
        return 1;
      else
        return !_AXSAutomationFauxTableViewCellsEnabled() || (UIAccessibilityIsAppExtension() & 1) != 0;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

- (id)_axOpaqueHeaderElementInDirection:(id)obj withinElements:(uint64_t)a4 startIndex:
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  char v10;
  id v11;
  char v12;
  os_log_t oslog;
  uint64_t j;
  unint64_t i;
  unint64_t v17;
  id v18;
  id v19;
  int v20;
  uint64_t v21;
  id location;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  v23 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  v21 = a4;
  if (v24)
  {
    v19 = 0;
    v18 = (id)MEMORY[0x2348C3D88](&__block_literal_global_38);
    if (v23 == 1)
    {
      v17 = objc_msgSend(location, "count");
      for (i = v21 + 1; i < v17; ++i)
      {
        v11 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
        v12 = (*((uint64_t (**)(void))v18 + 2))();

        if ((v12 & 1) != 0)
        {
          v4 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", i);
          v5 = v19;
          v19 = v4;

          break;
        }
      }
    }
    else
    {
      for (j = v21 - 1; j >= 0; --j)
      {
        v9 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
        v10 = (*((uint64_t (**)(void))v18 + 2))();

        if ((v10 & 1) != 0)
        {
          v6 = (id)objc_msgSend(location, "objectAtIndexedSubscript:", j);
          v7 = v19;
          v19 = v6;

          break;
        }
      }
    }
    oslog = (os_log_t)(id)AXLogElementTraversal();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v19);
      _os_log_debug_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_DEBUG, "got me opaque header: %@", v26, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v25 = v19;
    v20 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v25 = 0;
    v20 = 1;
  }
  objc_storeStrong(&location, 0);
  return v25;
}

uint64_t __88__UITableViewAccessibility__axOpaqueHeaderElementInDirection_withinElements_startIndex___block_invoke(void *a1, void *a2)
{
  char IsHeaderInSearchContexts;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  IsHeaderInSearchContexts = _UIAXElementIsHeaderInSearchContexts(location[0]);
  objc_storeStrong(location, 0);
  return IsHeaderInSearchContexts & 1;
}

- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  id v28;
  NSString *v29;
  uint64_t v30;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(NSObject *, void *, uint64_t, _BYTE *);
  void *v36;
  uint64_t *v37;
  int64_t v38;
  id v39;
  id v40;
  id v41;
  os_log_type_t v42;
  os_log_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52[2];
  uint64_t v53;
  uint64_t *v54;
  int v55;
  int v56;
  uint64_t v57;
  _QWORD __b[8];
  id v59;
  id v60;
  id v61;
  char v62;
  id v63;
  id v64;
  id v65;
  os_log_type_t type;
  os_log_t oslog;
  CGRect rect;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  int v72;
  int v73;
  void (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  int64_t v77;
  id location;
  int64_t v79;
  SEL v80;
  UITableViewAccessibility *v81;
  uint8_t v82[32];
  _BYTE v83[128];
  uint8_t v84[24];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v81 = self;
  v80 = a2;
  v79 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v77 = a5;
  v70 = 0;
  v71 = &v70;
  v72 = 838860800;
  v73 = 48;
  v74 = __Block_byref_object_copy__20;
  v75 = __Block_byref_object_dispose__20;
  v76 = 0;
  v69 = v81;
  objc_msgSend(v69, "rectForHeaderInSection:", v79);
  rect.origin.x = v5;
  rect.origin.y = v6;
  rect.size.width = v7;
  rect.size.height = v8;
  oslog = (os_log_t)(id)AXLogOpaqueElements();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v30 = v79;
    v29 = NSStringFromCGRect(rect);
    v65 = v29;
    __os_log_helper_16_2_2_8_0_8_66((uint64_t)v84, v30, (uint64_t)v65);
    _os_log_debug_impl(&dword_230C4A000, oslog, type, "Rect for header in section %ld: %{public}@", v84, 0x16u);

    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (!CGRectIsEmpty(rect))
  {
    objc_msgSend(v69, "scrollRectToVisible:animated:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    objc_msgSend(v69, "layoutIfNeeded");
    v64 = 0;
    v62 = 0;
    objc_opt_class();
    v28 = (id)-[UITableViewAccessibility safeValueForKey:](v81, "safeValueForKey:", CFSTR("_visibleHeaderFooterViews"));
    v61 = (id)__UIAccessibilityCastAsClass();

    v60 = v61;
    objc_storeStrong(&v61, 0);
    v63 = v60;
    memset(__b, 0, sizeof(__b));
    obj = v60;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v83, 16);
    if (v27)
    {
      v23 = *(_QWORD *)__b[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)__b[2] != v23)
          objc_enumerationMutation(obj);
        v59 = *(id *)(__b[1] + 8 * v24);
        v53 = 0;
        v54 = &v53;
        v55 = 0x20000000;
        v56 = 32;
        v57 = 0;
        v46 = MEMORY[0x24BDAC760];
        v47 = -1073741824;
        v48 = 0;
        v49 = __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke;
        v50 = &unk_24FF3DAB0;
        v52[1] = &v53;
        v51 = v69;
        v52[0] = v59;
        AXPerformSafeBlock();
        v45 = v54[3];
        objc_storeStrong(v52, 0);
        objc_storeStrong(&v51, 0);
        _Block_object_dispose(&v53, 8);
        if (v45 == v79)
          break;
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v83, 16);
          if (!v25)
            goto LABEL_12;
        }
      }
      objc_storeStrong(&v64, v59);
      v44 = 2;
    }
    else
    {
LABEL_12:
      v44 = 0;
    }

    v43 = (os_log_t)(id)AXLogOpaqueElements();
    v42 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v9 = CFSTR("Previous");
      if (v77 != 2)
        v9 = CFSTR("Next");
      v20 = (uint64_t)v9;
      v21 = v79;
      v19 = (id)objc_msgSend(v64, "recursiveDescription");
      v41 = v19;
      __os_log_helper_16_2_3_8_66_8_0_8_66((uint64_t)v82, v20, v21, (uint64_t)v41);
      _os_log_debug_impl(&dword_230C4A000, v43, v42, "%{public}@ header view at section %ld: %{public}@", v82, 0x20u);

      objc_storeStrong(&v41, 0);
    }
    objc_storeStrong((id *)&v43, 0);
    v40 = 0;
    if (v64)
    {
      v10 = (id)objc_msgSend(v64, "_accessibilityLeafDescendantsWithOptions:", location);
      v11 = v40;
      v40 = v10;

    }
    else if (objc_msgSend(v69, "numberOfRowsInSection:", v79) > 0)
    {
      v18 = v69;
      v17 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v79);
      v39 = (id)objc_msgSend(v18, "cellForRowAtIndexPath:");

      v12 = (id)objc_msgSend(v39, "_accessibilityLeafDescendantsWithOptions:", location);
      v13 = v40;
      v40 = v12;

      objc_storeStrong(&v39, 0);
    }
    if (v77 == 2)
      v14 = 2;
    else
      v14 = 0;
    v32 = MEMORY[0x24BDAC760];
    v33 = -1073741824;
    v34 = 0;
    v35 = __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke_384;
    v36 = &unk_24FF3F470;
    v38 = v77;
    v37 = &v70;
    objc_msgSend(v40, "enumerateObjectsWithOptions:usingBlock:", v14, &v32);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v64, 0);
  }
  v16 = (id)v71[5];
  v44 = 1;
  objc_storeStrong(&v69, 0);
  _Block_object_dispose(&v70, 8);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&location, 0);
  return v16;
}

uint64_t __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sectionForHeaderView:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __89__UITableViewAccessibility__axFirstLastOpaqueHeaderElementFromSection_options_direction___block_invoke_384(NSObject *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const __CFString *v4;
  os_log_t oslog[2];
  _BYTE *v9;
  uint64_t v10;
  id location[2];
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10 = a3;
  v9 = a4;
  oslog[1] = a1;
  if ((_UIAXElementIsHeaderInSearchContexts(location[0]) & 1) != 0)
  {
    oslog[0] = (os_log_t)(id)AXLogOpaqueElements();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      if (a1[5].isa == (Class)2)
        v4 = CFSTR("previous");
      else
        v4 = CFSTR("next");
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v12, (uint64_t)v4, (uint64_t)location[0]);
      _os_log_debug_impl(&dword_230C4A000, oslog[0], OS_LOG_TYPE_DEBUG, "Found %{public}@ header element %{public}@", v12, 0x16u);
    }
    objc_storeStrong((id *)oslog, 0);
    objc_storeStrong((id *)(*((_QWORD *)a1[4].isa + 1) + 40), location[0]);
    *v9 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_axFirstLastOpaqueHeaderElementInDirection:(id)obj options:
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  os_log_t v12;
  __int128 v13;
  __int128 v14;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t j;
  uint64_t i;
  __int128 v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;
  id location;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t v28[16];
  uint8_t v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v26 = a1;
  v25 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v26)
  {
    v22 = 0;
    v21 = v26;
    v20 = -[UITableViewAccessibility _axNumberOfSections](v26);
    objc_msgSend(v21, "contentOffset");
    *(_QWORD *)&v19 = v3;
    *((_QWORD *)&v19 + 1) = v4;
    if (v25 == 1)
    {
      for (i = 0; i < v20; ++i)
      {
        v5 = (id)objc_msgSend(v26, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", i, location, v25);
        v6 = v22;
        v22 = v5;

        if (v22)
          break;
      }
    }
    else
    {
      for (j = v20 - 1; j >= 0; --j)
      {
        v7 = (id)objc_msgSend(v26, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", j, location, v25);
        v8 = v22;
        v22 = v7;

        if (v22)
          break;
      }
    }
    if (!v22)
    {
      oslog = (os_log_t)(id)AXLogOpaqueElements();
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v29, (uint64_t)v26);
        _os_log_debug_impl(&dword_230C4A000, oslog, type, "No headers found in %{public}@.", v29, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v14 = v19;
      v13 = v19;
      objc_msgSend(v21, "setContentOffset:", v19);
      v9 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = v22;
      v22 = v9;

    }
    v12 = (os_log_t)(id)AXLogElementTraversal();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v28, (uint64_t)v22);
      _os_log_debug_impl(&dword_230C4A000, v12, OS_LOG_TYPE_DEBUG, "First/Last opaque header, %@", v28, 0xCu);
    }
    objc_storeStrong((id *)&v12, 0);
    v27 = v22;
    v23 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v27 = 0;
    v23 = 1;
  }
  objc_storeStrong(&location, 0);
  return v27;
}

- (id)_axOffScreenOpaqueHeaderElementInDirection:(id)obj options:(void *)a4 childElement:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  os_log_t v22;
  NSUInteger k;
  NSUInteger v24;
  NSUInteger j;
  unint64_t v26;
  NSUInteger v27;
  id v28;
  uint64_t v29;
  int v30;
  int v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34[3];
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;
  char *i;
  uint64_t v44;
  id v45;
  os_log_type_t type;
  os_log_t oslog[4];
  int v48;
  int v49;
  __n128 (*v50)(uint64_t);
  void *v51;
  id v52[2];
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t *v56;
  int v57;
  int v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSRange v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  int v68;
  id v69;
  id location;
  uint64_t v71;
  void *v72;
  id v73;
  NSRange v74;
  NSRange v75;
  uint8_t v76[16];
  uint8_t v77[24];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v72 = a1;
  v71 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  v69 = 0;
  objc_storeStrong(&v69, a4);
  if (v72)
  {
    v67 = 0;
    v66 = v72;
    objc_msgSend(v66, "contentOffset");
    *(_QWORD *)&v20 = v4;
    *((_QWORD *)&v20 + 1) = v5;
    v65 = v20;
    objc_msgSend(v66, "visibleBounds");
    *(_QWORD *)&v18 = v6;
    *((_QWORD *)&v18 + 1) = v7;
    *(_QWORD *)&v19 = v8;
    *((_QWORD *)&v19 + 1) = v9;
    v63 = v18;
    v64 = v19;
    v62 = (NSRange)0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x10000000;
    v58 = 48;
    v59 = &unk_230DEFD8E;
    v60 = 0;
    v61 = 0;
    oslog[3] = (os_log_t)MEMORY[0x24BDAC760];
    v48 = -1073741824;
    v49 = 0;
    v50 = __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke;
    v51 = &unk_24FF3F498;
    v52[1] = &v55;
    v52[0] = v66;
    v53 = v63;
    v54 = v64;
    AXPerformSafeBlock();
    v62 = (NSRange)*((_OWORD *)v56 + 2);
    objc_storeStrong(v52, 0);
    _Block_object_dispose(&v55, 8);
    oslog[0] = (os_log_t)(id)AXLogOpaqueElements();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      v17 = NSStringFromRange(v62);
      v45 = v17;
      __os_log_helper_16_2_1_8_66((uint64_t)v77, (uint64_t)v45);
      _os_log_debug_impl(&dword_230C4A000, oslog[0], type, "Visible sections: %{public}@", v77, 0xCu);

      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    v44 = 0x7FFFFFFFFFFFFFFFLL;
    for (i = (char *)v62.location; ; ++i)
    {
      v75 = v62;
      if ((unint64_t)i >= v62.location + v62.length)
        break;
      v35 = 0;
      v36 = &v35;
      v37 = 838860800;
      v38 = 48;
      v39 = __Block_byref_object_copy__20;
      v40 = __Block_byref_object_dispose__20;
      v41 = 0;
      v29 = MEMORY[0x24BDAC760];
      v30 = -1073741824;
      v31 = 0;
      v32 = __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke_392;
      v33 = &unk_24FF3E1F8;
      v34[1] = &v35;
      v34[0] = v72;
      v34[2] = i;
      AXPerformSafeBlock();
      v28 = (id)v36[5];
      objc_storeStrong(v34, 0);
      _Block_object_dispose(&v35, 8);
      objc_storeStrong(&v41, 0);
      v42 = v28;
      if (v28 == v69)
      {
        v44 = (uint64_t)i;
        v68 = 2;
      }
      else
      {
        v68 = 0;
      }
      objc_storeStrong(&v42, 0);
      if (v68)
        break;
    }
    if (v71 == 1)
    {
      v74 = v62;
      v27 = v62.location + v62.length;
      v26 = -[UITableViewAccessibility _axNumberOfSections](v72);
      for (j = v27; j < v26; ++j)
      {
        v10 = (id)objc_msgSend(v72, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", j, location, v71);
        v11 = v67;
        v67 = v10;

        if (v67)
        {
          if (v44 != j)
            break;
        }
      }
    }
    else
    {
      v24 = v62.location;
      for (k = v62.location; ; --k)
      {
        v12 = (id)objc_msgSend(v72, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", k, location, v71);
        v13 = v67;
        v67 = v12;

        if (v67)
        {
          if (v44 != k)
            break;
        }
        if (!k)
          break;
      }
    }
    if (!v67 || v67 == v69)
    {
      v22 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v76, (uint64_t)v69);
        _os_log_debug_impl(&dword_230C4A000, v22, OS_LOG_TYPE_DEBUG, "No headers found after %{public}@.", v76, 0xCu);
      }
      objc_storeStrong((id *)&v22, 0);
      objc_msgSend(v66, "setContentOffset:", v65);
      v14 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = v67;
      v67 = v14;

    }
    v73 = v67;
    v68 = 1;
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
  }
  else
  {
    v73 = 0;
    v68 = 1;
  }
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&location, 0);
  return v73;
}

__n128 __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke(uint64_t a1)
{
  unint64_t v1;
  __n128 result;
  __n128 v4;

  v4.n128_u64[0] = objc_msgSend(*(id *)(a1 + 32), "_sectionsInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4.n128_u64[1] = v1;
  result = v4;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v4;
  return result;
}

void __92__UITableViewAccessibility__axOffScreenOpaqueHeaderElementInDirection_options_childElement___block_invoke_392(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_visibleHeaderViewForSection:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityOpaqueHeaderElementInDirection:(int64_t)a3 childElement:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id obj;
  uint64_t v22;
  os_log_t v23;
  os_log_type_t type;
  os_log_t oslog;
  char v26;
  id v27;
  char v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD __b[8];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  uint64_t v39;
  SEL v40;
  UITableViewAccessibility *v41;
  uint8_t v42[32];
  uint8_t v43[24];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v41 = self;
  v40 = a2;
  v39 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v37 = 0;
  v36 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
  if (location)
  {
    v35 = -[UITableViewAccessibility _accessibilitySortedElementsWithinWithOptions:](v41, "_accessibilitySortedElementsWithinWithOptions:", v36);
    v34 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = v35;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
    if (v22)
    {
      v18 = *(_QWORD *)__b[2];
      v19 = 0;
      v20 = v22;
      while (1)
      {
        v17 = v19;
        if (*(_QWORD *)__b[2] != v18)
          objc_enumerationMutation(obj);
        v33 = *(id *)(__b[1] + 8 * v19);
        v15 = v34;
        v16 = (id)objc_msgSend(v33, "_accessibilityLeafDescendantsWithOptions:", v36);
        objc_msgSend(v15, "addObjectsFromArray:");

        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
          if (!v20)
            break;
        }
      }
    }

    v31 = (id)objc_msgSend(location, "_accessibilityLeafDescendantsWithOptions:", v36);
    v30 = 0;
    v28 = 0;
    v26 = 0;
    if (v39 == 1)
    {
      v13 = v34;
      v29 = (id)objc_msgSend(v31, "lastObject");
      v28 = 1;
      v14 = objc_msgSend(v13, "indexOfObject:");
    }
    else
    {
      v12 = v34;
      v27 = (id)objc_msgSend(v31, "firstObject");
      v26 = 1;
      v14 = objc_msgSend(v12, "indexOfObject:");
    }
    if ((v26 & 1) != 0)

    if ((v28 & 1) != 0)
    v30 = v14;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      _AXAssert();
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = (os_log_t)(id)AXLogOpaqueElements();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v42, (uint64_t)location, (uint64_t)v34);
        _os_log_debug_impl(&dword_230C4A000, v23, OS_LOG_TYPE_DEBUG, "Could not find child element %{public}@ in table view elements %{public}@. Falling through to existing search code.", v42, 0x16u);
      }
      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      v6 = -[UITableViewAccessibility _axOpaqueHeaderElementInDirection:withinElements:startIndex:]((uint64_t)v41, v39, v34, v30);
      v7 = v37;
      v37 = v6;

      oslog = (os_log_t)(id)AXLogOpaqueElements();
      type = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v43, (uint64_t)v37);
        _os_log_debug_impl(&dword_230C4A000, oslog, type, "Header from existing sorted elements within: %{public}@", v43, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (!v37)
      {
        v8 = -[UITableViewAccessibility _axOffScreenOpaqueHeaderElementInDirection:options:childElement:](v41, v39, v36, location);
        v9 = v37;
        v37 = v8;

      }
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v4 = -[UITableViewAccessibility _axFirstLastOpaqueHeaderElementInDirection:options:](v41, v39, v36);
    v5 = v37;
    v37 = v4;

  }
  v11 = v37;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&location, 0);
  return v11;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v2;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id location;
  id v12;
  id v13[2];
  UITableViewAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = -[UITableViewAccessibility _accessibilityHeaderElement](v14, "_accessibilityHeaderElement");
  if ((objc_msgSend(v12, "isAccessibilityElement") & 1) != 0)
  {
    objc_msgSend(v13[0], "addObject:", v12);
  }
  else
  {
    v9 = 0;
    v7 = 0;
    if ((objc_msgSend(v12, "_accessibilityHasOrderedChildren") & 1) != 0)
    {
      v10 = (id)objc_msgSend(v12, "_accessibilityElements");
      v9 = 1;
      v2 = v10;
    }
    else
    {
      v8 = (id)objc_msgSend(v12, "_accessibilitySubviews");
      v7 = 1;
      v2 = v8;
    }
    location = v2;
    if ((v7 & 1) != 0)

    if ((v9 & 1) != 0)
    if (objc_msgSend(location, "count"))
      objc_msgSend(v13[0], "addObjectsFromArray:", location);
    objc_storeStrong(&location, 0);
  }
  v6 = (id)-[UITableViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_index"));
  if ((objc_msgSend(v6, "_accessibilityViewIsVisible") & 1) != 0)
    objc_msgSend(v13[0], "axSafelyAddObject:", v6);
  if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v14) & 1) != 0)
  {
    v5 = -[UITableViewAccessibility _accessibilitySearchResultsTableView](v14);
    if (v5)
      objc_msgSend(v13[0], "addObject:", v5);
    objc_storeStrong(&v5, 0);
  }
  v4 = v13[0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v4;
}

- (uint64_t)_accessibilityIsSearchTableVisible
{
  char v2;
  char v3;
  char v5;

  if (a1)
  {
    NSClassFromString(CFSTR("UISearchResultsTableView"));
    v3 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = 1;
      if ((-[UITableViewAccessibility _accessibilitySearchTableViewVisible](a1) & 1) == 0)
        v2 = -[UITableViewAccessibility _accessibilitySearchControllerDimmingViewVisible](a1);
      v3 = v2;
    }
    v5 = v3 & 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (id)_accessibilitySearchResultsTableView
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id location;
  id v7;
  id v8;

  v7 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("subviews"));
    v5 = objc_msgSend(location, "indexOfObjectPassingTest:", &__block_literal_global_476);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v4 = (id)objc_msgSend(location, "objectAtIndex:", v5);
      v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("behindView"));
      v2 = (id)objc_msgSend(v3, "subviews");
      v8 = (id)objc_msgSend(v2, "lastObject");

    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  id v4;
  id v5;
  id location;
  id v7;
  id v8[2];
  UITableViewAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = -[UITableViewAccessibility _accessibilityFooterElement](v9, "_accessibilityFooterElement");
  if ((objc_msgSend(v7, "isAccessibilityElement") & 1) != 0)
  {
    objc_msgSend(v8[0], "addObject:", v7);
  }
  else
  {
    location = (id)objc_msgSend(v7, "_accessibilitySubviews");
    if (objc_msgSend(location, "count"))
      objc_msgSend(v8[0], "addObjectsFromArray:", location);
    objc_storeStrong(&location, 0);
  }
  v5 = (id)-[UITableViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_verticalScrollIndicator"));
  if ((objc_msgSend(v5, "isAccessibilityElement") & 1) != 0)
    objc_msgSend(v8[0], "addObject:", v5);
  v4 = (id)-[UITableViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("_horizontalScrollIndicator"));
  if ((objc_msgSend(v4, "isAccessibilityElement") & 1) != 0)
    objc_msgSend(v8[0], "addObject:", v4);
  v3 = v8[0];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v3;
}

- (void)insertSections:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility insertSections:withRowAnimation:](&v5, sel_insertSections_withRowAnimation_, location[0], a4);
  if (objc_msgSend(location[0], "count"))
    -[UITableViewAccessibility _accessibilityClearChildren](v8, "_accessibilityClearChildren");
  objc_storeStrong(location, 0);
}

- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility deleteSections:withRowAnimation:](&v5, sel_deleteSections_withRowAnimation_, location[0], a4);
  if (objc_msgSend(location[0], "count"))
    -[UITableViewAccessibility _accessibilityClearChildren](v8, "_accessibilityClearChildren");
  objc_storeStrong(location, 0);
}

- (void)reloadSections:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility reloadSections:withRowAnimation:](&v5, sel_reloadSections_withRowAnimation_, location[0], a4);
  if (objc_msgSend(location[0], "count"))
    -[UITableViewAccessibility _accessibilityClearChildren](v8, "_accessibilityClearChildren");
  objc_storeStrong(location, 0);
}

- (void)insertRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility insertRowsAtIndexPaths:withRowAnimation:](&v5, sel_insertRowsAtIndexPaths_withRowAnimation_, location[0], a4);
  if (objc_msgSend(location[0], "count"))
    -[UITableViewAccessibility _accessibilityClearChildren](v8, "_accessibilityClearChildren");
  objc_storeStrong(location, 0);
}

- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility deleteRowsAtIndexPaths:withRowAnimation:](&v5, sel_deleteRowsAtIndexPaths_withRowAnimation_, location[0], a4);
  if (objc_msgSend(location[0], "count"))
    -[UITableViewAccessibility _accessibilityClearChildren](v8, "_accessibilityClearChildren");
  objc_storeStrong(location, 0);
}

- (void)reloadRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  objc_super v5;
  int64_t v6;
  id location[2];
  UITableViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility reloadRowsAtIndexPaths:withRowAnimation:](&v5, sel_reloadRowsAtIndexPaths_withRowAnimation_, location[0], a4);
  objc_msgSend(location[0], "count");
  objc_storeStrong(location, 0);
}

- (void)reloadData
{
  id location;
  objc_super v3;
  SEL v4;
  UITableViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility reloadData](&v3, sel_reloadData);
  location = (id)-[UITableViewAccessibility _accessibilityValueForKey:](v5, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
  if (location)
    -[UITableViewAccessibility _accessibilityClearChildren](v5, "_accessibilityClearChildren");
  objc_storeStrong(&location, 0);
}

- (BOOL)accessibilityScrollLeftPageSupported
{
  return 0;
}

- (BOOL)accessibilityScrollRightPageSupported
{
  return 0;
}

- (void)setReusableCellsEnabled:(BOOL)a3
{
  id v3;
  BOOL v4;
  SEL v5;
  UITableViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3 = (id)-[UITableViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
  -[_AXTableViewInternal setReusableCellsEnabled:]((uint64_t)v3, v4);
  objc_storeStrong(&v3, 0);
}

- (void)setTableHeaderViewShouldAutoHide:(BOOL)a3
{
  objc_super v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  UITableViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = v7;
    v3.super_class = (Class)UITableViewAccessibility;
    -[UITableViewAccessibility setTableHeaderViewShouldAutoHide:](&v3, sel_setTableHeaderViewShouldAutoHide_, 0);
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableViewAccessibility;
    -[UITableViewAccessibility setTableHeaderViewShouldAutoHide:](&v4, sel_setTableHeaderViewShouldAutoHide_, v5);
  }
}

- (id)_axAttemptStoryboard:(int)a3 viewType:
{
  id v3;
  id v4;
  id v5;
  id v7;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23[2];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  id v32;
  id v33;
  int v34;
  int v35;
  id location;
  id v37;
  id v38;

  v37 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v35 = a3;
  if (v37)
  {
    v33 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 838860800;
    v28 = 48;
    v29 = __Block_byref_object_copy__20;
    v30 = __Block_byref_object_dispose__20;
    v31 = 0;
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke;
    v21 = &unk_24FF3F4C0;
    v23[1] = &v25;
    v22 = v37;
    v24 = v35;
    v23[0] = location;
    AXPerformSafeBlock();
    v16 = (id)v26[5];
    objc_storeStrong(v23, 0);
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v25, 8);
    objc_storeStrong(&v31, 0);
    v32 = v16;
    if (v16)
    {
      v7 = (id)objc_msgSend(v37, "safeValueForKey:", CFSTR("_nibExternalObjectsTables"));
      v15 = (id)objc_msgSend(v7, "objectForKey:", location);

      v12 = 0;
      if (v15)
      {
        v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v15, *MEMORY[0x24BDF7BE0]);
        v12 = 1;
        v3 = v13;
      }
      else
      {
        v3 = 0;
      }
      v14 = v3;
      if ((v12 & 1) != 0)

      v11 = (id)objc_msgSend(v32, "instantiateWithOwner:options:", 0, v14);
      if (objc_msgSend(v11, "count") == 1)
      {
        v4 = (id)objc_msgSend(v11, "objectAtIndex:", 0);
        v5 = v33;
        v33 = v4;

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9 = v33;
        v10 = location;
        AXPerformSafeBlock();
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v9, 0);
      }
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    v38 = v33;
    v34 = 1;
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v38 = 0;
    v34 = 1;
  }
  objc_storeStrong(&location, 0);
  return v38;
}

void __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_nibMapForType:", *(unsigned int *)(a1 + 56));
  v1 = (id)objc_msgSend(v5, "valueForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

uint64_t __58__UITableViewAccessibility__axAttemptStoryboard_viewType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setReuseIdentifier:", *(_QWORD *)(a1 + 40), a1, a1);
}

- (id)_axAttemptCreationOfViewType:(id)obj identifier:
{
  id v3;
  id v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11[2];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  int v19;
  id location;
  int v21;
  void *v22;
  id v23;

  v22 = a1;
  v21 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v22)
  {
    v18 = -[UITableViewAccessibility _axAttemptStoryboard:viewType:](v22, location, v21);
    if (!v18)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 1342177280;
      v16 = 32;
      v17 = 0;
      v11[1] = &v13;
      v10 = v22;
      v12 = v21;
      v11[0] = location;
      AXPerformSafeBlock();
      if (v21 == 1)
      {
        v9 = objc_alloc((Class)v14[3]);
        v8 = (void *)objc_msgSend(v9, "initWithStyle:reuseIdentifier:", 0, location);
        v3 = v18;
        v18 = v8;

        objc_msgSend(v18, "setReuseIdentifier:", location);
      }
      else
      {
        v7 = objc_alloc((Class)v14[3]);
        v6 = (void *)objc_msgSend(v7, "initWithReuseIdentifier:", location);
        v4 = v18;
        v18 = v6;

      }
      objc_storeStrong(v11, 0);
      objc_storeStrong(&v10, 0);
      _Block_object_dispose(&v13, 8);
    }
    v23 = v18;
    v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v23 = 0;
    v19 = 1;
  }
  objc_storeStrong(&location, 0);
  return v23;
}

void __68__UITableViewAccessibility__axAttemptCreationOfViewType_identifier___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_classMapForType:", *(unsigned int *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (id)objc_msgSend(v2, "valueForKey:", *(_QWORD *)(a1 + 40));

}

- (unint64_t)accessibilitySemanticGroupChildrentCount
{
  unint64_t i;
  unint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  char v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  v5 = objc_msgSend(v6, "numberOfSections");
  v4 = 0;
  for (i = 0; i < v5; ++i)
    v4 += objc_msgSend(v9[0], "numberOfRowsInSection:", i);
  objc_storeStrong(v9, 0);
  return v4;
}

- (BOOL)_accessibilityShouldDisableCellReuse
{
  BOOL v2;

  if (a1)
  {
    if (-[UITableViewAccessibility _automationPrefersRealElements](a1))
    {
      return 0;
    }
    else
    {
      v2 = 0;
      if ((objc_msgSend(a1, "isAccessibilityOpaqueElementProvider") & 1) == 0)
        return UIAccessibilityIsVoiceOverRunning();
      return v2;
    }
  }
  else
  {
    return 0;
  }
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  objc_super v4;
  int v5;
  id v6;
  id location[2];
  UITableViewAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v8))
  {
    v6 = -[UITableViewAccessibility _axAttemptStoryboard:viewType:](v8, location[0], 1);
    if (!v6)
    {
      v6 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v8, 1, location[0]);

    }
    v9 = v6;
    v5 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UITableViewAccessibility;
    v9 = -[UITableViewAccessibility dequeueReusableCellWithIdentifier:](&v4, sel_dequeueReusableCellWithIdentifier_, location[0]);
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)dequeueReusableCellWithIdentifier:(id)a3 forIndexPath:(id)a4
{
  objc_super v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  UITableViewAccessibility *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  UITableViewAccessibility *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v19))
  {
    v16 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v19, 1, location[0]);
    if (v16)
    {
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __75__UITableViewAccessibility_dequeueReusableCellWithIdentifier_forIndexPath___block_invoke;
      v12 = &unk_24FF3DEB0;
      v13 = v19;
      v14 = v16;
      v15 = v17;
      AXPerformSafeBlock();
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
    }
    v20 = v16;
    v7 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v6.receiver = v19;
    v6.super_class = (Class)UITableViewAccessibility;
    v20 = -[UITableViewAccessibility dequeueReusableCellWithIdentifier:forIndexPath:](&v6, sel_dequeueReusableCellWithIdentifier_forIndexPath_, location[0], v17);
    v7 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v20;
}

uint64_t __75__UITableViewAccessibility_dequeueReusableCellWithIdentifier_forIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureCellForDisplay:forIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, a1);
}

- (id)dequeueReusableHeaderFooterViewWithIdentifier:(id)a3
{
  objc_super v4;
  int v5;
  id v6;
  id location[2];
  UITableViewAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UITableViewAccessibility _accessibilityShouldDisableCellReuse](v8))
  {
    v6 = -[UITableViewAccessibility _axAttemptCreationOfViewType:identifier:](v8, 2, location[0]);
    v9 = v6;
    v5 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UITableViewAccessibility;
    v9 = -[UITableViewAccessibility dequeueReusableHeaderFooterViewWithIdentifier:](&v4, sel_dequeueReusableHeaderFooterViewWithIdentifier_, location[0]);
    v5 = 1;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v4;
  id v5;
  UITableViewAccessibility *v6;
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  objc_super v16;
  BOOL v17;
  BOOL v18;
  SEL v19;
  UITableViewAccessibility *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility setEditing:animated:](&v16, sel_setEditing_animated_, a3, a4);
  -[UITableViewAccessibility _accessibilityClearChildren](v20, "_accessibilityClearChildren");
  if ((-[UITableViewAccessibility safeBoolForKey:](v20, "safeBoolForKey:", CFSTR("_hasSwipeToDeleteRow")) & 1) == 0)
  {
    v14 = 0;
    objc_opt_class();
    v5 = (id)-[UITableViewAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("focusedCell"));
    v13 = (id)__UIAccessibilityCastAsClass();

    v12 = v13;
    objc_storeStrong(&v13, 0);
    v15 = v12;
    v11 = (id)objc_msgSend(v12, "_accessibilityIndexPath");
    v4 = objc_msgSend(v15, "isEditing");
    if ((v4 & 1) != v18)
    {
      if (v11)
      {
        v6 = v20;
        v7 = v15;
        v9 = v18;
        v8 = v11;
        v10 = v17;
        AXPerformSafeBlock();
        objc_storeStrong(&v8, 0);
        objc_storeStrong(&v7, 0);
        objc_storeStrong((id *)&v6, 0);
      }
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v15, 0);
  }
}

uint64_t __48__UITableViewAccessibility_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupCell:forEditing:atIndexPath:animated:updateSeparators:", *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 56) & 1, *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 57) & 1, 1, a1, a1);
}

- (void)setCountString:(id)a3
{
  id v3;
  objc_super v4;
  id v5;
  id location[2];
  UITableViewAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[UITableViewAccessibility safeValueForKey:](v7, "safeValueForKey:");
  v4.receiver = v7;
  v4.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility setCountString:](&v4, sel_setCountString_, location[0]);
  v3 = (id)-[UITableViewAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_countLabel"));
  if (v5 != v3)
    -[UITableViewAccessibility _accessibilityClearChildren](v7, "_accessibilityClearChildren");
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_reuseTableViewSubview:(id)a3 viewType:(int)a4
{
  id *v4;
  id v6;
  objc_super v7;
  int v8;
  id location[2];
  UITableViewAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v7.receiver = v10;
  v7.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _reuseTableViewSubview:viewType:](&v7, sel__reuseTableViewSubview_viewType_, location[0], a4);
  v6 = (id)-[UITableViewAccessibility _accessibilityOpaqueElementParent](v10, "_accessibilityOpaqueElementParent");
  if (!v6
    && -[UITableViewAccessibility isAccessibilityOpaqueElementProvider](v10, "isAccessibilityOpaqueElementProvider"))
  {
    objc_storeStrong(&v6, v10);
  }
  objc_msgSend(v6, "_accessibilityDidReuseOpaqueElementView:", location[0], &v6);
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_swipeDeletionCommitted
{
  objc_super v3;
  char v4;
  SEL v5;
  UITableViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  if ((-[UITableViewAccessibility _accessibilityShouldConsiderSwipeDeletionCommitted]((uint64_t)self) & 1) != 0)
    return 1;
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewAccessibility;
  return -[UITableViewAccessibility _swipeDeletionCommitted](&v3, sel__swipeDeletionCommitted);
}

- (void)_cellDidShowSelectedBackground:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _cellDidShowSelectedBackground:](&v3, sel__cellDidShowSelectedBackground_, location[0]);
  -[UITableViewAccessibility _axUpdateSelectedBackgroundVisibilityForCell:visible:](v5, "_axUpdateSelectedBackgroundVisibilityForCell:visible:", location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)_cellDidHideSelectedBackground:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _cellDidHideSelectedBackground:](&v3, sel__cellDidHideSelectedBackground_, location[0]);
  -[UITableViewAccessibility _axUpdateSelectedBackgroundVisibilityForCell:visible:](v5, "_axUpdateSelectedBackgroundVisibilityForCell:visible:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)_axUpdateSelectedBackgroundVisibilityForCell:(id)a3 visible:(BOOL)a4
{
  char v5;
  id location[2];
  UITableViewAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_msgSend(location[0], "_accessibilityBoolValueForKey:") & 1;
  objc_msgSend(location[0], "_accessibilitySetBoolValue:forKey:", a4, CFSTR("AXIsShowingSelectedBackground"));
  if (a4
    && (v5 & 1) == 0
    && (-[UITableViewAccessibility allowsMultipleSelection](v7, "allowsMultipleSelection") & 1) == 0
    && (objc_msgSend(location[0], "isSelected") & 1) == 0)
  {
    objc_msgSend(location[0], "_accessibilitySetNativeFocus");
  }
  objc_storeStrong(location, 0);
}

- (id)accessibilityCellForRowAtIndexPath:(id)a3
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double MinY;
  double MaxY;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  UITableViewAccessibility *v17;
  __int128 v18;
  __int128 v19;
  CGRect rect;
  CGRect v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  UITableViewAccessibility *v29;
  id v30[2];
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37[2];
  double v38;
  int v39;
  char v40;
  id v41;
  id location[2];
  UITableViewAccessibility *v43;
  id v44;
  CGRect v45;
  CGRect v46;

  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  v16 = 1;
  if (location[0])
  {
    v15 = objc_msgSend(location[0], "section");
    v16 = 1;
    if (v15 < -[UITableViewAccessibility _axNumberOfSections](v43))
    {
      v14 = objc_msgSend(location[0], "row");
      v16 = 1;
      if (v14 < -[UITableViewAccessibility numberOfRowsInSection:](v43, "numberOfRowsInSection:", objc_msgSend(location[0], "section")))
      {
        v13 = objc_msgSend(location[0], "row");
        v41 = (id)-[UITableViewAccessibility dataSource](v43, "dataSource");
        v40 = 1;
        v16 = v13 >= (int)objc_msgSend(v41, "tableView:numberOfRowsInSection:", v43, objc_msgSend(location[0], "section"));
      }
    }
  }
  if ((v40 & 1) != 0)

  if (v16)
  {
    v44 = 0;
    v39 = 1;
  }
  else
  {
    -[UITableViewAccessibility setReusableCellsEnabled:](v43, "setReusableCellsEnabled:", 0);
    -[UITableViewAccessibility safeCGSizeForKey:](v43, "safeCGSizeForKey:", CFSTR("contentSize"));
    v37[1] = v3;
    v38 = v4;
    v31 = 0;
    v32 = &v31;
    v33 = 838860800;
    v34 = 48;
    v35 = __Block_byref_object_copy__20;
    v36 = __Block_byref_object_dispose__20;
    v37[0] = 0;
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke;
    v28 = &unk_24FF3DAB0;
    v30[1] = &v31;
    v29 = v43;
    v30[0] = location[0];
    AXPerformSafeBlock();
    objc_msgSend((id)v32[5], "layoutSubviews");
    -[UITableViewAccessibility safeCGSizeForKey:](v43, "safeCGSizeForKey:", CFSTR("contentSize"));
    v22 = v5;
    v23 = v6;
    objc_msgSend((id)v32[5], "accessibilityFrame");
    v21 = v45;
    MaxY = CGRectGetMaxY(v45);
    -[UITableViewAccessibility accessibilityFrame](v43, "accessibilityFrame");
    rect = v46;
    MinY = CGRectGetMinY(v46);
    v7 = MaxY;
    if (MaxY < MinY)
    {
      -[UITableViewAccessibility _accessibilityContentOffset](v43, "_accessibilityContentOffset", MaxY);
      *(_QWORD *)&v19 = v8;
      *((double *)&v19 + 1) = v9 + v23 - v38;
      v17 = v43;
      v18 = v19;
      AXPerformSafeBlock();
      objc_storeStrong((id *)&v17, 0);
    }
    -[UITableViewAccessibility setReusableCellsEnabled:](v43, "setReusableCellsEnabled:", 1, v7);
    v44 = (id)v32[5];
    v39 = 1;
    objc_storeStrong(v30, 0);
    objc_storeStrong((id *)&v29, 0);
    _Block_object_dispose(&v31, 8);
    objc_storeStrong(v37, 0);
  }
  objc_storeStrong(location, 0);
  return v44;
}

void __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  v1 = objc_msgSend(*(id *)(a1 + 32), "_createPreparedCellForRowAtIndexPath:willDisplay:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  location[0] = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "tableView:didEndDisplayingCell:forRowAtIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  objc_storeStrong(location, 0);
}

uint64_t __63__UITableViewAccessibility_accessibilityCellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48), a1, a1);
}

- (void)_axPostLayoutChange
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilityInternalData
{
  id v2;
  void *v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    v2 = (id)objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    if (!v2)
    {
      v2 = (id)objc_msgSend(objc_allocWithZone((Class)_AXTableViewInternal), "init");

      objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXInternalData"));
      -[UITableViewAccessibility _accessibilityInitializeInternalData](v3);
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

- (void)_accessibilityInitializeInternalData
{
  id v1;
  id v2;
  id v3;
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22[3];
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39[3];
  uint64_t v40;
  uint64_t *v41;
  int v42;
  int v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v51 = a1;
  if (a1)
  {
    objc_msgSend(v51, "_accessibilityRemoveValueForKey:", CFSTR("isAXElement"));
    v50 = (id)-[UITableViewAccessibility _accessibilityInternalData](v51);
    v49 = -[UITableViewAccessibility _axNumberOfSections](v51);
    v48 = 0;
    v47 = 0;
    v46 = 0;
    v45 = 0;
    while ((unint64_t)v47 < v49)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x20000000;
      v43 = 32;
      v44 = 0;
      v34 = MEMORY[0x24BDAC760];
      v35 = -1073741824;
      v36 = 0;
      v37 = __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke;
      v38 = &unk_24FF3E1F8;
      v39[1] = &v40;
      v39[0] = v51;
      v39[2] = v47;
      AXPerformSafeBlock();
      v33 = v41[3] & 1;
      objc_storeStrong(v39, 0);
      _Block_object_dispose(&v40, 8);
      if ((v33 & 1) != 0)
      {
        ++v48;
        v20 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        v16 = (void *)MEMORY[0x24BDBCE70];
        v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v47);
        v18 = (id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", CFSTR("header"), CFSTR("type"), v19, CFSTR("offset"), 0);
        v65 = v46;
        v64 = 1;
        v66 = v46;
        v67 = 1;
        v31 = v46;
        v32 = 1;
        v17 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v46, 1);
        objc_msgSend(v20, "setObject:forKey:", v18);

      }
      v46 = v48;
      v30 = 0;
      v30 = objc_msgSend(v51, "numberOfRowsInSection:", v47);
      v48 += v30;
      if (v30 > 0)
      {
        v15 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        v11 = (void *)MEMORY[0x24BDBCE70];
        v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v45);
        v13 = (id)objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", CFSTR("row"), CFSTR("type"), v14, CFSTR("offset"), 0);
        v61 = v46;
        v60 = v48 - v46;
        v62 = v46;
        v63 = v48 - v46;
        v28 = v46;
        v29 = v48 - v46;
        v12 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v46, v48 - v46);
        objc_msgSend(v15, "setObject:forKey:", v13);

      }
      v45 += v30;
      v46 = v48;
      v23 = 0;
      v24 = &v23;
      v25 = 0x20000000;
      v26 = 32;
      v27 = 0;
      v22[1] = &v23;
      v22[0] = v51;
      v22[2] = v47;
      AXPerformSafeBlock();
      v21 = v24[3] & 1;
      objc_storeStrong(v22, 0);
      _Block_object_dispose(&v23, 8);
      if ((v21 & 1) != 0)
      {
        ++v48;
        v10 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
        v6 = (void *)MEMORY[0x24BDBCE70];
        v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v47);
        v8 = (id)objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", CFSTR("footer"), CFSTR("type"), v9, CFSTR("offset"), 0);
        v57 = v46;
        v56 = 1;
        v58 = v46;
        v59 = 1;
        v7 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v46, 1);
        objc_msgSend(v10, "setObject:forKey:", v8);

      }
      v46 = v48;
      ++v47;
    }
    v1 = (id)objc_msgSend(v51, "safeValueForKey:", CFSTR("_countLabel"));
    v5 = v1 == 0;

    if (!v5)
    {
      ++v48;
      v4 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v50);
      v3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("tableCount"), CFSTR("type"), 0);
      v53 = v48 - 1;
      v52 = 1;
      v54 = v48 - 1;
      v55 = 1;
      v2 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v48 - 1, 1);
      objc_msgSend(v4, "setObject:forKey:", v3);

    }
    -[_AXTableViewInternal setAccessibleElementCount:]((uint64_t)v50, v48);
    objc_storeStrong(&v50, 0);
  }
}

- (id)_accessibilityInternalDataRetrieveOnly
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
  else
    return 0;
}

- (void)_accessibilityClearChildren
{
  id v2;
  void *v3;
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
  id obj;
  uint64_t v17;
  _QWORD v18[8];
  id v19;
  _QWORD __b[8];
  id v21;
  id location[2];
  UITableViewAccessibility *v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
  if (location[0])
  {
    v15 = (id)-[_AXTableViewInternal children]((uint64_t)location[0]);
    v14 = (id)objc_msgSend(v15, "allValues");
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_449);

    memset(__b, 0, sizeof(__b));
    obj = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)location[0]);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    if (v17)
    {
      v11 = *(_QWORD *)__b[2];
      v12 = 0;
      v13 = v17;
      while (1)
      {
        v10 = v12;
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(obj);
        v21 = *(id *)(__b[1] + 8 * v12);
        objc_msgSend(v21, "setAccessibilityContainer:", 0);
        ++v12;
        if (v10 + 1 >= v13)
        {
          v12 = 0;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
          if (!v13)
            break;
        }
      }
    }

    memset(v18, 0, sizeof(v18));
    v8 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)location[0]);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v18, v24, 16);
    if (v9)
    {
      v5 = *(_QWORD *)v18[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)v18[2] != v5)
          objc_enumerationMutation(v8);
        v19 = *(id *)(v18[1] + 8 * v6);
        objc_msgSend(v19, "setAccessibilityContainer:", 0);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v18, v24, 16);
          if (!v7)
            break;
        }
      }
    }

    -[UITableViewAccessibility _accessibilityRemoveValueForKey:](v23, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
    objc_msgSend((id)_ReloadTimer, "invalidate");
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v23, sel__axPostLayoutChange, 0, 0, 0.5);
    v3 = (void *)_ReloadTimer;
    _ReloadTimer = (uint64_t)v2;

  }
  objc_storeStrong(location, 0);
}

void __55__UITableViewAccessibility__accessibilityClearChildren__block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAccessibilityContainer:", 0);
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  SEL v7;
  UITableViewAccessibility *v8;
  CGRect result;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility accessibilityFrame](&v6, sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (uint64_t)_accessibilitySearchTableViewVisible
{
  id v2;
  void *v3;
  char v4;

  v3 = a1;
  if (a1)
  {
    v2 = -[UITableViewAccessibility _accessibilityInternalDataRetrieveOnly](v3);
    v4 = -[_AXTableViewInternal searchTableViewVisible]((uint64_t)v2) & 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_accessibilitySearchControllerDimmingViewVisible
{
  id v2;
  void *v3;
  char v4;

  v3 = a1;
  if (a1)
  {
    v2 = -[UITableViewAccessibility _accessibilityInternalDataRetrieveOnly](v3);
    v4 = -[_AXTableViewInternal searchControllerDimmingViewVisible]((uint64_t)v2) & 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  uint64_t v10;
  int v11;
  id location;
  id v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v13)
  {
    if (location != v13
      && ((objc_msgSend(location, "isAccessibilityElement") & 1) != 0
       || (objc_msgSend(location, "_accessibilityHasOrderedChildren") & 1) != 0))
    {
      v14 = 1;
      v11 = 1;
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(location, "subviews");
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
      if (v8)
      {
        v4 = *(_QWORD *)__b[2];
        v5 = 0;
        v6 = v8;
        while (1)
        {
          v3 = v5;
          if (*(_QWORD *)__b[2] != v4)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(__b[1] + 8 * v5);
          if ((-[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:](v13, v10) & 1) != 0)
            break;
          ++v5;
          if (v3 + 1 >= v6)
          {
            v5 = 0;
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
            if (!v6)
              goto LABEL_15;
          }
        }
        v14 = 1;
        v11 = 1;
      }
      else
      {
LABEL_15:
        v11 = 0;
      }

      if (!v11)
      {
        v14 = 0;
        v11 = 1;
      }
    }
  }
  else
  {
    v14 = 0;
    v11 = 1;
  }
  objc_storeStrong(&location, 0);
  return v14 & 1;
}

- (uint64_t)_accessibilityHasAccessibleOrContainerSubview
{
  id v2;
  unsigned __int8 v3;
  id location;
  void *v5;
  char v6;

  v5 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v5, "_accessibilityValueForKey:", CFSTR("AXHasAccessibleOrContainerSubview"));
    if (location)
    {
      v6 = objc_msgSend(location, "BOOLValue") & 1;
    }
    else
    {
      v3 = -[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubviewWithSubviewTree:](v5, v5) & 1;
      v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:");

      v6 = v3 & 1;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v2;
  UITableViewAccessibility *v4;
  BOOL v5;
  id v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  id v13[2];
  uint64_t v14;
  uint64_t *v15;
  int v16;
  int v17;
  char v18;
  int v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  SEL v27;
  UITableViewAccessibility *v28;
  char v29;

  v28 = self;
  v27 = a2;
  if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self) & 1) != 0)
  {
    v29 = 1;
  }
  else if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](v28, "isAccessibilityOpaqueElementProvider"))
  {
    v25 = -[UITableViewAccessibility safeRangeForKey:](v28, "safeRangeForKey:", CFSTR("_visibleGlobalRows"));
    v26 = v2;
    LOBYTE(v7) = 0;
    if (!v2)
      v7 = -[UITableViewAccessibility _accessibilityHasAccessibleOrContainerSubview](v28) ^ 1;
    v29 = v7 & 1;
  }
  else
  {
    v6 = (id)-[UITableViewAccessibility isAccessibilityUserDefinedElement](v28, "isAccessibilityUserDefinedElement");

    if (v6)
    {
      v24.receiver = v28;
      v24.super_class = (Class)UITableViewAccessibility;
      v29 = -[UITableViewAccessibility isAccessibilityElement](&v24, sel_isAccessibilityElement);
    }
    else
    {
      v23 = -[UITableViewAccessibility accessibilityElementCount](v28, "accessibilityElementCount");
      v21 = 0;
      v5 = 0;
      if (!v23)
      {
        v22 = -[UITableViewAccessibility _accessibilityHeaderElement](v28, "_accessibilityHeaderElement");
        v21 = 1;
        v5 = v22 == 0;
      }
      if ((v21 & 1) != 0)

      if (v5)
      {
        v29 = 1;
      }
      else
      {
        v20 = (id)-[UITableViewAccessibility _accessibilityValueForKey:](v28, "_accessibilityValueForKey:", CFSTR("isAXElement"));
        if (v20)
        {
          v29 = objc_msgSend(v20, "BOOLValue") & 1;
          v19 = 1;
        }
        else
        {
          v14 = 0;
          v15 = &v14;
          v16 = 0x20000000;
          v17 = 32;
          v18 = 0;
          v4 = v28;
          v8 = MEMORY[0x24BDAC760];
          v9 = -1073741824;
          v10 = 0;
          v11 = __50__UITableViewAccessibility_isAccessibilityElement__block_invoke;
          v12 = &unk_24FF3EE68;
          v13[0] = v28;
          v13[1] = &v14;
          -[UITableViewAccessibility accessibilityEnumerateContainerElementsUsingBlock:](v4, "accessibilityEnumerateContainerElementsUsingBlock:", &v8);
          if ((v15[3] & 1) != 0)
          {
            v29 = 0;
            v19 = 1;
          }
          else
          {
            v19 = 0;
          }
          objc_storeStrong(v13, 0);
          _Block_object_dispose(&v14, 8);
        }
        objc_storeStrong(&v20, 0);
        if (!v19)
        {
          -[UITableViewAccessibility _accessibilitySetRetainedValue:forKey:](v28, "_accessibilitySetRetainedValue:forKey:", *MEMORY[0x24BDBD270], CFSTR("isAXElement"));
          v29 = 1;
        }
      }
    }
  }
  return v29 & 1;
}

void __50__UITableViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) != 0
    || (objc_msgSend(location[0], "_accessibilityHasOrderedChildren") & 1) != 0
    && objc_msgSend(location[0], "accessibilityElementCount") > 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetRetainedValue:forKey:", *MEMORY[0x24BDBD268], CFSTR("isAXElement"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  UITableViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v5, *MEMORY[0x24BDF76D8]);

  -[UITableViewAccessibility _accessibilityClearChildren](v5, "_accessibilityClearChildren");
  objc_msgSend((id)_ReloadTimer, "invalidate");
  objc_storeStrong((id *)&_ReloadTimer, 0);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility dealloc](&v3, sel_dealloc);
}

- (id)_accessibilityFooterElement
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableFooterView"));
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_accessibilityHeaderElement
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableHeaderView"));
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_accessibilityFuzzyHitTest:(id)obj withEvent:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obja;
  uint64_t v19;
  __int128 v20;
  CGRect rect;
  id v22[3];
  double v23;
  id v24;
  uint64_t v25;
  _QWORD __b[8];
  uint64_t v27;
  id v28[3];
  double v29;
  id v30;
  int v31;
  id location;
  _OWORD *v33;
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;

  v37 = *MEMORY[0x24BDAC8D0];
  v34 = a1;
  v33 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v34)
  {
    v30 = 0;
    v29 = 1.79769313e308;
    UIAccessibilityPointForPoint();
    v28[1] = v3;
    v28[2] = v4;
    v28[0] = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("indexPathsForVisibleRows"));
    memset(__b, 0, sizeof(__b));
    obja = v28[0];
    v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v19)
    {
      v15 = *(_QWORD *)__b[2];
      v16 = 0;
      v17 = v19;
      while (1)
      {
        v14 = v16;
        if (*(_QWORD *)__b[2] != v15)
          objc_enumerationMutation(obja);
        v27 = *(_QWORD *)(__b[1] + 8 * v16);
        v25 = 0;
        v25 = objc_msgSend(v34, "globalRowForRowAtIndexPath:", v27);
        if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = (id)objc_msgSend(v34, "accessibilityTableViewCellElementAtGlobalRow:", v25);
          objc_msgSend(v24, "accessibilityActivationPoint");
          v22[1] = v5;
          v22[2] = v6;
          AX_CGPointGetDistanceToPoint();
          v23 = v7;
          if (v7 < v29)
          {
            v29 = v23;
            objc_storeStrong(&v30, v24);
          }
          objc_storeStrong(&v24, 0);
        }
        ++v16;
        if (v14 + 1 >= v17)
        {
          v16 = 0;
          v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
          if (!v17)
            break;
        }
      }
    }

    if (v30)
    {
      v22[0] = (id)objc_msgSend(v30, "tableViewCell");
      objc_msgSend(v22[0], "bounds");
      rect = v38;
      CGRectGetMidX(v38);
      CGRectGetMidY(rect);
      CGPointMake_6();
      v13 = v33;
      objc_msgSend(v34, "convertPoint:fromView:", v22[0], v8, v9);
      *(_QWORD *)&v20 = v10;
      *((_QWORD *)&v20 + 1) = v11;
      *v13 = v20;
      v35 = v30;
      v31 = 1;
      objc_storeStrong(v22, 0);
    }
    else
    {
      v35 = 0;
      v31 = 1;
    }
    objc_storeStrong(v28, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v35 = 0;
    v31 = 1;
  }
  objc_storeStrong(&location, 0);
  return v35;
}

uint64_t __64__UITableViewAccessibility__accessibilitySearchResultsTableView__block_invoke(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UISearchDisplayControllerContainerView"));
  v6 = objc_opt_isKindOfClass() & 1;
  if (v6)
    *a4 = 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilitySubviews
{
  objc_super v3;
  id v4;
  id v5;
  id v6[2];
  UITableViewAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self) & 1) != 0)
  {
    v6[0] = -[UITableViewAccessibility _accessibilitySupplementaryHeaderViews](v7, "_accessibilitySupplementaryHeaderViews");
    v5 = -[UITableViewAccessibility _accessibilitySupplementaryFooterViews](v7, "_accessibilitySupplementaryFooterViews");
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v6[0]);
    objc_msgSend(v4, "addObjectsFromArray:", v5);
    v8 = v4;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(v6, 0);
  }
  else
  {
    v3.receiver = v7;
    v3.super_class = (Class)UITableViewAccessibility;
    v8 = -[UITableViewAccessibility _accessibilitySubviews](&v3, sel__accessibilitySubviews);
  }
  return v8;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  char v29;
  UITableViewAccessibility *v30;
  id v31;
  UITableViewAccessibility *v32;
  id v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  int v39;
  int v40;
  void (*v41)(uint64_t);
  void *v42;
  UITableViewAccessibility *v43;
  id v44[2];
  uint64_t v45;
  uint64_t *v46;
  int v47;
  int v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  id v52;
  id v53[3];
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  char v59;
  id v60;
  char v61;
  id v62;
  char v63;
  id v64;
  id v65[3];
  id v66;
  char v67;
  id v68;
  CGRect v69;
  id v70[2];
  int v71;
  int v72;
  __n128 (*v73)(uint64_t);
  void *v74;
  id v75[3];
  uint64_t v76;
  CGRect *v77;
  int v78;
  int v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  CGRect rect;
  id v84[4];
  int v85;
  int v86;
  __n128 (*v87)(uint64_t);
  void *v88;
  id v89[3];
  uint64_t v90;
  uint64_t *v91;
  int v92;
  int v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  CGRect v97;
  char v98;
  CGRect v99;
  unint64_t v100;
  char *v101;
  id v102;
  int v104;
  id v105;
  id *v106;
  char v107;
  uint64_t v108;
  int v109;
  int v110;
  BOOL (*v111)(uint64_t);
  void *v112;
  UITableViewAccessibility *v113;
  char v114;
  id location[2];
  UITableViewAccessibility *v116;
  CGPoint v117;
  UITableViewAccessibility *v118;
  CGRect v119;
  CGRect v120;

  v117 = a3;
  v116 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v114 = -[UITableViewAccessibility _accessibilityBoolValueForKey:](v116, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v107 = 0;
  v34 = 0;
  if (!v114)
  {
    v108 = MEMORY[0x24BDAC760];
    v109 = -1073741824;
    v110 = 0;
    v111 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v112 = &unk_24FF3E0C0;
    v113 = v116;
    v107 = 1;
    v106 = (id *)&v113;
    v34 = v111((uint64_t)&v108);
  }
  if (v34)
  {
    -[UITableViewAccessibility _accessibilitySetBoolValue:forKey:](v116, "_accessibilitySetBoolValue:forKey:", 1);
    v105 = (id)-[UITableViewAccessibility accessibilityHitTest:withEvent:](v116, "accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
    -[UITableViewAccessibility _accessibilitySetBoolValue:forKey:](v116, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v118 = (UITableViewAccessibility *)v105;
    v104 = 1;
    objc_storeStrong(&v105, 0);
  }
  else
  {
    v104 = 0;
  }
  if ((v107 & 1) != 0)
    objc_storeStrong(v106, 0);
  if (!v104)
  {
    if ((-[UITableViewAccessibility pointInside:withEvent:](v116, "pointInside:withEvent:", location[0], v117.x, v117.y) & 1) == 0)
    {
      v118 = 0;
      v104 = 1;
      goto LABEL_100;
    }
    if ((unsigned __int16)objc_msgSend(location[0], "_accessibilityHitTestType") == 3)
    {
      v118 = (UITableViewAccessibility *)(id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v116, "__accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
      v104 = 1;
      goto LABEL_100;
    }
    v32 = v116;
    v33 = -[UITableViewAccessibility _accessibilitySupplementaryHeaderViews](v116, "_accessibilitySupplementaryHeaderViews");
    v102 = (id)-[UITableViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v32, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v117.x, v117.y);

    if (v102
      || (v30 = v116,
          v31 = -[UITableViewAccessibility _accessibilitySupplementaryFooterViews](v116, "_accessibilitySupplementaryFooterViews"), v102 = (id)-[UITableViewAccessibility _accessibilityHitTestSupplementaryViews:point:withEvent:](v30, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v117.x, v117.y), 0, v31, v102))
    {
      v118 = (UITableViewAccessibility *)v102;
      v104 = 1;
    }
    else
    {
      if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](v116, "isAccessibilityOpaqueElementProvider"))
      {
        v118 = (UITableViewAccessibility *)(id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v116, "__accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
        v104 = 1;
        goto LABEL_99;
      }
      v101 = 0;
      v100 = -[UITableViewAccessibility _axNumberOfSections](v116);
      while ((unint64_t)v101 < v100)
      {
        -[UITableViewAccessibility rectForSection:](v116, "rectForSection:", v101);
        v99 = v119;
        if (CGRectContainsPoint(v119, v117))
          break;
        ++v101;
      }
      v98 = 0;
      if ((unint64_t)v101 >= v100)
        goto LABEL_40;
      memset(&v97, 0, sizeof(v97));
      v90 = 0;
      v91 = &v90;
      v92 = 0x10000000;
      v93 = 64;
      v94 = &unk_230DEFD8E;
      v95 = 0u;
      v96 = 0u;
      v84[3] = (id)MEMORY[0x24BDAC760];
      v85 = -1073741824;
      v86 = 0;
      v87 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_487;
      v88 = &unk_24FF3E1F8;
      v89[1] = &v90;
      v89[0] = v116;
      v89[2] = v101;
      AXPerformSafeBlock();
      v97 = *(CGRect *)((_BYTE *)v91 + 1);
      objc_storeStrong(v89, 0);
      _Block_object_dispose(&v90, 8);
      if (CGRectContainsPoint(v97, v117))
      {
        v84[0] = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v116, (uint64_t)v101, 1);
        v4 = (id)objc_msgSend(v84[0], "_accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
        v5 = v102;
        v102 = v4;

        if (v102)
        {
          v118 = (UITableViewAccessibility *)v102;
          v104 = 1;
        }
        else
        {
          v98 = 1;
          v104 = 0;
        }
        objc_storeStrong(v84, 0);
        if (v104)
          goto LABEL_99;
      }
      else
      {
        v28 = (id)-[UITableViewAccessibility safeValueForKey:](v116, "safeValueForKey:", CFSTR("allowsHeaderViewsToFloat"));
        v29 = objc_msgSend(v28, "BOOLValue");

        if ((v29 & 1) != 0)
        {
          memset(&rect, 0, sizeof(rect));
          v76 = 0;
          v77 = (CGRect *)&v76;
          v78 = 0x10000000;
          v79 = 64;
          v80 = &unk_230DEFD8E;
          v81 = 0u;
          v82 = 0u;
          v70[1] = (id)MEMORY[0x24BDAC760];
          v71 = -1073741824;
          v72 = 0;
          v73 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_491;
          v74 = &unk_24FF3E1F8;
          v75[1] = &v76;
          v75[0] = v116;
          v75[2] = v101;
          AXPerformSafeBlock();
          rect = v77[1];
          objc_storeStrong(v75, 0);
          _Block_object_dispose(&v76, 8);
          if (CGRectContainsPoint(rect, v117))
          {
            v70[0] = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v116, (uint64_t)v101, 1);
            v6 = (id)objc_msgSend(v70[0], "_accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
            v7 = v102;
            v102 = v6;

            if (v102)
            {
              v118 = (UITableViewAccessibility *)v102;
              v104 = 1;
            }
            else
            {
              v98 = 1;
              v104 = 0;
            }
            objc_storeStrong(v70, 0);
            if (v104)
              goto LABEL_99;
          }
        }
      }
      -[UITableViewAccessibility rectForFooterInSection:](v116, "rectForFooterInSection:", v101);
      v69 = v120;
      if (!CGRectContainsPoint(v120, v117))
        goto LABEL_40;
      v68 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v116, (uint64_t)v101, 0);
      v8 = (id)objc_msgSend(v68, "_accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
      v9 = v102;
      v102 = v8;

      if (v102)
      {
        v118 = (UITableViewAccessibility *)v102;
        v104 = 1;
      }
      else
      {
        v98 = 1;
        v104 = 0;
      }
      objc_storeStrong(&v68, 0);
      if (!v104)
      {
LABEL_40:
        NSClassFromString(CFSTR("UISearchResultsTableView"));
        v67 = objc_opt_isKindOfClass() & 1;
        if ((-[UITableViewAccessibility _accessibilitySearchControllerDimmingViewVisible](v116) & 1) != 0
          && (v67 & 1) == 0)
        {
          v118 = 0;
          v104 = 1;
          goto LABEL_99;
        }
        if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v116) & 1) != 0)
        {
          v66 = -[UITableViewAccessibility _accessibilitySearchResultsTableView](v116);
          v27 = v66;
          objc_msgSend(v66, "convertPoint:fromView:", v116, v117);
          v65[1] = v10;
          v65[2] = v11;
          v118 = (UITableViewAccessibility *)(id)objc_msgSend(v27, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v10, *(double *)&v11);
          v104 = 1;
          objc_storeStrong(&v66, 0);
          goto LABEL_99;
        }
        v65[0] = (id)-[UITableViewAccessibility __accessibilityHitTest:withEvent:](v116, "__accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
        v63 = 0;
        v61 = 0;
        v59 = 0;
        v26 = 0;
        if (v65[0])
        {
          v26 = 0;
          if (v65[0] != v116)
          {
            objc_opt_class();
            v26 = 0;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v64 = (id)objc_msgSend(v65[0], "_accessibilityAncestorIsKindOf:", objc_opt_class());
              v63 = 1;
              v26 = 0;
              if (!v64)
              {
                v62 = (id)objc_msgSend(v65[0], "_accessibilityAncestorIsKindOf:", objc_opt_class());
                v61 = 1;
                v26 = 0;
                if (!v62)
                {
                  v60 = (id)objc_msgSend(v65[0], "accessibilityContainer");
                  v59 = 1;
                  v26 = v60 != 0;
                }
              }
            }
          }
        }
        if ((v59 & 1) != 0)

        if ((v61 & 1) != 0)
        if ((v63 & 1) != 0)

        if (!v26)
          goto LABEL_63;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_63;
        objc_msgSend(v65[0], "convertPoint:fromView:", v116, v117);
        v56 = v12;
        v57 = v13;
        v58 = (id)objc_msgSend(v65[0], "_accessibilityHitTest:withEvent:", location[0], v12, v13);
        if ((objc_msgSend(v58, "isAccessibilityElement") & 1) != 0)
        {
          v118 = (UITableViewAccessibility *)v58;
          v104 = 1;
        }
        else
        {
          v104 = 0;
        }
        objc_storeStrong(&v58, 0);
        if (!v104)
        {
LABEL_63:
          if (v100)
          {
            if (-[UITableViewAccessibility accessibilityElementCount](v116, "accessibilityElementCount"))
            {
              v53[0] = (id)-[UITableViewAccessibility indexPathForRowAtPoint:](v116, "indexPathForRowAtPoint:", v117.x, v117.y);
              v45 = 0;
              v46 = &v45;
              v47 = 838860800;
              v48 = 48;
              v49 = __Block_byref_object_copy__20;
              v50 = __Block_byref_object_dispose__20;
              v51 = 0;
              v38 = MEMORY[0x24BDAC760];
              v39 = -1073741824;
              v40 = 0;
              v41 = __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3;
              v42 = &unk_24FF3DAB0;
              v44[1] = &v45;
              v43 = v116;
              v44[0] = v53[0];
              AXPerformSafeBlock();
              v37 = (id)v46[5];
              objc_storeStrong(v44, 0);
              objc_storeStrong((id *)&v43, 0);
              _Block_object_dispose(&v45, 8);
              objc_storeStrong(&v51, 0);
              v52 = v37;
              if (v53[0] && v52)
                goto LABEL_79;
              if ((-[UITableViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v116, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0)
              {
                v18 = -[UITableViewAccessibility _accessibilityFuzzyHitTest:withEvent:](v116, &v117, location[0]);
                v19 = v102;
                v102 = v18;

              }
              if (v102)
              {
LABEL_79:
                v36 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v116, "globalRowForRowAtIndexPath:", v53[0]);
                if (v36 != 0x7FFFFFFFFFFFFFFFLL && !v102)
                {
                  v20 = -[UITableViewAccessibility accessibilityTableViewCellElementAtGlobalRow:](v116, "accessibilityTableViewCellElementAtGlobalRow:", v36);
                  v21 = v102;
                  v102 = v20;

                }
                if (v102)
                {
                  v35 = (id)objc_msgSend(v102, "_accessibilityHitTest:withEvent:", location[0], v117.x, v117.y);
                  if (!v35
                    && (-[UITableViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v116, "_accessibilityHitTestShouldFallbackToNearestChild") & 1) != 0&& (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0)
                  {
                    v22 = (id)objc_msgSend(v102, "accessibilityElementAtIndex:", 0);
                    v23 = v35;
                    v35 = v22;

                  }
                  objc_storeStrong(&v102, v35);
                  objc_storeStrong(&v35, 0);
                }
                if (v102 && (objc_msgSend(v102, "isAccessibilityElement") & 1) != 0
                  || v102 && (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) != 0)
                {
                  v118 = (UITableViewAccessibility *)v102;
                  v104 = 1;
                }
                else
                {
                  if ((v98 & 1) != 0)
                    v118 = 0;
                  else
                    v118 = v116;
                  v104 = 1;
                }
              }
              else
              {
                v118 = v116;
                v104 = 1;
              }
              objc_storeStrong(&v52, 0);
              objc_storeStrong(v53, 0);
              goto LABEL_98;
            }
            goto LABEL_71;
          }
          v25 = (id)-[UITableViewAccessibility safeValueForKey:](v116, "safeValueForKey:", CFSTR("frame"));
          objc_msgSend(v25, "CGRectValue");
          v53[1] = v14;
          v53[2] = v15;
          v54 = v16;
          v55 = v17;

          if ((objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) != 0
            || -[UITableViewAccessibility isAccessibilityElement](v116, "isAccessibilityElement")
            && v54 > 0.0
            && v55 > 0.0)
          {
LABEL_71:
            v118 = v116;
            v104 = 1;
            goto LABEL_98;
          }
          v118 = 0;
          v104 = 1;
        }
LABEL_98:
        objc_storeStrong(v65, 0);
      }
    }
LABEL_99:
    objc_storeStrong(&v102, 0);
  }
LABEL_100:
  objc_storeStrong(location, 0);
  return v118;
}

BOOL __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_481);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_BaseImplementation;
}

void __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

__n128 __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_487(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "rectForHeaderInSection:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)accessibilityTableViewSectionElementAtSection:(char)a3 isHeader:
{
  id v3;
  id v5;
  id v6;
  id obj;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id location;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v22;

  v21 = a1;
  v20 = a2;
  v19 = a3 & 1;
  if (a1)
  {
    v18 = -[UITableViewAccessibility _accessibilityInternalData](v21);
    v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
    v14 = 0;
    v12 = 0;
    v10 = 0;
    v8 = 0;
    if ((v19 & 1) != 0)
    {
      v15 = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)v18);
      v14 = 1;
      v13 = (id)objc_msgSend(v15, "objectForKey:", v17);
      v12 = 1;
      v3 = v13;
    }
    else
    {
      v11 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)v18);
      v10 = 1;
      v9 = (id)objc_msgSend(v11, "objectForKey:", v17);
      v8 = 1;
      v3 = v9;
    }
    location = v3;
    if ((v8 & 1) != 0)

    if ((v10 & 1) != 0)
    if ((v12 & 1) != 0)

    if ((v14 & 1) != 0)
    if (!location)
    {
      obj = (id)objc_msgSend(objc_allocWithZone((Class)UITableViewSectionElement), "initWithAccessibilityContainer:", v21);
      -[UITableViewSectionElement setIsHeader:]((uint64_t)obj, v19 & 1);
      -[UITableViewSectionElement setSection:]((uint64_t)obj, v20);
      objc_storeStrong(&location, obj);
      if ((v19 & 1) != 0)
      {
        v6 = (id)-[_AXTableViewInternal sectionHeaders]((uint64_t)v18);
        objc_msgSend(v6, "setObject:forKey:", location, v17);

      }
      else
      {
        v5 = (id)-[_AXTableViewInternal sectionFooters]((uint64_t)v18);
        objc_msgSend(v5, "setObject:forKey:", location, v17);

      }
      objc_storeStrong(&obj, 0);
    }
    v22 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

__n128 __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_491(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "_floatingRectForHeaderInSection:heightCanBeGuessed:", *(_QWORD *)(a1 + 48), 0);
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

void __60__UITableViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityVisibleHeaderSections
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  UITableViewAccessibility *v18;
  id v19[2];
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  uint64_t v30;
  id v31;
  id v32[2];
  UITableViewAccessibility *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  v32[0] = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathsForVisibleRows"));
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  memset(__b, 0, sizeof(__b));
  obj = v32[0];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v29 = *(id *)(__b[1] + 8 * v7);
      v4 = objc_msgSend(v29, "section");
      if (v4 != v30)
      {
        v20 = 0;
        v21 = &v20;
        v22 = 838860800;
        v23 = 48;
        v24 = __Block_byref_object_copy__20;
        v25 = __Block_byref_object_dispose__20;
        v26 = 0;
        v13 = MEMORY[0x24BDAC760];
        v14 = -1073741824;
        v15 = 0;
        v16 = __63__UITableViewAccessibility__accessibilityVisibleHeaderSections__block_invoke;
        v17 = &unk_24FF3DAB0;
        v19[1] = &v20;
        v18 = v33;
        v19[0] = v29;
        AXPerformSafeBlock();
        v12 = (id)v21[5];
        objc_storeStrong(v19, 0);
        objc_storeStrong((id *)&v18, 0);
        _Block_object_dispose(&v20, 8);
        objc_storeStrong(&v26, 0);
        v27 = v12;
        if (v12)
        {
          v11 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v33, objc_msgSend(v29, "section"), 1);
          if (v11)
            objc_msgSend(v31, "addObject:", v11);
          objc_storeStrong(&v11, 0);
        }
        v30 = objc_msgSend(v29, "section");
        objc_storeStrong(&v27, 0);
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (!v8)
          break;
      }
    }
  }

  v3 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(v32, 0);
  return v3;
}

void __63__UITableViewAccessibility__accessibilityVisibleHeaderSections__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_visibleHeaderViewForSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityUserTestingVisibleSections
{
  uint64_t v2;
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  id location;
  id v15;
  _QWORD __b[8];
  id v17;
  uint64_t v18;
  id v19;
  id v20[2];
  UITableViewAccessibility *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathsForVisibleRows"));
  v19 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  memset(__b, 0, sizeof(__b));
  obj = v20[0];
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v17 = *(id *)(__b[1] + 8 * v9);
      v2 = objc_msgSend(v17, "section");
      if (v2 != v18)
      {
        v15 = (id)-[UITableViewAccessibility _visibleHeaderViewForSection:](v21, "_visibleHeaderViewForSection:", objc_msgSend(v17, "section"));
        if (v15)
        {
          location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v21, objc_msgSend(v17, "section"), 1);
          if (location)
            objc_msgSend(v19, "addObject:", location);
          objc_storeStrong(&location, 0);
        }
        v3 = (id)-[UITableViewAccessibility _visibleFooterViewForSection:](v21, "_visibleFooterViewForSection:", objc_msgSend(v17, "section"));
        v4 = v15;
        v15 = v3;

        if (v15)
        {
          v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v21, objc_msgSend(v17, "section"), 0);
          if (v13)
            objc_msgSend(v19, "addObject:", v13);
          objc_storeStrong(&v13, 0);
        }
        v18 = objc_msgSend(v17, "section");
        objc_storeStrong(&v15, 0);
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
        if (!v10)
          break;
      }
    }
  }

  v6 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
  return v6;
}

- (uint64_t)_accessibilitySkipItemsInSectionList:(void *)a3 view:
{
  char isKindOfClass;
  id v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  _QWORD __b[8];
  id *v21;
  char v22;
  int v23;
  id v24;
  id location;
  uint64_t v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v24 = 0;
  objc_storeStrong(&v24, a3);
  if (v26)
  {
    v22 = 0;
    memset(__b, 0, sizeof(__b));
    v12 = location;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v13)
    {
      v9 = *(_QWORD *)__b[2];
      v10 = 0;
      v11 = v13;
      while (1)
      {
        v8 = v10;
        if (*(_QWORD *)__b[2] != v9)
          objc_enumerationMutation(v12);
        v21 = *(id **)(__b[1] + 8 * v10);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v18 = 0;
        v7 = 0;
        if ((isKindOfClass & 1) != 0)
        {
          v19 = -[UITableViewSectionElement accessibilityChildren](v21);
          v18 = 1;
          v7 = objc_msgSend(v19, "count") == 1;
        }
        if ((v18 & 1) != 0)

        if (v7)
        {
          v5 = -[UITableViewSectionElement accessibilityChildren](v21);
          v17 = (id)objc_msgSend(v5, "firstObject");

          objc_opt_class();
          v15 = 0;
          v6 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v17);
            v15 = 1;
            v6 = v16 == v24;
          }
          if ((v15 & 1) != 0)

          if (v6)
          {
            v22 = 1;
            v23 = 2;
          }
          else
          {
            v23 = 0;
          }
          objc_storeStrong(&v17, 0);
          if (v23)
            break;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v11)
            goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      v23 = 0;
    }

    v27 = v22 & 1;
    v23 = 1;
  }
  else
  {
    v27 = 0;
    v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
  return v27 & 1;
}

- (uint64_t)_accessibilityCheckForAlreadyExistingCellElementForCell:(void *)a3 inItems:
{
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  id location;
  id v11;
  char v12;

  v11 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isAccessibilityOpaqueElementProvider") & 1) == 0)
    {
      v7 = location;
      v6 = (id)objc_msgSend(v11, "indexPathForCell:", v7);
      if (v6)
      {
        v5 = (id)objc_msgSend(v11, "_accessibilityTableViewCellElementForIndexPath:", v6);
        v12 = objc_msgSend(v9, "containsObject:", v5) & 1;
        v8 = 1;
        objc_storeStrong(&v5, 0);
      }
      else
      {
        v12 = 0;
        v8 = 1;
      }
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
    }
    else
    {
      v12 = 0;
      v8 = 1;
    }
  }
  else
  {
    v12 = 0;
    v8 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  return v12 & 1;
}

- (id)automationElements
{
  id v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id obj;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[8];
  uint64_t v24;
  _QWORD __b[8];
  id v26;
  id location;
  id v28;
  char v29;
  id v30;
  objc_super v31;
  id v32[2];
  UITableViewAccessibility *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UITableViewAccessibility;
  v21 = -[UITableViewAccessibility automationElements](&v31, sel_automationElements);
  v22 = (id)objc_msgSend(v21, "mutableCopy");
  v29 = 0;
  if (v22)
  {
    v2 = v22;
  }
  else
  {
    v30 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v29 = 1;
    v2 = v30;
  }
  v32[0] = v2;
  if ((v29 & 1) != 0)

  v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v20 = (id)-[UITableViewAccessibility subviews](v33, "subviews");
  v28 = (id)objc_msgSend(v19, "initWithArray:");

  while (objc_msgSend(v28, "count"))
  {
    location = (id)objc_msgSend(v28, "firstObject");
    objc_msgSend(v28, "removeObjectAtIndex:", 0);
    if ((objc_msgSend(location, "isAccessibilityElement") & 1) != 0
      && (objc_msgSend(location, "_accessibilityViewIsVisible") & 1) != 0)
    {
      memset(__b, 0, sizeof(__b));
      obj = v32[0];
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
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
          v26 = *(id *)(__b[1] + 8 * v15);
          if (v26 != location)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(location, "_accessibilityIsViewDescendantOfElement:", v26);
          }
          ++v15;
          if (v13 + 1 >= v16)
          {
            v15 = 0;
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
            if (!v16)
              break;
          }
        }
      }

      if ((-[UITableViewAccessibility _accessibilitySkipItemsInSectionList:view:]((uint64_t)v33, v32[0], location) & 1) == 0
        && (-[UITableViewAccessibility _accessibilityCheckForAlreadyExistingCellElementForCell:inItems:](v33, location, v32[0]) & 1) == 0&& (objc_msgSend(v32[0], "containsObject:", location) & 1) == 0)
      {
        objc_msgSend(v32[0], "addObject:", location);
      }
    }
    else
    {
      NSClassFromString(CFSTR("UISwipeActionPullView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(v23, 0, sizeof(v23));
        v11 = (id)objc_msgSend(location, "_accessibleSubviews");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v23, v34, 16);
        if (v12)
        {
          v8 = *(_QWORD *)v23[2];
          v9 = 0;
          v10 = v12;
          while (1)
          {
            v7 = v9;
            if (*(_QWORD *)v23[2] != v8)
              objc_enumerationMutation(v11);
            v24 = *(_QWORD *)(v23[1] + 8 * v9);
            if ((objc_msgSend(v32[0], "containsObject:", v24) & 1) == 0)
              objc_msgSend(v32[0], "axSafelyAddObjectsFromArray:", v24);
            ++v9;
            if (v7 + 1 >= v10)
            {
              v9 = 0;
              v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v23, v34, 16);
              if (!v10)
                break;
            }
          }
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v5 = v28;
          v6 = (id)objc_msgSend(location, "subviews");
          objc_msgSend(v5, "axSafelyAddObjectsFromArray:");

        }
      }
    }
    objc_storeStrong(&location, 0);
  }
  v4 = v32[0];
  objc_storeStrong(&v28, 0);
  objc_storeStrong(v32, 0);
  return v4;
}

- (id)_accessibilityUserTestingVisibleCells
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  id location;
  uint64_t v11;
  _QWORD __b[8];
  uint64_t v13;
  id v14;
  id v15[2];
  UITableViewAccessibility *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexPathsForVisibleRows"));
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = v15[0];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
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
      v13 = *(_QWORD *)(__b[1] + 8 * v6);
      v11 = 0;
      v11 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v16, "globalRowForRowAtIndexPath:", v13);
      location = -[UITableViewAccessibility accessibilityTableViewCellElementAtGlobalRow:](v16, "accessibilityTableViewCellElementAtGlobalRow:", v11);
      if (location)
        objc_msgSend(v14, "addObject:", location);
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
  return v3;
}

- (void)_setAccessibilitySearchTableViewVisible
{
  id v2[3];

  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchTableViewVisible:]((uint64_t)v2[0], 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchTableViewHidden
{
  id v2[3];

  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchTableViewVisible:]((uint64_t)v2[0], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchControllerDimmingViewVisible
{
  id v2[3];

  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchControllerDimmingViewVisible:]((uint64_t)v2[0], 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(v2, 0);
}

- (void)_setAccessibilitySearchControllerDimmingViewHidden
{
  id v2[3];

  v2[2] = self;
  v2[1] = (id)a2;
  v2[0] = -[UITableViewAccessibility _accessibilityInternalData](self);
  -[_AXTableViewInternal setSearchControllerDimmingViewVisible:]((uint64_t)v2[0], 0);
  objc_storeStrong(v2, 0);
}

- (id)_accessibilityViewChildrenWithOptions:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  char v7;
  id location[2];
  UITableViewAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = objc_msgSend(location[0], "shouldIncludeKeyboardObscuredElements") & 1;
  objc_msgSend(location[0], "setShouldIncludeKeyboardObscuredElements:", 1);
  v5.receiver = v9;
  v5.super_class = (Class)UITableViewAccessibility;
  v6 = -[UITableViewAccessibility _accessibilityViewChildrenWithOptions:](&v5, sel__accessibilityViewChildrenWithOptions_, location[0]);
  objc_msgSend(location[0], "setShouldIncludeKeyboardObscuredElements:", v7 & 1);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilitySortedElementsWithin
{
  id v3;
  int v4;
  objc_super v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  id v12[2];
  UITableViewAccessibility *v13;
  id v14;

  v13 = self;
  v12[1] = (id)a2;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
  v11 = &unk_24FF3E0C0;
  v12[0] = self;
  if (v10((uint64_t)&v7))
  {
    v5.receiver = v13;
    v5.super_class = (Class)UITableViewAccessibility;
    v6 = -[UITableViewAccessibility _accessibilitySortedElementsWithin](&v5, sel__accessibilitySortedElementsWithin);
    v14 = -[UITableViewAccessibility _accessibilitySortedElementsWithinPreservingFloatingHeader:sortedElements:](v13, 0, v6);
    v4 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong(v12, 0);
  if (!v4)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v14 = -[UITableViewAccessibility _accessibilitySortedElementsWithinWithOptions:](v13, "_accessibilitySortedElementsWithinWithOptions:", v3);
    v4 = 1;
    objc_storeStrong(&v3, 0);
  }
  return v14;
}

BOOL __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_502);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_2_BaseImplementation;
}

void __62__UITableViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilitySortedElementsWithinPreservingFloatingHeader:(void *)a3 sortedElements:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id v27;
  id location;
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v27 = 0;
  objc_storeStrong(&v27, a3);
  if (v29)
  {
    v25 = (id)objc_msgSend(v27, "mutableCopy");
    v24 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("_index"));
    if (v24)
      objc_msgSend(v25, "removeObject:", v24);
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    memset(__b, 0, sizeof(__b));
    v9 = (id)objc_msgSend(v29, "indexPathsForVisibleRows");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
    if (v10)
    {
      v6 = *(_QWORD *)__b[2];
      v7 = 0;
      v8 = v10;
      while (1)
      {
        v5 = v7;
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v9);
        v22 = *(id *)(__b[1] + 8 * v7);
        v20 = (id)objc_msgSend(v29, "headerViewForSection:", objc_msgSend(v22, "section"));
        if (v20 && (objc_msgSend(v20, "floating") & 1) != 0 && v20 != location)
          objc_msgSend(v23, "addObject:", v20);
        objc_storeStrong(&v20, 0);
        ++v7;
        if (v5 + 1 >= v8)
        {
          v7 = 0;
          v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
          if (!v8)
            break;
        }
      }
    }

    if (objc_msgSend(v23, "count"))
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v4 = v25;
      v12 = MEMORY[0x24BDAC760];
      v13 = -1073741824;
      v14 = 0;
      v15 = __102__UITableViewAccessibility__accessibilitySortedElementsWithinPreservingFloatingHeader_sortedElements___block_invoke;
      v16 = &unk_24FF3F5F0;
      v17 = v23;
      v18 = v19;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);
      objc_msgSend(v25, "removeObjectsAtIndexes:", v19);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v19, 0);
    }
    if (v24)
      objc_msgSend(v25, "insertObject:atIndex:", v24, 0);
    v30 = v25;
    v26 = 1;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v30 = 0;
    v26 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
  return v30;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  uint64_t v9;
  objc_super v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  UITableViewAccessibility *v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL (*v22)(uint64_t);
  void *v23;
  UITableViewAccessibility *v24;
  BOOL v25;
  id location[2];
  UITableViewAccessibility *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  v9 = MEMORY[0x24BDAC760];
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  v23 = &unk_24FF3E0C0;
  v24 = v27;
  v25 = v22((uint64_t)&v19);
  v18 = 0;
  v12 = v9;
  v13 = -1073741824;
  v14 = 0;
  v15 = __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_507;
  v16 = &unk_24FF3E0C0;
  v17 = v27;
  v18 = v15((uint64_t)&v12);
  v11 = 0;
  if (!v25 || v18)
  {
    v10.receiver = v27;
    v10.super_class = (Class)UITableViewAccessibility;
    v5 = -[UITableViewAccessibility _accessibilitySortedElementsWithinWithOptions:](&v10, sel__accessibilitySortedElementsWithinWithOptions_, location[0]);
    v6 = v11;
    v11 = v5;

  }
  else
  {
    v3 = -[UITableViewAccessibility _accessibilitySortedElementsWithin](v27, "_accessibilitySortedElementsWithin");
    v4 = v11;
    v11 = v3;

  }
  v8 = -[UITableViewAccessibility _accessibilitySortedElementsWithinPreservingFloatingHeader:sortedElements:](v27, 0, v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_3_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_506);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_3_BaseImplementation;
}

void __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_3_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_507(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&_ReloadTimer_block_invoke_4_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_509);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)_ReloadTimer_block_invoke_4_BaseImplementation;
}

void __74__UITableViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_508(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    _ReloadTimer_block_invoke_4_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

void __102__UITableViewAccessibility__accessibilitySortedElementsWithinPreservingFloatingHeader_sortedElements___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v12;
  _QWORD __b[8];
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  id location[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = a3;
  v16 = a4;
  v15 = a1;
  memset(__b, 0, sizeof(__b));
  obj = a1[4];
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v12)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v12;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(__b[1] + 8 * v6);
      if ((objc_msgSend(location[0], "_accessibilityIsDescendantOfElement:", v14) & 1) != 0)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v7)
          goto LABEL_9;
      }
    }
    objc_msgSend(a1[5], "addIndex:", v17);
  }
LABEL_9:

  objc_storeStrong(location, 0);
}

- (int64_t)accessibilityElementCount
{
  id location[2];
  UITableViewAccessibility *v4;
  int64_t v5;

  v4 = self;
  location[1] = (id)a2;
  if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider"))
    return 0x7FFFFFFFFFFFFFFFLL;
  location[0] = -[UITableViewAccessibility _accessibilityInternalData](v4);
  if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](v4) & 1) != 0)
    v5 = 0;
  else
    v5 = -[_AXTableViewInternal accessibleElementCount]((uint64_t)location[0]);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_delegateWantsHeaderForSection:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

uint64_t __64__UITableViewAccessibility__accessibilityInitializeInternalData__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_delegateWantsFooterForSection:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[8];
  id v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  _QWORD __b[8];
  id v44;
  char v45;
  char v46;
  id v47;
  id v48;
  id location[2];
  UITableViewAccessibility *v50;
  int64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = -[UITableViewAccessibility _accessibilityInternalData](v50);
  v47 = location[0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[UITableViewAccessibility accessibilityTableViewCellAccessibilityElementForTableViewCell:](v50, "accessibilityTableViewCellAccessibilityElementForTableViewCell:", v47);
    v4 = v47;
    v47 = v3;

  }
  objc_opt_class();
  v46 = objc_opt_isKindOfClass() & 1;
  objc_opt_class();
  v45 = objc_opt_isKindOfClass() & 1;
  if ((v46 & 1) == 0 && (v45 & 1) == 0)
    goto LABEL_30;
  memset(__b, 0, sizeof(__b));
  obj = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v60, 16);
  if (v28)
  {
    v24 = *(_QWORD *)__b[2];
    v25 = 0;
    v26 = v28;
    while (1)
    {
      v23 = v25;
      if (*(_QWORD *)__b[2] != v24)
        objc_enumerationMutation(obj);
      v44 = *(id *)(__b[1] + 8 * v25);
      v20 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
      v42 = (id)objc_msgSend(v20, "objectForKey:", v44);

      v41 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("type"));
      v40 = 0;
      v21 = (id)objc_msgSend(v42, "objectForKey:", CFSTR("offset"));
      v22 = objc_msgSend(v21, "integerValue");

      v40 = v22;
      v38 = 0;
      v39 = 0;
      v38 = objc_msgSend(v44, "rangeValue");
      v39 = v5;
      if ((v45 & 1) == 0)
        goto LABEL_47;
      v19 = v40;
      if (v19 != -[UITableViewSectionElement section]((uint64_t)v47))
        goto LABEL_47;
      if ((objc_msgSend(v41, "isEqualToString:", CFSTR("header")) & 1) != 0
        && (-[UITableViewSectionElement isHeader]((uint64_t)v47) & 1) != 0
        || (objc_msgSend(v41, "isEqualToString:", CFSTR("footer")) & 1) != 0
        && (-[UITableViewSectionElement isHeader]((uint64_t)v47) & 1) == 0)
      {
        v51 = v38;
        v37 = 1;
      }
      else
      {
LABEL_47:
        if ((v46 & 1) == 0 || (objc_msgSend(v41, "isEqualToString:", CFSTR("row")) & 1) == 0)
          goto LABEL_24;
        v36 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)v47);
        v35 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v50, "globalRowForRowAtIndexPath:", v36);
        v53 = v40;
        v52 = v39;
        v54 = v40;
        v55 = v39;
        v33 = v40;
        v34 = v39;
        v57 = v40;
        v58 = v39;
        v56 = v35;
        v18 = 0;
        if (v35 >= v40)
          v18 = v56 - v57 < v58;
        if (v18)
        {
          v17 = v38;
          v51 = v17 + objc_msgSend(v36, "row");
          v37 = 1;
        }
        else
        {
          v37 = 0;
        }
        objc_storeStrong(&v36, 0);
        if (!v37)
LABEL_24:
          v37 = 0;
      }
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      if (v37)
        break;
      ++v25;
      if (v23 + 1 >= v26)
      {
        v25 = 0;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v60, 16);
        if (!v26)
          goto LABEL_28;
      }
    }
  }
  else
  {
LABEL_28:
    v37 = 0;
  }

  if (!v37)
  {
LABEL_30:
    v14 = v47;
    v15 = (id)-[UITableViewAccessibility safeValueForKey:](v50, "safeValueForKey:", CFSTR("_countLabel"));
    v16 = objc_msgSend(v14, "isEqual:");

    if ((v16 & 1) == 0)
      goto LABEL_43;
    memset(v31, 0, sizeof(v31));
    v12 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v31, v59, 16);
    if (v13)
    {
      v9 = *(_QWORD *)v31[2];
      v10 = 0;
      v11 = v13;
      while (1)
      {
        v8 = v10;
        if (*(_QWORD *)v31[2] != v9)
          objc_enumerationMutation(v12);
        v32 = *(id *)(v31[1] + 8 * v10);
        v7 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v48);
        v30 = (id)objc_msgSend(v7, "objectForKey:", v32);

        v29 = (id)objc_msgSend(v30, "objectForKey:", CFSTR("type"));
        if ((objc_msgSend(v29, "isEqualToString:", CFSTR("tableCount")) & 1) != 0)
        {
          v51 = objc_msgSend(v32, "rangeValue");
          v37 = 1;
        }
        else
        {
          v37 = 0;
        }
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        if (v37)
          break;
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v31, v59, 16);
          if (!v11)
            goto LABEL_41;
        }
      }
    }
    else
    {
LABEL_41:
      v37 = 0;
    }

    if (!v37)
    {
LABEL_43:
      v51 = 0x7FFFFFFFFFFFFFFFLL;
      v37 = 1;
    }
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  return v51;
}

- (id)_delegateViewForHeaderInSection:(int64_t)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  objc_super v15;
  id v16[3];
  UITableViewAccessibility *v17;

  v17 = self;
  v16[2] = (id)a2;
  v16[1] = (id)a3;
  v15.receiver = self;
  v15.super_class = (Class)UITableViewAccessibility;
  v16[0] = -[UITableViewAccessibility _delegateViewForHeaderInSection:](&v15, sel__delegateViewForHeaderInSection_, a3);
  objc_msgSend(v16[0], "setShouldGroupAccessibilityChildren:", 1);
  v14 = (id)-[UITableViewAccessibility _accessibilityValueForKey:](v17, "_accessibilityValueForKey:", CFSTR("HeaderUpdateTimer"));
  if (!v14)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v7 = MEMORY[0x24BDAC9B8];
    v14 = (id)objc_msgSend(v6, "initWithTargetSerialQueue:");

    -[UITableViewAccessibility _accessibilitySetRetainedValue:forKey:](v17, "_accessibilitySetRetainedValue:forKey:", v14, CFSTR("HeaderUpdateTimer"));
  }
  objc_msgSend(v14, "cancel");
  v4 = v14;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke;
  v12 = &unk_24FF3DA40;
  v13 = v16[0];
  objc_msgSend(v4, "afterDelay:processBlock:", &v8, 0.5);
  v5 = v16[0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v16, 0);
  return v5;
}

id __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindDescendant:", &__block_literal_global_532, a1, a1);
}

uint64_t __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke_2(void *a1, void *a2)
{
  BOOL v3;
  char v4;
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = 0;
  v3 = 0;
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) != 0)
  {
    v5 = (id)objc_msgSend(location[0], "accessibilityUserDefinedTraits");
    v4 = 1;
    v3 = v5 == 0;
  }
  if ((v4 & 1) != 0)

  if (v3)
    objc_msgSend(location[0], "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_534);
  objc_storeStrong(location, 0);
  return 0;
}

uint64_t __60__UITableViewAccessibility__delegateViewForHeaderInSection___block_invoke_3()
{
  return *MEMORY[0x24BDF73C0];
}

- (id)_delegateViewForFooterInSection:(int64_t)a3
{
  id v4;
  objc_super v5;
  id v6[4];

  v6[3] = self;
  v6[2] = (id)a2;
  v6[1] = (id)a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewAccessibility;
  v6[0] = -[UITableViewAccessibility _delegateViewForFooterInSection:](&v5, sel__delegateViewForFooterInSection_, a3);
  objc_msgSend(v6[0], "setShouldGroupAccessibilityChildren:", 1);
  v4 = v6[0];
  objc_storeStrong(v6, 0);
  return v4;
}

- (void)_updateDropTargetAppearanceWithTargetIndexPath:(id)a3 dropProposal:(id)a4 dropSession:(id)a5
{
  id argument;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21[2];
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  char v30;
  id v31;
  int v32;
  id v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40[2];
  uint64_t v41;
  uint64_t *v42;
  int v43;
  int v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id v48;
  char v49;
  id v50;
  objc_super v51;
  id v52;
  id v53;
  uint64_t v54;
  int v55;
  int v56;
  void (*v57)(uint64_t);
  void *v58;
  id v59[2];
  uint64_t v60;
  uint64_t *v61;
  int v62;
  int v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  id v67;
  char v68;
  id v69;
  id v70;
  id v71;
  id location[2];
  UITableViewAccessibility *v73;

  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = 0;
  objc_storeStrong(&v71, a4);
  v70 = 0;
  objc_storeStrong(&v70, a5);
  v68 = 0;
  objc_opt_class();
  v60 = 0;
  v61 = &v60;
  v62 = 838860800;
  v63 = 48;
  v64 = __Block_byref_object_copy__20;
  v65 = __Block_byref_object_dispose__20;
  v66 = 0;
  v54 = MEMORY[0x24BDAC760];
  v55 = -1073741824;
  v56 = 0;
  v57 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke;
  v58 = &unk_24FF3DE88;
  v59[1] = &v60;
  v59[0] = v73;
  AXPerformSafeBlock();
  v53 = (id)v61[5];
  objc_storeStrong(v59, 0);
  _Block_object_dispose(&v60, 8);
  objc_storeStrong(&v66, 0);
  v67 = (id)__UIAccessibilityCastAsClass();

  if ((v68 & 1) != 0)
    abort();
  v52 = v67;
  objc_storeStrong(&v67, 0);
  v69 = v52;
  v51.receiver = v73;
  v51.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _updateDropTargetAppearanceWithTargetIndexPath:dropProposal:dropSession:](&v51, sel__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession_, location[0], v71, v70);
  v49 = 0;
  objc_opt_class();
  v41 = 0;
  v42 = &v41;
  v43 = 838860800;
  v44 = 48;
  v45 = __Block_byref_object_copy__20;
  v46 = __Block_byref_object_dispose__20;
  v47 = 0;
  v35 = MEMORY[0x24BDAC760];
  v36 = -1073741824;
  v37 = 0;
  v38 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_2;
  v39 = &unk_24FF3DE88;
  v40[1] = &v41;
  v40[0] = v73;
  AXPerformSafeBlock();
  v34 = (id)v42[5];
  objc_storeStrong(v40, 0);
  _Block_object_dispose(&v41, 8);
  objc_storeStrong(&v47, 0);
  v48 = (id)__UIAccessibilityCastAsClass();

  if ((v49 & 1) != 0)
    abort();
  v33 = v48;
  objc_storeStrong(&v48, 0);
  v50 = v33;
  if ((objc_msgSend(v69, "isEqual:", v33) & 1) == 0 && v69 && v50)
  {
    v30 = 0;
    objc_opt_class();
    v22 = 0;
    v23 = &v22;
    v24 = 838860800;
    v25 = 48;
    v26 = __Block_byref_object_copy__20;
    v27 = __Block_byref_object_dispose__20;
    v28 = 0;
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_3;
    v20 = &unk_24FF3DE88;
    v21[1] = &v22;
    v21[0] = v73;
    AXPerformSafeBlock();
    v15 = (id)v23[5];
    objc_storeStrong(v21, 0);
    _Block_object_dispose(&v22, 8);
    objc_storeStrong(&v28, 0);
    v29 = (id)__UIAccessibilityCastAsClass();

    if ((v30 & 1) != 0)
      abort();
    v14 = v29;
    objc_storeStrong(&v29, 0);
    v31 = v14;
    if (v14)
    {
      v13 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v73, "globalRowForRowAtIndexPath:", v31);
      v12 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v73, "globalRowForRowAtIndexPath:", v69);
      v11 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v73, "globalRowForRowAtIndexPath:", v50);
      v10 = v11 > v12;
      v9 = -[UITableViewAccessibility _accessibilitySwappedWithRowForInitialGlobalRow:oldGlobalRow:globalRow:]((uint64_t)v73, v13, v12, v11);
      v8 = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v73, v50, v9, v11 > v12);
      argument = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
      objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBF8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v8, 0);
      v32 = 0;
    }
    else
    {
      v32 = 1;
    }
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v32 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, 0);
}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_gapIndexPath");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_gapIndexPath");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __100__UITableViewAccessibility__updateDropTargetAppearanceWithTargetIndexPath_dropProposal_dropSession___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_draggedIndexPath");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (uint64_t)_accessibilitySwappedWithRowForInitialGlobalRow:(uint64_t)a3 oldGlobalRow:(uint64_t)a4 globalRow:
{
  uint64_t v5;

  if (!a1)
    return 0;
  v5 = a3;
  if (a2 != a4)
  {
    if (a4 >= a3)
    {
      if (a4 > a3)
      {
        if (a2 <= a4)
          return a4;
        else
          return a3;
      }
    }
    else if (a2 >= a4)
    {
      return a3 - 1;
    }
    else
    {
      return a4 + 1;
    }
  }
  return v5;
}

- (id)_accessibilityReorderMessageForNewIndexPath:(uint64_t)a3 swappedWithRow:(char)a4 movingDown:
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  char v37;
  uint64_t v38;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  int v54;
  int v55;
  void (*v56)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  int v61;
  int v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  id v66;
  uint64_t v67;
  int v68;
  char v69;
  uint64_t v70;
  id location;
  void *v72;
  id v73;

  v72 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v70 = a3;
  v69 = a4 & 1;
  if (v72)
  {
    v67 = objc_msgSend(v72, "globalRowForRowAtIndexPath:", location);
    v66 = (id)objc_msgSend(v72, "indexPathForRowAtGlobalRow:", v70);
    v59 = 0;
    v60 = &v59;
    v61 = 838860800;
    v62 = 48;
    v63 = __Block_byref_object_copy__20;
    v64 = __Block_byref_object_dispose__20;
    v65 = (id)objc_msgSend(v72, "cellForRowAtIndexPath:", v66);
    if ((objc_msgSend((id)v60[5], "isAccessibilityElement") & 1) == 0)
    {
      v4 = (void *)v60[5];
      v53 = MEMORY[0x24BDAC760];
      v54 = -1073741824;
      v55 = 0;
      v56 = __98__UITableViewAccessibility__accessibilityReorderMessageForNewIndexPath_swappedWithRow_movingDown___block_invoke;
      v57 = &unk_24FF3E960;
      v58 = &v59;
      objc_msgSend(v4, "accessibilityEnumerateContainerElementsUsingBlock:", &v53);
    }
    v52 = (id)objc_msgSend((id)v60[5], "_accessibilityAXAttributedLabel");
    v51 = (id)objc_msgSend((id)v60[5], "accessibilityLanguage");
    v50 = 0;
    if (objc_msgSend(v52, "length"))
    {
      if ((v69 & 1) != 0)
      {
        v24 = (void *)MEMORY[0x24BDD17C8];
        v23 = accessibilityLocalizedString(CFSTR("row.reorder.moved.below"));
        v13 = (id)objc_msgSend(v24, "stringWithFormat:", v52);
        v14 = v50;
        v50 = v13;

      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD17C8];
        v21 = accessibilityLocalizedString(CFSTR("row.reorder.moved.above"));
        v15 = (id)objc_msgSend(v22, "stringWithFormat:", v52);
        v16 = v50;
        v50 = v15;

      }
    }
    else if (v67 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v49 = 0;
      v47 = 0;
      v38 = objc_msgSend(location, "section");
      v37 = 0;
      if (v38 < -[UITableViewAccessibility _axNumberOfSections](v72))
      {
        v48 = (id)objc_msgSend(v72, "dataSource");
        v47 = 1;
        v37 = objc_opt_respondsToSelector();
      }
      if ((v47 & 1) != 0)

      if ((v37 & 1) != 0)
      {
        v36 = (id)objc_msgSend(v72, "dataSource");
        v5 = (id)objc_msgSend(v36, "tableView:titleForHeaderInSection:", v72, objc_msgSend(location, "section"));
        v6 = v49;
        v49 = v5;

      }
      if (objc_msgSend(v49, "length"))
      {
        v35 = (void *)MEMORY[0x24BDD17C8];
        v34 = accessibilityLocalizedString(CFSTR("row.index.path.section.name"));
        objc_msgSend(location, "row");
        v33 = (id)AXFormatInteger();
        v7 = (id)objc_msgSend(v35, "stringWithFormat:", v34, v49, v33);
        v8 = v50;
        v50 = v7;

      }
      else
      {
        v32 = (void *)MEMORY[0x24BDD17C8];
        v31 = accessibilityLocalizedString(CFSTR("row.index.path"));
        objc_msgSend(location, "section");
        v30 = (id)AXFormatInteger();
        objc_msgSend(location, "row");
        v29 = (id)AXFormatInteger();
        v9 = (id)objc_msgSend(v32, "stringWithFormat:", v31, v30, v29);
        v10 = v50;
        v50 = v9;

      }
      objc_storeStrong(&v49, 0);
    }
    else
    {
      v46 = -[UITableViewAccessibility _axNumberOfSections](v72);
      v45 = 0;
      v44 = 0;
      while (v45 < v46)
        v44 += objc_msgSend(v72, "numberOfRowsInSection:", v45++);
      ++v67;
      v28 = (void *)MEMORY[0x24BDD17C8];
      v27 = accessibilityLocalizedString(CFSTR("row.with.total.count"));
      v26 = (id)AXFormatInteger();
      v25 = (id)AXFormatInteger();
      v11 = (id)objc_msgSend(v28, "stringWithFormat:", v27, v26, v25);
      v12 = v50;
      v50 = v11;

    }
    if (objc_msgSend(v51, "length"))
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v50);
      v18 = v50;
      v50 = v17;

      v42 = objc_msgSend(v50, "rangeOfString:", v52);
      v43 = v19;
      v41 = (id)*MEMORY[0x24BDFEB98];
      if ((objc_msgSend(v52, "isAXAttributedString") & 1) != 0
        && (objc_msgSend(v52, "hasAttribute:", *MEMORY[0x24BDFEBE0]) & 1) != 0)
      {
        objc_storeStrong(&v41, (id)*MEMORY[0x24BDFEBE0]);
      }
      objc_msgSend(v50, "setAttribute:forKey:withRange:", v51, v41, v42, v43);
      objc_storeStrong(&v41, 0);
    }
    v73 = v50;
    v68 = 1;
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    _Block_object_dispose(&v59, 8);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
  }
  else
  {
    v73 = 0;
    v68 = 1;
  }
  objc_storeStrong(&location, 0);
  return v73;
}

void __98__UITableViewAccessibility__accessibilityReorderMessageForNewIndexPath_swappedWithRow_movingDown___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_reorderPositionChangedForCell:(id)a3
{
  UIAccessibilityNotifications *v3;
  id argument;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v10;
  id v11;
  id v12;
  id v13;
  int v14;
  objc_super v15;
  id location[2];
  UITableViewAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v13 = (id)-[UITableViewAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_reorderingSupport"));
    v12 = (id)objc_msgSend(v13, "safeValueForKey:", CFSTR("_initialIndexPath"));
    v11 = (id)objc_msgSend(v13, "safeValueForKey:");
    v10.receiver = v17;
    v10.super_class = (Class)UITableViewAccessibility;
    -[UITableViewAccessibility _reorderPositionChangedForCell:](&v10, sel__reorderPositionChangedForCell_, location[0]);
    v9 = (id)objc_msgSend(v13, "safeValueForKey:", CFSTR("_targetIndexPath"));
    if ((objc_msgSend(v11, "isEqual:", v9) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v8 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v17, "globalRowForRowAtIndexPath:", v12);
      v7 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v17, "globalRowForRowAtIndexPath:", v9);
      v6 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v17, "globalRowForRowAtIndexPath:", v11);
      v5 = -[UITableViewAccessibility _accessibilitySwappedWithRowForInitialGlobalRow:oldGlobalRow:globalRow:]((uint64_t)v17, v8, v6, v7);
      argument = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v17, v9, v5, v7 > v6);
      v3 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
      UIAccessibilityPostNotification(*v3, (id)*MEMORY[0x24BDFEE28]);
      objc_storeStrong(&argument, 0);
      v14 = 0;
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v15.receiver = v17;
    v15.super_class = (Class)UITableViewAccessibility;
    -[UITableViewAccessibility _reorderPositionChangedForCell:](&v15, sel__reorderPositionChangedForCell_, location[0]);
    v14 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_endReorderingForCell:(id)a3 wasCancelled:(BOOL)a4 animated:(BOOL)a5
{
  objc_super v7;
  BOOL v8;
  BOOL v9;
  id location[2];
  UITableViewAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = a5;
  v7.receiver = v11;
  v7.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _endReorderingForCell:wasCancelled:animated:](&v7, sel__endReorderingForCell_wasCancelled_animated_, location[0], a4, a5);
  -[UITableViewAccessibility _accessibilityClearChildren](v11, "_accessibilityClearChildren");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityTableViewCellElementForIndexPath:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id location[2];
  UITableViewAccessibility *v11;
  id v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v8 = -[UITableViewAccessibility _accessibilityInternalData](v11);
    v6 = (id)-[_AXTableViewInternal children]((uint64_t)v8);
    v7 = (id)objc_msgSend(v6, "objectForKey:", location[0]);

    if (!v7)
    {
      v3 = objc_allocWithZone((Class)UITableViewCellAccessibilityElement);
      v7 = (id)objc_msgSend(v3, "initWithAccessibilityContainer:", v11);

      -[UITableViewCellAccessibilityElement setIndexPath:]((uint64_t)v7, location[0]);
      v5 = (id)-[_AXTableViewInternal children]((uint64_t)v8);
      objc_msgSend(v5, "setObject:forKey:", v7, location[0]);

    }
    v12 = v7;
    v9 = 1;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v12 = 0;
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v12;
}

- (id)accessibilityTableViewCellElementAtGlobalRow:(int64_t)a3
{
  id location[3];
  UITableViewAccessibility *v5;
  id v6;

  v5 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = (id)-[UITableViewAccessibility indexPathForRowAtGlobalRow:](self, "indexPathForRowAtGlobalRow:", a3);
  if (location[0])
    v6 = -[UITableViewAccessibility _accessibilityTableViewCellElementForIndexPath:](v5, "_accessibilityTableViewCellElementForIndexPath:", location[0]);
  else
    v6 = 0;
  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilityFirstVisibleItem
{
  id v3;
  id v4;
  int v5;
  id v6;
  id v7[2];
  UITableViewAccessibility *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider"))
  {
    -[UITableViewAccessibility _accessibilitySetBoolValue:forKey:](v8, "_accessibilitySetBoolValue:forKey:", 0);
    v7[0] = (id)-[UITableViewAccessibility _accessibilityFirstOpaqueElement](v8, "_accessibilityFirstOpaqueElement");
    -[UITableViewAccessibility _accessibilityRemoveValueForKey:](v8, "_accessibilityRemoveValueForKey:", CFSTR("AXTableViewOpaqueScrollsIntoViewKey"));
    v9 = v7[0];
    objc_storeStrong(v7, 0);
  }
  else
  {
    v6 = (id)-[UITableViewAccessibility indexPathsForVisibleRows](v8, "indexPathsForVisibleRows");
    if (objc_msgSend(v6, "count"))
    {
      v4 = (id)objc_msgSend(v6, "objectAtIndex:", 0);
      v3 = -[UITableViewAccessibility accessibilityTableViewCellElementAtGlobalRow:](v8, "accessibilityTableViewCellElementAtGlobalRow:", -[UITableViewAccessibility globalRowForRowAtIndexPath:](v8, "globalRowForRowAtIndexPath:", v4));
      v9 = v3;
      v5 = 1;
      objc_storeStrong(&v3, 0);
      objc_storeStrong(&v4, 0);
    }
    else
    {
      v9 = 0;
      v5 = 1;
    }
    objc_storeStrong(&v6, 0);
  }
  return v9;
}

- (void)_accessibilityOpaqueElementScrollCleanup
{
  id v2;

  v2 = (id)-[UITableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_updateVisibleCellsImmediatelyIfNecessary"), a2, self);
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id obj;
  uint64_t v19;
  char v20;
  char v21;
  id v22;
  id v23;
  __int128 v24;
  _QWORD __b[8];
  id v26;
  __int128 v27;
  uint64_t v28;
  id v29;
  int v30;
  id v31;
  unint64_t v32;
  SEL v33;
  UITableViewAccessibility *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v34 = self;
  v33 = a2;
  v32 = a3;
  if (!-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](self, "isAccessibilityOpaqueElementProvider"))
  {
    if ((-[UITableViewAccessibility _accessibilitySearchTableViewVisible](v34) & 1) != 0)
    {
      v35 = 0;
      return v35;
    }
    v31 = -[UITableViewAccessibility _accessibilityInternalData](v34);
    if (!-[_AXTableViewInternal accessibleElementCount]((uint64_t)v31))
    {
      v35 = 0;
      v30 = 1;
LABEL_34:
      objc_storeStrong(&v31, 0);
      return v35;
    }
    v29 = 0;
    v28 = 0;
    v37 = 0;
    v36 = 0;
    v38 = 0;
    v39 = 0;
    v27 = 0uLL;
    memset(__b, 0, sizeof(__b));
    obj = (id)-[_AXTableViewInternal indexMap]((uint64_t)v31);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v19)
    {
      v15 = *(_QWORD *)__b[2];
      v16 = 0;
      v17 = v19;
      while (1)
      {
        v14 = v16;
        if (*(_QWORD *)__b[2] != v15)
          objc_enumerationMutation(obj);
        v26 = *(id *)(__b[1] + 8 * v16);
        *(_QWORD *)&v24 = objc_msgSend(v26, "rangeValue");
        *((_QWORD *)&v24 + 1) = v3;
        v27 = v24;
        v41 = v24;
        v40 = v32;
        v13 = 0;
        if (v32 >= (unint64_t)v24)
          v13 = v40 - (unint64_t)v41 < *((_QWORD *)&v41 + 1);
        if (v13)
          break;
        ++v16;
        if (v14 + 1 >= v17)
        {
          v16 = 0;
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
          if (!v17)
            goto LABEL_17;
        }
      }
      v11 = (id)-[_AXTableViewInternal indexMap]((uint64_t)v31);
      v23 = (id)objc_msgSend(v11, "objectForKey:", v26);

      v4 = (id)objc_msgSend(v23, "objectForKey:", CFSTR("type"));
      v5 = v29;
      v29 = v4;

      v12 = (id)objc_msgSend(v23, "objectForKey:", CFSTR("offset"));
      v28 = objc_msgSend(v12, "integerValue");

      v30 = 2;
      objc_storeStrong(&v23, 0);
    }
    else
    {
LABEL_17:
      v30 = 0;
    }

    if (!v29)
    {
      _AXAssert();
      v35 = 0;
      v30 = 1;
LABEL_33:
      objc_storeStrong(&v29, 0);
      goto LABEL_34;
    }
    v22 = 0;
    if ((objc_msgSend(v29, "isEqualToString:", CFSTR("row")) & 1) != 0)
    {
      v32 = v32 - v27 + v28;
      v6 = -[UITableViewAccessibility accessibilityTableViewCellElementAtGlobalRow:](v34, "accessibilityTableViewCellElementAtGlobalRow:", v32);
      v7 = v22;
      v22 = v6;

LABEL_31:
      v35 = v22;
      v30 = 1;
      goto LABEL_32;
    }
    if ((objc_msgSend(v29, "isEqualToString:", CFSTR("tableCount")) & 1) != 0)
    {
      v35 = (id)-[UITableViewAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("_countLabel"));
      v30 = 1;
    }
    else
    {
      v21 = objc_msgSend(v29, "isEqualToString:", CFSTR("header")) & 1;
      v20 = objc_msgSend(v29, "isEqualToString:", CFSTR("footer")) & 1;
      if ((v21 & 1) == 0 && (v20 & 1) == 0)
        _AXAssert();
      if ((v21 & 1) != 0 || (v20 & 1) != 0)
      {
        v8 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v34, v28, v21 & 1);
        v9 = v22;
        v22 = v8;

        goto LABEL_31;
      }
      v35 = 0;
      v30 = 1;
    }
LABEL_32:
    objc_storeStrong(&v22, 0);
    goto LABEL_33;
  }
  v35 = 0;
  return v35;
}

- (uint64_t)_accessibilityDefaultTableViewCellScrollPosition
{
  if (a1)
    return 2;
  else
    return 0;
}

- (id)accessibilityElementForRow:(unint64_t)a3 andColumn:(unint64_t)a4
{
  id v4;
  id v5;
  id v7;
  id location;
  id v9;
  unint64_t v10;
  unint64_t v11;
  SEL v12;
  UITableViewAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9 = 0;
  if (a4 < -[UITableViewAccessibility _axNumberOfSections](self)
    && v11 < -[UITableViewAccessibility numberOfRowsInSection:](v13, "numberOfRowsInSection:", v10))
  {
    location = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, v10);
    if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](v13, "isAccessibilityOpaqueElementProvider"))
    {
      -[UITableViewAccessibility scrollToRowAtIndexPath:atScrollPosition:animated:](v13, "scrollToRowAtIndexPath:atScrollPosition:animated:", location, 0, 0);
      v4 = (id)-[UITableViewAccessibility cellForRowAtIndexPath:](v13, "cellForRowAtIndexPath:", location);
    }
    else
    {
      v4 = -[UITableViewAccessibility _accessibilityTableViewCellElementForIndexPath:](v13, "_accessibilityTableViewCellElementForIndexPath:", location);
    }
    v5 = v9;
    v9 = v4;

    objc_storeStrong(&location, 0);
  }
  v7 = v9;
  objc_storeStrong(&v9, 0);
  return v7;
}

- (id)accessibilityTableViewCellAccessibilityElementForTableViewCell:(id)a3
{
  uint64_t v3;
  id v5;
  id location[2];
  UITableViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[UITableViewAccessibility indexPathForCell:](v7, "indexPathForCell:", location[0]);
  if (v5)
  {
    v3 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v7, "globalRowForRowAtIndexPath:", v5);
    v8 = -[UITableViewAccessibility accessibilityTableViewCellElementAtGlobalRow:](v7, "accessibilityTableViewCellElementAtGlobalRow:", v3);
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)accessibilityFindMockParentForTableViewCell:(void *)a1
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  id location;
  id v8;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    v5 = (id)objc_msgSend(v8, "indexPathForCell:", location);
    if (v5)
    {
      v4 = objc_msgSend(v8, "globalRowForRowAtIndexPath:", v5);
      v3 = (id)objc_msgSend(v8, "accessibilityTableViewCellElementAtGlobalRow:", v4);
      v2 = (id)objc_msgSend(v3, "tableViewCell");
      objc_storeStrong(&v3, 0);
    }
    objc_storeStrong(&v5, 0);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityUIScrollViewScrollStatus
{
  objc_super v3;
  SEL v4;
  UITableViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewAccessibility;
  return -[UITableViewAccessibility _accessibilityScrollStatus](&v3, sel__accessibilityScrollStatus);
}

- (BOOL)_accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  UITableViewAccessibility *v2;
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  UITableViewAccessibility *v16;
  id v17;
  UITableViewAccessibility *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t (*v35)(id *, void *, void *);
  void *v36;
  UITableViewAccessibility *v37;
  id v38;
  id location;
  int v40;
  id v41[2];
  UITableViewAccessibility *v42;
  id v43;

  v42 = self;
  v41[1] = (id)a2;
  v41[0] = (id)-[UITableViewAccessibility _accessibilityDelegateScrollStatus](self, "_accessibilityDelegateScrollStatus");
  if (objc_msgSend(v41[0], "length"))
  {
    v43 = v41[0];
    v40 = 1;
  }
  else
  {
    v2 = (UITableViewAccessibility *)(id)-[UITableViewAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("dataSource"));
    v24 = v2 == v42;

    if (v24
      || ((v23 = (id)-[UITableViewAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("dataSource")), location = (id)objc_msgSend(v23, "_accessibilityScrollStatus"), v23, !location)? (v40 = 0): (v43 = location, v40 = 1), objc_storeStrong(&location, 0), !v40))
    {
      v3 = (id)-[UITableViewAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("_updateVisibleCellsImmediatelyIfNecessary"));
      v38 = (id)-[UITableViewAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("indexPathsForVisibleRows"));
      if (-[UITableViewAccessibility _accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting](v42, "_accessibilityShouldVerifyTableViewCellsAreVisibleByHitTesting"))
      {
        v21 = v38;
        v20 = (void *)MEMORY[0x24BDD1758];
        v32 = MEMORY[0x24BDAC760];
        v33 = -1073741824;
        v34 = 0;
        v35 = __54__UITableViewAccessibility__accessibilityScrollStatus__block_invoke;
        v36 = &unk_24FF3F658;
        v37 = v42;
        v22 = (id)objc_msgSend(v20, "predicateWithBlock:", &v32);
        v4 = (id)objc_msgSend(v21, "filteredArrayUsingPredicate:");
        v5 = v38;
        v38 = v4;

        objc_storeStrong((id *)&v37, 0);
      }
      if (objc_msgSend(v38, "count"))
      {
        v16 = v42;
        v17 = (id)objc_msgSend(v38, "objectAtIndex:", 0);
        v30 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v16, "globalRowForRowAtIndexPath:");

        v18 = v42;
        v19 = (id)objc_msgSend(v38, "lastObject");
        v28 = -[UITableViewAccessibility globalRowForRowAtIndexPath:](v18, "globalRowForRowAtIndexPath:");

        v31 = v30 + 1;
        v29 = v28 + 1;
        v27 = 0;
        v26 = -[UITableViewAccessibility _axNumberOfSections](v42);
        for (i = 0; i < v26; ++i)
          v27 += -[UITableViewAccessibility numberOfRowsInSection:](v42, "numberOfRowsInSection:", i);
        if (v31 == v29)
        {
          v12 = (void *)MEMORY[0x24BDD17C8];
          v15 = accessibilityLocalizedString(CFSTR("row.with.total.count"));
          v14 = (id)AXFormatInteger();
          v13 = (id)AXFormatInteger();
          v43 = (id)objc_msgSend(v12, "stringWithFormat:", v15, v14, v13);

        }
        else
        {
          v7 = (void *)MEMORY[0x24BDD17C8];
          v11 = accessibilityLocalizedString(CFSTR("table.scrollbypage.status"));
          v10 = (id)AXFormatInteger();
          v9 = (id)AXFormatInteger();
          v8 = (id)AXFormatInteger();
          v43 = (id)objc_msgSend(v7, "stringWithFormat:", v11, v10, v9, v8);

        }
        v40 = 1;
      }
      else
      {
        v43 = 0;
        v40 = 1;
      }
      objc_storeStrong(&v38, 0);
    }
  }
  objc_storeStrong(v41, 0);
  return v43;
}

uint64_t __54__UITableViewAccessibility__accessibilityScrollStatus__block_invoke(id *a1, void *a2, void *a3)
{
  id v6;
  char v7;
  char v8;
  char v9;
  id v10[2];
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v10[1] = a1;
  v10[0] = (id)objc_msgSend(a1[4], "cellForRowAtIndexPath:", location[0]);
  v9 = objc_msgSend(v10[0], "_accessibilityIsVisibleByCompleteHitTest") & 1;
  v6 = (id)objc_msgSend(v10[0], "safeValueForKey:", CFSTR("_accessibilityMockParent"));
  v7 = objc_msgSend(v6, "_accessibilityIsVisibleByCompleteHitTest");

  v8 = 1;
  if ((v9 & 1) == 0)
    v8 = v7 & 1;
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)description
{
  id v3;
  objc_super v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewAccessibility;
  v5[0] = -[UITableViewAccessibility description](&v4, sel_description);
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v7;
  const __CFString *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  BOOL v16;
  char v17;
  id v18;
  _QWORD __b[8];
  id v20;
  id location;
  id v22;
  id v23;
  int v24;
  id v25[2];
  UITableViewAccessibility *v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25[1] = (id)a2;
  if (!UIAccessibilityIsVoiceOverRunning()
    || -[UITableViewAccessibility isAccessibilityElement](v26, "isAccessibilityElement"))
  {
    v2 = (id)-[UITableViewAccessibility accessibilityUserDefinedLabel](v26, "accessibilityUserDefinedLabel");
    v16 = v2 == 0;

    if (v16)
    {
      v25[0] = (id)-[UITableViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("backgroundView"));
      if ((objc_msgSend(v25[0], "isAccessibilityElement") & 1) != 0)
      {
        v27 = (id)objc_msgSend(v25[0], "_accessibilityAXAttributedLabel");
        v24 = 1;
      }
      else
      {
        if (!-[UITableViewAccessibility isAccessibilityElement](v26, "isAccessibilityElement"))
          goto LABEL_26;
        v23 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
        objc_msgSend(v23, "setShouldUseAllSubviews:", 1);
        v22 = -[UITableViewAccessibility _accessibilityViewChildrenWithOptions:](v26, "_accessibilityViewChildrenWithOptions:", v23);
        location = 0;
        memset(__b, 0, sizeof(__b));
        obj = v22;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (v15)
        {
          v11 = *(_QWORD *)__b[2];
          v12 = 0;
          v13 = v15;
          while (1)
          {
            v10 = v12;
            if (*(_QWORD *)__b[2] != v11)
              objc_enumerationMutation(obj);
            v20 = *(id *)(__b[1] + 8 * v12);
            v17 = 0;
            v9 = 0;
            if ((objc_msgSend(v20, "isAccessibilityElement", v7, v8) & 1) != 0)
            {
              objc_opt_class();
              v9 = 0;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v18 = (id)objc_msgSend(v20, "_accessibilityAncestorIsKindOf:", objc_opt_class());
                v17 = 1;
                v9 = v18 == 0;
              }
            }
            if ((v17 & 1) != 0)

            if (v9)
            {
              v7 = (id)objc_msgSend(v20, "accessibilityLabel");
              v8 = CFSTR("__AXStringForVariablesSentinel");
              v3 = (id)__UIAXStringForVariables();
              v4 = location;
              location = v3;

            }
            ++v12;
            if (v10 + 1 >= v13)
            {
              v12 = 0;
              v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
              if (!v13)
                break;
            }
          }
        }

        if (objc_msgSend(location, "length"))
        {
          v27 = location;
          v24 = 1;
        }
        else
        {
          v24 = 0;
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        if (!v24)
        {
LABEL_26:
          -[UITableViewAccessibility safeRangeForKey:](v26, "safeRangeForKey:", CFSTR("_visibleGlobalRows"), v7, v8);
          if (v5)
            v27 = 0;
          else
            v27 = accessibilityLocalizedString(CFSTR("uitable.emptytable.text"));
          v24 = 1;
        }
      }
      objc_storeStrong(v25, 0);
    }
    else
    {
      v27 = (id)-[UITableViewAccessibility accessibilityUserDefinedLabel](v26, "accessibilityUserDefinedLabel");
    }
  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v4;
  BOOL v5;
  unint64_t v7;

  v2 = (id)-[UITableViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v5 = v2 == 0;

  if (v5)
  {
    if ((-[UITableViewAccessibility _accessibilityIsSearchTableVisible](self) & 1) != 0)
      return *MEMORY[0x24BEBB178];
    else
      return *MEMORY[0x24BDF73E0];
  }
  else
  {
    v4 = (id)-[UITableViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
    v7 = objc_msgSend(v4, "unsignedLongLongValue");

  }
  return v7;
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("group.role"));
}

- (int64_t)accessibilityContainerType
{
  id v2;
  id v4;
  BOOL v5;
  int64_t v7;

  v2 = (id)-[UITableViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
  v5 = v2 == 0;

  if (v5)
  {
    if (-[UITableViewAccessibility _axNumberOfSections](self) <= 0
      || -[UITableViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    {
      return 0;
    }
    else
    {
      return 4;
    }
  }
  else
  {
    v4 = (id)-[UITableViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
    v7 = objc_msgSend(v4, "integerValue");

  }
  return v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  objc_super v3;
  SEL v5;
  UITableViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (!-[UITableViewAccessibility accessibilityElementCount](self, "accessibilityElementCount"))
    return 0;
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewAccessibility;
  return -[UITableViewAccessibility accessibilityRespondsToUserInteraction](&v3, sel_accessibilityRespondsToUserInteraction);
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 0;
}

- (id)_axVisibleHeadersAndFootersPriorToFirstVisibleCellSection:(void *)a1
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v7;
  double MaxY;
  id location;
  int v10;
  CGRect recta;
  id v12;
  uint64_t i;
  id v14;
  CGRect v15;
  uint64_t v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v17 = a1;
  v16 = a2;
  if (a1)
  {
    objc_msgSend(v17, "accessibilityFrame");
    v15.origin.x = v2;
    v15.origin.y = v3;
    v15.size.width = v4;
    v15.size.height = v5;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    for (i = v16 - 1; ; --i)
    {
      if (i < 0)
      {
LABEL_17:
        v18 = v14;
        v10 = 1;
        objc_storeStrong(&v14, 0);
        return v18;
      }
      v12 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v17, i, 0);
      if (v12)
      {
        memset(&recta, 0, sizeof(recta));
        objc_msgSend(v12, "accessibilityFrame");
        recta = v19;
        MaxY = CGRectGetMaxY(v19);
        if (MaxY <= CGRectGetMinY(v15))
        {
          v10 = 2;
          goto LABEL_15;
        }
        objc_msgSend(v14, "insertObject:atIndex:", v12, 0, MaxY);
      }
      location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v17, i, 1);
      if (!location)
        goto LABEL_13;
      objc_msgSend(location, "accessibilityFrame");
      v7 = CGRectGetMaxY(v20);
      if (v7 > CGRectGetMinY(v15))
        break;
      v10 = 2;
LABEL_14:
      objc_storeStrong(&location, 0);
LABEL_15:
      objc_storeStrong(&v12, 0);
      if (v10)
        goto LABEL_17;
    }
    objc_msgSend(v14, "insertObject:atIndex:", location, 0, v7);
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v18 = 0;
  return v18;
}

- (id)_axVisibleHeadersAndFootersAfterLastVisibleCellSection:(void *)a1
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v7;
  double MinY;
  id location;
  int v10;
  CGRect recta;
  id v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  CGRect v16;
  uint64_t v17;
  void *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v18 = a1;
  v17 = a2;
  if (a1)
  {
    objc_msgSend(v18, "accessibilityFrame");
    v16.origin.x = v2;
    v16.origin.y = v3;
    v16.size.width = v4;
    v16.size.height = v5;
    v15 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = -[UITableViewAccessibility _axNumberOfSections](v18);
    for (i = v17 + 1; ; ++i)
    {
      if (i >= v14)
      {
LABEL_17:
        v19 = v15;
        v10 = 1;
        objc_storeStrong(&v15, 0);
        return v19;
      }
      v12 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v18, i, 1);
      if (v12)
      {
        memset(&recta, 0, sizeof(recta));
        objc_msgSend(v12, "accessibilityFrame");
        recta = v20;
        MinY = CGRectGetMinY(v20);
        if (MinY > CGRectGetMaxY(v16))
        {
          v10 = 2;
          goto LABEL_15;
        }
        objc_msgSend(v15, "insertObject:atIndex:", v12, 0, MinY);
      }
      location = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v18, i, 0);
      if (!location)
        goto LABEL_13;
      objc_msgSend(location, "accessibilityFrame");
      v7 = CGRectGetMinY(v21);
      if (v7 <= CGRectGetMaxY(v16))
        break;
      v10 = 2;
LABEL_14:
      objc_storeStrong(&location, 0);
LABEL_15:
      objc_storeStrong(&v12, 0);
      if (v10)
        goto LABEL_17;
    }
    objc_msgSend(v15, "insertObject:atIndex:", location, 0, v7);
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v19 = 0;
  return v19;
}

- (id)_accessibilityScannerGroupElements
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  UITableViewAccessibility *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id obj;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  _QWORD v43[8];
  id v44;
  id v45;
  id v46;
  id v47;
  unint64_t i;
  _QWORD v49[8];
  id v50;
  id v51;
  id v52;
  unint64_t v53;
  id v54;
  _QWORD __b[8];
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60[2];
  UITableViewAccessibility *v61;
  _BYTE v62[128];
  _QWORD v63[4];
  _QWORD v64[4];
  _BYTE v65[128];
  _QWORD v66[4];
  _QWORD v67[4];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v61 = self;
  v60[1] = (id)a2;
  v60[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = 0x7FFFFFFFFFFFFFFFLL;
  v58 = 0;
  v57 = 64;
  if (-[UITableViewAccessibility _axNumberOfSections](v61) > 1)
    v57 |= 0x10uLL;
  memset(__b, 0, sizeof(__b));
  obj = (id)-[UITableViewAccessibility indexPathsForVisibleRows](v61, "indexPathsForVisibleRows");
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
  if (v40)
  {
    v36 = *(_QWORD *)__b[2];
    v37 = 0;
    v38 = v40;
    while (1)
    {
      v35 = v37;
      if (*(_QWORD *)__b[2] != v36)
        objc_enumerationMutation(obj);
      v56 = *(id *)(__b[1] + 8 * v37);
      v34 = v61;
      v33 = objc_msgSend(v56, "row");
      v54 = -[UITableViewAccessibility accessibilityElementForRow:andColumn:](v34, "accessibilityElementForRow:andColumn:", v33, objc_msgSend(v56, "section"));
      v53 = 0;
      v53 = objc_msgSend(v56, "section");
      if (v53 != v59)
      {
        if (objc_msgSend(v58, "count"))
        {
          v66[0] = CFSTR("GroupElements");
          v67[0] = v58;
          v66[1] = CFSTR("GroupTraits");
          v32 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v57);
          v67[1] = v32;
          v66[2] = CFSTR("GroupScanBehaviorTraits");
          v67[2] = &unk_24FF85B20;
          v66[3] = CFSTR("GroupIdentifier");
          v29 = (void *)MEMORY[0x24BDD17C8];
          v31 = -[UITableViewAccessibility _accessibilityGroupIdentifier](v61, "_accessibilityGroupIdentifier");
          v30 = (id)objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-%lu"), v31, v59);
          v67[3] = v30;
          v52 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);

          objc_msgSend(v60[0], "addObject:", v52);
          objc_storeStrong(&v52, 0);
        }
        if (v59 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v51 = -[UITableViewAccessibility _axVisibleHeadersAndFootersPriorToFirstVisibleCellSection:](v61, v53);
          memset(v49, 0, sizeof(v49));
          v27 = v51;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v49, v65, 16);
          if (v28)
          {
            v24 = *(_QWORD *)v49[2];
            v25 = 0;
            v26 = v28;
            while (1)
            {
              v23 = v25;
              if (*(_QWORD *)v49[2] != v24)
                objc_enumerationMutation(v27);
              v50 = *(id *)(v49[1] + 8 * v25);
              objc_msgSend(v50, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);
              ++v25;
              if (v23 + 1 >= v26)
              {
                v25 = 0;
                v26 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v49, v65, 16);
                if (!v26)
                  break;
              }
            }
          }

          objc_storeStrong(&v51, 0);
        }
        else
        {
          for (i = v59; i < v53; ++i)
          {
            if (i != v59)
            {
              v22 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, i, 1);
              objc_msgSend(v22, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

            }
            v21 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, i, 0);
            objc_msgSend(v21, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

          }
        }
        v20 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, v53, 1);
        objc_msgSend(v20, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

        v59 = v53;
        objc_storeStrong(&v58, 0);
        if (v53 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v3 = v58;
          v58 = v2;

        }
      }
      if (v58)
        v4 = v58;
      else
        v4 = v60[0];
      v47 = v4;
      objc_msgSend(v54, "_accessibilityProcessScannerGroupElementPieces:", v4);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v54, 0);
      ++v37;
      if (v35 + 1 >= v38)
      {
        v37 = 0;
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
        if (!v38)
          break;
      }
    }
  }

  if (objc_msgSend(v58, "count"))
  {
    v63[0] = CFSTR("GroupElements");
    v64[0] = v58;
    v63[1] = CFSTR("GroupTraits");
    v19 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v57);
    v64[1] = v19;
    v63[2] = CFSTR("GroupScanBehaviorTraits");
    v64[2] = &unk_24FF85B20;
    v63[3] = CFSTR("GroupIdentifier");
    v16 = (void *)MEMORY[0x24BDD17C8];
    v18 = -[UITableViewAccessibility _accessibilityGroupIdentifier](v61, "_accessibilityGroupIdentifier");
    v17 = (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%lu"), v18, v59);
    v64[3] = v17;
    v46 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);

    objc_msgSend(v60[0], "addObject:", v46);
    objc_storeStrong(&v46, 0);
  }
  if (v59 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v60[0], "count"))
      _AXAssert();
    v42 = -[UITableViewAccessibility _axNumberOfSections](v61);
    for (j = 0; j < v42; ++j)
    {
      v7 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, j, 1);
      objc_msgSend(v7, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

      v8 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, j, 0);
      objc_msgSend(v8, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

    }
  }
  else
  {
    v13 = -[UITableViewAccessibility accessibilityTableViewSectionElementAtSection:isHeader:](v61, v59, 0);
    objc_msgSend(v13, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);

    v45 = -[UITableViewAccessibility _axVisibleHeadersAndFootersAfterLastVisibleCellSection:](v61, v59);
    memset(v43, 0, sizeof(v43));
    v14 = v45;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v43, v62, 16);
    if (v15)
    {
      v10 = *(_QWORD *)v43[2];
      v11 = 0;
      v12 = v15;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)v43[2] != v10)
          objc_enumerationMutation(v14);
        v44 = *(id *)(v43[1] + 8 * v11);
        objc_msgSend(v44, "_accessibilityProcessScannerGroupElementPieces:", v60[0]);
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v43, v62, 16);
          if (!v12)
            break;
        }
      }
    }

    objc_storeStrong(&v45, 0);
  }
  v6 = v60[0];
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v60, 0);
  return v6;
}

- (id)_accessibilityGroupIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
}

- (BOOL)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  objc_super v3;
  int v4;
  id v5;
  id v6;
  char v7;
  id v8[2];
  UITableViewAccessibility *v9;
  char v10;

  v9 = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  if ((objc_msgSend(v5, "isEditing") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v3.receiver = v9;
    v3.super_class = (Class)UITableViewAccessibility;
    v10 = -[UITableViewAccessibility _accessibilityCanPerformEscapeAction](&v3, sel__accessibilityCanPerformEscapeAction);
  }
  v4 = 1;
  objc_storeStrong(v8, 0);
  return v10 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v3;
  int v4;
  id v5;
  id v6;
  char v7;
  id v8[2];
  UITableViewAccessibility *v9;
  char v10;

  v9 = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  if ((objc_msgSend(v5, "isEditing") & 1) != 0)
  {
    objc_msgSend(v8[0], "setEditing:animated:", 0, 1);
    v10 = 1;
  }
  else
  {
    v3.receiver = v9;
    v3.super_class = (Class)UITableViewAccessibility;
    v10 = -[UITableViewAccessibility accessibilityPerformEscape](&v3, sel_accessibilityPerformEscape);
  }
  v4 = 1;
  objc_storeStrong(v8, 0);
  return v10 & 1;
}

- (id)_accessibilityReusableViewForOpaqueElement:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = location[0];
  while (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v3 = (id)objc_msgSend(v7, "accessibilityContainer");
    v4 = v7;
    v7 = v3;

  }
  v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)_accessibilityNativeFocusPreferredElementIsValid
{
  uint64_t v2;
  unsigned __int8 v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  SEL v8;
  UITableViewAccessibility *v9;

  v9 = self;
  v8 = a2;
  v6 = -[UITableViewAccessibility safeRangeForKey:](self, "safeRangeForKey:", CFSTR("_visibleGlobalRows"));
  v7 = v2;
  v4 = 0;
  if (v2)
  {
    v5.receiver = v9;
    v5.super_class = (Class)UITableViewAccessibility;
    v4 = -[UITableViewAccessibility _accessibilityNativeFocusPreferredElementIsValid](&v5, sel__accessibilityNativeFocusPreferredElementIsValid);
  }
  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 1;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewAccessibility;
  -[UITableViewAccessibility _didUpdateFocusInContext:](&v3, sel__didUpdateFocusInContext_, location[0]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityLastFocusedChild
{
  id v2;
  id v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL (*v10)(id *, void *);
  void *v11;
  UITableViewAccessibility *v12;
  id location[2];
  UITableViewAccessibility *v14;
  id v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewAccessibility _axGetLastFocusedChild](self, "_axGetLastFocusedChild");
  v4 = location[0];
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __58__UITableViewAccessibility__accessibilityLastFocusedChild__block_invoke;
  v11 = &unk_24FF3E2D0;
  v12 = v14;
  v2 = (id)objc_msgSend(v4, "_accessibilityFindAncestor:startWithSelf:", &v7, 1);
  v5 = v2 == 0;

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v15 = location[0];
    v6 = 1;
  }
  objc_storeStrong((id *)&v12, 0);
  if (!v6)
    v15 = 0;
  objc_storeStrong(location, 0);
  return v15;
}

BOOL __58__UITableViewAccessibility__accessibilityLastFocusedChild__block_invoke(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)preferredFocusEnvironments
{
  id v2;
  id v3;
  id v5;
  id location;
  objc_super v7;
  id v8[2];
  UITableViewAccessibility *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UITableViewAccessibility;
  v8[0] = -[UITableViewAccessibility preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
  if ((-[UITableViewAccessibility _accessibilityIsFKARunningForFocusItem](v9, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    location = -[UITableViewAccessibility preferredFocusedView](v9, "preferredFocusedView");
    if (location)
    {
      v10[0] = location;
      v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v3 = v8[0];
      v8[0] = v2;

    }
    objc_storeStrong(&location, 0);
  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (id)preferredFocusedView
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  char v28;
  objc_super v29;
  id v30[2];
  UITableViewAccessibility *v31;

  v31 = self;
  v30[1] = (id)a2;
  v29.receiver = self;
  v29.super_class = (Class)UITableViewAccessibility;
  v30[0] = -[UITableViewAccessibility preferredFocusedView](&v29, sel_preferredFocusedView);
  if ((-[UITableViewAccessibility _accessibilityIsFKARunningForFocusItem](v31, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v28 = 1;
    v26 = 0;
    objc_opt_class();
    v25 = (id)__UIAccessibilityCastAsClass();
    v24 = v25;
    objc_storeStrong(&v25, 0);
    v27 = v24;
    v23 = -[UITableViewAccessibility _accessibilityLastFocusedChild](v31, "_accessibilityLastFocusedChild");
    if (v23)
    {
      v22 = (id)objc_msgSend(v23, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_618, 1);
      v21 = (id)objc_msgSend(v22, "_accessibilityIndexPath");
      v20 = v21 != 0;
      if (v21)
      {
        v13 = (id)objc_msgSend(v27, "cellForRowAtIndexPath:", v21);
        v14 = 0;
        if (v13 == v22)
          v14 = objc_msgSend(v22, "_accessibilityViewIsVisible");
        v20 = v14 & 1;

      }
      if ((v20 & 1) == 0)
      {
        v19 = 0;
        objc_opt_class();
        v18 = (id)__UIAccessibilityCastAsSafeCategory();
        v17 = v18;
        objc_storeStrong(&v18, 0);
        v11 = v22;
        v12 = (id)-[UITableViewAccessibility visibleCells](v31, "visibleCells");
        v2 = -[UIViewAccessibility _accessibilityViewMatchingFKAView:inArray:]((uint64_t)v17, v11, v12);
        v3 = v23;
        v23 = v2;

        -[UITableViewAccessibility _axSetLastFocusedChild:](v31, "_axSetLastFocusedChild:", v23);
        v20 = v23 != 0;
      }
      if (v23 && (v20 & 1) != 0)
      {
        objc_storeStrong(v30, v23);
        v28 = 0;
      }
      else
      {
        -[UITableViewAccessibility _axSetLastFocusedChild:](v31, "_axSetLastFocusedChild:", 0);
      }
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    v15 = 0;
    v10 = 0;
    if ((v28 & 1) != 0)
    {
      v16 = (id)objc_msgSend(v27, "indexPathForSelectedRow");
      v15 = 1;
      v10 = v16 != 0;
    }
    if ((v15 & 1) != 0)

    if (v10)
    {
      v8 = v27;
      v9 = (id)objc_msgSend(v27, "indexPathForSelectedRow");
      v4 = (id)objc_msgSend(v8, "cellForRowAtIndexPath:");
      v5 = v30[0];
      v30[0] = v4;

    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v27, 0);
  }
  v7 = v30[0];
  objc_storeStrong(v30, 0);
  return v7;
}

uint64_t __48__UITableViewAccessibility_preferredFocusedView__block_invoke(void *a1, void *a2)
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

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 1;
}

- (id)_childFocusViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20[2];
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  objc_super v32;
  id v33[2];
  UITableViewAccessibility *v34;
  id v35;

  v34 = self;
  v33[1] = (id)a2;
  v32.receiver = self;
  v32.super_class = (Class)UITableViewAccessibility;
  v18 = -[UITableViewAccessibility _childFocusViews](&v32, sel__childFocusViews);
  v33[0] = (id)objc_msgSend(v18, "mutableCopy");

  if ((-[UITableViewAccessibility _accessibilityIsFKARunningForFocusItem](v34, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v30 = 0;
    objc_opt_class();
    v17 = (id)-[UITableViewAccessibility _swipeActionController](v34, "_swipeActionController");
    v16 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("currentSwipeOccurrence"));
    v29 = (id)__UIAccessibilityCastAsClass();

    v28 = v29;
    objc_storeStrong(&v29, 0);
    v31 = v28;
    if (v28)
    {
      v15 = v33[0];
      v21 = 0;
      v22 = &v21;
      v23 = 838860800;
      v24 = 48;
      v25 = __Block_byref_object_copy__20;
      v26 = __Block_byref_object_dispose__20;
      v27 = 0;
      v20[1] = &v21;
      v20[0] = v31;
      AXPerformSafeBlock();
      v19 = (id)v22[5];
      objc_storeStrong(v20, 0);
      _Block_object_dispose(&v21, 8);
      objc_storeStrong(&v27, 0);
      objc_msgSend(v15, "axSafelyAddObject:");

    }
    v3 = v33[0];
    v4 = -[UITableViewAccessibility _accessibilitySupplementaryHeaderViews](v34, "_accessibilitySupplementaryHeaderViews");
    objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

    v5 = v33[0];
    v6 = -[UITableViewAccessibility _accessibilitySupplementaryFooterViews](v34, "_accessibilitySupplementaryFooterViews");
    objc_msgSend(v5, "axSafelyAddObjectsFromArray:");

    v7 = v33[0];
    v8 = (id)-[UITableViewAccessibility safeValueForKey:](v34, "safeValueForKey:", CFSTR("_index"));
    objc_msgSend(v7, "removeObject:");

    -[UITableViewAccessibility _axSetupIndexGuide](v34);
    v9 = (void *)MEMORY[0x24BDF6F90];
    v14 = (id)objc_msgSend(v33[0], "reverseObjectEnumerator");
    v13 = (id)objc_msgSend(v14, "allObjects");
    v12 = (id)objc_msgSend(v9, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
    v11 = (id)objc_msgSend(v12, "reverseObjectEnumerator");
    v10 = (id)objc_msgSend(v11, "allObjects");
    v35 = (id)objc_msgSend(v10, "ax_filteredArrayUsingBlock:", &__block_literal_global_623);

    objc_storeStrong(&v31, 0);
  }
  else
  {
    v35 = v33[0];
  }
  objc_storeStrong(v33, 0);
  return v35;
}

void __44__UITableViewAccessibility__childFocusViews__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_pullViewForSwipeDirection:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", CFSTR("configuredDirection")));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (void)_axSetupIndexGuide
{
  unint64_t v1;
  double v2;
  int v3;
  double v4;
  id v5;
  id v6;
  BOOL v7;
  __int128 v8;
  double v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v13 = a1;
  if (a1)
  {
    v12 = (id)objc_msgSend(v13, "safeValueForKey:", CFSTR("_index"));
    v6 = -[UITableViewAccessibility _axGetIndexGuide](v13);
    v7 = 0;
    if (!v6)
      v7 = v12 != 0;

    if (v7)
    {
      v11 = v13;
      v10 = objc_alloc_init(MEMORY[0x24BDF6A58]);
      v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v12);
      objc_msgSend(v10, "setPreferredFocusEnvironments:");

      objc_msgSend(v10, "setAccessibilityContainer:", v12);
      objc_msgSend(v11, "bounds");
      v8 = v1;
      v9 = v2;
      if ((objc_msgSend(v13, "_accessibilityIsRTL") & 1) != 0)
        v3 = -1;
      else
        v3 = 1;
      *(double *)&v8 = (double)v3 * v9 * 2.0;
      objc_msgSend(v11, "contentSize");
      objc_msgSend(v10, "_setManualLayoutFrame:", v8, v9, v4);
      -[UITableViewAccessibility _axSetIndexGuide:]((uint64_t)v13, v10);
      objc_msgSend(v11, "addLayoutGuide:", v10);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v12, 0);
  }
}

uint64_t __44__UITableViewAccessibility__childFocusViews__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityFKAShouldBeProcessed");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_shouldSelectionFollowFocusForIndexPath:(id)a3 initiatedBySelection:(BOOL)a4
{
  char v5;
  objc_super v7;
  char v8;
  BOOL v9;
  id location[2];
  UITableViewAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)UITableViewAccessibility;
  v8 = -[UITableViewAccessibility _shouldSelectionFollowFocusForIndexPath:initiatedBySelection:](&v7, sel__shouldSelectionFollowFocusForIndexPath_initiatedBySelection_, location[0], a4);
  if ((-[UITableViewAccessibility _accessibilityIsFKARunningForFocusItem](v11, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v8 = 0;
  v5 = v8;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_axGetIndexGuide
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UITableViewAccessibility___axGetIndexGuide);
  else
    return 0;
}

- (void)_axSetIndexGuide:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilitySelectedChildren
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id (*v8)(id *, void *);
  void *v9;
  UITableViewAccessibility *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  id (*v15)(id *, void *);
  void *v16;
  UITableViewAccessibility *v17;
  id v18[2];
  UITableViewAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = (id)-[UITableViewAccessibility indexPathsForSelectedRows](self, "indexPathsForSelectedRows");
  if (-[UITableViewAccessibility isAccessibilityOpaqueElementProvider](v19, "isAccessibilityOpaqueElementProvider"))
  {
    v4 = v18[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke;
    v16 = &unk_24FF3E938;
    v17 = v19;
    v20 = (id)objc_msgSend(v4, "ax_flatMappedArrayUsingBlock:", &v12);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v3 = v18[0];
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke_2;
    v9 = &unk_24FF3E938;
    v10 = v19;
    v20 = (id)objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &v5);
    objc_storeStrong((id *)&v10, 0);
  }
  v11 = 1;
  objc_storeStrong(v18, 0);
  return v20;
}

id __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "accessibilityCellForRowAtIndexPath:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

id __58__UITableViewAccessibility__accessibilitySelectedChildren__block_invoke_2(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "_accessibilityTableViewCellElementForIndexPath:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

@end
