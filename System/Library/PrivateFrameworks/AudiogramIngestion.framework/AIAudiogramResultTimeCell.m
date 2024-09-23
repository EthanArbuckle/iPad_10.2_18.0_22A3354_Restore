@implementation AIAudiogramResultTimeCell

- (AIAudiogramResultTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramResultTimeCell *v4;
  AIAudiogramResultTimeCell *v5;
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
  id v17;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
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
  objc_super v51;
  _QWORD v52[4];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)AIAudiogramResultTimeCell;
  v4 = -[AIAudiogramResultTimeCell initWithStyle:reuseIdentifier:](&v51, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AIAudiogramResultTimeCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (void *)objc_opt_new();
    -[AIAudiogramResultTimeCell setTitleLabel:](v5, "setTitleLabel:", v6);

    aiLocString(CFSTR("AudiogramIngestionResultsTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell titleLabel](v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell titleLabel](v5, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    v13 = (void *)objc_opt_new();
    -[AIAudiogramResultTimeCell setTimePicker:](v5, "setTimePicker:", v13);

    -[AIAudiogramResultTimeCell timePicker](v5, "timePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDatePickerMode:", 0);

    -[AIAudiogramResultTimeCell timePicker](v5, "timePicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreferredDatePickerStyle:", 2);

    -[AIAudiogramResultTimeCell timePicker](v5, "timePicker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:forControlEvents:", v5, sel__datePickerValueChanged_, 4096);

    v17 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramResultTimeCell titleLabel](v5, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v18;
    -[AIAudiogramResultTimeCell timePicker](v5, "timePicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v20);
    -[AIAudiogramResultTimeCell setLabelStackView:](v5, "setLabelStackView:", v21);

    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAxis:", 0);

    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDistribution:", 0);

    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlignment:", 0);

    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramResultTimeCell contentView](v5, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

    v42 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell contentView](v5, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 16.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v46;
    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell contentView](v5, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v41, -16.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v40;
    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v29, 16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v30;
    -[AIAudiogramResultTimeCell labelStackView](v5, "labelStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultTimeCell contentView](v5, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, -16.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v36);

  }
  return v5;
}

- (void)configureLayout
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float Width;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultTimeCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultTimeCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v33 = *MEMORY[0x24BEBD270];
  v9 = v33;
  -[AIAudiogramResultTimeCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  Width = CGRectGetWidth(v35);

  v14 = (void *)MEMORY[0x24BDD1500];
  -[AIAudiogramResultTimeCell timePicker](self, "timePicker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringFromDate:dateStyle:timeStyle:", v16, 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramResultTimeCell frame](self, "frame");
  v19 = v18;
  v21 = v20;
  v31 = v9;
  -[AIAudiogramResultTimeCell titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 32, v24, 0, v19, v21);
  *(float *)&v19 = CGRectGetWidth(v36);

  -[AIAudiogramResultTimeCell frame](self, "frame");
  v25 = CGRectGetWidth(v37) * 0.7;
  -[AIAudiogramResultTimeCell labelStackView](self, "labelStackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25 >= (float)(Width + *(float *)&v19))
  {
    objc_msgSend(v26, "setAxis:", 0);

    -[AIAudiogramResultTimeCell timePicker](self, "timePicker");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = 5;
  }
  else
  {
    objc_msgSend(v26, "setAxis:", 1);

    -[AIAudiogramResultTimeCell timePicker](self, "timePicker");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = 4;
  }
  objc_msgSend(v28, "setContentHorizontalAlignment:", v30);

}

- (void)setDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramResultTimeCell timePicker](self, "timePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v4);

}

- (void)_datePickerValueChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AIAudiogramResultTimeCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeCellDidPickDate:", v5);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramResultTimeCell;
  return *MEMORY[0x24BEBDF00] | -[AIAudiogramResultTimeCell accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (AIAudiogramResultTimeCellDelegate)delegate
{
  return (AIAudiogramResultTimeCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_timePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
