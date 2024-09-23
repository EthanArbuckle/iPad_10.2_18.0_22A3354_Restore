@implementation CPUISongDetailsView

- (CPUISongDetailsView)initWithFrame:(CGRect)a3
{
  CPUISongDetailsView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIStackView *stackView;
  CPUISongAttributionView *v11;
  CPUISongAttributionView *attributionView;
  double v13;
  double v14;
  CPUITitleView *v15;
  CPUITitleView *titleView;
  double v17;
  double v18;
  uint64_t v19;
  UILabel *artistLabel;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  CPUIModernButton *albumArtistLabelButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _CPUIAlbumContainer *v32;
  _CPUIAlbumContainer *albumContainer;
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
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[4];

  v51[3] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)CPUISongDetailsView;
  v3 = -[CPUISongDetailsView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v9;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 0.0);
    -[UIStackView setAccessibilityIdentifier:](v3->_stackView, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingSongDetailsView"));
    -[CPUISongDetailsView addSubview:](v3, "addSubview:", v3->_stackView);
    v11 = -[CPUISongAttributionView initWithFrame:]([CPUISongAttributionView alloc], "initWithFrame:", v5, v6, v7, v8);
    attributionView = v3->_attributionView;
    v3->_attributionView = v11;

    -[CPUISongAttributionView setHidden:](v3->_attributionView, "setHidden:", 1);
    LODWORD(v13) = 1144750080;
    -[CPUISongAttributionView setContentCompressionResistancePriority:forAxis:](v3->_attributionView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[CPUISongAttributionView setContentHuggingPriority:forAxis:](v3->_attributionView, "setContentHuggingPriority:forAxis:", 1, v14);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_attributionView);
    -[UIStackView setCustomSpacing:afterView:](v3->_stackView, "setCustomSpacing:afterView:", v3->_attributionView, 3.0);
    v15 = -[CPUITitleView initWithFrame:]([CPUITitleView alloc], "initWithFrame:", v5, v6, v7, v8);
    titleView = v3->_titleView;
    v3->_titleView = v15;

    LODWORD(v17) = 1144750080;
    -[CPUITitleView setContentCompressionResistancePriority:forAxis:](v3->_titleView, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    -[CPUITitleView setContentHuggingPriority:forAxis:](v3->_titleView, "setContentHuggingPriority:forAxis:", 1, v18);
    -[CPUITitleView setAccessibilityIdentifier:](v3->_titleView, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingSongTitle"));
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_titleView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    artistLabel = v3->_artistLabel;
    v3->_artistLabel = (UILabel *)v19;

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_artistLabel, "setTextColor:", v21);

    LODWORD(v22) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_artistLabel, "setContentCompressionResistancePriority:forAxis:", 1, v22);
    LODWORD(v23) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_artistLabel, "setContentHuggingPriority:forAxis:", 1, v23);
    -[UILabel setAccessibilityIdentifier:](v3->_artistLabel, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingSongArtist"));
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_artistLabel);
    v24 = objc_opt_new();
    albumArtistLabelButton = v3->_albumArtistLabelButton;
    v3->_albumArtistLabelButton = (CPUIModernButton *)v24;

    -[CPUIModernButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_albumArtistLabelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIModernButton titleLabel](v3->_albumArtistLabelButton, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLineBreakMode:", 4);

    -[CPUIModernButton setEnabled:](v3->_albumArtistLabelButton, "setEnabled:", 0);
    -[CPUIModernButton setTintAdjustmentMode:](v3->_albumArtistLabelButton, "setTintAdjustmentMode:", 1);
    -[CPUIModernButton setContentEdgeInsets:](v3->_albumArtistLabelButton, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 4.0);
    -[CPUIModernButton _setContinuousCornerRadius:](v3->_albumArtistLabelButton, "_setContinuousCornerRadius:", 4.0);
    -[CPUIModernButton setAccessibilityIdentifier:](v3->_albumArtistLabelButton, "setAccessibilityIdentifier:", CFSTR("CPNowPlayingSongAlbum"));
    -[CPUIModernButton layer](v3->_albumArtistLabelButton, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCompositingFilter:", 0);

    -[CPUIModernButton layer](v3->_albumArtistLabelButton, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton _titleView](v3->_albumArtistLabelButton, "_titleView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCompositingFilter:", v29);

    v32 = -[_CPUIAlbumContainer initWithButton:]([_CPUIAlbumContainer alloc], "initWithButton:", v3->_albumArtistLabelButton);
    albumContainer = v3->_albumContainer;
    v3->_albumContainer = v32;

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_albumContainer);
    v48 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView leadingAnchor](v3, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v35;
    -[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView trailingAnchor](v3, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v38;
    -[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView centerYAnchor](v3, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v42);

    -[CPUISongDetailsView _updateFont](v3, "_updateFont");
    -[CPUISongDetailsView layer](v3, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAllowsGroupBlending:", 0);

    -[CPUISongDetailsView stackView](v3, "stackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", v3, sel__updateFont, *MEMORY[0x24BED2720], 0);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CPUISongDetailsView stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPUIModernButton *v5;
  CPUIModernButton *albumArtistLabelButton;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (CPUIModernButton *)objc_claimAutoreleasedReturnValue();
  albumArtistLabelButton = self->_albumArtistLabelButton;

  if (v5 == albumArtistLabelButton)
  {
    -[CPUIModernButton _titleView](self->_albumArtistLabelButton, "_titleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", 0);

    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[_CPUIAlbumContainer layer](self->_albumContainer, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIModernButton _titleView](self->_albumArtistLabelButton, "_titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v7);

    -[_CPUIAlbumContainer layer](self->_albumContainer, "layer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", 0);
  }

}

- (id)_attributedTitle
{
  void *v3;
  id v4;
  NSString *trackTitle;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (!-[NSString length](self->_trackTitle, "length"))
    return 0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  trackTitle = self->_trackTitle;
  v6 = *MEMORY[0x24BDF6628];
  v14[0] = v3;
  v7 = *MEMORY[0x24BDF65F8];
  v13[0] = v6;
  v13[1] = v7;
  -[CPUISongDetailsView titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithString:attributes:", trackTitle, v10);

  return v11;
}

- (void)setTrackTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_storeStrong((id *)&self->_trackTitle, a3);
  -[CPUISongDetailsView _attributedTitle](self, "_attributedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v4);

  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

- (void)setAlbumTitle:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_albumTitle, a3);
  v5 = a3;
  -[CPUISongDetailsView albumArtistLabelButton](self, "albumArtistLabelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

- (void)setArtistName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_artistName, a3);
  v5 = a3;
  -[UILabel setText:](self->_artistLabel, "setText:", v5);

  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

- (void)setFontStyle:(unint64_t)a3
{
  self->_fontStyle = a3;
  -[CPUISongDetailsView _updateFont](self, "_updateFont");
}

- (void)setMaximumTitleViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  -[CPUISongDetailsView maximumTitleViewSize](self, "maximumTitleViewSize");
  if (v7 != width || v6 != height)
  {
    self->_maximumTitleViewSize.width = width;
    self->_maximumTitleViewSize.height = height;
    -[CPUISongDetailsView titleView](self, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUISongDetailsView maximumTitleViewSize](self, "maximumTitleViewSize");
    objc_msgSend(v10, "setPreferredMaxLayoutWidth:");

  }
  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

- (CPUIModernButton)attributionButton
{
  void *v2;
  void *v3;

  -[CPUISongDetailsView attributionView](self, "attributionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPUIModernButton *)v3;
}

- (NSString)attributionName
{
  void *v2;
  void *v3;

  -[CPUISongDetailsView attributionView](self, "attributionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributionName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPUISongDetailsView attributionView](self, "attributionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

- (UIImage)attributionArtwork
{
  void *v2;
  void *v3;

  -[CPUISongDetailsView attributionView](self, "attributionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setAttributionArtwork:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPUISongDetailsView attributionView](self, "attributionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArtwork:", v4);

}

- (void)_updateNumberOfLines
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSUInteger v27;
  double v28;
  float v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double Height;
  double v36;
  unint64_t v37;
  double v38;
  void *v40;
  void *v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[CPUISongDetailsView attributionName](self, "attributionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 432;
  -[UILabel text](self->_artistLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") == 0;

  -[UILabel setHidden:](self->_artistLabel, "setHidden:", v6);
  if (v3)
  {
    v7 = 1;
  }
  else
  {
    -[CPUIModernButton titleForState:](self->_albumArtistLabelButton, "titleForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "length") == 0;

  }
  -[_CPUIAlbumContainer setHidden:](self->_albumContainer, "setHidden:", v7);
  -[CPUISongAttributionView setHidden:](self->_attributionView, "setHidden:", v3 == 0);
  -[CPUITitleView titleLabel](self->_titleView, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 1);

  if (!-[NSString length](self->_trackTitle, "length"))
    goto LABEL_28;
  -[CPUISongDetailsView maximumTitleViewSize](self, "maximumTitleViewSize");
  if (v11 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
    goto LABEL_28;
  -[CPUISongDetailsView _attributedTitle](self, "_attributedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF65F8], 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView maximumTitleViewSize](self, "maximumTitleViewSize");
  v17 = v16;
  v19 = v18;
  if (-[CPUITitleView isExplicitTrack](self->_titleView, "isExplicitTrack"))
    v20 = v17 + -20.0;
  else
    v20 = v17;
  objc_msgSend(v14, "lineHeight");
  v22 = v21;
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, v20, v19);
  v43 = CGRectIntegral(v42);
  v23 = CGRectGetHeight(v43) / v22;
  -[CPUISongDetailsView stackView](self, "stackView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "spacing");
  v26 = v19 - v25 - v22;
  v27 = -[NSString length](self->_artistName, "length");
  if (v27)
  {
    -[UILabel font](self->_artistLabel, "font");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "lineHeight");
  }
  else
  {
    v28 = 0.0;
  }
  v29 = v23;
  v30 = v26 - v28;
  if (!-[NSString length](self->_albumTitle, "length"))
  {
    if (!v3)
    {
      v34 = 0.0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v3)
  {
LABEL_19:
    -[CPUISongAttributionView frame](self->_attributionView, "frame");
    Height = CGRectGetHeight(v44);
    -[UIStackView customSpacingAfterView:](self->_stackView, "customSpacingAfterView:", self->_attributionView);
    v34 = Height + v36;
    goto LABEL_20;
  }
  -[CPUIModernButton titleLabel](self->_albumArtistLabelButton, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "font");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lineHeight");
  v34 = v33;

LABEL_20:
  v37 = vcvtps_u32_f32(v29);
  v38 = v30 - v34;
  if (v27)

  if (v37 >= 2 && v38 >= v22 + v22)
  {
    -[CPUITitleView titleLabel](self->_titleView, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setNumberOfLines:", 2);

  }
LABEL_28:
  -[CPUISongDetailsView titleView](self, "titleView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "invalidateIntrinsicContentSize");

  -[CPUISongDetailsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFont
{
  unint64_t fontStyle;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  fontStyle = self->_fontStyle;
  v4 = fontStyle == 1;
  if (fontStyle == 1)
    v5 = (void *)*MEMORY[0x24BDF7858];
  else
    v5 = (void *)*MEMORY[0x24BDF77B8];
  if (v4)
    v6 = (void *)*MEMORY[0x24BDF77B8];
  else
    v6 = (void *)*MEMORY[0x24BDF77C0];
  v42 = v5;
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDF6A78];
  -[CPUISongDetailsView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v42, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDF6A70];
  -[CPUISongDetailsView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  objc_msgSend(v11, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fontDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDF6A70];
  -[CPUISongDetailsView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v10, "symbolicTraits") | 0x8002);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = _AXSCarPlayEnhanceTextLegibilityEnabled();
  v21 = (double *)MEMORY[0x24BDF7868];
  if (!v20)
    v21 = (double *)MEMORY[0x24BDF7888];
  v22 = *v21;
  v47 = *MEMORY[0x24BDF78A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = *MEMORY[0x24BDF7770];
  v25 = v45;
  v46 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v25;
  v44 = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fontDescriptorByAddingAttributes:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v19, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView titleView](self, "titleView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFont:", v30);

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v29, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView albumArtistLabelButton](self, "albumArtistLabelButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v32);

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v29, 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView attributionView](self, "attributionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "button");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFont:", v35);

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v27, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUISongDetailsView artistLabel](self, "artistLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFont:", v39);

  -[CPUISongDetailsView _updateNumberOfLines](self, "_updateNumberOfLines");
}

+ (double)minimumHeightForTrackInfoFontStyle:(unint64_t)a3
{
  double result;

  result = 44.0;
  if (a3 == 1)
    return 66.0;
  return result;
}

+ (double)maximumHeightForTrackInfoFontStyle:(unint64_t)a3
{
  double result;

  result = 72.0;
  if (a3 == 1)
    return 106.0;
  return result;
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (CPUITitleView)titleView
{
  return self->_titleView;
}

- (UILabel)artistLabel
{
  return self->_artistLabel;
}

- (void)setArtistLabel:(id)a3
{
  objc_storeStrong((id *)&self->_artistLabel, a3);
}

- (CPUIModernButton)albumArtistLabelButton
{
  return self->_albumArtistLabelButton;
}

- (NSString)trackTitle
{
  return self->_trackTitle;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (CGSize)maximumTitleViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumTitleViewSize.width;
  height = self->_maximumTitleViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (_CPUIAlbumContainer)albumContainer
{
  return self->_albumContainer;
}

- (void)setAlbumContainer:(id)a3
{
  objc_storeStrong((id *)&self->_albumContainer, a3);
}

- (CPUISongAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_albumContainer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_trackTitle, 0);
  objc_storeStrong((id *)&self->_albumArtistLabelButton, 0);
  objc_storeStrong((id *)&self->_artistLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
