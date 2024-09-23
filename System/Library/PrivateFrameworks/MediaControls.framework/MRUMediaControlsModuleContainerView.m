@implementation MRUMediaControlsModuleContainerView

- (MRUMediaControlsModuleContainerView)initWithFrame:(CGRect)a3
{
  MRUMediaControlsModuleContainerView *v3;
  MRUMediaControlsModuleContainerView *v4;
  MRUMediaControlsModuleRoutingView *v5;
  MRUMediaControlsModuleRoutingView *routingView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUMediaControlsModuleContainerView;
  v3 = -[MRUMediaControlsModuleContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUMediaControlsModuleContainerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = objc_alloc_init(MRUMediaControlsModuleRoutingView);
    routingView = v4->_routingView;
    v4->_routingView = v5;

    -[MRUMediaControlsModuleContainerView addSubview:](v4, "addSubview:", v4->_routingView);
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MinX;
  double MaxY;
  double Width;
  MRUMediaControlsModuleRoutingView *routingView;
  double Height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinY;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v36.receiver = self;
  v36.super_class = (Class)MRUMediaControlsModuleContainerView;
  -[MRUMediaControlsModuleContainerView layoutSubviews](&v36, sel_layoutSubviews);
  v3 = -[MRUMediaControlsModuleContainerView bounds](self, "bounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  switch(self->_layout)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v4, v5, v6, v7);
      v37.origin.x = v8;
      v37.origin.y = v9;
      v37.size.width = v10;
      v37.size.height = v11;
      MinX = CGRectGetMinX(v37);
      v38.origin.x = v8;
      v38.origin.y = v9;
      v38.size.width = v10;
      v38.size.height = v11;
      MaxY = CGRectGetMaxY(v38);
      v39.origin.x = v8;
      v39.origin.y = v9;
      v39.size.width = v10;
      v39.size.height = v11;
      Width = CGRectGetWidth(v39);
      routingView = self->_routingView;
      Height = 0.0;
      goto LABEL_4;
    case 2:
    case 7:
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v4, v5, v6, v7);
      v40.origin.x = v8;
      v40.origin.y = v9;
      v40.size.width = v10;
      v40.size.height = v11;
      MinX = CGRectGetMaxX(v40);
      v41.origin.x = v8;
      v41.origin.y = v9;
      v41.size.width = v10;
      v41.size.height = v11;
      MaxY = CGRectGetMinY(v41);
      v42.origin.x = v8;
      v42.origin.y = v9;
      v42.size.width = v10;
      v42.size.height = v11;
      Height = CGRectGetHeight(v42);
      routingView = self->_routingView;
      Width = 0.0;
LABEL_4:
      -[MRUMediaControlsModuleRoutingView setFrame:](routingView, "setFrame:", MinX, MaxY, Width, Height);
      return;
    case 8:
      -[MRUMediaControlsModuleNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v6, v7);
      v27 = v26;
      v29 = v28;
      v47.origin.x = v8;
      v47.origin.y = v9;
      v47.size.width = v10;
      v47.size.height = v11;
      v30 = CGRectGetMinX(v47);
      v48.origin.x = v8;
      v48.origin.y = v9;
      v48.size.width = v10;
      v48.size.height = v11;
      MinY = CGRectGetMinY(v48);
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v30, MinY, v27, v29);
      v49.origin.x = v30;
      v49.origin.y = MinY;
      v49.size.width = v27;
      v49.size.height = v29;
      CGRectGetHeight(v49);
      goto LABEL_7;
    case 9:
      v17 = MEMORY[0x1AF423F90](v3);
      CCUILayoutGutter();
      v19 = v17 + v18;
      v20 = (double)CCUINumberOfColumnsForGridSizeClass();
      CCUILayoutGutter();
      v22 = -(v21 - v19 * v20);
      v43.origin.x = v8;
      v43.origin.y = v9;
      v43.size.width = v10;
      v43.size.height = v11;
      v23 = CGRectGetHeight(v43);
      v44.origin.x = v8;
      v44.origin.y = v9;
      v44.size.width = v10;
      v44.size.height = v11;
      v24 = CGRectGetMinX(v44);
      v45.origin.x = v8;
      v45.origin.y = v9;
      v45.size.width = v10;
      v45.size.height = v11;
      v25 = CGRectGetMinY(v45);
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v24, v25, v22, v23);
      v46.origin.x = v24;
      v46.origin.y = v25;
      v46.size.width = v22;
      v46.size.height = v23;
      CGRectGetWidth(v46);
LABEL_7:
      UIRectInset();
      v33 = v32;
      v35 = v34;
      -[MRUMediaControlsModuleRoutingView setFrame:](self->_routingView, "setFrame:");
      -[MRUMediaControlsModuleRoutingView setContentSize:](self->_routingView, "setContentSize:", v33, v35);
      break;
    default:
      return;
  }
}

- (void)setNowPlayingView:(id)a3
{
  MRUMediaControlsModuleNowPlayingView *v5;
  MRUMediaControlsModuleNowPlayingView *nowPlayingView;
  MRUMediaControlsModuleNowPlayingView *v7;

  v5 = (MRUMediaControlsModuleNowPlayingView *)a3;
  nowPlayingView = self->_nowPlayingView;
  v7 = v5;
  if (nowPlayingView != v5)
  {
    -[MRUMediaControlsModuleNowPlayingView removeFromSuperview](nowPlayingView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_nowPlayingView, a3);
    -[MRUMediaControlsModuleNowPlayingView setContentMetrics:](v7, "setContentMetrics:", self->_contentMetrics);
    -[MRUMediaControlsModuleContainerView addSubview:](self, "addSubview:", v7);
    -[MRUMediaControlsModuleContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUMediaControlsModuleRoutingView setStylingProvider:](self->_routingView, "setStylingProvider:", v5);
  }

}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaControlsModuleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentMetrics:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_contentMetrics, a3);
  v5 = a3;
  -[MRUMediaControlsModuleNowPlayingView setContentMetrics:](self->_nowPlayingView, "setContentMetrics:", v5);

}

- (MRUMediaControlsModuleNowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (MRUMediaControlsModuleRoutingView)routingView
{
  return self->_routingView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_routingView, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
}

@end
