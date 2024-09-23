@implementation FIUIHealthSettingsPickerController

- (FIUIHealthSettingsPickerController)init
{
  FIUIHealthSettingsPickerController *v2;
  id v3;
  uint64_t v4;
  UIPickerView *pickerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUIHealthSettingsPickerController;
  v2 = -[FIUIHealthSettingsPickerController init](&v8, sel_init);
  if (v2)
  {
    v2->_isMetricLocale = _IsMetricLocale();
    v3 = objc_alloc(MEMORY[0x24BEBD800]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    pickerView = v2->_pickerView;
    v2->_pickerView = (UIPickerView *)v4;

    -[UIPickerView setDataSource:](v2->_pickerView, "setDataSource:", v2);
    -[UIPickerView setDelegate:](v2->_pickerView, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.109803922, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPickerView setBackgroundColor:](v2->_pickerView, "setBackgroundColor:", v6);

  }
  return v2;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 0;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 0;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (BOOL)isMetricLocale
{
  return self->_isMetricLocale;
}

- (void)setIsMetricLocale:(BOOL)a3
{
  self->_isMetricLocale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
}

- (void)forceUpdate
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
