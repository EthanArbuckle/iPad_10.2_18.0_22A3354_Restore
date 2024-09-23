@implementation MRURoutingTableViewCell

- (MRURoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MRURoutingTableViewCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *outlineImageView;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *iconImageView;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *titleLabel;
  void *v20;
  MRURoutingSubtitleView *v21;
  MRURoutingSubtitleView *subtitleView;
  void *v23;
  MRURoutingAccessoryView *v24;
  MRURoutingAccessoryView *routingAccessoryView;
  void *v26;
  MRUSlider *v27;
  MRUSlider *volumeSlider;
  UIView *v29;
  UIView *separatorView;
  void *v31;
  void *v32;
  uint64_t v33;
  UITapGestureRecognizer *expandGestureRecognizer;
  void *v35;
  MRURoutingSubtitleController *v36;
  MRURoutingSubtitleController *subtitleStateController;
  void *v38;
  void *v39;
  void *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)MRURoutingTableViewCell;
  v4 = -[MRURoutingTableViewCell initWithStyle:reuseIdentifier:](&v42, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[MRURoutingTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURoutingTableViewCell selectedBackgroundView](v4, "selectedBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    outlineImageView = v4->_outlineImageView;
    v4->_outlineImageView = v9;

    +[MRUAssetsProvider collapsedRoutingChevron](MRUAssetsProvider, "collapsedRoutingChevron");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_outlineImageView, "setImage:", v11);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 1, 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_outlineImageView, "setPreferredSymbolConfiguration:", v12);

    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_outlineImageView);

    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v14;

    -[UIImageView setContentMode:](v4->_iconImageView, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_iconImageView, "setPreferredSymbolConfiguration:", v16);

    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_iconImageView);

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v18;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:](v4->_titleLabel, "_setWantsUnderlineForAccessibilityButtonShapesEnabled:", 1);
    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v4->_titleLabel);

    v21 = objc_alloc_init(MRURoutingSubtitleView);
    subtitleView = v4->_subtitleView;
    v4->_subtitleView = v21;

    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v4->_subtitleView);

    v24 = objc_alloc_init(MRURoutingAccessoryView);
    routingAccessoryView = v4->_routingAccessoryView;
    v4->_routingAccessoryView = v24;

    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v4->_routingAccessoryView);

    v27 = objc_alloc_init(MRUSlider);
    volumeSlider = v4->_volumeSlider;
    v4->_volumeSlider = v27;

    -[MRUSlider setHitRectInset:](v4->_volumeSlider, "setHitRectInset:", -10.0, 0.0, -10.0, 10.0);
    -[MRUSlider setExpansionFactor:](v4->_volumeSlider, "setExpansionFactor:", 1.75);
    -[MRUSlider addTarget:action:forControlEvents:](v4->_volumeSlider, "addTarget:action:forControlEvents:", v4, sel_sliderValueChanged_, 4096);
    -[MRURoutingTableViewCell addSubview:](v4, "addSubview:", v4->_volumeSlider);
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v29;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v31);

    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v4->_separatorView);

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_didTapToExpand);
    expandGestureRecognizer = v4->_expandGestureRecognizer;
    v4->_expandGestureRecognizer = (UITapGestureRecognizer *)v33;

    -[UITapGestureRecognizer setDelegate:](v4->_expandGestureRecognizer, "setDelegate:", v4);
    -[UITapGestureRecognizer setEnabled:](v4->_expandGestureRecognizer, "setEnabled:", 0);
    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addGestureRecognizer:", v4->_expandGestureRecognizer);

    v36 = objc_alloc_init(MRURoutingSubtitleController);
    subtitleStateController = v4->_subtitleStateController;
    v4->_subtitleStateController = v36;

    -[MRURoutingSubtitleController setDelegate:](v4->_subtitleStateController, "setDelegate:", v4);
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
    -[MRURoutingTableViewCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addInteraction:", v38);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v4, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRURoutingTableViewCell updateContentSizeCategory](v4, "updateContentSizeCategory");
    -[MRURoutingTableViewCell updateVisibility](v4, "updateVisibility");

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double top;
  double left;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  id WeakRetained;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat MinY;
  double Width;
  CGFloat x;
  CGFloat y;
  CGFloat v68;
  CGFloat height;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  uint64_t v74;
  double v75;
  objc_super v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v76.receiver = self;
  v76.super_class = (Class)MRURoutingTableViewCell;
  -[MRURoutingTableViewCell layoutSubviews](&v76, sel_layoutSubviews);
  -[MRURoutingTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[MRURoutingTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  v17 = v8 + left;
  v18 = v10 + top;
  v19 = v12 - (left + self->_contentEdgeInsets.right);
  v20 = v14 - (top + self->_contentEdgeInsets.bottom);
  v21 = 28.0 * (double)-[MRURoutingTableViewCell indentationLevel](self, "indentationLevel");
  v74 = v5;
  v77.origin.x = v17;
  v77.origin.y = v18;
  v77.size.width = v19;
  v77.size.height = v20;
  CGRectGetMinX(v77);
  v75 = v21;
  v78.origin.x = v17;
  v78.origin.y = v18;
  v78.size.width = v19;
  v78.size.height = v20;
  CGRectGetMaxY(v78);
  v79.origin.x = v17;
  v79.origin.y = v18;
  v79.size.width = v19;
  v79.size.height = v20;
  CGRectGetWidth(v79);
  UIRectInset();
  -[MRURoutingTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_separatorView, "setFrame:");
  -[UIImageView sizeThatFits:](self->_outlineImageView, "sizeThatFits:", v19, v20);
  v80.origin.x = v17;
  v80.origin.y = v18;
  v80.size.width = v19;
  v80.size.height = v20;
  CGRectGetMinX(v80);
  UIRectCenteredYInRect();
  -[MRURoutingTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_outlineImageView, "setFrame:");
  if (-[UIImage isSymbolImage](self->_iconImage, "isSymbolImage"))
    -[UIImageView sizeThatFits:](self->_iconImageView, "sizeThatFits:", v19, v20);
  v81.origin.x = v17;
  v81.origin.y = v18;
  v81.size.width = v19;
  v81.size.height = v20;
  CGRectGetMinX(v81);
  UIRectCenteredYInRect();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  UIRectCenteredIntegralRectScale();
  -[MRURoutingTableViewCell bounds](self, "bounds", v74);
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v82.origin.x = v23;
  v82.origin.y = v25;
  v82.size.width = v27;
  v82.size.height = v29;
  CGRectGetWidth(v82);
  UIRectInset();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[MRURoutingAccessoryView sizeThatFits:](self->_routingAccessoryView, "sizeThatFits:", v34, v36);
  v83.origin.x = v31;
  v83.origin.y = v33;
  v83.size.width = v35;
  v83.size.height = v37;
  CGRectGetMaxX(v83);
  UIRectCenteredYInRect();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[MRURoutingTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRURoutingAccessoryView setFrame:](self->_routingAccessoryView, "setFrame:");
  if (-[MRURoutingAccessoryView state](self->_routingAccessoryView, "state") || v75 > 0.0)
  {
    v84.origin.x = v39;
    v84.origin.y = v41;
    v84.size.width = v43;
    v84.size.height = v45;
    CGRectGetWidth(v84);
    UIRectInset();
    v31 = v46;
    v33 = v47;
    v35 = v48;
    v37 = v49;
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v35, v37);
  v50 = MRUSizeCeilToViewScale(self);
  v52 = v51;
  -[MRURoutingSubtitleView sizeThatFits:](self->_subtitleView, "sizeThatFits:", v35, v37);
  v85.origin.x = v31;
  v85.origin.y = v33;
  v85.size.width = v35;
  v85.size.height = v37;
  v53 = v52;
  CGRectGetHeight(v85);
  if (!-[MRURoutingSubtitleController hasText](self->_subtitleStateController, "hasText"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
    objc_msgSend(WeakRetained, "isVolumeControlAvailable");

  }
  UIRectInset();
  v56 = v55;
  v58 = v57;
  v60 = v59;
  UIFloorToScale();
  v62 = v61;
  v86.origin.x = v56;
  v86.origin.y = v62;
  v86.size.width = v58;
  v86.size.height = v60;
  v63 = v75 + CGRectGetMinX(v86);
  v87.origin.x = v56;
  v87.origin.y = v62;
  v87.size.width = v58;
  v87.size.height = v60;
  MinY = CGRectGetMinY(v87);
  v88.origin.x = v56;
  v88.origin.y = v62;
  v88.size.width = v58;
  v88.size.height = v60;
  Width = CGRectGetWidth(v88);
  if (v50 >= Width)
    v50 = Width;
  -[MRURoutingTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v89.origin.x = v63;
  v89.origin.y = MinY;
  v89.size.width = v50;
  v89.size.height = v53;
  CGRectGetHeight(v89);
  UIRectInset();
  x = v90.origin.x;
  y = v90.origin.y;
  v68 = v90.size.width;
  height = v90.size.height;
  CGRectGetMinX(v90);
  v91.origin.x = x;
  v91.origin.y = y;
  v91.size.width = v68;
  v91.size.height = height;
  CGRectGetMinY(v91);
  -[MRURoutingTableViewCell bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRURoutingSubtitleView setFrame:](self->_subtitleView, "setFrame:");
  UIRectInset();
  v70 = v92.origin.x;
  v71 = v92.origin.y;
  v72 = v92.size.width;
  v73 = v92.size.height;
  CGRectGetMinX(v92);
  v93.origin.x = v70;
  v93.origin.y = v71;
  v93.size.width = v72;
  v93.size.height = v73;
  CGRectGetWidth(v93);
  UIRectCenteredYInRectScale();
  -[MRURoutingTableViewCell bounds](self, "bounds", v74);
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUSlider setFrame:](self->_volumeSlider, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  MRUSizeCeilToViewScale(self);
  v7 = v6 + 0.0;
  v8 = height - v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
  v10 = objc_msgSend(WeakRetained, "isVolumeControlAvailable");

  if (v10)
  {
    -[MRUSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", width, v8);
    v7 = v7 + v11;
  }
  else if (-[MRURoutingSubtitleController hasText](self->_subtitleStateController, "hasText"))
  {
    -[MRURoutingSubtitleView sizeThatFits:](self->_subtitleView, "sizeThatFits:", width, v8);
    v7 = v7 + v12 + 4.0;
  }
  v13 = 28.0;
  if (v7 >= 28.0)
    v13 = v7;
  v14 = v13 + 11.0 * 2.0;
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRURoutingTableViewCell;
  -[MRURoutingTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[MRURoutingSubtitleView prepareForReuse](self->_subtitleView, "prepareForReuse");
  -[MRURoutingSubtitleController prepareForReuse](self->_subtitleStateController, "prepareForReuse");
  -[MRURoutingSubtitleView layer](self->_subtitleView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[MRURoutingAccessoryView setState:](self->_routingAccessoryView, "setState:", 0);
  objc_storeWeak((id *)&self->_volumeController, 0);
  -[MRURoutingTableViewCell setIndentationLevel:](self, "setIndentationLevel:", 0);
  self->_showChevron = 0;
  self->_showChevronExpanded = 0;
  -[MRURoutingTableViewCell updateVisibility](self, "updateVisibility");
}

- (void)setIconImage:(id)a3
{
  id v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_iconImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v5);
  if (objc_msgSend(v5, "isSymbolImage"))
    v6 = 4;
  else
    v6 = 1;
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", v6);

  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  -[MRURoutingSubtitleView setText:](self->_subtitleView, "setText:", a3);
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIcon:(id)a3
{
  -[MRURoutingSubtitleView setIcon:](self->_subtitleView, "setIcon:", a3);
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitleAccessory:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    -[MRURoutingSubtitleView setState:](self->_subtitleView, "setState:");
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRURoutingTableViewCell updateVisualStyling](self, "updateVisualStyling");
    -[MRURoutingSubtitleView setStylingProvider:](self->_subtitleView, "setStylingProvider:", v7);
    -[MRURoutingAccessoryView setStylingProvider:](self->_routingAccessoryView, "setStylingProvider:", v7);
    -[MRUSlider setStylingProvider:](self->_volumeSlider, "setStylingProvider:", v7);
  }

}

- (void)setShowChevron:(BOOL)a3
{
  if (self->_showChevron != a3)
  {
    self->_showChevron = a3;
    -[UITapGestureRecognizer setEnabled:](self->_expandGestureRecognizer, "setEnabled:");
    -[MRURoutingTableViewCell updateVisibility](self, "updateVisibility");
  }
}

- (void)setShowChevronExpanded:(BOOL)a3
{
  void *v4;

  if (self->_showChevronExpanded != a3)
  {
    self->_showChevronExpanded = a3;
    if (a3)
      +[MRUAssetsProvider expandedRoutingChevron](MRUAssetsProvider, "expandedRoutingChevron");
    else
      +[MRUAssetsProvider collapsedRoutingChevron](MRUAssetsProvider, "collapsedRoutingChevron");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_outlineImageView, "setImage:", v4);

    -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVolumeController:(id)a3
{
  MRUVolumeController **p_volumeController;
  id WeakRetained;
  MRURoutingTableViewCell *v6;
  id v7;
  id v8;
  id obj;

  p_volumeController = &self->_volumeController;
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_volumeController);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (MRURoutingTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = objc_loadWeakRetained((id *)p_volumeController);
    objc_msgSend(v7, "setDelegate:", 0);

  }
  v8 = objc_storeWeak((id *)p_volumeController, obj);
  objc_msgSend(obj, "setDelegate:", self);

  objc_msgSend(obj, "volumeValue");
  -[MRUSlider setValue:](self->_volumeSlider, "setValue:");
  -[MRURoutingTableViewCell updateVisibility](self, "updateVisibility");
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets.top = 0.0;
  self->_contentEdgeInsets.left = a3.left;
  self->_contentEdgeInsets.bottom = 0.0;
  self->_contentEdgeInsets.right = a3.right;
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout", a3.top);
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRURoutingTableViewCell;
  -[MRURoutingTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v5, sel__setShouldHaveFullLengthBottomSeparator_);
  -[UIView setHidden:](self->_separatorView, "setHidden:", v3);
}

- (void)didTapToExpand
{
  id v3;

  self->_showChevronExpanded ^= 1u;
  -[MRURoutingTableViewCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routingCellDidTapToExpand:", self);

}

- (void)sliderValueChanged:(id)a3
{
  MRUVolumeController **p_volumeController;
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  id WeakRetained;

  p_volumeController = &self->_volumeController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_volumeController);
  objc_msgSend(v4, "value");
  v6 = v5;

  LODWORD(v7) = 1036831949;
  LODWORD(v8) = v6;
  objc_msgSend(WeakRetained, "setVolume:withNotificationDelay:", v8, v7);

}

- (void)transitionToNextVisibleStateWithDuration:(double)a3
{
  id WeakRetained;
  _QWORD v6[6];
  _QWORD v7[5];

  if (-[MRURoutingSubtitleController canTransitionToNextState](self->_subtitleStateController, "canTransitionToNextState"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);

    if (!WeakRetained)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke;
      v7[3] = &unk_1E5818C88;
      v7[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_2;
      v6[3] = &unk_1E581C0F8;
      v6[4] = self;
      *(double *)&v6[5] = a3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, a3);
    }
  }
}

void __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "subtitleView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "transitionToNextAvailableState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIcon:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setSubtitleAccessory:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "accessory"));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v4 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_3;
  v6[3] = &unk_1E5818C88;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, v4);
}

