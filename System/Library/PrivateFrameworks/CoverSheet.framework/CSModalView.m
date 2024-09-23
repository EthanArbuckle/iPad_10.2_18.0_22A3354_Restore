@implementation CSModalView

- (CSModalView)initWithFrame:(CGRect)a3
{
  CSModalView *v3;
  CSModalView *v4;
  UILayoutGuide *v5;
  UILayoutGuide *dateViewLayoutGuide;
  id v7;
  uint64_t v8;
  UIView *centralGroupView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CSModalView;
  v3 = -[CSModalView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CSModalView setShowsDateView:](v3, "setShowsDateView:", 1);
    -[CSModalView setShowsStatusText:](v4, "setShowsStatusText:", 1);
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    dateViewLayoutGuide = v4->_dateViewLayoutGuide;
    v4->_dateViewLayoutGuide = v5;

    -[CSModalView addLayoutGuide:](v4, "addLayoutGuide:", v4->_dateViewLayoutGuide);
    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    centralGroupView = v4->_centralGroupView;
    v4->_centralGroupView = (UIView *)v8;

    -[CSModalView addSubview:](v4, "addSubview:", v4->_centralGroupView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_centralGroupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView leadingAnchor](v4->_centralGroupView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView leadingAnchor](v4, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    -[UIView trailingAnchor](v4->_centralGroupView, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView trailingAnchor](v4, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIView centerYAnchor](v4->_centralGroupView, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView centerYAnchor](v4, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v19) = 1144750080;
    objc_msgSend(v18, "setPriority:", v19);
    objc_msgSend(v18, "setActive:", 1);

  }
  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  void *v6;
  id v7;

  p_legibilitySettings = &self->_legibilitySettings;
  v7 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSStatusTextViewController statusTextView](self->_statusTextViewController, "statusTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", *p_legibilitySettings);

  }
}

- (void)setShowsStatusText:(BOOL)a3
{
  CSStatusTextViewController *v4;
  CSStatusTextViewController *statusTextViewController;
  void *v6;
  void *v7;
  CSStatusTextViewController *v8;

  if (self->_showsStatusText != a3)
  {
    self->_showsStatusText = a3;
    if (a3)
    {
      v4 = objc_alloc_init(CSStatusTextViewController);
      statusTextViewController = self->_statusTextViewController;
      self->_statusTextViewController = v4;

      -[CSStatusTextViewController view](self->_statusTextViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSModalView addSubview:](self, "addSubview:", v6);

      -[CSStatusTextViewController viewWillAppear:](self->_statusTextViewController, "viewWillAppear:", 0);
      -[CSCoverSheetViewControllerBase viewDidAppear:](self->_statusTextViewController, "viewDidAppear:", 0);
      -[CSModalView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[CSCoverSheetViewControllerBase viewWillDisappear:](self->_statusTextViewController, "viewWillDisappear:");
      -[CSStatusTextViewController viewDidDisappear:](self->_statusTextViewController, "viewDidDisappear:", 0);
      -[CSStatusTextViewController view](self->_statusTextViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      v8 = self->_statusTextViewController;
      self->_statusTextViewController = 0;

    }
  }
}

- (void)setWantsEnhancedSecondaryActionButton:(BOOL)a3
{
  if (self->_wantsEnhancedSecondaryActionButton != a3)
  {
    self->_wantsEnhancedSecondaryActionButton = a3;
    -[CSModalView _setSecondaryActionButton:](self, "_setSecondaryActionButton:", 0);
    -[CSModalView _createAppropriateSecondaryActionButtonIfNecessary](self, "_createAppropriateSecondaryActionButtonIfNecessary");
  }
}

- (NSString)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitleText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  UILabel *titleLabel;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CSModalView _titleLabel](self, "_titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "isEqualToString:", v5);

  v7 = v11;
  if ((v6 & 1) == 0)
  {
    if (v11)
    {
      titleLabel = self->_titleLabel;
      if (!titleLabel)
      {
        -[CSModalView _titleFont](self, "_titleFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSModalView _labelWithNumberOfLines:font:](self, "_labelWithNumberOfLines:font:", 2, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSModalView _setTitleLabel:](self, "_setTitleLabel:", v10);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v11);
    }
    else
    {
      -[CSModalView _setTitleLabel:](self, "_setTitleLabel:", 0);
    }
    v7 = v11;
  }

}

- (UIColor)titleTextColor
{
  return -[UILabel textColor](self->_titleLabel, "textColor");
}

- (void)setTitleTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", a3);
}

- (NSString)subtitleText
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitleText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  UILabel *subtitleLabel;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a3;
  -[CSModalView _subtitleLabel](self, "_subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqualToString:", v5);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v12)
    {
      subtitleLabel = self->_subtitleLabel;
      if (!subtitleLabel)
      {
        -[CSModalView _subtitleFont](self, "_subtitleFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSModalView _labelWithNumberOfLines:font:](self, "_labelWithNumberOfLines:font:", 10, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSModalView _setSubtitleLabel:](self, "_setSubtitleLabel:", v10);
        objc_msgSend(v10, "setLineBreakMode:", 4);
        LODWORD(v11) = 1144750080;
        objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 1, v11);

        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:", v12);
    }
    else
    {
      -[CSModalView _setSubtitleLabel:](self, "_setSubtitleLabel:", 0);
    }
    v7 = v12;
  }

}

- (NSString)secondarySubtitleText
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSecondarySubtitleText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  UILabel *secondarySubtitleLabel;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a3;
  -[CSModalView _secondarySubtitleLabel](self, "_secondarySubtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqualToString:", v5);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v12)
    {
      secondarySubtitleLabel = self->_secondarySubtitleLabel;
      if (!secondarySubtitleLabel)
      {
        -[CSModalView _subtitleFont](self, "_subtitleFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSModalView _labelWithNumberOfLines:font:](self, "_labelWithNumberOfLines:font:", 1, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSModalView _setSecondarySubtitleLabel:](self, "_setSecondarySubtitleLabel:", v10);
        LODWORD(v11) = 1148846080;
        objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

        secondarySubtitleLabel = self->_secondarySubtitleLabel;
      }
      -[UILabel setText:](secondarySubtitleLabel, "setText:", v12);
    }
    else
    {
      -[CSModalView _setSecondarySubtitleLabel:](self, "_setSecondarySubtitleLabel:", 0);
    }
    v7 = v12;
  }

}

- (UIColor)primaryActionButtonBackgroundColor
{
  return (UIColor *)-[CSModalButton backgroundColor](self->_primaryActionButton, "backgroundColor");
}

- (void)setPrimaryActionButtonBackgroundColor:(id)a3
{
  id v4;

  v4 = a3;
  -[CSModalView _createPrimaryActionButtonIfNecessary](self, "_createPrimaryActionButtonIfNecessary");
  -[CSModalButton setBackgroundColor:](self->_primaryActionButton, "setBackgroundColor:", v4);

}

- (NSString)primaryActionButtonText
{
  return (NSString *)-[CSModalButton title](self->_primaryActionButton, "title");
}

- (void)setPrimaryActionButtonText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CSModalView _createPrimaryActionButtonIfNecessary](self, "_createPrimaryActionButtonIfNecessary");
    -[CSModalButton titleLabel](self->_primaryActionButton, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
      -[CSModalButton setTitle:forState:](self->_primaryActionButton, "setTitle:forState:", v7, 0);
  }
  else
  {
    -[CSModalView _setPrimaryActionButton:](self, "_setPrimaryActionButton:", 0);
  }

}

- (NSString)secondaryActionButtonText
{
  return (NSString *)-[UIButton title](self->_secondaryActionButton, "title");
}

- (void)setSecondaryActionButtonText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[CSModalView _createAppropriateSecondaryActionButtonIfNecessary](self, "_createAppropriateSecondaryActionButtonIfNecessary");
    -[CSModalView _secondaryActionButton](self, "_secondaryActionButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
      -[UIButton setTitle:forState:](self->_secondaryActionButton, "setTitle:forState:", v8, 0);
  }
  else
  {
    -[CSModalView _setSecondaryActionButton:](self, "_setSecondaryActionButton:", 0);
  }

}

- (UIColor)secondaryActionButtonTextColor
{
  void *v2;
  void *v3;

  -[UIButton titleLabel](self->_secondaryActionButton, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setSecondaryActionButtonTextColor:(id)a3
{
  id v4;

  v4 = a3;
  -[CSModalView _createAppropriateSecondaryActionButtonIfNecessary](self, "_createAppropriateSecondaryActionButtonIfNecessary");
  -[UIButton setTitleColor:forState:](self->_secondaryActionButton, "setTitleColor:forState:", v4, 0);

}

- (NSString)footerText
{
  return -[CSStatusTextViewController overrideFooterText](self->_statusTextViewController, "overrideFooterText");
}

- (void)setFooterText:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[CSModalView setShowsStatusText:](self, "setShowsStatusText:", 1);
  -[CSStatusTextViewController setOverrideFooterText:](self->_statusTextViewController, "setOverrideFooterText:", v4);

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  UIImageView *imageView;
  void *v8;
  id v9;

  v9 = a3;
  -[CSModalView _imageView](self, "_imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    if (v9)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        -[UIImageView setImage:](imageView, "setImage:", v9);
      }
      else
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
        -[CSModalView _setImageView:](self, "_setImageView:", v8);

      }
    }
    else
    {
      -[CSModalView _setImageView:](self, "_setImageView:", 0);
    }
    v6 = v9;
  }

}

- (void)setDetailView:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_detailView))
  {
    objc_storeStrong((id *)&self->_detailView, a3);
    self->_needsDetailViewConstraints = 1;
  }

}

- (void)hideTitleLabel:(BOOL)a3
{
  -[UILabel setHidden:](self->_titleLabel, "setHidden:", a3);
}

- (void)hideSubtitleLabel:(BOOL)a3
{
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", a3);
}

- (void)hideSecondarySubtitleLabel:(BOOL)a3
{
  -[UILabel setHidden:](self->_secondarySubtitleLabel, "setHidden:", a3);
}

- (void)setOverrideSecondarySubtitleFont:(id)a3
{
  id v4;
  UILabel *secondarySubtitleLabel;
  id v6;

  v4 = a3;
  if (v4)
  {
    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    if (secondarySubtitleLabel)
    {
      v6 = v4;
      -[UILabel setFont:](secondarySubtitleLabel, "setFont:", v4);
      -[CSModalView setNeedsLayout](self, "setNeedsLayout");
      v4 = v6;
    }
  }

}

- (void)setOverrideSecondarySubtitleTextColor:(id)a3
{
  id v4;
  UILabel *secondarySubtitleLabel;
  id v6;

  v4 = a3;
  if (v4)
  {
    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    if (secondarySubtitleLabel)
    {
      v6 = v4;
      -[UILabel setTextColor:](secondarySubtitleLabel, "setTextColor:", v4);
      -[CSModalView setNeedsLayout](self, "setNeedsLayout");
      v4 = v6;
    }
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[CSModalView bounds](self, "bounds");
  v4 = v3;
  +[CSPageControl suggestedFrameForPageBounds:](CSPageControl, "suggestedFrameForPageBounds:");
  v6 = v5;
  -[CSStatusTextViewController view](self->_statusTextViewController, "view");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9DE0], "suggestedFrameForStatusView:inView:withInsets:", v20, self, 0.0, 0.0, v4 - v6, 0.0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v20, "frame");
  v22.origin.x = v15;
  v22.origin.y = v16;
  v22.size.width = v17;
  v22.size.height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  if (!CGRectEqualToRect(v21, v22))
  {
    -[CSStatusTextViewController view](self->_statusTextViewController, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v8, v10, v12, v14);

    self->_needsSecondaryActionConstraints = 1;
    -[CSModalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  if (self->_detailView)
  {
    self->_needsDetailViewConstraints = 1;
    -[CSModalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)updateConstraints
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0337000, log, OS_LOG_TYPE_ERROR, "Bottom element in dashboard modal view is not positioned", v1, 2u);
}

- (void)_positionBottomElementWithLayoutAnchor:(id)a3 lessThanOrEqual:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  id WeakRetained;
  _BOOL8 v10;
  double v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (self->_showsStatusText)
  {
    -[CSStatusTextViewController view](self->_statusTextViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -20.0;
  }
  else
  {
    -[CSModalView bottomAnchor](self, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = -[CSModalView _isPortraitForDelegate:](self, "_isPortraitForDelegate:", WeakRetained);

    objc_msgSend((id)objc_opt_class(), "_bottomBaselineOffsetForPortrait:", v10);
    v8 = -v11;
  }
  if (v4)
    objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:constant:", v7, v8);
  else
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

- (void)_setTitleLabel:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_titleLabel))
  {
    objc_storeStrong((id *)&self->_titleLabel, a3);
    self->_needsTitleConstraints = 1;
  }

}

