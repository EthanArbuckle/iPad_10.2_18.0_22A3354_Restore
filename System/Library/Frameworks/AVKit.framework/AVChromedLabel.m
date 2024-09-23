@implementation AVChromedLabel

- (AVChromedLabel)initWithFrame:(CGRect)a3
{
  AVChromedLabel *v3;
  AVChromedLabel *v4;
  AVLayoutItemAttributes *v5;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v7;
  AVLayoutItemAttributes *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVChromedLabel;
  v3 = -[AVChromedLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_included = 1;
    v3->_numberOfLines = 1;
    v5 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v5;

    v7 = v4->_layoutAttributes;
    -[AVChromedLabel intrinsicContentSize](v4, "intrinsicContentSize");
    -[AVLayoutItemAttributes setMinimumSize:](v7, "setMinimumSize:");
    -[AVLayoutItemAttributes setCollapsed:](v4->_layoutAttributes, "setCollapsed:", -[AVChromedLabel isCollapsed](v4, "isCollapsed"));
    -[AVLayoutItemAttributes setIncluded:](v4->_layoutAttributes, "setIncluded:", -[AVChromedLabel isIncluded](v4, "isIncluded"));
    -[AVLayoutItemAttributes setHasFlexibleContentSize:](v4->_layoutAttributes, "setHasFlexibleContentSize:", 0);
    v8 = v4->_layoutAttributes;
    -[AVChromedLabel accessibilityIdentifier](v4, "accessibilityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutItemAttributes setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v9);

  }
  return v4;
}

- (UILabel)label
{
  UILabel *label;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  unint64_t v13;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[AVChromedLabel bounds](self, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_label;
    self->_label = v5;

    v7 = self->_label;
    -[AVChromedLabel tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    v9 = self->_label;
    -[AVChromedLabel text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9, "setText:", v10);

    v11 = self->_label;
    -[AVChromedLabel font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = -[AVChromedLabel loadingIndicatorAlignment](self, "loadingIndicatorAlignment");
    if (v13 <= 2)
      -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", qword_1AC5F80E0[v13]);
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", -[AVChromedLabel numberOfLines](self, "numberOfLines"));
    -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
    -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");
    -[AVChromedLabel addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (UILabel)labelIfLoaded
{
  return self->_label;
}

- (void)setFont:(id)a3
{
  void *v5;
  void *v6;
  UIFont *v7;

  v7 = (UIFont *)a3;
  if (self->_font != v7)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v7);

    -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intrinsicContentSize");
    -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");

  }
}

- (void)setLoadingIndicatorAlignment:(int64_t)a3
{
  _BOOL8 v4;
  void *v5;

  if (self->_loadingIndicatorAlignment != a3)
  {
    self->_loadingIndicatorAlignment = a3;
    v4 = a3 == 2;
    -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", v4);

    if (-[AVChromedLabel showsLoadingIndicator](self, "showsLoadingIndicator"))
      -[AVChromedLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  UIActivityIndicatorView *loadingIndicator;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *loadingIndicatorLeftAlignmentConstraint;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *loadingIndicatorRightAlignmentConstraint;

  if (self->_showsLoadingIndicator != a3)
  {
    v3 = a3;
    self->_showsLoadingIndicator = a3;
    -[AVChromedLabel label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 && v3)
    {
      -[AVChromedLabel label](self, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", CFSTR(" "));

    }
    -[AVChromedLabel label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1.0;
    if (v3)
      v10 = 0.0;
    objc_msgSend(v8, "setAlpha:", v10);

    loadingIndicator = self->_loadingIndicator;
    if (v3)
    {
      if (!loadingIndicator)
      {
        v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 3);
        v16 = self->_loadingIndicator;
        self->_loadingIndicator = v15;

        -[UIActivityIndicatorView leftAnchor](self->_loadingIndicator, "leftAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVChromedLabel leftAnchor](self, "leftAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintEqualToAnchor:", v18);
        v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        loadingIndicatorLeftAlignmentConstraint = self->_loadingIndicatorLeftAlignmentConstraint;
        self->_loadingIndicatorLeftAlignmentConstraint = v19;

        -[UIActivityIndicatorView rightAnchor](self->_loadingIndicator, "rightAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVChromedLabel rightAnchor](self, "rightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        loadingIndicatorRightAlignmentConstraint = self->_loadingIndicatorRightAlignmentConstraint;
        self->_loadingIndicatorRightAlignmentConstraint = v23;

        -[AVChromedLabel addSubview:](self, "addSubview:", self->_loadingIndicator);
        -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
        -[AVChromedLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      }
    }
    else
    {
      -[UIActivityIndicatorView removeFromSuperview](loadingIndicator, "removeFromSuperview");
      v12 = self->_loadingIndicatorLeftAlignmentConstraint;
      self->_loadingIndicatorLeftAlignmentConstraint = 0;

      v13 = self->_loadingIndicatorRightAlignmentConstraint;
      self->_loadingIndicatorRightAlignmentConstraint = 0;

      v14 = self->_loadingIndicator;
      self->_loadingIndicator = 0;

    }
  }
}

- (void)setText:(id)a3
{
  NSUInteger v4;
  NSString *v5;
  NSString *text;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = -[NSString length](self->_text, "length");
    v5 = (NSString *)objc_msgSend(v9, "copy");
    text = self->_text;
    self->_text = v5;

    -[AVChromedLabel label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    if (v4 != -[NSString length](self->_text, "length"))
    {
      -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intrinsicContentSize");
      -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");

      -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
    }
  }

}

- (void)setAttributedText:(id)a3
{
  NSUInteger v4;
  NSAttributedString *v5;
  NSAttributedString *attributedText;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedText, "isEqualToAttributedString:"))
  {
    v4 = -[NSAttributedString length](self->_attributedText, "length");
    v5 = (NSAttributedString *)objc_msgSend(v9, "copy");
    attributedText = self->_attributedText;
    self->_attributedText = v5;

    -[AVChromedLabel label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v9);

    if (v4 != -[NSAttributedString length](self->_attributedText, "length"))
    {
      -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intrinsicContentSize");
      -[AVChromedLabel setExtrinsicContentSize:](self, "setExtrinsicContentSize:");

    }
    -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
  }

}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    -[AVChromedLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AVChromedLabel layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVChromedLabel intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVChromedLabel layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVChromedLabel isIncluded](self, "isIncluded"))
    v5 = -[AVChromedLabel isRemoved](self, "isRemoved") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  -[AVChromedLabel layoutAttributes](self, "layoutAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollapsed:", -[AVChromedLabel isCollapsed](self, "isCollapsed"));

}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVChromedLabel;
  -[AVChromedLabel didMoveToSuperview](&v3, sel_didMoveToSuperview);
  +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", self);
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVChromedLabel;
  -[AVChromedLabel tintColorDidChange](&v5, sel_tintColorDidChange);
  -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVChromedLabel tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)updateConstraints
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  -[AVChromedLabel label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints");

  if (v4)
  {
    -[AVChromedLabel label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)MEMORY[0x1E0CB3718];
    -[AVChromedLabel label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateConstraints:", v8);

  }
  if (-[AVChromedLabel showsLoadingIndicator](self, "showsLoadingIndicator"))
  {
    -[AVChromedLabel loadingIndicator](self, "loadingIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "translatesAutoresizingMaskIntoConstraints");

    if (v10)
    {
      -[AVChromedLabel loadingIndicator](self, "loadingIndicator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[AVChromedLabel loadingIndicator](self, "loadingIndicator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVChromedLabel centerYAnchor](self, "centerYAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

    }
    -[AVChromedLabel loadingIndicatorLeftAlignmentConstraint](self, "loadingIndicatorLeftAlignmentConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", -[AVChromedLabel loadingIndicatorAlignment](self, "loadingIndicatorAlignment") == 0);

    -[AVChromedLabel loadingIndicatorRightAlignmentConstraint](self, "loadingIndicatorRightAlignmentConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", -[AVChromedLabel loadingIndicatorAlignment](self, "loadingIndicatorAlignment") == 1);

  }
  v18.receiver = self;
  v18.super_class = (Class)AVChromedLabel;
  -[AVChromedLabel updateConstraints](&v18, sel_updateConstraints);
}

- (void)setNumberOfLines:(int64_t)a3
{
  id v4;

  if (self->_numberOfLines != a3)
  {
    self->_numberOfLines = a3;
    -[AVChromedLabel labelIfLoaded](self, "labelIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumberOfLines:", a3);

  }
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVChromedLabel layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVChromedLabel setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVChromedLabel isCollapsed](self, "isCollapsed")
      || !-[AVChromedLabel isIncluded](self, "isIncluded")
      || -[AVChromedLabel isRemoved](self, "isRemoved");
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVChromedLabel _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (int64_t)loadingIndicatorAlignment
{
  return self->_loadingIndicatorAlignment;
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIFont)font
{
  return self->_font;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (NSLayoutConstraint)loadingIndicatorLeftAlignmentConstraint
{
  return self->_loadingIndicatorLeftAlignmentConstraint;
}

- (void)setLoadingIndicatorLeftAlignmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorLeftAlignmentConstraint, a3);
}

- (NSLayoutConstraint)loadingIndicatorRightAlignmentConstraint
{
  return self->_loadingIndicatorRightAlignmentConstraint;
}

- (void)setLoadingIndicatorRightAlignmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorRightAlignmentConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicatorRightAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorLeftAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
