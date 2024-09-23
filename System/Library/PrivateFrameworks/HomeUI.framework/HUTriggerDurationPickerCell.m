@implementation HUTriggerDurationPickerCell

- (HUTriggerDurationPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUTriggerDurationPickerCell *v4;
  uint64_t v5;
  HUTriggerDurationPickerValue *currentDurationValue;
  id v7;
  uint64_t v8;
  UIPickerView *pickerView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)HUTriggerDurationPickerCell;
  v4 = -[HUTriggerDurationPickerCell initWithStyle:reuseIdentifier:](&v33, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    +[HUTriggerDurationPickerValue valueWithNoDuration](HUTriggerDurationPickerValue, "valueWithNoDuration");
    v5 = objc_claimAutoreleasedReturnValue();
    currentDurationValue = v4->_currentDurationValue;
    v4->_currentDurationValue = (HUTriggerDurationPickerValue *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CEA838]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    pickerView = v4->_pickerView;
    v4->_pickerView = (UIPickerView *)v8;

    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:", v4);

    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v4);

    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUTriggerDurationPickerCell _updateDurationOptions](v4, "_updateDurationOptions");
    -[HUTriggerDurationPickerCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v25);

    -[HUTriggerDurationPickerCell pickerView](v4, "pickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v31);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  }
  return v4;
}

- (id)pickerDurationValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HUTriggerDurationPickerCell pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  if (v4 == -1)
  {
    +[HUTriggerDurationPickerValue valueWithNoDuration](HUTriggerDurationPickerValue, "valueWithNoDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUTriggerDurationPickerCell durationOptions](self, "durationOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSNumber)currentDuration
{
  void *v2;
  void *v3;

  -[HUTriggerDurationPickerCell currentDurationValue](self, "currentDurationValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCurrentDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  HUTriggerDurationPickerValue *v9;
  id v10;

  v4 = a3;
  -[HUTriggerDurationPickerCell currentDurationValue](self, "currentDurationValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    v9 = -[HUTriggerDurationPickerValue initWithDuration:]([HUTriggerDurationPickerValue alloc], "initWithDuration:", v10);
    -[HUTriggerDurationPickerCell setCurrentDurationValue:](self, "setCurrentDurationValue:", v9);

    -[HUTriggerDurationPickerCell _updateDurationOptions](self, "_updateDurationOptions");
  }
LABEL_8:

}

+ (id)_defaultDurationOptions
{
  if (_MergedGlobals_1_6 != -1)
    dispatch_once(&_MergedGlobals_1_6, &__block_literal_global_230);
  return (id)qword_1ED57FAE0;
}

void __54__HUTriggerDurationPickerCell__defaultDurationOptions__block_invoke()
{
  void *v0;
  unint64_t i;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HUTriggerDurationPickerValue valueWithNoDuration](HUTriggerDurationPickerValue, "valueWithNoDuration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v0);

  for (i = 1; i < 0xF1; i += v3)
  {
    +[HUTriggerDurationPickerValue valueWithDuration:](HUTriggerDurationPickerValue, "valueWithDuration:", (double)(uint64_t)i * 60.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v2);

    if (i < 5)
      v3 = 1;
    else
      v3 = 5;
    if (i >= 0x3C)
      v3 = 60;
  }
  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)qword_1ED57FAE0;
  qword_1ED57FAE0 = v4;

}

- (void)_updateDurationOptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  objc_msgSend((id)objc_opt_class(), "_defaultDurationOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[HUTriggerDurationPickerCell currentDurationValue](self, "currentDurationValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke;
  v14 = &unk_1E6F5C238;
  v6 = v5;
  v15 = v6;
  v17 = &v19;
  v18 = &v23;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v11);
  if (!*((_BYTE *)v20 + 24))
  {
    objc_msgSend(v7, "addObject:", v6, v11, v12, v13, v14, v15);
    v8 = objc_msgSend(v7, "count") - 1;
    v24[3] = v8;
  }
  -[HUTriggerDurationPickerCell setDurationOptions:](self, "setDurationOptions:", v7, v11, v12, v13, v14);
  -[HUTriggerDurationPickerCell pickerView](self, "pickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadAllComponents");

  -[HUTriggerDurationPickerCell pickerView](self, "pickerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectRow:inComponent:animated:", v24[3], 0, 0);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

void __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[6];

  v7 = a2;
  objc_msgSend(v7, "duration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2;
  v13[3] = &unk_1E6F543A8;
  v10 = *(id *)(a1 + 32);
  v13[4] = v10;
  v12 = v7;
  v13[5] = v12;
  if (v8)
    v11 = -1;
  else
    v11 = v9 != 0;
  if (v8 && v9)
    v11 = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2((uint64_t)v13);

  if (v11 == -1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), a3);
    goto LABEL_11;
  }
  if (!v11)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }

}

uint64_t __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "duration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3);

  return v4;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUTriggerDurationPickerCell durationOptions](self, "durationOptions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CBA4D0];
  -[HUTriggerDurationPickerCell durationOptions](self, "durationOptions", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_naturalLanguageTurnOffAfterDuration:style:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[HUTriggerDurationPickerCell pickerDurationValue](self, "pickerDurationValue", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerDurationPickerCell setCurrentDurationValue:](self, "setCurrentDurationValue:", v6);

  -[HUTriggerDurationPickerCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUTriggerDurationPickerCell delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HUTriggerDurationPickerCell currentDuration](self, "currentDuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "durationPicker:didSelectDuration:", self, v9);

  }
}

- (HUTriggerDurationPickerDelegate)delegate
{
  return (HUTriggerDurationPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (NSArray)durationOptions
{
  return self->_durationOptions;
}

- (void)setDurationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_durationOptions, a3);
}

- (HUTriggerDurationPickerValue)currentDurationValue
{
  return self->_currentDurationValue;
}

- (void)setCurrentDurationValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentDurationValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDurationValue, 0);
  objc_storeStrong((id *)&self->_durationOptions, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