- (void)_setSubtitleLabel:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_subtitleLabel))
  {
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    self->_needsSubTitleConstraints = 1;
  }

}

- (void)_setSecondarySubtitleLabel:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_secondarySubtitleLabel))
  {
    objc_storeStrong((id *)&self->_secondarySubtitleLabel, a3);
    self->_needsSecondarySubTitleConstraints = 1;
  }

}

- (void)_setPrimaryActionButton:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_primaryActionButton))
  {
    objc_storeStrong((id *)&self->_primaryActionButton, a3);
    self->_needsPrimaryActionConstraints = 1;
  }

}

- (void)_setSecondaryActionButton:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_secondaryActionButton))
  {
    objc_storeStrong((id *)&self->_secondaryActionButton, a3);
    self->_needsSecondaryActionConstraints = 1;
  }

}

- (void)_setImageView:(id)a3
{
  id v5;

  v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_imageView))
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    self->_needsImageConstraints = 1;
  }

}

- (id)_preferredContentSizeCategoryCappedToSize:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v3 = _preferredContentSizeCategoryCappedToSize__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_preferredContentSizeCategoryCappedToSize__onceToken, &__block_literal_global_14);
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)_preferredContentSizeCategoryCappedToSize__fontSizes, "indexOfObject:", v5);
  v7 = objc_msgSend((id)_preferredContentSizeCategoryCappedToSize__fontSizes, "indexOfObject:", v4);

  if (v7 >= v6)
    v8 = v6;
  else
    v8 = v7;
  objc_msgSend((id)_preferredContentSizeCategoryCappedToSize__fontSizes, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __57__CSModalView__preferredContentSizeCategoryCappedToSize___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[14];

  v8[13] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEB438];
  v8[0] = *MEMORY[0x1E0CEB410];
  v8[1] = v0;
  v1 = *MEMORY[0x1E0CEB420];
  v8[2] = *MEMORY[0x1E0CEB428];
  v8[3] = v1;
  v2 = *MEMORY[0x1E0CEB400];
  v8[4] = *MEMORY[0x1E0CEB408];
  v8[5] = v2;
  v3 = *MEMORY[0x1E0CEB3E0];
  v8[6] = *MEMORY[0x1E0CEB3F8];
  v8[7] = v3;
  v4 = *MEMORY[0x1E0CEB3D0];
  v8[8] = *MEMORY[0x1E0CEB3D8];
  v8[9] = v4;
  v5 = *MEMORY[0x1E0CEB3C0];
  v8[10] = *MEMORY[0x1E0CEB3C8];
  v8[11] = v5;
  v8[12] = *MEMORY[0x1E0CEB440];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_preferredContentSizeCategoryCappedToSize__fontSizes;
  _preferredContentSizeCategoryCappedToSize__fontSizes = v6;

}

- (id)_fontWithTextStyle:(id)a3 cappedToSize:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[CSModalView _preferredContentSizeCategoryCappedToSize:](self, "_preferredContentSizeCategoryCappedToSize:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_titleFont
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  _QWORD *v13;
  int v14;
  double v15;
  void *v16;

  v5 = *MEMORY[0x1E0CEB5A8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_25;
  }
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v8 = 0;
      v11 = 0;
      goto LABEL_13;
    }
LABEL_9:
    v11 = v7 ^ 1;
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "_referenceBounds");
    }
    v8 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v12 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_25;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "userInterfaceIdiom"))
    goto LABEL_9;
  v8 = 0;
  v11 = 1;
LABEL_13:
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      v13 = (_QWORD *)MEMORY[0x1E0CEB3E0];
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom"))
    {
      v10 = 0;
      v13 = (_QWORD *)MEMORY[0x1E0CEB3E0];
      v9 = 1;
      goto LABEL_26;
    }
  }
  v9 = v3 ^ 1;
  v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "_referenceBounds");
  }
  v10 = v14 ^ 1;
  BSSizeRoundForScale();
  if (v15 < *(double *)(MEMORY[0x1E0DAB260] + 40))
  {
    v13 = (_QWORD *)MEMORY[0x1E0CEB3E0];
    goto LABEL_26;
  }
LABEL_25:
  v13 = (_QWORD *)MEMORY[0x1E0CEB3D8];
LABEL_26:
  -[CSModalView _fontWithTextStyle:cappedToSize:](self, "_fontWithTextStyle:cappedToSize:", v5, *v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    if (!v9)
      goto LABEL_28;
  }
  else if (!v9)
  {
LABEL_28:
    if (v8)
      goto LABEL_29;
    goto LABEL_33;
  }

  if (v8)
  {
LABEL_29:

    if (!v11)
      return v16;
    goto LABEL_34;
  }
LABEL_33:
  if (v11)
LABEL_34:

  return v16;
}

- (id)_subtitleFont
{
  return -[CSModalView _fontWithTextStyle:cappedToSize:](self, "_fontWithTextStyle:cappedToSize:", *MEMORY[0x1E0CEB5B8], *MEMORY[0x1E0CEB3E0]);
}

- (id)_primaryActionFont
{
  return -[CSModalView _fontWithTextStyle:cappedToSize:](self, "_fontWithTextStyle:cappedToSize:", *MEMORY[0x1E0CEB5B8], *MEMORY[0x1E0CEB3E0]);
}

- (id)_secondaryActionFont
{
  return -[CSModalView _fontWithTextStyle:cappedToSize:](self, "_fontWithTextStyle:cappedToSize:", *MEMORY[0x1E0CEB540], *MEMORY[0x1E0CEB400]);
}

- (BOOL)_replaceView:(id)a3 withNewView:(id)a4 inParentView:(id)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a5;
  if (a3 != v8)
  {
    objc_msgSend(a3, "removeFromSuperview");
    if (v8)
    {
      objc_msgSend(v9, "addSubview:", v8);
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    -[CSModalView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

  return a3 != v8;
}

- (id)_labelWithNumberOfLines:(unint64_t)a3 font:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CEA700];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v7, "setNumberOfLines:", a3);
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v7, "setContentMode:", 5);
  return v7;
}

- (void)_createPrimaryActionButtonIfNecessary
{
  CSModalButton *v3;
  void *v4;
  void *v5;
  void *v6;
  CSModalButton *v7;

  if (!self->_primaryActionButton)
  {
    v3 = [CSModalButton alloc];
    v7 = -[CSModalButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CSModalButton titleLabel](v7, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView _primaryActionFont](self, "_primaryActionFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    -[CSModalButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalButton setBackgroundColor:](v7, "setBackgroundColor:", v6);

    -[CSModalButton _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:", 30.0);
    -[CSModalView _setPrimaryActionButton:](self, "_setPrimaryActionButton:", v7);

  }
}

- (void)_createAppropriateSecondaryActionButtonIfNecessary
{
  if (self->_wantsEnhancedSecondaryActionButton)
    -[CSModalView _createEnhancedSecondaryActionButtonIfNecessary](self, "_createEnhancedSecondaryActionButtonIfNecessary");
  else
    -[CSModalView _createSecondaryActionButtonIfNecessary](self, "_createSecondaryActionButtonIfNecessary");
}

- (void)_createSecondaryActionButtonIfNecessary
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  int v12;
  char v13;
  _BOOL4 v14;
  CSModalButton *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CSModalButton *v27;

  if (!self->_secondaryActionButton)
  {
    v4 = (void *)0x1E0CEA000;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      goto LABEL_23;
    v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v8 = 0;
        v9 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v5;
      if (objc_msgSend(v5, "userInterfaceIdiom"))
      {
        v8 = 0;
        v9 = 1;
        goto LABEL_13;
      }
    }
    v9 = v7 ^ 1;
    v10 = __sb__runningInSpringBoard();
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceBounds");
    }
    v8 = v10 ^ 1;
    BSSizeRoundForScale();
    if (v11 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
    {
      v14 = 0;
      if ((v8 & 1) != 0)
        goto LABEL_30;
      goto LABEL_21;
    }
LABEL_13:
    v12 = __sb__runningInSpringBoard();
    v13 = v12;
    if (v12)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v14 = 1;
        if ((v8 & 1) != 0)
          goto LABEL_30;
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceIdiom"))
      {
        v14 = 1;
        goto LABEL_29;
      }
    }
    v18 = __sb__runningInSpringBoard();
    v19 = v18;
    if (v18)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v14 = v20 < *(double *)(MEMORY[0x1E0DAB260] + 40);
    if ((v19 & 1) != 0)
    {
      if ((v13 & 1) == 0)
        goto LABEL_29;
    }
    else
    {

      if ((v13 & 1) == 0)
      {
LABEL_29:

        if ((v8 & 1) != 0)
          goto LABEL_30;
        goto LABEL_21;
      }
    }
    if (v8)
    {
LABEL_30:

      if ((v9 & 1) == 0)
      {
LABEL_31:
        if (v14)
          goto LABEL_32;
        goto LABEL_23;
      }
LABEL_22:

      if (v14)
      {
LABEL_32:
        objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
        v27 = (CSModalButton *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
LABEL_23:
      v15 = [CSModalButton alloc];
      v27 = -[CSModalButton initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSModalButton setBackgroundColor:](v27, "setBackgroundColor:", v16);

      -[CSModalButton _setContinuousCornerRadius:](v27, "_setContinuousCornerRadius:", 24.0);
      v17 = (void *)objc_opt_new();
      -[CSModalButton setVisualEffect:](v27, "setVisualEffect:", v17);

LABEL_33:
      -[CSModalButton titleLabel](v27, "titleLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSModalView _secondaryActionFont](self, "_secondaryActionFont");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v22);

      -[CSModalButton titleLabel](v27, "titleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNumberOfLines:", 1);

      -[CSModalButton titleLabel](v27, "titleLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 0);

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSModalButton setTitleColor:forState:](v27, "setTitleColor:forState:", v25, 0);

      -[CSModalButton addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
      -[CSModalView _setSecondaryActionButton:](self, "_setSecondaryActionButton:", v27);

      return;
    }
LABEL_21:
    if (!v9)
      goto LABEL_31;
    goto LABEL_22;
  }
}

- (void)_createEnhancedSecondaryActionButtonIfNecessary
{
  CSEnhancedModalButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CSEnhancedModalButton *v8;

  if (!self->_secondaryActionButton)
  {
    v3 = [CSEnhancedModalButton alloc];
    v8 = -[CSEnhancedModalButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CSEnhancedModalButton _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", 24.0);
    -[CSEnhancedModalButton titleLabel](v8, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView _secondaryActionFont](self, "_secondaryActionFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    -[CSEnhancedModalButton titleLabel](v8, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 1);

    -[CSEnhancedModalButton titleLabel](v8, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);

    -[CSEnhancedModalButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
    -[CSModalView _setSecondaryActionButton:](self, "_setSecondaryActionButton:", v8);

  }
}

- (void)_buttonTapped:(id)a3
{
  id WeakRetained;
  CSModalButton *v5;

  v5 = (CSModalButton *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((CSModalButton *)self->_secondaryActionButton == v5)
  {
    objc_msgSend(WeakRetained, "handleSecondaryActionForView:", self);
  }
  else if (self->_primaryActionButton == v5)
  {
    objc_msgSend(WeakRetained, "handlePrimaryActionForView:", self);
  }

}

- (CGRect)_dateTimeFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect v8;
  CGRect result;

  -[CSModalView bounds](self, "bounds");
  CGRectGetWidth(v7);
  -[CSModalView bounds](self, "bounds");
  -[CSModalView bounds](self, "bounds");
  UIRectCenteredXInRect();
  CGRectGetMinX(v8);
  -[CSModalView _timeLabelBaselineY](self, "_timeLabelBaselineY");
  -[CSModalView _timeLabelBaselineY](self, "_timeLabelBaselineY");
  -[CSModalView _timeToSubtitleLabelBaselineDifferenceY](self, "_timeToSubtitleLabelBaselineDifferenceY");
  objc_msgSend(MEMORY[0x1E0DA9E58], "timeFontMetrics");
  objc_msgSend(MEMORY[0x1E0DA9E50], "labelFontMetrics");
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_timeLabelBaselineY
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  char v7;
  int v8;
  char v9;
  int v10;
  char v11;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (void *)(v4 & 0xFFFFFFFFFFFFFFFBLL);
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v5 == (void *)1)
  {
    if (v6)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "userInterfaceIdiom") != 1)
        goto LABEL_24;
    }
    v8 = __sb__runningInSpringBoard();
    v9 = v8;
    if (v8)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if ((v9 & 1) != 0)
      goto LABEL_23;
LABEL_22:

    goto LABEL_23;
  }
  if (v6)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
      goto LABEL_24;
  }
  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  BSSizeRoundForScale();
  if ((v11 & 1) == 0)
    goto LABEL_22;
LABEL_23:
  if ((v7 & 1) == 0)
LABEL_24:

LABEL_25:
  SBFMainScreenScale();
  BSFloatRoundForScale();
  return result;
}

- (double)_timeToSubtitleLabelBaselineDifferenceY
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  int v11;
  char v12;
  double v13;
  double v14;

  if (_timeToSubtitleLabelBaselineDifferenceY_onceToken != -1)
    dispatch_once(&_timeToSubtitleLabelBaselineDifferenceY_onceToken, &__block_literal_global_31);
  if (BSFloatIsZero())
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    if (IsAccessibilityCategory)
    {
      objc_msgSend(MEMORY[0x1E0DA9E50], "labelFontMetrics");
      _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = v5;
      return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v10 = 0x4042000000000000;
      goto LABEL_11;
    }
    v8 = __sb__runningInSpringBoard();
    v9 = v8;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v10 = 0x4044000000000000;
LABEL_11:
        _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = v10;
        return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v7 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v7, "userInterfaceIdiom") != 1)
      {
        _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = 0x4044000000000000;
LABEL_22:

        return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
      }
    }
    v11 = __sb__runningInSpringBoard();
    v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v13 = 40.0;
    if (v14 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
      v13 = 46.0;
    _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = *(_QWORD *)&v13;
    if ((v12 & 1) == 0)

    if ((v9 & 1) == 0)
      goto LABEL_22;
  }
  return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
}

