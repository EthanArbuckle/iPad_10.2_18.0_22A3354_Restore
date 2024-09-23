@implementation HKMonthWeekView

- (HKMonthWeekView)initWithDateCache:(id)a3 displaysMonthTitle:(BOOL)a4 displaysTopBorderLine:(BOOL)a5
{
  _BOOL4 v5;
  HKMonthWeekView *v7;
  void *v8;
  uint64_t v9;
  CALayer *topBorderLine;
  CALayer *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMonthWeekView;
  v7 = -[HKCalendarWeekView initWithDateCache:](&v15, sel_initWithDateCache_, a3);
  if (v7)
  {
    v7->_isRTL = HKUICalendarLocaleIsRightToLeft();
    v7->_displaysMonthTitle = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMonthWeekView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v7->_displaysTopBorderLine = v5;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v9 = objc_claimAutoreleasedReturnValue();
      topBorderLine = v7->_topBorderLine;
      v7->_topBorderLine = (CALayer *)v9;

      v11 = v7->_topBorderLine;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      -[CALayer setContentsScale:](v11, "setContentsScale:");

      -[HKMonthWeekView layer](v7, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", v7->_topBorderLine);

    }
    -[HKCalendarWeekView setLeadingMargin:](v7, "setLeadingMargin:", 5.0);
    -[HKCalendarWeekView setDateTopMargin:](v7, "setDateTopMargin:", 2.0);
    -[HKCalendarWeekView setDateBottomMargin:](v7, "setDateBottomMargin:", 18.0);
    -[HKCalendarWeekView setMonthTitleTopMargin:](v7, "setMonthTitleTopMargin:", 2.0);
    -[HKCalendarWeekView setMonthTitleBottomMargin:](v7, "setMonthTitleBottomMargin:", 2.0);
    -[HKCalendarWeekView setDateDiameter:](v7, "setDateDiameter:", 35.0);
  }
  return v7;
}

- (NSArray)accessoryViews
{
  NSArray *accessoryViews;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  HKMonthWeekViewAccessoryView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = *MEMORY[0x1E0C80C00];
  accessoryViews = self->_accessoryViews;
  if (!accessoryViews)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[HKCalendarWeekView dayCells](self, "dayCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HKCalendarWeekView dayCells](self, "dayCells");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v16 = -[HKMonthWeekViewAccessoryView initWithFrame:]([HKMonthWeekViewAccessoryView alloc], "initWithFrame:", v10, v11, v12, v13);
          -[HKMonthWeekViewAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[NSArray addObject:](v6, "addObject:", v16);
          -[HKMonthWeekView addSubview:](self, "addSubview:", v16);
          -[HKMonthWeekViewAccessoryView centerXAnchor](v16, "centerXAnchor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMonthWeekView leadingAnchor](self, "leadingAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, CGRectGetMidX(v37));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setActive:", 1);

          -[HKMonthWeekViewAccessoryView widthAnchor](v16, "widthAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          objc_msgSend(v20, "constraintEqualToConstant:", CGRectGetWidth(v38) * 0.5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setActive:", 1);

          -[HKMonthWeekViewAccessoryView heightAnchor](v16, "heightAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMonthWeekViewAccessoryView widthAnchor](v16, "widthAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setActive:", 1);

          -[HKMonthWeekViewAccessoryView topAnchor](v16, "topAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMonthWeekView topAnchor](self, "topAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, CGRectGetMaxY(v39) + -2.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setActive:", 1);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v8);
    }

    v28 = self->_accessoryViews;
    self->_accessoryViews = v6;

    accessoryViews = self->_accessoryViews;
  }
  return accessoryViews;
}

- (void)clearAccessoryViews
{
  NSArray *accessoryViews;

  -[HKMonthWeekView setAccessoryContentsFetched:](self, "setAccessoryContentsFetched:", 0);
  -[NSArray makeObjectsPerformSelector:](self->_accessoryViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  accessoryViews = self->_accessoryViews;
  self->_accessoryViews = 0;

}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)monthTitleClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsRTL
{
  return 1;
}

- (BOOL)containsMonthTitle
{
  objc_super v3;

  if (!self->_displaysMonthTitle)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)HKMonthWeekView;
  return -[HKCalendarWeekView containsMonthTitle](&v3, sel_containsMonthTitle);
}

- (void)selectedCalendarDay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKCalendarWeekView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "week:cellSelected:", self, v4);

}

