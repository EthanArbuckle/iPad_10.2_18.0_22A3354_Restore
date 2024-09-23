@implementation AIAudiogramV2ResultDateCell

- (AIAudiogramV2ResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramV2ResultDateCell *v4;
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
  id v18;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[4];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)AIAudiogramV2ResultDateCell;
  v4 = -[AIAudiogramV2ResultDateCell initWithStyle:reuseIdentifier:](&v53, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[AIAudiogramV2ResultDateCell setTitleLabel:](v4, "setTitleLabel:", v5);

    aiLocString(CFSTR("AudiogramIngestionResultsDateV2"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell titleLabel](v4, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBE270]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell titleLabel](v4, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v12 = (void *)objc_opt_new();
    -[AIAudiogramV2ResultDateCell setDatePicker:](v4, "setDatePicker:", v12);

    -[AIAudiogramV2ResultDateCell datePicker](v4, "datePicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDatePickerMode:", 1);

    -[AIAudiogramV2ResultDateCell datePicker](v4, "datePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredDatePickerStyle:", 2);

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell datePicker](v4, "datePicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaximumDate:", v15);

    -[AIAudiogramV2ResultDateCell datePicker](v4, "datePicker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v4, sel__datePickerValueChanged_, 4096);

    v18 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramV2ResultDateCell titleLabel](v4, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v19;
    v20 = (void *)objc_opt_new();
    v55[1] = v20;
    -[AIAudiogramV2ResultDateCell datePicker](v4, "datePicker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithArrangedSubviews:", v22);
    -[AIAudiogramV2ResultDateCell setContentStackView:](v4, "setContentStackView:", v23);

    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAxis:", 0);

    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDistribution:", 0);

    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlignment:", 0);

    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramV2ResultDateCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v29);

    v44 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell contentView](v4, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 16.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v48;
    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v43, -10.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v42;
    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell contentView](v4, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v31, 5.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v32;
    -[AIAudiogramV2ResultDateCell contentStackView](v4, "contentStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramV2ResultDateCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -5.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v38);

  }
  return v4;
}

- (void)setDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramV2ResultDateCell datePicker](self, "datePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v4);

}

- (void)_datePickerValueChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AIAudiogramV2ResultDateCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateCellDidPickDate:", v5);
}

- (void)configureLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  CGRect v22;

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramV2ResultDateCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramV2ResultDateCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v20 = *MEMORY[0x24BEBD270];
  -[AIAudiogramV2ResultDateCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v11, 0, v6, v8);
  *(float *)&v6 = CGRectGetWidth(v22);

  -[AIAudiogramV2ResultDateCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13 * 0.4;

  -[AIAudiogramV2ResultDateCell contentStackView](self, "contentStackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 >= *(float *)&v6)
  {
    objc_msgSend(v15, "setAxis:", 0);

    -[AIAudiogramV2ResultDateCell contentStackView](self, "contentStackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0;
  }
  else
  {
    objc_msgSend(v15, "setAxis:", 1);

    -[AIAudiogramV2ResultDateCell contentStackView](self, "contentStackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 1;
  }
  objc_msgSend(v17, "setAlignment:", v19);

}

- (BOOL)isAccessibilityElement
{
  return AXRequestingClient() == 3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AIAudiogramV2ResultDateCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1500];
  -[AIAudiogramV2ResultDateCell datePicker](self, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromDate:dateStyle:timeStyle:", v4, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  -[AIAudiogramV2ResultDateCell datePicker](self, "datePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityActivate");

  if ((v6 & 1) != 0)
    return 1;
  v8.receiver = self;
  v8.super_class = (Class)AIAudiogramV2ResultDateCell;
  return -[AIAudiogramV2ResultDateCell accessibilityActivate](&v8, sel_accessibilityActivate);
}

- (AIAudiogramResultDateCellDelegate)delegate
{
  return (AIAudiogramResultDateCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
