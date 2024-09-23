@implementation CAMBurstIndicatorView

- (CAMBurstIndicatorView)initWithLayoutStyle:(int64_t)a3
{
  CAMBurstIndicatorView *v4;
  CAMBurstIndicatorView *v5;
  CAMBurstIndicatorView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMBurstIndicatorView;
  v4 = -[CAMBurstIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMBurstIndicatorView _commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:](v4, "_commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:(int64_t)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *backgroundView;
  UIView *v11;
  void *v12;
  UILabel *v13;
  UILabel *countLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;

  self->_layoutStyle = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v9;

  v11 = self->__backgroundView;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.300000012);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[CAMBurstIndicatorView addSubview:](self, "addSubview:", self->__backgroundView);
  self->__numberOfPhotos = 0;
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  countLabel = self->__countLabel;
  self->__countLabel = v13;

  v15 = self->__countLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setTextAlignment:](self->__countLabel, "setTextAlignment:", 1);
  v17 = self->__countLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[CAMBurstIndicatorView addSubview:](self, "addSubview:", self->__countLabel);
  -[CAMBurstIndicatorView _updateCountLabelWithNumberOfPhotos](self, "_updateCountLabelWithNumberOfPhotos");
  -[CAMBurstIndicatorView _updateAttributes](self, "_updateAttributes");
}

- (void)_updateCountLabelWithNumberOfPhotos
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%03ld"), self->__numberOfPhotos);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->__countLabel, "setText:", v3);

}

- (void)_updateAttributes
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UILabel *countLabel;
  double v10;
  void *v11;
  id v12;

  -[CAMBurstIndicatorView intrinsicContentSize](self, "intrinsicContentSize");
  v4 = v3;
  -[UIView layer](self->__backgroundView, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", floor(v4 * 0.5));
  switch(-[CAMBurstIndicatorView layoutStyle](self, "layoutStyle"))
  {
    case 0:
    case 2:
    case 4:
      -[CAMBurstIndicatorView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContentSizeCategory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMZoomButton fontSizeForContentSize:](CAMZoomButton, "fontSizeForContentSize:", v6);
      v8 = v7;

      countLabel = self->__countLabel;
      v10 = v8;
      goto LABEL_4;
    case 1:
      countLabel = self->__countLabel;
      v10 = 14.0;
LABEL_4:
      +[CAMFont cameraMonospacedFontOfSize:](CAMFont, "cameraMonospacedFontOfSize:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](countLabel, "setFont:", v11);

      break;
    default:
      break;
  }

}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v3 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
  switch(-[CAMBurstIndicatorView layoutStyle](self, "layoutStyle"))
  {
    case 0:
    case 2:
    case 4:
      -[CAMBurstIndicatorView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredContentSizeCategory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", v6);
      v3 = v7;

      goto LABEL_4;
    case 1:
      *(double *)&v3 = 44.0;
LABEL_4:
      v4 = *(double *)&v3;
      break;
    default:
      break;
  }
  v8 = v4;
  v9 = *(double *)&v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
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
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)CAMBurstIndicatorView;
  -[CAMBurstIndicatorView layoutSubviews](&v11, sel_layoutSubviews);
  -[CAMBurstIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->__backgroundView, "setFrame:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  CGRectGetWidth(v12);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectGetHeight(v13);
  UIRectCenteredIntegralRectScale();
  -[UILabel setFrame:](self->__countLabel, "setFrame:", 0);
}

- (CAMBurstIndicatorView)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMBurstIndicatorView initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMBurstIndicatorView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMBurstIndicatorView initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBurstIndicatorView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMBurstIndicatorView _updateAttributes](self, "_updateAttributes");
    -[CAMBurstIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)finishIncrementingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  CAMAnimationDelegate *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[UIView layer](self->__backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacity");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", v10);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v11);

  objc_msgSend(v9, "setDuration:", 0.19);
  v12 = objc_alloc_init(CAMAnimationDelegate);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__CAMBurstIndicatorView_finishIncrementingWithCompletionHandler___block_invoke;
  v14[3] = &unk_1EA32A6A8;
  v15 = v4;
  v13 = v4;
  -[CAMAnimationDelegate setCompletion:](v12, "setCompletion:", v14);
  objc_msgSend(v9, "setDelegate:", v12);
  +[CAMAnimationHelper configurePowerSensitiveAnimation:](CAMAnimationHelper, "configurePowerSensitiveAnimation:", v9);
  objc_msgSend(v5, "addAnimation:forKey:", v9, CFSTR("opacity"));

}

uint64_t __65__CAMBurstIndicatorView_finishIncrementingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)incrementWithCaptureAnimation:(BOOL)a3
{
  int64_t numberOfPhotos;
  int64_t v5;
  int64_t v6;
  _BOOL4 v7;

  numberOfPhotos = self->__numberOfPhotos;
  v5 = 998;
  if (numberOfPhotos < 998)
    v5 = self->__numberOfPhotos;
  v6 = v5 + 1;
  self->__numberOfPhotos = v6;
  if (numberOfPhotos != v6)
  {
    v7 = a3;
    -[CAMBurstIndicatorView _updateCountLabelWithNumberOfPhotos](self, "_updateCountLabelWithNumberOfPhotos");
    if (v7)
      -[CAMBurstIndicatorView _performCaptureAnimation](self, "_performCaptureAnimation");
  }
  return self->__numberOfPhotos;
}

- (void)reset
{
  void *v3;
  id v4;

  -[UIView layer](self->__backgroundView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel layer](self->__countLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");
  objc_msgSend(v3, "removeAllAnimations");
  self->__numberOfPhotos = 0;
  -[CAMBurstIndicatorView _updateCountLabelWithNumberOfPhotos](self, "_updateCountLabelWithNumberOfPhotos");

}

- (void)_performCaptureAnimation
{
  void *v2;
  void *v3;
  id v4;

  -[UIView layer](self->__backgroundView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", &unk_1EA3B1B60);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v3);

  objc_msgSend(v2, "setDuration:", 0.05);
  objc_msgSend(v2, "setAutoreverses:", 1);
  +[CAMAnimationHelper configurePowerSensitiveAnimation:](CAMAnimationHelper, "configurePowerSensitiveAnimation:", v2);
  objc_msgSend(v4, "addAnimation:forKey:", v2, CFSTR("opacity"));

}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMBurstIndicatorView _updateAttributes](self, "_updateAttributes");
    -[CAMBurstIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (UILabel)_countLabel
{
  return self->__countLabel;
}

- (int64_t)_numberOfPhotos
{
  return self->__numberOfPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__countLabel, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
}

@end
