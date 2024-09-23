@implementation MRUActivityNowPlayingView

- (MRUActivityNowPlayingView)initWithFrame:(CGRect)a3
{
  MRUActivityNowPlayingView *v3;
  MRUActivityNowPlayingView *v4;
  void *v5;
  MRUFlippingArtworkView *v6;
  MRUFlippingArtworkView *v7;
  uint64_t v8;
  NSArray *artworkViews;
  MRUActivityAccessoryView *v10;
  MRUActivityAccessoryView *leadingView;
  MRUActivityAccessoryView *v12;
  MRUActivityAccessoryView *detachedMinimalView;
  MRUActivityTrailingAccessoryView *v14;
  MRUActivityTrailingAccessoryView *trailingView;
  MRUActivityNowPlayingHeaderView *v16;
  MRUActivityNowPlayingHeaderView *headerView;
  MRUNowPlayingTimeControlsView *v18;
  MRUNowPlayingTimeControlsView *timeControlsView;
  MRUNowPlayingTransportControlsView *v20;
  MRUNowPlayingTransportControlsView *transportControlsView;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MRUActivityNowPlayingView;
  v3 = -[MRUActivityNowPlayingView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUActivityNowPlayingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    v6 = objc_alloc_init(MRUFlippingArtworkView);
    -[MRUFlippingArtworkView setStyle:](v6, "setStyle:", 7);
    -[MRUFlippingArtworkView setDimsWhenPaused:](v6, "setDimsWhenPaused:", 1);
    v7 = objc_alloc_init(MRUFlippingArtworkView);
    -[MRUFlippingArtworkView setStyle:](v7, "setStyle:", 7);
    -[MRUFlippingArtworkView setDimsWhenPaused:](v7, "setDimsWhenPaused:", 1);
    v24[0] = v6;
    v24[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    artworkViews = v4->_artworkViews;
    v4->_artworkViews = (NSArray *)v8;

    v10 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v6, 26.0, 22.0);
    leadingView = v4->_leadingView;
    v4->_leadingView = v10;

    -[MRUActivityNowPlayingView addSubview:](v4, "addSubview:", v4->_leadingView);
    v12 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v7, 45.0, 22.0);
    detachedMinimalView = v4->_detachedMinimalView;
    v4->_detachedMinimalView = v12;

    v14 = -[MRUActivityTrailingAccessoryView initWithSize:]([MRUActivityTrailingAccessoryView alloc], "initWithSize:", 22.0, 22.0);
    trailingView = v4->_trailingView;
    v4->_trailingView = v14;

    -[MRUActivityNowPlayingView addSubview:](v4, "addSubview:", v4->_trailingView);
    v16 = objc_alloc_init(MRUActivityNowPlayingHeaderView);
    headerView = v4->_headerView;
    v4->_headerView = v16;

    -[MRUActivityNowPlayingView addSubview:](v4, "addSubview:", v4->_headerView);
    v18 = objc_alloc_init(MRUNowPlayingTimeControlsView);
    timeControlsView = v4->_timeControlsView;
    v4->_timeControlsView = v18;

    -[MRUActivityNowPlayingView addSubview:](v4, "addSubview:", v4->_timeControlsView);
    v20 = objc_alloc_init(MRUNowPlayingTransportControlsView);
    transportControlsView = v4->_transportControlsView;
    v4->_transportControlsView = v20;

    -[MRUNowPlayingTransportControlsView setLayout:](v4->_transportControlsView, "setLayout:", 0);
    -[MRUActivityNowPlayingView addSubview:](v4, "addSubview:", v4->_transportControlsView);
    -[MRUActivityNowPlayingView updateVisibilty](v4, "updateVisibilty");

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double MinX;
  double MinY;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  MRUNowPlayingTransportControlsView **p_transportControlsView;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  objc_super v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v115.receiver = self;
  v115.super_class = (Class)MRUActivityNowPlayingView;
  -[MRUActivityNowPlayingView layoutSubviews](&v115, sel_layoutSubviews);
  -[MRUActivityNowPlayingView updateVisibilty](self, "updateVisibilty");
  -[MRUActivityNowPlayingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  v4 = -[MRUActivityNowPlayingView SBUISA_layoutMode](self, "SBUISA_layoutMode");
  -[MRUActivityNowPlayingView bounds](self, "bounds");
  v9 = v5;
  v10 = v6;
  if (v4 == 4)
  {
    UIRectInset();
    x = v116.origin.x;
    y = v116.origin.y;
    width = v116.size.width;
    height = v116.size.height;
    CGRectGetMinX(v116);
    v117.origin.x = x;
    v117.origin.y = y;
    v117.size.width = width;
    v117.size.height = height;
    CGRectGetMinY(v117);
    UIRectRoundToScale();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    -[MRUActivityAccessoryView setContentInsets:](self->_leadingView, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v118.origin.x = x;
    v118.origin.y = y;
    v118.size.width = width;
    v118.size.height = height;
    CGRectGetMaxX(v118);
    SBUISystemApertureInterItemSpacing();
    v119.origin.x = x;
    v119.origin.y = y;
    v119.size.width = width;
    v119.size.height = height;
    CGRectGetMinY(v119);
    SBUISystemApertureInterItemSpacing();
    UIRectRoundToScale();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[MRUActivityAccessoryView setContentOffset:](self->_trailingView, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityTrailingAccessoryView setFrame:](self->_trailingView, "setFrame:");
    if (self->_showTrailingAccessoryWhenExpanded)
    {
      v120.origin.x = v24;
      v120.origin.y = v26;
      v120.size.width = v28;
      v120.size.height = v30;
      CGRectGetWidth(v120);
    }
    v132.origin.y = v18;
    v132.origin.x = v16;
    v132.size.height = v22;
    v132.size.width = v20;
    CGRectGetWidth(v132);
    UIRectInset();
    -[MRUActivityNowPlayingView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layoutFrame");
    CGRectGetHeight(v133);
    -[MRUActivityNowPlayingHeaderView labelInset](self->_headerView, "labelInset");

    UIRectInset();
    v76 = v75;
    v78 = v77;
    v80 = v79;
    v82 = v81;
    -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v79, v81);
    v134.origin.x = v76;
    v134.origin.y = v78;
    v134.size.width = v80;
    v134.size.height = v82;
    CGRectGetMinX(v134);
    v135.origin.x = v76;
    v135.origin.y = v78;
    v135.size.width = v80;
    v135.size.height = v82;
    CGRectGetMinY(v135);
    UIRectRoundToScale();
    v84 = v83;
    v86 = v85;
    v88 = v87;
    v90 = v89;
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    UIRectInset();
    v136.origin.x = v84;
    v136.origin.y = v86;
    v136.size.width = v88;
    v136.size.height = v90;
    CGRectGetHeight(v136);
    UIRectInset();
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v95, v97);
    v137.origin.x = v92;
    v137.origin.y = v94;
    v137.size.width = v96;
    v137.size.height = v98;
    CGRectGetMinX(v137);
    v138.origin.x = v92;
    v138.origin.y = v94;
    v138.size.width = v96;
    v138.size.height = v98;
    CGRectGetMinY(v138);
    UIRectRoundToScale();
    v100 = v99;
    v102 = v101;
    v104 = v103;
    v106 = v105;
    -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:");
    v139.origin.x = v100;
    v139.origin.y = v102;
    v139.size.width = v104;
    v139.size.height = v106;
    CGRectGetHeight(v139);
    UIRectInset();
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v114 = v113;
    p_transportControlsView = &self->_transportControlsView;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](*p_transportControlsView, "sizeThatFits:", v111, v113);
    v140.origin.x = v108;
    v140.origin.y = v110;
    v140.size.width = v112;
    v140.size.height = v114;
    CGRectGetMinX(v140);
    v141.origin.x = v108;
    v141.origin.y = v110;
    v141.size.width = v112;
    v141.size.height = v114;
    CGRectGetMinY(v141);
    UIRectRoundToScale();
  }
  else
  {
    v31 = v7;
    v32 = v8;
    CGRectGetMinX(*(CGRect *)&v5);
    v121.origin.x = v9;
    v121.origin.y = v10;
    v121.size.width = v31;
    v121.size.height = v32;
    CGRectGetMinY(v121);
    UIRectRoundToScale();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    -[MRUActivityAccessoryView setContentInsets:](self->_leadingView, "setContentInsets:", -0.5, -1.0, -0.5, 0.0);
    v122.origin.x = v34;
    v122.origin.y = v36;
    v122.size.width = v38;
    v122.size.height = v40;
    CGRectGetWidth(v122);
    UIRectInset();
    v41 = v123.origin.x;
    v42 = v123.origin.y;
    v43 = v123.size.width;
    v44 = v123.size.height;
    CGRectGetMaxX(v123);
    v124.origin.x = v41;
    v124.origin.y = v42;
    v124.size.width = v43;
    v124.size.height = v44;
    CGRectGetMinY(v124);
    -[MRUActivityAccessoryView setContentOffset:](self->_trailingView, "setContentOffset:", -1.0, 0.0);
    UIRectRoundToScale();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    -[MRUActivityNowPlayingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityTrailingAccessoryView setFrame:](self->_trailingView, "setFrame:");
    v125.origin.x = v46;
    v125.origin.y = v48;
    v125.size.width = v50;
    v125.size.height = v52;
    CGRectGetWidth(v125);
    UIRectInset();
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v57, v59);
    v62 = v61;
    v64 = v63;
    v126.origin.x = v54;
    v126.origin.y = v56;
    v126.size.width = v58;
    v126.size.height = v60;
    MinX = CGRectGetMinX(v126);
    v127.origin.x = v54;
    v127.origin.y = v56;
    v127.size.width = v58;
    v127.size.height = v60;
    MinY = CGRectGetMinY(v127);
    -[MRUActivityNowPlayingHeaderView labelInset](self->_headerView, "labelInset");
    -[MRUActivityNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:", MinX, MinY - v67, v62, v64);
    -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", v58, v60);
    v69 = v68;
    v71 = v70;
    v128.origin.x = v54;
    v128.origin.y = v56;
    v128.size.width = v58;
    v128.size.height = v60;
    v72 = CGRectGetMinX(v128);
    v129.origin.x = v54;
    v129.origin.y = v56;
    v129.size.width = v58;
    v129.size.height = v60;
    -[MRUNowPlayingTimeControlsView setFrame:](self->_timeControlsView, "setFrame:", v72, CGRectGetMinY(v129), v69, v71);
    p_transportControlsView = &self->_transportControlsView;
    -[MRUNowPlayingTransportControlsView sizeThatFits:](*p_transportControlsView, "sizeThatFits:", v58, v60);
    v130.origin.x = v54;
    v130.origin.y = v56;
    v130.size.width = v58;
    v130.size.height = v60;
    CGRectGetMinX(v130);
    v131.origin.x = v54;
    v131.origin.y = v56;
    v131.size.width = v58;
    v131.size.height = v60;
    CGRectGetMinY(v131);
    UIRectCenteredRect();
  }
  -[MRUNowPlayingTransportControlsView setFrame:](*p_transportControlsView, "setFrame:");
}

