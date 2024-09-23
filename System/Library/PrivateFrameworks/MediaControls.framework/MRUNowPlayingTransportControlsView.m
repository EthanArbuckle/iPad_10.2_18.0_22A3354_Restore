@implementation MRUNowPlayingTransportControlsView

- (MRUNowPlayingTransportControlsView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingTransportControlsView *v3;
  uint64_t v4;
  MRUTransportButton *leadingButton;
  uint64_t v6;
  MRUTransportButton *leftButton;
  uint64_t v8;
  MRUTransportButton *centerButton;
  uint64_t v10;
  MRUTransportButton *rightButton;
  MRUTransportButton *v12;
  MRUTransportButton *routingButton;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRUNowPlayingTransportControlsView;
  v3 = -[MRUNowPlayingTransportControlsView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    leadingButton = v3->_leadingButton;
    v3->_leadingButton = (MRUTransportButton *)v4;

    -[MRUNowPlayingTransportControlsView addSubview:](v3, "addSubview:", v3->_leadingButton);
    +[MPButton easyTouchButtonWithType:](MRUHoldTransportButton, "easyTouchButtonWithType:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    leftButton = v3->_leftButton;
    v3->_leftButton = (MRUTransportButton *)v6;

    -[MRUNowPlayingTransportControlsView addSubview:](v3, "addSubview:", v3->_leftButton);
    +[MPButton easyTouchButtonWithType:](MRUTransportButton, "easyTouchButtonWithType:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    centerButton = v3->_centerButton;
    v3->_centerButton = (MRUTransportButton *)v8;

    -[MRUNowPlayingTransportControlsView addSubview:](v3, "addSubview:", v3->_centerButton);
    +[MPButton easyTouchButtonWithType:](MRUHoldTransportButton, "easyTouchButtonWithType:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    rightButton = v3->_rightButton;
    v3->_rightButton = (MRUTransportButton *)v10;

    -[MRUNowPlayingTransportControlsView addSubview:](v3, "addSubview:", v3->_rightButton);
    v12 = objc_alloc_init(MRUTransportButton);
    routingButton = v3->_routingButton;
    v3->_routingButton = v12;

    -[MRUTransportButton addTarget:action:forControlEvents:](v3->_routingButton, "addTarget:action:forControlEvents:", v3, sel_didSelectRoutingButton_, 64);
    -[MRUNowPlayingTransportControlsView addSubview:](v3, "addSubview:", v3->_routingButton);
    v3->_contentScale = 1.0;
    -[MRUNowPlayingTransportControlsView updateImageConfiguration](v3, "updateImageConfiguration");
    -[MRUNowPlayingTransportControlsView updateVisibility](v3, "updateVisibility");
  }
  return v3;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat rect;
  CGFloat v69;
  double v70;
  objc_super v71;
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
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
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
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v71.receiver = self;
  v71.super_class = (Class)MRUNowPlayingTransportControlsView;
  -[MRUNowPlayingTransportControlsView layoutSubviews](&v71, sel_layoutSubviews);
  -[MRUNowPlayingTransportControlsView bounds](self, "bounds");
  x = v72.origin.x;
  y = v72.origin.y;
  width = v72.size.width;
  height = v72.size.height;
  CGRectGetHeight(v72);
  switch(self->_layout)
  {
    case 1:
      v73.origin.x = x;
      v73.origin.y = y;
      v73.size.width = width;
      v73.size.height = height;
      CGRectGetMinX(v73);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v74.origin.x = x;
      v74.origin.y = y;
      v74.size.width = width;
      v74.size.height = height;
      CGRectGetMaxX(v74);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_routingButton, "setFrame:");
      UIRectInset();
      v7 = v75.origin.x;
      rect = v75.origin.y;
      v8 = v75.size.width;
      v9 = v75.size.height;
      CGRectGetMinX(v75);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      UIRectCenteredRect();
      UIRectCenteredRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v76.origin.x = v7;
      v76.origin.y = rect;
      v76.size.width = v8;
      v76.size.height = v9;
      CGRectGetMaxX(v76);
      UIRectCenteredYInRect();
      v10 = 496;
      goto LABEL_14;
    case 4:
      v86.origin.x = x;
      v86.origin.y = y;
      v86.size.width = width;
      v86.size.height = height;
      CGRectGetMinX(v86);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v87.origin.x = x;
      v87.origin.y = y;
      v87.size.width = width;
      v87.size.height = height;
      CGRectGetMinX(v87);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = width;
      v88.size.height = height;
      CGRectGetMinX(v88);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v89.origin.x = x;
      v89.origin.y = y;
      v89.size.width = width;
      v89.size.height = height;
      CGRectGetMaxX(v89);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v90.origin.x = x;
      v90.origin.y = y;
      v90.size.width = width;
      v90.size.height = height;
      CGRectGetMaxX(v90);
      break;
    case 5:
      x = x + 7.0;
      y = y + 0.0;
      width = width - (7.0 + 7.0);
      v32 = height - (0.0 + 0.0);
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = width;
      v91.size.height = v32;
      CGRectGetMinX(v91);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v92.origin.x = x;
      v92.origin.y = y;
      v92.size.width = width;
      v92.size.height = v32;
      CGRectGetMinX(v92);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      UIRectCenteredRect();
      UIRectCenteredRect();
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v93.origin.x = x;
      v93.origin.y = y;
      v93.size.width = width;
      v93.size.height = v32;
      CGRectGetMaxX(v93);
      goto LABEL_11;
    case 6:
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      CGRectGetMinX(v94);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      UIRectCenteredRect();
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v70 = height;
      v40 = v39;
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v95.origin.x = v34;
      v95.origin.y = v36;
      v95.size.width = v38;
      v95.size.height = v40;
      CGRectGetMinX(v95);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      v96.origin.x = v34;
      v96.origin.y = v36;
      v96.size.width = v38;
      v96.size.height = v40;
      CGRectGetMaxX(v96);
      v32 = v70;
LABEL_11:
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v97.origin.x = x;
      v97.origin.y = y;
      v97.size.width = width;
      v97.size.height = v32;
      CGRectGetMaxX(v97);
      break;
    case 8:
      UIRectCenteredRect();
      v42 = v41;
      v65 = v43;
      v44 = v43;
      v46 = v45;
      v66 = v45;
      v48 = v47;
      v67 = v47;
      -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
      v98.origin.x = v42;
      v98.origin.y = v44;
      v98.size.width = v46;
      v98.size.height = v48;
      CGRectGetMinX(v98);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
      v99.origin.x = v42;
      v99.origin.y = v65;
      v99.size.width = v66;
      v99.size.height = v67;
      CGRectGetMinX(v99);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
      v100.origin.x = v42;
      v100.origin.y = v65;
      v100.size.width = v66;
      v100.size.height = v67;
      CGRectGetMaxX(v100);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v101.origin.x = v42;
      v101.origin.y = v65;
      v101.size.width = v66;
      v101.size.height = v67;
      CGRectGetMinX(v101);
      break;
    default:
      v69 = height;
      if (self->_showRoutingButton
        || (-[MRUTransportButton transportControlItem](self->_leadingButton, "transportControlItem"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        CGRectGetWidth(v77);
        UIRoundToViewScale();
        v78.origin.x = x;
        v78.origin.y = y;
        v78.size.width = width;
        v78.size.height = height;
        CGRectGetMinX(v78);
        v79.origin.x = x;
        v79.origin.y = y;
        v79.size.width = width;
        v79.size.height = height;
        CGRectGetMinY(v79);
        UIRectCenteredYInRect();
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
        v80.origin.x = v13;
        v80.origin.y = v15;
        v80.size.width = v17;
        v80.size.height = v19;
        CGRectGetMaxX(v80);
        v81.origin.x = x;
        v81.origin.y = y;
        v81.size.width = width;
        v81.size.height = v69;
        CGRectGetMinY(v81);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
        v82.origin.x = x;
        v82.origin.y = y;
        v82.size.width = width;
        v82.size.height = v69;
        CGRectGetMinY(v82);
        UIRectCenteredRect();
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
        v28 = v21;
        v29 = v23;
        v30 = v25;
        v31 = v27;
      }
      else
      {
        v104.origin.x = x;
        v104.origin.y = y;
        v104.size.width = width;
        v104.size.height = height;
        CGRectGetWidth(v104);
        UIRoundToViewScale();
        v105.origin.x = x;
        v105.origin.y = y;
        v105.size.width = width;
        v105.size.height = height;
        CGRectGetMinX(v105);
        v106.origin.x = x;
        v106.origin.y = y;
        v106.size.width = width;
        v106.size.height = height;
        CGRectGetMinY(v106);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leadingButton, "setFrame:");
        v107.origin.x = x;
        v107.origin.y = y;
        v107.size.width = width;
        v107.size.height = height;
        CGRectGetMinX(v107);
        v108.origin.x = x;
        v108.origin.y = y;
        v108.size.width = width;
        v108.size.height = height;
        CGRectGetMinY(v108);
        UIRectCenteredYInRect();
        -[MRUTransportButton setFrame:](self->_leftButton, "setFrame:");
        UIRectCenteredRect();
        UIRectCenteredRect();
        v58 = v57;
        v60 = v59;
        v62 = v61;
        v64 = v63;
        -[MRUTransportButton setFrame:](self->_centerButton, "setFrame:");
        v28 = v58;
        v29 = v60;
        v30 = v62;
        v31 = v64;
      }
      CGRectGetMaxX(*(CGRect *)&v28);
      v83.origin.x = x;
      v83.origin.y = y;
      v83.size.width = width;
      v83.size.height = v69;
      CGRectGetMinY(v83);
      UIRectCenteredYInRect();
      -[MRUTransportButton setFrame:](self->_rightButton, "setFrame:");
      v84.origin.x = x;
      v84.origin.y = y;
      v84.size.width = width;
      v84.size.height = v69;
      CGRectGetMaxX(v84);
      v85.origin.x = x;
      v85.origin.y = y;
      v85.size.width = width;
      v85.size.height = v69;
      CGRectGetMinY(v85);
      break;
  }
  UIRectCenteredYInRect();
  v10 = 448;
LABEL_14:
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v10), "setFrame:");
  -[MRUTransportButton frame](self->_centerButton, "frame");
  CGRectGetMaxX(v102);
  -[MRUTransportButton frame](self->_rightButton, "frame");
  CGRectGetMinX(v103);
  UIEdgeInsetsMakeWithEdges();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  -[MPButton setHitRectInsets:](self->_leadingButton, "setHitRectInsets:");
  -[MPButton setHitRectInsets:](self->_leftButton, "setHitRectInsets:", v50, v52, v54, v56);
  -[MPButton setHitRectInsets:](self->_centerButton, "setHitRectInsets:", v50, v52, v54, v56);
  -[MPButton setHitRectInsets:](self->_rightButton, "setHitRectInsets:", v50, v52, v54, v56);
  -[MPButton setHitRectInsets:](self->_routingButton, "setHitRectInsets:", v50, v52, v54, v56);
  -[MRUNowPlayingTransportControlsView updateImageConfiguration](self, "updateImageConfiguration");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  int64_t layout;
  double v4;

  layout = self->_layout;
  if ((unint64_t)(layout - 5) >= 2)
  {
    if (layout == 4)
    {
      v4 = 40.0;
      result.width = 80.0;
    }
    else
    {
      v4 = 44.0;
    }
  }
  else
  {
    v4 = 26.0;
  }
  result.height = v4;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MRUNowPlayingTransportControlsView;
    v5 = -[MRUNowPlayingTransportControlsView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4);
  }

  return v5;
}

