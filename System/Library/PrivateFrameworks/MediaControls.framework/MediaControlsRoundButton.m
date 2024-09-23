@implementation MediaControlsRoundButton

- (MediaControlsRoundButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MediaControlsRoundButton *v7;
  MRUAssetView *v8;
  MRUAssetView *assetView;
  void *v10;
  uint64_t v11;
  UILabel *titleLabel;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsRoundButton;
  v7 = -[MediaControlsRoundButton initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_alloc_init(MRUAssetView);
    assetView = v7->_assetView;
    v7->_assetView = v8;

    -[MRUAssetView setUserInteractionEnabled:](v7->_assetView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, -1, 27.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUAssetView setImageSymbolConfiguration:](v7->_assetView, "setImageSymbolConfiguration:", v10);

    -[MediaControlsRoundButton addSubview:](v7, "addSubview:", v7->_assetView);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v11;

    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    LODWORD(v13) = 1051931443;
    -[UILabel _setHyphenationFactor:](v7->_titleLabel, "_setHyphenationFactor:", v13);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_titleLabel, "setTextColor:", v14);

    -[MediaControlsRoundButton addSubview:](v7, "addSubview:", v7->_titleLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MediaControlsRoundButton updateContentSizeCategory](v7, "updateContentSizeCategory");
    -[MediaControlsRoundButton updateAssetVisualStyling](v7, "updateAssetVisualStyling");
    -[MediaControlsRoundButton updateLabelVisualStyling](v7, "updateLabelVisualStyling");
  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int64_t axis;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  UILabel **p_titleLabel;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29.receiver = self;
  v29.super_class = (Class)MediaControlsRoundButton;
  -[MediaControlsRoundButton layoutSubviews](&v29, sel_layoutSubviews);
  -[MediaControlsRoundButton bounds](self, "bounds");
  -[MediaControlsRoundButton assetFrame](self, "assetFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUAssetView setFrame:](self->_assetView, "setFrame:");
  axis = self->_axis;
  if (axis == 1)
  {
    v32.origin.x = v4;
    v32.origin.y = v6;
    v32.size.width = v8;
    v32.size.height = v10;
    CGRectGetMaxX(v32);
    UIRectInset();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v25, v27);
    v33.origin.x = v22;
    v33.origin.y = v24;
    v33.size.width = v26;
    v33.size.height = v28;
    CGRectGetMinX(v33);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis)
      return;
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGRectGetMaxY(v30);
    UIRectInset();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](*p_titleLabel, "sizeThatFits:", v16, v18);
    v31.origin.x = v13;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    CGRectGetMinY(v31);
    UIRectCenteredXInRect();
  }
  -[UILabel setFrame:](*p_titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t axis;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MediaControlsRoundButton assetFrame](self, "assetFrame");
  v8 = v6;
  v9 = v7;
  axis = self->_axis;
  if (axis == 1)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - (v6 + 8.0), height - v7);
    v8 = v8 + MRUSizeCeilToViewScale(self);
    if (v9 < v13)
      v9 = v13;
  }
  else if (!axis)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6, height - (v7 + 8.0));
    v11 = MRUSizeCeilToViewScale(self);
    if (v11 >= v8)
      v8 = v11;
    v9 = v9 + v12;
  }
  if (v8 >= width)
    v14 = width;
  else
    v14 = v8;
  if (v9 >= height)
    v15 = height;
  else
    v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setAsset:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_asset, a3);
  v5 = a3;
  -[MRUAssetView setAsset:](self->_assetView, "setAsset:", v5);

}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);
  -[MediaControlsRoundButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);

  -[MediaControlsRoundButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGlyphState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphState, a3);
  v5 = a3;
  -[MRUAssetView setGlyphState:](self->_assetView, "setGlyphState:", v5);

}

