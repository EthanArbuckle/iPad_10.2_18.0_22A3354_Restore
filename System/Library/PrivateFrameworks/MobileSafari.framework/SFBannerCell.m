@implementation SFBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("Banner");
}

- (SFBannerCell)initWithStyle:(int64_t)a3
{
  return -[SFBannerCell initWithFrame:style:](self, "initWithFrame:style:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SFBannerCell)initWithFrame:(CGRect)a3
{
  return -[SFBannerCell initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFBannerCell)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SFBannerCell *v5;
  SFBannerCell *v6;
  void *v7;
  uint64_t v8;
  SFBannerBackgroundView *backgroundView;
  void *v10;
  uint64_t v11;
  UILabel *titleLabel;
  UILabel *v13;
  UILabel *messageLabel;
  double v15;
  double v16;
  UIButton *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  UIButton *dismissButton;
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
  uint64_t v40;
  NSArray *minimalLayoutConstraints;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSArray *prominentLayoutConstraints;
  SFBannerCell *v52;
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
  objc_super v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[5];
  _QWORD v78[2];
  _QWORD v79[7];

  v79[5] = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)SFBannerCell;
  v5 = -[SFBannerCell initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_bannerStyle = a4;
    -[SFBannerCell defaultBackgroundConfiguration](v5, "defaultBackgroundConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVisualEffectView sf_startPageCellBackgroundEffectViewWithShadow:](SFBannerBackgroundView, "sf_startPageCellBackgroundEffectViewWithShadow:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (SFBannerBackgroundView *)v8;

    -[SFBannerBackgroundView _setGroupName:](v6->_backgroundView, "_setGroupName:", 0);
    v73 = v7;
    objc_msgSend(v7, "setCustomView:", v6->_backgroundView);
    objc_msgSend(v7, "setCornerRadius:", 10.0);
    -[SFBannerCell setBackgroundConfiguration:](v6, "setBackgroundConfiguration:", v7);
    -[SFBannerCell contentView](v6, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3990], "sf_startPageBannerTitleLabelWithFont:", v72);
    v11 = objc_claimAutoreleasedReturnValue();
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v6->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    messageLabel = v6->_messageLabel;
    v6->_messageLabel = v13;

    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_messageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v6->_messageLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_messageLabel, "setContentHuggingPriority:forAxis:", 1, v15);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_messageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    objc_msgSend(v10, "addSubview:", v6->_messageLabel);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _sf_setMatchesIntrinsicContentSize](v17, "_sf_setMatchesIntrinsicContentSize");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3658];
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __makeDismissButton_block_invoke_0;
    v75[3] = &unk_1E21E41A8;
    v76 = v18;
    v20 = v18;
    objc_msgSend(v19, "colorWithDynamicProvider:", v75);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithTintColor:renderingMode:", v21, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v17, "setTintColor:", v20);
    -[UIButton setImage:forState:](v17, "setImage:forState:", v22, 0);
    -[UIButton setImage:forState:](v17, "setImage:forState:", v23, 1);

    dismissButton = v6->_dismissButton;
    v6->_dismissButton = v17;

    -[UIButton addTarget:action:forControlEvents:](v6->_dismissButton, "addTarget:action:forControlEvents:", v6, sel__dismiss_, 0x2000);
    v71 = v10;
    objc_msgSend(v10, "addSubview:", v6->_dismissButton);
    objc_msgSend(v10, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton topAnchor](v6->_dismissButton, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v67);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v65;
    -[UIButton trailingAnchor](v6->_dismissButton, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v59;
    -[UIButton bottomAnchor](v6->_dismissButton, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v54);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v26;
    -[UILabel leadingAnchor](v6->_messageLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v25;
    objc_msgSend(v25, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v29;
    -[UILabel bottomAnchor](v6->_messageLabel, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v33);

    -[UILabel topAnchor](v6->_messageLabel, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v36;
    -[UIButton leadingAnchor](v6->_dismissButton, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v6->_messageLabel, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v38, 1.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v40 = objc_claimAutoreleasedReturnValue();
    minimalLayoutConstraints = v6->_minimalLayoutConstraints;
    v6->_minimalLayoutConstraints = (NSArray *)v40;

    -[UILabel topAnchor](v6->_titleLabel, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v68);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v66;
    -[UILabel leadingAnchor](v6->_titleLabel, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v62);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v60;
    -[UILabel trailingAnchor](v6->_titleLabel, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v43;
    -[UILabel topAnchor](v6->_messageLabel, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v6->_titleLabel, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v45, 1.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v46;
    -[UILabel trailingAnchor](v6->_messageLabel, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
    v50 = objc_claimAutoreleasedReturnValue();
    prominentLayoutConstraints = v6->_prominentLayoutConstraints;
    v6->_prominentLayoutConstraints = (NSArray *)v50;

    -[SFBannerCell _updateStyle](v6, "_updateStyle");
    v52 = v6;

  }
  return v6;
}

- (SFBannerCell)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFBannerCell;
  return -[SFBannerCell initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_updateStyle
{
  int64_t bannerStyle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel **p_messageLabel;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_minimalLayoutConstraints, self->_bannerStyle == 0);
  objc_msgSend(MEMORY[0x1E0CB3718], "sf_setConstraints:active:", self->_prominentLayoutConstraints, self->_bannerStyle == 1);
  -[SFBannerBackgroundView setBannerStyle:](self->_backgroundView, "setBannerStyle:", self->_bannerStyle);
  -[UIButton setHidden:](self->_dismissButton, "setHidden:", self->_dismissHandler == 0);
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", self->_bannerStyle == 0);
  bannerStyle = self->_bannerStyle;
  if (bannerStyle == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    p_messageLabel = &self->_messageLabel;
    -[UILabel setFont:](self->_messageLabel, "setFont:", v10);

    -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (bannerStyle)
      return;
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v6, "fontWithDescriptor:size:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    p_messageLabel = &self->_messageLabel;
    -[UILabel setFont:](self->_messageLabel, "setFont:", v7);

    -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UILabel setTextColor:](*p_messageLabel, "setTextColor:", v9);

  UIEdgeInsetsMakeWithEdges();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SFBannerCell contentView](self, "contentView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLayoutMargins:", v12, v14, v16, v18);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)SFBannerCell;
  -[SFBannerCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setPreferredMaxLayoutWidth:](self->_titleLabel, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v4));
  -[UILabel frame](self->_messageLabel, "frame");
  -[UILabel setPreferredMaxLayoutWidth:](self->_messageLabel, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v5));
}

- (id)focusEffect
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[SFBannerCell bounds](self, "bounds");
  return (id)objc_msgSend(v2, "effectWithRoundedRect:cornerRadius:curve:", *MEMORY[0x1E0CD2A68]);
}

- (void)_dismiss:(id)a3
{
  (*((void (**)(void))self->_dismissHandler + 2))();
}

- (void)configureUsingBanner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedStringWithAttachment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      if (-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
      {
        objc_msgSend(v9, "appendAttributedString:", v7);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v9, "appendAttributedString:", v10);

        v11 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v20, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithString:", v12);
        objc_msgSend(v9, "appendAttributedString:", v13);

      }
      else
      {
        v14 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v20, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
        objc_msgSend(v9, "appendAttributedString:", v16);

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v9, "appendAttributedString:", v17);

        objc_msgSend(v9, "appendAttributedString:", v7);
      }
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v9);

    }
    else
    {
      -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v7);
    }
  }
  else
  {
    objc_msgSend(v20, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_titleLabel, "setText:", v7);
  }

  objc_msgSend(v20, "message");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_messageLabel, "setText:", v18);

  objc_msgSend(v20, "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBannerCell setDismissHandler:](self, "setDismissHandler:", v19);

  -[SFBannerCell setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v20, "userInterfaceStyle"));
  -[SFBannerCell setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[SFBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_messageLabel, "setText:", a3);
  -[SFBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  id dismissHandler;

  v4 = _Block_copy(a3);
  dismissHandler = self->_dismissHandler;
  self->_dismissHandler = v4;

  -[SFBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBannerStyle:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_bannerStyle != a3)
  {
    self->_bannerStyle = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __31__SFBannerCell_setBannerStyle___block_invoke;
    v3[3] = &unk_1E21E2050;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

uint64_t __31__SFBannerCell_setBannerStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (int64_t)bannerStyle
{
  return self->_bannerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_prominentLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_minimalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