- (double)preferredHeightForBottomSafeArea
{
  double v3;
  double v4;
  void *v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGRect v13;

  -[MRUActivityNowPlayingHeaderView labelInset](self->_headerView, "labelInset");
  v4 = v3;
  -[MRUActivityNowPlayingView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutFrame");
  v6 = CGRectGetHeight(v13) - v4;

  -[MRUActivityNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v8 = v6 + v7 - v4;
  -[MRUNowPlayingTimeControlsView sizeThatFits:](self->_timeControlsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v10 = v8 + v9 + 4.0;
  -[MRUNowPlayingTransportControlsView sizeThatFits:](self->_transportControlsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v10 + v11;
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUActivityNowPlayingHeaderView setStylingProvider:](self->_headerView, "setStylingProvider:", v5);
    -[MRUNowPlayingTimeControlsView setStylingProvider:](self->_timeControlsView, "setStylingProvider:", v5);
    -[MRUNowPlayingTransportControlsView setStylingProvider:](self->_transportControlsView, "setStylingProvider:", v5);
    -[MRUActivityTrailingAccessoryView setStylingProvider:](self->_trailingView, "setStylingProvider:", v5);
  }

}

- (void)setShowTrailingAccessoryWhenExpanded:(BOOL)a3
{
  if (self->_showTrailingAccessoryWhenExpanded != a3)
  {
    self->_showTrailingAccessoryWhenExpanded = a3;
    -[MRUActivityNowPlayingView setNeedsLayout](self, "setNeedsLayout");
    -[MRUActivityNowPlayingView updateVisibilty](self, "updateVisibilty");
  }
}

- (void)updateVisibilty
{
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  MRUNowPlayingTimeControlsView *timeControlsView;
  MRUNowPlayingTransportControlsView *transportControlsView;
  double v11;
  void *v12;
  void *v13;
  double v14;
  MRUNowPlayingTimeControlsView *v15;
  MRUNowPlayingTransportControlsView *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  _OWORD v24[3];
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[MRUActivityNowPlayingView SBUISA_layoutMode](self, "SBUISA_layoutMode");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = self->_artworkViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setOnScreen:", v3 > 1);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  if (v3 == 4)
  {
    timeControlsView = self->_timeControlsView;
    v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v25[0] = *MEMORY[0x1E0C9BAA8];
    v18 = v25[0];
    v25[1] = v19;
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = v26;
    -[MRUNowPlayingTimeControlsView setTransform:](timeControlsView, "setTransform:", v25);
    transportControlsView = self->_transportControlsView;
    v24[0] = v18;
    v24[1] = v19;
    v24[2] = v17;
    -[MRUNowPlayingTransportControlsView setTransform:](transportControlsView, "setTransform:", v24);
    v11 = 1.0;
    -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 1.0);
    -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 1.0);
    if (!self->_showTrailingAccessoryWhenExpanded)
      v11 = 0.0;
    -[MRUActivityAccessoryView contentView](self->_trailingView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v11;
  }
  else
  {
    CGAffineTransformMakeScale(&v23, 0.5, 0.5);
    v15 = self->_timeControlsView;
    v22 = v23;
    -[MRUNowPlayingTimeControlsView setTransform:](v15, "setTransform:", &v22);
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    v16 = self->_transportControlsView;
    v20 = v21;
    -[MRUNowPlayingTransportControlsView setTransform:](v16, "setTransform:", &v20);
    -[MRUNowPlayingTimeControlsView setAlpha:](self->_timeControlsView, "setAlpha:", 0.0);
    -[MRUNowPlayingTransportControlsView setAlpha:](self->_transportControlsView, "setAlpha:", 0.0);
    -[MRUActivityAccessoryView contentView](self->_trailingView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1.0;
  }
  objc_msgSend(v12, "setAlpha:", v14);

}

- (MRUActivityAccessoryView)leadingView
{
  return self->_leadingView;
}

- (MRUActivityTrailingAccessoryView)trailingView
{
  return self->_trailingView;
}

- (MRUActivityAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (NSArray)artworkViews
{
  return self->_artworkViews;
}

- (MRUActivityNowPlayingHeaderView)headerView
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

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showTrailingAccessoryWhenExpanded
{
  return self->_showTrailingAccessoryWhenExpanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_transportControlsView, 0);
  objc_storeStrong((id *)&self->_timeControlsView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkViews, 0);
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end