- (void)setTransportControls:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_storeStrong((id *)&self->_transportControls, a3);
  v5 = a3;
  objc_msgSend(v5, "leftItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setTransportControlItem:](self->_leftButton, "setTransportControlItem:", v6);

  objc_msgSend(v5, "centerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setTransportControlItem:](self->_centerButton, "setTransportControlItem:", v7);

  objc_msgSend(v5, "rightItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setTransportControlItem:](self->_rightButton, "setTransportControlItem:", v8);

  -[MRUNowPlayingTransportControlsView configureLeadingButton](self, "configureLeadingButton");
  -[MRUNowPlayingTransportControlsView updateImageConfiguration](self, "updateImageConfiguration");
  -[MRUNowPlayingTransportControlsView updateVisibility](self, "updateVisibility");
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingTransportControlsView updateImageConfiguration](self, "updateImageConfiguration");
    -[MRUNowPlayingTransportControlsView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowRoutingButton:(BOOL)a3
{
  if (self->_showRoutingButton != a3)
  {
    self->_showRoutingButton = a3;
    -[MRUNowPlayingTransportControlsView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowTVRemoteButton:(BOOL)a3
{
  if (self->_showTVRemoteButton != a3)
  {
    self->_showTVRemoteButton = a3;
    -[MRUNowPlayingTransportControlsView configureLeadingButton](self, "configureLeadingButton");
    -[MRUNowPlayingTransportControlsView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUTransportButton setStylingProvider:](self->_leadingButton, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_leftButton, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_centerButton, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_rightButton, "setStylingProvider:", v5);
    -[MRUTransportButton setStylingProvider:](self->_routingButton, "setStylingProvider:", v5);
  }

}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUTransportButton setDimmed:](self->_leadingButton, "setDimmed:");
    -[MRUTransportButton setDimmed:](self->_leftButton, "setDimmed:", self->_dimmed);
    -[MRUTransportButton setDimmed:](self->_centerButton, "setDimmed:", self->_dimmed);
    -[MRUTransportButton setDimmed:](self->_rightButton, "setDimmed:", self->_dimmed);
    -[MRUTransportButton setDimmed:](self->_routingButton, "setDimmed:", self->_dimmed);
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingTransportControlsView updateImageConfiguration](self, "updateImageConfiguration");
    -[MRUNowPlayingTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didSelectRoutingButton:(id)a3
{
  MRUNowPlayingTransportControlsViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "transportControlsView:didSelectRoutingButton:", self, v5);

}

- (void)updateImageConfiguration
{
  int64_t layout;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t *v9;
  double contentScale;
  double v11;
  double v12;
  double v13;
  id v14;

  layout = self->_layout;
  if ((unint64_t)(layout - 5) < 2)
    goto LABEL_4;
  if (layout == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 17.0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 20.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 28.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 0.7;
    v9 = &MRUNowPlayingTransportCursorScaleSmall;
LABEL_7:
    v8 = v7;
    goto LABEL_8;
  }
  if (layout != 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 21.0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 26.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 40.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1.1;
    v6 = 1;
    v9 = &MRUNowPlayingTransportCursorScaleDefault;
    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, -1, self->_contentScale * 13.0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 1, self->_contentScale * 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 5, 3, self->_contentScale * 22.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0.7;
  v8 = 0.75;
  v9 = &MRUNowPlayingTransportCursorScaleSmall;
LABEL_8:
  contentScale = self->_contentScale;
  v11 = v7 * contentScale;
  v12 = v8 * contentScale;
  v13 = *(double *)v9 * contentScale;
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_leadingButton, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_leftButton, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_centerButton, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_rightButton, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);
  -[MRUTransportButton setPreferredSymbolConfiguration:forImageInState:](self->_routingButton, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);
  -[MRUTransportButton setPackageScale:](self->_leadingButton, "setPackageScale:", v11);
  -[MRUTransportButton setPackageScale:](self->_leftButton, "setPackageScale:", v11);
  -[MRUTransportButton setPackageScale:](self->_centerButton, "setPackageScale:", v12);
  -[MRUTransportButton setPackageScale:](self->_rightButton, "setPackageScale:", v11);
  -[MRUTransportButton setPackageScale:](self->_routingButton, "setPackageScale:", v11);
  -[MRUTransportButton setCursorScale:](self->_leadingButton, "setCursorScale:", v13);
  -[MRUTransportButton setCursorScale:](self->_leftButton, "setCursorScale:", v13);
  -[MRUTransportButton setCursorScale:](self->_centerButton, "setCursorScale:", v13);
  -[MRUTransportButton setCursorScale:](self->_rightButton, "setCursorScale:", v13);
  -[MRUTransportButton setCursorScale:](self->_routingButton, "setCursorScale:", v13);
  -[MRUTransportButton setShowHighlightCircle:](self->_leadingButton, "setShowHighlightCircle:", v6);
  -[MRUTransportButton setShowHighlightCircle:](self->_leftButton, "setShowHighlightCircle:", v6);
  -[MRUTransportButton setShowHighlightCircle:](self->_centerButton, "setShowHighlightCircle:", v6);
  -[MRUTransportButton setShowHighlightCircle:](self->_rightButton, "setShowHighlightCircle:", v6);
  -[MRUTransportButton setShowHighlightCircle:](self->_routingButton, "setShowHighlightCircle:", v6);

}

- (void)updateVisibility
{
  int64_t layout;
  double v4;
  MRUTransportButton *leftButton;
  double v6;
  void *v7;
  double v8;

  layout = self->_layout;
  if ((unint64_t)(layout - 5) < 2)
    goto LABEL_4;
  if (layout == 4)
  {
    v4 = 0.0;
    -[MRUTransportButton setAlpha:](self->_leadingButton, "setAlpha:", 0.0);
    leftButton = self->_leftButton;
    v6 = 0.0;
    goto LABEL_6;
  }
  if (layout == 1)
  {
LABEL_4:
    v4 = 0.0;
    -[MRUTransportButton setAlpha:](self->_leadingButton, "setAlpha:", 0.0);
    leftButton = self->_leftButton;
    v6 = 1.0;
LABEL_6:
    -[MRUTransportButton setAlpha:](leftButton, "setAlpha:", v6);
    goto LABEL_12;
  }
  -[MRUTransportButton transportControlItem](self->_leadingButton, "transportControlItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.5;
  if (v7)
    v8 = 0.5;
  else
    v8 = 0.0;
  -[MRUTransportButton setAlpha:](self->_leadingButton, "setAlpha:", v8);

  -[MRUTransportButton setAlpha:](self->_leftButton, "setAlpha:", 1.0);
  if (!self->_showRoutingButton)
    v4 = 0.0;
LABEL_12:
  -[MRUTransportButton setAlpha:](self->_routingButton, "setAlpha:", v4);
}

- (void)configureLeadingButton
{
  MRUAsset *v3;
  void *v4;
  MRUAsset *v5;
  MRUTransportControlItem *v6;
  MRUTransportControlItem *v7;
  void *v8;
  MRUTransportButton *leadingButton;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;

  objc_initWeak(&location, self->_leadingButton);
  objc_initWeak(&from, self);
  if (self->_showTVRemoteButton)
  {
    v3 = [MRUAsset alloc];
    +[MRUAssetsProvider tvRemote](MRUAssetsProvider, "tvRemote");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRUAsset initWithImage:](v3, "initWithImage:", v4);

    v6 = [MRUTransportControlItem alloc];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __60__MRUNowPlayingTransportControlsView_configureLeadingButton__block_invoke;
    v13 = &unk_1E581B9F0;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    v7 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:](v6, "initWithIdentifier:asset:mainAction:", CFSTR("tvremote"), v5, &v10);
    -[MRUTransportButton setTransportControlItem:](self->_leadingButton, "setTransportControlItem:", v7, v10, v11, v12, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
  }
  else
  {
    -[MRUTransportControls leadingItem](self->_transportControls, "leadingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    leadingButton = self->_leadingButton;
    if (!v8)
    {
      -[MRUTransportButton setTransportControlItem:](self->_leadingButton, "setTransportControlItem:", 0);
      goto LABEL_6;
    }
    -[MRUTransportControls leadingItem](self->_transportControls, "leadingItem");
    v5 = (MRUAsset *)objc_claimAutoreleasedReturnValue();
    -[MRUTransportButton setTransportControlItem:](leadingButton, "setTransportControlItem:", v5);
  }

LABEL_6:
  -[MRUNowPlayingTransportControlsView setNeedsLayout](self, "setNeedsLayout");
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __60__MRUNowPlayingTransportControlsView_configureLeadingButton__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  id v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "transportControlsView:didSelectTVRemoteButton:", v4, v5);

}

- (MRUNowPlayingTransportControlsViewDelegate)delegate
{
  return (MRUNowPlayingTransportControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUTransportControls)transportControls
{
  return self->_transportControls;
}

- (MRUTransportButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (MRUTransportButton)routingButton
{
  return self->_routingButton;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)showTVRemoteButton
{
  return self->_showTVRemoteButton;
}

- (BOOL)showRoutingButton
{
  return self->_showRoutingButton;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUTransportButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButton, a3);
}

- (MRUTransportButton)centerButton
{
  return self->_centerButton;
}

- (void)setCenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_centerButton, a3);
}

- (MRUTransportButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_transportControls, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
