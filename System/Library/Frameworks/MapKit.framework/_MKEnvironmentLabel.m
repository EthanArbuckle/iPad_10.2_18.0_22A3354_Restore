@implementation _MKEnvironmentLabel

- (_MKEnvironmentLabel)initWithFrame:(CGRect)a3
{
  _MKEnvironmentLabel *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _MKEnvironmentLabel *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_MKEnvironmentLabel;
  v3 = -[_MKEnvironmentLabel initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel setBackgroundColor:](v3, "setBackgroundColor:", v7);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v9);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 2);
    -[_MKEnvironmentLabel addSubview:](v3, "addSubview:", v3->_label);
    v10 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[_MKEnvironmentLabel addLayoutGuide:](v3, "addLayoutGuide:", v10);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 1, 0, v3, 1, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v11);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 7, 0, v3, 8, 0.5, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[_MKEnvironmentLabel addLayoutGuide:](v3, "addLayoutGuide:", v13);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 2, 0, v3, 2, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v14);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, v3, 8, 0.5, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v15);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 1, 0, v10, 2, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v16);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 2, 0, v13, 1, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 3, 0, v3, 3, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v18);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 4, 0, v3, 4, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKEnvironmentLabel addConstraint:](v3, "addConstraint:", v19);

    v20 = v3;
  }

  return v3;
}

- (void)sizeToFit
{
  double v3;
  double v4;

  -[UIView _mapkit_fittingSize](self, "_mapkit_fittingSize");
  -[_MKEnvironmentLabel frame](self, "frame");
  v4 = v3;
  -[_MKEnvironmentLabel frame](self, "frame");
  -[_MKEnvironmentLabel setFrame:](self, "setFrame:", v4);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKEnvironmentLabel;
  -[_MKEnvironmentLabel layoutSubviews](&v6, sel_layoutSubviews);
  -[_MKEnvironmentLabel bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[_MKEnvironmentLabel layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
