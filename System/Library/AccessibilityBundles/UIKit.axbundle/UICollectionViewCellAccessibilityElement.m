@implementation UICollectionViewCellAccessibilityElement

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UICollectionViewCellAccessibilityElement *v4;

  v4 = self;
  v3 = a2;
  -[UICollectionViewCell setAccessibilityContainer:](self->_cell, "setAccessibilityContainer:", 0);
  v2.receiver = v4;
  v2.super_class = (Class)UICollectionViewCellAccessibilityElement;
  -[UICollectionViewCellAccessibilityElement dealloc](&v2, sel_dealloc);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)realCell
{
  id v1;
  void *v2;
  id v3;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  char v8;
  id v9;
  id v10;
  int v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v15 = a1;
  if (a1)
  {
    v14 = (id)objc_msgSend(v15, "accessibilityContainer");
    objc_opt_class();
    v12 = 0;
    v7 = 1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (id)objc_msgSend(v14, "superview");
      v12 = 1;
      v7 = v13 == 0;
    }
    if ((v12 & 1) != 0)

    if (v7)
    {
      v16 = 0;
      v11 = 1;
    }
    else
    {
      v1 = (id)objc_msgSend(v14, "dataSource");
      v6 = v1 != 0;

      if (v6)
      {
        v10 = (id)objc_msgSend(v14, "cellForItemAtIndexPath:", *((_QWORD *)v15 + 9));
        v8 = 0;
        v5 = 0;
        if (v10)
        {
          v9 = (id)objc_msgSend(v10, "superview");
          v8 = 1;
          v5 = v9 == 0;
        }
        if ((v8 & 1) != 0)

        if (v5)
        {
          v2 = (void *)objc_msgSend(v14, "accessibilityCreatePrepareCellForIndexPath:", *((_QWORD *)v15 + 9));
          v3 = v10;
          v10 = v2;

        }
        v16 = v10;
        v11 = 1;
        objc_storeStrong(&v10, 0);
      }
      else
      {
        v16 = 0;
        v11 = 1;
      }
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (BOOL)_accessibilityBackingElementIsValid
{
  id v2;
  BOOL v4;

  v2 = -[UICollectionViewCellAccessibilityElement realCell](self);
  v4 = v2 != 0;

  return v4;
}

- (UICollectionViewCell)cell
{
  id v2;
  UICollectionViewCell *v3;
  UICollectionViewCell *cell;
  BOOL v5;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  int v10;
  id v11;
  char v12;
  BOOL v13;
  id v14;
  char v15;
  id v16;
  id location;
  id v18;
  id v19;
  int v20;
  id v21[2];
  UICollectionViewCellAccessibilityElement *v22;
  UICollectionViewCell *v23;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)-[UICollectionViewCellAccessibilityElement _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v2 = (id)objc_msgSend(v21[0], "superview");
  v13 = v2 != 0;

  if (v13)
  {
    v19 = -[UICollectionViewCellAccessibilityElement realCell](v22);
    if (v19)
    {
      v5 = v19 != v22->_cell;
      v15 = 0;
      LOBYTE(v10) = 1;
      if (!v5)
      {
        v16 = (id)objc_msgSend(v19, "_accessibilityIndexPath");
        v15 = 1;
        v10 = objc_msgSend(v16, "isEqual:", v22->_indexPath) ^ 1;
      }
      if ((v15 & 1) != 0)

      if ((v10 & 1) != 0)
      {
        v14 = v22->_cell;
        -[UICollectionViewCellAccessibilityElement setCell:](v22, "setCell:", v19);
        objc_msgSend(v19, "setAccessibilityContainer:", v22);
        if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0
          && (objc_msgSend(v21[0], "isAccessibilityOpaqueElementProvider") & 1) != 0)
        {
          LOBYTE(v7) = 1;
          v8 = CFSTR("set cell - this call should not happen with VO on. %@");
          v9 = (id)objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          _AXLogWithFacility();

        }
        objc_msgSend(v19, "layoutSubviews", v7, v8, v9);
        if (v14)
        {
          objc_msgSend(v19, "accessibilityReuseChildren:forMockParent:", v14, v22);
          if (v14 != v22->_cell)
          {
            objc_msgSend(v14, "accessibilityClearInternalData");
            objc_msgSend(v14, "setAccessibilityContainer:", 0);
          }
        }
        else
        {
          objc_msgSend(v19, "accessibilityClearInternalData");
          objc_msgSend(v19, "setAccessibilityContainer:", v22);
        }
        v22->_usingRealCell = 1;
        objc_storeStrong(&v14, 0);
      }
    }
    else
    {
      if (v22->_cell)
      {
        v11 = (id)-[UICollectionViewCell _accessibilityIndexPath](v22->_cell, "_accessibilityIndexPath");
        v12 = objc_msgSend(v11, "isEqual:", v22->_indexPath);

        if ((v12 & 1) == 0)
        {
          v18 = (id)objc_msgSend(v21[0], "accessibilityCellForRowAtIndexPath:", v22->_indexPath);
          objc_msgSend(v18, "setAccessibilityContainer:", v22);
          if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0
            && (objc_msgSend(v21[0], "isAccessibilityOpaqueElementProvider") & 1) != 0)
          {
            LOBYTE(v7) = 1;
            v8 = CFSTR("set cell - this call should not happen with VO on. %@");
            v9 = (id)objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            _AXLogWithFacility();

          }
          objc_msgSend(v18, "layoutSubviews", v7, v8, v9);
          objc_msgSend(v18, "removeFromSuperview");
          location = v22->_cell;
          -[UICollectionViewCellAccessibilityElement setCell:](v22, "setCell:", v18);
          objc_msgSend(v18, "accessibilityReuseChildren:forMockParent:", location, v22);
          if (location != v18)
          {
            objc_msgSend(location, "accessibilityClearInternalData");
            objc_msgSend(location, "setAccessibilityContainer:", 0);
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v18, 0);
        }
      }
      else
      {
        v3 = (UICollectionViewCell *)(id)objc_msgSend(v21[0], "accessibilityCellForRowAtIndexPath:", v22->_indexPath);
        cell = v22->_cell;
        v22->_cell = v3;

        -[UICollectionViewCell setAccessibilityContainer:](v22->_cell, "setAccessibilityContainer:", v22);
        -[UICollectionViewCell removeFromSuperview](v22->_cell, "removeFromSuperview");
      }
      v22->_usingRealCell = 0;
    }
    v23 = v22->_cell;
    v20 = 1;
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v23 = 0;
    v20 = 1;
  }
  objc_storeStrong(v21, 0);
  return v23;
}

