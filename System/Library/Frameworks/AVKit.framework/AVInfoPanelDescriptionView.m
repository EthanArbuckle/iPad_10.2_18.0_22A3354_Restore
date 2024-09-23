@implementation AVInfoPanelDescriptionView

- (AVInfoPanelDescriptionView)initWithFrame:(CGRect)a3
{
  AVInfoPanelDescriptionView *v3;
  id v4;
  uint64_t v5;
  UIFont *textFont;
  uint64_t v7;
  UIColor *textColor;
  uint64_t v9;
  UIFont *titleFont;
  uint64_t v11;
  UIColor *titleTextColor;
  void (**v13)(_QWORD);
  UIImageView *v14;
  UIImageView *posterView;
  UIImageView *v16;
  void *v17;
  void *v18;
  UIStackView *v19;
  UIStackView *nextToPosterStackView;
  uint64_t v21;
  UILabel *titleLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  uint64_t v27;
  UILabel *subtitleLabel;
  id v29;
  uint64_t v30;
  UILabel *seasonEpisodeLabel;
  AVTomatoRatingView *v32;
  AVTomatoRatingView *tomatoRatingView;
  AVTomatoRatingView *v34;
  void *v35;
  AVTomatoRatingView *v36;
  void *v37;
  uint64_t v38;
  UILabel *durationLabel;
  uint64_t v40;
  UILabel *genreLabel;
  uint64_t v42;
  UILabel *dateLabel;
  uint64_t v44;
  UILabel *mediaContentRatingLabel;
  UIImageView *v46;
  UIImageView *mediaContentRatingImageView;
  UIImageView *v48;
  void *v49;
  UIImageView *v50;
  void *v51;
  UIImageView *v52;
  UIImageView *viewingModeBadgeImageView;
  UIImageView *v54;
  void *v55;
  UIImageView *v56;
  void *v57;
  UIImageView *v58;
  UIImageView *closedCaptionBadge;
  UIImageView *v60;
  void *v61;
  UIImageView *v62;
  void *v63;
  UIImageView *v64;
  void *v65;
  uint64_t v66;
  UILabel *summaryView;
  UIStackView *v68;
  UIStackView *actionButtonsStackView;
  void *v70;
  uint64_t v71;
  NSLayoutConstraint *actionButtonsStackViewWidthConstraint;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSLayoutConstraint *viewingModeBadgeWidthConstraint;
  void *v98;
  void *v99;
  _QWORD v101[4];
  id v102;
  id location;
  objc_super v104;

  v104.receiver = self;
  v104.super_class = (Class)AVInfoPanelDescriptionView;
  v3 = -[AVInfoPanelDescriptionView initWithFrame:](&v104, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v4, "setAlignment:", 3);
    objc_msgSend(v4, "setAxis:", 0);
    objc_msgSend(v4, "setDistribution:", 3);
    objc_msgSend(v4, "setSpacing:", 20.0);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVInfoPanelDescriptionView addSubview:](v3, "addSubview:", v4);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = objc_claimAutoreleasedReturnValue();
    textFont = v3->_textFont;
    v3->_textFont = (UIFont *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v7;

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B58], 1024);
    v9 = objc_claimAutoreleasedReturnValue();
    titleFont = v3->_titleFont;
    v3->_titleFont = (UIFont *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_claimAutoreleasedReturnValue();
    titleTextColor = v3->_titleTextColor;
    v3->_titleTextColor = (UIColor *)v11;

    objc_initWeak(&location, v3);
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __44__AVInfoPanelDescriptionView_initWithFrame___block_invoke;
    v101[3] = &unk_1E5BB2BE0;
    objc_copyWeak(&v102, &location);
    v13 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v101);
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    posterView = v3->_posterView;
    v3->_posterView = v14;

    v16 = v3->_posterView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIImageView setContentMode:](v3->_posterView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_posterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v3->_posterView, "setAccessibilityIdentifier:", CFSTR("AVPoster"));
    -[UIImageView layer](v3->_posterView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 8.0);

    -[UIImageView setClipsToBounds:](v3->_posterView, "setClipsToBounds:", 1);
    objc_msgSend(v4, "addArrangedSubview:", v3->_posterView);
    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    nextToPosterStackView = v3->_nextToPosterStackView;
    v3->_nextToPosterStackView = v19;

    -[UIStackView setAlignment:](v3->_nextToPosterStackView, "setAlignment:", 1);
    -[UIStackView setAxis:](v3->_nextToPosterStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_nextToPosterStackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v3->_nextToPosterStackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_nextToPosterStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addArrangedSubview:", v3->_nextToPosterStackView);
    v13[2](v13);
    v21 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v21;

    v23 = v3->_titleLabel;
    -[AVInfoPanelDescriptionView titleFont](v3, "titleFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    v25 = v3->_titleLabel;
    -[AVInfoPanelDescriptionView titleTextColor](v3, "titleTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("AVTitle"));
    -[UILabel _setTextAlignmentFollowsWritingDirection:](v3->_titleLabel, "_setTextAlignmentFollowsWritingDirection:", 1);
    -[UIStackView addArrangedSubview:](v3->_nextToPosterStackView, "addArrangedSubview:", v3->_titleLabel);
    v13[2](v13);
    v27 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v27;

    -[UILabel setAccessibilityIdentifier:](v3->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("AVSubtitle"));
    -[UILabel _setTextAlignmentFollowsWritingDirection:](v3->_subtitleLabel, "_setTextAlignmentFollowsWritingDirection:", 1);
    -[UIStackView addArrangedSubview:](v3->_nextToPosterStackView, "addArrangedSubview:", v3->_subtitleLabel);
    v29 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v29, "setAlignment:", 3);
    objc_msgSend(v29, "setAxis:", 0);
    objc_msgSend(v29, "setDistribution:", 3);
    objc_msgSend(v29, "setSpacing:", 12.0);
    v13[2](v13);
    v30 = objc_claimAutoreleasedReturnValue();
    seasonEpisodeLabel = v3->_seasonEpisodeLabel;
    v3->_seasonEpisodeLabel = (UILabel *)v30;

    -[UILabel setAccessibilityIdentifier:](v3->_seasonEpisodeLabel, "setAccessibilityIdentifier:", CFSTR("AVSeasonEpisode"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_seasonEpisodeLabel);
    v32 = objc_alloc_init(AVTomatoRatingView);
    tomatoRatingView = v3->_tomatoRatingView;
    v3->_tomatoRatingView = v32;

    v34 = v3->_tomatoRatingView;
    -[AVInfoPanelDescriptionView textFont](v3, "textFont");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView setFont:](v34, "setFont:", v35);

    v36 = v3->_tomatoRatingView;
    -[AVInfoPanelDescriptionView textColor](v3, "textColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTomatoRatingView setTextColor:](v36, "setTextColor:", v37);

    objc_msgSend(v29, "addArrangedSubview:", v3->_tomatoRatingView);
    v13[2](v13);
    v38 = objc_claimAutoreleasedReturnValue();
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = (UILabel *)v38;

    -[UILabel setAccessibilityIdentifier:](v3->_durationLabel, "setAccessibilityIdentifier:", CFSTR("AVDuration"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_durationLabel);
    v13[2](v13);
    v40 = objc_claimAutoreleasedReturnValue();
    genreLabel = v3->_genreLabel;
    v3->_genreLabel = (UILabel *)v40;

    -[UILabel setAccessibilityIdentifier:](v3->_genreLabel, "setAccessibilityIdentifier:", CFSTR("AVGenre"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_genreLabel);
    v13[2](v13);
    v42 = objc_claimAutoreleasedReturnValue();
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v42;

    -[UILabel setAccessibilityIdentifier:](v3->_dateLabel, "setAccessibilityIdentifier:", CFSTR("AVDate"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_dateLabel);
    v13[2](v13);
    v44 = objc_claimAutoreleasedReturnValue();
    mediaContentRatingLabel = v3->_mediaContentRatingLabel;
    v3->_mediaContentRatingLabel = (UILabel *)v44;

    -[UILabel setAccessibilityIdentifier:](v3->_mediaContentRatingLabel, "setAccessibilityIdentifier:", CFSTR("AVMediaContentRatingLabel"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_mediaContentRatingLabel);
    v46 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    mediaContentRatingImageView = v3->_mediaContentRatingImageView;
    v3->_mediaContentRatingImageView = v46;

    v48 = v3->_mediaContentRatingImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v48, "setBackgroundColor:", v49);

    -[UIImageView setContentMode:](v3->_mediaContentRatingImageView, "setContentMode:", 1);
    v50 = v3->_mediaContentRatingImageView;
    -[AVInfoPanelDescriptionView textColor](v3, "textColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v50, "setTintColor:", v51);

    -[UIImageView setAccessibilityIdentifier:](v3->_mediaContentRatingImageView, "setAccessibilityIdentifier:", CFSTR("AVMediaContentRatingImage"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_mediaContentRatingImageView);
    v52 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    viewingModeBadgeImageView = v3->_viewingModeBadgeImageView;
    v3->_viewingModeBadgeImageView = v52;

    v54 = v3->_viewingModeBadgeImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v54, "setBackgroundColor:", v55);

    -[UIImageView setContentMode:](v3->_viewingModeBadgeImageView, "setContentMode:", 1);
    v56 = v3->_viewingModeBadgeImageView;
    -[AVInfoPanelDescriptionView textColor](v3, "textColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v56, "setTintColor:", v57);

    -[UIImageView setAccessibilityIdentifier:](v3->_viewingModeBadgeImageView, "setAccessibilityIdentifier:", CFSTR("AVViewingModeImage"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_viewingModeBadgeImageView);
    v58 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    closedCaptionBadge = v3->_closedCaptionBadge;
    v3->_closedCaptionBadge = v58;

    v60 = v3->_closedCaptionBadge;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v60, "setBackgroundColor:", v61);

    -[UIImageView setContentMode:](v3->_closedCaptionBadge, "setContentMode:", 1);
    v62 = v3->_closedCaptionBadge;
    objc_msgSend((id)objc_opt_class(), "closedCaptioningBadgeImage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v62, "setImage:", v63);

    v64 = v3->_closedCaptionBadge;
    -[AVInfoPanelDescriptionView textColor](v3, "textColor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v64, "setTintColor:", v65);

    -[UIImageView setAccessibilityIdentifier:](v3->_closedCaptionBadge, "setAccessibilityIdentifier:", CFSTR("AVClosedCaptions"));
    objc_msgSend(v29, "addArrangedSubview:", v3->_closedCaptionBadge);
    v13[2](v13);
    v66 = objc_claimAutoreleasedReturnValue();
    summaryView = v3->_summaryView;
    v3->_summaryView = (UILabel *)v66;

    -[UILabel setNumberOfLines:](v3->_summaryView, "setNumberOfLines:", 5);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_summaryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_summaryView, "setAccessibilityIdentifier:", CFSTR("AVSummary"));
    -[UIStackView addArrangedSubview:](v3->_nextToPosterStackView, "addArrangedSubview:", v3->_summaryView);
    -[UIStackView addArrangedSubview:](v3->_nextToPosterStackView, "addArrangedSubview:", v29);
    v68 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    actionButtonsStackView = v3->_actionButtonsStackView;
    v3->_actionButtonsStackView = v68;

    -[UIStackView setAlignment:](v3->_actionButtonsStackView, "setAlignment:", 1);
    -[UIStackView setAxis:](v3->_actionButtonsStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_actionButtonsStackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v3->_actionButtonsStackView, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButtonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView widthAnchor](v3->_actionButtonsStackView, "widthAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToConstant:", 0.0);
    v71 = objc_claimAutoreleasedReturnValue();
    actionButtonsStackViewWidthConstraint = v3->_actionButtonsStackViewWidthConstraint;
    v3->_actionButtonsStackViewWidthConstraint = (NSLayoutConstraint *)v71;

    objc_msgSend(v4, "addArrangedSubview:", v3->_actionButtonsStackView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionView centerXAnchor](v3, "centerXAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v76);

    objc_msgSend(v4, "centerYAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVInfoPanelDescriptionView centerYAnchor](v3, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v79);

    objc_msgSend((id)objc_opt_class(), "layoutSize");
    v81 = v80;
    objc_msgSend(v4, "widthAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintLessThanOrEqualToConstant:", v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v83);

    -[AVInfoPanelDescriptionView heightAnchor](v3, "heightAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v86);

    -[AVInfoPanelDescriptionView widthAnchor](v3, "widthAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v89);

    objc_msgSend(v73, "addObject:", v3->_actionButtonsStackViewWidthConstraint);
    -[AVInfoPanelDescriptionView textFont](v3, "textFont");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "lineHeight");
    v92 = v91;

    -[UIImageView heightAnchor](v3->_viewingModeBadgeImageView, "heightAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToConstant:", v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v94);

    -[UIImageView widthAnchor](v3->_viewingModeBadgeImageView, "widthAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToConstant:", 0.0);
    v96 = objc_claimAutoreleasedReturnValue();
    viewingModeBadgeWidthConstraint = v3->_viewingModeBadgeWidthConstraint;
    v3->_viewingModeBadgeWidthConstraint = (NSLayoutConstraint *)v96;

    objc_msgSend(v73, "addObject:", v3->_viewingModeBadgeWidthConstraint);
    -[UIImageView heightAnchor](v3->_mediaContentRatingImageView, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToConstant:", v92);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addObject:", v99);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v73);
    -[AVInfoPanelDescriptionView _updateActionButtons](v3, "_updateActionButtons");

    objc_destroyWeak(&v102);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);
    -[UILabel setTextColor:](self->_seasonEpisodeLabel, "setTextColor:", v5);
    -[AVTomatoRatingView setTextColor:](self->_tomatoRatingView, "setTextColor:", v5);
    -[UILabel setTextColor:](self->_durationLabel, "setTextColor:", v5);
    -[UILabel setTextColor:](self->_genreLabel, "setTextColor:", v5);
    -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", v5);
    -[UILabel setTextColor:](self->_mediaContentRatingLabel, "setTextColor:", v5);
    -[UIImageView setTintColor:](self->_mediaContentRatingImageView, "setTintColor:", v5);
    -[UIImageView setTintColor:](self->_viewingModeBadgeImageView, "setTintColor:", v5);
    -[UIImageView setTintColor:](self->_closedCaptionBadge, "setTintColor:", v5);
    -[UILabel setTextColor:](self->_summaryView, "setTextColor:", v5);
  }

}

- (void)setTitleTextColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_titleTextColor != v5)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);
  }

}

- (void)setTextFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_textFont != v5)
  {
    objc_storeStrong((id *)&self->_textFont, a3);
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v5);
    -[UILabel setFont:](self->_seasonEpisodeLabel, "setFont:", v5);
    -[AVTomatoRatingView setFont:](self->_tomatoRatingView, "setFont:", v5);
    -[UILabel setFont:](self->_durationLabel, "setFont:", v5);
    -[UILabel setFont:](self->_genreLabel, "setFont:", v5);
    -[UILabel setFont:](self->_dateLabel, "setFont:", v5);
    -[UILabel setFont:](self->_mediaContentRatingLabel, "setFont:", v5);
    -[UILabel setFont:](self->_summaryView, "setFont:", v5);
  }

}

- (void)setTitleFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
  }

}

