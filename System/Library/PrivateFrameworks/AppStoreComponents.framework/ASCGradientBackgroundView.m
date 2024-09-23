@implementation ASCGradientBackgroundView

+ (double)gradientPercentageOfBounds
{
  return 0.65;
}

- (ASCGradientBackgroundView)initWithFrame:(CGRect)a3
{
  ASCGradientBackgroundView *v3;
  ASCGradientBackgroundView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIView *gradientOverlayView;
  uint64_t v9;
  CAGradientLayer *gradientLayer;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  objc_super v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)ASCGradientBackgroundView;
  v3 = -[ASCGradientBackgroundView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCGradientBackgroundView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCGradientBackgroundView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    gradientOverlayView = v4->_gradientOverlayView;
    v4->_gradientOverlayView = (UIView *)v7;

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorWithAlphaComponent:", 0.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[0] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.63);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[1] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.75);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[2] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorWithAlphaComponent:", 0.75);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[3] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v4->_gradientLayer, "setColors:", v18);

    -[CAGradientLayer setLocations:](v4->_gradientLayer, "setLocations:", &unk_1E757A718);
    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.0, 0.0);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 0.0, 1.0);
    -[UIView layer](v4->_gradientOverlayView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v4->_gradientLayer);

    -[ASCGradientBackgroundView addSubview:](v4, "addSubview:", v4->_gradientOverlayView);
  }
  return v4;
}

- (ASCGradientBackgroundView)initWithCoder:(id)a3
{
  -[ASCGradientBackgroundView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCGradientBackgroundView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)ASCGradientBackgroundView;
  -[ASCGradientBackgroundView layoutSubviews](&v21, sel_layoutSubviews);
  -[ASCGradientBackgroundView bounds](self, "bounds");
  v4 = v3;
  +[ASCGradientBackgroundView gradientPercentageOfBounds](ASCGradientBackgroundView, "gradientPercentageOfBounds");
  v6 = v4 * v5;
  -[ASCGradientBackgroundView bounds](self, "bounds");
  v7 = CGRectGetMaxY(v22) - v6;
  -[ASCGradientBackgroundView bounds](self, "bounds");
  v9 = v8;
  -[ASCGradientBackgroundView gradientOverlayView](self, "gradientOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, v7, v9, v6);

  -[ASCGradientBackgroundView gradientOverlayView](self, "gradientOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[ASCGradientBackgroundView gradientLayer](self, "gradientLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (UIView)gradientOverlayView
{
  return self->_gradientOverlayView;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientOverlayView, 0);
}

@end
