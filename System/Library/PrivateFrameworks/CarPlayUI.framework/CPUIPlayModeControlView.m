@implementation CPUIPlayModeControlView

- (CPUIPlayModeControlView)initWithFrame:(CGRect)a3
{
  CPUIPlayModeControlView *v3;
  uint64_t v4;
  CPUIModernButton *moreButton;
  void *v6;
  void *v7;
  CPUIModernButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CPUIRepeatButton *repeatButton;
  void *v17;
  void *v18;
  uint64_t v19;
  CPUIModernButton *shuffleButton;
  void *v21;
  void *v22;
  CPUIModernButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CPUIModernButton *addToLibraryButton;
  void *v31;
  void *v32;
  CPUIModernButton *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  CPUIModernButton *playbackRateButton;
  CPUIModernButton *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSArray *mediaButtons;
  id v48;
  void *v49;
  uint64_t v50;
  UIStackView *stackView;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v74;
  _QWORD v75[2];
  _QWORD v76[2];
  void *v77;
  void *v78;
  _QWORD v79[3];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v74.receiver = self;
  v74.super_class = (Class)CPUIPlayModeControlView;
  v3 = -[CPUIPlayModeControlView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    moreButton = v3->_moreButton;
    v3->_moreButton = (CPUIModernButton *)v4;

    -[CPUIPlayModeControlView traitCollection](v3, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIEllipsisGlyph(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = v7;
    -[CPUIModernButton setImage:forState:](v3->_moreButton, "setImage:forState:", v7, 0);
    v8 = v3->_moreButton;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setImage:forState:](v8, "setImage:forState:", v11, 1);

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setHidden:](v3->_moreButton, "setHidden:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_moreButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingMoreButton"));
    CPUILocalizedStringForKey(CFSTR("MORE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v12;
    CPUILocalizedStringForKey(CFSTR("ELLIPSIS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setAccessibilityUserInputLabels:](v3->_moreButton, "setAccessibilityUserInputLabels:", v14);

    +[CPUIRepeatButton buttonWithType:](CPUIRepeatButton, "buttonWithType:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    repeatButton = v3->_repeatButton;
    v3->_repeatButton = (CPUIRepeatButton *)v15;

    -[CPUIRepeatButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_repeatButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIRepeatButton setHidden:](v3->_repeatButton, "setHidden:", 1);
    -[CPUIModernButton setShouldStaySelected:](v3->_repeatButton, "setShouldStaySelected:", 1);
    -[CPUIRepeatButton setAccessibilityIdentifier:](v3->_repeatButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingRepeatButton"));
    CPUILocalizedStringForKey(CFSTR("REPEAT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIRepeatButton setAccessibilityUserInputLabels:](v3->_repeatButton, "setAccessibilityUserInputLabels:", v18);

    v19 = objc_opt_new();
    shuffleButton = v3->_shuffleButton;
    v3->_shuffleButton = (CPUIModernButton *)v19;

    -[CPUIPlayModeControlView traitCollection](v3, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIShuffleGlyph(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = v22;
    -[CPUIModernButton setImage:forState:](v3->_shuffleButton, "setImage:forState:", v22, 0);
    v23 = v3->_shuffleButton;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "colorWithAlphaComponent:", 0.2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithTintColor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setImage:forState:](v23, "setImage:forState:", v26, 1);

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_shuffleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setHidden:](v3->_shuffleButton, "setHidden:", 1);
    -[CPUIModernButton setShouldStaySelected:](v3->_shuffleButton, "setShouldStaySelected:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_shuffleButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingShuffleButton"));
    CPUILocalizedStringForKey(CFSTR("SHUFFLE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setAccessibilityUserInputLabels:](v3->_shuffleButton, "setAccessibilityUserInputLabels:", v28);

    v29 = objc_opt_new();
    addToLibraryButton = v3->_addToLibraryButton;
    v3->_addToLibraryButton = (CPUIModernButton *)v29;

    -[CPUIPlayModeControlView traitCollection](v3, "traitCollection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIAddGlyph(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = v32;
    -[CPUIModernButton setImage:forState:](v3->_addToLibraryButton, "setImage:forState:", v32, 0);
    v33 = v3->_addToLibraryButton;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "colorWithAlphaComponent:", 0.2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "imageWithTintColor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setImage:forState:](v33, "setImage:forState:", v36, 1);

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_addToLibraryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton setHidden:](v3->_addToLibraryButton, "setHidden:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_addToLibraryButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingAddToLibraryButton"));
    CPUILocalizedStringForKey(CFSTR("ADD"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v37;
    CPUILocalizedStringForKey(CFSTR("PLUS"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setAccessibilityUserInputLabels:](v3->_addToLibraryButton, "setAccessibilityUserInputLabels:", v39);

    v40 = objc_opt_new();
    playbackRateButton = v3->_playbackRateButton;
    v3->_playbackRateButton = (CPUIModernButton *)v40;

    v42 = v3->_playbackRateButton;
    CPUIFormattedPlaybackRateString(&unk_24DF301C0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton setTitle:forState:](v42, "setTitle:forState:", v43, 0);

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_playbackRateButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton titleLabel](v3->_playbackRateButton, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAdjustsFontForContentSizeCategory:", 0);

    -[CPUIModernButton titleLabel](v3->_playbackRateButton, "titleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAdjustsFontSizeToFitWidth:", 1);

    -[CPUIModernButton setHidden:](v3->_playbackRateButton, "setHidden:", 1);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_playbackRateButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingPlaybackRateButton"));
    -[CPUIPlayModeControlView defaultPlayModeButtons](v3, "defaultPlayModeButtons");
    v46 = objc_claimAutoreleasedReturnValue();
    mediaButtons = v3->_mediaButtons;
    v3->_mediaButtons = (NSArray *)v46;

    v48 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[CPUIPlayModeControlView mediaButtons](v3, "mediaButtons");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "initWithArrangedSubviews:", v49);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v50;

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAxis:", 0);

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDistribution:", 3);

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlignment:", 3);

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingModeControlView"));

    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIPlayModeControlView addSubview:](v3, "addSubview:", v57);

    v70 = (void *)MEMORY[0x24BDD1628];
    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIPlayModeControlView bottomAnchor](v3, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v61;
    -[CPUIPlayModeControlView stackView](v3, "stackView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "centerXAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIPlayModeControlView centerXAnchor](v3, "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v66);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIPlayModeControlView layer](v3, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setCompositingFilter:", v67);

  }
  return v3;
}

- (id)defaultPlayModeButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  -[CPUIPlayModeControlView shuffleButton](self, "shuffleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIPlayModeControlView addToLibraryButton](self, "addToLibraryButton", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  -[CPUIPlayModeControlView moreButton](self, "moreButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  -[CPUIPlayModeControlView playbackRateButton](self, "playbackRateButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  -[CPUIPlayModeControlView repeatButton](self, "repeatButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setMediaButtons:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  NSArray *mediaButtons;
  NSArray *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = (NSArray *)a3;
  -[CPUIPlayModeControlView mediaButtons](self, "mediaButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__CPUIPlayModeControlView_setMediaButtons___block_invoke;
  v10[3] = &unk_24DF24070;
  v10[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  mediaButtons = self->_mediaButtons;
  self->_mediaButtons = v4;
  v8 = v4;

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __43__CPUIPlayModeControlView_setMediaButtons___block_invoke_2;
  v9[3] = &unk_24DF24070;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);

}

void __43__CPUIPlayModeControlView_setMediaButtons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", v3, sel_playModeButtonTapped_, 64);
  objc_msgSend(*(id *)(a1 + 32), "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeArrangedSubview:", v5);

  objc_msgSend(v5, "removeFromSuperview");
}

void __43__CPUIPlayModeControlView_setMediaButtons___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "addTarget:action:forControlEvents:", v3, sel_playModeButtonTapped_, 64);
  objc_msgSend(*(id *)(a1 + 32), "stackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v4);

}

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    -[CPUIPlayModeControlView _updateButtonLayouts](self, "_updateButtonLayouts");
  }
}

- (id)_visibleControlButtons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CPUIPlayModeControlView stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __49__CPUIPlayModeControlView__visibleControlButtons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (void)setButtonWidth:(double)a3
{
  if (vabdd_f64(a3, self->_buttonWidth) > 0.00000011920929)
  {
    self->_buttonWidth = a3;
    -[CPUIPlayModeControlView _updateButtonLayouts](self, "_updateButtonLayouts");
  }
}

- (void)setButtonSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_buttonSpacing) > 0.00000011920929)
  {
    self->_buttonSpacing = a3;
    -[CPUIPlayModeControlView _updateButtonLayouts](self, "_updateButtonLayouts");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[CPUIPlayModeControlView _updateButtonLayouts](self, "_updateButtonLayouts");
  v3.receiver = self;
  v3.super_class = (Class)CPUIPlayModeControlView;
  -[CPUIPlayModeControlView layoutSubviews](&v3, sel_layoutSubviews);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  CPUIModernButton *moreButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CPUIModernButton *shuffleButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CPUIModernButton *addToLibraryButton;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CPUIPlayModeControlView;
  -[CPUIPlayModeControlView traitCollectionDidChange:](&v22, sel_traitCollectionDidChange_, a3);
  -[CPUIPlayModeControlView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIEllipsisGlyph(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIModernButton setImage:forState:](self->_moreButton, "setImage:forState:", v5, 0);
  moreButton = self->_moreButton;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setImage:forState:](moreButton, "setImage:forState:", v9, 1);

  -[CPUIPlayModeControlView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIShuffleGlyph(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIModernButton setImage:forState:](self->_shuffleButton, "setImage:forState:", v11, 0);
  shuffleButton = self->_shuffleButton;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithAlphaComponent:", 0.2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithTintColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setImage:forState:](shuffleButton, "setImage:forState:", v15, 1);

  -[CPUIPlayModeControlView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIAddGlyph(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIModernButton setImage:forState:](self->_addToLibraryButton, "setImage:forState:", v17, 0);
  addToLibraryButton = self->_addToLibraryButton;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithTintColor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIModernButton setImage:forState:](addToLibraryButton, "setImage:forState:", v21, 1);

}

- (void)_updateButtonLayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSArray *v12;
  NSArray *activeButtonLayoutConstraints;
  id v14;
  _QWORD v15[4];
  id v16;
  CPUIPlayModeControlView *v17;

  if (self->_activeButtonLayoutConstraints)
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIPlayModeControlView _visibleControlButtons](self, "_visibleControlButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__CPUIPlayModeControlView__updateButtonLayouts__block_invoke;
  v15[3] = &unk_24DF240D8;
  v14 = v3;
  v16 = v14;
  v17 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  v5 = objc_msgSend(v4, "count") - 1;
  -[UIStackView widthAnchor](self->_stackView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIPlayModeControlView buttonWidth](self, "buttonWidth");
  v8 = v7;
  v9 = (double)(unint64_t)objc_msgSend(v4, "count");
  -[CPUIPlayModeControlView buttonSpacing](self, "buttonSpacing");
  objc_msgSend(v6, "constraintEqualToConstant:", v10 * (double)(unint64_t)v5 + v8 * v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v11);

  v12 = (NSArray *)objc_msgSend(v14, "copy");
  activeButtonLayoutConstraints = self->_activeButtonLayoutConstraints;
  self->_activeButtonLayoutConstraints = v12;

  if (-[NSArray count](self->_activeButtonLayoutConstraints, "count"))
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_activeButtonLayoutConstraints);

}

void __47__CPUIPlayModeControlView__updateButtonLayouts__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "buttonWidth");
  objc_msgSend(v5, "constraintGreaterThanOrEqualToConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "heightAnchor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "constraintEqualToConstant:", 26.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)playModeButtonTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPUIPlayModeControlView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CPUIPlayModeControlView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playModeControlView:didSelectButton:", self, v7);

  }
}

- (CPUIPlayModeControlViewDelegate)delegate
{
  return (CPUIPlayModeControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fuseSubscriberLayout
{
  return self->_fuseSubscriberLayout;
}

- (void)setFuseSubscriberLayout:(BOOL)a3
{
  self->_fuseSubscriberLayout = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)mediaButtons
{
  return self->_mediaButtons;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (CPUIModernButton)shuffleButton
{
  return self->_shuffleButton;
}

- (CPUIModernButton)addToLibraryButton
{
  return self->_addToLibraryButton;
}

- (CPUIModernButton)moreButton
{
  return self->_moreButton;
}

- (CPUIModernButton)playbackRateButton
{
  return self->_playbackRateButton;
}

- (CPUIRepeatButton)repeatButton
{
  return self->_repeatButton;
}

- (NSArray)activeButtonLayoutConstraints
{
  return self->_activeButtonLayoutConstraints;
}

- (void)setActiveButtonLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeButtonLayoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeButtonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_repeatButton, 0);
  objc_storeStrong((id *)&self->_playbackRateButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_addToLibraryButton, 0);
  objc_storeStrong((id *)&self->_shuffleButton, 0);
  objc_storeStrong((id *)&self->_mediaButtons, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