- (void)setActions:(id)a3
{
  NSArray *v4;
  NSArray *actions;

  if (self->_actions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    actions = self->_actions;
    self->_actions = v4;

    -[AVInfoPanelDescriptionView _updateActionButtons](self, "_updateActionButtons");
  }
}

- (void)_updateActionButtons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *actionButtonsStackViewWidthConstraint;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[UIStackView arrangedSubviews](self->_actionButtonsStackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[UIStackView removeArrangedSubview:](self->_actionButtonsStackView, "removeArrangedSubview:", v8);
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[AVInfoPanelDescriptionView actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setImagePadding:", 8.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBaseForegroundColor:", v16);

        objc_msgSend(v15, "background");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCornerRadius:", 16.0);

        objc_msgSend(v15, "setCornerStyle:", 3);
        objc_msgSend(v15, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
        objc_msgSend(v15, "setButtonSize:", 1);
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v18, "sizeToFit");
        objc_msgSend(v18, "widthAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", 180.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v20);

        -[UIStackView addArrangedSubview:](self->_actionButtonsStackView, "addArrangedSubview:", v18);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
  }

  -[AVInfoPanelDescriptionView actions](self, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  actionButtonsStackViewWidthConstraint = self->_actionButtonsStackViewWidthConstraint;
  if (v22)
  {
    -[NSLayoutConstraint setConstant:](actionButtonsStackViewWidthConstraint, "setConstant:", 196.0);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
  }
  else
  {
    -[NSLayoutConstraint setConstant:](actionButtonsStackViewWidthConstraint, "setConstant:", 0.0);
  }

}

