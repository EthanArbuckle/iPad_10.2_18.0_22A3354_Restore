@implementation MediaControlsRouteView

- (MediaControlsRouteView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MediaControlsRouteView *v7;
  uint64_t v8;
  CCUICAPackageView *packageView;
  uint64_t v10;
  UILabel *titleLabel;
  id v12;
  uint64_t v13;
  UILabel *messageLabel;
  double v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)MediaControlsRouteView;
  v7 = -[MediaControlsRouteView initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D14770]), "initWithFrame:", x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v8;

    -[CCUICAPackageView setUserInteractionEnabled:](v7->_packageView, "setUserInteractionEnabled:", 0);
    -[CCUICAPackageView setScale:](v7->_packageView, "setScale:", 1.5);
    -[MediaControlsRouteView addSubview:](v7, "addSubview:", v7->_packageView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v10;

    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 2);
    -[MediaControlsRouteView addSubview:](v7, "addSubview:", v7->_titleLabel);
    v12 = objc_alloc(MEMORY[0x1E0DC3990]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    messageLabel = v7->_messageLabel;
    v7->_messageLabel = (UILabel *)v13;

    -[UILabel setNumberOfLines:](v7->_messageLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v7->_messageLabel, "setTextAlignment:", 1);
    LODWORD(v15) = 1051931443;
    -[UILabel _setHyphenationFactor:](v7->_messageLabel, "_setHyphenationFactor:", v15);
    -[UILabel setAlpha:](v7->_messageLabel, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_messageLabel, "setTextColor:", v16);

    -[MediaControlsRouteView addSubview:](v7, "addSubview:", v7->_messageLabel);
    -[MediaControlsRouteView _contentSizeCategoryDidChange](v7, "_contentSizeCategoryDidChange");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  CGFloat v28;
  uint64_t v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  id *v52;
  uint64_t v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v54.receiver = self;
  v54.super_class = (Class)MediaControlsRouteView;
  -[MediaControlsRouteView layoutSubviews](&v54, sel_layoutSubviews);
  -[MediaControlsRouteView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_labelHidden)
  {
    -[MediaControlsRouteView bounds](self, "bounds");
    UIRectCenteredIntegralRect();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
    v55.origin.x = v12;
    v55.origin.y = v14;
    v55.size.width = v16;
    v55.size.height = v18;
    CGRectGetMaxY(v55);
    UIRectInset();
    v22 = v21;
    v24 = v23;
    v25 = v19;
    v26 = v20;
    v27 = 448;
  }
  else
  {
    v28 = CGRectGetHeight(*(CGRect *)&v3) + -48.0;
    v56.origin.x = v7;
    v56.origin.y = v8;
    v56.size.width = v9;
    v56.size.height = v10;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v56), v28);
    v53 = v29;
    UIRectCenteredXInRect();
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
    v57.origin.x = v31;
    v57.origin.y = v33;
    v57.size.width = v35;
    v57.size.height = v37;
    CGRectGetMaxY(v57);
    UIRectInset();
    x = v58.origin.x;
    y = v58.origin.y;
    width = v58.size.width;
    height = v58.size.height;
    CGRectGetMinY(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    CGRectGetWidth(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    CGRectGetHeight(v60);
    UIRectCenteredXInRect();
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    v61.origin.x = v43;
    v61.origin.y = v45;
    v61.size.width = v47;
    v61.size.height = v49;
    CGRectGetHeight(v61);
    UIRectInset();
    v22 = v50;
    v24 = v51;
    v25 = v19;
    v26 = v20;
    v27 = 464;
  }
  v52 = (id *)((char *)&self->super.super.super.isa + v27);
  objc_msgSend(*v52, "sizeThatFits:", v19, v20, v53);
  v62.origin.x = v22;
  v62.origin.y = v24;
  v62.size.width = v25;
  v62.size.height = v26;
  CGRectGetMinY(v62);
  v63.origin.x = v22;
  v63.origin.y = v24;
  v63.size.width = v25;
  v63.size.height = v26;
  CGRectGetWidth(v63);
  v64.origin.x = v22;
  v64.origin.y = v24;
  v64.size.width = v25;
  v64.size.height = v26;
  CGRectGetHeight(v64);
  UIRectCenteredXInRect();
  objc_msgSend(*v52, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  if (self->_labelHidden)
  {
    v4 = 48.0;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
    v4 = v5 + 48.0;
  }
  v6 = width;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MediaControlsRouteView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPackageName:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_packageName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_packageName, a3);
    v5 = (void *)MEMORY[0x1E0D14768];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptionForPackageNamed:inBundle:", v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackageDescription:](self->_packageView, "setPackageDescription:", v7);

  }
}

