@implementation AIAudiogramResultDateCell

- (AIAudiogramResultDateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramResultDateCell *v4;
  AIAudiogramResultDateCell *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  objc_super v85;
  _QWORD v86[6];
  _QWORD v87[2];
  _QWORD v88[4];

  v88[2] = *MEMORY[0x24BDAC8D0];
  v85.receiver = self;
  v85.super_class = (Class)AIAudiogramResultDateCell;
  v4 = -[AIAudiogramResultDateCell initWithStyle:reuseIdentifier:](&v85, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultDateCell semanticContentAttribute](v4, "semanticContentAttribute")) != 1;
    v7 = (void *)objc_opt_new();
    -[AIAudiogramResultDateCell setTitleLabel:](v5, "setTitleLabel:", v7);

    aiLocString(CFSTR("AudiogramIngestionResultsDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell titleLabel](v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell titleLabel](v5, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

    v12 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell titleLabel](v5, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    v15 = (void *)objc_opt_new();
    -[AIAudiogramResultDateCell setValueLabel:](v5, "setValueLabel:", v15);

    -[AIAudiogramResultDateCell valueLabel](v5, "valueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 2 * v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell valueLabel](v5, "valueLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell valueLabel](v5, "valueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    v21 = objc_alloc(MEMORY[0x24BEBD978]);
    -[AIAudiogramResultDateCell titleLabel](v5, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v22;
    -[AIAudiogramResultDateCell valueLabel](v5, "valueLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "initWithArrangedSubviews:", v24);
    -[AIAudiogramResultDateCell setLabelStackView:](v5, "setLabelStackView:", v25);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAxis:", 0);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDistribution:", 0);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlignment:", 0);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

    v32 = (void *)objc_opt_new();
    -[AIAudiogramResultDateCell setDatePicker:](v5, "setDatePicker:", v32);

    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDatePickerMode:", 1);

    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPreferredDatePickerStyle:", 3);

    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidden:", 1);

    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addTarget:action:forControlEvents:", v5, sel__datePickerValueChanged_, 4096);

    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v39);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, -16.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell setCollapsedConstraint:](v5, "setCollapsedConstraint:", v44);

    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v46, -16.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v47;
    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, -16.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v52;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell setExpandedConstraints:](v5, "setExpandedConstraints:", v53);

    v71 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, 16.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v78;
    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, -16.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v73;
    -[AIAudiogramResultDateCell labelStackView](v5, "labelStackView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, 16.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v67;
    -[AIAudiogramResultDateCell collapsedConstraint](v5, "collapsedConstraint");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v66;
    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v55, 16.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v86[4] = v56;
    -[AIAudiogramResultDateCell datePicker](v5, "datePicker");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultDateCell contentView](v5, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v60, -16.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v86[5] = v61;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 6);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "activateConstraints:", v62);

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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultDateCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultDateCell frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v32 = *MEMORY[0x24BEBD270];
  v9 = v32;
  -[AIAudiogramResultDateCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 32, v12, 0, v6, v8);
  Width = CGRectGetWidth(v34);

  -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultDateCell frame](self, "frame");
  v17 = v16;
  v19 = v18;
  v30 = v9;
  -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 32, v22, 0, v17, v19);
  *(float *)&v17 = CGRectGetWidth(v35);

  -[AIAudiogramResultDateCell frame](self, "frame");
  v23 = CGRectGetWidth(v36) * 0.9;
  -[AIAudiogramResultDateCell labelStackView](self, "labelStackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 >= (float)(Width + *(float *)&v17))
  {
    objc_msgSend(v24, "setAxis:", 0);

    v29 = 2
        * (objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AIAudiogramResultDateCell semanticContentAttribute](self, "semanticContentAttribute")) != 1);
    -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = v29;
  }
  else
  {
    objc_msgSend(v24, "setAxis:", 1);

    -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 4;
  }
  objc_msgSend(v26, "setTextAlignment:", v28);

}

- (void)setDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AIAudiogramResultDateCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v4);

  v6 = (void *)MEMORY[0x24BDD1500];
  -[AIAudiogramResultDateCell datePicker](self, "datePicker");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

- (void)showActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultDateCell datePicker](self, "datePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 == v3)
  {
    -[AIAudiogramResultDateCell datePicker](self, "datePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3 ^ 1);

    -[AIAudiogramResultDateCell collapsedConstraint](self, "collapsedConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", v3 ^ 1);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[AIAudiogramResultDateCell expandedConstraints](self, "expandedConstraints", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setActive:", v3);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_datePickerValueChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD1500];
  v5 = a3;
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v6, 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultDateCell valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[AIAudiogramResultDateCell delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateCellDidPickDate:", v9);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramResultDateCell;
  return *MEMORY[0x24BEBDF00] | -[AIAudiogramResultDateCell accessibilityTraits](&v3, sel_accessibilityTraits);
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

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
  objc_storeStrong((id *)&self->_datePicker, a3);
}

- (NSLayoutConstraint)collapsedConstraint
{
  return self->_collapsedConstraint;
}

- (void)setCollapsedConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedConstraint, a3);
}

- (NSArray)expandedConstraints
{
  return self->_expandedConstraints;
}

- (void)setExpandedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_expandedConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedConstraints, 0);
  objc_storeStrong((id *)&self->_collapsedConstraint, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
