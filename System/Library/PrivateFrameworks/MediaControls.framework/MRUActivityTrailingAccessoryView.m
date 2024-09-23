@implementation MRUActivityTrailingAccessoryView

- (MRUActivityTrailingAccessoryView)initWithSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  MRUActivityTrailingAccessoryView *v8;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v6, "setContentMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 16.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSymbolConfiguration:", v7);

  v8 = -[MRUActivityAccessoryView initWithContentView:size:](self, "initWithContentView:size:", v6, width, height);
  -[MRUActivityTrailingAccessoryView setImageView:](v8, "setImageView:", v6);

  return v8;
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
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)MRUActivityTrailingAccessoryView;
  -[MRUActivityAccessoryView layoutSubviews](&v27, sel_layoutSubviews);
  -[MRUActivityTrailingAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUActivityAccessoryView contentInsets](self, "contentInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[MRUActivityAccessoryView contentOffset](self, "contentOffset");
  v20 = v19;
  -[MRUActivityAccessoryView contentOffset](self, "contentOffset");
  v22 = v21;
  v28.origin.x = v12;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  v29 = CGRectOffset(v28, v20, v22);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  -[MRUWaveformView setFrame:](self->_waveformView, "setFrame:");
  -[MRUHapticView setFrame:](self->_hapticView, "setFrame:", x, y, width, height);
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
    -[MRUActivityTrailingAccessoryView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
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

  -[MRUActivityTrailingAccessoryView addSubview:](self, "addSubview:", v6);
  -[MRUActivityTrailingAccessoryView setNeedsLayout](self, "setNeedsLayout");
  -[MRUActivityTrailingAccessoryView updateVisibilty](self, "updateVisibilty");
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

  -[MRUActivityTrailingAccessoryView addSubview:](self, "addSubview:", v6);
  -[MRUActivityTrailingAccessoryView setNeedsLayout](self, "setNeedsLayout");
  -[MRUActivityTrailingAccessoryView updateVisibilty](self, "updateVisibilty");
}

- (void)setShowWaveform:(BOOL)a3
{
  if (self->_showWaveform != a3)
  {
    self->_showWaveform = a3;
    -[MRUActivityTrailingAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[MRUActivityTrailingAccessoryView updateVisibilty](self, "updateVisibilty");
  }
}

- (void)setShowHaptic:(BOOL)a3
{
  if (self->_showHaptic != a3)
  {
    self->_showHaptic = a3;
    -[MRUActivityTrailingAccessoryView setNeedsLayout](self, "setNeedsLayout");
    -[MRUActivityTrailingAccessoryView updateVisibilty](self, "updateVisibilty");
  }
}

- (UIImage)routeImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setRouteImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_imageView);
}

- (void)updateVisibilty
{
  _BOOL8 v3;
  double v4;
  double v5;

  v3 = self->_showWaveform || self->_showHaptic;
  -[UIImageView setHidden:](self->_imageView, "setHidden:", v3);
  v4 = 0.0;
  if (self->_showWaveform && !self->_showHaptic)
    v4 = 1.0;
  -[MRUWaveformView setAlpha:](self->_waveformView, "setAlpha:", v4);
  v5 = 1.0;
  if (!self->_showHaptic)
    v5 = 0.0;
  -[MRUHapticView setAlpha:](self->_hapticView, "setAlpha:", v5);
}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (MRUHapticView)hapticView
{
  return self->_hapticView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showWaveform
{
  return self->_showWaveform;
}

- (BOOL)showHaptic
{
  return self->_showHaptic;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_hapticView, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
}

@end
