@implementation MRUAssetView

- (MRUAssetView)initWithFrame:(CGRect)a3
{
  MRUAssetView *v3;
  MRUCAPackageView *v4;
  MRUCAPackageView *packageView;
  UIImageView *v6;
  UIImageView *imageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUAssetView;
  v3 = -[MRUAssetView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUCAPackageView);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    -[MRUAssetView addSubview:](v3, "addSubview:", v3->_packageView);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v6;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    -[UIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[MRUAssetView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUAssetView;
  -[MRUAssetView layoutSubviews](&v3, sel_layoutSubviews);
  -[MRUAssetView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  UIRectGetCenter();
  -[MRUCAPackageView setCenter:](self->_packageView, "setCenter:");
}

- (void)setAsset:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_asset, a3);
  objc_msgSend(v8, "packageAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "packageAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCAPackageView setAsset:](self->_packageView, "setAsset:", v6);

    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  }
  else
  {
    -[MRUCAPackageView clear](self->_packageView, "clear");
    objc_msgSend(v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v7);

  }
  -[MRUAssetView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setGlyphState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphState, a3);
  v5 = a3;
  -[MRUCAPackageView setGlyphState:](self->_packageView, "setGlyphState:", v5);

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUAssetView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setImageSymbolConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
  v5 = a3;
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v5);

}

- (void)setPackageScale:(double)a3
{
  self->_packageScale = a3;
  -[MRUCAPackageView setScale:](self->_packageView, "setScale:");
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUAssetView;
  v4 = a3;
  -[MRUAssetView setTintColor:](&v5, sel_setTintColor_, v4);
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v4, v5.receiver, v5.super_class);
  -[MRUCAPackageView setTintColor:](self->_packageView, "setTintColor:", v4);

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_packageView);
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (double)packageScale
{
  return self->_packageScale;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
