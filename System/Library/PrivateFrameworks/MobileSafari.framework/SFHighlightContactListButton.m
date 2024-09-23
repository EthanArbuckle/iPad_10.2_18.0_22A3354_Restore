@implementation SFHighlightContactListButton

- (SFHighlightContactListButton)initWithFrame:(CGRect)a3
{
  SFHighlightContactListButton *v3;
  UILabel *v4;
  UILabel *titleLabel;
  uint64_t v6;
  void *v7;
  UIImageView *v8;
  UIImageView *imageView;
  void *v10;
  void *v11;
  double v12;
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
  SFHighlightContactListButton *v24;
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
  objc_super v41;
  _QWORD v42[9];

  v42[7] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)SFHighlightContactListButton;
  v3 = -[SFHighlightContactListButton initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFHighlightContactListButton addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v6, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1144766464;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    -[SFHighlightContactListButton addSubview:](v3, "addSubview:", v3->_imageView);
    -[SFHighlightContactListButton layoutMarginsGuide](v3, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v35;
    -[UILabel centerYAnchor](v3->_titleLabel, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton centerYAnchor](v3, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v32;
    -[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v28, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v27;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton centerYAnchor](v3, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v15;
    -[UIImageView topAnchor](v3->_imageView, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    objc_msgSend(v13, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v18;
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v22);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightContactListButton setTintColor:](v3, "setTintColor:", v23);

    -[SFHighlightContactListButton _updateBackgroundColor](v3, "_updateBackgroundColor");
    v24 = v3;

  }
  return v3;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFHighlightContactListButton;
  -[SFHighlightContactListButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SFHighlightContactListButton _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  id v3;

  if ((-[SFHighlightContactListButton isHighlighted](self, "isHighlighted") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFHighlightContactListButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