- (BOOL)isAccessibilityElement
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell isAccessibilityElement](v3, "isAccessibilityElement");

  return v4 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v4;
  double v5;
  UICollectionViewCell *v7;
  id v8;
  UICollectionViewCell *v9;
  id v10;
  id location[2];
  UICollectionViewCellAccessibilityElement *v12;
  CGPoint v13;

  v13 = a3;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v9 = -[UICollectionViewCellAccessibilityElement cell](v12, "cell");
  v8 = (id)-[UICollectionViewCellAccessibilityElement accessibilityContainer](v12, "accessibilityContainer");
  v7 = -[UICollectionViewCellAccessibilityElement cell](v12, "cell");
  objc_msgSend(v8, "convertPoint:toView:", v13.x, v13.y);
  v10 = (id)-[UICollectionViewCell _accessibilityHitTest:withEvent:](v9, "_accessibilityHitTest:withEvent:", location[0], v4, v5);

  objc_storeStrong(location, 0);
  return v10;
}

- (int64_t)accessibilityElementCount
{
  UICollectionViewCell *v3;
  int64_t v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell accessibilityElementCount](v3, "accessibilityElementCount");

  return v4;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  UICollectionViewCell *v4;
  id v5;

  v4 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v5 = (id)-[UICollectionViewCell accessibilityElementAtIndex:](v4, "accessibilityElementAtIndex:", a3);

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  UICollectionViewCell *v4;
  int64_t v5;
  id location[2];
  UICollectionViewCellAccessibilityElement *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UICollectionViewCellAccessibilityElement cell](v7, "cell");
  v5 = -[UICollectionViewCell indexOfAccessibilityElement:](v4, "indexOfAccessibilityElement:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UICollectionViewCell *v21;
  BOOL v22;
  BOOL v23;
  UICollectionViewCell *v24;
  id v25;
  int v26;
  id v27;
  __int128 v28;
  __int128 v29;
  id v30;
  char v31;
  id v32;
  char v33;
  UICollectionViewCell *v34;
  id v35;
  id v36;
  char v37;
  id v38;
  id v39[2];
  UICollectionViewCellAccessibilityElement *v40;
  __int128 v41;
  __int128 v42;
  CGRect result;

  v40 = self;
  v39[1] = (id)a2;
  v24 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v39[0] = (id)-[UICollectionViewCell _accessibilityIndexPath](v24, "_accessibilityIndexPath");

  v37 = 0;
  objc_opt_class();
  v25 = (id)-[UICollectionViewCellAccessibilityElement accessibilityContainer](v40, "accessibilityContainer");
  v36 = (id)__UIAccessibilityCastAsClass();

  v35 = v36;
  objc_storeStrong(&v36, 0);
  v38 = v35;
  v33 = 0;
  v31 = 0;
  v23 = 0;
  if (v39[0])
  {
    v34 = -[UICollectionViewCellAccessibilityElement cell](v40, "cell");
    v33 = 1;
    v32 = (id)-[UICollectionViewCell window](v34, "window");
    v31 = 1;
    v23 = 0;
    if (!v32)
      v23 = v38 != 0;
  }
  if ((v31 & 1) != 0)

  if ((v33 & 1) != 0)
  if (!v23)
    goto LABEL_18;
  v30 = (id)objc_msgSend(v38, "layoutAttributesForItemAtIndexPath:", v39[0]);
  if (v30)
  {
    objc_msgSend(v30, "frame");
    *(_QWORD *)&v28 = v2;
    *((_QWORD *)&v28 + 1) = v3;
    *(_QWORD *)&v29 = v4;
    *((_QWORD *)&v29 + 1) = v5;
    v6 = (id)objc_msgSend(v38, "window");
    v22 = v6 != 0;

    if (v22)
      goto LABEL_15;
    v27 = (id)-[UICollectionViewCellAccessibilityElement _accessibilityAncestorIsKindOf:](v40, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    if (v27)
    {
      objc_msgSend(v27, "accessibilityFrame");
      *(double *)&v28 = *(double *)&v28 + v7;
      *((double *)&v28 + 1) = *((double *)&v28 + 1) + v8;
      v41 = v28;
      v42 = v29;
      v26 = 1;
    }
    else
    {
      v26 = 0;
    }
    objc_storeStrong(&v27, 0);
    if (!v26)
    {
LABEL_15:
      UIAccessibilityFrameForBounds();
      *(_QWORD *)&v41 = v9;
      *((_QWORD *)&v41 + 1) = v10;
      *(_QWORD *)&v42 = v11;
      *((_QWORD *)&v42 + 1) = v12;
      v26 = 1;
    }
  }
  else
  {
    v26 = 0;
  }
  objc_storeStrong(&v30, 0);
  if (!v26)
  {
LABEL_18:
    v21 = -[UICollectionViewCellAccessibilityElement cell](v40, "cell");
    -[UICollectionViewCell accessibilityFrame](v21, "accessibilityFrame");
    *(_QWORD *)&v41 = v13;
    *((_QWORD *)&v41 + 1) = v14;
    *(_QWORD *)&v42 = v15;
    *((_QWORD *)&v42 + 1) = v16;

  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(v39, 0);
  v18 = *((double *)&v41 + 1);
  v17 = *(double *)&v41;
  v20 = *((double *)&v42 + 1);
  v19 = *(double *)&v42;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
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
    v11 = !CGRectContainsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  id v2;
  id v3;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  char v10;
  id v11;
  id location[2];
  UICollectionViewCellAccessibilityElement *v13;
  BOOL v14;

  v13 = self;
  location[1] = (id)a2;
  v2 = -[UICollectionViewCellAccessibilityElement realCell](self);
  v8 = v2 == 0;

  if (v8)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      location[0] = (id)-[UICollectionViewCellAccessibilityElement accessibilityContainer](v13, "accessibilityContainer");
      objc_opt_class();
      v10 = 0;
      v7 = 1;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (id)objc_msgSend(location[0], "superview");
        v10 = 1;
        v7 = v11 == 0;
      }
      if ((v10 & 1) != 0)

      if (v7)
      {
        v14 = 0;
      }
      else
      {
        v3 = (id)objc_msgSend(location[0], "dataSource");
        v6 = v3 != 0;

        if (v6)
        {
          v9 = objc_msgSend(location[0], "numberOfSections");
          v14 = -[NSIndexPath section](v13->_indexPath, "section") < v9
             && v9
             && (v5 = -[NSIndexPath item](v13->_indexPath, "item"),
                 v5 < objc_msgSend(location[0], "numberOfItemsInSection:", -[NSIndexPath section](v13->_indexPath, "section")));
        }
        else
        {
          v14 = 0;
        }
      }
      objc_storeStrong(location, 0);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v14;
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v3;
  id v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  UICollectionViewCellAccessibilityElement *v29;
  id v30;
  id v31[2];
  int v32;
  int v33;
  id (*v34)(uint64_t);
  void *v35;
  id v36[3];
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  CGRect rect2;
  double v42;
  CGRect v43;
  char v44;
  unint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  char v56;
  id v57;
  id v58;
  id location[2];
  UICollectionViewCellAccessibilityElement *v60;
  char v61;
  double v62;
  double v63;
  double v64;
  double v65;

  v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)AXRetainAutorelease();
  v58 = -[UICollectionViewCellAccessibilityElement realCell](v60);
  v56 = 0;
  objc_opt_class();
  v28 = (id)-[UICollectionViewCellAccessibilityElement accessibilityContainer](v60, "accessibilityContainer");
  v55 = (id)__UIAccessibilityCastAsClass();

  v54 = v55;
  objc_storeStrong(&v55, 0);
  v57 = v54;
  v53 = 0;
  v52 = 0;
  if (!v54
    || v58
    || (v27 = -[NSIndexPath section](v60->_indexPath, "section"), v27 >= objc_msgSend(v57, "numberOfSections"))
    || (v26 = -[NSIndexPath item](v60->_indexPath, "item"),
        v26 >= objc_msgSend(v57, "numberOfItemsInSection:", -[NSIndexPath section](v60->_indexPath, "section"))))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v50 = objc_msgSend(v58, "accessibilityScrollToVisible") & 1) != 0)
    {
      v61 = v50;
      v51 = 1;
    }
    else
    {
      v49 = (id)objc_msgSend(location[0], "_accessibilityParentView");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (id)-[UICollectionViewCellAccessibilityElement _accessibilityParentView](v60, "_accessibilityParentView");
        v5 = v49;
        v49 = v4;

      }
      v48 = (id)objc_msgSend(v49, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = (id)objc_msgSend(v48, "indexPathsForVisibleItems");
        v46 = v60->_indexPath;
        v45 = objc_msgSend(v47, "indexOfObject:", v46);
        v44 = 0;
        if ((_UIAXObjectIsBehindKeyboard() & 1) != 0)
        {
          v53 = 1;
          v44 = 1;
        }
        if ((v44 & 1) == 0)
        {
          v25 = (id)objc_msgSend(v48, "safeValueForKey:", CFSTR("visibleBounds"));
          objc_msgSend(v25, "rectValue");
          v43.origin.x = v6;
          v43.origin.y = v7;
          v43.size.width = v8;
          v43.size.height = v9;

          v42 = -10.0;
          objc_msgSend(v49, "frame");
          rect2.origin.x = v10;
          rect2.origin.y = v11;
          rect2.size.width = v12;
          rect2.size.height = v13;
          if (!CGRectContainsRect(v43, rect2) || !v58)
          {
            MaxY = CGRectGetMaxY(rect2);
            v65 = MaxY - CGRectGetMinY(v43);
            if (fabs(v65) > -10.0
              || (MinY = CGRectGetMinY(rect2), v64 = MinY - CGRectGetMaxY(v43), fabs(v64) > -10.0)
              || !v58)
            {
              if (v58)
                v53 = 2;
              else
                v53 = 1;
            }
            MaxX = CGRectGetMaxX(rect2);
            v63 = MaxX - CGRectGetMinX(v43);
            if (fabs(v63) > -10.0
              || (MinX = CGRectGetMinX(rect2), v62 = MinX - CGRectGetMaxX(v43), fabs(v62) > -10.0)
              || !v58)
            {
              v52 = 16;
            }
          }
          v44 = 1;
        }
        v40 = objc_msgSend(v47, "count");
        if ((v44 & 1) == 0 && v40 && (v45 > 1 && v45 < v40 - 2 || v40 == 1))
        {
          v61 = 0;
          v51 = 1;
        }
        else
        {
          v20 = objc_msgSend(v48, "accessibilityElementCount");
          if (v20 != objc_msgSend(v47, "count") || (v44 & 1) != 0)
          {
            v39 = objc_msgSend(v48, "numberOfSections");
            if (objc_msgSend(v46, "section") < v39
              && v39
              && (v19 = objc_msgSend(v46, "item"),
                  v19 < objc_msgSend(v48, "numberOfItemsInSection:", objc_msgSend(v46, "section"))))
            {
              objc_msgSend(v48, "contentOffset");
              v37 = v14;
              v38 = v15;
              objc_msgSend(v48, "scrollToItemAtIndexPath:atScrollPosition:animated:", v46, v52 | v53, 0);
              objc_msgSend(v48, "contentOffset");
              v36[1] = v16;
              v36[2] = v17;
              if (!__CGPointEqualToPoint(v37, v38, *(double *)&v16, *(double *)&v17))
                objc_msgSend(v48, "_accessibilityCollectionViewUpdateVisibleCells");
              if (v58 && -[UICollectionViewCellAccessibilityElement _accessibilityIsOutsideParentBounds](v60))
              {
                v61 = 0;
                v51 = 1;
              }
              else
              {
                v31[1] = (id)MEMORY[0x24BDAC760];
                v32 = -1073741824;
                v33 = 0;
                v34 = __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke;
                v35 = &unk_24FF3DA40;
                v36[0] = v60;
                AXPerformBlockOnMainThreadAfterDelay();
                if (!location[0])
                  objc_storeStrong(location, v58);
                v29 = v60;
                v30 = location[0];
                v31[0] = v48;
                AXPerformBlockOnMainThreadAfterDelay();
                v61 = 1;
                v51 = 1;
                objc_storeStrong(v31, 0);
                objc_storeStrong(&v30, 0);
                objc_storeStrong((id *)&v29, 0);
                objc_storeStrong(v36, 0);
              }
            }
            else
            {
              v61 = 0;
              v51 = 1;
            }
          }
          else
          {
            v61 = 0;
            v51 = 1;
          }
        }
        objc_storeStrong(&v46, 0);
        objc_storeStrong(&v47, 0);
      }
      else
      {
        v61 = 0;
        v51 = 1;
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
  }
  else
  {
    objc_msgSend(v57, "scrollToItemAtIndexPath:atScrollPosition:animated:", v60->_indexPath, v52 | v53, 0);
    v61 = 1;
    v51 = 1;
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);
  return v61 & 1;
}

