@implementation WeekAllDayLabelAccessibilityElement

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  double v18;
  CGRect result;

  -[WeekAllDayLabelAccessibilityElement allDayView](self, "allDayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_dayWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");

  objc_msgSend(v3, "safeValueForKey:", CFSTR("bounds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");

  objc_msgSend(v3, "safeValueForKey:", CFSTR("firstEventYOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");

  -[WeekAllDayLabelAccessibilityElement dayIndex](self, "dayIndex");
  UIAccessibilityFrameForBounds();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
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
}

@end
