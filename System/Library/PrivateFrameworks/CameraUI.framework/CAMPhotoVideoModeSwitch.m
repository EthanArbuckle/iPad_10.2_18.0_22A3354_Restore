@implementation CAMPhotoVideoModeSwitch

- (CAMPhotoVideoModeSwitch)initWithFrame:(CGRect)a3
{
  CAMPhotoVideoModeSwitch *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImageView *photoImageView;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  UIImageView *videoImageView;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  UIView *v29;
  UIView *contentView;
  CALayer *v31;
  CALayer *trackLayer;
  id v33;
  id v34;
  CALayer *v35;
  CALayer *knobLayer;
  id v37;
  void *v38;
  void *v39;
  CEKAdditiveAnimator *v40;
  CEKAdditiveAnimator *animator;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CAMPhotoVideoModeSwitch;
  v3 = -[CAMPhotoVideoModeSwitch initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("camera.fill"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    photoImageView = v3->__photoImageView;
    v3->__photoImageView = (UIImageView *)v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[UIImageView layer](v3->__photoImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->__photoImageView, "setTintColor:", v11);

    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIImageView layer](v3->__photoImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    -[UIImageView layer](v3->__photoImageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 2.0);

    -[UIImageView layer](v3->__photoImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1051931443;
    objc_msgSend(v16, "setShadowOpacity:", v17);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("video.fill"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
    videoImageView = v3->__videoImageView;
    v3->__videoImageView = (UIImageView *)v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    -[UIImageView layer](v3->__videoImageView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShadowColor:", v22);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->__videoImageView, "setTintColor:", v24);

    -[UIImageView layer](v3->__videoImageView, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowOffset:", v12, v13);

    -[UIImageView layer](v3->__videoImageView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowRadius:", 2.0);

    -[UIImageView layer](v3->__videoImageView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1051931443;
    objc_msgSend(v27, "setShadowOpacity:", v28);

    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v3->__contentView;
    v3->__contentView = v29;

    -[CAMPhotoVideoModeSwitch addSubview:](v3, "addSubview:", v3->__contentView);
    -[UIView addSubview:](v3->__contentView, "addSubview:", v3->__photoImageView);
    -[UIView addSubview:](v3->__contentView, "addSubview:", v3->__videoImageView);
    v31 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    trackLayer = v3->__trackLayer;
    v3->__trackLayer = v31;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.11);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](v3->__trackLayer, "setBorderColor:", objc_msgSend(v33, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.11);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v3->__trackLayer, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

    -[CAMPhotoVideoModeSwitch _trackBorder](v3, "_trackBorder");
    -[CALayer setBorderWidth:](v3->__trackLayer, "setBorderWidth:");
    v35 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    knobLayer = v3->__knobLayer;
    v3->__knobLayer = v35;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v3->__knobLayer, "setBackgroundColor:", objc_msgSend(v37, "CGColor"));

    -[UIView layer](v3->__contentView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSublayer:", v3->__trackLayer);

    -[UIView layer](v3->__contentView, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSublayer:", v3->__knobLayer);

    -[UIView setUserInteractionEnabled:](v3->__contentView, "setUserInteractionEnabled:", 0);
    v3->_mode = 0;
    v40 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x1E0D0D000]);
    animator = v3->__animator;
    v3->__animator = v40;

    -[CEKAdditiveAnimator setDelegate:](v3->__animator, "setDelegate:", v3);
    -[CAMPhotoVideoModeSwitch _animator](v3, "_animator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPhotoVideoModeSwitch _knobXPosition](v3, "_knobXPosition");
    objc_msgSend(v42, "setValue:forKey:", CFSTR("CAMAnimatorKnobPositionKey"));

    -[CAMPhotoVideoModeSwitch _animator](v3, "_animator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPhotoVideoModeSwitch _knobWidth](v3, "_knobWidth");
    objc_msgSend(v43, "setValue:forKey:", CFSTR("CAMAnimatorKnobWidthKey"));

    -[CAMPhotoVideoModeSwitch addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__touchStart_, 17);
    -[CAMPhotoVideoModeSwitch addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__touchCommit_, 64);
    -[CAMPhotoVideoModeSwitch addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__touchCancel_, 416);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", v3, sel__swipe_);
    objc_msgSend(v44, "setDirection:", 2);
    -[CAMPhotoVideoModeSwitch addGestureRecognizer:](v3, "addGestureRecognizer:", v44);
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", v3, sel__swipe_);
    objc_msgSend(v45, "setDirection:", 1);
    -[CAMPhotoVideoModeSwitch addGestureRecognizer:](v3, "addGestureRecognizer:", v45);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CAMPhotoVideoModeSwitch;
  -[CAMPhotoVideoModeSwitch layoutSubviews](&v43, sel_layoutSubviews);
  -[CAMPhotoVideoModeSwitch _photoImageView](self, "_photoImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CAMViewAlignmentSize(v3);
  v6 = v5;

  -[CAMPhotoVideoModeSwitch _photoImageView](self, "_photoImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  -[CAMPhotoVideoModeSwitch _videoImageView](self, "_videoImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CAMViewAlignmentSize(v8);
  v11 = v10;

  -[CAMPhotoVideoModeSwitch _contentView](self, "_contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13 - v9;
  -[CAMPhotoVideoModeSwitch _videoImageView](self, "_videoImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v14, v6 - v11, v9, v11);

  -[CAMPhotoVideoModeSwitch bounds](self, "bounds");
  UIRectGetCenter();
  v17 = v16;
  v19 = v18;
  -[CAMPhotoVideoModeSwitch _contentView](self, "_contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", v17, v19);

  -[CAMPhotoVideoModeSwitch bounds](self, "bounds");
  v22 = v21;
  v23 = v6 + 6.0 + 12.0;
  -[CAMPhotoVideoModeSwitch _contentView](self, "_contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBounds:", 0.0, 0.0, v22, v23);

  -[CAMPhotoVideoModeSwitch _trackLayer](self, "_trackLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", 0.0, v23 + -12.0, v22, 12.0);

  -[CAMPhotoVideoModeSwitch knobFrame](self, "knobFrame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CAMPhotoVideoModeSwitch _knobLayer](self, "_knobLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  -[CAMPhotoVideoModeSwitch _trackLayer](self, "_trackLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36 * 0.5;
  -[CAMPhotoVideoModeSwitch _trackLayer](self, "_trackLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCornerRadius:", v37);

  -[CAMPhotoVideoModeSwitch _knobLayer](self, "_knobLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = v40 * 0.5;
  -[CAMPhotoVideoModeSwitch _knobLayer](self, "_knobLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setCornerRadius:", v41);

}

- (CGRect)knobFrame
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
  CGRect result;

  -[CAMPhotoVideoModeSwitch _contentView](self, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CAMPhotoVideoModeSwitch _trackBorder](self, "_trackBorder");
  v7 = v6;
  -[CAMPhotoVideoModeSwitch _knobWidth](self, "_knobWidth");
  v9 = v8;
  -[CAMPhotoVideoModeSwitch _knobXPosition](self, "_knobXPosition");
  v11 = v7 + v5 + -12.0;
  v12 = v7 * -2.0 + 12.0;
  v13 = v9;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)_knobXPosition
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double result;

  -[CAMPhotoVideoModeSwitch _contentView](self, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CAMPhotoVideoModeSwitch _trackBorder](self, "_trackBorder");
  v7 = v6;
  -[CAMPhotoVideoModeSwitch _knobWidth](self, "_knobWidth");
  v9 = v8;
  v10 = -[CAMPhotoVideoModeSwitch mode](self, "mode");
  result = 0.0;
  if (!v10)
    result = v7;
  if (v10 == 1)
    return v5 - v9 - v7;
  return result;
}

- (double)_trackBorder
{
  return CAMPixelWidthForView(self) * 3.0;
}

- (double)_knobWidth
{
  _BOOL4 v2;
  double result;

  v2 = -[CAMPhotoVideoModeSwitch _isTouching](self, "_isTouching");
  result = 24.000001;
  if (!v2)
    return 20.0;
  return result;
}

- (void)_touchStart:(id)a3
{
  -[CAMPhotoVideoModeSwitch set_isTouching:](self, "set_isTouching:", 1);
  -[CAMPhotoVideoModeSwitch _updateKnobFrameAnimated:](self, "_updateKnobFrameAnimated:", 1);
}

- (void)_touchCancel:(id)a3
{
  -[CAMPhotoVideoModeSwitch set_isTouching:](self, "set_isTouching:", 0);
  -[CAMPhotoVideoModeSwitch _updateKnobFrameAnimated:](self, "_updateKnobFrameAnimated:", 1);
}

- (void)_touchCommit:(id)a3
{
  -[CAMPhotoVideoModeSwitch set_isTouching:](self, "set_isTouching:", 0);
  -[CAMPhotoVideoModeSwitch toggleModeAnimated:](self, "toggleModeAnimated:", 1);
}

- (void)_swipe:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "direction") == 2 || objc_msgSend(v4, "direction") == 1)
    -[CAMPhotoVideoModeSwitch toggleModeAnimated:](self, "toggleModeAnimated:", 1);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMPhotoVideoModeSwitch setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", self);
  }
}

- (void)setMode:(unint64_t)a3
{
  -[CAMPhotoVideoModeSwitch setMode:animated:](self, "setMode:animated:", a3, 0);
}

- (void)setMode:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[CAMPhotoVideoModeSwitch _updateKnobFrameAnimated:](self, "_updateKnobFrameAnimated:", a4);
  }
}

- (void)toggleModeAnimated:(BOOL)a3
{
  -[CAMPhotoVideoModeSwitch setMode:animated:](self, "setMode:animated:", -[CAMPhotoVideoModeSwitch mode](self, "mode", a3) == 0, 1);
  -[CAMPhotoVideoModeSwitch sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4
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
  id v15;

  v5 = a3;
  -[CAMPhotoVideoModeSwitch _knobLayer](self, "_knobLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "valueForKey:", CFSTR("CAMAnimatorKnobPositionKey"));
  UIRoundToViewScale();
  v12 = v11;
  objc_msgSend(v5, "valueForKey:", CFSTR("CAMAnimatorKnobWidthKey"));

  UIRoundToViewScale();
  v14 = v13;
  -[CAMPhotoVideoModeSwitch _knobLayer](self, "_knobLayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v12, v8, v14, v10);

}

- (void)_updateKnobFrameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CAMPhotoVideoModeSwitch _animator](self, "_animator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPhotoVideoModeSwitch _knobXPosition](self, "_knobXPosition");
  if (v3)
  {
    objc_msgSend(v5, "setValue:forKey:duration:timingCurve:", CFSTR("CAMAnimatorKnobPositionKey"), 0);

    -[CAMPhotoVideoModeSwitch _animator](self, "_animator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMPhotoVideoModeSwitch _knobWidth](self, "_knobWidth");
    objc_msgSend(v7, "setValue:forKey:duration:timingCurve:", CFSTR("CAMAnimatorKnobWidthKey"), 0);

  }
  else
  {
    objc_msgSend(v5, "setValue:forKey:", CFSTR("CAMAnimatorKnobPositionKey"));

    -[CAMPhotoVideoModeSwitch _animator](self, "_animator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPhotoVideoModeSwitch _knobWidth](self, "_knobWidth");
    objc_msgSend(v6, "setValue:forKey:", CFSTR("CAMAnimatorKnobWidthKey"));

    -[CAMPhotoVideoModeSwitch setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_photoImageView
{
  return self->__photoImageView;
}

- (UIImageView)_videoImageView
{
  return self->__videoImageView;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (CALayer)_trackLayer
{
  return self->__trackLayer;
}

- (void)set_trackLayer:(id)a3
{
  objc_storeStrong((id *)&self->__trackLayer, a3);
}

- (CALayer)_knobLayer
{
  return self->__knobLayer;
}

- (void)set_knobLayer:(id)a3
{
  objc_storeStrong((id *)&self->__knobLayer, a3);
}

- (BOOL)_isTouching
{
  return self->__isTouching;
}

- (void)set_isTouching:(BOOL)a3
{
  self->__isTouching = a3;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (void)set_animator:(id)a3
{
  objc_storeStrong((id *)&self->__animator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__knobLayer, 0);
  objc_storeStrong((id *)&self->__trackLayer, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__videoImageView, 0);
  objc_storeStrong((id *)&self->__photoImageView, 0);
}

@end