id __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "cell", a1, a1);
}

id __82__UICollectionViewCellAccessibilityElement_accessibilityScrollToVisibleWithChild___block_invoke_2(uint64_t a1)
{
  id v1;
  id v3;
  id v5;
  BOOL v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityWindow");
  v5 = (id)objc_msgSend(v3, "firstResponder");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if ((objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityParentView");
    v11 = 1;
    v10 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("window"));
    v9 = 1;
    v8 = (id)AXUIKeyboardWindow();
    v7 = 1;
    v6 = v10 != v8;
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v11 & 1) != 0)

  if (v6)
    _UIAXDismissKeyboardIfNecessary();
  v1 = (id)objc_opt_self();
  return (id)objc_opt_self();
}

- (id)automationCustomProperties
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell automationCustomProperties](v3, "automationCustomProperties");

  return v4;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  UICollectionViewCell *v3;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilitySetSelectedTextRange:](v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);

}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  UICollectionViewCell *v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v6 = -[UICollectionViewCell _accessibilitySelectedTextRange](v5, "_accessibilitySelectedTextRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityTextViewTextOperationResponder](v3, "_accessibilityTextViewTextOperationResponder");

  return v4;
}

- (id)_accessibilityTextOperations
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityTextOperations](v3, "_accessibilityTextOperations");

  return v4;
}

