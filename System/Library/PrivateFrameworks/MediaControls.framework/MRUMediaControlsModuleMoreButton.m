@implementation MRUMediaControlsModuleMoreButton

- (MRUMediaControlsModuleMoreButton)initWithFrame:(CGRect)a3
{
  MRUMediaControlsModuleMoreButton *v3;
  uint64_t v4;
  UIView *backgroundView;
  id v6;
  void *v7;
  uint64_t v8;
  UIImageView *imageView;
  UILabel *v10;
  UILabel *titleLabel;
  MRUMediaControlsModuleBadge *v12;
  MRUMediaControlsModuleBadge *badge;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MRUMediaControlsModuleMoreButton;
  v3 = -[MRUMediaControlsModuleMoreButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
    v4 = objc_claimAutoreleasedReturnValue();
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v4;

    -[UIView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[MRUMediaControlsModuleMoreButton addSubview:](v3, "addSubview:", v3->_backgroundView);
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    +[MRUAssetsProvider controlOtherSpeakers](MRUAssetsProvider, "controlOtherSpeakers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithImage:", v7);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    -[UIImageView setUserInteractionEnabled:](v3->_imageView, "setUserInteractionEnabled:", 0);
    -[MRUMediaControlsModuleMoreButton addSubview:](v3, "addSubview:", v3->_imageView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setUserInteractionEnabled:](v3->_titleLabel, "setUserInteractionEnabled:", 0);
    -[MRUMediaControlsModuleMoreButton addSubview:](v3, "addSubview:", v3->_titleLabel);
    v12 = objc_alloc_init(MRUMediaControlsModuleBadge);
    badge = v3->_badge;
    v3->_badge = v12;

    -[MRUMediaControlsModuleBadge setUserInteractionEnabled:](v3->_badge, "setUserInteractionEnabled:", 0);
    -[MRUMediaControlsModuleMoreButton addSubview:](v3, "addSubview:", v3->_badge);
    v3->_contentScale = 1.0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[MRUMediaControlsModuleMoreButton addInteraction:](v3, "addInteraction:", v14);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUMediaControlsModuleMoreButton updateContentSizeCategory](v3, "updateContentSizeCategory");
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
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v36.receiver = self;
  v36.super_class = (Class)MRUMediaControlsModuleMoreButton;
  -[MRUMediaControlsModuleMoreButton layoutSubviews](&v36, sel_layoutSubviews);
  -[MRUMediaControlsModuleMoreButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUMediaControlsModuleMoreButton traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", CGRectGetHeight(v37) * 0.5);
  UIRectInset();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MRUMediaControlsModuleBadge sizeThatFits:](self->_badge, "sizeThatFits:", v16, v18);
  v38.origin.x = v13;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  CGRectGetMaxX(v38);
  UIRectCenteredYInRect();
  UIRectIntegralWithScale();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[MRUMediaControlsModuleMoreButton bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUMediaControlsModuleBadge setFrame:](self->_badge, "setFrame:");
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  CGRectGetWidth(v39);
  UIRectInset();
  CGRectGetMinX(v40);
  UIRectCenteredYInRect();
  UIRectRoundToScale();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[MRUMediaControlsModuleMoreButton bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  v41.origin.x = v29;
  v41.origin.y = v31;
  v41.size.width = v33;
  v41.size.height = v35;
  CGRectGetWidth(v41);
  UIRectInset();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int64_t layout;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = MRUCGSizeMultiply(44.0, 16.0, self->_contentScale);
  v8 = v7;
  v9 = height - v7;
  -[MRUMediaControlsModuleBadge sizeThatFits:](self->_badge, "sizeThatFits:", width - v6, height - v7);
  v11 = v10;
  v13 = v6 + v12 * 2.0;
  v14 = -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v6 - v12 * 2.0, v9);
  v16 = v15;
  v18 = v13 + v17;
  layout = self->_layout;
  if (layout != 7 && layout != 9)
  {
    v21 = MEMORY[0x1AF423F90](v14) * 3.0;
    if (v18 < v21)
      v18 = v21;
  }
  if (v11 >= v16)
    v22 = v11;
  else
    v22 = v16;
  v23 = v8 + v22;
  if (v18 >= width)
    v24 = width;
  else
    v24 = v18;
  result.height = v23;
  result.width = v24;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRUMediaControlsModuleMoreButton setNeedsLayout](self, "setNeedsLayout");
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
    -[MRUMediaControlsModuleMoreButton updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaControlsModuleMoreButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)count
{
  return -[MRUMediaControlsModuleBadge count](self->_badge, "count");
}

- (void)setCount:(unint64_t)a3
{
  -[MRUMediaControlsModuleBadge setCount:](self->_badge, "setCount:", a3);
  -[MRUMediaControlsModuleMoreButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaControlsModuleMoreButton updateContentSizeCategory](self, "updateContentSizeCategory");
  }
}

- (void)visualStylingProviderDidChange:(id)a3
{
  -[MRUMediaControlsModuleMoreButton updateVisualStyling](self, "updateVisualStyling", a3);
  -[MRUMediaControlsModuleMoreButton setNeedsLayout](self, "setNeedsLayout");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[MRUMediaControlsModuleMoreButton bounds](self, "bounds", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3B30];
  v8 = (void *)MEMORY[0x1E0DC3508];
  -[MRUMediaControlsModuleMoreButton bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
  objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shapeWithPath:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
}

- (void)updateContentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterMoreButtonTitleFontWithScale:", self->_contentScale);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v4, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v3);

}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MRUMediaControlsModuleBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
