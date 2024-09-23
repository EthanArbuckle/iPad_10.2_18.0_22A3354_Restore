@implementation CertUIKeyDataCell

- (CertUIKeyDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertUIKeyDataCell *v4;
  CertUIKeyDataCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CertUIKeyDataCell;
  v4 = -[CertUIKeyDataCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CertUIKeyDataCell _setup](v4, "_setup");
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

  -[CertUIKeyDataCell setSelectionStyle:](self, "setSelectionStyle:", 0);
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
  -[CertUIKeyDataCell contentView](self, "contentView");
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
  -[CertUIKeyDataCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_valueLabel);

  -[CertUIKeyDataCell _setupConstraints](self, "_setupConstraints");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertUIKeyDataCell;
  -[CertUIKeyDataCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[CertUIKeyDataCell keyLabel](self, "keyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIKeyDataCell valueLabel](self, "valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[CertUIKeyDataCell valueLabel](self, "valueLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 0);

LABEL_5:
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "CertUIHexString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIKeyDataCell valueLabel](self, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[CertUIKeyDataCell valueLabel](self, "valueLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 0);
    goto LABEL_5;
  }
LABEL_6:
  -[CertUIKeyDataCell updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *keyLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *valueLabel;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[CertUIKeyDataCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CertUIKeyDataCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIKeyDataCell constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeConstraints:", v5);

    -[CertUIKeyDataCell setConstraints:](self, "setConstraints:", 0);
  }
  v31 = (id)objc_opt_new();
  v6 = (void *)MEMORY[0x24BDD1628];
  keyLabel = self->_keyLabel;
  -[CertUIKeyDataCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", keyLabel, 3, 0, v8, 3, 1.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_valueLabel, 3, 0, self->_keyLabel, 4, 1.0, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v10);

  v11 = (void *)MEMORY[0x24BDD1628];
  v12 = self->_keyLabel;
  -[CertUIKeyDataCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 5, 0, v13, 5, 1.0, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v14);

  v15 = (void *)MEMORY[0x24BDD1628];
  valueLabel = self->_valueLabel;
  -[CertUIKeyDataCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", valueLabel, 5, 0, v17, 5, 1.0, 10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v18);

  v19 = (void *)MEMORY[0x24BDD1628];
  v20 = self->_keyLabel;
  -[CertUIKeyDataCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 6, 0, v21, 6, 1.0, -10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v22);

  v23 = (void *)MEMORY[0x24BDD1628];
  v24 = self->_valueLabel;
  -[CertUIKeyDataCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v24, 6, 0, v25, 6, 1.0, -10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v26);

  v27 = (void *)MEMORY[0x24BDD1628];
  -[CertUIKeyDataCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v28, 4, 0, self->_valueLabel, 4, 1.0, 10.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObject:", v29);

  -[CertUIKeyDataCell setConstraints:](self, "setConstraints:", v31);
  -[CertUIKeyDataCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addConstraints:", v31);

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
