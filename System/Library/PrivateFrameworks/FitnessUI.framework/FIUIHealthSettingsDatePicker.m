@implementation FIUIHealthSettingsDatePicker

- (FIUIHealthSettingsDatePicker)initWithFrame:(CGRect)a3
{
  FIUIHealthSettingsDatePicker *v3;
  FIUIHealthSettingsDatePicker *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FIUIHealthSettingsDatePicker;
  v3 = -[FIUIHealthSettingsDatePicker initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FIUIHealthSettingsDatePicker setDatePickerMode:](v3, "setDatePickerMode:", 1);
    -[FIUIHealthSettingsDatePicker setPreferredDatePickerStyle:](v4, "setPreferredDatePickerStyle:", 1);
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDatePicker setTimeZone:](v4, "setTimeZone:", v5);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDatePicker setMaximumDate:](v4, "setMaximumDate:", v6);

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setYear:", objc_msgSend(v9, "year") - 150);
    objc_msgSend(v9, "setDay:", 1);
    objc_msgSend(v9, "setMonth:", 1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIHealthSettingsDatePicker setMinimumDate:](v4, "setMinimumDate:", v11);
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDatePicker _setTextColor:](v4, "_setTextColor:", v12);

    -[FIUIHealthSettingsDatePicker _setHighlightsToday:](v4, "_setHighlightsToday:", 0);
    -[FIUIHealthSettingsDatePicker addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__dateDidChange_, 4096);
    -[FIUIHealthSettingsDatePicker _setUsesBlackChrome:](v4, "_setUsesBlackChrome:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.109803922, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDatePicker setBackgroundColor:](v4, "setBackgroundColor:", v13);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FIUIHealthSettingsDatePicker;
  -[FIUIHealthSettingsDatePicker layoutSubviews](&v3, sel_layoutSubviews);
  _changeSeparatorLineColors(self);
}

- (void)_dateDidChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  -[FIUIHealthSettingsDatePicker dateUpdateHandler](self, "dateUpdateHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FIUIHealthSettingsDatePicker dateUpdateHandler](self, "dateUpdateHandler");
    v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDatePicker date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (void)forceUpdate
{
  -[FIUIHealthSettingsDatePicker _dateDidChange:](self, "_dateDidChange:", self);
}

- (id)dateUpdateHandler
{
  return self->_dateUpdateHandler;
}

- (void)setDateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateUpdateHandler, 0);
}

@end
