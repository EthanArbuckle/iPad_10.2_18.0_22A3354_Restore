@implementation HUWheelControlView

- (HUWheelControlView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUWheelControlView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)HUWheelControlView;
  v7 = -[HUWheelControlView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA838]), "initWithFrame:", x, y, width, height);
    -[HUWheelControlView setPickerView:](v7, "setPickerView:", v8);

    -[HUWheelControlView pickerView](v7, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUWheelControlView pickerView](v7, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v7);

    -[HUWheelControlView pickerView](v7, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDataSource:", v7);

    -[HUWheelControlView addSubview:](v7, "addSubview:", v7->_pickerView);
    -[HUWheelControlView setLayoutMargins:](v7, "setLayoutMargins:", 4.0, 4.0, 4.0, 4.0);
    -[HUWheelControlView _setupConstraints](v7, "_setupConstraints");
    -[HUWheelControlView pickerView](v7, "pickerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", 0);

  }
  return v7;
}

- (void)setValueFormatter:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSFormatter isEqual:](self->_valueFormatter, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFormatter, a3);
    -[HUWheelControlView pickerView](self, "pickerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadComponent:", 0);

  }
}

- (void)setValues:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_values, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_values, a3);
    -[HUWheelControlView _generateWheelValues](self, "_generateWheelValues");
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUWheelControlView wheelValues](self, "wheelValues", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;

  -[HUWheelControlView wheelValues](self, "wheelValues", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWheelControlView _formatValue:](self, "_formatValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUWheelControlView delegate](self, "delegate", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controlViewDidBeginUserInteraction:", self);

  -[HUWheelControlView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlView:valueDidChange:", self, v8);

  -[HUWheelControlView wheelDelegate](self, "wheelDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wheelControlView:didUpdateValue:", self, v10);

  -[HUWheelControlView delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "controlViewDidEndUserInteraction:", self);

}

- (void)setCustomValues:(id)a3
{
  objc_storeStrong((id *)&self->_customValues, a3);
  -[HUWheelControlView _generateWheelValues](self, "_generateWheelValues");
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[HUWheelControlView pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRowInComponent:", 0);

  -[HUWheelControlView wheelValues](self, "wheelValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUWheelControlView wheelValues](self, "wheelValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6;
  -[HUWheelControlView pickerView](self, "pickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectRow:inComponent:animated:", v7, 0, 1);

  -[HUWheelControlView wheelDelegate](self, "wheelDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wheelControlView:didUpdateValue:", self, v4);

  -[HUWheelControlView _updateUIToReachable](self, "_updateUIToReachable");
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUWheelControlView pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled") ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  v5 = !a3;
  -[HUWheelControlView pickerView](self, "pickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v5);

  if (v3)
    v7 = 0.25;
  else
    v7 = 1.0;
  -[HUWheelControlView pickerView](self, "pickerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)_generateWheelValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HUWheelControlView values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUWheelControlView customValues](self, "customValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[HUWheelControlView customValues](self, "customValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v8);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("doubleValue"), 1);
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView setWheelValues:](self, "setWheelValues:", v11);

  -[HUWheelControlView pickerView](self, "pickerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadComponent:", 0);

}

- (void)_setupConstraints
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
  id v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView pickerView](self, "pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView layoutMarginsGuide](self, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v7);

  -[HUWheelControlView pickerView](self, "pickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView layoutMarginsGuide](self, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v12);

  -[HUWheelControlView pickerView](self, "pickerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v17);

  -[HUWheelControlView layoutMarginsGuide](self, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWheelControlView pickerView](self, "pickerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
}

- (id)_formatValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUWheelControlView valueFormatter](self, "valueFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForObjectValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateUIToReachable
{
  id v2;

  -[HUWheelControlView pickerView](self, "pickerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canBeHighlighted
{
  return self->_canBeHighlighted;
}

- (void)setCanBeHighlighted:(BOOL)a3
{
  self->_canBeHighlighted = a3;
}

- (HUWheelControlViewDelegate)wheelDelegate
{
  return (HUWheelControlViewDelegate *)objc_loadWeakRetained((id *)&self->_wheelDelegate);
}

- (void)setWheelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wheelDelegate, a3);
}

- (NSArray)values
{
  return self->_values;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (NSSet)customValues
{
  return self->_customValues;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (NSArray)wheelValues
{
  return self->_wheelValues;
}

- (void)setWheelValues:(id)a3
{
  objc_storeStrong((id *)&self->_wheelValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelValues, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_customValues, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_wheelDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
