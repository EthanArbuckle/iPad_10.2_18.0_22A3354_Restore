@implementation MRUNowPlayingCellContentView

- (MRUNowPlayingCellContentView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingCellContentView *v3;
  MRUArtworkView *v4;
  MRUArtworkView *artworkView;
  MRUNowPlayingHeaderView *v6;
  MRUNowPlayingHeaderView *headerView;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingCellContentView;
  v3 = -[MRUNowPlayingCellContentView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v4;

    -[MRUArtworkView setUserInteractionEnabled:](v3->_artworkView, "setUserInteractionEnabled:", 0);
    -[MRUNowPlayingCellContentView addSubview:](v3, "addSubview:", v3->_artworkView);
    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v3->_headerView;
    v3->_headerView = v6;

    -[MRUNowPlayingHeaderView labelView](v3->_headerView, "labelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    -[MRUNowPlayingHeaderView labelView](v3->_headerView, "labelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShowRoute:", 1);

    -[MRUNowPlayingHeaderView labelView](v3->_headerView, "labelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowSubtitle:", 0);

    -[MRUNowPlayingCellContentView addSubview:](v3, "addSubview:", v3->_headerView);
    v3->_contentScale = 1.0;
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat MinX;
  CGFloat MinY;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v13.receiver = self;
  v13.super_class = (Class)MRUNowPlayingCellContentView;
  -[MRUNowPlayingCellContentView layoutSubviews](&v13, sel_layoutSubviews);
  -[MRUNowPlayingCellContentView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = CGRectGetWidth(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = CGRectGetHeight(v15);
  if (v7 >= v8)
    v7 = v8;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetHeight(v17);
  if (v9 >= v10)
    v9 = v10;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MinX = CGRectGetMinX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MinY = CGRectGetMinY(v19);
  -[MRUNowPlayingCellContentView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
  v20.origin.x = MinX;
  v20.origin.y = MinY;
  v20.size.width = v7;
  v20.size.height = v9;
  CGRectGetWidth(v20);
  UIRectInset();
  -[MRUNowPlayingCellContentView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
  if (v4 <= 60.0)
    v4 = 60.0;
  v5 = width;
  result.height = v4;
  result.width = v5;
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
  }

}

- (void)setContentScale:(double)a3
{
  void *v5;
  id v6;

  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingCellContentView headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentScale:", a3);

    -[MRUNowPlayingCellContentView artworkView](self, "artworkView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentScale:", a3);

  }
}

- (double)textInset
{
  return 60.0 + 10.0;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
