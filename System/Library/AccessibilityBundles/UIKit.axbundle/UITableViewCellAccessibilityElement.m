@implementation UITableViewCellAccessibilityElement

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (UITableViewCell)realTableViewCell
{
  void *v2;
  BOOL v3;
  id v4;
  BOOL v6;
  BOOL v7;
  id v8;
  id v9;
  id v10[2];
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20[2];
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  int v35;
  char v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41;
  char v42;
  id v43[2];
  UITableViewCellAccessibilityElement *v44;
  id v45;

  v44 = self;
  v43[1] = (id)a2;
  v42 = 0;
  objc_opt_class();
  v8 = (id)-[UITableViewCellAccessibilityElement accessibilityContainer](v44, "accessibilityContainer");
  v41 = (id)__UIAccessibilityCastAsClass();

  v40 = v41;
  objc_storeStrong(&v41, 0);
  v43[0] = v40;
  objc_opt_class();
  v38 = 0;
  v36 = 0;
  v7 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = (id)objc_msgSend(v43[0], "dataSource");
    v38 = 1;
    v7 = 1;
    if (v39)
    {
      v37 = (id)objc_msgSend(v43[0], "superview");
      v36 = 1;
      v7 = v37 == 0;
    }
  }
  if ((v36 & 1) != 0)

  if ((v38 & 1) != 0)
  if (v7)
  {
    v45 = 0;
    v35 = 1;
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 838860800;
    v31 = 48;
    v32 = __Block_byref_object_copy__22;
    v33 = __Block_byref_object_dispose__22;
    v34 = (id)objc_msgSend(v43[0], "_existingCellForRowAtIndexPath:", v44->_indexPath);
    if (!v29[5])
    {
      v21 = 0;
      v22 = &v21;
      v23 = 838860800;
      v24 = 48;
      v25 = __Block_byref_object_copy__22;
      v26 = __Block_byref_object_dispose__22;
      v27 = 0;
      v14 = MEMORY[0x24BDAC760];
      v15 = -1073741824;
      v16 = 0;
      v17 = __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke;
      v18 = &unk_24FF3DAB0;
      v20[1] = &v21;
      v19 = v43[0];
      v20[0] = v44;
      AXPerformSafeBlock();
      v13 = (id)v22[5];
      objc_storeStrong(v20, 0);
      objc_storeStrong(&v19, 0);
      _Block_object_dispose(&v21, 8);
      objc_storeStrong(&v27, 0);
      v2 = (void *)v29[5];
      v29[5] = (uint64_t)v13;

    }
    v3 = v29[5] == 0;
    v11 = 0;
    v6 = 0;
    if (!v3)
    {
      v12 = (id)objc_msgSend((id)v29[5], "superview");
      v11 = 1;
      v6 = v12 == 0;
    }
    if ((v11 & 1) != 0)

    if (v6)
    {
      v10[1] = &v28;
      v9 = v43[0];
      v10[0] = v44;
      AXPerformSafeBlock();
      v4 = (id)objc_msgSend(v43[0], "safeValueForKey:", CFSTR("_updateVisibleCellsImmediatelyIfNecessary"));
      objc_storeStrong(v10, 0);
      objc_storeStrong(&v9, 0);
    }
    v45 = (id)v29[5];
    v35 = 1;
    _Block_object_dispose(&v28, 8);
    objc_storeStrong(&v34, 0);
  }
  objc_storeStrong(v43, 0);
  return (UITableViewCell *)v45;
}

void __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __56__UITableViewCellAccessibilityElement_realTableViewCell__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id location[3];

  location[2] = (id)a1;
  location[1] = (id)a1;
  v1 = objc_msgSend(*(id *)(a1 + 32), "_createPreparedCellForRowAtIndexPath:willDisplay:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  location[0] = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "tableView:didEndDisplayingCell:forRowAtIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  objc_storeStrong(location, 0);
}

- (id)_accessibilityProxyView
{
  return -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell", a2, self);
}

- (BOOL)_accessibilityBackingElementIsValid
{
  UITableViewCell *v2;
  BOOL v4;

  v2 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = v2 != 0;

  return v4;
}

- (id)existingTableViewCell
{
  if (a1)
    return *(id *)(a1 + 64);
  else
    return 0;
}

- (int64_t)_accessibilityUserTestingChildrenCount
{
  UITableViewCell *v3;
  int64_t v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityUserTestingChildrenCount](v3, "_accessibilityUserTestingChildrenCount");

  return v4;
}

