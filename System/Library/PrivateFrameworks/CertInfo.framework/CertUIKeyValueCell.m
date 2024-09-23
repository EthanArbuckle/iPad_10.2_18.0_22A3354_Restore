@implementation CertUIKeyValueCell

- (CertUIKeyValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertUIKeyValueCell *v4;
  CertUIKeyValueCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CertUIKeyValueCell;
  v4 = -[CertUIKeyValueCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CertUIKeyValueCell _setup](v4, "_setup");
  return v5;
}

- (void)_setup
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *keyLabel;
  UILabel *v10;
  UILabel *valueLabel;
  UILabel *v12;
  UILabel *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;

  -[CertUIKeyValueCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc(MEMORY[0x24BDF6B68]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  keyLabel = self->_keyLabel;
  self->_keyLabel = v8;

  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
  valueLabel = self->_valueLabel;
  self->_valueLabel = v10;

  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
  v13 = self->_keyLabel;
  self->_keyLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_keyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_keyLabel, "setTextAlignment:", 0);
  v14 = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_keyLabel, "setFont:", v15);

  -[UILabel setNumberOfLines:](self->_keyLabel, "setNumberOfLines:", 0);
  -[CertUIKeyValueCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_keyLabel);

  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v4, v5, v6, v7);
  v18 = self->_valueLabel;
  self->_valueLabel = v17;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_valueLabel, "setTextAlignment:", 2);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_valueLabel, "setTextColor:", v19);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_valueLabel, "setFont:", v20);

  -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", 0);
  -[CertUIKeyValueCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_valueLabel);

  -[CertUIKeyValueCell _setupConstraints](self, "_setupConstraints");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertUIKeyValueCell;
  -[CertUIKeyValueCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[CertUIKeyValueCell keyLabel](self, "keyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v17 || (isKindOfClass & 1) != 0)
  {
    -[CertUIKeyValueCell valueLabel](self, "valueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

    -[CertUIKeyValueCell valueLabel](self, "valueLabel");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 2);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x24BDD1500];
    v10 = v17;
    v11 = objc_alloc_init(v9);
    objc_msgSend(v11, "setDateStyle:", 1);
    objc_msgSend(v11, "setTimeStyle:", 2);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v12);

    objc_msgSend(v11, "stringFromDate:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CertUIKeyValueCell valueLabel](self, "valueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[CertUIKeyValueCell valueLabel](self, "valueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 2);

LABEL_6:
  }
  -[CertUIKeyValueCell updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
  -[CertUIKeyValueCell setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  width = a3.width;
  -[CertUIKeyValueCell valueLabel](self, "valueLabel", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = 130.0;
  if (!v7)
    v8 = 30.0;
  v9 = width - v8;
  -[CertUIKeyValueCell keyLabel](self, "keyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v9, 3.40282347e38);
  v12 = v11;
  v14 = v13;

  -[CertUIKeyValueCell valueLabel](self, "valueLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", width - (v12 + 30.0), 3.40282347e38);
  v17 = v16;

  if (v14 <= v17)
    v18 = v17;
  else
    v18 = v14;
  v19 = v18 + 20.0;
  if (v19 >= 44.0)
    v20 = v19;
  else
    v20 = 44.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;

  v24 = v23;
  v25 = v20;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *valueLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  UILabel *keyLabel;
  void *v22;
  void *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[CertUIKeyValueCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CertUIKeyValueCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIKeyValueCell constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[CertUIKeyValueCell setConstraints:](self, "setConstraints:", 0);
  }
  v30 = (id)objc_opt_new();
  v6 = (void *)MEMORY[0x24BDD1628];
  valueLabel = self->_valueLabel;
  -[CertUIKeyValueCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", valueLabel, 3, 0, v8, 3, 1.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD1628];
  -[CertUIKeyValueCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 4, 1, self->_valueLabel, 4, 1.0, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD1628];
  -[CertUIKeyValueCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 1, self->_keyLabel, 4, 1.0, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v15);

  LODWORD(v16) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_keyLabel, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  LODWORD(v17) = 1144766464;
  -[UILabel setContentHuggingPriority:forAxis:](self->_keyLabel, "setContentHuggingPriority:forAxis:", 0, v17);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel, 7, 1, self->_keyLabel, 7, 0.0, 100.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v18);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_keyLabel, 12, 0, self->_valueLabel, 12, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v19);

  v20 = (void *)MEMORY[0x24BDD1628];
  keyLabel = self->_keyLabel;
  -[CertUIKeyValueCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", keyLabel, 5, 0, v22, 5, 1.0, 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v23);

  v24 = (void *)MEMORY[0x24BDD1628];
  v25 = self->_valueLabel;
  -[CertUIKeyValueCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 6, 0, v26, 6, 1.0, -10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v27);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel, 5, 0, self->_keyLabel, 6, 1.0, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v28);

  -[CertUIKeyValueCell setConstraints:](self, "setConstraints:", v30);
  -[CertUIKeyValueCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addConstraints:", v30);

}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_keyLabel, a3);
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
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end
