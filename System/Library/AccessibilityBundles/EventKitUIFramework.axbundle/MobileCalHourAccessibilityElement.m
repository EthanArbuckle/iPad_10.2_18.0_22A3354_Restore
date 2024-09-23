@implementation MobileCalHourAccessibilityElement

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MobileCalHourAccessibilityElement *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 62, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityTimeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v18 = self;
    _AXAssert();
  }
  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 62, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "year");
    if (v12 == objc_msgSend(v5, "year"))
    {
      v13 = objc_msgSend(v11, "month");
      if (v13 == objc_msgSend(v5, "month"))
      {
        v14 = objc_msgSend(v11, "day");
        if (v14 == objc_msgSend(v5, "day"))
        {
          v15 = objc_msgSend(v11, "hour");
          if (v15 == objc_msgSend(v5, "hour"))
          {
            accessibilityLocalizedString(CFSTR("in.progress"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAXStringForVariables();
            v16 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v16;
          }
        }
      }
    }

  }
  return v7;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 62, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hour") == 12 && !MEMORY[0x23490DE18]())
  {
    accessibilityLocalizedString(CFSTR("noon"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MEMORY[0x23490DE24](objc_msgSend(v4, "hour"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  MEMORY[0x23490DE60]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)_frameInDayGridView
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  MobileCalHourAccessibilityElement *v27;
  CGRect result;

  -[MobileCalHourAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");

  -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityFrameToBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v27 = self;
    _AXAssert();
  }
  -[MobileCalHourAccessibilityElement hourDate](self, "hourDate", v27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "components:fromDate:", 62, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("topPadding"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v4, "safeValueForKey:", CFSTR("hourHeight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v12 = v22;

    v8 = v8 + v20 + v12 * (double)objc_msgSend(v17, "hour");
  }

  v23 = v6;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
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
  CGRect result;

  -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MobileCalHourAccessibilityElement _frameInDayGridView](self, "_frameInDayGridView");
  UIAccessibilityFrameForBounds();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  unsigned int v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)MobileCalHourAccessibilityElement;
  v3 = -[MobileCalHourAccessibilityElement isAccessibilityElement](&v8, sel_isAccessibilityElement);
  objc_opt_class();
  -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (objc_msgSend(v5, "accessibilityIsPreviewGridView"))
    {
      -[MobileCalHourAccessibilityElement accessibilityFrameForScrolling](self, "accessibilityFrameForScrolling");
      v6 = !CGRectIsNull(v9);
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)accessibilityFrameForScrolling
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  char v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;

  v33.receiver = self;
  v33.super_class = (Class)MobileCalHourAccessibilityElement;
  -[MobileCalHourAccessibilityElement accessibilityFrameForScrolling](&v33, sel_accessibilityFrameForScrolling);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v32 = 0;
  objc_opt_class();
  -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "accessibilityIsPreviewGridView"))
  {
    -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v31.receiver = self;
    v31.super_class = (Class)MobileCalHourAccessibilityElement;
    -[MobileCalHourAccessibilityElement accessibilityFrameForScrolling](&v31, sel_accessibilityFrameForScrolling);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v14, "accessibilityFrame");
    v37.origin.x = v23;
    v37.origin.y = v24;
    v37.size.width = v25;
    v37.size.height = v26;
    v34.origin.x = v16;
    v34.origin.y = v18;
    v34.size.width = v20;
    v34.size.height = v22;
    v35 = CGRectIntersection(v34, v37);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;

  }
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)accessibilityDropPointDescriptors
{
  MobileCalHourAccessibilityElement *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  MobileCalHourAccessibilityElement *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  objc_super v30;
  id v31;

  v2 = self;
  -[MobileCalHourAccessibilityElement dayGridView](self, "dayGridView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v3, "_accessibilityDragAndDropTargetViewForDrop:eventGestureController:", 1, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;

  if (v4)
  {
    -[MobileCalHourAccessibilityElement dayGridView](v2, "dayGridView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MobileCalHourAccessibilityElement _frameInDayGridView](v2, "_frameInDayGridView");
    objc_msgSend(v6, "convertRect:toView:", v4);

    v7 = *MEMORY[0x24BDC7650];
    v8 = 0x3CuLL / *MEMORY[0x24BDC7650];
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v7 <= 0x3C)
    {
      v10 = 0;
      v11 = (double)v7;
      if (v8 <= 1)
        v12 = 1;
      else
        v12 = v8;
      v29 = v12;
      do
      {
        -[MobileCalHourAccessibilityElement hourDate](v2, "hourDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", v11 * (double)v10 * 60.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "touchOffset");
        CalRoundPointToScreenScale();
        v16 = v15;
        v18 = v17;
        v19 = objc_alloc(MEMORY[0x24BDF67B0]);
        v20 = v9;
        v21 = v2;
        v22 = v5;
        v23 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("drop.event.time"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_accessibilityTimeString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v19, "initWithName:point:inView:", v26, v4, v16, v18);

        v5 = v22;
        v2 = v21;
        v9 = v20;

        objc_msgSend(v20, "addObject:", v27);
        ++v10;
      }
      while (v29 != v10);
    }
  }
  else
  {
    v30.receiver = v2;
    v30.super_class = (Class)MobileCalHourAccessibilityElement;
    -[MobileCalHourAccessibilityElement accessibilityDropPointDescriptors](&v30, sel_accessibilityDropPointDescriptors);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSDate)hourDate
{
  return self->hourDate;
}

- (void)setHourDate:(id)a3
{
  objc_storeStrong((id *)&self->hourDate, a3);
}

- (UIView)dayGridView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dayGridView);
}

- (void)setDayGridView:(id)a3
{
  objc_storeWeak((id *)&self->_dayGridView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dayGridView);
  objc_storeStrong((id *)&self->hourDate, 0);
}

@end