- (CGRect)assetFrame
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[MediaControlsRoundButton contentVerticalAlignment](self, "contentVerticalAlignment");
  -[MediaControlsRoundButton bounds](self, "bounds");
  if (v3)
    UIRectCenteredXInRect();
  else
    UIRectCenteredIntegralRect();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  uint64_t v4;

  self->_axis = a3;
  if (a3)
    v4 = 4;
  else
    v4 = 1;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v4);
  -[MediaControlsRoundButton setNeedsLayout](self, "setNeedsLayout");
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
    -[MediaControlsRoundButton updateLabelVisualStyling](self, "updateLabelVisualStyling");
  }

}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  -[MediaControlsRoundButton updateLabelVisualStyling](self, "updateLabelVisualStyling");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  -[MediaControlsRoundButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[MediaControlsRoundButton updateAssetVisualStyling](self, "updateAssetVisualStyling");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  -[MediaControlsRoundButton setSelected:](&v4, sel_setSelected_, a3);
  -[MediaControlsRoundButton updateAssetVisualStyling](self, "updateAssetVisualStyling");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsRoundButton;
  -[MediaControlsRoundButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[MediaControlsRoundButton updateLabelVisualStyling](self, "updateLabelVisualStyling");
  -[MediaControlsRoundButton updateAssetVisualStyling](self, "updateAssetVisualStyling");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MediaControlsRoundButton assetFrame](self, "assetFrame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRoundButton;
  return (*MEMORY[0x1E0DC4660] | -[MediaControlsRoundButton accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x1E0DC4698];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  MediaControlsRoundButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (MediaControlsRoundButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)visualStylingProviderDidChange:(id)a3
{
  -[MediaControlsRoundButton updateAssetVisualStyling](self, "updateAssetVisualStyling", a3);
  -[MediaControlsRoundButton updateLabelVisualStyling](self, "updateLabelVisualStyling");
}

- (void)updateAssetVisualStyling
{
  double v3;
  id v4;

  if ((-[MediaControlsRoundButton isEnabled](self, "isEnabled") & 1) != 0)
  {
    if (-[MediaControlsRoundButton isHighlighted](self, "isHighlighted"))
      v3 = 0.2;
    else
      v3 = 1.0;
    -[MRUAssetView setAlpha:](self->_assetView, "setAlpha:", v3);
  }
  else
  {
    -[MRUAssetView setAlpha:](self->_assetView, "setAlpha:", 0.5);
  }
  if (!self->_stylingProvider)
  {
    if ((-[MediaControlsRoundButton isSelected](self, "isSelected") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUAssetView setTintColor:](self->_assetView, "setTintColor:", v4);

  }
}

- (void)updateLabelVisualStyling
{
  UILabel *titleLabel;
  double v4;
  char v5;
  MRUVisualStylingProvider *stylingProvider;
  char v7;

  if (!self->_labelHidden)
  {
    if (self->_stylingProvider)
    {
      v5 = -[MediaControlsRoundButton isEnabled](self, "isEnabled");
      stylingProvider = self->_stylingProvider;
      if ((v5 & 1) == 0)
      {
        -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
        titleLabel = self->_titleLabel;
        goto LABEL_10;
      }
      if (stylingProvider)
      {
        -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
        return;
      }
    }
    v7 = -[MediaControlsRoundButton isEnabled](self, "isEnabled");
    titleLabel = self->_titleLabel;
    if ((v7 & 1) != 0)
    {
      v4 = 1.0;
      goto LABEL_11;
    }
LABEL_10:
    v4 = 0.5;
    goto LABEL_11;
  }
  titleLabel = self->_titleLabel;
  v4 = 0.0;
LABEL_11:
  -[UILabel setAlpha:](titleLabel, "setAlpha:", v4);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_volumeButtonTitleFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (MRUAsset)asset
{
  return self->_asset;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGSize)assetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetSize.width;
  height = self->_assetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAssetSize:(CGSize)a3
{
  self->_assetSize = a3;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (MRUAssetView)assetView
{
  return self->_assetView;
}

- (void)setAssetView:(id)a3
{
  objc_storeStrong((id *)&self->_assetView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