- (UITableViewCell)tableViewCell
{
  id v2;
  UITableViewCell *v3;
  UITableViewCell *tableViewCell;
  BOOL v5;
  int v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *context;
  BOOL v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  os_log_type_t v21;
  id location;
  id v23[2];
  UITableViewCellAccessibilityElement *v24;
  UITableViewCell *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)-[UITableViewCellAccessibilityElement _accessibilityParentView](self, "_accessibilityParentView");
  v2 = (id)objc_msgSend(v23[0], "superview");
  v13 = v2 != 0;

  if (v13)
  {
    context = (void *)MEMORY[0x2348C3C98]();
    v19 = -[UITableViewCellAccessibilityElement realTableViewCell](v24, "realTableViewCell");
    if (v19)
    {
      v5 = v19 != v24->_tableViewCell;
      v15 = 0;
      LOBYTE(v7) = 1;
      if (!v5)
      {
        v16 = (id)objc_msgSend(v19, "_accessibilityIndexPath");
        v15 = 1;
        v7 = objc_msgSend(v16, "isEqual:", v24->_indexPath) ^ 1;
      }
      if ((v15 & 1) != 0)

      if ((v7 & 1) != 0)
      {
        v14 = v24->_tableViewCell;
        -[UITableViewCellAccessibilityElement setTableViewCell:](v24, "setTableViewCell:", v19);
        if (v14)
        {
          objc_msgSend(v19, "layoutSubviews");
          -[UITableViewCellAccessibility _accessibilityReuseChildren:forMockParent:](v19, v14, v24);
          if (v14 != v24->_tableViewCell)
            objc_msgSend(v14, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
        }
        else
        {
          objc_msgSend(v19, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
          -[UITableViewCellAccessibility _setAccessibilityMockParent:](v19, v24);
          objc_msgSend(v19, "layoutSubviews");
        }
        v24->_usingRealTableViewCell = 1;
        objc_storeStrong(&v14, 0);
      }
    }
    else
    {
      if (v24->_tableViewCell)
      {
        v9 = (id)-[UITableViewCell _accessibilityIndexPath](v24->_tableViewCell, "_accessibilityIndexPath");
        v10 = objc_msgSend(v9, "isEqual:", v24->_indexPath);

        if ((v10 & 1) == 0)
        {
          v8 = (id)-[UITableViewCellAccessibilityElement accessibilityContainer](v24, "accessibilityContainer");
          v18 = (id)objc_msgSend(v8, "accessibilityCellForRowAtIndexPath:", v24->_indexPath);

          -[UITableViewCellAccessibility _setAccessibilityMockParent:](v18, v24);
          objc_msgSend(v18, "layoutSubviews");
          objc_msgSend(v18, "removeFromSuperview");
          v17 = v24->_tableViewCell;
          -[UITableViewCellAccessibilityElement setTableViewCell:](v24, "setTableViewCell:", v18);
          -[UITableViewCellAccessibility _accessibilityReuseChildren:forMockParent:](v18, v17, v24);
          if (v17 != v18)
            objc_msgSend(v17, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
          objc_storeStrong(&v17, 0);
          objc_storeStrong(&v18, 0);
        }
      }
      else
      {
        v11 = (id)-[UITableViewCellAccessibilityElement accessibilityContainer](v24, "accessibilityContainer");
        v3 = (UITableViewCell *)(id)objc_msgSend(v11, "accessibilityCellForRowAtIndexPath:", v24->_indexPath);
        tableViewCell = v24->_tableViewCell;
        v24->_tableViewCell = v3;

        -[UITableViewCellAccessibility _setAccessibilityMockParent:](v24->_tableViewCell, v24);
        -[UITableViewCell removeFromSuperview](v24->_tableViewCell, "removeFromSuperview");
      }
      v24->_usingRealTableViewCell = 0;
    }
    objc_storeStrong(&v19, 0);
    objc_autoreleasePoolPop(context);
    v25 = v24->_tableViewCell;
    v20 = 1;
  }
  else
  {
    location = (id)AXLogUIA();
    v21 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v23[0]);
      _os_log_impl(&dword_230C4A000, (os_log_t)location, v21, "No parent view for table cell: %@", v26, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v25 = 0;
    v20 = 1;
  }
  objc_storeStrong(v23, 0);
  return v25;
}

- (BOOL)_accessibilityElementServesAsHeadingLandmark
{
  return -[UITableViewCell _accessibilityElementServesAsHeadingLandmark](self->_tableViewCell, "_accessibilityElementServesAsHeadingLandmark", a2, self) & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return -[UITableViewCell shouldGroupAccessibilityChildren](self->_tableViewCell, "shouldGroupAccessibilityChildren", a2, self) & 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  int64_t v6;
  id v7;
  id location[2];
  UITableViewCellAccessibilityElement *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[UITableViewCell _accessibilityCompareElement:toElement:](v9->_tableViewCell, "_accessibilityCompareElement:toElement:", location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  double result;

  -[UITableViewCell _accessibilityAllowedGeometryOverlap](self->_tableViewCell, "_accessibilityAllowedGeometryOverlap", a2, self);
  return result;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UITableViewCellAccessibilityElement *v4;

  v4 = self;
  v3 = a2;
  -[UITableViewCell _accessibilityRemoveValueForKey:](self->_tableViewCell, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
  v2.receiver = v4;
  v2.super_class = (Class)UITableViewCellAccessibilityElement;
  -[UITableViewCellAccessibilityElement dealloc](&v2, sel_dealloc);
}

- (void)unregisterAllChildren
{
  UITableViewCellAccessibilityElement *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSMutableArray *obj;
  uint64_t v9;
  _QWORD __b[8];
  id *v11;
  SEL v12;
  UITableViewCellAccessibilityElement *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v13->_mockChildren;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
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
      v11 = *(id **)(__b[1] + 8 * v6);
      v2 = (UITableViewCellAccessibilityElement *)(id)objc_msgSend(v11, "accessibilityContainer");
      v3 = v2 != v13;

      if (!v3)
        objc_msgSend(v11, "setAccessibilityContainer:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UITableTextAccessibilityElement setTextDelegate:](v11, 0);
        -[UITableTextAccessibilityElement setAttributeDelegate:](v11, 0);
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong((id *)&v13->_mockChildren, 0);
}

- (void)registerMockChild:(id)a3
{
  uint64_t v3;
  NSMutableArray *mockChildren;
  id v5;
  int v6;
  id location[2];
  UITableViewCellAccessibilityElement *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v5 = (id)objc_msgSend(location[0], "accessibilityContainer");
    if (v5 != v8 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "unregisterMockChild:", location[0]);
    if (!v8->_mockChildren)
    {
      v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
      mockChildren = v8->_mockChildren;
      v8->_mockChildren = (NSMutableArray *)v3;

    }
    if ((-[NSMutableArray containsObject:](v8->_mockChildren, "containsObject:", location[0]) & 1) == 0)
      -[NSMutableArray addObject:](v8->_mockChildren, "addObject:", location[0]);
    objc_storeStrong(&v5, 0);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)unregisterMockChild:(id)a3
{
  UITableViewCellAccessibilityElement *v3;
  BOOL v4;
  id location[2];
  UITableViewCellAccessibilityElement *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = (UITableViewCellAccessibilityElement *)(id)objc_msgSend(location[0], "accessibilityContainer");
    v4 = v3 != v6;

    if (!v4)
      objc_msgSend(location[0], "setAccessibilityContainer:", 0);
    -[NSMutableArray removeObjectIdenticalTo:](v6->_mockChildren, "removeObjectIdenticalTo:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsTableCell
{
  return 1;
}

- (id)accessibilityLabel
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityAXAttributedLabel](v3, "_accessibilityAXAttributedLabel");

  return v4;
}

- (id)accessibilityLocalizedStringKey
{
  UITableViewCell *v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v7[0] = (id)-[UITableViewCell accessibilityLabel](v3, "accessibilityLabel");

  v6 = (id)objc_msgSend(v7[0], "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringKey"));
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

- (id)accessibilityLocalizationBundleID
{
  UITableViewCell *v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v7[0] = (id)-[UITableViewCell accessibilityLabel](v3, "accessibilityLabel");

  v6 = (id)objc_msgSend(v7[0], "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringBundleID"));
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

- (id)accessibilityLocalizationBundlePath
{
  UITableViewCell *v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v7[0] = (id)-[UITableViewCell accessibilityLabel](v3, "accessibilityLabel");

  v6 = (id)objc_msgSend(v7[0], "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizationBundlePath"));
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

- (id)accessibilityLocalizedStringTableName
{
  UITableViewCell *v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v7[0] = (id)-[UITableViewCell accessibilityLabel](v3, "accessibilityLabel");

  v6 = (id)objc_msgSend(v7[0], "_accessibilityAttributedLocalizedString");
  v5 = (id)objc_msgSend(v6, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringTableName"));
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityCustomActionGroupIdentifier](v3, "_accessibilityCustomActionGroupIdentifier");

  return v4;
}

- (id)accessibilityValue
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityAXAttributedValue](v3, "_accessibilityAXAttributedValue");

  return v4;
}

- (id)accessibilityIdentifier
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell accessibilityIdentifier](v3, "accessibilityIdentifier");

  return v4;
}

- (unint64_t)accessibilityTraits
{
  UITableViewCell *v2;
  UITableViewCell *v4;
  BOOL v5;
  unint64_t v7;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v5 = v2 != 0;

  if (!v5)
    return *MEMORY[0x24BEBB178];
  v4 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v7 = -[UITableViewCell accessibilityTraits](v4, "accessibilityTraits");

  return v7;
}

- (void)_accessibilityMarkElementForVisiblePointHitTest:(BOOL)a3
{
  UITableViewCell *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  UITableViewCellAccessibilityElement *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityMarkElementForVisiblePointHitTest:](v3, "_accessibilityMarkElementForVisiblePointHitTest:", v5);

  v4.receiver = v7;
  v4.super_class = (Class)UITableViewCellAccessibilityElement;
  -[UITableViewCellAccessibilityElement _accessibilityMarkElementForVisiblePointHitTest:](&v4, sel__accessibilityMarkElementForVisiblePointHitTest_, v5);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  UITableViewCell *v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell accessibilityActivationPoint](v6, "accessibilityActivationPoint");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHeaderElements
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell accessibilityHeaderElements](v3, "accessibilityHeaderElements");

  return v4;
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityIsAwayAlertElement](v3, "_accessibilityIsAwayAlertElement");

  return v4 & 1;
}

