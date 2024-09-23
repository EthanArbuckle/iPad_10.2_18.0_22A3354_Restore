@implementation MobileCalDayContainerAccessibilityElement

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MobileCalDayContainerAccessibilityElement children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setAccessibilityContainer:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MobileCalDayContainerAccessibilityElement;
  -[MobileCalDayContainerAccessibilityElement dealloc](&v8, sel_dealloc);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;

  objc_opt_class();
  -[MobileCalDayContainerAccessibilityElement dayGrid](self, "dayGrid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "accessibilityIsPreviewGridView");
  if ((_DWORD)v3)
  {
    accessibilityLocalizedString(CFSTR("event.preview.area"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MobileCalDayContainerAccessibilityElement date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _AXGetYearlessStringForDay();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[MobileCalDayContainerAccessibilityElement dayGrid](self, "dayGrid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_dayStarts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");

  -[MobileCalDayContainerAccessibilityElement indexInArray](self, "indexInArray");
  UIAccessibilityFrameForBounds();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;
  CGRect v32;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[MobileCalDayContainerAccessibilityElement _accessibilityParentView](self, "_accessibilityParentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointForPoint();
  v10 = v9;
  v12 = v11;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MobileCalDayContainerAccessibilityElement children](self, "children", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "accessibilityFrame");
        v31.x = v10;
        v31.y = v12;
        if (CGRectContainsPoint(v32, v31))
        {
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_20;
          }
          if ((objc_msgSend(v19, "isAccessibilityElement") & 1) != 0)
          {
            objc_msgSend(v19, "_accessibilitySupplementaryHeaderViews");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MobileCalDayContainerAccessibilityElement _accessibilityHitTestSupplementaryViews:point:withEvent:](self, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v20, v7, x, y);
            v21 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v21;
            if (!v21)
            {
              objc_msgSend(v19, "_accessibilitySupplementaryFooterViews");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[MobileCalDayContainerAccessibilityElement _accessibilityHitTestSupplementaryViews:point:withEvent:](self, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v22, v7, x, y);
              v16 = (id)objc_claimAutoreleasedReturnValue();

              if (!v16)
                v16 = v19;
            }
          }
          else
          {
            objc_msgSend(v19, "_accessibilityHitTest:withEvent:", v7, x, y);
            v23 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v23;
          }
        }
        else if (v16)
        {
          goto LABEL_20;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }
LABEL_20:

  return v16;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)indexInArray
{
  return self->_indexInArray;
}

- (void)setIndexInArray:(int64_t)a3
{
  self->_indexInArray = a3;
}

- (UIView)dayGrid
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dayGrid);
}

- (void)setDayGrid:(id)a3
{
  objc_storeWeak((id *)&self->_dayGrid, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dayGrid);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
