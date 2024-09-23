@implementation WKDatePickerPopoverView

- (WKDatePickerPopoverView)initWithDatePicker:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  WKDatePickerPopoverView *v8;
  uint64_t v9;
  uint64_t v10;
  void *m_ptr;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id *p_m_ptr;
  id *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PAL *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int IsVision;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  objc_super v37;
  _QWORD v38[16];

  v38[15] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v37.receiver = self;
  v37.super_class = (Class)WKDatePickerPopoverView;
  v8 = -[WKDatePickerPopoverView initWithFrame:](&v37, sel_initWithFrame_, v4, v5, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v9);
    m_ptr = v8->_backgroundView.m_ptr;
    v8->_backgroundView.m_ptr = (void *)v10;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_storeWeak((id *)&v8->_datePicker, a3);
    v12 = objc_opt_new();
    v13 = v8->_accessoryView.m_ptr;
    v8->_accessoryView.m_ptr = (void *)v12;
    if (v13)
      CFRelease(v13);
    objc_msgSend(v8->_backgroundView.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKDatePickerPopoverView addSubview:](v8, "addSubview:", v8->_backgroundView.m_ptr);
    objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
    objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "sizeToFit");
    objc_msgSend((id)objc_msgSend(v8->_backgroundView.m_ptr, "contentView"), "addSubview:", objc_loadWeak((id *)&v8->_datePicker));
    objc_msgSend(v8->_accessoryView.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = v8->_accessoryView.m_ptr;
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setBackgroundEffect:", 0);
    objc_msgSend(v14, "setStandardAppearance:", (id)CFMakeCollectable(v15));
    p_m_ptr = &v8->_accessoryView.m_ptr;
    objc_msgSend(v8->_accessoryView.m_ptr, "sizeToFit");
    v17 = &v8->_backgroundView.m_ptr;
    objc_msgSend((id)objc_msgSend(v8->_backgroundView.m_ptr, "contentView"), "addSubview:", v8->_accessoryView.m_ptr);
    if (objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "datePickerMode") == 2)
      v18 = 8.0;
    else
      v18 = 2.0;
    objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "bounds");
    v20 = v19;
    v22 = v21;
    v23 = (PAL *)objc_msgSend(*p_m_ptr, "bounds");
    v26 = v25;
    if (v20 >= v24)
      v27 = v20;
    else
      v27 = v24;
    v8->_contentSize.width = v27 + 32.0;
    v8->_contentSize.height = v18 + 32.0 + v22 + v25;
    IsVision = PAL::currentUserInterfaceIdiomIsVision(v23);
    v29 = (void *)MEMORY[0x1E0CB3718];
    v38[0] = objc_msgSend((id)-[WKDatePickerPopoverView widthAnchor](v8, "widthAnchor"), "constraintEqualToConstant:", v8->_contentSize.width);
    v38[1] = objc_msgSend((id)-[WKDatePickerPopoverView heightAnchor](v8, "heightAnchor"), "constraintEqualToConstant:", v8->_contentSize.height);
    v38[2] = objc_msgSend((id)objc_msgSend(*v17, "leadingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView leadingAnchor](v8, "leadingAnchor"));
    v38[3] = objc_msgSend((id)objc_msgSend(*v17, "trailingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView trailingAnchor](v8, "trailingAnchor"));
    v38[4] = objc_msgSend((id)objc_msgSend(*v17, "topAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView topAnchor](v8, "topAnchor"));
    v38[5] = objc_msgSend((id)objc_msgSend(*v17, "bottomAnchor"), "constraintEqualToAnchor:constant:", -[WKDatePickerPopoverView bottomAnchor](v8, "bottomAnchor"), -v18);
    v38[6] = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "heightAnchor"), "constraintEqualToConstant:", v22);
    v38[7] = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "leadingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView leadingAnchor](v8, "leadingAnchor"));
    v38[8] = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "trailingAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView trailingAnchor](v8, "trailingAnchor"));
    v38[9] = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "topAnchor"), "constraintEqualToAnchor:", -[WKDatePickerPopoverView topAnchor](v8, "topAnchor"));
    v38[10] = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&v8->_datePicker), "bottomAnchor"), "constraintEqualToSystemSpacingBelowAnchor:multiplier:", objc_msgSend(*p_m_ptr, "topAnchor"), 1.0);
    v30 = (void *)objc_msgSend(*p_m_ptr, "leadingAnchor");
    v31 = -[WKDatePickerPopoverView leadingAnchor](v8, "leadingAnchor");
    v32 = 0.0;
    if (IsVision)
      v32 = 16.0;
    v38[11] = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v32);
    v33 = (void *)objc_msgSend(*p_m_ptr, "trailingAnchor");
    v34 = -[WKDatePickerPopoverView trailingAnchor](v8, "trailingAnchor");
    v35 = 0.0;
    if (IsVision)
      v35 = -16.0;
    v38[12] = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v35);
    v38[13] = objc_msgSend((id)objc_msgSend(*p_m_ptr, "heightAnchor"), "constraintEqualToConstant:", v26);
    v38[14] = objc_msgSend((id)objc_msgSend(*p_m_ptr, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(*v17, "bottomAnchor"));
    objc_msgSend(v29, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 15));
  }
  return v8;
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_loadWeak((id *)&self->_datePicker);
}

- (UIToolbar)accessoryView
{
  return (UIToolbar *)self->_accessoryView.m_ptr;
}

- (CGSize)estimatedMaximumPopoverSize
{
  double width;
  double v3;
  CGSize result;

  width = self->_contentSize.width;
  v3 = self->_contentSize.height + 80.0;
  result.height = v3;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_accessoryView.m_ptr;
  self->_accessoryView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak((id *)&self->_datePicker);
  v4 = self->_backgroundView.m_ptr;
  self->_backgroundView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 54) = 0;
  return self;
}

@end