- (id)accessibilityHint
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityAXAttributedHint](v3, "_accessibilityAXAttributedHint");

  return v4;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  UITableViewCell *v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v6 = -[UITableViewCell accessibilityRowRange](v5, "accessibilityRowRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityImplementsDefaultRowRange](v3, "_accessibilityImplementsDefaultRowRange");

  return v4 & 1;
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  UITableViewCell *v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v6 = -[UITableViewCell _accessibilityIndexPathAsRange](v5, "_accessibilityIndexPathAsRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  id v19;
  int v20;
  id v21[2];
  UITableViewCellAccessibilityElement *v22;
  __int128 v23;
  __int128 v24;
  CGRect result;

  v22 = self;
  v21[1] = (id)a2;
  if (self->_indexPath)
  {
    v21[0] = (id)-[UITableViewCellAccessibilityElement accessibilityContainer](v22, "accessibilityContainer");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0;
      objc_opt_class();
      v17 = (id)__UIAccessibilityCastAsClass();
      v16 = v17;
      objc_storeStrong(&v17, 0);
      v19 = v16;
      v15 = objc_msgSend(v16, "numberOfSections");
      if (-[NSIndexPath section](v22->_indexPath, "section") < v15 && v15)
      {
        v14 = objc_msgSend(v19, "numberOfRowsInSection:", -[NSIndexPath section](v22->_indexPath, "section"));
        if (-[NSIndexPath row](v22->_indexPath, "row") < v14 && v14)
        {
          objc_msgSend(v19, "rectForRowAtIndexPath:", v22->_indexPath);
          UIAccessibilityFrameForBounds();
          *(_QWORD *)&v23 = v6;
          *((_QWORD *)&v23 + 1) = v7;
          *(_QWORD *)&v24 = v8;
          *((_QWORD *)&v24 + 1) = v9;
          v20 = 1;
        }
        else
        {
          v23 = *MEMORY[0x24BDBF090];
          v24 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
          v20 = 1;
        }
      }
      else
      {
        v23 = *MEMORY[0x24BDBF090];
        v24 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
        v20 = 1;
      }
      objc_storeStrong(&v19, 0);
    }
    else
    {
      objc_msgSend(v21[0], "accessibilityFrame");
      *(_QWORD *)&v23 = v2;
      *((_QWORD *)&v23 + 1) = v3;
      *(_QWORD *)&v24 = v4;
      *((_QWORD *)&v24 + 1) = v5;
      v20 = 1;
    }
    objc_storeStrong(v21, 0);
  }
  else
  {
    v23 = *MEMORY[0x24BDBF090];
    v24 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  }
  v11 = *((double *)&v23 + 1);
  v10 = *(double *)&v23;
  v13 = *((double *)&v24 + 1);
  v12 = *(double *)&v24;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)accessibilityLanguage
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell accessibilityLanguage](v3, "accessibilityLanguage");

  return v4;
}

- (BOOL)isAccessibilityElement
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell isAccessibilityElement](v3, "isAccessibilityElement");

  return v4 & 1;
}

- (void)accessibilityIncrement
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell accessibilityIncrement](v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell accessibilityDecrement](v2, "accessibilityDecrement");

}

- (CGPoint)_accessibilityMinScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  UITableViewCell *v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityMinScrubberPosition](v6, "_accessibilityMinScrubberPosition");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  double v2;
  double v3;
  double v4;
  double v5;
  UITableViewCell *v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityMaxScrubberPosition](v6, "_accessibilityMaxScrubberPosition");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)accessibilityActivate
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell accessibilityActivate](v3, "accessibilityActivate");

  return v4 & 1;
}

- (id)automationCustomProperties
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell automationCustomProperties](v3, "automationCustomProperties");

  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilitySupportsActivateAction](v3, "_accessibilitySupportsActivateAction");

  return v4 & 1;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  UITableViewCell *v4;
  id v5;

  v4 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v5 = (id)-[UITableViewCell _accessibilityDataDetectorScheme:](v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  UITableViewCell *v4;
  id v5;

  v4 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v5 = (id)-[UITableViewCell _accessibilityLineNumberAndColumnForPoint:](v4, "_accessibilityLineNumberAndColumnForPoint:", a3.x, a3.y);

  return v5;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  UITableViewCell *v6;
  id location[2];
  UITableViewCellAccessibilityElement *v8;
  uint64_t v9;
  NSUInteger v10;
  _NSRange result;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[UITableViewCellAccessibilityElement tableViewCell](v8, "tableViewCell");
  v9 = -[UITableViewCell _accessibilityRangeForLineNumberAndColumn:](v6, "_accessibilityRangeForLineNumberAndColumn:", location[0]);
  v10 = v3;

  objc_storeStrong(location, 0);
  v4 = v9;
  v5 = v10;
  result.length = v5;
  result.location = v4;
  return result;
}

- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UITableViewCell *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v11 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityChargedLineBoundsForRange:](v11, "_accessibilityChargedLineBoundsForRange:", a3.location, a3.length);
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;

  v7 = v13;
  v8 = v14;
  v9 = v15;
  v10 = v16;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UITableViewCell *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v11 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityBoundsForRange:](v11, "_accessibilityBoundsForRange:", a3.location, a3.length);
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;

  v7 = v13;
  v8 = v14;
  v9 = v15;
  v10 = v16;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)_accessibilityEquivalenceTag
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityEquivalenceTag](v3, "_accessibilityEquivalenceTag");

  return v4;
}