void __54__CSModalView__timeToSubtitleLabelBaselineDifferenceY__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_35);

}

void __54__CSModalView__timeToSubtitleLabelBaselineDifferenceY__block_invoke_2()
{
  _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = 0;
}

- (BOOL)_isPortraitForDelegate:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "isPortrait");
  else
    v5 = -[CSModalView _hasPortraitDimensions](self, "_hasPortraitDimensions");
  v6 = v5;

  return v6;
}

- (BOOL)_hasPortraitDimensions
{
  CGRect v4;
  CGRect v5;

  -[CSModalView bounds](self, "bounds");
  CGRectGetHeight(v4);
  -[CSModalView bounds](self, "bounds");
  CGRectGetWidth(v5);
  return BSFloatGreaterThanOrEqualToFloat();
}

+ (double)_bottomBaselineOffsetForPortrait:(BOOL)a3
{
  double result;
  void *v4;
  uint64_t v5;

  if (a3)
  {
    objc_msgSend(a1, "_modalViewBottomBaselineOffsetPortrait");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    result = 90.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      return 21.0;
  }
  return result;
}

+ (double)_modalViewBottomBaselineOffsetPortrait
{
  uint64_t v2;
  _BOOL4 v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  double v25;
  int v26;
  int v27;
  double v28;
  int v29;
  uint64_t *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  double v36;
  double v37;
  int v38;
  int v39;
  double v40;
  int v41;
  int v42;
  double v43;
  double v44;
  BOOL v45;
  double v46;
  double v47;
  double v49;
  double v50;
  double v51;
  double v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  unsigned int v65;
  double v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t *v75;
  double v76;
  int v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  int v88;
  int v89;
  double v90;
  int v91;
  double v92;
  int v93;
  int v94;
  int v95;
  int v96;
  double v97;
  int v98;
  double v99;
  int v100;
  double v101;
  int v102;
  double v103;
  double v104;
  double v105;
  int v106;
  int v107;
  int v108;
  double v109;
  int v110;
  int v111;
  int v112;
  double v113;
  int v114;
  int v115;
  double v116;
  int v117;
  int v118;
  int v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  int v127;
  double v128;
  int v129;
  double v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  double v137;
  double v138;
  double v139;
  double v140;
  int v141;
  double v142;
  int v143;
  double v144;
  int v145;
  int v146;
  int v147;
  int v148;
  double v149;
  int v150;
  int v151;
  int v152;
  int v153;
  double v154;
  int v155;
  int v156;
  int v157;
  int v158;
  double v159;
  int v160;
  double v161;
  double v162;
  double v163;
  int v164;
  int v165;
  int v166;
  double v167;
  int v168;
  int v169;
  int v170;
  double v171;
  int v172;
  int v173;
  double v174;
  int v175;
  int v176;
  int v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  int v185;
  double v186;
  int v187;
  double v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  uint64_t v200;
  double v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  double v211;
  int v212;
  double v213;
  uint64_t v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  int v222;
  double v223;
  int v224;
  int v225;
  double v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  int v328;
  uint64_t v329;
  int v330;
  int v331;
  void *v332;
  int v333;
  void *v334;
  int v335;
  void *v336;
  int v337;
  void *v338;
  int v339;
  void *v340;
  int v341;
  void *v342;
  int v343;
  void *v344;
  int v345;
  void *v346;
  int v347;
  void *v348;
  int v349;
  void *v350;
  int v351;
  void *v352;
  int v353;
  void *v354;
  int v355;
  void *v356;
  int v357;
  void *v358;
  int v359;
  void *v360;
  int v361;
  void *v362;
  int v363;
  void *v364;
  int v365;
  void *v366;
  int v367;
  void *v368;
  int v369;
  void *v370;
  int v371;
  void *v372;
  int v373;
  void *v374;
  int v375;
  void *v376;
  int v377;
  void *v378;
  int v379;
  void *v380;
  int v381;
  void *v382;
  int v383;
  void *v384;
  int v385;
  void *v386;
  int v387;
  void *v388;
  int v389;
  void *v390;
  int v391;
  void *v392;
  int v393;
  void *v394;
  int v395;
  void *v396;
  int v397;
  void *v398;
  int v399;
  void *v400;
  int v401;
  void *v402;
  int v403;
  void *v404;
  int v405;
  void *v406;
  int v407;
  void *v408;
  int v409;
  void *v410;
  int v411;
  void *v412;
  int v413;
  void *v414;
  int v415;
  void *v416;
  int v417;
  void *v418;
  int v419;
  void *v420;
  int v421;
  void *v422;
  int v423;
  void *v424;
  int v425;
  void *v426;
  int v427;
  int v428;
  int v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  int v439;
  int v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  int v444;
  int v445;
  uint64_t v446;
  int v447;
  uint64_t v448;
  int v449;
  _QWORD v450[10];
  unint64_t v451;
  unint64_t v452;
  unint64_t v453;
  int v454;
  int v455;
  int v456;
  id v457;

  v3 = +[CSQuickActionsViewController deviceSupportsButtons](CSQuickActionsViewController, "deviceSupportsButtons");
  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v6 = 0;
        v7 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v457 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v457, "userInterfaceIdiom") != 1)
      {
        v7 = 0;
        v6 = 1;
        goto LABEL_27;
      }
    }
    v6 = v5 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v9 = __sb__runningInSpringBoard();
      if ((_DWORD)v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v426 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v426, "_referenceBounds");
      }
      v7 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v47 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v46 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v455 = v9 ^ 1;
        v456 = v6;
        v453 = 0;
        v452 = 0;
        v451 = 0;
        v454 = 0;
        memset(v450, 0, sizeof(v450));
        v447 = 0;
        v445 = 0;
        v448 = 0;
        v442 = 0;
        v444 = 0;
        v438 = 0;
        v434 = 0;
        v436 = 0;
        v433 = 0;
        v431 = 0;
        v428 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_27:
    v12 = __sb__runningInSpringBoard();
    v455 = v7;
    v456 = v6;
    if (v12)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v13 = 0;
        v14 = 0;
        goto LABEL_45;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v424, "userInterfaceIdiom") != 1)
      {
        v14 = 0;
        v13 = 1;
        goto LABEL_45;
      }
    }
    v13 = v12 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v9 = __sb__runningInSpringBoard();
      if ((_DWORD)v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v408 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v408, "_referenceBounds");
      }
      v14 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        LODWORD(v453) = v9 ^ 1;
        HIDWORD(v453) = v13;
        v452 = 0;
        v451 = 0;
        v454 = 0;
        memset(v450, 0, sizeof(v450));
        v447 = 0;
        v445 = 0;
        v448 = 0;
        v442 = 0;
        v444 = 0;
        v438 = 0;
        v434 = 0;
        v436 = 0;
        v433 = 0;
        v431 = 0;
        v428 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_45:
    v17 = __sb__runningInSpringBoard();
    v453 = __PAIR64__(v13, v14);
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v18 = 0;
        v19 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v422, "userInterfaceIdiom") != 1)
      {
        v19 = 0;
        v18 = 1;
        goto LABEL_62;
      }
    }
    v18 = v17 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v9 = __sb__runningInSpringBoard();
      if ((_DWORD)v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v406, "_referenceBounds");
      }
      v19 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v81 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        LODWORD(v452) = v9 ^ 1;
        HIDWORD(v452) = v18;
        v451 = 0;
        v454 = 0;
        memset(v450, 0, sizeof(v450));
        v447 = 0;
        v445 = 0;
        v448 = 0;
        v442 = 0;
        v444 = 0;
        v438 = 0;
        v434 = 0;
        v436 = 0;
        v433 = 0;
        v431 = 0;
        v428 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_62:
    v22 = __sb__runningInSpringBoard();
    v452 = __PAIR64__(v18, v19);
    if (v22)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v23 = 0;
        v24 = 0;
        goto LABEL_80;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v420, "userInterfaceIdiom") != 1)
      {
        v24 = 0;
        v23 = 1;
        goto LABEL_80;
      }
    }
    v23 = v22 ^ 1;
    v9 = __sb__runningInSpringBoard();
    if ((_DWORD)v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "_referenceBounds");
    }
    v24 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v28 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      LODWORD(v451) = v9 ^ 1;
      HIDWORD(v451) = v23;
      v454 = 0;
      memset(v450, 0, sizeof(v450));
      v447 = 0;
      v445 = 0;
      v448 = 0;
      v442 = 0;
      v444 = 0;
      v438 = 0;
      v434 = 0;
      v436 = 0;
      v433 = 0;
      v431 = 0;
      v428 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 90.0;
      goto LABEL_194;
    }
LABEL_80:
    v29 = __sb__runningInSpringBoard();
    v451 = __PAIR64__(v23, v24);
    if (v29)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v2 = 0;
        v454 = 0;
        goto LABEL_100;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v418, "userInterfaceIdiom") != 1)
      {
        v454 = 0;
        v2 = 1;
        goto LABEL_100;
      }
    }
    v2 = v29 ^ 1u;
    v9 = __sb__runningInSpringBoard();
    if ((_DWORD)v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v410, "_referenceBounds");
    }
    v454 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v40 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      HIDWORD(v450[9]) = v2;
      memset(v450, 0, 76);
      v447 = 0;
      v445 = 0;
      v448 = 0;
      v442 = 0;
      v444 = 0;
      v438 = 0;
      v434 = 0;
      v436 = 0;
      v433 = 0;
      v431 = 0;
      v428 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 90.0;
      goto LABEL_194;
    }
