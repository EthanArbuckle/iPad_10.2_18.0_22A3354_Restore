@implementation MRUOutputDeviceAssetView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = 54.0;
  v7 = 54.0 + 8.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeTitleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineHeight");
  v10 = v9;

  if (-[MRUOutputDeviceAsset type](self->_asset, "type"))
  {
    -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height - v7);
    v11 = MRUSizeCeilToViewScale(self);
    if (v11 >= 54.0)
      v6 = v11;
  }
  v12 = v7 + v10 + v10;
  if (v6 >= width)
    v13 = width;
  else
    v13 = v6;
  if (v12 >= height)
    v12 = height;
  result.height = v12;
  result.width = v13;
  return result;
}

- (MRUOutputDeviceAssetView)initWithFrame:(CGRect)a3
{
  MRUOutputDeviceAssetView *v3;
  MRUAssetView *v4;
  MRUAssetView *assetView;
  void *v6;
  BSUIEmojiLabelView *v7;
  BSUIEmojiLabelView *titleLabel;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUOutputDeviceAssetView;
  v3 = -[MRUOutputDeviceAssetView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUAssetView);
    assetView = v3->_assetView;
    v3->_assetView = v4;

    -[MRUAssetView setPackageScale:](v3->_assetView, "setPackageScale:", 1.25);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 1, 44.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUAssetView setImageSymbolConfiguration:](v3->_assetView, "setImageSymbolConfiguration:", v6);

    -[MRUAssetView setUserInteractionEnabled:](v3->_assetView, "setUserInteractionEnabled:", 0);
    -[MRUAssetView controlCenterApplyPrimaryContentShadow](v3->_assetView, "controlCenterApplyPrimaryContentShadow");
    -[MRUOutputDeviceAssetView addSubview:](v3, "addSubview:", v3->_assetView);
    v7 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E0D01920]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    -[BSUIEmojiLabelView setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[BSUIEmojiLabelView setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[BSUIEmojiLabelView controlCenterApplyPrimaryContentShadow](v3->_titleLabel, "controlCenterApplyPrimaryContentShadow");
    -[MRUOutputDeviceAssetView addSubview:](v3, "addSubview:", v3->_titleLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUOutputDeviceAssetView updateContentSizeCategory](v3, "updateContentSizeCategory");
    -[MRUOutputDeviceAssetView updateVisibility](v3, "updateVisibility");
  }
  return v3;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23.receiver = self;
  v23.super_class = (Class)MRUOutputDeviceAssetView;
  -[MRUOutputDeviceAssetView layoutSubviews](&v23, sel_layoutSubviews);
  -[MRUOutputDeviceAssetView bounds](self, "bounds");
  UIRectCenteredXInRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[MRUOutputDeviceAsset type](self->_asset, "type"))
  {
    UIRectCenteredRect();
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  -[MRUAssetView setFrame:](self->_assetView, "setFrame:", v4, v6, v8, v10);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGRectGetMaxY(v24);
  UIRectInset();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[BSUIEmojiLabelView sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, v21);
  MRUSizeCeilToViewScale(self);
  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.width = v20;
  v25.size.height = v22;
  CGRectGetMinY(v25);
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  CGRectGetWidth(v26);
  UIRectCenteredXInRect();
  -[BSUIEmojiLabelView setFrame:](self->_titleLabel, "setFrame:");
}

- (void)setAsset:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_asset, a3);
  v5 = a3;
  -[MRUAssetView setAsset:](self->_assetView, "setAsset:", v5);

  -[MRUOutputDeviceAssetView updateVisibility](self, "updateVisibility");
  -[MRUOutputDeviceAssetView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[BSUIEmojiLabelView setText:](self->_titleLabel, "setText:", v5);

  -[MRUOutputDeviceAssetView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGlyphState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphState, a3);
  v5 = a3;
  -[MRUAssetView setGlyphState:](self->_assetView, "setGlyphState:", v5);

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
    -[MRUAssetView setStylingProvider:](self->_assetView, "setStylingProvider:", v7);
    -[MRUOutputDeviceAssetView updateVisualStyling](self, "updateVisualStyling");
  }

}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeTitleFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](self->_titleLabel, "setFont:", v3);

}

- (void)updateVisibility
{
  int64_t v3;
  double v4;

  v3 = -[MRUOutputDeviceAsset type](self->_asset, "type");
  v4 = 1.0;
  if (!v3)
    v4 = 0.0;
  -[BSUIEmojiLabelView setAlpha:](self->_titleLabel, "setAlpha:", v4);
}

- (MRUOutputDeviceAsset)asset
{
  return self->_asset;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BSUIEmojiLabelView)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MRUAssetView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_assetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