- (int64_t)accessibilityElementCount
{
  UITableViewCell *v3;
  int64_t v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell accessibilityElementCount](v3, "accessibilityElementCount");

  return v4;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  id obj;
  uint64_t v26;
  UITableViewCell *v27;
  char v28;
  UITableViewCellAccessibilityElement *v29;
  _QWORD __b[8];
  void *v31;
  id location;
  id v33;
  id v34;
  id v35;
  id v36;
  int64_t v37;
  SEL v38;
  UITableViewCellAccessibilityElement *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  v38 = a2;
  v37 = a3;
  v27 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v36 = (id)-[UITableViewCell accessibilityElementAtIndex:](v27, "accessibilityElementAtIndex:", v37);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v36;
  else
    v3 = 0;
  v35 = v3;
  if ((objc_msgSend(v36, "isAccessibilityElement") & 1) != 0 && v35 && -[UIAccessibilityElement representsSubview](v35))
  {
    v34 = -[UITableViewCellAccessibilityElement realTableViewCell](v39, "realTableViewCell");
    if (v34)
    {
      v33 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("subviews"));
      v22 = v33;
      v24 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("contentView"));
      v23 = (id)objc_msgSend(v24, "subviews");
      v4 = (id)objc_msgSend(v22, "arrayByAddingObjectsFromArray:");
      v5 = v33;
      v33 = v4;

      location = 0;
      memset(__b, 0, sizeof(__b));
      obj = v33;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
      if (v26)
      {
        v19 = *(_QWORD *)__b[2];
        v20 = 0;
        v21 = v26;
        while (1)
        {
          v18 = v20;
          if (*(_QWORD *)__b[2] != v19)
            objc_enumerationMutation(obj);
          v31 = *(void **)(__b[1] + 8 * v20);
          if (-[UIAccessibilityElement elementMatchesSubview:](v35, v31))
            break;
          ++v20;
          if (v18 + 1 >= v21)
          {
            v20 = 0;
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
            if (!v21)
              goto LABEL_16;
          }
        }
        objc_storeStrong(&location, v31);
      }
LABEL_16:

      if (location)
      {
        v13 = v36;
        v14 = (id)objc_msgSend(location, "accessibilityLabel");
        objc_msgSend(v13, "setAccessibilityLabel:");

        v15 = v36;
        v16 = (id)objc_msgSend(location, "accessibilityValue");
        objc_msgSend(v15, "setAccessibilityValue:");

        v17 = v36;
        objc_msgSend(location, "accessibilityFrame");
        objc_msgSend(v17, "setAccessibilityFrame:", v6, v7, v8, v9);
        objc_msgSend(v36, "setAccessibilityTraits:", objc_msgSend(location, "accessibilityTraits"));
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong(&v34, 0);
  }
  v28 = 0;
  v12 = 0;
  if (v35)
  {
    v29 = (UITableViewCellAccessibilityElement *)(id)objc_msgSend(v36, "accessibilityContainer");
    v28 = 1;
    v12 = v29 != v39;
  }
  if ((v28 & 1) != 0)

  if (v12)
  {
    -[UITableViewCellAccessibilityElement registerMockChild:](v39, "registerMockChild:", v36);
    objc_msgSend(v36, "setAccessibilityContainer:", v39);
  }
  v11 = v36;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  return v11;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibilityElement *v6;
  int64_t v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibilityElement tableViewCell](v6, "tableViewCell");
  if (v4)
    v7 = objc_msgSend(v4, "indexOfAccessibilityElement:", location[0]);
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v4;
  double v5;
  id v6;
  id v7;
  id v9;
  int v10;
  BOOL v11;
  char v12;
  id v13;
  char v14;
  UITableViewCellAccessibilityElement *v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  UITableViewCellAccessibilityElement *v20;
  CGPoint v21;

  v21 = a3;
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v18 = 0;
  v17 = -[UITableViewCellAccessibilityElement tableViewCell](v20, "tableViewCell");
  v16 = (id)-[UITableViewCellAccessibilityElement accessibilityContainer](v20, "accessibilityContainer");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "convertPoint:fromView:", v16, v21.x, v21.y);
    v6 = (id)objc_msgSend(v17, "_accessibilityHitTest:withEvent:", location[0], v4, v5);
    v7 = v18;
    v18 = v6;

  }
  objc_opt_class();
  v14 = 0;
  v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (UITableViewCellAccessibilityElement *)(id)objc_msgSend(v18, "accessibilityContainer");
    v14 = 1;
    v11 = v15 != v20;
  }
  if ((v14 & 1) != 0)

  if (v11)
  {
    v12 = 0;
    LOBYTE(v10) = 0;
    if ((objc_msgSend(v18, "_accessibilityIsDescendantOfElement:", v20) & 1) == 0)
    {
      v13 = (id)objc_msgSend(v18, "_accessibilityOrderedChildrenContainer");
      v12 = 1;
      v10 = objc_msgSend(v13, "_accessibilityIsDescendantOfElement:", v16) ^ 1;
    }
    if ((v12 & 1) != 0)

    if ((v10 & 1) != 0)
    {
      -[UITableViewCellAccessibilityElement registerMockChild:](v20, "registerMockChild:", v18);
      objc_msgSend(v18, "setAccessibilityContainer:", v20);
    }
  }
  if (!v18 && (objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) != 0)
    objc_storeStrong(&v18, v20);
  v9 = v18;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  UITableViewCell *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v7 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v6 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)self);
  v5 = -[UITableViewCellAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v8 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@ - %p] %@) %@ - %@"), v3, self, v7, v6, v5);

  return v8;
}

- (uint64_t)indexPath
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (id)automationElements
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  UITableViewCell *v9;
  objc_super v10;
  int v11;
  _QWORD __b[8];
  id v13;
  id location[2];
  UITableViewCellAccessibilityElement *v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  v9 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  location[0] = (id)-[UITableViewCell automationElements](v9, "automationElements");

  if (objc_msgSend(location[0], "count"))
  {
    memset(__b, 0, sizeof(__b));
    obj = location[0];
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
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
        v13 = *(id *)(__b[1] + 8 * v5);
        objc_msgSend(v13, "setAccessibilityContainer:", v15);
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
          if (!v6)
            break;
        }
      }
    }

    v16 = location[0];
    v11 = 1;
  }
  else
  {
    v10.receiver = v15;
    v10.super_class = (Class)UITableViewCellAccessibilityElement;
    v16 = -[UITableViewCellAccessibilityElement automationElements](&v10, sel_automationElements);
    v11 = 1;
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityUserTestingIsCancelButton](v3, "_accessibilityUserTestingIsCancelButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityUserTestingIsDefaultButton](v3, "_accessibilityUserTestingIsDefaultButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityUserTestingIsDestructiveButton](v3, "_accessibilityUserTestingIsDestructiveButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityUserTestingIsPreferredButton](v3, "_accessibilityUserTestingIsPreferredButton");

  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell", a2, self);
}