LABEL_100:
    v41 = __sb__runningInSpringBoard();
    HIDWORD(v450[9]) = v2;
    if (v41)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)((char *)&v450[8] + 4) = 0;
        goto LABEL_530;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v416, "userInterfaceIdiom") != 1)
      {
        HIDWORD(v450[8]) = 0;
        LODWORD(v450[9]) = 1;
        goto LABEL_530;
      }
    }
    LODWORD(v450[9]) = v41 ^ 1;
    v9 = __sb__runningInSpringBoard();
    if ((_DWORD)v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v404, "_referenceBounds");
    }
    HIDWORD(v450[8]) = v9 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      memset(v450, 0, 68);
      v447 = 0;
      v445 = 0;
      v448 = 0;
      v442 = 0;
      v444 = 0;
      v438 = 0;
      v434 = 0;
      v436 = 0;
      v433 = 0;
      v431 = 0;
      v428 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 90.0;
      goto LABEL_194;
    }
LABEL_530:
    v9 = __sb__runningInSpringBoard();
    if ((_DWORD)v9)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_532;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v412, "userInterfaceIdiom") != 1)
      {
LABEL_532:
        LODWORD(v450[8]) = v9 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_536:
          *(_QWORD *)((char *)&v450[6] + 4) = 0;
          goto LABEL_589;
        }
        v91 = __sb__runningInSpringBoard();
        if (v91)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_536;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v400 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v400, "userInterfaceIdiom"))
          {
            *(_QWORD *)((char *)&v450[6] + 4) = 1;
            goto LABEL_589;
          }
        }
        HIDWORD(v450[6]) = v91 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v2 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v2, "_referenceBounds");
          }
          v394 = (void *)v2;
          LODWORD(v450[7]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v104 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            HIDWORD(v450[7]) = 0;
            memset(v450, 0, 52);
            v447 = 0;
            v445 = 0;
            v448 = 0;
            v442 = 0;
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[7]) = 0;
        }
LABEL_589:
        v9 = __sb__runningInSpringBoard();
        v2 = (uint64_t)&unk_1D048F000;
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[7]) = 0;
            LODWORD(v450[6]) = 0;
            goto LABEL_599;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v402, "userInterfaceIdiom"))
          {
            LODWORD(v450[6]) = 0;
            HIDWORD(v450[7]) = 1;
            goto LABEL_599;
          }
        }
        HIDWORD(v450[7]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v390 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v390, "_referenceBounds");
          }
          LODWORD(v450[6]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v99 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_603;
        }
        else
        {
          LODWORD(v450[6]) = 0;
        }
LABEL_599:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          memset(v450, 0, 48);
          v447 = 0;
          v445 = 0;
          v448 = 0;
          v442 = 0;
          v444 = 0;
          v438 = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 48.7;
          goto LABEL_194;
        }
LABEL_603:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_607:
          v450[5] = 0;
          goto LABEL_682;
        }
        v100 = __sb__runningInSpringBoard();
        if (v100)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_607;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v392, "userInterfaceIdiom"))
          {
            v450[5] = 0x100000000;
            goto LABEL_682;
          }
        }
        HIDWORD(v450[5]) = v100 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v376 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v376, "_referenceBounds");
          }
          LODWORD(v450[5]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            memset(v450, 0, 40);
            v447 = 0;
            v445 = 0;
            v448 = 0;
            v442 = 0;
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[5]) = 0;
        }
LABEL_682:
        v9 = __sb__runningInSpringBoard();
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[4]) = 0;
            HIDWORD(v450[3]) = 0;
            goto LABEL_692;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v398, "userInterfaceIdiom"))
          {
            HIDWORD(v450[3]) = 0;
            HIDWORD(v450[4]) = 1;
            goto LABEL_692;
          }
        }
        HIDWORD(v450[4]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v384 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v384, "_referenceBounds");
          }
          HIDWORD(v450[3]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v113 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_696;
        }
        else
        {
          HIDWORD(v450[3]) = 0;
        }
LABEL_692:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          LODWORD(v450[4]) = 0;
          memset(v450, 0, 28);
          v447 = 0;
          v445 = 0;
          v448 = 0;
          v442 = 0;
          v444 = 0;
          v438 = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 48.7;
          goto LABEL_194;
        }
LABEL_696:
        v114 = __sb__runningInSpringBoard();
        if (v114)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v450[4]) = 0;
            LODWORD(v450[3]) = 0;
            goto LABEL_706;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v396, "userInterfaceIdiom"))
          {
            LODWORD(v450[3]) = 0;
            LODWORD(v450[4]) = 1;
            goto LABEL_706;
          }
        }
        LODWORD(v450[4]) = v114 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v115 = __sb__runningInSpringBoard();
          if (v115)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v378 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v378, "_referenceBounds");
          }
          v9 = v115 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v450[3]) = v9;
          if (v121 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            memset(v450, 0, 24);
            v447 = 0;
            v445 = 0;
            v448 = 0;
            v442 = 0;
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[3]) = 0;
        }
LABEL_706:
        v9 = __sb__runningInSpringBoard();
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[1]) = 0;
            LODWORD(v450[0]) = 0;
            goto LABEL_756;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v388, "userInterfaceIdiom"))
          {
            LODWORD(v450[0]) = 0;
            HIDWORD(v450[1]) = 1;
            goto LABEL_756;
          }
        }
        HIDWORD(v450[1]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v374, "_referenceBounds");
          }
          LODWORD(v450[0]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_792;
        }
        else
        {
          LODWORD(v450[0]) = 0;
        }
LABEL_756:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          v450[2] = 0;
          *(_QWORD *)((char *)v450 + 4) = 0;
          v447 = 0;
          v445 = 0;
          v448 = 0;
          v442 = 0;
          v444 = 0;
          v438 = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 48.7;
          goto LABEL_194;
        }
LABEL_792:
        v129 = __sb__runningInSpringBoard();
        if (v129)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v2 = 0;
            LODWORD(v450[2]) = 0;
            goto LABEL_820;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v386 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v386, "userInterfaceIdiom"))
          {
            LODWORD(v450[2]) = 0;
            v2 = 1;
            goto LABEL_820;
          }
        }
        v2 = v129 ^ 1u;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v134 = __sb__runningInSpringBoard();
          if (v134)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v368, "_referenceBounds");
          }
          v9 = v134 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v450[2]) = v9;
          if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            HIDWORD(v450[2]) = v2;
            *(_QWORD *)((char *)v450 + 4) = 0;
            v447 = 0;
            v445 = 0;
            v448 = 0;
            v442 = 0;
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 58.5;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[2]) = 0;
        }
LABEL_820:
        v9 = __sb__runningInSpringBoard();
        HIDWORD(v450[2]) = v2;
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)((char *)v450 + 4) = 0;
            goto LABEL_847;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v382, "userInterfaceIdiom"))
          {
            HIDWORD(v450[0]) = 0;
            LODWORD(v450[1]) = 1;
            goto LABEL_847;
          }
        }
        LODWORD(v450[1]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v366 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v366, "_referenceBounds");
          }
          HIDWORD(v450[0]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_880;
        }
        else
        {
          HIDWORD(v450[0]) = 0;
        }
LABEL_847:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          v447 = 0;
          v445 = 0;
          v448 = 0;
          v442 = 0;
          v444 = 0;
          v438 = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 50.7;
          goto LABEL_194;
        }
LABEL_880:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_884:
          v447 = 0;
          v445 = 0;
          goto LABEL_925;
        }
        v143 = __sb__runningInSpringBoard();
        if (v143)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_884;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v372 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v372, "userInterfaceIdiom"))
          {
            v445 = 0;
            v447 = 1;
            goto LABEL_925;
          }
        }
        v447 = v143 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v151 = __sb__runningInSpringBoard();
          if (v151)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v2 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v2, "_referenceBounds");
          }
          v362 = (void *)v2;
          v9 = v151 ^ 1u;
          BSSizeRoundForScale();
          v445 = v9;
          if (v162 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            v448 = 0;
            v442 = 0;
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          v445 = 0;
        }
LABEL_925:
        v152 = __sb__runningInSpringBoard();
        v2 = (uint64_t)&unk_1D048F000;
        if (v152)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v448) = 0;
            v9 = 0;
            goto LABEL_935;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v380, "userInterfaceIdiom"))
          {
            v9 = 0;
            HIDWORD(v448) = 1;
            goto LABEL_935;
          }
        }
        HIDWORD(v448) = v152 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v153 = __sb__runningInSpringBoard();
          if (v153)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v358, "_referenceBounds");
          }
          v9 = v153 ^ 1u;
          BSSizeRoundForScale();
          if (v154 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_939;
        }
        else
        {
          v9 = 0;
        }
LABEL_935:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          LODWORD(v448) = v9;
          v442 = 0;
          v444 = 0;
          v438 = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 37.5;
          goto LABEL_194;
        }
LABEL_939:
        LODWORD(v448) = v9;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_943:
          v442 = 0;
          goto LABEL_1018;
        }
        v155 = __sb__runningInSpringBoard();
        if (v155)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_943;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v360 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v360, "userInterfaceIdiom"))
          {
            v442 = 0x100000000;
            goto LABEL_1018;
          }
        }
        HIDWORD(v442) = v155 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v346, "_referenceBounds");
          }
          LODWORD(v442) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v182 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v444 = 0;
            v438 = 0;
            v434 = 0;
            v436 = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v442) = 0;
        }
LABEL_1018:
        v9 = __sb__runningInSpringBoard();
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v444 = 0;
            HIDWORD(v438) = 0;
            goto LABEL_1028;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v370, "userInterfaceIdiom"))
          {
            HIDWORD(v438) = 0;
            v444 = 1;
            goto LABEL_1028;
          }
        }
        v444 = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v352 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v352, "_referenceBounds");
          }
          HIDWORD(v438) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v171 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_1032;
        }
        else
        {
          HIDWORD(v438) = 0;
        }
LABEL_1028:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          LODWORD(v438) = 0;
          v434 = 0;
          v436 = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 37.5;
          goto LABEL_194;
        }
LABEL_1032:
        v172 = __sb__runningInSpringBoard();
        if (v172)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v438) = 0;
            LODWORD(v434) = 0;
            goto LABEL_1042;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v364, "userInterfaceIdiom"))
          {
            LODWORD(v434) = 0;
            LODWORD(v438) = 1;
            goto LABEL_1042;
          }
        }
        LODWORD(v438) = v172 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v173 = __sb__runningInSpringBoard();
          if (v173)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v348, "_referenceBounds");
          }
          v9 = v173 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v434) = v9;
          if (v179 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            v436 = 0;
            HIDWORD(v434) = 0;
            v433 = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v434) = 0;
        }
LABEL_1042:
        v9 = __sb__runningInSpringBoard();
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v436 = 0;
            goto LABEL_1092;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v356, "userInterfaceIdiom"))
          {
            v436 = 0x100000000;
            goto LABEL_1092;
          }
        }
        HIDWORD(v436) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v344, "_referenceBounds");
          }
          LODWORD(v436) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v186 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_1128;
        }
        else
        {
          LODWORD(v436) = 0;
        }
LABEL_1092:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          HIDWORD(v434) = 0;
          v433 = 0;
          v431 = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 51.2;
          goto LABEL_194;
        }
LABEL_1128:
        v187 = __sb__runningInSpringBoard();
        if (v187)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v434) = 0;
            HIDWORD(v433) = 0;
            goto LABEL_1156;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v354 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v354, "userInterfaceIdiom"))
          {
            HIDWORD(v433) = 0;
            HIDWORD(v434) = 1;
            goto LABEL_1156;
          }
        }
        HIDWORD(v434) = v187 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v342, "_referenceBounds");
          }
          HIDWORD(v433) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v196 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            LODWORD(v433) = 0;
            v431 = 0;
            v428 = 0;
            v31 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          HIDWORD(v433) = 0;
        }