- (void)setGlyphState:(id)a3
{
  -[CCUICAPackageView setStateName:](self->_packageView, "setStateName:", a3);
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v7;

  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v7 = v5;
    -[MTVisualStylingProvider _removeObserver:](visualStylingProvider, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[MTVisualStylingProvider _addObserver:](self->_visualStylingProvider, "_addObserver:", self);
    -[MediaControlsRouteView _updateLabelVisualStyling](self, "_updateLabelVisualStyling");
    v5 = v7;
  }

}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  -[MediaControlsRouteView _updateLabelVisualStyling](self, "_updateLabelVisualStyling");
  -[MediaControlsRouteView setNeedsLayout](self, "setNeedsLayout");
}

- (void)showMessage:(id)a3
{
  _QWORD v4[5];

  -[UILabel setText:](self->_messageLabel, "setText:", a3);
  -[MediaControlsRouteView setNeedsLayout](self, "setNeedsLayout");
  -[MediaControlsRouteView layoutIfNeeded](self, "layoutIfNeeded");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__MediaControlsRouteView_showMessage___block_invoke;
  v4[3] = &unk_1E5818C88;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v4, 0, 2.5, 0.0);
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MediaControlsRouteView_showMessage___block_invoke_2;
  v5[3] = &unk_1E5818C88;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.1);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __38__MediaControlsRouteView_showMessage___block_invoke_3;
  v4[3] = &unk_1E5818C88;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.9, 0.1);
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayMessage:", 1);
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayMessage:", 0);
}

- (void)setDisplayMessage:(BOOL)a3
{
  self->_displayMessage = a3;
  -[MediaControlsRouteView _updateLabelVisualStyling](self, "_updateLabelVisualStyling");
}

- (void)_updateLabelVisualStyling
{
  UILabel *titleLabel;
  double v4;
  MTVisualStylingProvider *visualStylingProvider;
  UILabel *v6;
  void *v7;
  UILabel *messageLabel;
  id v9;

  if (self->_labelHidden)
  {
    titleLabel = self->_titleLabel;
    v4 = 0.0;
LABEL_3:
    -[UILabel setAlpha:](titleLabel, "setAlpha:", v4);
    goto LABEL_6;
  }
  visualStylingProvider = self->_visualStylingProvider;
  v6 = self->_titleLabel;
  if (!visualStylingProvider)
  {
    v4 = 1.0;
    titleLabel = self->_titleLabel;
    goto LABEL_3;
  }
  -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel mt_replaceVisualStyling:](v6, "mt_replaceVisualStyling:", v7);

LABEL_6:
  messageLabel = self->_messageLabel;
  if (self->_displayMessage)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel mt_replaceVisualStyling:](messageLabel, "mt_replaceVisualStyling:", v9);

  }
  else
  {
    -[UILabel setAlpha:](self->_messageLabel, "setAlpha:", 0.0);
  }
}

- (void)_contentSizeCategoryDidChange
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *MEMORY[0x1E0DC48F0];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC48F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4A98], v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_messageLabel, "setFont:", v5);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messageTimer, a3);
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
