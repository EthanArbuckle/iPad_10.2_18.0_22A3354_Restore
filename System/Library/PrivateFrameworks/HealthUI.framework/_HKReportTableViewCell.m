@implementation _HKReportTableViewCell

- (_HKReportTableViewCell)init
{
  _HKReportTableViewCell *v2;
  _HKReportTableViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKReportTableViewCell;
  v2 = -[_HKReportTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 0, CFSTR("report_cell_identifier"));
  v3 = v2;
  if (v2)
    -[_HKReportTableViewCell setUpUI](v2, "setUpUI");
  return v3;
}

- (void)setUpUI
{
  UIView *v3;
  UIView *reportAreaView;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  UILabel *v11;
  UILabel *reportLabel;
  UILabel *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *reportImageView;
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
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  reportAreaView = self->_reportAreaView;
  self->_reportAreaView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_reportAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](self->_reportAreaView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 15.0);

  -[UIView layer](self->_reportAreaView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

  -[UIView layer](self->_reportAreaView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 0.5);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[UIView layer](self->_reportAreaView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderColor:", v9);

  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  reportLabel = self->_reportLabel;
  self->_reportLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_reportLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_reportLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v13, "setFont:", v14);

  -[UIView addSubview:](self->_reportAreaView, "addSubview:", self->_reportLabel);
  v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  reportImageView = self->_reportImageView;
  self->_reportImageView = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_reportImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_reportAreaView, "addSubview:", self->_reportImageView);
  -[_HKReportTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_reportAreaView);

  v34 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView topAnchor](self->_reportImageView, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_reportAreaView, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 30.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v41;
  -[UIImageView centerXAnchor](self->_reportImageView, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_reportAreaView, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v38;
  -[UILabel topAnchor](self->_reportLabel, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_reportImageView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 30.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v35;
  -[UILabel centerXAnchor](self->_reportLabel, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_reportAreaView, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v31;
  -[UIView heightAnchor](self->_reportAreaView, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 160.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v29;
  -[UIView widthAnchor](self->_reportAreaView, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 135.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v18;
  -[UIView centerYAnchor](self->_reportAreaView, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKReportTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v22;
  -[UIView centerXAnchor](self->_reportAreaView, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKReportTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v27);

}

- (void)setReportName:(id)a3 reportImage:(id)a4
{
  UILabel *reportLabel;
  id v7;

  reportLabel = self->_reportLabel;
  v7 = a4;
  -[UILabel setText:](reportLabel, "setText:", a3);
  -[UIImageView setImage:](self->_reportImageView, "setImage:", v7);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)_HKReportTableViewCell;
  -[_HKReportTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  v5 = fmax(v4, 215.0);
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (UILabel)reportLabel
{
  return self->_reportLabel;
}

- (UIImageView)reportImageView
{
  return self->_reportImageView;
}

- (UIView)reportAreaView
{
  return self->_reportAreaView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAreaView, 0);
  objc_storeStrong((id *)&self->_reportImageView, 0);
  objc_storeStrong((id *)&self->_reportLabel, 0);
}

@end