void __68__MRURoutingTableViewCell_transitionToNextVisibleStateWithDuration___block_invoke_3(uint64_t a1)
{
  double v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1088));
  if (objc_msgSend(WeakRetained, "isVolumeControlAvailable"))
    v2 = 0.0;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "subtitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)routingSubtitleStateController:(id)a3 didUpdateText:(id)a4 icon:(id)a5 accessory:(int64_t)a6
{
  id v9;

  v9 = a5;
  -[MRURoutingTableViewCell setSubtitle:](self, "setSubtitle:", a4);
  -[MRURoutingTableViewCell setIcon:](self, "setIcon:", v9);

  -[MRURoutingTableViewCell setSubtitleAccessory:](self, "setSubtitleAccessory:", a6);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  double v6;

  if ((-[MRUSlider isTracking](self->_volumeSlider, "isTracking", a3) & 1) == 0)
  {
    *(float *)&v6 = a4;
    -[MRUSlider setValue:animated:](self->_volumeSlider, "setValue:animated:", 1, v6);
  }
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  -[MRURoutingTableViewCell updateVisibility](self, "updateVisibility", a3, a4);
  -[MRURoutingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)volumeControllerWillBeginEqualization:(id)a3
{
  -[MRUSlider setEqualizing:](self->_volumeSlider, "setEqualizing:", 1);
}

- (void)volumeControllerDidFinishEqualization:(id)a3
{
  -[MRUSlider setEqualizing:](self->_volumeSlider, "setEqualizing:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPoint v12;
  CGRect v13;

  v5 = a4;
  -[MRURoutingTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[MRURoutingTableViewCell expandRect](self, "expandRect");
  v12.x = v8;
  v12.y = v10;
  return CGRectContainsPoint(v13, v12);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  id v22;
  void *v23;
  CGPoint v25;
  CGRect v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_showChevron)
    goto LABEL_4;
  -[MRURoutingTableViewCell expandRect](self, "expandRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v9, "location");
  v25.x = v19;
  v25.y = v20;
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  if (CGRectContainsPoint(v26, v25))
  {
    v21 = (void *)MEMORY[0x1E0DC3B28];
    -[MRURoutingTableViewCell expandRect](self, "expandRect");
    objc_msgSend(v21, "regionWithRect:identifier:", CFSTR("outline"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v22 = v10;
  }
  v23 = v22;

  return v23;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("outline"));

  v7 = objc_alloc(MEMORY[0x1E0DC3D90]);
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(v7, "initWithView:", self->_outlineImageView);
    objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3B30];
    -[UIImageView frame](self->_outlineImageView, "frame");
    v17 = CGRectInset(v16, -3.0, -3.0);
    objc_msgSend(v11, "shapeWithRoundedRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRURoutingTableViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "initWithView:", v14);

    objc_msgSend(MEMORY[0x1E0DC3B10], "effectWithPreview:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrefersScaledContent:", 0);
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, self->_outlineImageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_iconImageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingTitleFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (void)updateVisibility
{
  id WeakRetained;
  double v4;
  double v5;
  id v6;

  -[UIImageView setHidden:](self->_outlineImageView, "setHidden:", !self->_showChevron);
  WeakRetained = objc_loadWeakRetained((id *)&self->_volumeController);
  if (objc_msgSend(WeakRetained, "isVolumeControlAvailable"))
    v4 = 1.0;
  else
    v4 = 0.0;
  -[MRUSlider setAlpha:](self->_volumeSlider, "setAlpha:", v4);

  v6 = objc_loadWeakRetained((id *)&self->_volumeController);
  if (objc_msgSend(v6, "isVolumeControlAvailable"))
    v5 = 0.0;
  else
    v5 = 1.0;
  -[MRURoutingSubtitleView setAlpha:](self->_subtitleView, "setAlpha:", v5);

}

- (CGRect)expandRect
{
  CGFloat MinX;
  void *v4;
  CGFloat MinY;
  void *v6;
  uint64_t v7;
  CGFloat MaxX;
  void *v12;
  CGFloat Height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MRURoutingTableViewCell semanticContentAttribute](self, "semanticContentAttribute")) == 1)
  {
    -[UIImageView frame](self->_iconImageView, "frame");
    MinX = CGRectGetMinX(v18);
    -[MRURoutingTableViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    MinY = CGRectGetMinY(v19);
    -[MRURoutingTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
  }
  else
  {
    -[MRURoutingTableViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    MinX = CGRectGetMinX(v20);
    -[MRURoutingTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    MinY = CGRectGetMinY(v21);
    -[UIImageView frame](self->_iconImageView, "frame");
  }
  MaxX = CGRectGetMaxX(*(CGRect *)&v7);
  -[MRURoutingTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Height = CGRectGetHeight(v22);

  v14 = MinX;
  v15 = MinY;
  v16 = MaxX;
  v17 = Height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)isVendorSpecific
{
  return self->_isVendorSpecific;
}

- (void)setIsVendorSpecific:(BOOL)a3
{
  self->_isVendorSpecific = a3;
}

- (MRURoutingTableViewCellDelegate)delegate
{
  return (MRURoutingTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)protocolIcon
{
  return self->_protocolIcon;
}

- (void)setProtocolIcon:(id)a3
{
  objc_storeStrong((id *)&self->_protocolIcon, a3);
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (MRURoutingSubtitleController)subtitleStateController
{
  return self->_subtitleStateController;
}

- (MRURoutingAccessoryView)routingAccessoryView
{
  return self->_routingAccessoryView;
}

- (MRUVolumeController)volumeController
{
  return (MRUVolumeController *)objc_loadWeakRetained((id *)&self->_volumeController);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)showChevronExpanded
{
  return self->_showChevronExpanded;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIImageView)outlineImageView
{
  return self->_outlineImageView;
}

- (void)setOutlineImageView:(id)a3
{
  objc_storeStrong((id *)&self->_outlineImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MRURoutingSubtitleView)subtitleView
{
  return self->_subtitleView;
}

- (void)setSubtitleView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleView, a3);
}

- (MRUSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSlider, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UITapGestureRecognizer)expandGestureRecognizer
{
  return self->_expandGestureRecognizer;
}

- (void)setExpandGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_expandGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_outlineImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_volumeController);
  objc_storeStrong((id *)&self->_routingAccessoryView, 0);
  objc_storeStrong((id *)&self->_subtitleStateController, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_protocolIcon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
