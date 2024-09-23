@implementation UITableViewSectionElement

- (UITableViewSectionElement)initWithAccessibilityContainer:(id)a3
{
  UITableViewSectionElement *v3;
  UITableViewSectionElement *v5;
  id v6;
  objc_super v7;
  id location[2];
  UITableViewSectionElement *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)UITableViewSectionElement;
  v9 = -[UITableViewSectionElement initWithAccessibilityContainer:](&v7, sel_initWithAccessibilityContainer_, location[0]);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v9, sel__acccessibilityClearChildCache, *MEMORY[0x24BED1FF0], 0);

  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (id)_accessibilityAccessibleElementsInView:(void *)a1
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id location;
  id v10;
  id v11;

  v10 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v10)
  {
    if (location)
    {
      v7 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", location);
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      while (objc_msgSend(v7, "count"))
      {
        v5 = (id)objc_msgSend(v7, "lastObject");
        objc_msgSend(v7, "removeLastObject");
        if ((objc_msgSend(v5, "isAccessibilityElement") & 1) != 0
          || (objc_msgSend(v5, "_accessibilityHasOrderedChildren") & 1) != 0)
        {
          objc_msgSend(v6, "addObject:", v5);
        }
        else
        {
          v3 = v7;
          v4 = (id)objc_msgSend(v5, "subviews");
          objc_msgSend(v3, "addObjectsFromArray:");

        }
        objc_storeStrong(&v5, 0);
      }
      objc_msgSend(v10, "_accessibilitySortElementsUsingGeometry:", v6);
      v11 = v6;
      v8 = 1;
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
    }
    else
    {
      v11 = 0;
      v8 = 1;
    }
  }
  else
  {
    v11 = 0;
    v8 = 1;
  }
  objc_storeStrong(&location, 0);
  return v11;
}

- (void)_acccessibilityClearChildCache
{
  -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)self);
  objc_storeStrong((id *)&self->_children, 0);
}

- (void)_accessibilityClearChildren
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id obj;
  uint64_t v6;
  id *v7;
  _QWORD __b[8];
  id v9;
  uint64_t v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    obj = *(id *)(v10 + 72);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v11, 16);
    if (v6)
    {
      v2 = *(_QWORD *)__b[2];
      v3 = 0;
      v4 = v6;
      while (1)
      {
        v1 = v3;
        if (*(_QWORD *)__b[2] != v2)
          objc_enumerationMutation(obj);
        v9 = *(id *)(__b[1] + 8 * v3);
        objc_msgSend(v9, "setAccessibilityContainer:", 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = (id *)v9;
          -[UIAccessibilityElementMockView setDelegate:](v7, 0);
          -[UIAccessibilityElementMockView setView:](v7, 0);
          objc_storeStrong((id *)&v7, 0);
        }
        ++v3;
        if (v1 + 1 >= v4)
        {
          v3 = 0;
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v11, 16);
          if (!v4)
            break;
        }
      }
    }

  }
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  UITableViewSectionElement *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v5, *MEMORY[0x24BED1FF0], 0);

  -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v5);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewSectionElement;
  -[UITableViewSectionElement dealloc](&v3, sel_dealloc);
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableViewSectionElement *v10;
  id v11[3];
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int v21;
  void *v22;
  id v23[2];
  UITableViewSectionElement *v24;
  __int128 v25;
  __int128 v26;
  CGRect result;

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)-[UITableViewSectionElement accessibilityContainer](self, "accessibilityContainer");
  v22 = (void *)-[UITableViewSectionElement section]((uint64_t)v24);
  if ((uint64_t)v22 < objc_msgSend(v23[0], "numberOfSections"))
  {
    v19 = 0u;
    v20 = 0u;
    v12 = 0;
    v13 = &v12;
    v14 = 0x10000000;
    v15 = 64;
    v16 = &unk_230DEFD8E;
    v17 = 0u;
    v18 = 0u;
    v11[1] = &v12;
    v10 = v24;
    v11[0] = v23[0];
    v11[2] = v22;
    AXPerformSafeBlock();
    v19 = *((_OWORD *)v13 + 2);
    v20 = *((_OWORD *)v13 + 3);
    objc_storeStrong(v11, 0);
    objc_storeStrong((id *)&v10, 0);
    _Block_object_dispose(&v12, 8);
    UIAccessibilityFrameForBounds();
    *(_QWORD *)&v25 = v2;
    *((_QWORD *)&v25 + 1) = v3;
    *(_QWORD *)&v26 = v4;
    *((_QWORD *)&v26 + 1) = v5;
  }
  else
  {
    v25 = *MEMORY[0x24BDBF090];
    v26 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  }
  v21 = 1;
  objc_storeStrong(v23, 0);
  v7 = *((double *)&v25 + 1);
  v6 = *(double *)&v25;
  v9 = *((double *)&v26 + 1);
  v8 = *(double *)&v26;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)section
{
  if (a1)
    return *(_QWORD *)(a1 + 64);
  else
    return 0;
}