LABEL_1156:
        v9 = __sb__runningInSpringBoard();
        if ((_DWORD)v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v433) = 0;
            HIDWORD(v431) = 0;
            goto LABEL_1182;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v350 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v350, "userInterfaceIdiom"))
          {
            HIDWORD(v431) = 0;
            LODWORD(v433) = 1;
            goto LABEL_1182;
          }
        }
        LODWORD(v433) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v9 = __sb__runningInSpringBoard();
          if ((_DWORD)v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v340, "_referenceBounds");
          }
          HIDWORD(v431) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v199 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
LABEL_1213:
            v9 = (uint64_t)&unk_1D048F000;
            if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
            {
              LODWORD(v431) = 0;
              v428 = 0;
              v31 = 0;
              v32 = 0;
              v33 = 0;
              v34 = 0;
              v35 = 0;
              v36 = 51.0;
              goto LABEL_194;
            }
            if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
              goto LABEL_1221;
            v36 = 51.0;
            if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
            {
              LODWORD(v431) = 0;
              v428 = 0;
              v31 = 0;
              v32 = 0;
              v33 = 0;
              v34 = 0;
              v35 = 0;
              goto LABEL_194;
            }
            if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
            {
LABEL_1221:
              LODWORD(v431) = 0;
              v428 = 0;
              v31 = 0;
              v32 = 0;
              v33 = 0;
              v34 = 0;
              v35 = 0;
              v200 = 0x4044000000000000;
LABEL_1222:
              v36 = *(double *)&v200;
              goto LABEL_194;
            }
            v203 = __sb__runningInSpringBoard();
            if (v203)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v431) = 0;
                v428 = 0;
                goto LABEL_1267;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v338 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v338, "userInterfaceIdiom"))
              {
                v428 = 0;
                LODWORD(v431) = 1;
                goto LABEL_1267;
              }
            }
            LODWORD(v431) = v203 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v9 = __sb__runningInSpringBoard();
              if ((_DWORD)v9)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v334 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v334, "_referenceBounds");
              }
              v428 = v9 ^ 1;
              BSSizeRoundForScale();
              if (v217 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
              {
                v31 = 0;
                v32 = 0;
                v33 = 0;
                v34 = 0;
                v35 = 0;
                goto LABEL_194;
              }
            }
            else
            {
              v428 = 0;
            }
LABEL_1267:
            v9 = __sb__runningInSpringBoard();
            if ((_DWORD)v9)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v31 = 0;
                v32 = 0;
                goto LABEL_1297;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v336 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v336, "userInterfaceIdiom"))
              {
                v32 = 0;
                v31 = 1;
                goto LABEL_1297;
              }
            }
            v31 = v9 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              v2 = __sb__runningInSpringBoard();
              if ((_DWORD)v2)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                v332 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v332, "_referenceBounds");
              }
              v32 = v2 ^ 1;
              BSSizeRoundForScale();
              if (v220 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
              {
                v33 = 0;
                v34 = 0;
                v35 = 0;
                v36 = 40.0;
                goto LABEL_194;
              }
            }
            else
            {
              v32 = 0;
            }
LABEL_1297:
            v2 = __sb__runningInSpringBoard();
            if ((_DWORD)v2)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                v33 = 0;
                v34 = 0;
LABEL_1328:
                v214 = __sb__runningInSpringBoard();
                if ((_DWORD)v214)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  {
LABEL_1331:
                    v35 = 0;
                    v36 = 50.0;
                    goto LABEL_194;
                  }
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
                  v2 = objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend((id)v2, "userInterfaceIdiom"))
                  {
                    v35 = 1;
                    v200 = 0x4049000000000000;
                    goto LABEL_1222;
                  }
                }
                v35 = v214 ^ 1;
                v224 = __sb__runningInSpringBoard();
                if (v224)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
                  v214 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v214, "_referenceBounds");
                }
                BSSizeRoundForScale();
                v36 = 50.0;
                if (v224 != 1)

LABEL_194:
                if (v35)

                if (v34)
                if (v33)

                if (v32)
                if (v31)

                if (v428)
                if ((_DWORD)v431)

                if (HIDWORD(v431))
                if ((_DWORD)v433)

                if (HIDWORD(v433))
                if (HIDWORD(v434))

                if ((_DWORD)v436)
                if (HIDWORD(v436))

                if ((_DWORD)v434)
                if ((_DWORD)v438)

                if (HIDWORD(v438))
                if (v444)

                if ((_DWORD)v442)
                if (HIDWORD(v442))

                if ((_DWORD)v448)
                if (HIDWORD(v448))

                if (v445)
                if (v447)

                if (HIDWORD(v450[0]))
                if (LODWORD(v450[1]))

                if (LODWORD(v450[2]))
                if (HIDWORD(v450[2]))

                if (LODWORD(v450[0]))
                if (HIDWORD(v450[1]))

                if (LODWORD(v450[3]))
                if (LODWORD(v450[4]))

                if (HIDWORD(v450[3]))
                if (HIDWORD(v450[4]))

                if (LODWORD(v450[5]))
                if (HIDWORD(v450[5]))

                if (LODWORD(v450[6]))
                if (HIDWORD(v450[7]))

                if (LODWORD(v450[7]))
                if (HIDWORD(v450[6]))

                if (LODWORD(v450[8]))
                if (HIDWORD(v450[8]))

                if (LODWORD(v450[9]))
                if (v454)

                if (HIDWORD(v450[9]))
                {

                  if (!(_DWORD)v451)
                    goto LABEL_282;
                }
                else if (!(_DWORD)v451)
                {
LABEL_282:
                  if (HIDWORD(v451))
                    goto LABEL_283;
                  goto LABEL_293;
                }

                if (HIDWORD(v451))
                {
LABEL_283:

                  if (!(_DWORD)v452)
                    goto LABEL_284;
                  goto LABEL_294;
                }
LABEL_293:
                if (!(_DWORD)v452)
                {
LABEL_284:
                  if (HIDWORD(v452))
                    goto LABEL_285;
                  goto LABEL_295;
                }
LABEL_294:

                if (HIDWORD(v452))
                {
LABEL_285:

                  if (!(_DWORD)v453)
                    goto LABEL_286;
                  goto LABEL_296;
                }
LABEL_295:
                if (!(_DWORD)v453)
                {
LABEL_286:
                  if (HIDWORD(v453))
                    goto LABEL_287;
                  goto LABEL_297;
                }
LABEL_296:

                if (HIDWORD(v453))
                {
LABEL_287:

                  if (!v455)
                    goto LABEL_288;
                  goto LABEL_298;
                }
LABEL_297:
                if (!v455)
                {
LABEL_288:
                  if (!v456)
                    return v36;
LABEL_289:

                  return v36;
                }
LABEL_298:

                if (!v456)
                  return v36;
                goto LABEL_289;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
              v9 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend((id)v9, "userInterfaceIdiom"))
              {
                v34 = 0;
                v33 = 1;
                goto LABEL_1328;
              }
            }
            v33 = v2 ^ 1;
            v2 = __sb__runningInSpringBoard();
            if ((_DWORD)v2)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v7 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v7, "_referenceBounds");
            }
            v34 = v2 ^ 1;
            BSSizeRoundForScale();
            if (v213 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
              goto LABEL_1331;
            goto LABEL_1328;
          }
        }
        else
        {
          HIDWORD(v431) = 0;
        }
LABEL_1182:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
          LODWORD(v431) = 0;
          v428 = 0;
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 37.5;
          goto LABEL_194;
        }
        goto LABEL_1213;
      }
    }
    memset(v450, 0, 64);
    v447 = 0;
    v445 = 0;
    v448 = 0;
    v442 = 0;
    v444 = 0;
    v438 = 0;
    v434 = 0;
    v436 = 0;
    v433 = 0;
    v431 = 0;
    v428 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 90.0;
    LODWORD(v450[8]) = v9 ^ 1;
    goto LABEL_194;
  }
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v453) = 0;
      LOBYTE(v456) = 0;
      goto LABEL_18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v457 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v457, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v453) = 0;
      LOBYTE(v456) = 1;
      goto LABEL_18;
    }
  }
  LOBYTE(v456) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v8 = __sb__runningInSpringBoard();
    if (v8)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v302, "_referenceBounds");
    }
    v42 = v8 ^ 1;
    BSSizeRoundForScale();
    v45 = v44 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v43 == *(double *)(MEMORY[0x1E0DAB260] + 280);
    HIDWORD(v453) = v42;
    if (v45)
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v432 = 0;
      v441 = 0;
      v443 = 0;
      v446 = 0;
      v450[1] = 0;
      LODWORD(v450[0]) = 0;
      *(_QWORD *)((char *)&v450[2] + 4) = 0;
      *(_QWORD *)((char *)&v450[4] + 4) = 0;
      v452 = 0;
      v450[9] = 0;
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      v30 = &qword_1D048FBA8;
      goto LABEL_131;
    }
  }
  else
  {
    HIDWORD(v453) = 0;
  }
LABEL_18:
  v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v450[1]) = 0;
      LODWORD(v450[3]) = 0;
      goto LABEL_36;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v317, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v450[1]) = 0;
      LODWORD(v450[3]) = 1;
      goto LABEL_36;
    }
  }
  LODWORD(v450[3]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "_referenceBounds");
    }
    BSSizeRoundForScale();
    HIDWORD(v450[1]) = v11 ^ 1;
    if (v49 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v432 = 0;
      v441 = 0;
      v443 = 0;
      v446 = 0;
      LODWORD(v450[1]) = 0;
      LODWORD(v450[0]) = 0;
      HIDWORD(v450[2]) = 0;
      *(_QWORD *)((char *)&v450[4] + 4) = 0;
      v452 = 0;
      v450[9] = 0;
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      v30 = &qword_1D048FBD0;
      goto LABEL_131;
    }
  }
  else
  {
    HIDWORD(v450[1]) = 0;
  }
LABEL_36:
  v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      goto LABEL_54;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v315, "userInterfaceIdiom") != 1)
    {
      LODWORD(v453) = 0;
      LODWORD(v451) = 1;
      goto LABEL_54;
    }
  }
  LODWORD(v451) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "_referenceBounds");
    }
    LODWORD(v453) = v16 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v432 = 0;
      v441 = 0;
      v443 = 0;
      v446 = 0;
      LODWORD(v450[1]) = 0;
      LODWORD(v450[0]) = 0;
      HIDWORD(v450[2]) = 0;
      *(_QWORD *)((char *)&v450[4] + 4) = 0;
      v452 = 0;
      v450[9] = 0;
      v30 = &qword_1D048FBC0;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v453) = 0;
  }
LABEL_54:
  v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v450[9] = 0;
      goto LABEL_71;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v313, "userInterfaceIdiom") != 1)
    {
      v450[9] = 0x100000000;
      goto LABEL_71;
    }
  }
  HIDWORD(v450[9]) = v20 ^ 1;
  v21 = __sb__runningInSpringBoard();
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v308, "_referenceBounds");
  }
  LODWORD(v450[9]) = v21 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    v432 = 0;
    v441 = 0;
    v443 = 0;
    v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    *(_QWORD *)((char *)&v450[4] + 4) = 0;
    v452 = 0;
    v30 = &qword_1D048FBC8;
    goto LABEL_131;
  }
LABEL_71:
  v26 = __sb__runningInSpringBoard();
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v452 = 0;
      goto LABEL_91;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v311, "userInterfaceIdiom") != 1)
    {
      v452 = 0x100000000;
      goto LABEL_91;
    }
  }
  HIDWORD(v452) = v26 ^ 1;
  v27 = __sb__runningInSpringBoard();
  if (v27)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "_referenceBounds");
  }
  LODWORD(v452) = v27 ^ 1;
  BSSizeRoundForScale();
  if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    v432 = 0;
    v441 = 0;
    v443 = 0;
    v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    *(_QWORD *)((char *)&v450[4] + 4) = 0;
    v30 = &qword_1D048FBB8;
    goto LABEL_131;
  }
LABEL_91:
  v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v450[4] + 4) = 0;
      goto LABEL_518;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v327, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v450[4] + 4) = 0x100000000;
      goto LABEL_518;
    }
  }
  LODWORD(v450[5]) = v38 ^ 1;
  v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v296, "_referenceBounds");
  }
  HIDWORD(v450[4]) = v39 ^ 1;
  BSSizeRoundForScale();
  if (v87 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    v432 = 0;
    v441 = 0;
    v443 = 0;
    v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    v30 = &qword_1D048FBB0;
    goto LABEL_131;
  }
