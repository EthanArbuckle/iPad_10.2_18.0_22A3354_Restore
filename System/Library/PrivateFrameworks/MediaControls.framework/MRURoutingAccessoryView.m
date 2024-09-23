@implementation MRURoutingAccessoryView

- (MRURoutingAccessoryView)initWithFrame:(CGRect)a3
{
  MRURoutingAccessoryView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  uint64_t v7;
  UIActivityIndicatorView *activityView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRURoutingAccessoryView;
  v3 = -[MRURoutingAccessoryView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 2, 17.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v6);

    -[MRURoutingAccessoryView addSubview:](v3, "addSubview:", v3->_imageView);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityView = v3->_activityView;
    v3->_activityView = (UIActivityIndicatorView *)v7;

    -[MRURoutingAccessoryView addSubview:](v3, "addSubview:", v3->_activityView);
    -[MRURoutingAccessoryView updateState](v3, "updateState");
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRURoutingAccessoryView;
  -[MRURoutingAccessoryView layoutSubviews](&v11, sel_layoutSubviews);
  -[MRURoutingAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UIActivityIndicatorView setFrame:](self->_activityView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MRURoutingAccessoryView updateState](self, "updateState");
  }
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
    -[MRURoutingAccessoryView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;

  -[MRUVisualStylingProvider colorForStyle:](self->_stylingProvider, "colorForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingAccessoryView activityView](self, "activityView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v3);

  -[MRURoutingAccessoryView updateImageViewVisualStyle](self, "updateImageViewVisualStyle");
}

- (void)updateImageViewVisualStyle
{
  UIImageView *imageView;
  MRUVisualStylingProvider *stylingProvider;
  uint64_t v4;

  switch(self->_state)
  {
    case 0:
    case 2:
      -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.0);
      break;
    case 1:
      imageView = self->_imageView;
      stylingProvider = self->_stylingProvider;
      v4 = 2;
      goto LABEL_3;
    case 3:
    case 4:
      imageView = self->_imageView;
      stylingProvider = self->_stylingProvider;
      v4 = 0;
LABEL_3:
      -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", v4, imageView);
      break;
    default:
      return;
  }
}

- (void)updateState
{
  uint64_t v3;
  void *v4;

  switch(self->_state)
  {
    case 0:
      goto LABEL_7;
    case 1:
      +[MRUAssetsProvider routingAccessoryMultiDeselected](MRUAssetsProvider, "routingAccessoryMultiDeselected");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[UIActivityIndicatorView startAnimating](self->_activityView, "startAnimating");
      break;
    case 3:
      +[MRUAssetsProvider routingAccessorySelected](MRUAssetsProvider, "routingAccessorySelected");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      +[MRUAssetsProvider routingAccessoryMultiSelected](MRUAssetsProvider, "routingAccessoryMultiSelected");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = (void *)v3;
      -[UIImageView setImage:](self->_imageView, "setImage:", v3);

LABEL_7:
      -[UIActivityIndicatorView stopAnimating](self->_activityView, "stopAnimating");
      break;
    default:
      break;
  }
  -[MRURoutingAccessoryView updateImageViewVisualStyle](self, "updateImageViewVisualStyle");
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)state
{
  return self->_state;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end