- (id)_accessibilityUserTestingProxyView
{
  return -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell", a2, self);
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  id v6;
  CGRect rect2;
  CGRect v8;
  id v9;
  id v10;
  BOOL v11;
  CGRect v12;

  v10 = a1;
  if (a1)
  {
    v9 = (id)objc_msgSend(v10, "accessibilityContainer");
    v6 = (id)objc_msgSend(v9, "window");
    objc_msgSend(v6, "accessibilityFrame");
    v8 = CGRectInset(v12, 0.0, 40.0);
    objc_msgSend(v10, "accessibilityFrame");
    rect2.origin.x = v1;
    rect2.origin.y = v2;
    rect2.size.width = v3;
    rect2.size.height = v4;
    v11 = !CGRectIntersectsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v3;
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  id v54;
  id v55;
  BOOL v56;
  NSObject *v57;
  os_log_type_t v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  os_log_type_t v64;
  id v65;
  id v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  id v70;
  id v71;
  BOOL v72;
  id v73;
  BOOL IsOutsideParent;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  id v87;
  id v88;
  id v89[2];
  int v90;
  int v91;
  id (*v92)(uint64_t);
  void *v93;
  id v94;
  _QWORD v95[4];
  CGRect v96;
  CGRect v97;
  os_log_type_t v98;
  os_log_t v99;
  id v100;
  os_log_type_t v101;
  os_log_t v102;
  _OWORD v103[2];
  os_log_type_t v104;
  os_log_t v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  CGRect rect;
  CGRect v110;
  os_log_type_t v111;
  os_log_t v112;
  id v113;
  os_log_type_t v114;
  os_log_t v115;
  os_log_type_t v116;
  os_log_t v117;
  os_log_type_t v118;
  os_log_t v119;
  char v120;
  id v121;
  os_log_type_t v122;
  os_log_t v123;
  uint64_t i;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  os_log_type_t v128;
  os_log_t v129;
  CGRect v130;
  CGRect v131;
  __int128 v132;
  __int128 v133;
  double v134;
  double v135;
  double v136;
  double v137;
  __int128 v138;
  __int128 v139;
  CGRect rect2;
  CGRect rect1;
  char v142;
  uint64_t v143;
  unint64_t v144;
  id v145;
  id v146;
  id v147;
  id v148;
  os_log_type_t v149;
  os_log_t v150;
  os_log_type_t v151;
  os_log_t v152;
  os_log_type_t v153;
  os_log_t v154;
  char v155;
  char v156;
  id v157;
  int v158;
  os_log_type_t type;
  os_log_t oslog;
  id v161;
  id location[2];
  id v163;
  char v164;
  uint8_t v165[32];
  uint8_t v166[16];
  uint8_t v167[16];
  uint8_t v168[32];
  uint8_t v169[16];
  uint8_t v170[16];
  uint8_t v171[16];
  uint8_t v172[32];
  uint8_t v173[48];
  uint8_t v174[32];
  uint8_t v175[32];
  uint8_t v176[16];
  uint8_t v177[24];
  uint64_t v178;
  CGRect v179;
  CGRect v180;

  v178 = *MEMORY[0x24BDAC8D0];
  v163 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v161 = (id)objc_msgSend(v163, "accessibilityContainer");
  if ((objc_msgSend(v161, "_accessibilityRespectsTableScrollEnabledFlag") & 1) == 0
    || (objc_msgSend(v161, "safeBoolForKey:", CFSTR("isScrollEnabled")) & 1) != 0)
  {
    v3 = (id)AXRetainAutorelease();
    v157 = (id)objc_msgSend(v163, "tableViewCell");
    v85 = (id)objc_msgSend(v157, "_accessibilityIndexPath");
    v84 = (id)objc_msgSend(v163, "_accessibilityIndexPath");
    v86 = objc_msgSend(v85, "isEqual:");

    v156 = v86 & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v156 & 1) != 0
      && (objc_msgSend(v157, "_accessibilityShouldBypassScrollToVisibleWithChild") & 1) != 0)
    {
      v164 = 0;
      v158 = 1;
LABEL_83:
      objc_storeStrong(&v157, 0);
      goto LABEL_84;
    }
    v155 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v156 & 1) != 0)
    {
      v83 = (id)objc_msgSend(v157, "safeValueForKey:", CFSTR("accessibilityScrollToVisible"));
      objc_msgSend(v83, "BOOLValue");

      v155 = 1;
      v154 = (os_log_t)(id)AXLogAppAccessibility();
      v153 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v176, (uint64_t)v157);
        _os_log_impl(&dword_230C4A000, v154, v153, "Asked table view cell to handle scrolling: %@", v176, 0xCu);
      }
      objc_storeStrong((id *)&v154, 0);
    }
    v152 = (os_log_t)(id)AXLogAppAccessibility();
    v151 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
    {
      v4 = objc_opt_class();
      __os_log_helper_16_2_3_8_64_8_64_4_0((uint64_t)v175, v4, (uint64_t)v157, v156 & 1);
      _os_log_impl(&dword_230C4A000, v152, v151, "%@ tableViewCell: %@ had same index path as self: %d", v175, 0x1Cu);
    }
    objc_storeStrong((id *)&v152, 0);
    if ((v156 & 1) == 0)
    {
      v150 = (os_log_t)(id)AXLogAppAccessibility();
      v149 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
      {
        v79 = v150;
        v80 = v149;
        v82 = (id)objc_msgSend(v157, "_accessibilityIndexPath");
        v78 = v82;
        v148 = v78;
        v81 = (id)objc_msgSend(v163, "_accessibilityIndexPath");
        v147 = v81;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v174, (uint64_t)v78, (uint64_t)v147);
        _os_log_impl(&dword_230C4A000, v79, v80, "Real tv cell path: %@, our path: %@", v174, 0x16u);

        objc_storeStrong(&v147, 0);
        objc_storeStrong(&v148, 0);
      }
      objc_storeStrong((id *)&v150, 0);
    }
    if ((v155 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v164 = 0;
        v158 = 1;
        goto LABEL_83;
      }
      v146 = (id)objc_msgSend(v161, "indexPathsForVisibleRows");
      v145 = *((id *)v163 + 7);
      v144 = objc_msgSend(v146, "indexOfObject:", v145);
      v143 = -[UITableViewAccessibility _accessibilityDefaultTableViewCellScrollPosition]((uint64_t)v161);
      v142 = 0;
      if ((_UIAXObjectIsBehindKeyboard() & 1) != 0)
      {
        v143 = 1;
        v142 = 1;
      }
      objc_msgSend(v161, "accessibilityFrame");
      rect1.origin.x = v5;
      rect1.origin.y = v6;
      rect1.size.width = v7;
      rect1.size.height = v8;
      objc_msgSend(v163, "accessibilityFrame");
      rect2.origin.x = v9;
      rect2.origin.y = v10;
      rect2.size.width = v11;
      rect2.size.height = v12;
      if (!CGRectContainsRect(rect1, rect2))
        v142 = 1;
      v77 = (id)objc_msgSend(v161, "safeValueForKey:", CFSTR("visibleBounds"));
      objc_msgSend(v77, "rectValue");
      *(_QWORD *)&v138 = v13;
      *((_QWORD *)&v138 + 1) = v14;
      *(_QWORD *)&v139 = v15;
      *((_QWORD *)&v139 + 1) = v16;

      objc_msgSend(v161, "adjustedContentInset");
      v134 = v17;
      v135 = v18;
      v136 = v19;
      v137 = v20;
      *(_QWORD *)&v132 = UIEdgeInsetsInsetRect_3(*(double *)&v138, *((double *)&v138 + 1), *(double *)&v139, *((double *)&v139 + 1), v17, v18);
      *((_QWORD *)&v132 + 1) = v21;
      *(_QWORD *)&v133 = v22;
      *((_QWORD *)&v133 + 1) = v23;
      v138 = v132;
      v139 = v133;
      UIAccessibilityFrameForBounds();
      v131.origin.x = v24;
      v131.origin.y = v25;
      v131.size.width = v26;
      v131.size.height = v27;
      objc_msgSend(v163, "accessibilityFrame");
      v130.origin.x = v28;
      v130.origin.y = v29;
      v130.size.width = v30;
      v130.size.height = v31;
      if (!CGRectContainsRect(v131, v130))
      {
        v143 = 1;
        if (!UIEdgeInsetsEqualToEdgeInsets_0(v134, v135, v136, v137, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24)))v142 = 1;
      }
      if ((v142 & 1) == 0 && -[UITableViewCellAccessibilityElement _accessibilityIsOutsideParentBounds](v163))
        v142 = 1;
      v129 = (os_log_t)(id)AXLogAppAccessibility();
      v128 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
      {
        v76 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v144);
        __os_log_helper_16_2_4_4_0_4_0_8_64_8_64((uint64_t)v173, v142 & 1, v143, (uint64_t)v145, (uint64_t)v76);
        _os_log_impl(&dword_230C4A000, v129, v128, "UITableViewCEllAXElement must scroll: %d, position: %d - indexPath: %@ indexOfPath: %@", v173, 0x22u);

      }
      objc_storeStrong((id *)&v129, 0);
      v127 = objc_msgSend(v146, "count");
      if ((v142 & 1) == 0 && v127 && (v144 > 1 && v144 < v127 - 2 || v127 == 1))
      {
        v164 = 0;
        v158 = 1;
      }
      else
      {
        v126 = 0;
        v125 = objc_msgSend(v161, "numberOfSections");
        for (i = 0; i < v125; ++i)
          v126 += objc_msgSend(v161, "numberOfRowsInSection:", i);
        if (objc_msgSend(v146, "count") != v126 || (v142 & 1) != 0)
        {
          if (objc_msgSend(v145, "section") < v125
            && v125
            && (v75 = objc_msgSend(v145, "row"),
                v75 < objc_msgSend(v161, "numberOfRowsInSection:", objc_msgSend(v145, "section"))))
          {
            v143 = objc_msgSend(v161, "_accessibilityScrollPositionForCellOverride:", v143);
            v123 = (os_log_t)(id)AXLogAppAccessibility();
            v122 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_4_0_8_64((uint64_t)v172, v143, (uint64_t)v161);
              _os_log_impl(&dword_230C4A000, v123, v122, "UITableViewCEllAXElement override scrollPosition-> %d on parent: %@", v172, 0x12u);
            }
            objc_storeStrong((id *)&v123, 0);
            objc_msgSend(v161, "scrollToRowAtIndexPath:atScrollPosition:animated:", v145, v143, 0);
            objc_msgSend(v161, "_accessibilityOpaqueElementScrollCleanup");
            v73 = (id)objc_msgSend(v161, "indexPathsForVisibleRows");
            v120 = 0;
            IsOutsideParent = 1;
            if ((objc_msgSend(v73, "containsObject:", v145) & 1) != 0)
            {
              v121 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
              v120 = 1;
              IsOutsideParent = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v121);
            }
            if ((v120 & 1) != 0)

            if (IsOutsideParent)
            {
              v119 = (os_log_t)(id)AXLogAppAccessibility();
              v118 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v171, (uint64_t)v145);
                _os_log_impl(&dword_230C4A000, v119, v118, "UITableViewCEllAXElement index path still not visible -> %@", v171, 0xCu);
              }
              objc_storeStrong((id *)&v119, 0);
              objc_msgSend(v161, "scrollToRowAtIndexPath:atScrollPosition:animated:", v145, 2, 0);
              objc_msgSend(v161, "_accessibilityOpaqueElementScrollCleanup");
              v117 = (os_log_t)(id)AXLogAppAccessibility();
              v116 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v170, (uint64_t)v145);
                _os_log_impl(&dword_230C4A000, v117, v116, "UITableViewCEllAXElement scroll to middle position for %@", v170, 0xCu);
              }
              objc_storeStrong((id *)&v117, 0);
            }
            v71 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
            v72 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v71);

            if (v72)
            {
              v115 = (os_log_t)(id)AXLogAppAccessibility();
              v114 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                v68 = v115;
                v69 = v114;
                v70 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
                v113 = v70;
                __os_log_helper_16_2_1_8_64((uint64_t)v169, (uint64_t)v113);
                _os_log_impl(&dword_230C4A000, v68, v69, "UITableViewCEllAXElement after scrolling still outside parent bounds %@", v169, 0xCu);

                objc_storeStrong(&v113, 0);
              }
              objc_storeStrong((id *)&v115, 0);
              v112 = (os_log_t)(id)AXLogAppAccessibility();
              v111 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
              {
                v63 = v112;
                v64 = v111;
                v61 = (void *)MEMORY[0x24BDD1968];
                v67 = (id)objc_msgSend(v161, "window");
                objc_msgSend(v67, "accessibilityFrame");
                rect = v179;
                v110 = CGRectInset(v179, 0.0, 40.0);
                v66 = (id)objc_msgSend(v61, "valueWithBytes:objCType:", &v110);
                v62 = (void *)MEMORY[0x24BDD1968];
                objc_msgSend(v163, "accessibilityFrame");
                v108[0] = v32;
                v108[1] = v33;
                v108[2] = v34;
                v108[3] = v35;
                v65 = (id)objc_msgSend(v62, "valueWithBytes:objCType:", v108, "{CGRect={CGPoint=dd}{CGSize=dd}}");
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v168, (uint64_t)v66, (uint64_t)v65);
                _os_log_impl(&dword_230C4A000, v63, v64, "Outside bounds: window frame %@, self frame %@", v168, 0x16u);

              }
              objc_storeStrong((id *)&v112, 0);
              v60 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
              objc_msgSend(v60, "frame");
              *(_QWORD *)&v106 = v36;
              *((_QWORD *)&v106 + 1) = v37;
              *(_QWORD *)&v107 = v38;
              *((_QWORD *)&v107 + 1) = v39;

              objc_msgSend(v161, "scrollRectToVisible:animated:", 0, v106, v107);
              v105 = (os_log_t)(id)AXLogAppAccessibility();
              v104 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
              {
                v57 = v105;
                v58 = v104;
                v103[0] = v106;
                v103[1] = v107;
                v59 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v103, "{CGRect={CGPoint=dd}{CGSize=dd}}");
                __os_log_helper_16_2_1_8_64((uint64_t)v167, (uint64_t)v59);
                _os_log_impl(&dword_230C4A000, v57, v58, "Scroll rect to visible with frame %@", v167, 0xCu);

              }
              objc_storeStrong((id *)&v105, 0);
              objc_msgSend(v161, "_accessibilityOpaqueElementScrollCleanup");
            }
            v55 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
            v56 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v55);

            if (v56)
            {
              v102 = (os_log_t)(id)AXLogAppAccessibility();
              v101 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              {
                v52 = v102;
                v53 = v101;
                v54 = (id)objc_msgSend(v161, "cellForRowAtIndexPath:", v145);
                v100 = v54;
                __os_log_helper_16_2_1_8_64((uint64_t)v166, (uint64_t)v100);
                _os_log_impl(&dword_230C4A000, v52, v53, "After scrollRectToVisible! UITableViewCEllAXElement after scrolling still outside parent bounds %@", v166, 0xCu);

                objc_storeStrong(&v100, 0);
              }
              objc_storeStrong((id *)&v102, 0);
              v99 = (os_log_t)(id)AXLogAppAccessibility();
              v98 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
              {
                v47 = v99;
                v48 = v98;
                v45 = (void *)MEMORY[0x24BDD1968];
                v51 = (id)objc_msgSend(v161, "window");
                objc_msgSend(v51, "accessibilityFrame");
                v96 = v180;
                v97 = CGRectInset(v180, 0.0, 40.0);
                v50 = (id)objc_msgSend(v45, "valueWithBytes:objCType:", &v97);
                v46 = (void *)MEMORY[0x24BDD1968];
                objc_msgSend(v163, "accessibilityFrame");
                v95[0] = v40;
                v95[1] = v41;
                v95[2] = v42;
                v95[3] = v43;
                v49 = (id)objc_msgSend(v46, "valueWithBytes:objCType:", v95, "{CGRect={CGPoint=dd}{CGSize=dd}}");
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v165, (uint64_t)v50, (uint64_t)v49);
                _os_log_impl(&dword_230C4A000, v47, v48, "Still! Outside bounds: window frame %@, self frame %@", v165, 0x16u);

              }
              objc_storeStrong((id *)&v99, 0);
              v164 = 0;
              v158 = 1;
            }
            else
            {
              v89[1] = (id)MEMORY[0x24BDAC760];
              v90 = -1073741824;
              v91 = 0;
              v92 = __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke;
              v93 = &unk_24FF3DA40;
              v94 = v163;
              AXPerformBlockOnMainThreadAfterDelay();
              if (!location[0])
                objc_storeStrong(location, v157);
              v87 = v163;
              v88 = location[0];
              v89[0] = v161;
              AXPerformBlockOnMainThreadAfterDelay();
              v155 = 1;
              objc_storeStrong(v89, 0);
              objc_storeStrong(&v88, 0);
              objc_storeStrong(&v87, 0);
              objc_storeStrong(&v94, 0);
              v158 = 0;
            }
          }
          else
          {
            v164 = 0;
            v158 = 1;
          }
        }
        else
        {
          v164 = 0;
          v158 = 1;
        }
      }
      objc_storeStrong(&v145, 0);
      objc_storeStrong(&v146, 0);
      if (v158)
        goto LABEL_83;
    }
    v164 = v155 & 1;
    v158 = 1;
    goto LABEL_83;
  }
  oslog = (os_log_t)(id)AXLogAppAccessibility();
  type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v177, (uint64_t)v161);
    _os_log_impl(&dword_230C4A000, oslog, type, "Scrolling disabled for parent: %@", v177, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v164 = 0;
  v158 = 1;
LABEL_84:
  objc_storeStrong(&v161, 0);
  objc_storeStrong(location, 0);
  return v164 & 1;
}