LABEL_518:
  v88 = __sb__runningInSpringBoard();
  if (v88)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_520;
LABEL_526:
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    v432 = 0;
    v441 = 0;
    v443 = 0;
    v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    v30 = &qword_1D048FBA0;
    HIDWORD(v450[2]) = v88 ^ 1;
    goto LABEL_131;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v306, "userInterfaceIdiom") == 1)
    goto LABEL_526;
LABEL_520:
  HIDWORD(v450[2]) = v88 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_524:
    LODWORD(v450[0]) = 0;
    HIDWORD(v446) = 0;
    goto LABEL_564;
  }
  v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_524;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v292, "userInterfaceIdiom"))
    {
      LODWORD(v450[0]) = 0;
      HIDWORD(v446) = 1;
      goto LABEL_564;
    }
  }
  HIDWORD(v446) = v89 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v94 = __sb__runningInSpringBoard();
    if (v94)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "_referenceBounds");
    }
    LODWORD(v450[0]) = v94 ^ 1;
    BSSizeRoundForScale();
    if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v432 = 0;
      v441 = 0;
      v443 = 0;
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 0;
      v30 = &qword_1D048FB80;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v450[0]) = 0;
  }
LABEL_564:
  v95 = __sb__runningInSpringBoard();
  if (v95)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 0;
      goto LABEL_574;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v294, "userInterfaceIdiom"))
    {
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 1;
      goto LABEL_574;
    }
  }
  LODWORD(v450[1]) = v95 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v96 = __sb__runningInSpringBoard();
    if (v96)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "_referenceBounds");
    }
    LODWORD(v446) = v96 ^ 1;
    BSSizeRoundForScale();
    if (v97 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_578;
  }
  else
  {
    LODWORD(v446) = 0;
  }
LABEL_574:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    v432 = 0;
    v441 = 0;
    v443 = 0;
    v30 = &qword_1D048FB88;
    goto LABEL_131;
  }
LABEL_578:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_582:
    v443 = 0;
    goto LABEL_648;
  }
  v98 = __sb__runningInSpringBoard();
  if (v98)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_582;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v286, "userInterfaceIdiom"))
    {
      v443 = 0x100000000;
      goto LABEL_648;
    }
  }
  HIDWORD(v443) = v98 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v106 = __sb__runningInSpringBoard();
    if (v106)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "_referenceBounds");
    }
    LODWORD(v443) = v106 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v432 = 0;
      v441 = 0;
      v30 = &qword_1D048FB90;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v443) = 0;
  }
LABEL_648:
  v107 = __sb__runningInSpringBoard();
  if (v107)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v432) = 0;
      HIDWORD(v441) = 0;
      goto LABEL_658;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v290, "userInterfaceIdiom"))
    {
      HIDWORD(v432) = 0;
      HIDWORD(v441) = 1;
      goto LABEL_658;
    }
  }
  HIDWORD(v441) = v107 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v108 = __sb__runningInSpringBoard();
    if (v108)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "_referenceBounds");
    }
    HIDWORD(v432) = v108 ^ 1;
    BSSizeRoundForScale();
    if (v109 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_662;
  }
  else
  {
    HIDWORD(v432) = 0;
  }
LABEL_658:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v409 = 0;
    v421 = 0;
    LODWORD(v432) = 0;
    LODWORD(v441) = 0;
    v30 = &qword_1D048FB98;
    goto LABEL_131;
  }
LABEL_662:
  v110 = __sb__runningInSpringBoard();
  if (v110)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v432) = 0;
      LODWORD(v441) = 0;
      goto LABEL_672;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v288, "userInterfaceIdiom"))
    {
      LODWORD(v432) = 0;
      LODWORD(v441) = 1;
      goto LABEL_672;
    }
  }
  LODWORD(v441) = v110 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v111 = __sb__runningInSpringBoard();
    if (v111)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v432) = v111 ^ 1;
    if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v430 = 0;
      v409 = 0;
      v421 = 0;
      v30 = &qword_1D048FB70;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v432) = 0;
  }
LABEL_672:
  v112 = __sb__runningInSpringBoard();
  if (v112)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v409 = 0;
      v421 = 0;
      goto LABEL_750;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v282, "userInterfaceIdiom"))
    {
      v409 = 0;
      v421 = 1;
      goto LABEL_750;
    }
  }
  v421 = v112 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v266, "_referenceBounds");
    }
    v409 = v119 ^ 1;
    BSSizeRoundForScale();
    if (v126 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_784;
  }
  else
  {
    v409 = 0;
  }
LABEL_750:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v417 = 0;
    v419 = 0;
    v430 = 0;
    v30 = &qword_1D048FB78;
    goto LABEL_131;
  }
LABEL_784:
  v127 = __sb__runningInSpringBoard();
  if (v127)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v430 = 0;
      goto LABEL_810;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v280, "userInterfaceIdiom"))
    {
      v430 = 0x100000000;
      goto LABEL_810;
    }
  }
  HIDWORD(v430) = v127 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v132 = __sb__runningInSpringBoard();
    if (v132)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "_referenceBounds");
    }
    BSSizeRoundForScale();
    LODWORD(v430) = v132 ^ 1;
    if (v137 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v393 = 0;
      v397 = 0;
      v417 = 0;
      v419 = 0;
      v30 = &qword_1D048FB40;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v430) = 0;
  }
LABEL_810:
  v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v417 = 0;
      v419 = 0;
      goto LABEL_840;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v274, "userInterfaceIdiom"))
    {
      v417 = 0;
      v419 = 1;
      goto LABEL_840;
    }
  }
  v419 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v136 = __sb__runningInSpringBoard();
    if (v136)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "_referenceBounds");
    }
    v417 = v136 ^ 1;
    BSSizeRoundForScale();
    if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_871;
  }
  else
  {
    v417 = 0;
  }
LABEL_840:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v405 = 0;
    v407 = 0;
    v393 = 0;
    v397 = 0;
    v30 = &qword_1D048FB48;
    goto LABEL_131;
  }
LABEL_871:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_875:
    v393 = 0;
    v397 = 0;
    goto LABEL_900;
  }
  v141 = __sb__runningInSpringBoard();
  if (v141)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_875;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v264, "userInterfaceIdiom"))
    {
      v393 = 0;
      v397 = 1;
      goto LABEL_900;
    }
  }
  v397 = v141 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v393 = v146 ^ 1;
    if (v161 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v383 = 0;
      v385 = 0;
      v405 = 0;
      v407 = 0;
      v30 = &qword_1D048FB30;
      goto LABEL_131;
    }
  }
  else
  {
    v393 = 0;
  }
LABEL_900:
  v147 = __sb__runningInSpringBoard();
  if (v147)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v405 = 0;
      v407 = 0;
      goto LABEL_910;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v272, "userInterfaceIdiom"))
    {
      v405 = 0;
      v407 = 1;
      goto LABEL_910;
    }
  }
  v407 = v147 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v148 = __sb__runningInSpringBoard();
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "_referenceBounds");
    }
    v405 = v148 ^ 1;
    BSSizeRoundForScale();
    if (v149 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_914;
  }
  else
  {
    v405 = 0;
  }
LABEL_910:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v381 = 0;
    v391 = 0;
    v383 = 0;
    v385 = 0;
    v30 = &qword_1D048FB38;
    goto LABEL_131;
  }
LABEL_914:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_918:
    v383 = 0;
    v385 = 0;
    goto LABEL_984;
  }
  v150 = __sb__runningInSpringBoard();
  if (v150)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_918;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v254, "userInterfaceIdiom"))
    {
      v383 = 0;
      v385 = 1;
      goto LABEL_984;
    }
  }
  v385 = v150 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v164 = __sb__runningInSpringBoard();
    if (v164)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "_referenceBounds");
    }
    v383 = v164 ^ 1;
    BSSizeRoundForScale();
    if (v181 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v355 = 0;
      v373 = 0;
      v381 = 0;
      v391 = 0;
      v30 = &qword_1D048FB60;
      goto LABEL_131;
    }
  }
  else
  {
    v383 = 0;
  }
LABEL_984:
  v165 = __sb__runningInSpringBoard();
  if (v165)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v381 = 0;
      v391 = 0;
      goto LABEL_994;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v262, "userInterfaceIdiom"))
    {
      v381 = 0;
      v391 = 1;
      goto LABEL_994;
    }
  }
  v391 = v165 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v166 = __sb__runningInSpringBoard();
    if (v166)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "_referenceBounds");
    }
    v381 = v166 ^ 1;
    BSSizeRoundForScale();
    if (v167 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_998;
  }
  else
  {
    v381 = 0;
  }
LABEL_994:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v367 = 0;
    v369 = 0;
    v355 = 0;
    v373 = 0;
    v30 = &qword_1D048FB68;
    goto LABEL_131;
  }
LABEL_998:
  v168 = __sb__runningInSpringBoard();
  if (v168)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v355 = 0;
      v373 = 0;
      goto LABEL_1008;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v256, "userInterfaceIdiom"))
    {
      v355 = 0;
      v373 = 1;
      goto LABEL_1008;
    }
  }
  v373 = v168 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v169 = __sb__runningInSpringBoard();
    if (v169)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v355 = v169 ^ 1;
    if (v178 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v353 = 0;
      v365 = 0;
      v367 = 0;
      v369 = 0;
      v30 = &qword_1D048FB50;
      goto LABEL_131;
    }
  }
  else
  {
    v355 = 0;
  }
LABEL_1008:
  v170 = __sb__runningInSpringBoard();
  if (v170)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v367 = 0;
      v369 = 0;
      goto LABEL_1086;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v250, "userInterfaceIdiom"))
    {
      v367 = 0;
      v369 = 1;
      goto LABEL_1086;
    }
  }
  v369 = v170 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v177 = __sb__runningInSpringBoard();
    if (v177)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "_referenceBounds");
    }
    v367 = v177 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1120;
  }
  else
  {
    v367 = 0;
  }
LABEL_1086:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v349 = 0;
    v351 = 0;
    v353 = 0;
    v365 = 0;
    v30 = &qword_1D048FB58;
    goto LABEL_131;
  }
LABEL_1120:
  v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v353 = 0;
      v365 = 0;
      goto LABEL_1146;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v248, "userInterfaceIdiom"))
    {
      v353 = 0;
      v365 = 1;
      goto LABEL_1146;
    }
  }
  v365 = v185 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v190 = __sb__runningInSpringBoard();
    if (v190)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "_referenceBounds");
    }
    v353 = v190 ^ 1;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v330 = 0;
      v341 = 0;
      v349 = 0;
      v351 = 0;
      v30 = &qword_1D048FB20;
      goto LABEL_131;
    }
  }
  else
  {
    v353 = 0;
  }
LABEL_1146:
  v191 = __sb__runningInSpringBoard();
  if (v191)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v349 = 0;
      v351 = 0;
      goto LABEL_1176;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v242, "userInterfaceIdiom"))
    {
      v349 = 0;
      v351 = 1;
      goto LABEL_1176;
    }
  }
  v351 = v191 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v193 = __sb__runningInSpringBoard();
    if (v193)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v326, "_referenceBounds");
    }
    v349 = v193 ^ 1;
    BSSizeRoundForScale();
    if (v198 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1201;
  }
  else
  {
    v349 = 0;
  }
LABEL_1176:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v30 = &qword_1D048FB28;
    goto LABEL_131;
  }
LABEL_1201:
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v30 = &qword_1D048FB00;
    goto LABEL_131;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v30 = &qword_1D048FB08;
    goto LABEL_131;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v30 = &qword_1D048FAF0;
    goto LABEL_131;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v333 = 0;
    v335 = 0;
    v329 = 0;
    v337 = 0;
    v339 = 0;
    v330 = 0;
    v341 = 0;
    v30 = &qword_1D048FAF8;
    goto LABEL_131;
  }
  v202 = __sb__runningInSpringBoard();
  if (v202)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v330 = 0;
      v341 = 0;
      goto LABEL_1257;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v325, "userInterfaceIdiom"))
    {
      v330 = 0;
      v341 = 1;
      goto LABEL_1257;
    }
  }
  v341 = v202 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v204 = __sb__runningInSpringBoard();
    if (v204)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "_referenceBounds");
    }
    v330 = v204 ^ 1;
    BSSizeRoundForScale();
    if (v216 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v337 = 0;
      v339 = 0;
      v30 = &qword_1D048FB10;
      goto LABEL_131;
    }
  }
  else
  {
    v330 = 0;
  }