- (id)cellMatchingDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[HKCalendarWeekView containsDate:](self, "containsDate:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "component:fromDate:", 512, v4);
    v7 = objc_msgSend(v5, "firstWeekday");
    v8 = (unint64_t)(v6 - v7 + *MEMORY[0x1E0CB4B98]) % *MEMORY[0x1E0CB4B98];
    if (HKUICalendarLocaleIsRightToLeft())
      v8 = 6 - v8;
    -[HKCalendarWeekView dayCells](self, "dayCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setTitleHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[HKMonthWeekView containsMonthTitle](self, "containsMonthTitle"))
  {
    -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

  }
}

- (void)setMonthWeekStart:(id)a3
{
  _BOOL4 isRTL;
  int64_t v5;
  int64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKMonthWeekView;
  -[HKCalendarWeekView setMonthWeekStart:](&v8, sel_setMonthWeekStart_, a3);
  isRTL = self->_isRTL;
  v5 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  v6 = v5;
  if (isRTL)
  {
    -[HKCalendarWeekView dayCells](self, "dayCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setHidden:](self->_topBorderLine, "setHidden:", v6 == objc_msgSend(v7, "count") - 1);

  }
  else
  {
    -[CALayer setHidden:](self->_topBorderLine, "setHidden:", v5 == 0);
  }
  -[HKMonthWeekView clearAccessoryViews](self, "clearAccessoryViews");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 isRTL;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  _BOOL4 v42;
  int64_t v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  CALayer *topBorderLine;
  CALayer *v49;
  id v50;
  _QWORD v51[8];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[HKMonthWeekView bounds](self, "bounds");
  v4 = v3;
  -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
  v6 = *MEMORY[0x1E0CB4B98];
  v7 = (v4 + v5 * -2.0) / (double)(unint64_t)*MEMORY[0x1E0CB4B98];
  -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMonthWeekView bounds](self, "bounds");
  objc_msgSend(v8, "sizeThatFits:", v9, v10);
  v12 = v11;
  v14 = v13;

  if (!-[HKMonthWeekView containsMonthTitle](self, "containsMonthTitle"))
    goto LABEL_17;
  -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeToFit");

  -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;

  -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
  -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  UIRoundToViewScale();
  v20 = v19;
  if (v19 < 0.0)
  {
    -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
    v20 = v21;
  }
  -[HKMonthWeekView bounds](self, "bounds");
  if (v18 + v20 > v22)
  {
    -[HKMonthWeekView bounds](self, "bounds");
    v24 = v23 - v18;
    -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
    v20 = v24 - v25;
  }
  -[HKCalendarWeekView dateTopMargin](self, "dateTopMargin");
  v27 = v26;
  -[HKCalendarWeekView monthTitleTopMargin](self, "monthTitleTopMargin");
  v29 = v27 + v28;
  isRTL = self->_isRTL;
  v31 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  v32 = v31;
  if (!isRTL)
  {
    if (v31 <= 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[HKCalendarWeekView dayCells](self, "dayCells");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count") - 1;

  if (v32 < v34)
  {
LABEL_8:
    -[HKCalendarWeekView dateBottomMargin](self, "dateBottomMargin");
    v36 = v35;
    -[HKCalendarWeekView dateDiameter](self, "dateDiameter");
    v29 = v29 + v36 + v37;
  }
LABEL_9:
  -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMonthWeekView bounds](self, "bounds");
  objc_msgSend(v38, "setFrame:", v20, v29);

  -[HKCalendarWeekView monthTitleView](self, "monthTitleView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v41 = -v20;
  if (!self->_isRTL)
    v41 = -17.0;
  objc_msgSend(v39, "setDividerOriginX:", v41);
  v42 = self->_isRTL;
  v43 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  if (v42)
  {
    v44 = (double)(v43 + 1);
    -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
    v46 = v45 + v7 * v44;
  }
  else
  {
    v46 = v7 * (double)(unint64_t)(v6 - v43 + 1);
  }
  objc_msgSend(v40, "setDividerWidth:", v46);

LABEL_17:
  -[HKCalendarWeekView dayCells](self, "dayCells");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __33__HKMonthWeekView_layoutSubviews__block_invoke;
  v51[3] = &unk_1E9C430C0;
  v51[4] = self;
  *(double *)&v51[5] = v7;
  v51[6] = v12;
  v51[7] = v14;
  objc_msgSend(v47, "enumerateObjectsUsingBlock:", v51);

  topBorderLine = self->_topBorderLine;
  -[HKMonthWeekView _frameForTopBorderLine](self, "_frameForTopBorderLine");
  -[CALayer setFrame:](topBorderLine, "setFrame:");
  v49 = self->_topBorderLine;
  objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v49, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __33__HKMonthWeekView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  double v21;
  unsigned __int8 *v22;
  int v23;
  unint64_t v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v35 = a2;
  objc_msgSend(*(id *)(a1 + 32), "leadingMargin");
  objc_msgSend(*(id *)(a1 + 32), "dateDiameter");
  UIRoundToViewScale();
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "dateTopMargin");
  v8 = v7;
  objc_msgSend(v35, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateWithDate:dayOfMonth:", v9, objc_msgSend(v35, "dayOfMonth"));

  if (objc_msgSend(*(id *)(a1 + 32), "containsMonthTitle"))
  {
    v10 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "monthTitleTopMargin");
    v12 = v10 + v11;
    objc_msgSend(*(id *)(a1 + 32), "monthTitleBottomMargin");
    v14 = v13;
    v15 = *(unsigned __int8 **)(a1 + 32);
    v16 = v15[538];
    v17 = objc_msgSend(v15, "firstDayOfMonthCellIndex");
    v18 = v17;
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "dayCells");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18 == objc_msgSend(v19, "count") - 1;

    }
    else
    {
      v20 = v17 == 0;
    }
    v21 = v12 + v14;
    v22 = *(unsigned __int8 **)(a1 + 32);
    v23 = v22[538];
    v24 = objc_msgSend(v22, "firstDayOfMonthCellIndex");
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "dateTopMargin");
LABEL_12:
      v8 = v8 + v21 + v25;
      goto LABEL_13;
    }
    if (v23)
      v26 = v24 >= a3;
    else
      v26 = v24 <= a3;
    if (v26)
    {
      objc_msgSend(v35, "dayDiameter");
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 32), "dateTopMargin");
      v30 = v28 + v29;
      objc_msgSend(*(id *)(a1 + 32), "dateBottomMargin");
      v25 = v30 + v31;
      goto LABEL_12;
    }
  }
