@implementation _SFDownloadsIconView

- (_SFDownloadsIconView)initWithFrame:(CGRect)a3
{
  _SFDownloadsIconView *v3;
  _SFDownloadsIconView *v4;
  _SFDownloadsIconView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFDownloadsIconView;
  v3 = -[_SFDownloadsIconView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFDownloadsIconView _setUp](v3, "_setUp");
    v5 = v4;
  }

  return v4;
}

- (void)_setUp
{
  UIView *v3;
  UIView *circleContainerView;
  UIImageView *v5;
  UIImageView *circleImageView;
  UIView *v7;
  UIView *arrowContainerView;
  UIImageView *v9;
  UIImageView *arrowImageView;

  self->_iconScale = 1.0;
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  circleContainerView = self->_circleContainerView;
  self->_circleContainerView = v3;

  -[_SFDownloadsIconView addSubview:](self, "addSubview:", self->_circleContainerView);
  v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
  circleImageView = self->_circleImageView;
  self->_circleImageView = v5;

  -[UIImageView setContentMode:](self->_circleImageView, "setContentMode:", 4);
  -[UIView addSubview:](self->_circleContainerView, "addSubview:", self->_circleImageView);
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  arrowContainerView = self->_arrowContainerView;
  self->_arrowContainerView = v7;

  -[_SFDownloadsIconView addSubview:](self, "addSubview:", self->_arrowContainerView);
  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
  arrowImageView = self->_arrowImageView;
  self->_arrowImageView = v9;

  -[UIImageView setContentMode:](self->_arrowImageView, "setContentMode:", 4);
  -[UIView addSubview:](self->_arrowContainerView, "addSubview:", self->_arrowImageView);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_SFDownloadsIconView;
  -[_SFDownloadsIconView layoutSubviews](&v20, sel_layoutSubviews);
  -[UIImageView image](self->_circleImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UIImageView sizeThatFits:](self->_circleImageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
  v7 = v6;
  v9 = v8;
  -[UIView setFrame:](self->_circleContainerView, "setFrame:", 0.0, 0.0, v6, v8);
  -[UIImageView setFrame:](self->_circleImageView, "setFrame:", 0.0, 0.0, v7, v9);
  -[UIImageView image](self->_arrowImageView, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView sizeThatFits:](self->_arrowImageView, "sizeThatFits:", v4, v5);
  v12 = v11;
  v14 = v13;
  _SFRoundFloatToPixels();
  v16 = v15;
  objc_msgSend(v3, "baselineOffsetFromBottom");
  v18 = v9 - v17;
  objc_msgSend(v10, "baselineOffsetFromBottom");
  -[UIView setFrame:](self->_arrowContainerView, "setFrame:", v16, v18 + v19 - v14, v12, v14);
  -[UIImageView setFrame:](self->_arrowImageView, "setFrame:", 0.0, 0.0, v12, v14);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_circleImageView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)pulse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (!self->_pulsing)
  {
    objc_initWeak(&location, self);
    -[_SFDownloadsIconView _setPulsing:](self, "_setPulsing:", 1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v3 = (void *)MEMORY[0x1E0CD28B0];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __29___SFDownloadsIconView_pulse__block_invoke;
    v15 = &unk_1E4ABFF20;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v3, "setCompletionBlock:", &v12);
    -[UIView layer](self->_circleContainerView, "layer", v12, v13, v14, v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadsIconView _makeSpringAnimationWithDelay:offset:](self, "_makeSpringAnimationWithDelay:offset:", 0.135, 3.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("pulse"));

    -[UIImageView layer](self->_circleImageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadsIconView _makeSpringAnimationWithDelay:offset:](self, "_makeSpringAnimationWithDelay:offset:", 0.345, -3.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v7, CFSTR("pulse"));

    -[UIView layer](self->_arrowContainerView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadsIconView _makeSpringAnimationWithDelay:offset:](self, "_makeSpringAnimationWithDelay:offset:", 0.0, 5.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("pulse"));

    -[UIImageView layer](self->_arrowImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDownloadsIconView _makeSpringAnimationWithDelay:offset:](self, "_makeSpringAnimationWithDelay:offset:", 0.215, -5.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("pulse"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_finishedPulsing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_SFDownloadsIconView _setPulsing:](self, "_setPulsing:", 0);
  -[UIView layer](self->_circleContainerView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("pulse"));

  -[UIImageView layer](self->_circleImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("pulse"));

  -[UIView layer](self->_arrowContainerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("pulse"));

  -[UIImageView layer](self->_arrowImageView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("pulse"));

}

- (id)_makeSpringAnimationWithDelay:(double)a3 offset:(double)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyPath:", CFSTR("position.y"));
  objc_msgSend(v5, "setFromValue:", &unk_1E4B25CA8);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  _SFRoundFloatToPixels();
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  objc_msgSend(v5, "setAdditive:", 1);
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 350.0);
  objc_msgSend(v5, "setDamping:", 25.0);
  objc_msgSend(v5, "setDuration:", 0.8);
  objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime() + a3);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  return v5;
}

- (UIImage)arrowImage
{
  return -[UIImageView image](self->_arrowImageView, "image");
}

- (void)setArrowImage:(id)a3
{
  -[UIImageView setImage:](self->_arrowImageView, "setImage:", a3);
}

- (UIImage)circleImage
{
  return -[UIImageView image](self->_circleImageView, "image");
}

- (void)setCircleImage:(id)a3
{
  -[UIImageView setImage:](self->_circleImageView, "setImage:", a3);
  -[_SFDownloadsIconView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)suppressesPixelAlignment
{
  return self->_suppressesPixelAlignment;
}

- (void)setSuppressesPixelAlignment:(BOOL)a3
{
  self->_suppressesPixelAlignment = a3;
  -[_SFDownloadsIconView _updateSuppressesPixelAlignment](self, "_updateSuppressesPixelAlignment");
}

- (void)_updateSuppressesPixelAlignment
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = self->_suppressesPixelAlignment || self->_pulsing;
  -[UIImageView layer](self->_circleImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsAlignsToPixels:", v3 ^ 1);

  -[UIImageView layer](self->_circleImageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v3);

  -[UIImageView layer](self->_arrowImageView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentsAlignsToPixels:", v3 ^ 1);

  -[UIImageView layer](self->_arrowImageView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", v3);

}

- (void)_setPulsing:(BOOL)a3
{
  self->_pulsing = a3;
  -[_SFDownloadsIconView _updateSuppressesPixelAlignment](self, "_updateSuppressesPixelAlignment");
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_arrowContainerView, 0);
  objc_storeStrong((id *)&self->_circleImageView, 0);
  objc_storeStrong((id *)&self->_circleContainerView, 0);
}

@end
