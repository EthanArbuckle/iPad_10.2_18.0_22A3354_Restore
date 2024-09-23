@implementation WeekAllDayDayContainerAccessibilityElement

- (WeekAllDayDayContainerAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  WeekAllDayDayContainerAccessibilityElement *v3;
  NSMutableArray *v4;
  NSMutableArray *children;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeekAllDayDayContainerAccessibilityElement;
  v3 = -[WeekAllDayDayContainerAccessibilityElement initWithAccessibilityContainer:](&v7, sel_initWithAccessibilityContainer_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    children = v3->_children;
    v3->_children = v4;

  }
  return v3;
}

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
  -[WeekAllDayDayContainerAccessibilityElement children](self, "children");
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
  v8.super_class = (Class)WeekAllDayDayContainerAccessibilityElement;
  -[WeekAllDayDayContainerAccessibilityElement dealloc](&v8, sel_dealloc);
}

- (int64_t)accessibilityContainerType
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;

  -[WeekAllDayDayContainerAccessibilityElement children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[WeekAllDayDayContainerAccessibilityElement children](self, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("WeekAllDayLabelAccessibilityElement"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return 0;
    else
      return 4;
  }
  else
  {

    return 4;
  }
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[WeekAllDayDayContainerAccessibilityElement date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetStringsForDate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
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
  CGRect result;

  -[WeekAllDayDayContainerAccessibilityElement allDayView](self, "allDayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_dayStarts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "count");

  -[WeekAllDayDayContainerAccessibilityElement dayIndex](self, "dayIndex");
  UIAccessibilityFrameForBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)dayIndex
{
  return self->_dayIndex;
}

- (void)setDayIndex:(unint64_t)a3
{
  self->_dayIndex = a3;
}

- (UIView)allDayView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_allDayView);
}

- (void)setAllDayView:(id)a3
{
  objc_storeWeak((id *)&self->_allDayView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allDayView);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