- (void)_accessibilityCopy
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilityCopy](v2, "_accessibilityCopy");

}

- (void)_accessibilityCut
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilityCut](v2, "_accessibilityCut");

}

- (void)accessibilityElementDidBecomeFocused
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell accessibilityElementDidBecomeFocused](v2, "accessibilityElementDidBecomeFocused");

}

- (void)accessibilityElementDidLoseFocus
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell accessibilityElementDidLoseFocus](v2, "accessibilityElementDidLoseFocus");

}

- (void)_accessibilitySelect
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilitySelect](v2, "_accessibilitySelect");

}

- (void)_accessibilityPaste
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilityPaste](v2, "_accessibilityPaste");

}

- (void)_accessibilitySelectAll
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilitySelectAll](v2, "_accessibilitySelectAll");

}

- (void)_accessibilityUndo
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilityUndo](v2, "_accessibilityUndo");

}

- (void)_accessibilityRedo
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell _accessibilityRedo](v2, "_accessibilityRedo");

}

- (BOOL)_accessibilityHasTextOperations
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityHasTextOperations](v3, "_accessibilityHasTextOperations");

  return v4 & 1;
}

- (id)accessibilityLabel
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityAXAttributedLabel](v3, "_accessibilityAXAttributedLabel");

  return v4;
}

