@implementation MRUVolumeBackgroundView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUVolumeBackgroundView;
  -[MRUVolumeBackgroundView layoutSubviews](&v3, sel_layoutSubviews);
  if (MRULayoutShouldBeVertical())
    -[MRUVolumeBackgroundView layoutSubviewsVertical](self, "layoutSubviewsVertical");
  else
    -[MRUVolumeBackgroundView layoutSubviewsHorizontal](self, "layoutSubviewsHorizontal");
}

- (MediaControlsExpandableButton)spatialAudioModeButton
{
  return self->_spatialAudioModeButton;
}

- (void)layoutSubviewsVertical
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL4 showSpatialAudioModeButton;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat rect;
  uint64_t v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  -[MediaControlsExpandableButton setAxis:](self->_primaryListeningModeButton, "setAxis:", 0);
  -[MediaControlsExpandableButton setAxis:](self->_secondaryListeningModeButton, "setAxis:", 0);
  -[MediaControlsExpandableButton setAxis:](self->_spatialAudioModeButton, "setAxis:", 0);
  -[MediaControlsExpandableButton setAxis:](self->_conversationAwarenessButton, "setAxis:", 0);
  -[MRUVolumeNowPlayingView setAxis:](self->_nowPlayingView, "setAxis:", MRUIsSmallScreen() ^ 1);
  -[MRUVolumeBackgroundView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;
  v56 = v4;

  MRUExpandedContentInsets();
  MRUVerticalScreenInset(self);
  v6 = CCUISliderExpandedContentModuleWidth();
  v48 = v7;
  MRUDefaultExpandedWidth(v6);
  CCUISliderExpandedContentModuleHeight();
  -[MRUVolumeBackgroundView bounds](self, "bounds");
  UIRectCenteredIntegralRectScale();
  v52 = v9;
  v54 = v8;
  v11 = v10;
  rect = v12;
  -[MRUVolumeBackgroundView bounds](self, "bounds", v5);
  UIRectInset();
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  MinX = CGRectGetMinX(v57);
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  MinY = CGRectGetMinY(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v19 = CGRectGetWidth(v59);
  v60.size.width = v52;
  v60.origin.x = v54;
  v47 = v11;
  v60.origin.y = v11;
  v60.size.height = rect;
  v20 = CGRectGetMinY(v60);
  v46 = x;
  v61.origin.x = x;
  v61.origin.y = y;
  v50 = height;
  v51 = width;
  v61.size.width = width;
  v61.size.height = height;
  v21 = v20 - CGRectGetMinY(v61);
  if (self->_showSecondaryAssetView)
    v22 = v48;
  else
    v22 = v19;
  -[MRUOutputDeviceAssetView sizeThatFits:](self->_primaryAssetView, "sizeThatFits:", v22, v21);
  UIRectCenteredIntegralRectScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_primaryAssetView, "setFrame:", v56);
  v62.origin.x = MinX;
  v62.origin.y = MinY;
  v62.size.width = v19;
  v62.size.height = v21;
  CGRectGetMaxX(v62);
  v63.origin.x = MinX;
  v63.origin.y = MinY;
  v63.size.width = v19;
  v63.size.height = v21;
  CGRectGetMinY(v63);
  v64.origin.x = MinX;
  v64.origin.y = MinY;
  v64.size.width = v19;
  v64.size.height = v21;
  -[MRUOutputDeviceAssetView sizeThatFits:](self->_secondaryAssetView, "sizeThatFits:", v48, CGRectGetHeight(v64));
  UIRectCenteredIntegralRectScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_secondaryAssetView, "setFrame:", v56);
  if (self->_showSecondaryAssetView)
  {
    v24 = v46;
    v23 = v47;
    v25 = v52;
    v26 = y;
    if (!-[MRUVolumeBackgroundView hasExpandedButtons](self, "hasExpandedButtons"))
    {
      v65.origin.x = v46;
      v65.origin.y = y;
      v65.size.height = height;
      v65.size.width = width;
      CGRectGetWidth(v65);
    }
  }
  else
  {
    v24 = v46;
    v23 = v47;
    v25 = v52;
    v26 = y;
  }
  v66.origin.x = v24;
  v66.origin.y = v26;
  v66.size.width = width;
  v66.size.height = height;
  CGRectGetMaxY(v66);
  v67.origin.x = v54;
  v67.size.height = rect;
  v67.origin.y = v23;
  v67.size.width = v25;
  CGRectGetMaxY(v67);
  v68.origin.x = v24;
  v68.origin.y = v26;
  v68.size.width = width;
  v68.size.height = height;
  CGRectGetHeight(v68);
  UIRectInset();
  v27 = v69.origin.x;
  v28 = v69.origin.y;
  v29 = v69.size.width;
  v30 = v69.size.height;
  v31 = CGRectGetWidth(v69);
  showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
  v33 = v31 / 3.0;
  if (self->_showSpatialAudioModeButton)
  {
    if (!self->_showSecondaryAssetView)
      goto LABEL_14;
    if (!-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
      goto LABEL_21;
  }
  if (self->_showSecondaryAssetView
    && !-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
  {
    goto LABEL_21;
  }
  showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
LABEL_14:
  if (self->_showConversationAwarenessButton)
  {
    if (!showSpatialAudioModeButton)
      goto LABEL_20;
    if (-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
    {
      showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
      goto LABEL_18;
    }
LABEL_21:
    UIRectInset();
    goto LABEL_22;
  }
LABEL_18:
  if (showSpatialAudioModeButton || (v33 = v27, self->_showConversationAwarenessButton))
  {
LABEL_20:
    if (-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded", v33))
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_22:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_primaryListeningModeButton, "setFrame:");
  if (!-[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded"))
    UIRectInset();
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_secondaryListeningModeButton, "setFrame:");
  if (self->_showSecondaryAssetView
    && !-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
  {
    goto LABEL_32;
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showConversationAwarenessButton)
      goto LABEL_31;
    if (!-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
    {
LABEL_32:
      UIRectInset();
      goto LABEL_33;
    }
    if (self->_showPrimaryListeningModeButton)
      goto LABEL_31;
  }
  v34 = v27;
  v35 = v28;
  v36 = v29;
  v37 = v30;
  if (self->_showConversationAwarenessButton)
  {
LABEL_31:
    if (!-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded", v34, v35, v36, v37))
      goto LABEL_32;
  }
LABEL_33:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_spatialAudioModeButton, "setFrame:");
  v49 = v27;
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showSpatialAudioModeButton)
      goto LABEL_37;
    if (!-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
    {
      v39 = v25;
      v40 = v26;
      v41 = v24;
      v42 = v30;
      v43 = v54;
      goto LABEL_43;
    }
    if (self->_showPrimaryListeningModeButton)
    {
LABEL_37:
      if (-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
        goto LABEL_38;
      v39 = v25;
      v40 = v26;
      v41 = v24;
      v42 = v30;
      v43 = v54;
LABEL_43:
      UIRectInset();
      goto LABEL_44;
    }
  }
LABEL_38:
  v38 = v27;
  v39 = v25;
  v40 = v26;
  v41 = v24;
  v42 = v30;
  v43 = v54;
  if (self->_showSpatialAudioModeButton
    && !-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded", v38, v28, v29, v42))
  {
    goto LABEL_43;
  }
LABEL_44:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_conversationAwarenessButton, "setFrame:");
  v70.origin.x = v41;
  v70.origin.y = v40;
  v53 = v29;
  v70.size.width = v51;
  v70.size.height = v50;
  CGRectGetMinX(v70);
  v71.origin.x = v43;
  v71.origin.y = v23;
  v71.size.width = v39;
  v71.size.height = rect;
  CGRectGetMaxY(v71);
  v72.origin.y = v40;
  v72.origin.x = v41;
  v72.size.width = v51;
  v72.size.height = v50;
  v44 = CGRectGetWidth(v72);
  v73.size.height = v42;
  v73.origin.x = v49;
  v73.origin.y = v28;
  v73.size.width = v53;
  v45 = CGRectGetMinY(v73);
  v74.origin.x = v43;
  v74.origin.y = v23;
  v74.size.width = v39;
  v74.size.height = rect;
  -[MRUVolumeNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v44, v45 - CGRectGetMaxY(v74));
  UIRectCenteredIntegralRectScale();
  -[MRUVolumeNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:");
}

- (void)updateVisibility
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v20;
  double v21;
  BOOL v23;
  double v24;
  BOOL v26;
  double v27;
  BOOL v29;
  BOOL v31;
  double v32;

  v3 = 1.0;
  v4 = 1.0;
  if (self->_showSecondaryListeningModeButton)
  {
    if (-[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded"))
      v4 = 0.5;
    else
      v4 = 1.0;
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if (-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
      v3 = 0.5;
    else
      v3 = 1.0;
  }
  v5 = -[MRUVolumeBackgroundView hasExpandedButtons](self, "hasExpandedButtons");
  v6 = 1.0;
  v7 = 0.0;
  if (!self->_showNowPlayingView)
    v6 = 0.0;
  -[MRUVolumeNowPlayingView setAlpha:](self->_nowPlayingView, "setAlpha:", v6);
  if (MRULayoutShouldBeVertical())
  {
    -[MRUOutputDeviceAssetView setAlpha:](self->_primaryAssetView, "setAlpha:", v4);
    if (self->_showSecondaryAssetView)
      v8 = v3;
    else
      v8 = 0.0;
    -[MRUOutputDeviceAssetView setAlpha:](self->_secondaryAssetView, "setAlpha:", v8);
    if (self->_showPrimaryListeningModeButton && v5)
      v10 = !-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded");
    else
      v10 = !self->_showPrimaryListeningModeButton;
    v18 = 0.0;
    if (!v10)
      v18 = 1.0;
    -[MediaControlsExpandableButton setAlpha:](self->_primaryListeningModeButton, "setAlpha:", v18);
    if (self->_showSecondaryListeningModeButton && v5)
      v20 = !-[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded");
    else
      v20 = !self->_showSecondaryListeningModeButton;
    v21 = 0.0;
    if (!v20)
      v21 = 1.0;
    -[MediaControlsExpandableButton setAlpha:](self->_secondaryListeningModeButton, "setAlpha:", v21);
    if (self->_showSpatialAudioModeButton && v5)
      v23 = !-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded");
    else
      v23 = !self->_showSpatialAudioModeButton;
    v24 = 0.0;
    if (!v23)
      v24 = 1.0;
LABEL_80:
    -[MediaControlsExpandableButton setAlpha:](self->_spatialAudioModeButton, "setAlpha:", v24);
    if (self->_showConversationAwarenessButton && v5)
      v31 = !-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded");
    else
      v31 = !self->_showConversationAwarenessButton;
    v32 = 0.0;
    if (!v31)
      v32 = 1.0;
    -[MediaControlsExpandableButton setAlpha:](self->_conversationAwarenessButton, "setAlpha:", v32);
    if (self->_showNowPlayingView)
      v15 = 1.0;
    else
      v15 = 0.0;
    goto LABEL_91;
  }
  if (!self->_showSecondaryAssetView)
  {
    -[MRUOutputDeviceAssetView setAlpha:](self->_primaryAssetView, "setAlpha:", 1.0);
    -[MRUOutputDeviceAssetView setAlpha:](self->_secondaryAssetView, "setAlpha:", 0.0);
    if (self->_showPrimaryListeningModeButton && v5)
      v26 = !-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded");
    else
      v26 = !self->_showPrimaryListeningModeButton;
    if (v26)
      v27 = 0.0;
    else
      v27 = 1.0;
    -[MediaControlsExpandableButton setAlpha:](self->_primaryListeningModeButton, "setAlpha:", v27);
    -[MediaControlsExpandableButton setAlpha:](self->_secondaryListeningModeButton, "setAlpha:", 0.0);
    if (self->_showSpatialAudioModeButton && v5)
      v29 = !-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded");
    else
      v29 = !self->_showSpatialAudioModeButton;
    v24 = 1.0;
    if (v29)
      v24 = 0.0;
    goto LABEL_80;
  }
  if (!self->_showPrimaryListeningModeButton
    || (v11 = -[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"),
        v12 = 0.0,
        !v11))
  {
    v12 = v4;
  }
  -[MRUOutputDeviceAssetView setAlpha:](self->_primaryAssetView, "setAlpha:", v12);
  v13 = 0.0;
  if (self->_showSecondaryAssetView)
  {
    if (!self->_showSecondaryListeningModeButton
      || (v14 = -[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded", 0.0),
          v13 = 0.0,
          !v14))
    {
      v13 = v3;
    }
  }
  -[MRUOutputDeviceAssetView setAlpha:](self->_secondaryAssetView, "setAlpha:", v13);
  if (self->_showPrimaryListeningModeButton
    && (!self->_showSpatialAudioModeButton
     || !-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded")))
  {
    v7 = v4;
  }
  -[MediaControlsExpandableButton setAlpha:](self->_primaryListeningModeButton, "setAlpha:", v7);
  v15 = 0.0;
  if (self->_showSecondaryListeningModeButton)
    v16 = v3;
  else
    v16 = 0.0;
  -[MediaControlsExpandableButton setAlpha:](self->_secondaryListeningModeButton, "setAlpha:", v16);
  v17 = 1.0;
  if (!self->_showSpatialAudioModeButton)
    v17 = 0.0;
  -[MediaControlsExpandableButton setAlpha:](self->_spatialAudioModeButton, "setAlpha:", v17);
  -[MediaControlsExpandableButton setAlpha:](self->_conversationAwarenessButton, "setAlpha:", 0.0);
  if (self->_showNowPlayingView)
  {
    v15 = 1.0;
    if (self->_showSpatialAudioModeButton)
    {
      if (-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
        v15 = 0.0;
      else
        v15 = 1.0;
    }
  }
LABEL_91:
  -[MRUVolumeNowPlayingView setAlpha:](self->_nowPlayingView, "setAlpha:", v15);
}

- (BOOL)hasExpandedButtons
{
  return -[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded")
      || -[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded")
      || -[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded")
      || -[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded");
}

- (void)setShowSpatialAudioModeButton:(BOOL)a3
{
  self->_showSpatialAudioModeButton = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowSecondaryListeningModeButton:(BOOL)a3
{
  self->_showSecondaryListeningModeButton = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowSecondaryAssetView:(BOOL)a3
{
  self->_showSecondaryAssetView = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowPrimaryListeningModeButton:(BOOL)a3
{
  self->_showPrimaryListeningModeButton = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowNowPlayingView:(BOOL)a3
{
  self->_showNowPlayingView = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowConversationAwarenessButton:(BOOL)a3
{
  self->_showConversationAwarenessButton = a3;
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (MRUVolumeNowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (MRUVolumeBackgroundView)initWithFrame:(CGRect)a3
{
  MRUVolumeBackgroundView *v3;
  MRUOutputDeviceAssetView *v4;
  MRUOutputDeviceAssetView *primaryAssetView;
  MRUOutputDeviceAssetView *v6;
  MRUOutputDeviceAssetView *secondaryAssetView;
  MRUVolumeNowPlayingView *v8;
  MRUVolumeNowPlayingView *nowPlayingView;
  MediaControlsExpandableButton *v10;
  MediaControlsExpandableButton *primaryListeningModeButton;
  MediaControlsExpandableButton *v12;
  MediaControlsExpandableButton *secondaryListeningModeButton;
  MediaControlsExpandableButton *v14;
  MediaControlsExpandableButton *spatialAudioModeButton;
  MediaControlsExpandableButton *v16;
  MediaControlsExpandableButton *conversationAwarenessButton;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRUVolumeBackgroundView;
  v3 = -[MRUVolumeBackgroundView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUOutputDeviceAssetView);
    primaryAssetView = v3->_primaryAssetView;
    v3->_primaryAssetView = v4;

    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_primaryAssetView);
    v6 = objc_alloc_init(MRUOutputDeviceAssetView);
    secondaryAssetView = v3->_secondaryAssetView;
    v3->_secondaryAssetView = v6;

    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_secondaryAssetView);
    v8 = objc_alloc_init(MRUVolumeNowPlayingView);
    nowPlayingView = v3->_nowPlayingView;
    v3->_nowPlayingView = v8;

    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_nowPlayingView);
    v10 = -[MediaControlsExpandableButton initForControlCenter]([MediaControlsExpandableButton alloc], "initForControlCenter");
    primaryListeningModeButton = v3->_primaryListeningModeButton;
    v3->_primaryListeningModeButton = v10;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_primaryListeningModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_primaryListeningModeButton, "setButtonImageSize:", 54.0, 54.0);
    -[MediaControlsExpandableButton setContentVerticalAlignment:](v3->_primaryListeningModeButton, "setContentVerticalAlignment:", 1);
    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_primaryListeningModeButton);
    v12 = -[MediaControlsExpandableButton initForControlCenter]([MediaControlsExpandableButton alloc], "initForControlCenter");
    secondaryListeningModeButton = v3->_secondaryListeningModeButton;
    v3->_secondaryListeningModeButton = v12;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_secondaryListeningModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_secondaryListeningModeButton, "setButtonImageSize:", 54.0, 54.0);
    -[MediaControlsExpandableButton setContentVerticalAlignment:](v3->_secondaryListeningModeButton, "setContentVerticalAlignment:", 1);
    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_secondaryListeningModeButton);
    v14 = -[MediaControlsExpandableButton initForControlCenter]([MediaControlsExpandableButton alloc], "initForControlCenter");
    spatialAudioModeButton = v3->_spatialAudioModeButton;
    v3->_spatialAudioModeButton = v14;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_spatialAudioModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_spatialAudioModeButton, "setButtonImageSize:", 54.0, 54.0);
    -[MediaControlsExpandableButton setContentVerticalAlignment:](v3->_spatialAudioModeButton, "setContentVerticalAlignment:", 1);
    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_spatialAudioModeButton);
    v16 = -[MediaControlsExpandableButton initForControlCenter]([MediaControlsExpandableButton alloc], "initForControlCenter");
    conversationAwarenessButton = v3->_conversationAwarenessButton;
    v3->_conversationAwarenessButton = v16;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_conversationAwarenessButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_conversationAwarenessButton, "setButtonImageSize:", 54.0, 54.0);
    -[MediaControlsExpandableButton setContentVerticalAlignment:](v3->_conversationAwarenessButton, "setContentVerticalAlignment:", 1);
    -[MRUVolumeBackgroundView addSubview:](v3, "addSubview:", v3->_conversationAwarenessButton);
    -[MRUVolumeBackgroundView updateVisibility](v3, "updateVisibility");
  }
  return v3;
}

- (void)layoutSubviewsHorizontal
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat MinX;
  CGFloat MinY;
  double Height;
  CGFloat v31;
  CGFloat rect;
  CGFloat v33;
  CGFloat v34;
  double v35;
  CGFloat MaxX;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  -[MediaControlsExpandableButton setAxis:](self->_primaryListeningModeButton, "setAxis:", 1);
  -[MediaControlsExpandableButton setAxis:](self->_secondaryListeningModeButton, "setAxis:", 1);
  -[MediaControlsExpandableButton setAxis:](self->_spatialAudioModeButton, "setAxis:", 1);
  -[MediaControlsExpandableButton setAxis:](self->_conversationAwarenessButton, "setAxis:", 1);
  v3 = self->_showSecondaryAssetView && self->_showSpatialAudioModeButton;
  -[MRUVolumeNowPlayingView setAxis:](self->_nowPlayingView, "setAxis:", v3);
  -[MRUVolumeBackgroundView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v43 = v5;

  MRUExpandedContentInsets();
  MRUHortizonalScreenInset(self);
  -[MRUVolumeBackgroundView bounds](self, "bounds");
  UIRectInset();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  CCUISliderExpandedContentModuleWidth();
  CCUISliderExpandedContentModuleHeight();
  v44.origin.x = v7;
  v44.origin.y = v9;
  v44.size.width = v11;
  v44.size.height = v13;
  Width = CGRectGetWidth(v44);
  -[MRUVolumeBackgroundView totalHorizontalSliderWidth](self, "totalHorizontalSliderWidth");
  v16 = Width - v15;
  if (self->_showSecondaryAssetView)
  {
    v17 = 3.0;
    if (!self->_showSpatialAudioModeButton)
      v17 = 2.0;
  }
  else
  {
    v17 = 2.0;
  }
  v18 = v16 / v17;
  v45.origin.x = v7;
  v45.origin.y = v9;
  v45.size.width = v11;
  v45.size.height = v13;
  CGRectGetMinX(v45);
  v35 = v18;
  -[MRUVolumeBackgroundView bounds](self, "bounds");
  UIRectCenteredYInRectScale();
  v41 = v20;
  v42 = v19;
  v37 = v22;
  v39 = v21;
  v46.origin.x = v7;
  v46.origin.y = v9;
  v46.size.width = v11;
  v46.size.height = v13;
  CGRectGetMaxX(v46);
  -[MRUVolumeBackgroundView bounds](self, "bounds", v43);
  UIRectCenteredYInRectScale();
  v33 = v24;
  v34 = v23;
  v26 = v25;
  rect = v27;
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  +[MediaControlsExpandableButton collapsedHeightWithImageHeight:maximumHeight:](MediaControlsExpandableButton, "collapsedHeightWithImageHeight:maximumHeight:", 54.0, CGRectGetHeight(v47) / 3.0, v43);
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = v7;
  v49.origin.y = v9;
  v49.size.width = v11;
  v49.size.height = v13;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = v7;
  v50.origin.y = v9;
  v50.size.width = v11;
  v50.size.height = v13;
  Height = CGRectGetHeight(v50);
  v51.origin.y = v41;
  v51.origin.x = v42;
  v51.size.height = v37;
  v51.size.width = v39;
  MaxX = CGRectGetMaxX(v51);
  v52.origin.x = v7;
  v52.origin.y = v9;
  v52.size.width = v11;
  v52.size.height = v13;
  v40 = CGRectGetMinY(v52);
  v53.origin.x = v7;
  v53.origin.y = v9;
  v53.size.width = v11;
  v53.size.height = v13;
  v38 = CGRectGetHeight(v53);
  v54.size.width = v33;
  v54.origin.x = v34;
  v54.origin.y = v26;
  v54.size.height = rect;
  CGRectGetMaxX(v54);
  v55.origin.x = v7;
  v55.origin.y = v9;
  v55.size.width = v11;
  v55.size.height = v13;
  CGRectGetMinY(v55);
  v56.origin.x = v7;
  v56.origin.y = v9;
  v56.size.width = v11;
  v56.size.height = v13;
  CGRectGetHeight(v56);
  UIRectInset();
  if (self->_showSecondaryAssetView || self->_showNowPlayingView)
    UIRectInset();
  UIRectIntegralWithScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_primaryAssetView, "setFrame:");
  UIRectInset();
  UIRectIntegralWithScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_secondaryAssetView, "setFrame:");
  if (self->_showSecondaryAssetView)
  {
    if (-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
      goto LABEL_26;
    if (self->_showSecondaryAssetView)
      goto LABEL_25;
  }
  if (!self->_showSpatialAudioModeButton)
    goto LABEL_19;
  if (self->_showConversationAwarenessButton)
  {
    if (-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
    {
      if (!self->_showSpatialAudioModeButton)
      {
LABEL_19:
        if (!self->_showConversationAwarenessButton)
          goto LABEL_21;
        goto LABEL_20;
      }
      goto LABEL_20;
    }
LABEL_25:
    UIRectInset();
    goto LABEL_26;
  }
LABEL_20:
  if (!-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
    goto LABEL_25;
LABEL_21:
  if (!-[MediaControlsExpandableButton isExpanded](self->_primaryListeningModeButton, "isExpanded"))
    goto LABEL_25;
LABEL_26:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_primaryListeningModeButton, "setFrame:");
  if (!-[MediaControlsExpandableButton isExpanded](self->_secondaryListeningModeButton, "isExpanded"))
    UIRectInset();
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_secondaryListeningModeButton, "setFrame:");
  if (self->_showSecondaryAssetView)
  {
    if (-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
      goto LABEL_39;
    if (self->_showSecondaryAssetView)
      goto LABEL_38;
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showConversationAwarenessButton)
      goto LABEL_36;
    if (-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
    {
      if (self->_showPrimaryListeningModeButton)
        goto LABEL_36;
      goto LABEL_35;
    }
LABEL_38:
    UIRectInset();
    goto LABEL_39;
  }
LABEL_35:
  if (!self->_showConversationAwarenessButton)
    goto LABEL_37;
LABEL_36:
  if (!-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
    goto LABEL_38;
LABEL_37:
  if (!-[MediaControlsExpandableButton isExpanded](self->_spatialAudioModeButton, "isExpanded"))
    goto LABEL_38;
LABEL_39:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_spatialAudioModeButton, "setFrame:");
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showSpatialAudioModeButton)
      goto LABEL_43;
    if (!-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
    {
      v31 = MaxX;
      goto LABEL_51;
    }
    if (self->_showPrimaryListeningModeButton)
    {
LABEL_43:
      if (!-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
      {
        v31 = MaxX;
        goto LABEL_51;
      }
    }
  }
  if (self->_showSpatialAudioModeButton
    && !-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
  {
    v31 = MaxX;
  }
  else
  {
    v31 = MaxX;
    if (-[MediaControlsExpandableButton isExpanded](self->_conversationAwarenessButton, "isExpanded"))
      goto LABEL_52;
  }
LABEL_51:
  UIRectInset();
LABEL_52:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_conversationAwarenessButton, "setFrame:");
  -[MRUVolumeNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v35, Height);
  v57.origin.x = MinX;
  v57.origin.y = MinY;
  v57.size.width = v35;
  v57.size.height = Height;
  CGRectGetMidY(v57);
  UIRectCenteredXInRectScale();
  if (self->_showSecondaryAssetView)
  {
    v58.origin.x = v31;
    v58.origin.y = v40;
    v58.size.width = v35;
    v58.size.height = v38;
    CGRectGetMidY(v58);
    UIRectCenteredXInRectScale();
  }
  -[MRUVolumeNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUOutputDeviceAssetView setStylingProvider:](self->_primaryAssetView, "setStylingProvider:", v5);
    -[MRUOutputDeviceAssetView setStylingProvider:](self->_secondaryAssetView, "setStylingProvider:", v5);
    -[MRUVolumeNowPlayingView setStylingProvider:](self->_nowPlayingView, "setStylingProvider:", v5);
    -[MediaControlsExpandableButton setStylingProvider:](self->_primaryListeningModeButton, "setStylingProvider:", v5);
    -[MediaControlsExpandableButton setStylingProvider:](self->_secondaryListeningModeButton, "setStylingProvider:", v5);
    -[MediaControlsExpandableButton setStylingProvider:](self->_spatialAudioModeButton, "setStylingProvider:", v5);
    -[MediaControlsExpandableButton setStylingProvider:](self->_conversationAwarenessButton, "setStylingProvider:", v5);
  }

}

- (void)expandButton:(id)a3
{
  MediaControlsExpandableButton **p_primaryListeningModeButton;
  MediaControlsExpandableButton *primaryListeningModeButton;
  MediaControlsExpandableButton *v6;

  v6 = (MediaControlsExpandableButton *)a3;
  -[MediaControlsExpandableButton setExpanded:](v6, "setExpanded:", 1);
  p_primaryListeningModeButton = &self->_primaryListeningModeButton;
  primaryListeningModeButton = self->_primaryListeningModeButton;
  if (primaryListeningModeButton == v6)
  {
    primaryListeningModeButton = self->_secondaryListeningModeButton;
    p_primaryListeningModeButton = &self->_secondaryListeningModeButton;
LABEL_6:
    -[MediaControlsExpandableButton setExpanded:](primaryListeningModeButton, "setExpanded:", 0);
    -[MediaControlsExpandableButton setUserInteractionEnabled:](*p_primaryListeningModeButton, "setUserInteractionEnabled:", 0);
    goto LABEL_7;
  }
  if (self->_secondaryListeningModeButton == v6 || self->_spatialAudioModeButton == v6)
    goto LABEL_6;
LABEL_7:
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");

}

- (void)collapseExpandableButtons
{
  -[MediaControlsExpandableButton setExpanded:](self->_primaryListeningModeButton, "setExpanded:", 0);
  -[MediaControlsExpandableButton setExpanded:](self->_secondaryListeningModeButton, "setExpanded:", 0);
  -[MediaControlsExpandableButton setExpanded:](self->_spatialAudioModeButton, "setExpanded:", 0);
  -[MediaControlsExpandableButton setExpanded:](self->_conversationAwarenessButton, "setExpanded:", 0);
  -[MediaControlsExpandableButton setUserInteractionEnabled:](self->_primaryListeningModeButton, "setUserInteractionEnabled:", 1);
  -[MediaControlsExpandableButton setUserInteractionEnabled:](self->_secondaryListeningModeButton, "setUserInteractionEnabled:", 1);
  -[MediaControlsExpandableButton setUserInteractionEnabled:](self->_spatialAudioModeButton, "setUserInteractionEnabled:", 1);
  -[MediaControlsExpandableButton setUserInteractionEnabled:](self->_conversationAwarenessButton, "setUserInteractionEnabled:", 1);
  -[MRUVolumeBackgroundView updateVisibility](self, "updateVisibility");
  -[MRUVolumeBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (double)totalHorizontalSliderWidth
{
  double v2;
  double result;

  if (self->_showSecondaryAssetView)
  {
    if (self->_showSpatialAudioModeButton)
    {
      CCUISliderExpandedContentModuleWidth();
      return v2 + v2;
    }
    else
    {
      return MRUDefaultExpandedWidth(self);
    }
  }
  else
  {
    CCUISliderExpandedContentModuleWidth();
  }
  return result;
}

- (MRUOutputDeviceAssetView)primaryAssetView
{
  return self->_primaryAssetView;
}

- (void)setPrimaryAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAssetView, a3);
}

- (MRUOutputDeviceAssetView)secondaryAssetView
{
  return self->_secondaryAssetView;
}

- (void)setSecondaryAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAssetView, a3);
}

- (void)setNowPlayingView:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingView, a3);
}

- (MediaControlsExpandableButton)primaryListeningModeButton
{
  return self->_primaryListeningModeButton;
}

- (void)setPrimaryListeningModeButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryListeningModeButton, a3);
}

- (MediaControlsExpandableButton)secondaryListeningModeButton
{
  return self->_secondaryListeningModeButton;
}

- (void)setSecondaryListeningModeButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryListeningModeButton, a3);
}

- (void)setSpatialAudioModeButton:(id)a3
{
  objc_storeStrong((id *)&self->_spatialAudioModeButton, a3);
}

- (MediaControlsExpandableButton)conversationAwarenessButton
{
  return self->_conversationAwarenessButton;
}

- (void)setConversationAwarenessButton:(id)a3
{
  objc_storeStrong((id *)&self->_conversationAwarenessButton, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showSecondaryAssetView
{
  return self->_showSecondaryAssetView;
}

- (BOOL)showPrimaryListeningModeButton
{
  return self->_showPrimaryListeningModeButton;
}

- (BOOL)showNowPlayingView
{
  return self->_showNowPlayingView;
}

- (BOOL)showSecondaryListeningModeButton
{
  return self->_showSecondaryListeningModeButton;
}

- (BOOL)showSpatialAudioModeButton
{
  return self->_showSpatialAudioModeButton;
}

- (BOOL)showConversationAwarenessButton
{
  return self->_showConversationAwarenessButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_conversationAwarenessButton, 0);
  objc_storeStrong((id *)&self->_spatialAudioModeButton, 0);
  objc_storeStrong((id *)&self->_secondaryListeningModeButton, 0);
  objc_storeStrong((id *)&self->_primaryListeningModeButton, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
  objc_storeStrong((id *)&self->_secondaryAssetView, 0);
  objc_storeStrong((id *)&self->_primaryAssetView, 0);
}

@end
