@implementation HUAlarmEditView

- (HUAlarmEditView)initWithFrame:(CGRect)a3 supportsMusicAlarm:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  HUAlarmEditView *v10;
  id v11;
  UITableView *v12;
  UITableView *settingsTable;
  HUAlarmEditView *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIDatePicker *v20;
  UIDatePicker *timePicker;
  UITableView *v22;
  UITableView *v23;
  void *v24;
  objc_super v26;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3)
    || (v26.receiver = self,
        v26.super_class = (Class)HUAlarmEditView,
        v10 = -[HUAlarmEditView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height),
        (self = v10) == 0))
  {
    v14 = 0;
  }
  else
  {
    v10->_accessorySupportsMusicAlarm = v4;
    if (v4)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEAA58]);
      v12 = (UITableView *)objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      settingsTable = self->_settingsTable;
      self->_settingsTable = v12;

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CEA4E8]);
      v16 = *MEMORY[0x1E0C9D648];
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v20 = (UIDatePicker *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], v17, v18, v19);
      timePicker = self->_timePicker;
      self->_timePicker = v20;

      -[UIDatePicker setDatePickerMode:](self->_timePicker, "setDatePickerMode:", 0);
      v22 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 1, v16, v17, v18, v19);
      v23 = self->_settingsTable;
      self->_settingsTable = v22;

      -[UITableView _setTopPadding:](self->_settingsTable, "_setTopPadding:", 0.0);
    }
    -[UITableView setAlwaysBounceVertical:](self->_settingsTable, "setAlwaysBounceVertical:", 0);
    -[HUAlarmEditView addSubview:](self, "addSubview:", self->_settingsTable);
    if (!self->_accessorySupportsMusicAlarm)
      -[HUAlarmEditView addSubview:](self, "addSubview:", self->_timePicker);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditView setBackgroundColor:](self, "setBackgroundColor:", v24);

    self = self;
    v14 = self;
  }

  return v14;
}

- (HUAlarmEditView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIDatePicker *v13;
  UIDatePicker *timePicker;
  UITableView *v15;
  UITableView *settingsTable;
  void *v17;
  HUAlarmEditView *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3)
    || (v20.receiver = self,
        v20.super_class = (Class)HUAlarmEditView,
        (self = -[HUAlarmEditView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height)) == 0))
  {
    v18 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CEA4E8]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = (UIDatePicker *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    timePicker = self->_timePicker;
    self->_timePicker = v13;

    -[UIDatePicker setDatePickerMode:](self->_timePicker, "setDatePickerMode:", 0);
    v15 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 1, v9, v10, v11, v12);
    settingsTable = self->_settingsTable;
    self->_settingsTable = v15;

    -[UITableView _setTopPadding:](self->_settingsTable, "_setTopPadding:", 0.0);
    -[UITableView setAlwaysBounceVertical:](self->_settingsTable, "setAlwaysBounceVertical:", 0);
    -[HUAlarmEditView addSubview:](self, "addSubview:", self->_settingsTable);
    -[HUAlarmEditView addSubview:](self, "addSubview:", self->_timePicker);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditView setBackgroundColor:](self, "setBackgroundColor:", v17);

    self = self;
    v18 = self;
  }

  return v18;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double MaxY;
  objc_super v13;
  CGRect v14;

  -[HUAlarmEditView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  if (self->_accessorySupportsMusicAlarm)
  {
    v8 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[UIDatePicker sizeToFit](self->_timePicker, "sizeToFit");
    -[UIDatePicker frame](self->_timePicker, "frame");
    v9 = v11;
    v7 = 0.0;
    -[UIDatePicker setFrame:](self->_timePicker, "setFrame:", 0.0, 0.0, v4);
    v10 = v4;
    v8 = 0.0;
  }
  -[UITableView frame](self->_settingsTable, "frame");
  if (!self->_accessorySupportsMusicAlarm)
  {
    v14.origin.x = v8;
    v14.origin.y = v7;
    v14.size.width = v10;
    v14.size.height = v9;
    MaxY = CGRectGetMaxY(v14);
    v6 = v6 - v9;
  }
  -[UITableView setFrame:](self->_settingsTable, "setFrame:", 0.0, MaxY, v4, v6);
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmEditView;
  -[HUAlarmEditView layoutSubviews](&v13, sel_layoutSubviews);
}

- (UITableView)settingsTable
{
  return self->_settingsTable;
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (BOOL)accessorySupportsMusicAlarm
{
  return self->_accessorySupportsMusicAlarm;
}

- (void)setAccessorySupportsMusicAlarm:(BOOL)a3
{
  self->_accessorySupportsMusicAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_settingsTable, 0);
}

@end
