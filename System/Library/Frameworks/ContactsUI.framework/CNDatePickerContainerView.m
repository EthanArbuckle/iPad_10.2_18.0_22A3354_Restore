@implementation CNDatePickerContainerView

- (CNDatePickerContainerView)initWithDatePicker:(id)a3
{
  id v5;
  CNDatePickerContainerView *v6;
  CNDatePickerContainerView *v7;
  id *p_datePicker;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNDatePickerContainerView *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNDatePickerContainerView;
  v6 = -[CNDatePickerContainerView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_datePicker = (id *)&v6->_datePicker;
    objc_storeStrong((id *)&v6->_datePicker, a3);
    objc_msgSend(*p_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNDatePickerContainerView addSubview:](v7, "addSubview:", *p_datePicker);
    objc_msgSend(*p_datePicker, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDatePickerContainerView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    objc_msgSend(*p_datePicker, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDatePickerContainerView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    objc_msgSend(*p_datePicker, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDatePickerContainerView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v28 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v12;
    objc_msgSend(*p_datePicker, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDatePickerContainerView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v28;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
    v18 = v7;

  }
  return v7;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
