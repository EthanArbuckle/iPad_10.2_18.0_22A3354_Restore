@implementation MRUNowPlayingHeaderView

- (MRUNowPlayingHeaderView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingHeaderView *v3;
  MRUNowPlayingLabelView *v4;
  MRUNowPlayingLabelView *labelView;
  void *v6;
  uint64_t v7;
  MRUTransportButton *routingButton;
  uint64_t v9;
  MRUTransportButton *transportButton;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingHeaderView;
  v3 = -[MRUNowPlayingHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v3->_labelView;
    v3->_labelView = v4;

    -[MRUNowPlayingHeaderView addSubview:](v3, "addSubview:", v3->_labelView);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, 29.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    routingButton = v3->_routingButton;
    v3->_routingButton = (MRUTransportButton *)v7;

    -[MRUTransportButton setCursorScale:](v3->_routingButton, "setCursorScale:", 1.5);
    -[MPButton setHitRectInsets:](v3->_routingButton, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);
    -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](v3->_routingButton, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);
    -[MRUNowPlayingHeaderView addSubview:](v3, "addSubview:", v3->_routingButton);
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    transportButton = v3->_transportButton;
    v3->_transportButton = (MRUTransportButton *)v9;

    -[MPButton setHitRectInsets:](v3->_transportButton, "setHitRectInsets:", -24.0, -24.0, -24.0, -24.0);
    -[MRUTransportButton setCursorScale:](v3->_transportButton, "setCursorScale:", 1.5);
    -[MRUTransportButton setPackageScale:](v3->_transportButton, "setPackageScale:", 0.7);
    -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](v3->_transportButton, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);
    -[MRUNowPlayingHeaderView addSubview:](v3, "addSubview:", v3->_transportButton);
    v3->_contentScale = 1.0;
    -[MRUNowPlayingHeaderView updateVisibility](v3, "updateVisibility");

  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  int64_t layout;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double MinX;
  double MinY;
  id *p_labelView;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
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

  v70.receiver = self;
  v70.super_class = (Class)MRUNowPlayingHeaderView;
  -[MRUNowPlayingHeaderView layoutSubviews](&v70, sel_layoutSubviews);
  -[MRUNowPlayingHeaderView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  layout = self->_layout;
  if (layout == 4)
  {
    CGRectGetMaxX(*(CGRect *)&v3);
    UIRectCenteredYInRect();
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    v68 = v28;
    v69 = v26;
    v66 = v32;
    v67 = v30;
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
    v76.origin.x = v7;
    v76.origin.y = v8;
    v76.size.width = v9;
    v76.size.height = v10;
    CGRectGetMaxX(v76);
    UIRectCenteredYInRect();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUHapticView setFrame:](self->_hapticView, "setFrame:");
    v77.origin.x = v7;
    v77.origin.y = v8;
    v77.size.width = v9;
    v77.size.height = v10;
    CGRectGetMaxX(v77);
    UIRectCenteredYInRect();
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
    if (self->_showWaveform)
    {
      if (!self->_showHaptic)
      {
        v42 = v68;
        v41 = v69;
        v44 = v66;
        v43 = v67;
LABEL_21:
        CGRectGetWidth(*(CGRect *)&v41);
        UIRectInset();
        v7 = v62;
        v8 = v63;
        v9 = v64;
        v10 = v65;
        goto LABEL_22;
      }
    }
    else if (!self->_showHaptic)
    {
LABEL_22:
      p_labelView = (id *)&self->_labelView;
      -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v9, v10, v66);
      v85.origin.x = v7;
      v85.origin.y = v8;
      v85.size.width = v9;
      v85.size.height = v10;
      CGRectGetMinX(v85);
      v86.origin.x = v7;
      v86.origin.y = v8;
      v86.size.width = v9;
      v86.size.height = v10;
      CGRectGetWidth(v86);
LABEL_23:
      UIRectCenteredYInRect();
      -[MRUNowPlayingHeaderView bounds](self, "bounds");
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      goto LABEL_24;
    }
    v42 = v36;
    v41 = v34;
    v44 = v40;
    v43 = v38;
    goto LABEL_21;
  }
  if (layout != 2)
  {
    CGRectGetMaxX(*(CGRect *)&v3);
    UIRectCenteredYInRect();
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_routingButton, "setFrame:");
    v78.origin.x = v7;
    v78.origin.y = v8;
    v78.size.width = v9;
    v78.size.height = v10;
    v79.origin.x = CGRectGetMaxX(v78) - 22.0;
    v79.origin.y = 0.0;
    v79.size.width = 22.0;
    v79.size.height = 22.0;
    CGRectOffset(v79, -10.0, 3.0);
    -[MRUNowPlayingHeaderView bounds](self, "bounds", 0x4036000000000000);
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
    v80.origin.x = v7;
    v80.origin.y = v8;
    v80.size.width = v9;
    v80.size.height = v10;
    v81.origin.x = CGRectGetMaxX(v80) - 32.0;
    v81.origin.y = 0.0;
    v81.size.width = 32.0;
    v81.size.height = 32.0;
    CGRectOffset(v81, -10.0, 3.0);
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUHapticView setFrame:](self->_hapticView, "setFrame:");
    if (self->_showRoutingButton && self->_layout == 3)
    {
      UIRectInset();
      v7 = v45;
      v8 = v46;
      v9 = v47;
      v10 = v48;
    }
    if (self->_showWaveform && !self->_showHaptic)
    {
      UIRectInset();
      v7 = v49;
      v8 = v50;
      v9 = v51;
      v10 = v52;
    }
    if (self->_showHaptic)
    {
      UIRectInset();
      v7 = v53;
      v8 = v54;
      v9 = v55;
      v10 = v56;
    }
    v82.origin.x = v7;
    v82.origin.y = v8;
    v82.size.width = v9;
    v82.size.height = v10;
    CGRectGetMaxX(v82);
    v57 = v8;
    UIRectCenteredYInRect();
    -[MRUNowPlayingHeaderView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
    if (self->_showTransportButton && self->_layout == 3)
    {
      UIRectInset();
      v7 = v58;
      v57 = v59;
      v9 = v60;
      v10 = v61;
    }
    p_labelView = (id *)&self->_labelView;
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v9, v10);
    v83.origin.x = v7;
    v83.origin.y = v57;
    v83.size.width = v9;
    v83.size.height = v10;
    CGRectGetMinX(v83);
    v84.origin.x = v7;
    v84.origin.y = v57;
    v84.size.width = v9;
    v84.size.height = v10;
    CGRectGetWidth(v84);
    goto LABEL_23;
  }
  UIRectInset();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", v16, v18);
  v21 = v20;
  v71.origin.x = v13;
  v71.origin.y = v15;
  v71.size.width = v17;
  v71.size.height = v19;
  MinX = CGRectGetMinX(v71);
  v72.origin.x = v13;
  v72.origin.y = v15;
  v72.size.width = v17;
  v72.size.height = v19;
  MinY = CGRectGetMinY(v72);
  v73.origin.x = v13;
  v73.origin.y = v15;
  v73.size.width = v17;
  v73.size.height = v19;
  -[MRUNowPlayingLabelView setFrame:](self->_labelView, "setFrame:", MinX, MinY, CGRectGetWidth(v73), v21);
  v74.origin.x = v13;
  v74.origin.y = v15;
  v74.size.width = v17;
  v74.size.height = v19;
  CGRectGetMaxX(v74);
  UIRectCenteredYInRect();
  -[MRUNowPlayingHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUTransportButton setFrame:](self->_transportButton, "setFrame:");
  v75.origin.x = v13;
  v75.origin.y = v15;
  v75.size.width = v17;
  v75.size.height = v19;
  CGRectGetMaxX(v75);
  UIRectCenteredYInRect();
  -[MRUNowPlayingHeaderView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  p_labelView = (id *)&self->_routingButton;
LABEL_24:
  objc_msgSend(*p_labelView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_layout == 2)
  {
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    -[MRUTransportButton sizeThatFits:](self->_routingButton, "sizeThatFits:", a3.width, a3.height);
    v8 = v7;
    -[MRUNowPlayingLabelView sizeThatFits:](self->_labelView, "sizeThatFits:", width, height);
    if (v8 >= v6)
      v6 = v8;
  }
  v9 = width;
  result.height = v6;
  result.width = v9;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUWaveformView setStylingProvider:](self->_waveformView, "setStylingProvider:", v5);
    -[MRUHapticView setStylingProvider:](self->_hapticView, "setStylingProvider:", v5);
    -[MRUNowPlayingLabelView setStylingProvider:](self->_labelView, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_transportButton, "setStylingProvider:", v5);
  }

}