__n128 __47__UITableViewSectionElement_accessibilityFrame__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_floatingRectForHeaderInSection:heightCanBeGuessed:", *(_QWORD *)(a1 + 56), 0);
  else
    objc_msgSend(*(id *)(a1 + 40), "_floatingRectForFooterInSection:heightCanBeGuessed:", *(_QWORD *)(a1 + 56), 0);
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)_textChildWithTitle:(id)a3
{
  UITableSectionPart *v3;
  id *v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  UITableSectionPart *v11;
  id location[2];
  UITableViewSectionElement *v13;
  UITableSectionPart *v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = location[0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (id)objc_msgSend(v6, "stringByTrimmingCharactersInSet:");
  v9 = objc_msgSend(v7, "length") == 0;

  if (v9)
  {
    v14 = 0;
  }
  else
  {
    v3 = [UITableSectionPart alloc];
    v11 = -[UITableSectionPart initWithAccessibilityContainer:](v3, "initWithAccessibilityContainer:", v13);
    -[UITableSectionPart setAccessibilityLabel:](v11, "setAccessibilityLabel:", location[0]);
    v10 = *MEMORY[0x24BDF7410];
    if (v13->_isHeader)
      v10 |= *MEMORY[0x24BDF73C0];
    -[UITableSectionPart setAccessibilityTraits:](v11, "setAccessibilityTraits:", v10, &v11);
    v14 = v11;
    objc_storeStrong(v5, 0);
  }
  objc_storeStrong(location, 0);
  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityChildren
{
  char v1;
  char v2;
  char v3;
  char v4;
  UIAccessibilityElementMockView *v5;
  uint64_t v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id *v25;
  id v26;
  char v27;
  char v28;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id *v39;
  _QWORD __b[8];
  void *v41;
  id v42;
  id v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  char v51;
  id v52;
  id location;
  char v54;
  id v55;
  char v56;
  char v57;
  id v58;
  char v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  int v64;
  id v65;
  id *v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v66 = a1;
  if (a1)
  {
    v65 = (id)objc_msgSend(v66, "accessibilityContainer");
    if (v66[9])
    {
      v29 = -[UITableViewSectionElement section]((uint64_t)v66);
      if (v29 < objc_msgSend(v65, "numberOfSections"))
      {
        v67 = v66[9];
      }
      else
      {
        -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v66);
        objc_storeStrong(v66 + 9, 0);
        v67 = 0;
      }
      v64 = 1;
      goto LABEL_85;
    }
    v63 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    v62 = -[UITableViewSectionElement section]((uint64_t)v66);
    v61 = (id)objc_msgSend(v65, "delegate");
    v60 = (id)objc_msgSend(v65, "dataSource");
    v59 = 0;
    v1 = *((_BYTE *)v66 + 56);
    v57 = 0;
    v28 = 0;
    if ((v1 & 1) != 0)
    {
      v58 = (id)objc_msgSend(v65, "safeValueForKey:", CFSTR("_delegateImplementsViewForHeaderInSection"));
      v57 = 1;
      v28 = objc_msgSend(v58, "BOOLValue");
    }
    if ((v57 & 1) != 0)

    v59 = v28 & 1;
    v56 = 0;
    v2 = *((_BYTE *)v66 + 56);
    v54 = 0;
    v27 = 0;
    if ((v2 & 1) == 0)
    {
      v55 = (id)objc_msgSend(v65, "safeValueForKey:", CFSTR("_delegateImplementsViewForFooterInSection"));
      v54 = 1;
      v27 = objc_msgSend(v55, "BOOLValue");
    }
    if ((v54 & 1) != 0)

    v56 = v27 & 1;
    location = 0;
    if ((v59 & 1) != 0 || (v56 & 1) != 0)
    {
      v3 = *((_BYTE *)v66 + 56);
      v51 = 0;
      v49 = 0;
      if ((v3 & 1) != 0)
      {
        v52 = (id)objc_msgSend(v65, "_visibleHeaderViewForSection:", v62);
        v51 = 1;
        objc_storeStrong(&location, v52);
      }
      else
      {
        v50 = (id)objc_msgSend(v65, "_visibleFooterViewForSection:", v62);
        v49 = 1;
        objc_storeStrong(&location, v50);
      }
      if ((v49 & 1) != 0)

      if ((v51 & 1) != 0)
      if (!location)
      {
        v4 = *((_BYTE *)v66 + 56);
        v47 = 0;
        v45 = 0;
        if ((v4 & 1) != 0)
        {
          v48 = (id)objc_msgSend(v61, "tableView:viewForHeaderInSection:", v65, v62);
          v47 = 1;
          objc_storeStrong(&location, v48);
        }
        else
        {
          v46 = (id)objc_msgSend(v61, "tableView:viewForFooterInSection:", v65, v62);
          v45 = 1;
          objc_storeStrong(&location, v46);
        }
        if ((v45 & 1) != 0)

        if ((v47 & 1) != 0)
      }
      if (location && (objc_msgSend(location, "accessibilityElementsHidden") & 1) != 0)
      {
        v67 = 0;
        v64 = 1;
LABEL_84:
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v60, 0);
        objc_storeStrong(&v61, 0);
        objc_storeStrong(&v63, 0);
LABEL_85:
        objc_storeStrong(&v65, 0);
        return v67;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v66;
        v26 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
        v44 = (id)objc_msgSend(v25, "_textChildWithTitle:");

        if (v44)
        {
          objc_msgSend(v63, "addObject:", v44);
          v24 = (id)objc_msgSend(location, "accessibilityLanguage");
          objc_msgSend(v44, "setAccessibilityLanguage:");

        }
        objc_storeStrong(&v44, 0);
      }
      else if (location)
      {
        v43 = -[UITableViewSectionElement _accessibilityAccessibleElementsInView:](v66, location);
        v42 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        memset(__b, 0, sizeof(__b));
        v22 = v43;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
        if (v23)
        {
          v19 = *(_QWORD *)__b[2];
          v20 = 0;
          v21 = v23;
          while (1)
          {
            v18 = v20;
            if (*(_QWORD *)__b[2] != v19)
              objc_enumerationMutation(v22);
            v41 = *(void **)(__b[1] + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              if ((objc_msgSend(v42, "containsObject:", v41) & 1) == 0)
              {
                v5 = [UIAccessibilityElementMockView alloc];
                v39 = -[UIAccessibilityElementMockView initWithAccessibilityContainer:](v5, "initWithAccessibilityContainer:", v66);
                -[UIAccessibilityElementMockView setDelegate:](v39, v66);
                -[UIAccessibilityElementMockView setView:](v39, v41);
                v38 = objc_msgSend(v41, "_accessibilityNativeTraits");
                if (objc_msgSend(v43, "count") == 1 && (v38 & (*MEMORY[0x24BDFF000] | *MEMORY[0x24BDF73B0])) == 0)
                {
                  if (((_BYTE)v66[7] & 1) != 0)
                    v17 = *MEMORY[0x24BDF73C0];
                  else
                    v17 = *MEMORY[0x24BDFEEA8];
                  v6 = objc_msgSend(v41, "accessibilityTraits");
                  objc_msgSend(v41, "setAccessibilityTraits:", v17 | v6);
                }
                objc_msgSend(v63, "addObject:", v39);
                objc_storeStrong((id *)&v39, 0);
              }
            }
            else
            {
              objc_msgSend(v41, "setAccessibilityContainer:", v66);
              objc_msgSend(v63, "addObject:", v41);
            }
            ++v20;
            if (v18 + 1 >= v21)
            {
              v20 = 0;
              v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", __b, v68, 16);
              if (!v21)
                break;
            }
          }
        }

        if (!objc_msgSend(v63, "count"))
        {
          v37 = -[UIViewAccessibility _accessibilityRetrieveIvarText](location);
          if (objc_msgSend(v37, "length"))
          {
            v15 = v63;
            v16 = (id)objc_msgSend(v66, "_textChildWithTitle:", v37);
            objc_msgSend(v15, "addObject:");

          }
          else
          {
            v36 = 0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v7 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("text"));
              v8 = v36;
              v36 = v7;

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v36, "length"))
                {
                  v13 = v63;
                  v14 = (id)objc_msgSend(v66, "_textChildWithTitle:", v36);
                  objc_msgSend(v13, "axSafelyAddObject:");

                }
              }
            }
            objc_storeStrong(&v36, 0);
          }
          objc_storeStrong(&v37, 0);
        }
        objc_storeStrong(&v42, 0);
        objc_storeStrong(&v43, 0);
      }
    }
    if (!objc_msgSend(v63, "count")
      && (((_BYTE)v66[7] & 1) != 0 && (objc_msgSend(v65, "_delegateWantsHeaderTitleForSection:", v62) & 1) != 0
       || ((_BYTE)v66[7] & 1) == 0 && (objc_msgSend(v65, "_delegateWantsFooterTitleForSection:", v62) & 1) != 0))
    {
      v9 = *((_BYTE *)v66 + 56);
      v33 = 0;
      v31 = 0;
      if ((v9 & 1) != 0)
      {
        v34 = (id)objc_msgSend(v60, "tableView:titleForHeaderInSection:", v65, v62);
        v33 = 1;
        v10 = v34;
      }
      else
      {
        v32 = (id)objc_msgSend(v60, "tableView:titleForFooterInSection:", v65, v62);
        v31 = 1;
        v10 = v32;
      }
      v35 = v10;
      if ((v31 & 1) != 0)

      if ((v33 & 1) != 0)
      v30 = (id)objc_msgSend(v66, "_textChildWithTitle:", v35);
      if (v30)
      {
        objc_msgSend(v63, "addObject:", v30);
        v12 = (id)objc_msgSend(v35, "accessibilityLanguage");
        objc_msgSend(v30, "setAccessibilityLanguage:");

      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v35, 0);
    }
    objc_storeStrong(v66 + 9, v63);
    v67 = v66[9];
    v64 = 1;
    goto LABEL_84;
  }
  v67 = 0;
  return v67;
}