LABEL_1257:
  v205 = __sb__runningInSpringBoard();
  if (v205)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v337 = 0;
      v339 = 0;
      goto LABEL_1287;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v324, "userInterfaceIdiom"))
    {
      v337 = 0;
      v339 = 1;
      goto LABEL_1287;
    }
  }
  v339 = v205 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v207 = __sb__runningInSpringBoard();
    if (v207)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v319, "_referenceBounds");
    }
    v337 = v207 ^ 1;
    BSSizeRoundForScale();
    if (v219 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v333 = 0;
      v335 = 0;
      v329 = 0;
      v30 = &qword_1D048FB18;
      goto LABEL_131;
    }
  }
  else
  {
    v337 = 0;
  }
LABEL_1287:
  v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v329 = 0;
      goto LABEL_1317;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v323, "userInterfaceIdiom"))
    {
      v329 = 0x100000000;
      goto LABEL_1317;
    }
  }
  HIDWORD(v329) = v208 ^ 1;
  v210 = __sb__runningInSpringBoard();
  if (v210)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v321, "_referenceBounds");
  }
  LODWORD(v329) = v210 ^ 1;
  BSSizeRoundForScale();
  if (v211 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v333 = 0;
    v335 = 0;
    v30 = &qword_1D048FAE8;
    goto LABEL_131;
  }
LABEL_1317:
  v212 = __sb__runningInSpringBoard();
  if (v212)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v333 = 0;
      v335 = 0;
LABEL_1367:
      v30 = &CSQuickActionButtonInsetY;
      goto LABEL_131;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v322, "userInterfaceIdiom"))
    {
      v333 = 0;
      v335 = 1;
      goto LABEL_1367;
    }
  }
  v335 = v212 ^ 1;
  v222 = __sb__runningInSpringBoard();
  if (v222)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v229, "_referenceBounds");
  }
  v333 = v222 ^ 1;
  BSSizeRoundForScale();
  if (v223 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1367;
  v30 = &qword_1D048FAE0;
LABEL_131:
  v52 = *(double *)v30;
  v53 = __sb__runningInSpringBoard();
  v54 = (uint64_t)&CSQuickActionButtonDiameter;
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v55 = 0;
      v56 = 0;
      goto LABEL_140;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v318, "userInterfaceIdiom") != 1)
    {
      v56 = 0;
      v55 = 1;
      goto LABEL_140;
    }
  }
  v55 = v53 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "_referenceBounds");
    }
    v56 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v79 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v78 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v454 = v57 ^ 1;
      v455 = v55;
      memset((char *)&v450[5] + 4, 0, 28);
      HIDWORD(v451) = 0;
      *(_QWORD *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      v440 = 0;
      v449 = 0;
      HIDWORD(v450[0]) = 0;
      v439 = 0;
      v437 = 0;
      v435 = 0;
      v429 = 0;
      v427 = 0;
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F9A8;
      goto LABEL_303;
    }
  }
  else
  {
    v56 = 0;
  }
LABEL_140:
  v58 = __sb__runningInSpringBoard();
  v454 = v56;
  v455 = v55;
  if (v58)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v59 = 0;
      v54 = 0;
      goto LABEL_149;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v316, "userInterfaceIdiom") != 1)
    {
      v54 = 0;
      v59 = 1;
      goto LABEL_149;
    }
  }
  v59 = v58 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "_referenceBounds");
    }
    v54 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v450[8] = __PAIR64__(v59, v54);
      memset((char *)&v450[5] + 4, 0, 20);
      HIDWORD(v451) = 0;
      *(_QWORD *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      v440 = 0;
      v449 = 0;
      HIDWORD(v450[0]) = 0;
      v439 = 0;
      v437 = 0;
      v435 = 0;
      v429 = 0;
      v427 = 0;
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F9D0;
      goto LABEL_303;
    }
  }
  else
  {
    v54 = 0;
  }
LABEL_149:
  v60 = __sb__runningInSpringBoard();
  v450[8] = __PAIR64__(v59, v54);
  if (v60)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v61 = 0;
      v62 = 0;
      goto LABEL_158;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v314, "userInterfaceIdiom") != 1)
    {
      v62 = 0;
      v61 = 1;
      goto LABEL_158;
    }
  }
  v61 = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "_referenceBounds");
    }
    v62 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v83 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      LODWORD(v450[7]) = v57 ^ 1;
      HIDWORD(v450[7]) = v61;
      v450[6] = 0;
      HIDWORD(v450[5]) = 0;
      HIDWORD(v451) = 0;
      *(_QWORD *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      v440 = 0;
      v449 = 0;
      HIDWORD(v450[0]) = 0;
      v439 = 0;
      v437 = 0;
      v435 = 0;
      v429 = 0;
      v427 = 0;
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F9C0;
      goto LABEL_303;
    }
  }
  else
  {
    v62 = 0;
  }
LABEL_158:
  v63 = __sb__runningInSpringBoard();
  v450[7] = __PAIR64__(v61, v62);
  if (v63)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v64 = 0;
      v65 = 0;
      goto LABEL_167;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v312, "userInterfaceIdiom") != 1)
    {
      v65 = 0;
      v64 = 1;
      goto LABEL_167;
    }
  }
  v64 = v63 ^ 1;
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "_referenceBounds");
  }
  v65 = v57 ^ 1;
  BSSizeRoundForScale();
  if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    LODWORD(v450[6]) = v57 ^ 1;
    HIDWORD(v450[6]) = v64;
    HIDWORD(v450[5]) = 0;
    HIDWORD(v451) = 0;
    *(_QWORD *)((char *)&v450[3] + 4) = 0;
    LODWORD(v450[2]) = 0;
    v440 = 0;
    v449 = 0;
    HIDWORD(v450[0]) = 0;
    v439 = 0;
    v437 = 0;
    v435 = 0;
    v429 = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F9C8;
    goto LABEL_303;
  }
LABEL_167:
  v67 = __sb__runningInSpringBoard();
  v450[6] = __PAIR64__(v64, v65);
  if (v67)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v68 = 0;
      HIDWORD(v451) = 0;
      goto LABEL_177;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v310, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v451) = 0;
      v68 = 1;
      goto LABEL_177;
    }
  }
  v68 = v67 ^ 1;
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v303, "_referenceBounds");
  }
  HIDWORD(v451) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v76 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    HIDWORD(v450[5]) = v68;
    *(_QWORD *)((char *)&v450[3] + 4) = 0;
    LODWORD(v450[2]) = 0;
    v440 = 0;
    v449 = 0;
    HIDWORD(v450[0]) = 0;
    v439 = 0;
    v437 = 0;
    v435 = 0;
    v429 = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F9B8;
    goto LABEL_303;
  }
LABEL_177:
  v77 = __sb__runningInSpringBoard();
  HIDWORD(v450[5]) = v68;
  if (v77)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v450[3] + 4) = 0;
      goto LABEL_542;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v309, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v450[3] + 4) = 0x100000000;
      goto LABEL_542;
    }
  }
  LODWORD(v450[4]) = v77 ^ 1;
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "_referenceBounds");
  }
  HIDWORD(v450[3]) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v92 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    LODWORD(v450[2]) = 0;
    v440 = 0;
    v449 = 0;
    HIDWORD(v450[0]) = 0;
    v439 = 0;
    v437 = 0;
    v435 = 0;
    v429 = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F9B0;
    goto LABEL_303;
  }
LABEL_542:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_544;
LABEL_550:
    v440 = 0;
    v449 = 0;
    HIDWORD(v450[0]) = 0;
    v439 = 0;
    v437 = 0;
    v435 = 0;
    v429 = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F9A0;
    LODWORD(v450[2]) = v57 ^ 1;
    goto LABEL_303;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v305, "userInterfaceIdiom") == 1)
    goto LABEL_550;
LABEL_544:
  LODWORD(v450[2]) = v57 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_548:
    v440 = 0;
    v449 = 0;
    goto LABEL_614;
  }
  v93 = __sb__runningInSpringBoard();
  if (v93)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_548;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v291, "userInterfaceIdiom"))
    {
      v449 = 0;
      v440 = 1;
      goto LABEL_614;
    }
  }
  v440 = v93 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v277, "_referenceBounds");
    }
    v449 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v105 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      HIDWORD(v450[0]) = 0;
      v439 = 0;
      v437 = 0;
      v435 = 0;
      v429 = 0;
      v427 = 0;
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F980;
      goto LABEL_303;
    }
  }
  else
  {
    v449 = 0;
  }
LABEL_614:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v450[0]) = 0;
      v439 = 0;
      goto LABEL_624;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v293, "userInterfaceIdiom"))
    {
      v439 = 0;
      HIDWORD(v450[0]) = 1;
      goto LABEL_624;
    }
  }
  HIDWORD(v450[0]) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "_referenceBounds");
    }
    v439 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v101 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_628;
  }
  else
  {
    v439 = 0;
  }
LABEL_624:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v437 = 0;
    v435 = 0;
    v429 = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F988;
    goto LABEL_303;
  }
LABEL_628:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_632:
    v437 = 0;
    goto LABEL_716;
  }
  v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_632;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v285, "userInterfaceIdiom"))
    {
      v437 = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v437) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "_referenceBounds");
    }
    LODWORD(v437) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v435 = 0;
      v429 = 0;
      v427 = 0;
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F990;
      goto LABEL_303;
    }
  }
  else
  {
    LODWORD(v437) = 0;
  }
LABEL_716:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v435) = 0;
      v429 = 0;
      goto LABEL_726;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v289, "userInterfaceIdiom"))
    {
      v429 = 0;
      HIDWORD(v435) = 1;
      goto LABEL_726;
    }
  }
  HIDWORD(v435) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "_referenceBounds");
    }
    v429 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v116 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_730;
  }
  else
  {
    v429 = 0;
  }
LABEL_726:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    LODWORD(v435) = 0;
    v427 = 0;
    v415 = 0;
    v403 = 0;
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F998;
    goto LABEL_303;
  }
LABEL_730:
  v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v435) = 0;
      v427 = 0;
      goto LABEL_740;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v287, "userInterfaceIdiom"))
    {
      v427 = 0;
      LODWORD(v435) = 1;
      goto LABEL_740;
    }
  }
  LODWORD(v435) = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v118 = __sb__runningInSpringBoard();
    if (v118)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "_referenceBounds");
    }
    v57 = v118 ^ 1u;
    BSSizeRoundForScale();
    v427 = v57;
    if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      v415 = 0;
      v403 = 0;
      v425 = 0;
      v423 = 0;
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F970;
      goto LABEL_303;
    }
  }
  else
  {
    v427 = 0;
  }
LABEL_740:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v415 = 0;
      v403 = 0;
      goto LABEL_762;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v281, "userInterfaceIdiom"))
    {
      v403 = 0;
      v415 = 1;
      goto LABEL_762;
    }
  }
  v415 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v265, "_referenceBounds");
    }
    v403 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v130 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_800;
  }
  else
  {
    v403 = 0;
  }
LABEL_762:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    v425 = 0;
    v423 = 0;
    v413 = 0;
    v411 = 0;
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F978;
    goto LABEL_303;
  }
LABEL_800:
  v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v425 = 0;
      v423 = 0;
      goto LABEL_830;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v279, "userInterfaceIdiom"))
    {
      v423 = 0;
      v425 = 1;
      goto LABEL_830;
    }
  }
  v425 = v131 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "_referenceBounds");
    }
    v57 = v135 ^ 1u;
    BSSizeRoundForScale();
    v423 = v57;
    if (v139 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      v413 = 0;
      v411 = 0;
      v395 = 0;
      v389 = 0;
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F940;
      goto LABEL_303;
    }
  }
  else
  {
    v423 = 0;
  }
