@implementation MRULockscreenView

- (MRULockscreenView)initWithFrame:(CGRect)a3
{
  MRULockscreenView *v3;
  MRULockscreenView *v4;
  void *v5;
  MRUNowPlayingHeaderView *v6;
  MRUNowPlayingHeaderView *headerView;
  void *v8;
  MRUNowPlayingTimeControlsView *v9;
  MRUNowPlayingTimeControlsView *timeControlsView;
  MRUNowPlayingTransportControlsView *v11;
  MRUNowPlayingTransportControlsView *transportControlsView;
  MRUNowPlayingVolumeControlsView *v13;
  MRUNowPlayingVolumeControlsView *volumeControlsView;
  MRUArtworkView *v15;
  MRUArtworkView *artworkView;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRULockscreenView;
  v3 = -[MRULockscreenView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRULockscreenView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    -[MRUNowPlayingHeaderView setLayout:](v4->_headerView, "setLayout:", 0);
    -[MRUNowPlayingHeaderView labelView](v4->_headerView, "labelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayout:", 2);

    -[MRULockscreenView addSubview:](v4, "addSubview:", v4->_headerView);
    v9 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v9;

    -[MRUNowPlayingTimeControlsView setLayout:](v4->_timeControlsView, "setLayout:", 1);
    -[MRULockscreenView addSubview:](v4, "addSubview:", v4->_timeControlsView);
    v11 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v11;

    -[MRUNowPlayingTransportControlsView setLayout:](v4->_transportControlsView, "setLayout:", 2);
    -[MRULockscreenView addSubview:](v4, "addSubview:", v4->_transportControlsView);
    v13 = objc_alloc_init(MRUNowPlayingVolumeControlsView);
    volumeControlsView = v4->_volumeControlsView;
    v4->_volumeControlsView = v13;

    -[MRUNowPlayingVolumeControlsView setLayout:](v4->_volumeControlsView, "setLayout:", 1);
    -[MRULockscreenView addSubview:](v4, "addSubview:", v4->_volumeControlsView);
    v15 = objc_alloc_init(MRUArtworkView);
    artworkView = v4->_artworkView;
    v4->_artworkView = v15;

    -[MRUArtworkView setStyle:](v4->_artworkView, "setStyle:", 1);
    -[MRUArtworkView pointerInteraction](v4->_artworkView, "pointerInteraction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabled:", 1);

    -[MRULockscreenView addSubview:](v4, "addSubview:", v4->_artworkView);
    v4->_showArtworkView = 1;
    v4->_showVolumeControlsView = 1;
    -[MRULockscreenView updateTextAlignment](v4, "updateTextAlignment");
    -[MRULockscreenView updateVisibility](v4, "updateVisibility");
  }
  return v4;
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
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double top;
  double left;
  double v34;
  double v35;
  double v36;
  double v37;
  double MinX;
  CGFloat MaxY;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  objc_super v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  void *v89;
  uint64_t v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v90 = *MEMORY[0x1E0C80C00];
  v85.receiver = self;
  v85.super_class = (Class)MRULockscreenView;
  -[MRULockscreenView layoutSubviews](&v85, sel_layoutSubviews);
  -[MRULockscreenView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  MCLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    v91.origin.x = v4;
    v91.origin.y = v6;
    v91.size.width = v8;
    v91.size.height = v10;
    NSStringFromCGRect(v91);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v87 = v12;
    v88 = 2114;
    v89 = v13;
    _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ frame: %{public}@", buf, 0x16u);

  }
  -[MRULockscreenView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v84 = v15;

  -[MRULockscreenView suggestionsFrame](self, "suggestionsFrame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIView setFrame:](self->_suggestionsView, "setFrame:");
  if (self->_showSuggestionsView)
  {
    v92.origin.x = v17;
    v92.origin.y = v19;
    v92.size.width = v21;
    v92.size.height = v23;
    CGRectGetHeight(v92);
    UIRectInset();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
  }
  else
  {
    top = self->_contentEdgeInsets.top;
    left = self->_contentEdgeInsets.left;
    v25 = v4 + left;
    v27 = v6 + top;
    v29 = v8 - (left + self->_contentEdgeInsets.right);
    v31 = v10 - (top + self->_contentEdgeInsets.bottom);
  }
  -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v29, v31);
  v35 = v34;
  v37 = v36;
  v93.origin.x = v25;
  v93.origin.y = v27;
  v93.size.width = v29;
  v93.size.height = v31;
  MinX = CGRectGetMinX(v93);
  v94.origin.x = v25;
  v94.origin.y = v27;
  v94.size.width = v29;
  v94.size.height = v31;
  MaxY = CGRectGetMaxY(v94);
  v40 = MaxY - v37;
  -[MRUNowPlayingVolumeControlsView setFrame:](self->_volumeControlsView, "setFrame:", MinX, MaxY - v37, v35, v37);
  if (self->_showVolumeControlsView)
  {
    v95.origin.x = MinX;
    v95.origin.y = v40;
    v95.size.width = v35;
    v95.size.height = v37;
    CGRectGetHeight(v95);
    UIRectInset();
    v25 = v41;
    v27 = v42;
    v29 = v43;
    v31 = v44;
  }
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v29, v31);
  v46 = v45;
  v48 = v47;
  v96.origin.x = v25;
  v96.origin.y = v27;
  v96.size.width = v29;
  v96.size.height = v31;
  v49 = CGRectGetMinX(v96);
  v97.origin.x = v25;
  v97.origin.y = v27;
  v97.size.width = v29;
  v97.size.height = v31;
  v50 = CGRectGetMaxY(v97);
  v51 = v50 - v48;
  -[MRUNowPlayingTransportControlsView setFrame:](self->_transportControlsView, "setFrame:", v49, v50 - v48, v46, v48);
  v98.origin.x = v49;
  v98.origin.y = v51;
  v98.size.width = v46;
  v98.size.height = v48;
  CGRectGetHeight(v98);
  UIRectInset();
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v56, v58);
  v99.origin.x = v53;
  v99.origin.y = v55;
  v99.size.width = v57;
  v99.size.height = v59;
  CGRectGetMinX(v99);
  v100.origin.x = v53;
  v100.origin.y = v55;
  v100.size.width = v57;
  v100.size.height = v59;
  CGRectGetMaxY(v100);
  UIRectInset();
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;
  -[MRULockscreenView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
  v101.origin.x = v61;
  v101.origin.y = v63;
  v101.size.width = v65;
  v101.size.height = v67;
  CGRectGetHeight(v101);
  UIRectInset();
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  if (!self->_showSuggestionsView && self->_showArtworkView)
  {
    UIRectInset();
    v69 = v76;
    v71 = v77;
    v73 = v78;
    v75 = v79;
  }
  v102.origin.x = v69;
  v102.origin.y = v71;
  v102.size.width = v73;
  v102.size.height = v75;
  CGRectGetMinX(v102);
  v103.origin.x = v69;
  v103.origin.y = v71;
  v103.size.width = v73;
  v103.size.height = v75;
  CGRectGetMinY(v103);
  -[MRULockscreenView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
  if (!self->_showSuggestionsView && self->_showArtworkView)
  {
    UIRectInset();
    v69 = v80;
    v71 = v81;
    v73 = v82;
    v75 = v83;
  }
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v73, v75);
  v104.origin.x = v69;
  v104.origin.y = v71;
  v104.size.width = v73;
  v104.size.height = v75;
  CGRectGetMinX(v104);
  v105.origin.x = v69;
  v105.origin.y = v71;
  v105.size.width = v73;
  v105.size.height = v75;
  CGRectGetMinY(v105);
  UIRectCenteredYInRectScale();
  -[MRULockscreenView bounds](self, "bounds", v84);
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double bottom;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  width = a3.width;
  bottom = self->_contentEdgeInsets.bottom;
  v6 = self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  if (self->_showSuggestionsView)
  {
    v7 = a3.height - bottom;
    -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", a3.width);
    v9 = v7 - v8;
    v10 = bottom + v8;
  }
  else
  {
    v10 = bottom + self->_contentEdgeInsets.top;
    v9 = a3.height - v10;
  }
  v11 = width - v6;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v11, v9);
  if (self->_showArtworkView && !self->_showSuggestionsView)
  {
    v13 = 57.0;
    if (v12 > 57.0)
      v13 = v12;
    v12 = v13 + 7.0;
  }
  v14 = v10 + v12;
  v15 = v9 - v12;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v11, v15);
  v17 = v15 - v16;
  v18 = v14 + v16;
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", v11, v17);
  v20 = v18 + v19 + 7.0;
  if (self->_showVolumeControlsView)
  {
    -[MRUNowPlayingVolumeControlsView sizeThatFits:](self->_volumeControlsView, "sizeThatFits:", v11, v17 - (v19 + 7.0));
    v20 = v20 + v21 + 7.0;
  }
  v22 = width;
  v23 = v20;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUArtworkView setStylingProvider:](self->_artworkView, "setStylingProvider:", v5);
    -[MRUNowPlayingHeaderView setStylingProvider:](self->_headerView, "setStylingProvider:", v5);
    -[MRUNowPlayingTimeControlsView setStylingProvider:](self->_timeControlsView, "setStylingProvider:", v5);
    -[MRUNowPlayingTransportControlsView setStylingProvider:](self->_transportControlsView, "setStylingProvider:", v5);
    -[MRUNowPlayingVolumeControlsView setStylingProvider:](self->_volumeControlsView, "setStylingProvider:", v5);
  }

}

