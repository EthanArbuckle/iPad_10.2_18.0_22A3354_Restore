@implementation AVTStickerRecentsOverlayView

+ (id)stickerButtonImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("stickers_button"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)overlayViewForMemojiCreation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc((Class)a1);
  AVTAvatarUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_MESSAGE"), &stru_1EA5207B8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_CONTINUE_BUTTON_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stickerButtonImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", v5, v7, v9, v10, 0.0, 0.0, 50.0, 50.0);

  return v11;
}

+ (id)standardOverlayView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc((Class)a1);
  AVTAvatarUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTAvatarUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_MESSAGE"), &stru_1EA5207B8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stickerButtonImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", v5, v7, 0, v8, 0.0, 0.0, 50.0, 50.0);

  return v9;
}

+ (id)disclosureOverlayView
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)a1);
  objc_msgSend(a1, "stickerButtonImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", CFSTR("Warning"), CFSTR("Only send to disclosed individuals"), 0, v4, 0.0, 0.0, 50.0, 50.0);

  return v5;
}

- (AVTStickerRecentsOverlayView)initWithFrame:(CGRect)a3 title:(id)a4 subtitle:(id)a5 buttonTitle:(id)a6 image:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  AVTStickerRecentsOverlayView *v19;
  AVTStickerRecentsOverlayView *v20;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSString *subtitle;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  UIView *centeredContainerView;
  void *v32;
  uint64_t v33;
  UIImageView *imageView;
  uint64_t v35;
  UILabel *titleLabel;
  void *v37;
  void *v38;
  uint64_t v39;
  UILabel *subtitleLabel;
  void *v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  UIButton *continueButton;
  void *v47;
  void *v48;
  UIButton *v49;
  void *v50;
  void *v51;
  UIButton *v52;
  UIButton *closeButton;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  AVTStickerRecentsOverlayViewLayout *portraitLayout;
  uint64_t v64;
  AVTStickerRecentsOverlayViewLayout *landscapeLayout;
  uint64_t v66;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v68;
  uint64_t v69;
  AVTStickerRecentsOverlayViewLayout *v70;
  uint64_t v71;
  objc_super v73;
  _QWORD v74[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v74[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a7;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 6.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73.receiver = self;
  v73.super_class = (Class)AVTStickerRecentsOverlayView;
  v19 = -[AVTStickerRecentsOverlayView initWithEffect:](&v73, sel_initWithEffect_, v18);
  v20 = v19;
  if (v19)
  {
    -[AVTStickerRecentsOverlayView setFrame:](v19, "setFrame:", x, y, width, height);
    v21 = objc_msgSend(v15, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    subtitle = v20->_subtitle;
    v20->_subtitle = (NSString *)v23;

    objc_storeStrong((id *)&v20->_image, a7);
    v25 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v26 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v30 = objc_msgSend(v25, "initWithFrame:", *MEMORY[0x1E0C9D648], v27, v28, v29);
    centeredContainerView = v20->_centeredContainerView;
    v20->_centeredContainerView = (UIView *)v30;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v20->_centeredContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVTStickerRecentsOverlayView contentView](v20, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v20->_centeredContainerView);

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v17);
    imageView = v20->_imageView;
    v20->_imageView = (UIImageView *)v33;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v20->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v20->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v20->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v20->_centeredContainerView, "addSubview:", v20->_imageView);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v26, v27, v28, v29);
    titleLabel = v20->_titleLabel;
    v20->_titleLabel = (UILabel *)v35;

    +[AVTUIFontRepository keyboardRecentsSplashTitleFont](AVTUIFontRepository, "keyboardRecentsSplashTitleFont");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20->_titleLabel, "setFont:", v37);

    -[UILabel setTextAlignment:](v20->_titleLabel, "setTextAlignment:", 1);
    v38 = (void *)objc_msgSend(v15, "copy");
    -[UILabel setText:](v20->_titleLabel, "setText:", v38);

    -[UILabel setMinimumScaleFactor:](v20->_titleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](v20->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v20->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v20->_centeredContainerView, "addSubview:", v20->_titleLabel);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v26, v27, v28, v29);
    subtitleLabel = v20->_subtitleLabel;
    v20->_subtitleLabel = (UILabel *)v39;

    +[AVTUIFontRepository keyboardRecentsSplashSubtitleFont](AVTUIFontRepository, "keyboardRecentsSplashSubtitleFont");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20->_subtitleLabel, "setFont:", v41);

    -[UILabel setTextAlignment:](v20->_subtitleLabel, "setTextAlignment:", 1);
    v42 = (void *)objc_msgSend(v16, "copy");
    -[UILabel setText:](v20->_subtitleLabel, "setText:", v42);

    -[UILabel setNumberOfLines:](v20->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v20->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setMinimumScaleFactor:](v20->_subtitleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](v20->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    LODWORD(v43) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v20->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v43);
    LODWORD(v44) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v20->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v44);
    -[UIView addSubview:](v20->_centeredContainerView, "addSubview:", v20->_subtitleLabel);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v45 = objc_claimAutoreleasedReturnValue();
      continueButton = v20->_continueButton;
      v20->_continueButton = (UIButton *)v45;

      +[AVTUIFontRepository keyboardRecentsSplashContinueButtonFont](AVTUIFontRepository, "keyboardRecentsSplashContinueButtonFont");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](v20->_continueButton, "titleLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFont:", v47);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v20->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v49 = v20->_continueButton;
      AVTAvatarUIBundle();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("STICKER_RECENTS_SPLASH_CONTINUE_BUTTON_TITLE"), &stru_1EA5207B8, CFSTR("Localized"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v49, "setTitle:forState:", v51, 0);

      -[UIButton addTarget:action:forControlEvents:](v20->_continueButton, "addTarget:action:forControlEvents:", v20, sel_didTapContinueButton_, 64);
      -[UIView addSubview:](v20->_centeredContainerView, "addSubview:", v20->_continueButton);
      v52 = (UIButton *)objc_alloc_init(MEMORY[0x1E0CEA3A0]);
      closeButton = v20->_closeButton;
      v20->_closeButton = v52;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v20->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B0], 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)MEMORY[0x1E0CEA650];
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_configurationWithHierarchicalColors:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "configurationByApplyingConfiguration:", v54);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.circle.fill"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v20->_closeButton, "setImage:forState:", v60, 0);
      -[UIButton setPreferredSymbolConfiguration:forImageInState:](v20->_closeButton, "setPreferredSymbolConfiguration:forImageInState:", v59, 0);
      -[UIButton addTarget:action:forControlEvents:](v20->_closeButton, "addTarget:action:forControlEvents:", v20, sel_didTapCloseButton_, 64);
      -[AVTStickerRecentsOverlayView contentView](v20, "contentView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addSubview:", v20->_closeButton);

      +[AVTStickerRecentsOverlayViewLayout buttonsPortraitLayout](AVTStickerRecentsOverlayViewLayout, "buttonsPortraitLayout");
      v62 = objc_claimAutoreleasedReturnValue();
      portraitLayout = v20->_portraitLayout;
      v20->_portraitLayout = (AVTStickerRecentsOverlayViewLayout *)v62;

      +[AVTStickerRecentsOverlayViewLayout buttonsLandscapeLayout](AVTStickerRecentsOverlayViewLayout, "buttonsLandscapeLayout");
      v64 = objc_claimAutoreleasedReturnValue();
      landscapeLayout = v20->_landscapeLayout;
      v20->_landscapeLayout = (AVTStickerRecentsOverlayViewLayout *)v64;

    }
    else
    {
      v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v20, sel_didTapContentView_);
      tapGestureRecognizer = v20->_tapGestureRecognizer;
      v20->_tapGestureRecognizer = (UITapGestureRecognizer *)v66;

      -[AVTStickerRecentsOverlayView contentView](v20, "contentView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addGestureRecognizer:", v20->_tapGestureRecognizer);

      +[AVTStickerRecentsOverlayViewLayout standardPortraitLayout](AVTStickerRecentsOverlayViewLayout, "standardPortraitLayout");
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v20->_portraitLayout;
      v20->_portraitLayout = (AVTStickerRecentsOverlayViewLayout *)v69;

      +[AVTStickerRecentsOverlayViewLayout standardLandscapeLayout](AVTStickerRecentsOverlayViewLayout, "standardLandscapeLayout");
      v71 = objc_claimAutoreleasedReturnValue();
      v54 = v20->_landscapeLayout;
      v20->_landscapeLayout = (AVTStickerRecentsOverlayViewLayout *)v71;
    }

    -[AVTStickerRecentsOverlayView setupConstraints](v20, "setupConstraints");
  }

  return v20;
}