LABEL_830:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v413 = 0;
      v411 = 0;
      goto LABEL_854;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v273, "userInterfaceIdiom"))
    {
      v411 = 0;
      v413 = 1;
      goto LABEL_854;
    }
  }
  v413 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "_referenceBounds");
    }
    v411 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_889;
  }
  else
  {
    v411 = 0;
  }
LABEL_854:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v395 = 0;
    v389 = 0;
    v401 = 0;
    v399 = 0;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F948;
    goto LABEL_303;
  }
LABEL_889:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_893:
    v395 = 0;
    v389 = 0;
    goto LABEL_950;
  }
  v145 = __sb__runningInSpringBoard();
  if (v145)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_893;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v263, "userInterfaceIdiom"))
    {
      v389 = 0;
      v395 = 1;
      goto LABEL_950;
    }
  }
  v395 = v145 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v156 = __sb__runningInSpringBoard();
    if (v156)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "_referenceBounds");
    }
    v57 = v156 ^ 1u;
    BSSizeRoundForScale();
    v389 = v57;
    if (v163 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v401 = 0;
      v399 = 0;
      v379 = 0;
      v377 = 0;
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F930;
      goto LABEL_303;
    }
  }
  else
  {
    v389 = 0;
  }
LABEL_950:
  v157 = __sb__runningInSpringBoard();
  if (v157)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v401 = 0;
      v57 = 0;
      goto LABEL_960;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v271, "userInterfaceIdiom"))
    {
      v57 = 0;
      v401 = 1;
      goto LABEL_960;
    }
  }
  v401 = v157 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v158 = __sb__runningInSpringBoard();
    if (v158)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "_referenceBounds");
    }
    v57 = v158 ^ 1u;
    BSSizeRoundForScale();
    if (v159 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_964;
  }
  else
  {
    v57 = 0;
  }
LABEL_960:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    v399 = v57;
    v379 = 0;
    v377 = 0;
    v387 = 0;
    v375 = 0;
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F938;
    goto LABEL_303;
  }
LABEL_964:
  v399 = v57;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_968:
    v379 = 0;
    v377 = 0;
    goto LABEL_1052;
  }
  v160 = __sb__runningInSpringBoard();
  if (v160)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_968;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v253, "userInterfaceIdiom"))
    {
      v377 = 0;
      v379 = 1;
      goto LABEL_1052;
    }
  }
  v379 = v160 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "_referenceBounds");
    }
    v377 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v183 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v387 = 0;
      v375 = 0;
      v371 = 0;
      v347 = 0;
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F960;
      goto LABEL_303;
    }
  }
  else
  {
    v377 = 0;
  }
LABEL_1052:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v387 = 0;
      v375 = 0;
      goto LABEL_1062;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v261, "userInterfaceIdiom"))
    {
      v375 = 0;
      v387 = 1;
      goto LABEL_1062;
    }
  }
  v387 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "_referenceBounds");
    }
    v375 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v174 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1066;
  }
  else
  {
    v375 = 0;
  }
LABEL_1062:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v371 = 0;
    v347 = 0;
    v363 = 0;
    v361 = 0;
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F968;
    goto LABEL_303;
  }
LABEL_1066:
  v175 = __sb__runningInSpringBoard();
  if (v175)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v371 = 0;
      v347 = 0;
      goto LABEL_1076;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v255, "userInterfaceIdiom"))
    {
      v347 = 0;
      v371 = 1;
      goto LABEL_1076;
    }
  }
  v371 = v175 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "_referenceBounds");
    }
    v57 = v176 ^ 1u;
    BSSizeRoundForScale();
    v347 = v57;
    if (v180 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v363 = 0;
      v361 = 0;
      v359 = 0;
      v345 = 0;
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F950;
      goto LABEL_303;
    }
  }
  else
  {
    v347 = 0;
  }
LABEL_1076:
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v363 = 0;
      v361 = 0;
      goto LABEL_1098;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v249, "userInterfaceIdiom"))
    {
      v361 = 0;
      v363 = 1;
      goto LABEL_1098;
    }
  }
  v363 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "_referenceBounds");
    }
    v361 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v188 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_1136;
  }
  else
  {
    v361 = 0;
  }
LABEL_1098:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v359 = 0;
    v345 = 0;
    v343 = 0;
    v357 = 0;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F958;
    goto LABEL_303;
  }
LABEL_1136:
  v189 = __sb__runningInSpringBoard();
  if (v189)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v359 = 0;
      v345 = 0;
      goto LABEL_1166;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v247, "userInterfaceIdiom"))
    {
      v345 = 0;
      v359 = 1;
      goto LABEL_1166;
    }
  }
  v359 = v189 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if ((_DWORD)v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "_referenceBounds");
    }
    v345 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v197 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v343 = 0;
      v357 = 0;
      v331 = 0;
      v328 = 0;
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F920;
      goto LABEL_303;
    }
  }
  else
  {
    v345 = 0;
  }
LABEL_1166:
  v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v343 = 0;
      v57 = 0;
      goto LABEL_1188;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v241, "userInterfaceIdiom"))
    {
      v57 = 0;
      v343 = 1;
      goto LABEL_1188;
    }
  }
  v343 = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "_referenceBounds");
    }
    v57 = v194 ^ 1u;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_1225;
  }
  else
  {
    v57 = 0;
  }
LABEL_1188:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    v357 = v57;
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F928;
    goto LABEL_303;
  }
LABEL_1225:
  v357 = v57;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F900;
    goto LABEL_303;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F908;
    goto LABEL_303;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F8F0;
    goto LABEL_303;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v331 = 0;
    v328 = 0;
    v69 = 0;
    v70 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F8F8;
    goto LABEL_303;
  }
  v57 = __sb__runningInSpringBoard();
  if ((_DWORD)v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v331 = 0;
      v328 = 0;
      goto LABEL_1277;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v231, "userInterfaceIdiom"))
    {
      v328 = 0;
      v331 = 1;
      goto LABEL_1277;
    }
  }
  v331 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v55 = __sb__runningInSpringBoard();
    if ((_DWORD)v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "_referenceBounds");
    }
    v328 = v55 ^ 1;
    BSSizeRoundForScale();
    if (v218 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v69 = 0;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F910;
      goto LABEL_303;
    }
  }
  else
  {
    v328 = 0;
  }
LABEL_1277:
  v206 = __sb__runningInSpringBoard();
  if (v206)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v69 = 0;
      v70 = 0;
      goto LABEL_1307;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v230, "userInterfaceIdiom"))
    {
      v70 = 0;
      v69 = 1;
      goto LABEL_1307;
    }
  }
  v69 = v206 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v55 = __sb__runningInSpringBoard();
    if ((_DWORD)v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "_referenceBounds");
    }
    v70 = v55 ^ 1;
    BSSizeRoundForScale();
    if (v221 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v71 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = &qword_1D048F918;
      goto LABEL_303;
    }
  }
  else
  {
    v70 = 0;
  }
LABEL_1307:
  v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v71 = 0;
      v72 = 0;
      goto LABEL_1338;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v57 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v57, "userInterfaceIdiom"))
    {
      v72 = 0;
      v71 = 1;
      goto LABEL_1338;
    }
  }
  v71 = v209 ^ 1;
  v55 = __sb__runningInSpringBoard();
  if ((_DWORD)v55)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v54, "_referenceBounds");
  }
  v72 = v55 ^ 1;
  BSSizeRoundForScale();
  if (v215 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v73 = 0;
    v74 = 0;
    v75 = &qword_1D048F8E8;
    goto LABEL_303;
  }
LABEL_1338:
  v55 = __sb__runningInSpringBoard();
  if ((_DWORD)v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v73 = 0;
      v74 = 0;
LABEL_1378:
      v75 = &CSQuickActionButtonDiameter;
      goto LABEL_303;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v56 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v56, "userInterfaceIdiom"))
    {
      v74 = 0;
      v73 = 1;
      goto LABEL_1378;
    }
  }
  v73 = v55 ^ 1;
  v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v55 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v55, "_referenceBounds");
  }
  v74 = v225 ^ 1;
  BSSizeRoundForScale();
  if (v226 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_1378;
  v75 = &qword_1D048F8E0;
LABEL_303:
  v84 = *(double *)v75;
  if (v74)

  if (v73)
  if (v72)

  if (v71)
  if (v70)

  if (v69)
  if (v328)

  if (v331)
  if (v357)

  if (v343)
  if (v345)

  if (v359)
  if (v361)

  if (v363)
  if (v347)

  if (v371)
  if (v375)

  if (v387)
  if (v377)

  if (v379)
  if (v399)

  if (v401)
  if (v389)

  if (v395)
  if (v411)

  if (v413)
  if (v423)

  if (v425)
  if (v403)

  if (v415)
  if (v427)

  if ((_DWORD)v435)
  if (v429)

  if (HIDWORD(v435))
  if ((_DWORD)v437)

  if (HIDWORD(v437))
  if (v439)

  if (HIDWORD(v450[0]))
  if (v449)

  if (v440)
  if (LODWORD(v450[2]))

  if (HIDWORD(v450[3]))
  if (LODWORD(v450[4]))

  if (HIDWORD(v451))
  if (HIDWORD(v450[5]))

  if (LODWORD(v450[6]))
  if (HIDWORD(v450[6]))

  if (LODWORD(v450[7]))
  if (HIDWORD(v450[7]))

  if (LODWORD(v450[8]))
  if (HIDWORD(v450[8]))

  if (v454)
  if (v455)

  if (v333)
  if (v335)

  if ((_DWORD)v329)
  if (HIDWORD(v329))

  if (v337)
  if (v339)

  if (v330)
  if (v341)

  if (v349)
  if (v351)

  if (v353)
  if (v365)

  if (v367)
  if (v369)

  if (v355)
  if (v373)

  if (v381)
  if (v391)

  if (v383)
  if (v385)

  if (v405)
  if (v407)

  if (v393)
  if (v397)

  if (v417)
  if (v419)

  if ((_DWORD)v430)
  if (HIDWORD(v430))

  if (v409)
  if (v421)

  if ((_DWORD)v432)
  if ((_DWORD)v441)

  if (HIDWORD(v432))
  if (HIDWORD(v441))

  if ((_DWORD)v443)
  if (HIDWORD(v443))

  if ((_DWORD)v446)
  if (LODWORD(v450[1]))

  if (LODWORD(v450[0]))
  if (HIDWORD(v446))

  if (HIDWORD(v450[2]))
  if (HIDWORD(v450[4]))

  if (LODWORD(v450[5]))
  if ((_DWORD)v452)

  if (HIDWORD(v452))
  if (LODWORD(v450[9]))

  if (HIDWORD(v450[9]))
  if ((_DWORD)v453)

  if ((_DWORD)v451)
  if (HIDWORD(v450[1]))

  v85 = v84 * 0.5;
  if (LODWORD(v450[3]))

  v86 = v52 + v85;
  if (HIDWORD(v453))

  v36 = v86 + -24.0;
  if ((v456 & 1) != 0)
    goto LABEL_289;
  return v36;
}

- (CSModalViewDelegate)delegate
{
  return (CSModalViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)showsStatusText
{
  return self->_showsStatusText;
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (UILabel)_subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)_secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (CSModalButton)_primaryActionButton
{
  return self->_primaryActionButton;
}

- (UIButton)_secondaryActionButton
{
  return self->_secondaryActionButton;
}

- (UIImageView)_imageView
{
  return self->_imageView;
}

- (UIView)detailView
{
  return self->_detailView;
}

- (BOOL)wantsEnhancedSecondaryActionButton
{
  return self->_wantsEnhancedSecondaryActionButton;
}

- (BOOL)showsDateView
{
  return self->_showsDateView;
}

- (void)setShowsDateView:(BOOL)a3
{
  self->_showsDateView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_statusTextViewController, 0);
  objc_storeStrong((id *)&self->_overrideFooterText, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_centralGroupBottomConstraint, 0);
  objc_storeStrong((id *)&self->_centralGroupTopConstraint, 0);
  objc_storeStrong((id *)&self->_dateViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_dateViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_centralGroupView, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_primaryActionButton, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