- (id)accessibilityValue
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityAXAttributedValue](v3, "_accessibilityAXAttributedValue");

  return v4;
}

- (id)accessibilityIdentifier
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell accessibilityIdentifier](v3, "accessibilityIdentifier");

  return v4;
}

- (unint64_t)accessibilityTraits
{
  UICollectionViewCell *v2;
  UICollectionViewCell *v4;
  BOOL v5;
  unint64_t v7;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v5 = v2 != 0;

  if (!v5)
    return *MEMORY[0x24BEBB178];
  v4 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v7 = -[UICollectionViewCell accessibilityTraits](v4, "accessibilityTraits");

  return v7;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  UICollectionViewCell *v6;
  double v7;
  double v8;
  CGPoint result;

  v6 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell accessibilityActivationPoint](v6, "accessibilityActivationPoint");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)_accessibilityIsAwayAlertElement
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityIsAwayAlertElement](v3, "_accessibilityIsAwayAlertElement");

  return v4 & 1;
}

- (id)accessibilityHint
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityAXAttributedHint](v3, "_accessibilityAXAttributedHint");

  return v4;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  UICollectionViewCell *v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v6 = -[UICollectionViewCell accessibilityRowRange](v5, "accessibilityRowRange");
  v7 = v2;

  v3 = v6;
  v4 = v7;
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityImplementsDefaultRowRange](v3, "_accessibilityImplementsDefaultRowRange");

  return v4 & 1;
}