- (void)didTapContentView:(id)a3
{
  id v4;

  -[AVTStickerRecentsOverlayView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayDidTapContentView:", self);

}

- (void)didTapContinueButton:(id)a3
{
  id v4;

  -[AVTStickerRecentsOverlayView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayDidTapContinueButton:", self);

}

- (void)didTapCloseButton:(id)a3
{
  id v4;

  -[AVTStickerRecentsOverlayView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overlayDidTapCloseButton:", self);

}

- (id)appropriateLayout
{
  double v3;
  double v4;
  int *v5;
  double v6;

  -[AVTStickerRecentsOverlayView bounds](self, "bounds");
  v4 = v3;
  -[AVTStickerRecentsOverlayView bounds](self, "bounds");
  v5 = &OBJC_IVAR___AVTStickerRecentsOverlayView__portraitLayout;
  if (v4 > v6)
    v5 = &OBJC_IVAR___AVTStickerRecentsOverlayView__landscapeLayout;
  return *(id *)((char *)&self->super.super.super.super.isa + *v5);
}

- (void)setupConstraints
{
  void *v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *containerTopConstraint;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *containerLeadingConstraint;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *containerTrailingConstraint;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *imageHeightConstraint;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *imageToTitleConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *titleToSubtitleConstraint;
  NSLayoutConstraint *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *v34;
  void *v35;
  void *v36;
  NSLayoutConstraint *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UILabel *subtitleLabel;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *hideSubtitleConstraint;
  void *v49;
  void *v50;
  void *v51;
  double v52;
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
  double v65;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  UIView *v112;
  _QWORD v113[10];
  _QWORD v114[18];

  v114[16] = *MEMORY[0x1E0C80C00];
  -[AVTStickerRecentsOverlayView appropriateLayout](self, "appropriateLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_centeredContainerView;
  -[UIView topAnchor](v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageToTopPadding");
  objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v7);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerTopConstraint = self->_containerTopConstraint;
  self->_containerTopConstraint = v8;

  -[UIView leadingAnchor](v4, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "horizontalEdgePadding");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerLeadingConstraint = self->_containerLeadingConstraint;
  self->_containerLeadingConstraint = v13;

  -[UIView trailingAnchor](v4, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "horizontalEdgePadding");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -v18);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerTrailingConstraint = self->_containerTrailingConstraint;
  self->_containerTrailingConstraint = v19;

  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageHeight");
  objc_msgSend(v21, "constraintEqualToConstant:");
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageHeightConstraint = self->_imageHeightConstraint;
  self->_imageHeightConstraint = v22;

  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageToTitlePadding");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageToTitleConstraint = self->_imageToTitleConstraint;
  self->_imageToTitleConstraint = v26;

  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v3;
  objc_msgSend(v3, "titleToSubtitlePadding");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleToSubtitleConstraint = self->_titleToSubtitleConstraint;
  self->_titleToSubtitleConstraint = v30;

  v32 = self->_containerLeadingConstraint;
  v110 = (void *)MEMORY[0x1E0C99DE8];
  v114[0] = self->_containerTopConstraint;
  v114[1] = v32;
  v114[2] = self->_containerTrailingConstraint;
  -[UIView bottomAnchor](v4, "bottomAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView contentView](self, "contentView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintLessThanOrEqualToAnchor:", v102);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v114[3] = v100;
  -[UIView centerYAnchor](v4, "centerYAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView contentView](self, "contentView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "centerYAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v94);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self->_imageHeightConstraint;
  v114[4] = v92;
  v114[5] = v33;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v4, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v114[6] = v86;
  -[UIImageView centerXAnchor](self->_imageView, "centerXAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](v4, "centerXAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v82);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v114[7] = v80;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](v4, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v76);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self->_imageToTitleConstraint;
  v114[8] = v74;
  v114[9] = v34;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v4, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v114[10] = v69;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v4, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v114[11] = v66;
  -[UILabel heightAnchor](self->_titleLabel, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 30.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self->_titleToSubtitleConstraint;
  v114[12] = v36;
  v114[13] = v37;
  -[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v4, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v114[14] = v40;
  -[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v4;
  -[UIView trailingAnchor](v4, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v114[15] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 16);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "arrayWithArray:", v44);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  subtitleLabel = self->_subtitleLabel;
  if (self->_continueButton)
  {
    -[UILabel heightAnchor](subtitleLabel, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 0.0);
    v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    hideSubtitleConstraint = self->_hideSubtitleConstraint;
    self->_hideSubtitleConstraint = v47;

    -[NSLayoutConstraint setActive:](self->_hideSubtitleConstraint, "setActive:", 0);
    -[UIButton topAnchor](self->_continueButton, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "subtitleToButtonPadding");
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v52) = 1144750080;
    v75 = v51;
    objc_msgSend(v51, "setPriority:", v52);
    -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToConstant:", 30.0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v105;
    -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToConstant:", 30.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v101;
    -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsOverlayView contentView](self, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v95);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2] = v93;
    -[UIButton topAnchor](self->_closeButton, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerRecentsOverlayView contentView](self, "contentView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v87);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v113[3] = v85;
    v113[4] = v51;
    -[UIButton topAnchor](self->_continueButton, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:", v109);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v113[5] = v81;
    -[UIButton leadingAnchor](self->_continueButton, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v112, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v77);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v113[6] = v73;
    -[UIButton trailingAnchor](self->_continueButton, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v112, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v113[7] = v54;
    -[UIButton heightAnchor](self->_continueButton, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v113[8] = v57;
    -[UIButton bottomAnchor](self->_continueButton, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v112, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintLessThanOrEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v113[9] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 10);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v61);

    v62 = v75;
  }
  else
  {
    -[UILabel bottomAnchor](subtitleLabel, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v112, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:", v64);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v65) = 1148846080;
    objc_msgSend(v62, "setPriority:", v65);
    objc_msgSend(v111, "addObject:", v62);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v111);
  -[AVTStickerRecentsOverlayView setLayoutConstraints:](self, "setLayoutConstraints:", v111);

}

- (void)updateConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTStickerRecentsOverlayView;
  -[AVTStickerRecentsOverlayView updateConstraints](&v7, sel_updateConstraints);
  -[AVTStickerRecentsOverlayView currentLayout](self, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageToTopPadding");
  -[NSLayoutConstraint setConstant:](self->_containerTopConstraint, "setConstant:");
  objc_msgSend(v3, "horizontalEdgePadding");
  -[NSLayoutConstraint setConstant:](self->_containerLeadingConstraint, "setConstant:");
  objc_msgSend(v3, "horizontalEdgePadding");
  -[NSLayoutConstraint setConstant:](self->_containerTrailingConstraint, "setConstant:", -v4);
  objc_msgSend(v3, "imageHeight");
  -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:");
  objc_msgSend(v3, "imageToTitlePadding");
  -[NSLayoutConstraint setConstant:](self->_imageToTitleConstraint, "setConstant:");
  objc_msgSend(v3, "titleToSubtitlePadding");
  -[NSLayoutConstraint setConstant:](self->_titleToSubtitleConstraint, "setConstant:");
  if (self->_hideSubtitleConstraint)
  {
    -[AVTStickerRecentsOverlayView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[NSLayoutConstraint setActive:](self->_hideSubtitleConstraint, "setActive:", v6 < 130.0);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsOverlayView;
  -[AVTStickerRecentsOverlayView layoutSubviews](&v6, sel_layoutSubviews);
  -[AVTStickerRecentsOverlayView appropriateLayout](self, "appropriateLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecentsOverlayView bounds](self, "bounds");
  if (v4 > 0.0)
  {
    -[AVTStickerRecentsOverlayView currentLayout](self, "currentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 != v5)
    {
      -[AVTStickerRecentsOverlayView setCurrentLayout:](self, "setCurrentLayout:", v3);
      -[AVTStickerRecentsOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
  }

}

- (void)dismissAnimatedWithDuration:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AVTStickerRecentsOverlayView_dismissAnimatedWithDuration___block_invoke;
  v3[3] = &unk_1EA51D188;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, 0, a3);
}

uint64_t __60__AVTStickerRecentsOverlayView_dismissAnimatedWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (AVTStickerRecentsOverlayDelegate)delegate
{
  return (AVTStickerRecentsOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)centeredContainerView
{
  return self->_centeredContainerView;
}

- (void)setCenteredContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredContainerView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (AVTStickerRecentsOverlayViewLayout)portraitLayout
{
  return self->_portraitLayout;
}

- (void)setPortraitLayout:(id)a3
{
  objc_storeStrong((id *)&self->_portraitLayout, a3);
}

- (AVTStickerRecentsOverlayViewLayout)landscapeLayout
{
  return self->_landscapeLayout;
}

- (void)setLandscapeLayout:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeLayout, a3);
}

- (AVTStickerRecentsOverlayViewLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (NSLayoutConstraint)containerTopConstraint
{
  return self->_containerTopConstraint;
}

- (void)setContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerTopConstraint, a3);
}

- (NSLayoutConstraint)containerLeadingConstraint
{
  return self->_containerLeadingConstraint;
}

- (void)setContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerLeadingConstraint, a3);
}

- (NSLayoutConstraint)containerTrailingConstraint
{
  return self->_containerTrailingConstraint;
}

- (void)setContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerTrailingConstraint, a3);
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (NSLayoutConstraint)imageToTitleConstraint
{
  return self->_imageToTitleConstraint;
}

- (void)setImageToTitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageToTitleConstraint, a3);
}

- (NSLayoutConstraint)titleToSubtitleConstraint
{
  return self->_titleToSubtitleConstraint;
}

- (void)setTitleToSubtitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleToSubtitleConstraint, a3);
}

- (NSLayoutConstraint)hideSubtitleConstraint
{
  return self->_hideSubtitleConstraint;
}

- (void)setHideSubtitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hideSubtitleConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_titleToSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_imageToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_containerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_containerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_containerTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_landscapeLayout, 0);
  objc_storeStrong((id *)&self->_portraitLayout, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_centeredContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