- (void)updateMockView:(id)a3
{
  id v3;
  BOOL isHeader;
  id v5;
  id v6;
  id v7;
  id v8;
  UIAccessibilityElementMockView *v9;
  UIAccessibilityElementMockView *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char isKindOfClass;
  char v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id location[2];
  UITableViewSectionElement *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)AXRetainAutorelease();
  v29 = (id)-[UITableViewSectionElement accessibilityContainer](v31, "accessibilityContainer");
  v28 = -[UITableViewSectionElement section]((uint64_t)v31);
  isHeader = v31->_isHeader;
  v25 = 0;
  v23 = 0;
  if (isHeader)
  {
    v26 = (id)objc_msgSend(v29, "_visibleHeaderViewForSection:", v28);
    v25 = 1;
    v5 = v26;
  }
  else
  {
    v24 = (id)objc_msgSend(v29, "_visibleFooterViewForSection:", v28);
    v23 = 1;
    v5 = v24;
  }
  v27 = v5;
  if ((v23 & 1) != 0)

  if ((v25 & 1) != 0)
  if (v27)
  {
    v22 = -[UITableViewSectionElement _accessibilityAccessibleElementsInView:](v31, v27);
    v21 = 0;
    v20 = objc_msgSend(v22, "count");
    v19 = 0;
    v19 = v20 == -[NSMutableArray count](v31->_children, "count");
    if (!v19)
    {
      -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v31);
      -[NSMutableArray removeAllObjects](v31->_children, "removeAllObjects");
      objc_storeStrong((id *)&v31->_children, 0);
      v6 = -[UITableViewSectionElement accessibilityChildren]((id *)&v31->super.super.super.isa);
    }
    while (v21 < v20)
    {
      v18 = 0;
      if (v19)
      {
        v7 = (id)-[NSMutableArray objectAtIndex:](v31->_children, "objectAtIndex:", v21);
        v8 = v18;
        v18 = v7;

      }
      else
      {
        v9 = [UIAccessibilityElementMockView alloc];
        v10 = -[UIAccessibilityElementMockView initWithAccessibilityContainer:](v9, "initWithAccessibilityContainer:", v31);
        v11 = v18;
        v18 = v10;

        -[UIAccessibilityElementMockView setDelegate:]((id *)v18, v31);
        -[NSMutableArray addObject:](v31->_children, "addObject:", v18);
      }
      v14 = (id)objc_msgSend(v22, "objectAtIndex:", v21);
      -[UIAccessibilityElementMockView setView:]((id *)v18, v14);

      v16 = 0;
      isKindOfClass = 0;
      if (v20 == 1)
      {
        v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v18);
        v16 = 1;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
      if ((v16 & 1) != 0)

      if ((isKindOfClass & 1) != 0)
      {
        v12 = *MEMORY[0x24BDF73C0];
        v13 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v18);
        objc_msgSend(v13, "setAccessibilityTraits:", v12);

      }
      objc_storeStrong(&v18, 0);
      ++v21;
    }
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t section;
  id v10[5];
  uint64_t v11;
  id v12;
  id v13;
  id location[2];
  UITableViewSectionElement *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)-[UITableViewSectionElement accessibilityContainer](v15, "accessibilityContainer");
  v12 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v15->_section);
  v11 = 0;
  v11 = objc_msgSend(v13, "numberOfRowsInSection:", v15->_section);
  if ((-[UITableViewSectionElement isHeader]((uint64_t)v15) & 1) == 0 && v11)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11 - 1, v15->_section);
    v4 = v12;
    v12 = v3;

  }
  if (v11 > 0
    && v12
    && (section = v15->_section, section < objc_msgSend(v13, "numberOfSections"))
    && objc_msgSend(v12, "row") < v11)
  {
    objc_msgSend(v13, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);
  }
  else
  {
    -[UITableViewSectionElement accessibilityFrame](v15, "accessibilityFrame");
    v10[1] = v5;
    v10[2] = v6;
    v10[3] = v7;
    v10[4] = v8;
    objc_msgSend(v13, "_accessibilityScrollToFrame:forView:", 0, *(double *)&v5, *(double *)&v6, *(double *)&v7, *(double *)&v8);
  }
  v10[0] = location[0];
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)isHeader
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 56) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

