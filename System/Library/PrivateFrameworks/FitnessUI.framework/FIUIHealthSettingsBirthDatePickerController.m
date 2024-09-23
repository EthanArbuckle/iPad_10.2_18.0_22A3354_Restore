@implementation FIUIHealthSettingsBirthDatePickerController

- (FIUIHealthSettingsBirthDatePickerController)init
{
  FIUIHealthSettingsBirthDatePickerController *v2;
  FIUIHealthSettingsDatePicker *v3;
  uint64_t v4;
  FIUIHealthSettingsDatePicker *datePickerView;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FIUIHealthSettingsBirthDatePickerController;
  v2 = -[FIUIHealthSettingsBirthDatePickerController init](&v10, sel_init);
  if (v2)
  {
    v3 = [FIUIHealthSettingsDatePicker alloc];
    v4 = -[FIUIHealthSettingsDatePicker initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    datePickerView = v2->_datePickerView;
    v2->_datePickerView = (FIUIHealthSettingsDatePicker *)v4;

    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__FIUIHealthSettingsBirthDatePickerController_init__block_invoke;
    v7[3] = &unk_24CF304C0;
    objc_copyWeak(&v8, &location);
    -[FIUIHealthSettingsDatePicker setDateUpdateHandler:](v2->_datePickerView, "setDateUpdateHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __51__FIUIHealthSettingsBirthDatePickerController_init__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dateOfBirthUpdateHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "dateOfBirthUpdateHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

    }
  }

}

- (void)setDateOfBirth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 4, -30, v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
  }
  v8 = v4;
  -[FIUIHealthSettingsDatePicker setDate:](self->_datePickerView, "setDate:", v4);

}

- (void)forceUpdate
{
  -[FIUIHealthSettingsDatePicker forceUpdate](self->_datePickerView, "forceUpdate");
}

- (FIUIHealthSettingsDatePicker)datePickerView
{
  return self->_datePickerView;
}

- (void)setDatePickerView:(id)a3
{
  objc_storeStrong((id *)&self->_datePickerView, a3);
}

- (id)dateOfBirthUpdateHandler
{
  return self->_dateOfBirthUpdateHandler;
}

- (void)setDateOfBirthUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateOfBirthUpdateHandler, 0);
  objc_storeStrong((id *)&self->_datePickerView, 0);
}

@end