- (void)setSuggestionsView:(id)a3
{
  UIView *v5;
  UIView *suggestionsView;
  void *v7;
  UIView *v8;
  _QWORD v9[4];
  UIView *v10;
  MRULockscreenView *v11;

  v5 = (UIView *)a3;
  suggestionsView = self->_suggestionsView;
  v8 = v5;
  if (suggestionsView != v5)
  {
    -[UIView removeFromSuperview](suggestionsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_suggestionsView, a3);
    -[MRULockscreenView addSubview:](self, "addSubview:", v8);
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__MRULockscreenView_setSuggestionsView___block_invoke;
    v9[3] = &unk_1E5818CB0;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "performWithoutAnimation:", v9);
    -[MRULockscreenView updateVisibility](self, "updateVisibility");
    -[MRULockscreenView setNeedsLayout](self, "setNeedsLayout");

  }
}

uint64_t __40__MRULockscreenView_setSuggestionsView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "suggestionsFrame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRULockscreenView updateOnScreen](self, "updateOnScreen");
  }
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_dimmed != a3)
  {
    v3 = a3;
    self->_dimmed = a3;
    -[MRUNowPlayingTimeControlsView setDimmed:](self->_timeControlsView, "setDimmed:");
    -[MRUNowPlayingTransportControlsView setDimmed:](self->_transportControlsView, "setDimmed:", v3);
    -[MRUNowPlayingVolumeControlsView setDimmed:](self->_volumeControlsView, "setDimmed:", v3);
    -[MRULockscreenView updateOnScreen](self, "updateOnScreen");
  }
}