id __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("tableViewCell"), a1, a1);
}

id __77__UITableViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke_2(uint64_t a1)
{
  id v1;
  id v4;
  id v5;
  char v6;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityWindow");
  v4 = (id)objc_msgSend(v5, "firstResponder");
  v6 = objc_msgSend(v4, "_accessibilityIsDescendantOfElement:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) == 0)
    _UIAXDismissKeyboardIfNecessary();
  v1 = (id)objc_opt_self();
  return (id)objc_opt_self();
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  UITableViewCell *v3;
  id location[2];
  UITableViewCellAccessibilityElement *v5;
  _NSRange v6;

  v6 = a3;
  v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibilityElement _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if (location[0])
  {
    objc_msgSend(location[0], "_accessibilitySetSelectedTextRange:", v6.location, v6.length);
  }
  else
  {
    v3 = -[UITableViewCellAccessibilityElement tableViewCell](v5, "tableViewCell");
    -[UITableViewCell _accessibilitySetSelectedTextRange:](v3, "_accessibilitySetSelectedTextRange:", v6.location, v6.length);

  }
  objc_storeStrong(location, 0);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  UITableViewCell *v6;
  id location[2];
  UITableViewCellAccessibilityElement *v8;
  uint64_t v9;
  NSUInteger v10;
  _NSRange result;

  v8 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibilityElement _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  if (location[0])
  {
    v9 = objc_msgSend(location[0], "_accessibilitySelectedTextRange");
    v10 = v2;
  }
  else
  {
    v6 = -[UITableViewCellAccessibilityElement tableViewCell](v8, "tableViewCell");
    v9 = -[UITableViewCell _accessibilitySelectedTextRange](v6, "_accessibilitySelectedTextRange");
    v10 = v3;

  }
  objc_storeStrong(location, 0);
  v4 = v9;
  v5 = v10;
  result.length = v5;
  result.location = v4;
  return result;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityCanBecomeNativeFocused](v3, "_accessibilityCanBecomeNativeFocused");

  return v4 & 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityTextViewTextOperationResponder](v3, "_accessibilityTextViewTextOperationResponder");

  return v4;
}

