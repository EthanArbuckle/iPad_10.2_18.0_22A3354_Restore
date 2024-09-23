@implementation HUTimerIntervalPickerView

- (HUTimerIntervalPickerView)initWithFrame:(CGRect)a3
{
  HUTimerIntervalPickerView *v3;
  uint64_t v4;
  UIPickerView *timePicker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTimerIntervalPickerView;
  v3 = -[HUTimerIntervalPickerView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 180.0, 216.0);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA838]), "initWithFrame:", 0.0, 0.0, 180.0, 216.0);
    timePicker = v3->_timePicker;
    v3->_timePicker = (UIPickerView *)v4;

    -[UIPickerView setDataSource:](v3->_timePicker, "setDataSource:", v3);
    -[UIPickerView setDelegate:](v3->_timePicker, "setDelegate:", v3);
    -[HUTimerIntervalPickerView addSubview:](v3, "addSubview:", v3->_timePicker);
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTimerIntervalPickerView;
  -[HUTimerIntervalPickerView updateConstraints](&v6, sel_updateConstraints);
  v3 = (void *)MEMORY[0x1E0CB3718];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__HUTimerIntervalPickerView_updateConstraints__block_invoke;
  v5[3] = &unk_1E6F4D6C0;
  v5[4] = self;
  __46__HUTimerIntervalPickerView_updateConstraints__block_invoke((uint64_t)v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v4);

}

id __46__HUTimerIntervalPickerView_updateConstraints__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  objc_msgSend(*(id *)(a1 + 32), "timePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "timePicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "timePicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  objc_msgSend(*(id *)(a1 + 32), "timePicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  objc_msgSend(*(id *)(a1 + 32), "timePicker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTimerIntervalPickerView;
  -[HUTimerIntervalPickerView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUTimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4;

  v4 = 60;
  if ((unint64_t)a4 >= 3)
    v4 = 0;
  if (a4)
    return v4;
  else
    return 24;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9;
  HUTimerIntervalPickerCell *v10;
  HUTimerIntervalPickerCell *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (HUTimerIntervalPickerCell *)v9;
  else
    v10 = objc_alloc_init(HUTimerIntervalPickerCell);
  v11 = v10;
  v12 = 2
      * (-[HUTimerIntervalPickerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
  -[HUTimerIntervalPickerCell textLabel](v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextAlignment:", v12);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 22.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerIntervalPickerCell textLabel](v11, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[HUTimerIntervalPickerView pickerView:widthForComponent:](self, "pickerView:widthForComponent:", self->_timePicker, a5);
  v17 = v16;
  -[HUTimerIntervalPickerView pickerView:rowHeightForComponent:](self, "pickerView:rowHeightForComponent:", self->_timePicker, a5);
  -[HUTimerIntervalPickerCell setFrame:](v11, "setFrame:", 0.0, 0.0, v17, v18);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringFromNumber:numberStyle:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB3498]);
  v28 = *MEMORY[0x1E0CEA0A0];
  v29[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", v22, v24);

  -[HUTimerIntervalPickerCell textLabel](v11, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAttributedText:", v25);

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  -[HUTimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1, a4, a5);
  -[HUTimerIntervalPickerView delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HUTimerIntervalPickerView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[HUTimerIntervalPickerView delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[HUTimerIntervalPickerView selectedDuration](self, "selectedDuration");
      objc_msgSend(v10, "pickerView:didChangeSelectedDuration:", self);

    }
  }
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double v4;

  objc_msgSend(a3, "bounds");
  return v4 / 3.0 + -10.0;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 32.0;
}

- (void)_updateLabels:(BOOL)a3
{
  _BOOL8 v3;
  NSInteger v5;
  NSInteger v6;
  NSInteger v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v5 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 0);
  v6 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 1);
  v7 = -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 2);
  -[HUTimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 0, v8, v3);

  -[HUTimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 1, v9, v3);

  -[HUTimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimerIntervalPickerView _fadeLabelForComponent:toText:animated:](self, "_fadeLabelForComponent:toText:animated:", 2, v10, v3);

}

- (id)_makeNewComponentLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 4);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  UILabel **p_secondsLabel;
  UILabel *secondsLabel;
  BOOL v7;
  void *v8;
  HUTimerIntervalPickerView *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  UILabel *v13;

  if (a3 == 2)
  {
    p_secondsLabel = &self->_secondsLabel;
    secondsLabel = self->_secondsLabel;
    if (secondsLabel)
      v11 = 1;
    else
      v11 = !a4;
    if (v11)
      goto LABEL_20;
    -[HUTimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self;
    v10 = 2;
    goto LABEL_19;
  }
  if (a3 == 1)
  {
    p_secondsLabel = &self->_minutesLabel;
    secondsLabel = self->_minutesLabel;
    if (secondsLabel)
      v12 = 1;
    else
      v12 = !a4;
    if (v12)
      goto LABEL_20;
    -[HUTimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self;
    v10 = 1;
    goto LABEL_19;
  }
  if (a3)
  {
    v13 = 0;
    return v13;
  }
  p_secondsLabel = &self->_hoursLabel;
  secondsLabel = self->_hoursLabel;
  if (secondsLabel)
    v7 = 1;
  else
    v7 = !a4;
  if (!v7)
  {
    -[HUTimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self;
    v10 = 0;
LABEL_19:
    -[HUTimerIntervalPickerView _fadeLabelForComponent:toText:animated:](v9, "_fadeLabelForComponent:toText:animated:", v10, v8, 0);

    secondsLabel = *p_secondsLabel;
  }
LABEL_20:
  v13 = secondsLabel;
  return v13;
}

- (void)_setLabel:(id)a3 forComponent:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if ((unint64_t)a4 <= 2)
  {
    v8 = v7;
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *off_1E6F4F200[a4]), a3);
    v7 = v8;
  }

}

- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[HUTimerIntervalPickerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[UIPickerView _contentSizeForRow:inComponent:](self->_timePicker, "_contentSizeForRow:inComponent:", 0, a4);
  if (a4 == 2)
  {
    v10 = v8 * 2.0 + 18.0;
    v11 = v8 * 2.0 + 23.0;
    if (v7 == 1)
      v11 = v10;
    v8 = v11 + 26.0;
    v12 = 9.0;
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    v13 = 7.0;
    if (v7 == 1)
      v13 = 4.0;
    v14 = v13 + v8;
    v12 = 9.0;
    v8 = v14 + 9.0 + 26.0;
LABEL_11:
    v9 = v8 + v12;
    goto LABEL_12;
  }
  v9 = 9.0;
  if (!a4)
    v9 = dbl_1B94420F0[v7 == 1];
LABEL_12:
  LODWORD(v8) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v15);
  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView leadingAnchor](self->_timePicker, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, v9 + 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(v6, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPickerView centerYAnchor](self->_timePicker, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v23);

}

- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a5;
  v8 = a4;
  -[HUTimerIntervalPickerView _labelForComponent:createIfNecessary:](self, "_labelForComponent:createIfNecessary:", a3, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v8);

  v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      -[HUTimerIntervalPickerView _makeNewComponentLabel](self, "_makeNewComponentLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setText:", v8);
      -[HUTimerIntervalPickerView addSubview:](self, "addSubview:", v13);
      -[HUTimerIntervalPickerView _positionLabel:forComponent:](self, "_positionLabel:forComponent:", v13, a3);
      objc_msgSend(v13, "setAlpha:", 0.0);
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v15 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke;
      v21[3] = &unk_1E6F4D988;
      v22 = v9;
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_2;
      v19[3] = &unk_1E6F4E300;
      v20 = v22;
      objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 0x10000, v21, v19, 0.2, 0.0);
      v16 = (void *)MEMORY[0x1E0CEABB0];
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_3;
      v17[3] = &unk_1E6F4D988;
      v12 = v13;
      v18 = v12;
      objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 0x20000, v17, 0, 0.2, 0.0);

    }
    else
    {
      v12 = v9;
      if (!v9)
      {
        -[HUTimerIntervalPickerView _makeNewComponentLabel](self, "_makeNewComponentLabel");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[HUTimerIntervalPickerView addSubview:](self, "addSubview:", v12);
      }
      objc_msgSend(v12, "setText:", v8);
      -[HUTimerIntervalPickerView _positionLabel:forComponent:](self, "_positionLabel:forComponent:", v12, a3);
    }
  }
  -[HUTimerIntervalPickerView _setLabel:forComponent:](self, "_setLabel:forComponent:", v12, a3);

}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setDuration:(double)a3
{
  -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (uint64_t)(a3 / 3600.0), 0, 0);
  -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (int)(((__int16)((34953 * ((int)(uint64_t)a3 % 3600)) >> 16) >> 5)+ ((((int)(uint64_t)a3 % 3600 + ((-30583 * ((int)(uint64_t)a3 % 3600)) >> 16)) & 0x8000) >> 15)), 1, 0);
  -[UIPickerView selectRow:inComponent:animated:](self->_timePicker, "selectRow:inComponent:animated:", (uint64_t)a3 % 60, 2, 0);
  -[HUTimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1);
}

- (double)selectedDuration
{
  double v3;
  double v4;

  v3 = (double)(3600 * -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 0));
  v4 = v3 + (double)(60 * -[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 1));
  return v4 + (double)-[UIPickerView selectedRowInComponent:](self->_timePicker, "selectedRowInComponent:", 2);
}

- (id)_hoursStringForHour:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  if (a3 == 1)
  {
    v3 = CFSTR("HUHourSingular");
    v4 = CFSTR("HUHourSingular");
  }
  else
  {
    if (a3)
      v3 = CFSTR("HUHourPlural");
    else
      v3 = CFSTR("HUHourZero");
    v4 = v3;
    LODWORD(a3) = 1;
  }
  _HULocalizedStringWithDefaultValue(v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_minutesStringForMinutes:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  if (a3 == 1)
  {
    v3 = CFSTR("HUMinSingular");
    v4 = CFSTR("HUMinSingular");
  }
  else
  {
    if (a3)
      v3 = CFSTR("HUMinPlural");
    else
      v3 = CFSTR("HUMinZero");
    v4 = v3;
    LODWORD(a3) = 1;
  }
  _HULocalizedStringWithDefaultValue(v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondsStringForSeconds:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  if (a3 == 1)
  {
    v3 = CFSTR("HUSecSingular");
    v4 = CFSTR("HUSecSingular");
  }
  else
  {
    if (a3)
      v3 = CFSTR("HUSecPlural");
    else
      v3 = CFSTR("HUSecZero");
    v4 = v3;
    LODWORD(a3) = 1;
  }
  _HULocalizedStringWithDefaultValue(v3, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HUTimerIntervalPickerViewDelegate)delegate
{
  return (HUTimerIntervalPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPickerView)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_timePicker, a3);
}

- (UILabel)hoursLabel
{
  return self->_hoursLabel;
}

- (void)setHoursLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hoursLabel, a3);
}

- (UILabel)minutesLabel
{
  return self->_minutesLabel;
}

- (void)setMinutesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_minutesLabel, a3);
}

- (UILabel)secondsLabel
{
  return self->_secondsLabel;
}

- (void)setSecondsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondsLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_storeStrong((id *)&self->_minutesLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