- (UIFont)textFont
{
  return self->_textFont;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (double)contentTopMargin
{
  return self->_contentTopMargin;
}

- (void)setContentTopMargin:(double)a3
{
  self->_contentTopMargin = a3;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (UIStackView)nextToPosterStackView
{
  return self->_nextToPosterStackView;
}

- (UIStackView)actionButtonsStackView
{
  return self->_actionButtonsStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)seasonEpisodeLabel
{
  return self->_seasonEpisodeLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)genreLabel
{
  return self->_genreLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)mediaContentRatingLabel
{
  return self->_mediaContentRatingLabel;
}

- (UIImageView)mediaContentRatingImageView
{
  return self->_mediaContentRatingImageView;
}

- (UIImageView)viewingModeBadgeImageView
{
  return self->_viewingModeBadgeImageView;
}

- (UIImageView)closedCaptionBadge
{
  return self->_closedCaptionBadge;
}

- (AVTomatoRatingView)tomatoRatingView
{
  return self->_tomatoRatingView;
}

- (UILabel)summaryView
{
  return self->_summaryView;
}

- (UITapGestureRecognizer)summaryOverflowGestureRecognizer
{
  return self->_summaryOverflowGestureRecognizer;
}

- (NSLayoutConstraint)posterViewWidthConstraint
{
  return self->_posterViewWidthConstraint;
}

- (NSLayoutConstraint)posterViewHeightConstraint
{
  return self->_posterViewHeightConstraint;
}

- (NSLayoutConstraint)viewingModeBadgeWidthConstraint
{
  return self->_viewingModeBadgeWidthConstraint;
}

- (NSLayoutConstraint)actionButtonsStackViewWidthConstraint
{
  return self->_actionButtonsStackViewWidthConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonsStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewingModeBadgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_posterViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_posterViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_summaryOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_tomatoRatingView, 0);
  objc_storeStrong((id *)&self->_closedCaptionBadge, 0);
  objc_storeStrong((id *)&self->_viewingModeBadgeImageView, 0);
  objc_storeStrong((id *)&self->_mediaContentRatingImageView, 0);
  objc_storeStrong((id *)&self->_mediaContentRatingLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_genreLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_seasonEpisodeLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonsStackView, 0);
  objc_storeStrong((id *)&self->_nextToPosterStackView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
}

AVDarkModeCompatibleLabel *__44__AVInfoPanelDescriptionView_initWithFrame___block_invoke(id *a1)
{
  AVDarkModeCompatibleLabel *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_alloc_init(AVDarkModeCompatibleLabel);
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "textFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVDarkModeCompatibleLabel setFont:](v2, "setFont:", v4);

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVDarkModeCompatibleLabel setTextColor:](v2, "setTextColor:", v6);

  -[AVDarkModeCompatibleLabel setOpaque:](v2, "setOpaque:", 0);
  -[AVDarkModeCompatibleLabel setLineBreakMode:](v2, "setLineBreakMode:", 4);
  return v2;
}

+ (UIImage)closedCaptioningBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3870];
  AVBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("cc_mask"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "imageWithBaselineOffsetFromBottom:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

+ (CGSize)layoutSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 800.0;
  v3 = 148.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImage)posterImage
{
  return -[UIImageView image](self->_posterView, "image");
}