uint64_t __67__UITableViewSectionElement_accessibilityScrollToVisibleWithChild___block_invoke()
{
  return _UIAXDismissKeyboardIfNecessary();
}

- (BOOL)accessibilityScrollToVisible
{
  -[UITableViewSectionElement accessibilityScrollToVisibleWithChild:](self, "accessibilityScrollToVisibleWithChild:", self, a2, self);
  return 1;
}

- (id)accessibilityElements
{
  return -[UITableViewSectionElement accessibilityChildren]((id *)&self->super.super.super.isa);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  char isKindOfClass;
  CGFloat v11;
  CGFloat v12;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id obj;
  uint64_t v28;
  __int128 rect_16;
  char v30;
  id v31;
  id v32;
  CGPoint v33;
  char v34;
  id v35;
  CGPoint v36;
  char v37;
  CGPoint v38;
  _QWORD __b[8];
  id v40;
  __int128 v41;
  id v42;
  CGPoint v43;
  id v44;
  id location[2];
  UITableViewSectionElement *v46;
  CGPoint v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;

  v49 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v25 = -[UITableViewSectionElement accessibilityChildren]((id *)&v46->super.super.super.isa);
  v44 = (id)objc_msgSend(v25, "copy");

  v26 = (id)-[UITableViewSectionElement _accessibilityParentView](v46, "_accessibilityParentView");
  UIAccessibilityPointForPoint();
  v43.x = v4;
  v43.y = v5;

  v42 = 0;
  CGSizeMake_3();
  *(_QWORD *)&v41 = v6;
  *((_QWORD *)&v41 + 1) = v7;
  memset(__b, 0, sizeof(__b));
  obj = v44;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v48, 16);
  if (v28)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v28;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(obj);
      v40 = *(id *)(__b[1] + 8 * v23);
      v38 = v47;
      v37 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (id)-[UITableViewSectionElement accessibilityContainer](v46, "accessibilityContainer");
        objc_msgSend(v20, "convertPoint:toView:", v40, v38);
        v36.x = v8;
        v36.y = v9;
        v38 = v36;

      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v34 = 0;
        v19 = 0;
        if ((isKindOfClass & 1) != 0)
        {
          v35 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          v34 = 1;
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();
        }
        if ((v34 & 1) != 0)

        if ((v19 & 1) != 0)
        {
          v18 = (id)-[UITableViewSectionElement accessibilityContainer](v46, "accessibilityContainer");
          v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          objc_msgSend(v18, "convertPoint:toView:", v38);
          v33.x = v11;
          v33.y = v12;
          v38 = v33;

          v37 = 1;
        }
      }
      v32 = (id)objc_msgSend(v40, "_accessibilityHitTest:withEvent:", location[0], v38);
      if (v32)
      {
        v30 = 0;
        v16 = 0;
        if ((v37 & 1) != 0)
        {
          v15 = v32;
          v31 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          v30 = 1;
          v16 = objc_msgSend(v15, "isEqual:");
        }
        if ((v30 & 1) != 0)

        if ((v16 & 1) != 0)
          objc_storeStrong(&v32, v40);
        objc_msgSend(v32, "accessibilityFrame");
        *(CGFloat *)&rect_16 = v50.size.width;
        *((_QWORD *)&rect_16 + 1) = *(_QWORD *)&v50.size.height;
        if (CGRectContainsPoint(v50, v43)
          && *(double *)&v41 > *(double *)&rect_16
          && *((double *)&v41 + 1) > *((double *)&rect_16 + 1))
        {
          v41 = rect_16;
          objc_storeStrong(&v42, v32);
        }
      }
      objc_storeStrong(&v32, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v48, 16);
        if (!v24)
          break;
      }
    }
  }

  v14 = v42;
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  return v14;
}

