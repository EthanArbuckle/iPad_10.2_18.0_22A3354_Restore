@implementation HUSliderValueTableViewCell

- (HUSliderValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUSliderValueTableViewCell *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUSliderValueTableViewCell;
  v4 = -[HUSliderValueTableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEA9B0]);
    -[HUSliderValueTableViewCell setSlider:](v4, "setSlider:", v5);

    -[HUSliderValueTableViewCell slider](v4, "slider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 0;
    objc_msgSend(v6, "setMinimumValue:", v7);

    -[HUSliderValueTableViewCell slider](v4, "slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1120403456;
    objc_msgSend(v8, "setMaximumValue:", v9);

    -[HUSliderValueTableViewCell slider](v4, "slider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSliderValueTableViewCell slider](v4, "slider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v4, sel__sliderChanged_, 4096);

    -[HUSliderValueTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell slider](v4, "slider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUSliderValueTableViewCell setValueLabel:](v4, "setValueLabel:", v14);

    -[HUSliderValueTableViewCell valueLabel](v4, "valueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSliderValueTableViewCell setValue:](v4, "setValue:", 0.0);
    -[HUSliderValueTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell valueLabel](v4, "valueLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    -[HUSliderValueTableViewCell textLabel](v4, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSliderValueTableViewCell textLabel](v4, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[HUSliderValueTableViewCell setShowValue:](v4, "setShowValue:", 1);
  }
  return v4;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUSliderValueTableViewCell;
  -[HUSliderValueTableViewCell didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[HUSliderValueTableViewCell _setupAutoLayoutConstraints](self, "_setupAutoLayoutConstraints");
}

- (void)setContinuous:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContinuous:", v3);

}

- (BOOL)isContinuous
{
  void *v2;
  char v3;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContinuous");

  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSliderValueTableViewCell;
  -[HUSliderValueTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUSliderValueTableViewCell setShowValue:](self, "setShowValue:", 1);
  -[HUSliderValueTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[HUSliderValueTableViewCell setUseLargeCell:](self, "setUseLargeCell:", 0);
}

- (double)minimumValue
{
  void *v2;
  float v3;
  double v4;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumValue");
  v4 = v3;

  return v4;
}

- (void)setMinimumValue:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setMinimumValue:", v4);

}

- (double)maximumValue
{
  void *v2;
  float v3;
  double v4;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValue");
  v4 = v3;

  return v4;
}

- (void)setMaximumValue:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setMaximumValue:", v4);

}

- (double)value
{
  void *v2;
  float v3;
  double v4;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (void)setValue:(double)a3
{
  float v5;
  void *v6;
  double v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setValue:", v7);

  -[HUSliderValueTableViewCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUSliderValueTableViewCell delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueDescriptionForItem:value:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v13);
  }

}

- (void)setTitle:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[HUSliderValueTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HUSliderValueTableViewCell textLabel](self, "textLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)_sliderChanged:(id)a3
{
  void *v4;
  float v5;
  id v6;

  -[HUSliderValueTableViewCell slider](self, "slider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  -[HUSliderValueTableViewCell setValue:](self, "setValue:", v5);

  -[HUSliderValueTableViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell value](self, "value");
  objc_msgSend(v6, "sliderValueTableViewCell:didChangeValue:", self);

}

- (void)setShowValue:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  if (self->_showValue != a3)
  {
    self->_showValue = a3;
    v4 = -[HUSliderValueTableViewCell showValue](self, "showValue") ^ 1;
    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    -[HUSliderValueTableViewCell _setupAutoLayoutConstraints](self, "_setupAutoLayoutConstraints");
  }
}

- (UIImage)minimumValueImage
{
  void *v2;
  void *v3;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumValueImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setMinimumValueImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumValueImage:", v4);

}

- (UIImage)maximumValueImage
{
  void *v2;
  void *v3;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValueImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setMaximumValueImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumValueImage:", v4);

}

- (void)setUseLargeCell:(BOOL)a3
{
  if (self->_useLargeCell != a3)
  {
    self->_useLargeCell = a3;
    -[HUSliderValueTableViewCell _setupAutoLayoutConstraints](self, "_setupAutoLayoutConstraints");
  }
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUSliderValueTableViewCell slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = !a3;
  -[HUSliderValueTableViewCell slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  -[HUSliderValueTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v5);
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v9);

  -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  -[HUSliderValueTableViewCell setTextColor:](self, "setTextColor:", v9);
}

- (void)_setupAutoLayoutConstraints
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
  BOOL v47;
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
  void *v63;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;

  -[HUSliderValueTableViewCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUSliderValueTableViewCell constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v95 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HUSliderValueTableViewCell useLargeCell](self, "useLargeCell"))
  {
    -[HUSliderValueTableViewCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readableContentGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v11);

    -[HUSliderValueTableViewCell textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "readableContentGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v17);

    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell textLabel](self, "textLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v22);

    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "readableContentGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v28);

    -[HUSliderValueTableViewCell slider](self, "slider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell textLabel](self, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 12.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v33);

    -[HUSliderValueTableViewCell slider](self, "slider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "readableContentGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v39);

    -[HUSliderValueTableViewCell slider](self, "slider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "readableContentGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v45);

    -[HUSliderValueTableViewCell slider](self, "slider");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v89 = v46;
    objc_msgSend(v46, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "readableContentGuide");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v94);

    goto LABEL_8;
  }
  v47 = -[HUSliderValueTableViewCell showValue](self, "showValue");
  -[HUSliderValueTableViewCell slider](self, "slider");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "readableContentGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v53);

  -[HUSliderValueTableViewCell slider](self, "slider");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "readableContentGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v59);

  -[HUSliderValueTableViewCell slider](self, "slider");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "readableContentGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v65);

  -[HUSliderValueTableViewCell slider](self, "slider");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSliderValueTableViewCell contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "readableContentGuide");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v71);

  if (!v47)
  {
    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell slider](self, "slider");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, 12.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v76);

    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "readableContentGuide");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v82);

    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderValueTableViewCell contentView](self, "contentView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "readableContentGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v88);

    -[HUSliderValueTableViewCell valueLabel](self, "valueLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  -[HUSliderValueTableViewCell setConstraints:](self, "setConstraints:", v95);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v95);

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUSliderValueTableViewCellDelegate)delegate
{
  return (HUSliderValueTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showValue
{
  return self->_showValue;
}

- (BOOL)useLargeCell
{
  return self->_useLargeCell;
}

- (NSString)title
{
  return self->_title;
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
