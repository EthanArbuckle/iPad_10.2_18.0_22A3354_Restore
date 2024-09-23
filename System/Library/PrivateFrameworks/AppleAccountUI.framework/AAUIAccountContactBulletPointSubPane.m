@implementation AAUIAccountContactBulletPointSubPane

- (AAUIAccountContactBulletPointSubPane)initWithImage:(id)a3 title:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAUIAccountContactBulletPointSubPane *v11;
  AAUIAccountContactBulletPointSubPane *v12;
  uint64_t v13;
  UIImageView *bulletImageView;
  uint64_t v15;
  UIStackView *messageStackView;
  uint64_t v17;
  UILabel *titleLabel;
  uint64_t v19;
  UILabel *messageLabel;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  id v64;
  id v65;
  id v66;
  objc_super v67;
  _QWORD v68[9];

  v68[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v67.receiver = self;
  v67.super_class = (Class)AAUIAccountContactBulletPointSubPane;
  v11 = -[AAUIAccountContactBulletPointSubPane initWithFrame:](&v67, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    -[AAUIAccountContactBulletPointSubPane setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AAUIAccountContactBulletPointSubPane _imageViewWithImage:](v12, "_imageViewWithImage:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v66 = v8;
    bulletImageView = v12->_bulletImageView;
    v12->_bulletImageView = (UIImageView *)v13;

    -[AAUIAccountContactBulletPointSubPane addSubview:](v12, "addSubview:", v12->_bulletImageView);
    -[AAUIAccountContactBulletPointSubPane _verticalStackView](v12, "_verticalStackView");
    v15 = objc_claimAutoreleasedReturnValue();
    messageStackView = v12->_messageStackView;
    v12->_messageStackView = (UIStackView *)v15;

    -[AAUIAccountContactBulletPointSubPane addSubview:](v12, "addSubview:", v12->_messageStackView);
    -[AAUIAccountContactBulletPointSubPane _labelWithString:title:](v12, "_labelWithString:title:", v9, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = (UILabel *)v17;

    -[AAUIAccountContactBulletPointSubPane _labelWithString:title:](v12, "_labelWithString:title:", v10, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v65 = v9;
    messageLabel = v12->_messageLabel;
    v12->_messageLabel = (UILabel *)v19;

    -[UIStackView addArrangedSubview:](v12->_messageStackView, "addArrangedSubview:", v12->_titleLabel);
    -[UIStackView addArrangedSubview:](v12->_messageStackView, "addArrangedSubview:", v12->_messageLabel);
    v58 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v12->_bulletImageView, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v12->_titleLabel, "firstBaselineAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](v12->_titleLabel, "font");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "ascender");
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v61, -(v21 + -2.0));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v60;
    -[UIImageView leadingAnchor](v12->_bulletImageView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v22;
    -[AAUIAccountContactBulletPointSubPane leadingAnchor](v12, "leadingAnchor");
    v23 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v23;
    v64 = v10;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    v26 = 66.0;
    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v26 = 0.0;
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v26);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v56;
    -[UIImageView widthAnchor](v12->_bulletImageView, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v27;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom");

    v30 = 40.0;
    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v30 = 44.0;
    objc_msgSend(v27, "constraintEqualToConstant:", v30);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v54;
    -[UIStackView leadingAnchor](v12->_messageStackView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v31;
    -[UIImageView trailingAnchor](v12->_bulletImageView, "trailingAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v32;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceIdiom");

    v35 = 26.0;
    if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v35 = 16.0;
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v35);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v51;
    -[UIStackView trailingAnchor](v12->_messageStackView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v36;
    -[AAUIAccountContactBulletPointSubPane trailingAnchor](v12, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "userInterfaceIdiom");

    v40 = -50.0;
    if ((v39 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v40 = -16.0;
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v41;
    -[UIStackView topAnchor](v12->_messageStackView, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountContactBulletPointSubPane topAnchor](v12, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v44;
    -[UIStackView bottomAnchor](v12->_messageStackView, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountContactBulletPointSubPane bottomAnchor](v12, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v68[6] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 7);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v48);

    v10 = v64;
    v8 = v66;

    v9 = v65;
  }

  return v12;
}

- (id)_labelWithString:(id)a3 title:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  double *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0DC3990];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (double *)MEMORY[0x1E0DC1448];
  if (!v4)
    v8 = (double *)MEMORY[0x1E0DC1440];
  v9 = *v8;
  objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledFontForFont:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v12);

  objc_msgSend(v7, "setTextAlignment:", 4);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v13);

  objc_msgSend(v7, "setText:", v6);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v14);

  }
  return v7;
}

- (id)_verticalStackView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setDistribution:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)_imageViewWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3890];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(v5, "setContentMode:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v5;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_bulletImageView, "setImage:", a3);
}

- (UIImage)image
{
  return -[UIImageView image](self->_bulletImageView, "image");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_messageLabel, "setText:", a3);
}

- (NSString)message
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (UIImageView)bulletImageView
{
  return self->_bulletImageView;
}

- (UIStackView)messageStackView
{
  return self->_messageStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageStackView, 0);
  objc_storeStrong((id *)&self->_bulletImageView, 0);
}

@end
