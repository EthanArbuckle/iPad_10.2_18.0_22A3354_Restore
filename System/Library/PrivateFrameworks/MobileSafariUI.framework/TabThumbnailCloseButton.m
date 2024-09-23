@implementation TabThumbnailCloseButton

+ (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.85);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)TabThumbnailCloseButton;
  -[TabThumbnailCloseButton layoutSubviews](&v3, sel_layoutSubviews);
  -[UIVisualEffectView frame](self->_backdropEffectView, "frame");
  -[UIVisualEffectView _setCornerRadius:](self->_backdropEffectView, "_setCornerRadius:", CGRectGetWidth(v4) * 0.5);
}

- (TabThumbnailCloseButton)initWithFrame:(CGRect)a3
{
  TabThumbnailCloseButton *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *backdropEffectView;
  UIVisualEffectView *v6;
  UIVisualEffectView *vibrantEffectView;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *imageView;
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
  TabThumbnailCloseButton *v27;
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
  objc_super v57;
  _QWORD v58[14];

  v58[12] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)TabThumbnailCloseButton;
  v3 = -[TabThumbnailCloseButton initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    backdropEffectView = v3->_backdropEffectView;
    v3->_backdropEffectView = v4;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backdropEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TabThumbnailCloseButton addSubview:](v3, "addSubview:", v3->_backdropEffectView);
    v6 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    vibrantEffectView = v3->_vibrantEffectView;
    v3->_vibrantEffectView = v6;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_vibrantEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TabThumbnailCloseButton addSubview:](v3, "addSubview:", v3->_vibrantEffectView);
    -[UIVisualEffectView contentView](v3->_vibrantEffectView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, 12.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v13);

    -[UIImageView _sf_setMatchesIntrinsicContentSize](v3->_imageView, "_sf_setMatchesIntrinsicContentSize");
    objc_msgSend(v8, "addSubview:", v3->_imageView);
    if (usesVibrantAppearance_onceToken != -1)
      dispatch_once(&usesVibrantAppearance_onceToken, &__block_literal_global_61);
    if (usesVibrantAppearance_flag)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](v3->_backdropEffectView, "setEffect:", v14);
      objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setEffect:](v3->_vibrantEffectView, "setEffect:", v15);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "backgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](v3->_backdropEffectView, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v16);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v14);
    }

    v42 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView centerXAnchor](v3->_backdropEffectView, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton centerXAnchor](v3, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v54;
    -[UIVisualEffectView centerYAnchor](v3->_backdropEffectView, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton centerYAnchor](v3, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v51;
    -[UIVisualEffectView widthAnchor](v3->_backdropEffectView, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton widthAnchor](v3, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v48;
    -[UIVisualEffectView heightAnchor](v3->_backdropEffectView, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton heightAnchor](v3, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v45;
    -[UIVisualEffectView centerXAnchor](v3->_vibrantEffectView, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton centerXAnchor](v3, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v41;
    -[UIVisualEffectView centerYAnchor](v3->_vibrantEffectView, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton centerYAnchor](v3, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v38;
    -[UIVisualEffectView widthAnchor](v3->_vibrantEffectView, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton widthAnchor](v3, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v34;
    -[UIVisualEffectView heightAnchor](v3->_vibrantEffectView, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailCloseButton heightAnchor](v3, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v31;
    -[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v18;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v21;
    -[TabThumbnailCloseButton widthAnchor](v3, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultButtonSize");
    objc_msgSend(v22, "constraintEqualToConstant:");
    v37 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58[10] = v23;
    -[TabThumbnailCloseButton heightAnchor](v3, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultButtonSize");
    objc_msgSend(v24, "constraintEqualToConstant:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v58[11] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v26);

    v27 = v3;
  }

  return v3;
}

+ (double)defaultButtonSize
{
  return 22.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LODWORD(self) = -[TabThumbnailCloseButton isEnabled](self, "isEnabled") ^ 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TabThumbnailCloseButton;
    LOBYTE(self) = -[TabThumbnailCloseButton gestureRecognizerShouldBegin:](&v6, sel_gestureRecognizerShouldBegin_, v4);
  }

  return (char)self;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
}

@end