- (id)accessibilityLanguage
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell accessibilityLanguage](v3, "accessibilityLanguage");

  return v4;
}

- (void)accessibilityIncrement
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell accessibilityIncrement](v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  UICollectionViewCell *v2;

  v2 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  -[UICollectionViewCell accessibilityDecrement](v2, "accessibilityDecrement");

}

- (BOOL)accessibilityActivate
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell accessibilityActivate](v3, "accessibilityActivate");

  return v4 & 1;
}

- (id)_accessibilityCollectionViewCellContentSubviews
{
  UICollectionViewCell *v3;
  id v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = (id)-[UICollectionViewCell _accessibilityCollectionViewCellContentSubviews](v3, "_accessibilityCollectionViewCellContentSubviews");

  return v4;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilitySupportsActivateAction](v3, "_accessibilitySupportsActivateAction");

  return v4 & 1;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  UICollectionViewCell *v4;
  id v5;

  v4 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v5 = (id)-[UICollectionViewCell _accessibilityDataDetectorScheme:](v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  UICollectionViewCell *v3;
  BOOL v4;

  if (-[UICollectionViewCellAccessibilityElement isAccessibilityElement](self, "isAccessibilityElement"))
    return 1;
  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell accessibilityElementCount](v3, "accessibilityElementCount") != 1;

  return !v4;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  UICollectionViewCell *v3;
  int64_t v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityScannerActivateBehavior](v3, "_accessibilityScannerActivateBehavior");

  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityIsSpeakThisElement](v3, "_accessibilityIsSpeakThisElement");

  return v4 & 1;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityShouldIncludeRowRangeInElementDescription](v3, "_accessibilityShouldIncludeRowRangeInElementDescription");

  return v4 & 1;
}

