@implementation CAMLivePhotoStatusIndicator

- (CAMLivePhotoStatusIndicator)initWithFrame:(CGRect)a3
{
  CAMLivePhotoStatusIndicator *v3;
  CAMLivePhotoBloomView *v4;
  CAMLivePhotoBloomView *bloomView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMLivePhotoStatusIndicator;
  v3 = -[CAMControlStatusIndicator initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLivePhotoBloomView);
    bloomView = v3->__bloomView;
    v3->__bloomView = v4;

    -[CAMControlStatusIndicator slashContainerView](v3, "slashContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->__bloomView);

    -[CAMLivePhotoStatusIndicator _updateTintColor](v3, "_updateTintColor");
    -[CAMLivePhotoStatusIndicator setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("StatusBarLivePhotoButton"));
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMLivePhotoStatusIndicator;
  -[CAMControlStatusIndicator layoutSubviews](&v4, sel_layoutSubviews);
  -[CAMLivePhotoStatusIndicator _bloomView](self, "_bloomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  -[CAMLivePhotoStatusIndicator bounds](self, "bounds");
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "setFrame:");

}

- (void)setLivePhotoMode:(int64_t)a3
{
  -[CAMLivePhotoStatusIndicator setLivePhotoMode:animated:](self, "setLivePhotoMode:animated:", a3, 0);
}

- (void)setLivePhotoMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_livePhotoMode != a3)
  {
    v4 = a4;
    self->_livePhotoMode = a3;
    -[CAMLivePhotoStatusIndicator _updateTintColor](self, "_updateTintColor");
    -[CAMLivePhotoStatusIndicator stopAnimating](self, "stopAnimating");
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", v4);
  }
}

- (void)startAnimating
{
  id v2;

  -[CAMLivePhotoStatusIndicator _bloomView](self, "_bloomView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animateBloom");

}

- (void)stopAnimating
{
  id v2;

  -[CAMLivePhotoStatusIndicator _bloomView](self, "_bloomView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (id)imageNameForCurrentState
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 25.0 - CAMPixelWidthForView(self);
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMLivePhotoStatusIndicator livePhotoMode](self, "livePhotoMode") == 1;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMLivePhotoStatusIndicator livePhotoMode](self, "livePhotoMode") == 0;
}

- (id)imageNameForAXHUD
{
  if (-[CAMLivePhotoStatusIndicator shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
    return CFSTR("livephoto.slash");
  else
    return CFSTR("livephoto");
}

- (void)_updateTintColor
{
  id v3;

  if (-[CAMLivePhotoStatusIndicator shouldUseActiveTintForCurrentState](self, "shouldUseActiveTintForCurrentState"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMLivePhotoBloomView setTintColor:](self->__bloomView, "setTintColor:", v3);

}

- (int64_t)livePhotoMode
{
  return self->_livePhotoMode;
}

- (CAMLivePhotoBloomView)_bloomView
{
  return self->__bloomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bloomView, 0);
}

@end
