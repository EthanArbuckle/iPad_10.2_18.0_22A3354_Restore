@implementation MRUControlCenterButton

- (MRUControlCenterButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUControlCenterButton *v7;
  UIView *v8;
  UIView *contentView;
  uint64_t v10;
  UIView *backgroundView;
  UIImageView *v12;
  UIImageView *imageView;
  void *v14;
  uint64_t v15;
  UILabel *titleLabel;
  void *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)MRUControlCenterButton;
  v7 = -[MRUControlCenterButton initWithFrame:](&v20, sel_initWithFrame_);
  if (v7)
  {
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v7->_contentView;
    v7->_contentView = v8;

    -[UIView setUserInteractionEnabled:](v7->_contentView, "setUserInteractionEnabled:", 0);
    -[MRUControlCenterButton addSubview:](v7, "addSubview:", v7->_contentView);
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterDarkMaterial");
    v10 = objc_claimAutoreleasedReturnValue();
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = (UIView *)v10;

    -[UIView addSubview:](v7->_contentView, "addSubview:", v7->_backgroundView);
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v7->_imageView;
    v7->_imageView = v12;

    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 17.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v7->_imageView, "setPreferredSymbolConfiguration:", v14);

    -[UIView addSubview:](v7->_contentView, "addSubview:", v7->_imageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v15;

    -[UILabel setNumberOfLines:](v7->_titleLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](v7->_titleLabel, "setTextAlignment:", 1);
    -[MRUControlCenterButton addSubview:](v7, "addSubview:", v7->_titleLabel);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
    -[MRUControlCenterButton addInteraction:](v7, "addInteraction:", v17);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUControlCenterButton updateContentSizeCategory](v7, "updateContentSizeCategory");
  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24.receiver = self;
  v24.super_class = (Class)MRUControlCenterButton;
  -[MRUControlCenterButton layoutSubviews](&v24, sel_layoutSubviews);
  -[MRUControlCenterButton bounds](self, "bounds");
  -[MRUControlCenterButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;
  v23 = v4;

  v20 = v5;
  UIRectCenteredXInRectScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView setFrame:](self->_contentView, "setFrame:", v20);
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  CGRectGetHeight(v25);
  UIRectInset();
  v21 = v14;
  v22 = v15;
  v17 = v16;
  v19 = v18;
  -[UIView bounds](self->_contentView, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", CGRectGetHeight(v26) * 0.5);
  -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v11, v13);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CGRectGetHeight(v27);
  -[UIView bounds](self->_contentView, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v23);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v17, v19);
  MRUSizeCeilToViewScale(self);
  v28.origin.x = v21;
  v28.origin.y = v22;
  v28.size.width = v17;
  v28.size.height = v19;
  CGRectGetMinY(v28);
  UIRectCenteredXInRectScale();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height - (10.0 + 54.0));
  v4 = MRUSizeCeilToViewScale(self);
  v6 = 10.0 + 54.0 + v5;
  if (v4 < 54.0)
    v4 = 54.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[MRUControlCenterButton setNeedsLayout](self, "setNeedsLayout");
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
    -[MRUControlCenterButton updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRUControlCenterButton;
  -[MRUControlCenterButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 0.2;
  if (!v3)
    v5 = 1.0;
  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v5);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_contentView, "frame", a4);
  v12.origin.x = v6 + -24.0;
  v12.origin.y = v7 + -24.0;
  v12.size.width = v8 - (-24.0 + -24.0);
  v12.size.height = v9 - (-24.0 + -24.0);
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(v12, v11);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;

  v5 = (void *)MEMORY[0x1E0DC3B28];
  -[UIView frame](self->_contentView, "frame", a3, a4, a5);
  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self->_contentView);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3B30];
  v8 = (void *)MEMORY[0x1E0DC3508];
  -[UIView bounds](self->_contentView, "bounds");
  objc_msgSend(v8, "bezierPathWithOvalInRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shapeWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleLabel);
}

- (void)updateContentSizeCategory
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_buttonFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
