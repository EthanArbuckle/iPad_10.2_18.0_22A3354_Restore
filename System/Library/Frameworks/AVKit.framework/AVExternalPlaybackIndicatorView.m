@implementation AVExternalPlaybackIndicatorView

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *imageView;
  double v10;
  double v11;
  UIImageView *v12;
  void *v13;
  UILabel *v14;
  UILabel *titleLabel;
  UILabel *v16;
  UILabel *subtitleLabel;
  UIView *v18;
  UIView *containerView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  objc_super v79;
  _QWORD v80[17];

  v80[15] = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)AVExternalPlaybackIndicatorView;
  -[AVExternalPlaybackIndicatorView didMoveToWindow](&v79, sel_didMoveToWindow);
  if (self && !self->_containerView)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVExternalPlaybackIndicatorView setBackgroundColor:](self, "setBackgroundColor:", v3);

    v4 = (void *)MEMORY[0x1E0DC3870];
    v5 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 110.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithFont:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("tv"), v7);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v78);
    imageView = self->_imageView;
    self->_imageView = v8;

    LODWORD(v10) = 1132068864;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    LODWORD(v11) = 1144750080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_imageView, "setContentHuggingPriority:forAxis:", 1, v11);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    v12 = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v12, "setTintColor:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVExternalPlaybackIndicatorView _labelWithFontSize:](17.0);
    v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v14;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_titleString);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVExternalPlaybackIndicatorView _labelWithFontSize:](13.0);
    v16 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v16;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleString);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = self->_containerView;
    self->_containerView = v18;

    v20 = 1.0;
    if (!self->_shouldShowIndicator)
      v20 = 0.0;
    -[UIView setAlpha:](self->_containerView, "setAlpha:", v20);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_imageView);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_subtitleLabel);
    -[AVExternalPlaybackIndicatorView addSubview:](self, "addSubview:", self->_containerView);
    -[UIImageView topAnchor](self->_imageView, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_containerView, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 1148829696;
    objc_msgSend(v77, "avkit_constraintEqualToAnchor:priority:", v76, v21);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v75;
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1148829696;
    objc_msgSend(v74, "avkit_constraintEqualToAnchor:priority:", v73, v22);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v72;
    -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 3.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v69;
    -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_containerView, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v66;
    -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintLessThanOrEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v63;
    -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v80[5] = v60;
    -[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v58);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v80[6] = v57;
    -[UIImageView centerXAnchor](self->_imageView, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v80[7] = v54;
    -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v80[8] = v51;
    -[UILabel centerXAnchor](self->_subtitleLabel, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v80[9] = v48;
    -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView image](self->_imageView, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "size");
    v24 = v23;
    -[UIImageView image](self->_imageView, "image");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "size");
    objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", v44, v24 / v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v80[10] = v42;
    -[UIView widthAnchor](self->_containerView, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v39, -16.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v80[11] = v38;
    -[UIView heightAnchor](self->_containerView, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v26, -16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v80[12] = v27;
    -[UIView centerXAnchor](self->_containerView, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80[13] = v31;
    -[UIView centerYAnchor](self->_containerView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v80[14] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 15);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v46);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double Height;
  void *v5;
  double Width;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  double v11;
  _BOOL8 v12;
  _BOOL8 v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v14.receiver = self;
  v14.super_class = (Class)AVExternalPlaybackIndicatorView;
  -[AVExternalPlaybackIndicatorView layoutSubviews](&v14, sel_layoutSubviews);
  -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  Height = CGRectGetHeight(v15);

  -[AVExternalPlaybackIndicatorView layoutMarginsGuide](self, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutFrame");
  Width = CGRectGetWidth(v16);

  -[UILabel frame](self->_titleLabel, "frame");
  v7 = CGRectGetHeight(v17);
  -[UILabel frame](self->_subtitleLabel, "frame");
  v8 = v7 + CGRectGetHeight(v18) + 3.0 + 16.0;
  -[UILabel frame](self->_subtitleLabel, "frame");
  v9 = CGRectGetHeight(v19);
  v10 = Width < 86.0 || Height - v8 < 56.0;
  if (v10 != -[UIImageView isHidden](self->_imageView, "isHidden"))
    -[UIImageView setHidden:](self->_imageView, "setHidden:", v10);
  v11 = v9 + 16.0;
  v12 = Width < 64.0 || Height - v8 < 0.0;
  if (v12 != -[UILabel isHidden](self->_titleLabel, "isHidden"))
    -[UILabel setHidden:](self->_titleLabel, "setHidden:", v12);
  v13 = Width < 86.0 || Height - v11 < 0.0;
  if (v13 != -[UILabel isHidden](self->_subtitleLabel, "isHidden", Height - v11))
    -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v13);
}

- (void)setTitleString:(id)a3 subtitleString:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;
  UILabel *titleLabel;
  double v12;
  void *v13;
  _QWORD v14[4];
  id v15[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_titleString, a3);
  objc_storeStrong((id *)&self->_subtitleString, a4);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  self->_shouldShowIndicator = v10;
  if (!v9)
  {
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      if (self->_subtitleLabel)
      {
        -[UILabel setText:](titleLabel, "setText:", v7);
        -[UILabel setText:](self->_subtitleLabel, "setText:", v8);
      }
    }
  }
  if (self->_containerView)
  {
    if (self->_shouldShowIndicator)
      v12 = 1.0;
    else
      v12 = 0.0;
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__AVExternalPlaybackIndicatorView_setTitleString_subtitleString___block_invoke;
    v14[3] = &unk_1E5BB4638;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&v12;
    objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.2);
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __65__AVExternalPlaybackIndicatorView_setTitleString_subtitleString___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[55], "setAlpha:", *(double *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)_labelWithFontSize:(double)a1
{
  id v2;
  double v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v4);

  objc_msgSend(v2, "setLineBreakMode:", 5);
  objc_msgSend(v2, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v5);

  return v2;
}

@end
