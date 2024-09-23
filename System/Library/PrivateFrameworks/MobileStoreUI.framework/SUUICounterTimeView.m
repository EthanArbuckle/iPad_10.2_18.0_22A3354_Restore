@implementation SUUICounterTimeView

- (SUUICounterTimeView)initWithClientContext:(id)a3
{
  id v5;
  SUUICounterTimeView *v6;
  SUUICounterTimeView *v7;
  _SUUICounterTimeFieldView *v8;
  _SUUICounterTimeFieldView *daysFieldView;
  void *v10;
  void *v11;
  _SUUICounterTimeFieldView *v12;
  _SUUICounterTimeFieldView *hoursFieldView;
  void *v14;
  void *v15;
  _SUUICounterTimeFieldView *v16;
  _SUUICounterTimeFieldView *minutesFieldView;
  void *v18;
  void *v19;
  _SUUICounterTimeFieldView *v20;
  _SUUICounterTimeFieldView *secondsFieldView;
  void *v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUICounterTimeView;
  v6 = -[SUUICounterTimeView init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v7->_visibleFields = 255;
    v8 = objc_alloc_init(_SUUICounterTimeFieldView);
    daysFieldView = v7->_daysFieldView;
    v7->_daysFieldView = v8;

    -[_SUUICounterTimeFieldView labelLabel](v7->_daysFieldView, "labelLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("COUNTDOWN_DAYS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_DAYS"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    -[_SUUICounterTimeFieldView setVisibilityField:](v7->_daysFieldView, "setVisibilityField:", 1);
    -[SUUICounterTimeView addSubview:](v7, "addSubview:", v7->_daysFieldView);
    v12 = objc_alloc_init(_SUUICounterTimeFieldView);
    hoursFieldView = v7->_hoursFieldView;
    v7->_hoursFieldView = v12;

    -[_SUUICounterTimeFieldView labelLabel](v7->_hoursFieldView, "labelLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("COUNTDOWN_HOURS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_HOURS"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    -[_SUUICounterTimeFieldView setVisibilityField:](v7->_hoursFieldView, "setVisibilityField:", 2);
    -[SUUICounterTimeView addSubview:](v7, "addSubview:", v7->_hoursFieldView);
    v16 = objc_alloc_init(_SUUICounterTimeFieldView);
    minutesFieldView = v7->_minutesFieldView;
    v7->_minutesFieldView = v16;

    -[_SUUICounterTimeFieldView labelLabel](v7->_minutesFieldView, "labelLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("COUNTDOWN_MINUTES"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_MINUTES"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v19);

    -[_SUUICounterTimeFieldView setVisibilityField:](v7->_minutesFieldView, "setVisibilityField:", 4);
    -[SUUICounterTimeView addSubview:](v7, "addSubview:", v7->_minutesFieldView);
    v20 = objc_alloc_init(_SUUICounterTimeFieldView);
    secondsFieldView = v7->_secondsFieldView;
    v7->_secondsFieldView = v20;

    -[_SUUICounterTimeFieldView labelLabel](v7->_secondsFieldView, "labelLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("COUNTDOWN_SECONDS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_SECONDS"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v23);

    -[_SUUICounterTimeFieldView setVisibilityField:](v7->_secondsFieldView, "setVisibilityField:", 8);
    -[SUUICounterTimeView addSubview:](v7, "addSubview:", v7->_secondsFieldView);
  }

  return v7;
}

- (void)reloadTimeValue
{
  double v3;
  int64_t v4;

  -[NSDate timeIntervalSinceNow](self->_endDate, "timeIntervalSinceNow");
  v4 = (uint64_t)v3 & ~((uint64_t)v3 >> 63);
  if (self->_lastTimeValue != v4)
  {
    self->_lastTimeValue = v4;
    -[SUUICounterTimeView _setValuesUsingTimestamp:](self, "_setValuesUsingTimestamp:");
  }
}

- (void)setEndDate:(id)a3
{
  NSDate *v4;
  NSDate *endDate;
  BOOL v6;
  NSDate *v7;
  NSDate *v8;
  double v9;
  NSDate *v10;

  v4 = (NSDate *)a3;
  endDate = self->_endDate;
  if (endDate != v4)
  {
    v10 = v4;
    v6 = -[NSDate isEqualToDate:](endDate, "isEqualToDate:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSDate *)-[NSDate copy](v10, "copy");
      v8 = self->_endDate;
      self->_endDate = v7;

      -[NSDate timeIntervalSinceNow](self->_endDate, "timeIntervalSinceNow");
      self->_lastTimeValue = (uint64_t)fmax(v9, 0.0);
      -[SUUICounterTimeView _setValuesUsingTimestamp:](self, "_setValuesUsingTimestamp:");
      v4 = v10;
    }
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_textColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    textColor = self->_textColor;
    self->_textColor = v4;

    -[SUUICounterTimeView _allFieldViews](self, "_allFieldViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "labelLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTextColor:", self->_textColor);

          objc_msgSend(v11, "valueLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTextColor:", self->_textColor);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)setValueFont:(id)a3
{
  UIFont *v4;
  UIFont *valueFont;
  void *v6;
  UIFont *v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_valueFont != a3)
  {
    v4 = (UIFont *)objc_msgSend(a3, "copy");
    valueFont = self->_valueFont;
    self->_valueFont = v4;

    -[SUUICounterTimeView _allFieldViews](self, "_allFieldViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_valueFont;
    -[UIFont pointSize](v7, "pointSize");
    -[UIFont fontWithSize:](v7, "fontWithSize:", fmax(v8 * 0.5, 8.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "labelLabel", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFont:", v9);

          objc_msgSend(v15, "valueLabel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setFont:", self->_valueFont);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    -[SUUICounterTimeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SUUICounterTimeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  float v31;
  double v32;
  uint64_t v33;
  double v34;
  uint64_t j;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;
  CGRect v53;

  v52 = *MEMORY[0x24BDAC8D0];
  -[SUUICounterTimeView _allFieldViews](self, "_allFieldViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICounterTimeView _visibleFieldViews](self, "_visibleFieldViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICounterTimeView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x24BDBF148];
  v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v17 = objc_msgSend(v4, "containsObject:", v16);
        if (v17)
        {
          objc_msgSend(v16, "frame");
          v19 = v18;
          v21 = v20;
          objc_msgSend(v16, "sizeThatFits:", v6, v8);
          if (v10 < v23)
            v10 = v23;
          v9 = v9 + v22;
          objc_msgSend(v16, "setFrame:", v19, v21, v22, v23);
        }
        objc_msgSend(v16, "setHidden:", v17 ^ 1u);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v13);
  }

  v24 = objc_msgSend(v4, "count");
  -[SUUICounterTimeView _fieldSpacingForFieldCount:fieldWidth:totalWidth:](self, "_fieldSpacingForFieldCount:fieldWidth:totalWidth:", v24, v9, v6);
  v26 = v25;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = v4;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = v8 - v10;
    v31 = (v6 - (v9 + (double)(v24 + 1) * v26)) * 0.5;
    v32 = v26 + floorf(v31);
    v33 = *(_QWORD *)v43;
    v34 = v10 + (float)(floorf(v30) * 0.5);
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(v27);
        v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v36, "frame", (_QWORD)v42);
        v38 = v37;
        v40 = v39;
        v41 = v34 - v39;
        objc_msgSend(v36, "setFrame:", v32, v34 - v39);
        v53.origin.x = v32;
        v53.origin.y = v41;
        v53.size.width = v38;
        v53.size.height = v40;
        v32 = v26 + CGRectGetMaxX(v53);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v29);
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUICounterTimeView _allFieldViews](self, "_allFieldViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setBackgroundColor:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SUUICounterTimeView;
  -[SUUICounterTimeView setBackgroundColor:](&v10, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SUUICounterTimeView _visibleFieldViews](self, "_visibleFieldViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "sizeThatFits:", width, height);
        if (v6 < v14)
          v6 = v14;
        v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  v15 = objc_msgSend(v8, "count");
  v16 = (double)(v15 + 1);
  -[SUUICounterTimeView _fieldSpacingForFieldCount:fieldWidth:totalWidth:](self, "_fieldSpacingForFieldCount:fieldWidth:totalWidth:", v15, v7, width);
  v18 = v7 + v16 * v17;
  if (v18 < width)
    width = v18;

  v19 = width;
  v20 = v6;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_allFieldViews
{
  _SUUICounterTimeFieldView *hoursFieldView;
  _SUUICounterTimeFieldView *secondsFieldView;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  hoursFieldView = self->_hoursFieldView;
  v5[0] = self->_daysFieldView;
  v5[1] = hoursFieldView;
  secondsFieldView = self->_secondsFieldView;
  v5[2] = self->_minutesFieldView;
  v5[3] = secondsFieldView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_fieldSpacingForFieldCount:(int64_t)a3 fieldWidth:(double)a4 totalWidth:(double)a5
{
  float v5;
  float v6;
  float v7;
  double v8;
  BOOL v9;
  double result;

  v5 = (a5 - a4) / (double)(a3 + 1);
  v6 = floorf(v5);
  v7 = 5.0;
  if (v6 > 5.0)
    v7 = v6;
  v8 = v7;
  v9 = v6 <= 14.0;
  result = 14.0;
  if (v9)
    return v8;
  return result;
}

- (void)_setValuesUsingTimestamp:(int64_t)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (!_setValuesUsingTimestamp__sActualValueFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v6 = (void *)_setValuesUsingTimestamp__sActualValueFormatter;
    _setValuesUsingTimestamp__sActualValueFormatter = (uint64_t)v5;

    objc_msgSend((id)_setValuesUsingTimestamp__sActualValueFormatter, "setNumberStyle:", 1);
  }
  if (!_setValuesUsingTimestamp__sPaddedValueFormatter)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v8 = (void *)_setValuesUsingTimestamp__sPaddedValueFormatter;
    _setValuesUsingTimestamp__sPaddedValueFormatter = (uint64_t)v7;

    objc_msgSend((id)_setValuesUsingTimestamp__sPaddedValueFormatter, "setNumberStyle:", 1);
    objc_msgSend((id)_setValuesUsingTimestamp__sPaddedValueFormatter, "setPositiveFormat:", CFSTR("00"));
  }
  v24 = (id)_setValuesUsingTimestamp__sActualValueFormatter;
  -[_SUUICounterTimeFieldView valueLabel](self->_daysFieldView, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 / 86400);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  if (a3 > 86399)
  {
    v12 = (id)_setValuesUsingTimestamp__sPaddedValueFormatter;

    v24 = v12;
  }
  -[_SUUICounterTimeFieldView valueLabel](self->_hoursFieldView, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 / 3600 % 24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  if (a3 / 3600 % 24 >= 1)
  {
    v16 = (id)_setValuesUsingTimestamp__sPaddedValueFormatter;

    v24 = v16;
  }
  -[_SUUICounterTimeFieldView valueLabel](self->_minutesFieldView, "valueLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 / 60 % 60);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v19);

  -[_SUUICounterTimeFieldView valueLabel](self->_secondsFieldView, "valueLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)_setValuesUsingTimestamp__sPaddedValueFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3 % 60);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringFromNumber:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v23);

  -[SUUICounterTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_visibleFieldViews
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t visibleFields;
  uint64_t v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUUICounterTimeView _allFieldViews](self, "_allFieldViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "valueLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          visibleFields = self->_visibleFields;
          v13 = objc_msgSend(v9, "visibilityField") & visibleFields;

          if (v13)
            objc_msgSend(v15, "addObject:", v9);
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v15;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_secondsFieldView, 0);
  objc_storeStrong((id *)&self->_minutesFieldView, 0);
  objc_storeStrong((id *)&self->_hoursFieldView, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_daysFieldView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
