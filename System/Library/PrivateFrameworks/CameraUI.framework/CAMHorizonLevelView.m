@implementation CAMHorizonLevelView

- (CAMHorizonLevelView)initWithViewModel:(id)a3
{
  id v5;
  CAMHorizonLevelView *v6;
  CAMHorizonLevelView *v7;
  void *v8;
  int v9;
  CAMFeedbackController *v10;
  CAMFeedbackController *feedbackController;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImageView *horizonLineView;
  uint64_t v24;
  UIImageView *referenceLineLeft;
  uint64_t v26;
  UIImageView *referenceLineRight;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CAMHorizonLevelView;
  v6 = -[CAMHorizonLevelView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[CAMObservable registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, 0);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowHaptics");

    if (v9)
    {
      v10 = objc_alloc_init(CAMFeedbackController);
      feedbackController = v7->__feedbackController;
      v7->__feedbackController = v10;

    }
    -[CAMHorizonLevelView _shadowWidth](v7, "_shadowWidth");
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMHorizonLevelView _createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:](v7, "_createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:", v14, 2, 1.0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMHorizonLevelView _createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:](v7, "_createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:", v16, 8, 1.0, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMHorizonLevelView _createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:](v7, "_createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:", v18, 0, 1.0, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMHorizonLevelView _createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:](v7, "_createStrechableLineImage:lineHeight:shadowWidth:shadowHorizontalEdges:", v20, 10, 1.0, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v21, v19);
    horizonLineView = v7->__horizonLineView;
    v7->__horizonLineView = (UIImageView *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v21, v15);
    referenceLineLeft = v7->__referenceLineLeft;
    v7->__referenceLineLeft = (UIImageView *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v21, v17);
    referenceLineRight = v7->__referenceLineRight;
    v7->__referenceLineRight = (UIImageView *)v26;

    -[CAMHorizonLevelView addSubview:](v7, "addSubview:", v7->__horizonLineView);
    -[CAMHorizonLevelView addSubview:](v7, "addSubview:", v7->__referenceLineLeft);
    -[CAMHorizonLevelView addSubview:](v7, "addSubview:", v7->__referenceLineRight);

  }
  return v7;
}

- (void)_drawHorizonLineInContext:(CGContext *)a3 withBounds:(CGRect)a4 color:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(a5), "CGColor"));
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGContextFillRect(a3, v10);
}

- (id)_createStrechableLineImage:(id)a3 lineHeight:(double)a4 shadowWidth:(double)a5 shadowHorizontalEdges:(unint64_t)a6
{
  char v6;
  id v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  CGContextRef CurrentContext;
  void *v29;
  void *v30;
  CGSize v32;

  v6 = a6;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = 3.0;
  v15 = 0.0;
  if ((v6 & 8) != 0)
    v15 = a5;
  if ((v6 & 2) != 0)
    v14 = a5 + 3.0;
  v16 = v14 + v15;
  v17 = a4 + a5 + a5;
  UIRectInsetEdges();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v32.width = v16;
  v32.height = v17;
  UIGraphicsBeginImageContextWithOptions(v32, 0, v13);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CAMHorizonLevelView _drawHorizonLineInContext:withBounds:color:](self, "_drawHorizonLineInContext:withBounds:color:", CurrentContext, v26, 0.0, 0.0, v16, v17);
  -[CAMHorizonLevelView _drawHorizonLineInContext:withBounds:color:](self, "_drawHorizonLineInContext:withBounds:color:", CurrentContext, v27, v19, v21, v23, v25);

  UIGraphicsGetImageFromCurrentImageContext();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v29, "resizableImageWithCapInsets:", 0.0, a5 + 1.0, 0.0, a5 + 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void)layoutSubviews
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)CAMHorizonLevelView;
  -[CAMHorizonLevelView layoutSubviews](&v16, sel_layoutSubviews);
  -[CAMHorizonLevelView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentIndicatorMode");
  objc_msgSend(v3, "currentIndicatorRotationAngle");
  v6 = v5;
  -[CAMHorizonLevelView bounds](self, "bounds");
  UIRectGetCenter();
  -[CAMHorizonLevelView _shadowWidth](self, "_shadowWidth");
  v8 = v7;
  v9 = v7 * 2.0 + 1.0;
  if (v4 >= 3)
  {
    if (v4 == 3)
    {
      -[CAMHorizonLevelView bounds](self, "bounds", 0.0);
      CGRectGetHeight(v18);
    }
  }
  else
  {
    -[CAMHorizonLevelView bounds](self, "bounds");
    CGRectGetWidth(v17);
  }
  UIRoundToViewScale();
  v11 = v10;
  UIRoundToViewScale();
  v13 = v8 * 2.0 + 22.0;
  if (v6 == 0.0)
    v14 = v12 + v13 * -2.0;
  else
    v14 = v11 + (2.0 - v8) * -2.0;
  -[CAMHorizonLevelView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");

  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__horizonLineView, "setCenter:");
  -[UIImageView setBounds:](self->__horizonLineView, "setBounds:", 0.0, 0.0, v14, v9);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__referenceLineLeft, "setCenter:");
  -[UIImageView setBounds:](self->__referenceLineLeft, "setBounds:", 0.0, 0.0, v13, v9);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  -[UIImageView setCenter:](self->__referenceLineRight, "setCenter:");
  -[UIImageView setBounds:](self->__referenceLineRight, "setBounds:", 0.0, 0.0, v13, v9);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[CAMHorizonLevelView _layoutLineViewsWithMode:rotationAngle:](self, "_layoutLineViewsWithMode:rotationAngle:", v4, v6);
  objc_msgSend(v3, "currentIndicatorAlpha");
  -[CAMHorizonLevelView _updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:](self, "_updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:", v4);

}