- (void)setWaveformView:(id)a3
{
  MRUWaveformView *v4;
  MRUWaveformView *waveformView;
  MRUWaveformView *v6;

  v4 = (MRUWaveformView *)a3;
  -[MRUWaveformView removeFromSuperview](self->_waveformView, "removeFromSuperview");
  waveformView = self->_waveformView;
  self->_waveformView = v4;
  v6 = v4;

  -[MRUWaveformView setStylingProvider:](self->_waveformView, "setStylingProvider:", self->_stylingProvider);
  -[MRUNowPlayingHeaderView addSubview:](self, "addSubview:", v6);

  -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
  -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHapticView:(id)a3
{
  MRUHapticView *v4;
  MRUHapticView *hapticView;
  MRUHapticView *v6;

  v4 = (MRUHapticView *)a3;
  -[MRUHapticView removeFromSuperview](self->_hapticView, "removeFromSuperview");
  hapticView = self->_hapticView;
  self->_hapticView = v4;
  v6 = v4;

  -[MRUHapticView setStylingProvider:](self->_hapticView, "setStylingProvider:", self->_stylingProvider);
  -[MRUNowPlayingHeaderView addSubview:](self, "addSubview:", v6);

  -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
  -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowTransportButton:(BOOL)a3
{
  if (self->_showTransportButton != a3)
  {
    self->_showTransportButton = a3;
    -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowWaveform:(BOOL)a3
{
  if (self->_showWaveform != a3)
  {
    self->_showWaveform = a3;
    -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowHaptic:(BOOL)a3
{
  if (self->_showHaptic != a3)
  {
    self->_showHaptic = a3;
    -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowRoutingButton:(BOOL)a3
{
  if (self->_showRoutingButton != a3)
  {
    self->_showRoutingButton = a3;
    -[MRUNowPlayingHeaderView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[MRUNowPlayingLabelView setTextAlignment:](self->_labelView, "setTextAlignment:");
    -[MRUNowPlayingHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingLabelView setContentScale:](self->_labelView, "setContentScale:");
  }
}

- (void)updateVisibility
{
  MRUHapticView *hapticView;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  uint64_t *v10;
  double v11;
  double *v12;
  double v13;
  double *v14;
  double *v15;

  switch(self->_layout)
  {
    case 0:
    case 4:
      -[MRUTransportButton setAlpha:](self->_routingButton, "setAlpha:", 0.0);
      -[MRUTransportButton setAlpha:](self->_transportButton, "setAlpha:", 0.0);
      v5 = 0.0;
      if (self->_showWaveform && !self->_showHaptic)
        v5 = 1.0;
      -[MRUWaveformView setAlpha:](self->_waveformView, "setAlpha:", v5);
      v4 = 1.0;
      if (!self->_showHaptic)
        v4 = 0.0;
      hapticView = self->_hapticView;
      goto LABEL_9;
    case 1:
    case 2:
      -[MRUTransportButton setAlpha:](self->_routingButton, "setAlpha:", 0.0);
      -[MRUTransportButton setAlpha:](self->_transportButton, "setAlpha:", 0.0);
      -[MRUWaveformView setAlpha:](self->_waveformView, "setAlpha:", 0.0);
      hapticView = self->_hapticView;
      v4 = 0.0;
LABEL_9:
      -[MRUHapticView setAlpha:](hapticView, "setAlpha:", v4);
      break;
    case 3:
      if (self->_showRoutingButton)
        v6 = 1.0;
      else
        v6 = 0.0;
      -[MRUTransportButton setAlpha:](self->_routingButton, "setAlpha:", v6);
      if (self->_showTransportButton)
        v7 = 1.0;
      else
        v7 = 0.0;
      -[MRUTransportButton setAlpha:](self->_transportButton, "setAlpha:", v7);
      -[MRUWaveformView setAlpha:](self->_waveformView, "setAlpha:", 0.0);
      -[MRUHapticView setAlpha:](self->_hapticView, "setAlpha:", 0.0);
      if (self->_showTransportButton)
        v8 = (double *)&unk_1AAAD5C30;
      else
        v8 = (double *)&unk_1AAAD5BF0;
      v9 = *v8;
      v10 = &qword_1AAAD5BE8;
      if (self->_showTransportButton)
        v10 = (uint64_t *)&unk_1AAAD5C28;
      v11 = *(double *)v10;
      v12 = (double *)&unk_1AAAD5BE0;
      if (self->_showTransportButton)
        v12 = (double *)&unk_1AAAD5C20;
      v13 = *v12;
      if (self->_showTransportButton)
        v14 = (double *)&MRUNowPlayingHitRectInsetRight;
      else
        v14 = (double *)&MRUNowPlayingHitRectInset;
      -[MPButton setHitRectInsets:](self->_routingButton, "setHitRectInsets:", *v14, v13, v11, v9);
      if (self->_showRoutingButton)
        v15 = (double *)&MRUNowPlayingHitRectInsetLeft;
      else
        v15 = (double *)&MRUNowPlayingHitRectInset;
      -[MPButton setHitRectInsets:](self->_transportButton, "setHitRectInsets:", *v15, v15[1], v15[2], v15[3]);
      break;
    default:
      return;
  }
}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (MRUHapticView)hapticView
{
  return self->_hapticView;
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (MRUTransportButton)routingButton
{
  return self->_routingButton;
}

- (MRUTransportButton)transportButton
{
  return self->_transportButton;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showTransportButton
{
  return self->_showTransportButton;
}

- (BOOL)showRoutingButton
{
  return self->_showRoutingButton;
}

- (BOOL)showWaveform
{
  return self->_showWaveform;
}

- (BOOL)showHaptic
{
  return self->_showHaptic;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textCenterOffsetY
{
  return self->_textCenterOffsetY;
}

- (void)setTextCenterOffsetY:(double)a3
{
  self->_textCenterOffsetY = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_transportButton, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_hapticView, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end
