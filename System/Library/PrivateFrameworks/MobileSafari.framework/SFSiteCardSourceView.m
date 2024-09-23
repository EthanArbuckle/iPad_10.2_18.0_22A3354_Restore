@implementation SFSiteCardSourceView

- (SFSiteCardSourceView)initWithFrame:(CGRect)a3
{
  SFSiteCardSourceView *v3;
  SFSiteCardSourceView *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *label;
  void *v13;
  void *v14;
  id v15;
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
  SFSiteCardSourceView *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[4];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SFSiteCardSourceView;
  v3 = -[SFSiteCardSourceView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFSiteCardSourceView setTintAdjustmentMode:](v3, "setTintAdjustmentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardSourceView setTintColor:](v4, "setTintColor:", v5);

    -[SFSiteCardSourceView contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    v8 = (void *)MEMORY[0x1E0DC3888];
    subtitleFont();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithFont:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_imageView, "setPreferredSymbolConfiguration:", v10);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView _sf_setMatchesIntrinsicContentSize](v4->_imageView, "_sf_setMatchesIntrinsicContentSize");
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v11;

    subtitleFont();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v13);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel _setUseShortcutIntrinsicContentSize:](v4->_label, "_setUseShortcutIntrinsicContentSize:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_label, "setAdjustsFontForContentSizeCategory:", 1);
    v15 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v37[0] = v4->_imageView;
    v37[1] = v4->_label;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArrangedSubviews:", v16);

    objc_msgSend(v17, "setAxis:", 0);
    objc_msgSend(v17, "setSpacing:", 3.0);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v34, "addSubview:", v17);
    v28 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v17, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardSourceView leadingAnchor](v4, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v31;
    objc_msgSend(v17, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardSourceView trailingAnchor](v4, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v18;
    objc_msgSend(v17, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardSourceView topAnchor](v4, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v21;
    objc_msgSend(v17, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteCardSourceView bottomAnchor](v4, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v25);

    v26 = v4;
  }

  return v4;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  UIImageView *imageView;
  id v5;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setImage:](imageView, "setImage:", v5);
  LODWORD(imageView) = objc_msgSend(v5, "_isSymbolImage");

  -[UIImageView setHidden:](self->_imageView, "setHidden:", imageView ^ 1);
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
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