- (void)_layoutLineViewsWithMode:(int64_t)a3 rotationAngle:(double)a4
{
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  -[CAMHorizonLevelView _horizonLineView](self, "_horizonLineView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    CGAffineTransformMakeRotation(&v11, 0.0);
    v10 = v11;
    -[CAMHorizonLevelView setTransform:](self, "setTransform:", &v10);
  }
  else if (a3 == 3)
  {
    CGAffineTransformMakeRotation(&v13, 1.57079633);
    v12 = v13;
    -[CAMHorizonLevelView setTransform:](self, "setTransform:", &v12);
    a4 = -a4;
  }
  CGAffineTransformMakeRotation(&v9, a4);
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

- (void)_updateSubViewsAlphaWithAlpha:(double)a3 indicatorMode:(int64_t)a4 rotationAngle:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
    a3 = 0.0;
  -[CAMHorizonLevelView _horizonLineView](self, "_horizonLineView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", a3);

  -[CAMHorizonLevelView _referenceLineLeft](self, "_referenceLineLeft");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", a3);

  -[CAMHorizonLevelView _referenceLineRight](self, "_referenceLineRight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", a3);

  -[CAMHorizonLevelView _horizonLineView](self, "_horizonLineView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighlighted:", a5 == 0.0);

  -[CAMHorizonLevelView _referenceLineLeft](self, "_referenceLineLeft");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlighted:", a5 == 0.0);

  -[CAMHorizonLevelView _referenceLineRight](self, "_referenceLineRight");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHighlighted:", a5 == 0.0);

}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  char v5;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  if (!a5)
  {
    v5 = a4;
    v7 = a3;
    objc_msgSend(v7, "currentIndicatorAlpha");
    v9 = v8;
    v10 = objc_msgSend(v7, "currentIndicatorMode");
    objc_msgSend(v7, "currentIndicatorRotationAngle");
    v12 = v11;

    if ((v5 & 0x10) != 0)
    {
      if (fabs(v12) <= 0.08)
      {
        -[CAMHorizonLevelView delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "horizonLevelViewCanPlayHaptics:", self);

        if (v14)
        {
          -[CAMHorizonLevelView _feedbackController](self, "_feedbackController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "prepareDiscreteFeedback:", 1);

          if (v12 == 0.0)
          {
            -[CAMHorizonLevelView _feedbackController](self, "_feedbackController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "performDiscreteFeedback:", 1);

          }
        }
      }
    }
    else if ((v5 & 1) == 0)
    {
      if ((v5 & 4) == 0)
        return;
LABEL_11:
      -[CAMHorizonLevelView _updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:](self, "_updateSubViewsAlphaWithAlpha:indicatorMode:rotationAngle:", v10, v9, v12);
      return;
    }
    -[CAMHorizonLevelView setNeedsLayout](self, "setNeedsLayout");
    if ((v5 & 4) != 0)
      goto LABEL_11;
  }
}

- (CAMLevelViewModel)viewModel
{
  return self->_viewModel;
}

- (CAMHorizonLevelViewDelegate)delegate
{
  return (CAMHorizonLevelViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)_horizonLineView
{
  return self->__horizonLineView;
}

- (void)set_horizonLineView:(id)a3
{
  objc_storeStrong((id *)&self->__horizonLineView, a3);
}

- (UIImageView)_referenceLineLeft
{
  return self->__referenceLineLeft;
}

- (void)set_referenceLineLeft:(id)a3
{
  objc_storeStrong((id *)&self->__referenceLineLeft, a3);
}

- (UIImageView)_referenceLineRight
{
  return self->__referenceLineRight;
}

- (void)set_referenceLineRight:(id)a3
{
  objc_storeStrong((id *)&self->__referenceLineRight, a3);
}

- (CAMFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__referenceLineRight, 0);
  objc_storeStrong((id *)&self->__referenceLineLeft, 0);
  objc_storeStrong((id *)&self->__horizonLineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