- (void)setShowArtworkView:(BOOL)a3
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    -[MRULockscreenView updateTextAlignment](self, "updateTextAlignment");
    -[MRULockscreenView updateVisibility](self, "updateVisibility");
    -[MRULockscreenView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowVolumeControlsView:(BOOL)a3
{
  if (self->_showVolumeControlsView != a3)
  {
    self->_showVolumeControlsView = a3;
    -[MRULockscreenView updateVisibility](self, "updateVisibility");
    -[MRULockscreenView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSuggestionsView:(BOOL)a3
{
  if (self->_showSuggestionsView != a3)
  {
    self->_showSuggestionsView = a3;
    -[MRULockscreenView updateTextAlignment](self, "updateTextAlignment");
    -[MRULockscreenView updateVisibility](self, "updateVisibility");
    -[MRULockscreenView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRULockscreenView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateTextAlignment
{
  uint64_t v2;

  if (self->_showSuggestionsView)
  {
    v2 = 1;
  }
  else if (self->_showArtworkView)
  {
    v2 = 4;
  }
  else
  {
    v2 = 1;
  }
  -[MRUNowPlayingHeaderView setTextAlignment:](self->_headerView, "setTextAlignment:", v2);
}

- (void)updateOnScreen
{
  _BOOL8 v3;
  void *v4;

  v3 = self->_onScreen && !self->_dimmed;
  -[MRUNowPlayingHeaderView labelView](self->_headerView, "labelView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarqueeEnabled:", v3);

  -[MRUNowPlayingTimeControlsView setOnScreen:](self->_timeControlsView, "setOnScreen:", self->_onScreen);
}

- (void)updateVisibility
{
  double v3;
  __int128 v4;
  MRUArtworkView *artworkView;
  double v6;
  double v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v3 = 0.0;
  if (!self->_showSuggestionsView)
  {
    v3 = 1.0;
    if (!self->_showArtworkView)
      v3 = 0.0;
  }
  -[MRUArtworkView setAlpha:](self->_artworkView, "setAlpha:", v3);
  if (self->_showArtworkView)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v9.c = v4;
    *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.01, 0.01);
  }
  artworkView = self->_artworkView;
  v8 = v9;
  -[MRUArtworkView setTransform:](artworkView, "setTransform:", &v8);
  if (self->_showVolumeControlsView)
    v6 = 1.0;
  else
    v6 = 0.0;
  -[MRUNowPlayingVolumeControlsView setAlpha:](self->_volumeControlsView, "setAlpha:", v6);
  if (self->_showSuggestionsView)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[UIView setAlpha:](self->_suggestionsView, "setAlpha:", v7);
}

- (CGRect)suggestionsFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat MinX;
  double MinY;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[MRULockscreenView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView sizeThatFits:](self->_suggestionsView, "sizeThatFits:", v7, v9);
  v12 = v11;
  v14 = v13;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  MinY = CGRectGetMinY(v21);
  v17 = MinX;
  v18 = v12;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = MinY;
  result.origin.x = v17;
  return result;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUNowPlayingTimeControlsView)timeControlsView
{
  return self->_timeControlsView;
}

- (MRUNowPlayingTransportControlsView)transportControlsView
{
  return self->_transportControlsView;
}

- (MRUNowPlayingVolumeControlsView)volumeControlsView
{
  return self->_volumeControlsView;
}

- (UIView)suggestionsView
{
  return self->_suggestionsView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (BOOL)showVolumeControlsView
{
  return self->_showVolumeControlsView;
}

- (BOOL)showSuggestionsView
{
  return self->_showSuggestionsView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_volumeControlsView, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
