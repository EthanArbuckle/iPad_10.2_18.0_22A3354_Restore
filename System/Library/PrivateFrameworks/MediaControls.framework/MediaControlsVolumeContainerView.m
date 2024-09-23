@implementation MediaControlsVolumeContainerView

- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MediaControlsVolumeSlider *v8;
  MediaControlsVolumeContainerView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[MPVolumeSlider initWithFrame:]([MediaControlsVolumeSlider alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = -[MediaControlsVolumeContainerView initWithFrame:slider:](self, "initWithFrame:slider:", v8, x, y, width, height);

  return v9;
}

- (MediaControlsVolumeContainerView)initWithFrame:(CGRect)a3 slider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MediaControlsVolumeContainerView *v10;
  MediaControlsVolumeContainerView *v11;
  MediaControlsRelativeVolumeStepper *v12;
  MediaControlsRelativeVolumeStepper *volumeStepper;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MediaControlsVolumeContainerView;
  v10 = -[MediaControlsVolumeContainerView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[MediaControlsVolumeContainerView setVolumeSlider:](v10, "setVolumeSlider:", v9);
    -[MediaControlsVolumeContainerView addSubview:](v11, "addSubview:", v11->_volumeSlider);
    v12 = -[MediaControlsRelativeVolumeStepper initWithFrame:]([MediaControlsRelativeVolumeStepper alloc], "initWithFrame:", x, y, width, height);
    volumeStepper = v11->_volumeStepper;
    v11->_volumeStepper = v12;

    objc_msgSend(v9, "volumeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsRelativeVolumeStepper setVolumeController:](v11->_volumeStepper, "setVolumeController:", v14);

    -[MediaControlsRelativeVolumeStepper setHidden:](v11->_volumeStepper, "setHidden:", 1);
    -[MediaControlsVolumeContainerView addSubview:](v11, "addSubview:", v11->_volumeStepper);
    -[MediaControlsVolumeSlider layoutIfNeeded](v11->_volumeSlider, "layoutIfNeeded");
    -[MediaControlsVolumeContainerView _updateVolumeStyle](v11, "_updateVolumeStyle");
    -[MediaControlsVolumeContainerView _updateVolumeCapabilities](v11, "_updateVolumeCapabilities");
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CC22D0], 0);

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsVolumeContainerView;
  -[MediaControlsVolumeContainerView dealloc](&v4, sel_dealloc);
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
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MediaControlsVolumeContainerView;
  -[MediaControlsVolumeContainerView layoutSubviews](&v15, sel_layoutSubviews);
  -[MediaControlsVolumeContainerView bounds](self, "bounds");
  -[MediaControlsRelativeVolumeStepper setFrame:](self->_volumeStepper, "setFrame:");
  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsVolumeContainerView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);

  -[MediaControlsVolumeContainerView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (void)setVolumeSlider:(id)a3
{
  MediaControlsVolumeSlider *v4;
  void *v5;
  uint64_t v6;
  MediaControlsVolumeSlider *volumeSlider;
  MediaControlsVolumeSlider *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (MediaControlsVolumeSlider *)a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CC22D0];
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CC22D0], 0);

  volumeSlider = self->_volumeSlider;
  self->_volumeSlider = v4;
  v8 = v4;

  -[MPVolumeSlider volumeController](v8, "volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsRelativeVolumeStepper setVolumeController:](self->_volumeStepper, "setVolumeController:", v9);

  -[MediaControlsVolumeSlider setVisualStylingProvider:](self->_volumeSlider, "setVisualStylingProvider:", self->_visualStylingProvider);
  +[MediaControlsTheme volumeMinImage](MediaControlsTheme, "volumeMinImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsVolumeSlider setMinimumValueImage:](self->_volumeSlider, "setMinimumValueImage:", v10);

  +[MediaControlsTheme volumeMaxImage](MediaControlsTheme, "volumeMaxImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsVolumeSlider setMaximumValueImage:](self->_volumeSlider, "setMaximumValueImage:", v11);

  -[MediaControlsVolumeSlider _minValueView](self->_volumeSlider, "_minValueView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentMode:", 4);

  -[MediaControlsVolumeSlider _maxValueView](self->_volumeSlider, "_maxValueView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentMode:", 4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__updateVolumeCapabilities, v6, v8);

}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsVolumeContainerView _updateVolumeStyle](self, "_updateVolumeStyle");
    -[MediaControlsVolumeContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsVolumeContainerView;
  -[MediaControlsVolumeContainerView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[MediaControlsVolumeContainerView _updateVolumeStyle](self, "_updateVolumeStyle");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsVolumeContainerView;
  -[MediaControlsVolumeContainerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MediaControlsVolumeContainerView _updateVolumeStyle](self, "_updateVolumeStyle");
}

- (void)setTransitioning:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    if (a3)
    {
      -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v4 = 0;
    }
    else
    {
      if (self->_style != 1)
        return;
      -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v4 = 1;
    }
    objc_msgSend(v3, "setHidden:", v4);

  }
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    v3 = !a3;
    -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setIsOffScreen:", v3);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  -[MediaControlsVolumeContainerView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  UIRoundToScale();
  v11 = v10;

  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *v7;
  void *v8;
  MTVisualStylingProvider *v9;
  void *v10;
  MTVisualStylingProvider *v11;

  v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  if (self->_visualStylingProvider != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v7 = *p_visualStylingProvider;
    -[MediaControlsVolumeContainerView volumeStepper](self, "volumeStepper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVisualStylingProvider:", v7);

    v9 = *p_visualStylingProvider;
    -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualStylingProvider:", v9);

    v5 = v11;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGPoint v30;
  CGRect v31;

  v5 = a4;
  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hitRectInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "thumbView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v10 + v17;
  v20 = v8 + v19;
  v22 = v21 - (v10 + v14);
  v24 = v23 - (v8 + v12);

  objc_msgSend(v5, "locationInView:", self);
  v26 = v25;
  v28 = v27;

  v31.origin.x = v18;
  v31.origin.y = v20;
  v31.size.width = v22;
  v31.size.height = v24;
  v30.x = v26;
  v30.y = v28;
  return CGRectContainsPoint(v31, v30);
}

- (void)_updateVolumeStyle
{
  int64_t style;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  style = self->_style;
  -[MediaControlsVolumeContainerView volumeSlider](self, "volumeSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (style == 1)
  {
    objc_msgSend(v4, "setAlpha:", 0.0);

    -[MediaControlsVolumeContainerView volumeStepper](self, "volumeStepper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 1.0);

    -[MediaControlsVolumeContainerView volumeStepper](self, "volumeStepper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

  -[MediaControlsVolumeContainerView _updateVolumeCapabilities](self, "_updateVolumeCapabilities");
}

- (void)_updateVolumeCapabilities
{
  void *v3;
  unsigned int v4;
  MediaControlsVolumeSlider *volumeSlider;
  uint64_t v6;

  -[MPVolumeSlider volumeController](self->_volumeSlider, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "volumeCapabilities");

  if (self->_volumeCapabilities != v4)
  {
    self->_volumeCapabilities = v4;
    if ((v4 & 2) != 0)
    {
      volumeSlider = self->_volumeSlider;
    }
    else
    {
      volumeSlider = self->_volumeSlider;
      if ((v4 & 1) != 0)
      {
        -[MPVolumeSlider setHidden:](volumeSlider, "setHidden:", 1);
        v6 = 0;
LABEL_7:
        -[MediaControlsRelativeVolumeStepper setHidden:](self->_volumeStepper, "setHidden:", v6);
        -[MediaControlsVolumeContainerView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
    }
    -[MPVolumeSlider setHidden:](volumeSlider, "setHidden:", 0);
    v6 = 1;
    goto LABEL_7;
  }
}

- (MediaControlsVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (int64_t)style
{
  return self->_style;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MediaControlsRelativeVolumeStepper)volumeStepper
{
  return self->_volumeStepper;
}

- (void)setVolumeStepper:(id)a3
{
  objc_storeStrong((id *)&self->_volumeStepper, a3);
}

- (unsigned)volumeCapabilities
{
  return self->_volumeCapabilities;
}

- (void)setVolumeCapabilities:(unsigned int)a3
{
  self->_volumeCapabilities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeStepper, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
}

@end