- (id)accessibilityIdentifier
{
  BOOL isHeader;
  BOOL v3;
  BOOL v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id location;
  char v26;
  id v27;
  char v28;
  char v29;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35[2];
  UITableViewSectionElement *v36;

  v36 = self;
  v35[1] = (id)a2;
  v35[0] = 0;
  v34 = (id)-[UITableViewSectionElement accessibilityContainer](self, "accessibilityContainer");
  v33 = -[UITableViewSectionElement section]((uint64_t)v36);
  v32 = (id)objc_msgSend(v34, "delegate");
  v31 = 0;
  isHeader = v36->_isHeader;
  v29 = 0;
  v14 = 0;
  if (isHeader)
  {
    v30 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("_delegateImplementsViewForHeaderInSection"));
    v29 = 1;
    v14 = objc_msgSend(v30, "BOOLValue");
  }
  if ((v29 & 1) != 0)

  v31 = v14 & 1;
  v28 = 0;
  v3 = v36->_isHeader;
  v26 = 0;
  v13 = 0;
  if (!v3)
  {
    v27 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("_delegateImplementsViewForFooterInSection"));
    v26 = 1;
    v13 = objc_msgSend(v27, "BOOLValue");
  }
  if ((v26 & 1) != 0)

  v28 = v13 & 1;
  location = 0;
  if ((v31 & 1) != 0 || (v28 & 1) != 0)
  {
    v4 = v36->_isHeader;
    v23 = 0;
    v21 = 0;
    if (v4)
    {
      v24 = (id)objc_msgSend(v34, "_visibleHeaderViewForSection:", v33);
      v23 = 1;
      objc_storeStrong(&location, v24);
    }
    else
    {
      v22 = (id)objc_msgSend(v34, "_visibleFooterViewForSection:", v33);
      v21 = 1;
      objc_storeStrong(&location, v22);
    }
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
    if (!location)
    {
      v5 = v36->_isHeader;
      v19 = 0;
      v17 = 0;
      if (v5)
      {
        v20 = (id)objc_msgSend(v32, "tableView:viewForHeaderInSection:", v34, v33);
        v19 = 1;
        objc_storeStrong(&location, v20);
      }
      else
      {
        v18 = (id)objc_msgSend(v32, "tableView:viewForFooterInSection:", v34, v33);
        v17 = 1;
        objc_storeStrong(&location, v18);
      }
      if ((v17 & 1) != 0)

      if ((v19 & 1) != 0)
    }
    v6 = (id)objc_msgSend(location, "accessibilityIdentifier");
    v7 = v35[0];
    v35[0] = v6;

    if (!v35[0])
    {
      v16 = (id)objc_msgSend(location, "_accessibilitySortedElementsWithin");
      v15 = objc_msgSend(v16, "indexOfObjectPassingTest:", &__block_literal_global_41);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = (id)objc_msgSend(v16, "objectAtIndex:", v15);
        v8 = (id)objc_msgSend(v12, "accessibilityLabel");
        v9 = v35[0];
        v35[0] = v8;

      }
      objc_storeStrong(&v16, 0);
    }
  }
  v11 = v35[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v35, 0);
  return v11;
}

uint64_t __52__UITableViewSectionElement_accessibilityIdentifier__block_invoke(void *a1, void *a2)
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

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = -[UITableViewSectionElement section]((uint64_t)self);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]{%p} section: %ld (isHeader: %d)"), v3, self, v4, -[UITableViewSectionElement isHeader]((uint64_t)self) & 1);
}

- (uint64_t)setSection:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (uint64_t)setIsHeader:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 56) = a2 & 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