- (void)setPosterImage:(id)a3
{
  NSLayoutConstraint *posterViewWidthConstraint;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *posterViewHeightConstraint;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  id v26;

  v26 = a3;
  if (self->_posterViewHeightConstraint)
  {
    posterViewWidthConstraint = self->_posterViewWidthConstraint;
    if (posterViewWidthConstraint)
    {
      -[NSLayoutConstraint setActive:](posterViewWidthConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_posterViewHeightConstraint, "setActive:", 0);
    }
  }
  -[UIStackView systemLayoutSizeFittingSize:](self->_nextToPosterStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v6 = v5;
  -[AVInfoPanelDescriptionView textFont](self, "textFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;

  -[AVInfoPanelDescriptionView textFont](self, "textFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11;

  if (v26 && v6 > v12 * 3.0)
  {
    if (v9 * 5.0 >= v6)
      v6 = v9 * 5.0;
    -[UIImageView setImage:](self->_posterView, "setImage:", v26);
    -[UIImageView image](self->_posterView, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    -[UIImageView image](self->_posterView, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v15 / v17;

    -[UIImageView heightAnchor](self->_posterView, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", v6);
    v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    posterViewHeightConstraint = self->_posterViewHeightConstraint;
    self->_posterViewHeightConstraint = v20;

    -[UIImageView widthAnchor](self->_posterView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_posterView, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", v23, v18);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v25 = self->_posterViewWidthConstraint;
    self->_posterViewWidthConstraint = v24;

    -[NSLayoutConstraint setActive:](self->_posterViewHeightConstraint, "setActive:", 1);
    -[NSLayoutConstraint setActive:](self->_posterViewWidthConstraint, "setActive:", 1);
  }
  else
  {
    -[UIImageView setImage:](self->_posterView, "setImage:", 0);
    -[UIImageView setHidden:](self->_posterView, "setHidden:", 1);
  }

}

- (NSString)summaryText
{
  return -[UILabel text](self->_summaryView, "text");
}

- (void)setSummaryText:(id)a3
{
  UILabel *summaryView;
  id v5;
  uint64_t v6;

  summaryView = self->_summaryView;
  v5 = a3;
  -[UILabel setText:](summaryView, "setText:", v5);
  v6 = objc_msgSend(v5, "length");

  -[UILabel setHidden:](self->_summaryView, "setHidden:", v6 == 0);
}

- (void)setTitleText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_titleLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setSecondaryTitleText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_subtitleLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setSeasonEpisodeText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_seasonEpisodeLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setDurationText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_durationLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setGenreText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_genreLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setDateText:(id)a3
{
  UILabel *v4;
  id v5;

  v5 = a3;
  v4 = self->_dateLabel;
  -[UILabel setText:](v4, "setText:", v5);
  -[UILabel setHidden:](v4, "setHidden:", objc_msgSend(v5, "length") == 0);

}

- (void)setPosterViewHidden:(BOOL)a3
{
  -[UIImageView setHidden:](self->_posterView, "setHidden:", a3);
}

- (void)setClosedCaptionBadgeHidden:(BOOL)a3
{
  -[UIImageView setHidden:](self->_closedCaptionBadge, "setHidden:", a3);
}

- (void)setTomatoFreshness:(unint64_t)a3 rating:(float)a4 hidden:(BOOL)a5
{
  _BOOL8 v5;
  double v8;

  v5 = a5;
  -[AVTomatoRatingView setTomatoFreshness:](self->_tomatoRatingView, "setTomatoFreshness:", a3);
  *(float *)&v8 = a4;
  -[AVTomatoRatingView setTomatoRating:](self->_tomatoRatingView, "setTomatoRating:", v8);
  -[AVTomatoRatingView setHidden:](self->_tomatoRatingView, "setHidden:", v5);
}

- (void)setContentMediaRatingText:(id)a3 image:(id)a4
{
  UILabel *mediaContentRatingLabel;
  id v7;
  _BOOL8 v8;

  mediaContentRatingLabel = self->_mediaContentRatingLabel;
  v7 = a4;
  -[UILabel setText:](mediaContentRatingLabel, "setText:", a3);
  -[UIImageView setImage:](self->_mediaContentRatingImageView, "setImage:", v7);

  if (v7)
    v8 = 1;
  else
    v8 = a3 == 0;
  -[UIImageView setHidden:](self->_mediaContentRatingImageView, "setHidden:", v7 == 0);
  -[UILabel setHidden:](self->_mediaContentRatingLabel, "setHidden:", v8);
}

- (void)setViewingModeBadge:(int64_t)a3
{
  char v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  NSLayoutConstraint *viewingModeBadgeWidthConstraint;
  double v19;
  int v20;
  const char *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v5 = 0;
    v6 = CFSTR("Badge2");
  }
  else if (a3 == 1)
  {
    v5 = 0;
    v6 = CFSTR("Badge1");
  }
  else
  {
    v6 = 0;
    v5 = 1;
  }
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315650;
    v21 = "-[AVInfoPanelDescriptionView(Facade) setViewingModeBadge:]";
    v22 = 2048;
    v23 = a3;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s viewingModeBadge %ld ==> image %{public}@", (uint8_t *)&v20, 0x20u);
  }

  if ((v5 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0DC3870];
    AVBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:compatibleWithTraitCollection:", v6, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIImageView setImage:](self->_viewingModeBadgeImageView, "setImage:", v8);
  if (v8)
  {
    objc_msgSend(v8, "size");
    v14 = v12 / v13;
    -[AVInfoPanelDescriptionView textFont](self, "textFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineHeight");
    v17 = v16;

    viewingModeBadgeWidthConstraint = self->_viewingModeBadgeWidthConstraint;
    v19 = v14 * v17;
  }
  else
  {
    viewingModeBadgeWidthConstraint = self->_viewingModeBadgeWidthConstraint;
    v19 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](viewingModeBadgeWidthConstraint, "setConstant:", v19);
  -[UIImageView setHidden:](self->_viewingModeBadgeImageView, "setHidden:", v8 == 0);

}

@end
