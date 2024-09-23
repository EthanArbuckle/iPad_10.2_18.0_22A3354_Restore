@implementation _SFMultipleLineAlertActionView

- (_SFMultipleLineAlertActionView)initWithFrame:(CGRect)a3
{
  _SFMultipleLineAlertActionView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *detailLabel;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _SFMultipleLineAlertActionView *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_SFMultipleLineAlertActionView;
  v3 = -[_SFMultipleLineAlertActionView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v6;

    -[_SFMultipleLineAlertActionView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[_SFMultipleLineAlertActionView addSubview:](v3, "addSubview:", v3->_detailLabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setNumberOfLines:](v3->_detailLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTextAlignment:](v3->_detailLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v8);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_detailLabel, "setFont:", v9);
    -[_SFMultipleLineAlertActionView tintColorDidChange](v3, "tintColorDidChange");
    objc_msgSend(v8, "_bodyLeading");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_titleLabel, 11, 0, v3, 3, 1.0, v10 * 48.0 / 44.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v12);

    v13 = (void *)MEMORY[0x1E0CB3718];
    v14 = v3->_detailLabel;
    v15 = v3->_titleLabel;
    objc_msgSend(v9, "_bodyLeading");
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 11, 0, v15, 11, 1.0, v16 * 40.0 * 0.03125);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 4, 0, v3->_detailLabel, 11, 1.0, v11 * 24.0 / 44.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1144750080;
    objc_msgSend(v18, "setPriority:", v19);
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v18);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_titleLabel, 5, 0, v3, 17, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v20);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_titleLabel, 6, 0, v3, 18, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v21);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_detailLabel, 5, 0, v3, 17, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v22);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_detailLabel, 6, 0, v3, 18, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView addConstraint:](v3, "addConstraint:", v23);

    v24 = v3;
  }

  return v3;
}

- (void)tintColorDidChange
{
  id v3;

  -[_SFMultipleLineAlertActionView tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v3);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