- (id)_accessibilityTextOperations
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityTextOperations](v3, "_accessibilityTextOperations");

  return v4;
}

- (void)_accessibilityCopy
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityCopy](v2, "_accessibilityCopy");

}

- (void)_accessibilityCut
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityCut](v2, "_accessibilityCut");

}

- (void)accessibilityElementDidBecomeFocused
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell accessibilityElementDidBecomeFocused](v2, "accessibilityElementDidBecomeFocused");

}

- (void)accessibilityElementDidLoseFocus
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell accessibilityElementDidLoseFocus](v2, "accessibilityElementDidLoseFocus");

}

- (void)_accessibilitySelect
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilitySelect](v2, "_accessibilitySelect");

}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  objc_class *v2;
  objc_class *v3;
  UITableViewCell *v5;
  Method InstanceMethod;
  BOOL v7;

  if (!_accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0 = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  v5 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityPerformEscape);

  v7 = 0;
  if (InstanceMethod)
    return InstanceMethod != (Method)_accessibilityCanPerformEscapeAction_BaseNSObjectMethod_0;
  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell accessibilityPerformEscape](v3, "accessibilityPerformEscape");

  return v4 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell accessibilityPerformMagicTap](v3, "accessibilityPerformMagicTap");

  return v4 & 1;
}