LABEL_13:
  objc_msgSend(v35, "dayDiameter");
  v33 = v32;
  objc_msgSend(v35, "dayDiameter");
  objc_msgSend(v35, "setFrame:", v6, v8, v33, v34);
  objc_msgSend(v35, "layoutSublayers");

}

- (CGRect)_frameForTopBorderLine
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  _BOOL4 isRTL;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  int64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
  v4 = v3;
  -[HKMonthWeekView bounds](self, "bounds");
  v6 = v5;
  -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
  v8 = v7;
  v9 = 0.0;
  if (!-[HKMonthWeekView containsMonthTitle](self, "containsMonthTitle"))
    goto LABEL_4;
  v10 = *MEMORY[0x1E0CB4B98];
  v11 = (v6 + v8 * -2.0) / (double)(unint64_t)*MEMORY[0x1E0CB4B98];
  isRTL = self->_isRTL;
  v13 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  v14 = v13;
  if (isRTL)
  {
    v15 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex") + 1;
    -[HKCalendarWeekView leadingMargin](self, "leadingMargin");
    v9 = v16 + v11 * (double)v15;
    if (v14 == v10 - 1)
    {
LABEL_4:
      -[HKMonthWeekView bounds](self, "bounds");
      v18 = v17;
      goto LABEL_9;
    }
  }
  else if (v13 != 1)
  {
    goto LABEL_4;
  }
  v19 = self->_isRTL;
  v20 = -[HKCalendarWeekView firstDayOfMonthCellIndex](self, "firstDayOfMonthCellIndex");
  v21 = v10 + ~v20;
  if (!v19)
    v21 = v20;
  v18 = v4 + v11 * (double)v21;
LABEL_9:
  v22 = HKUIOnePixel();
  v23 = 0.0;
  v24 = v9;
  v25 = v18;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMonthWeekView;
  -[HKMonthWeekView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKMonthWeekView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      +[HKCalendarDayCell clearImageCache](HKCalendarDayCell, "clearImageCache");
      -[HKMonthWeekView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (BOOL)accessoryContentsFetched
{
  return self->_accessoryContentsFetched;
}

- (void)setAccessoryContentsFetched:(BOOL)a3
{
  self->_accessoryContentsFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_topBorderLine, 0);
}

@end