- (id)automationElements
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  UICollectionViewCell *v9;
  objc_super v10;
  int v11;
  _QWORD __b[8];
  id v13;
  id location[2];
  UICollectionViewCellAccessibilityElement *v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  v9 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  location[0] = (id)-[UICollectionViewCell automationElements](v9, "automationElements");

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
    v10.super_class = (Class)UICollectionViewCellAccessibilityElement;
    v16 = -[UICollectionViewCellAccessibilityElement automationElements](&v10, sel_automationElements);
    v11 = 1;
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityUserTestingIsCancelButton](v3, "_accessibilityUserTestingIsCancelButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityUserTestingIsDefaultButton](v3, "_accessibilityUserTestingIsDefaultButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityUserTestingIsDestructiveButton](v3, "_accessibilityUserTestingIsDestructiveButton");

  return v4 & 1;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityUserTestingIsPreferredButton](v3, "_accessibilityUserTestingIsPreferredButton");

  return v4 & 1;
}

- (id)_accessibilityUserTestingVisibleAncestor
{
  return -[UICollectionViewCellAccessibilityElement cell](self, "cell", a2, self);
}

- (id)_accessibilityUserTestingProxyView
{
  return -[UICollectionViewCellAccessibilityElement cell](self, "cell", a2, self);
}

- (id)_accessibilitySemanticContextForElement:(id)a3
{
  UICollectionViewCell *v4;
  id v5;
  id location[2];
  UICollectionViewCellAccessibilityElement *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UICollectionViewCellAccessibilityElement cell](v7, "cell");
  v5 = (id)-[UICollectionViewCell _accessibilitySemanticContextForElement:](v4, "_accessibilitySemanticContextForElement:", location[0]);

  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityCanBecomeNativeFocused](v3, "_accessibilityCanBecomeNativeFocused");

  return v4 & 1;
}

- (BOOL)_accessibilityHasNativeFocus
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityHasNativeFocus](v3, "_accessibilityHasNativeFocus");

  return v4 & 1;
}

- (BOOL)_accessibilitySetNativeFocus
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilitySetNativeFocus](v3, "_accessibilitySetNativeFocus");

  return v4 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  UICollectionViewCell *v3;
  char v4;

  v3 = -[UICollectionViewCellAccessibilityElement cell](self, "cell");
  v4 = -[UICollectionViewCell _accessibilityViewHierarchyHasNativeFocus](v3, "_accessibilityViewHierarchyHasNativeFocus");

  return v4 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 75;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