- (void)_accessibilityPaste
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityPaste](v2, "_accessibilityPaste");

}

- (void)_accessibilitySelectAll
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilitySelectAll](v2, "_accessibilitySelectAll");

}

- (void)_accessibilityUndo
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityUndo](v2, "_accessibilityUndo");

}

- (void)_accessibilityRedo
{
  UITableViewCell *v2;

  v2 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  -[UITableViewCell _accessibilityRedo](v2, "_accessibilityRedo");

}

- (BOOL)_accessibilityHasTextOperations
{
  id v2;
  UITableViewCell *v4;
  UITableViewCell *v5;
  BOOL v6;
  BOOL v8;

  v5 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v2 = (id)-[UITableViewCell _accessibilityIndexPath](v5, "_accessibilityIndexPath");
  v6 = v2 == 0;

  if (v6)
    return 0;
  v4 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v8 = -[UITableViewCell _accessibilityHasTextOperations](v4, "_accessibilityHasTextOperations") & 1;

  return v8;
}

- (id)_accessibilityAbsoluteValue
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityAbsoluteValue](v3, "_accessibilityAbsoluteValue");

  return v4;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  char isKindOfClass;
  UITableViewCell *v4;
  uint64_t v5;
  char v6;
  id v7;

  v4 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v5 = -[UITableViewCell accessibilityTraits](v4, "accessibilityTraits");

  if ((v5 & (*MEMORY[0x24BDF73E8] | *MEMORY[0x24BDFEFC0])) != 0)
    return 0;
  if (-[UITableViewCellAccessibilityElement isAccessibilityElement](self, "isAccessibilityElement"))
    return 1;
  v6 = 0;
  isKindOfClass = 0;
  if (-[NSMutableArray count](self->_mockChildren, "count") == 1)
  {
    v7 = (id)-[NSMutableArray lastObject](self->_mockChildren, "lastObject");
    v6 = 1;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((v6 & 1) != 0)

  return (isKindOfClass & 1) != 0;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  UITableViewCell *v3;
  int64_t v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityScannerActivateBehavior](v3, "_accessibilityScannerActivateBehavior");

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityIsSpeakThisElement](v3, "_accessibilityIsSpeakThisElement");

  return v4 & 1;
}

- (id)_accessibilityTableViewCellContentSubviews
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityTableViewCellContentSubviews](v3, "_accessibilityTableViewCellContentSubviews");

  return v4;
}

- (id)_accessibilitySpeakThisString
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilitySpeakThisString](v3, "_accessibilitySpeakThisString");

  return v4;
}

- (id)_accessibilitySemanticContextForElement:(id)a3
{
  UITableViewCell *v4;
  id v5;
  id location[2];
  UITableViewCellAccessibilityElement *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibilityElement tableViewCell](v7, "tableViewCell");
  v5 = (id)-[UITableViewCell _accessibilitySemanticContextForElement:](v4, "_accessibilitySemanticContextForElement:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = -[UITableViewCell _accessibilitySetNativeFocus](v3, "_accessibilitySetNativeFocus");

  return v4 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = -[UITableViewCell _accessibilityViewHierarchyHasNativeFocus](v3, "_accessibilityViewHierarchyHasNativeFocus");

  return v4 & 1;
}

- (BOOL)_accessibilityHasNativeFocus
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = -[UITableViewCell _accessibilityHasNativeFocus](v3, "_accessibilityHasNativeFocus");

  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = -[UITableViewCell _accessibilityShouldIncludeRowRangeInElementDescription](v3, "_accessibilityShouldIncludeRowRangeInElementDescription");

  return v4 & 1;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 8;
}

- (id)accessibilityUserInputLabels
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = (id)-[UITableViewCell accessibilityUserInputLabels](v3, "accessibilityUserInputLabels");

  return v4;
}

- (id)accessibilityCustomActions
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = (id)-[UITableViewCell accessibilityCustomActions](v3, "accessibilityCustomActions");

  return v4;
}

- (id)_privateAccessibilityCustomActions
{
  UITableViewCell *v2;
  id v3;
  void *v4;
  id v6;
  UITableViewCell *v7;
  _BYTE v8[12];
  SEL v9;
  UITableViewCellAccessibilityElement *v10;

  v10 = self;
  v9 = a2;
  *(_DWORD *)&v8[8] = 0;
  v2 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  *(_QWORD *)v8 = v2 == 0;

  if ((v8[0] & 1) == 0)
  {
    v7 = -[UITableViewCellAccessibilityElement realTableViewCell](v10, "realTableViewCell");
    v3 = (id)-[UITableViewCell _privateAccessibilityCustomActions](v7, "_privateAccessibilityCustomActions");
    v4 = *(void **)&v8[4];
    *(_QWORD *)&v8[4] = v3;

  }
  v6 = *(id *)&v8[4];
  objc_storeStrong((id *)&v8[4], 0);
  return v6;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  UITableViewCell *v3;
  char v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = -[UITableViewCell _accessibilityRetainsCustomRotorActionSetting](v3, "_accessibilityRetainsCustomRotorActionSetting");

  return v4 & 1;
}

- (id)accessibilityDragSourceDescriptors
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = (id)-[UITableViewCell accessibilityDragSourceDescriptors](v3, "accessibilityDragSourceDescriptors");

  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement realTableViewCell](self, "realTableViewCell");
  v4 = (id)-[UITableViewCell accessibilityDropPointDescriptors](v3, "accessibilityDropPointDescriptors");

  return v4;
}

- (id)_accessibilityCapturedImages
{
  UITableViewCell *v3;
  id v4;

  v3 = -[UITableViewCellAccessibilityElement tableViewCell](self, "tableViewCell");
  v4 = (id)-[UITableViewCell _accessibilityCapturedImages](v3, "_accessibilityCapturedImages");

  return v4;
}

- (void)setIndexPath:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setTableViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCell, a3);
}

- (uint64_t)usingRealTableViewCell
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 80) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockChildren, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end
