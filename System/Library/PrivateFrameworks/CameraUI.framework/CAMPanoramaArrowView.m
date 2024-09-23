@implementation CAMPanoramaArrowView

- (CAMPanoramaArrowView)initWithFrame:(CGRect)a3
{
  CAMPanoramaArrowView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImageView *arrowHead;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  UIView *arrowTail;
  CAShapeLayer *v18;
  CAShapeLayer *arrowTailPiecesLayer;
  CAShapeLayer *v20;
  id v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CAMPanoramaArrowView;
  v3 = -[CAMPanoramaArrowView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CAMCameraUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("firebreak-PLCameraPanoramaArrowHead_2only_"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    arrowHead = v3->_arrowHead;
    v3->_arrowHead = (UIImageView *)v6;

    -[UIImageView sizeToFit](v3->_arrowHead, "sizeToFit");
    objc_msgSend(v5, "size");
    v9 = v8;
    objc_msgSend(v5, "size");
    v11 = v10;
    -[CAMPanoramaArrowView traitCollection](v3, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v14 = v9 + 20.0 + v13 * 3.0;

    -[CAMPanoramaArrowView setFrame:](v3, "setFrame:", 0.0, 0.0, v14, v11);
    v15 = v14 - v9;
    -[UIImageView setFrame:](v3->_arrowHead, "setFrame:", v15, 0.0, v9, v11);
    -[CAMPanoramaArrowView addSubview:](v3, "addSubview:", v3->_arrowHead);
    v3->_arrowTailRect.origin.x = 0.0;
    v3->_arrowTailRect.origin.y = 0.0;
    v3->_arrowTailRect.size.width = v15;
    v3->_arrowTailRect.size.height = v11;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v3->_arrowTailRect.origin.x, v3->_arrowTailRect.origin.y, v3->_arrowTailRect.size.width, v3->_arrowTailRect.size.height);
    arrowTail = v3->_arrowTail;
    v3->_arrowTail = (UIView *)v16;

    -[CAMPanoramaArrowView addSubview:](v3, "addSubview:", v3->_arrowTail);
    v3->_tailBiggestDelta = 0.0;
    v3->_tailBigDelta = 0.0;
    v3->_tailMediumDelta = 0.0;
    v3->_tailSmallDelta = 0.0;
    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    arrowTailPiecesLayer = v3->_arrowTailPiecesLayer;
    v3->_arrowTailPiecesLayer = v18;

    -[CAShapeLayer setMasksToBounds:](v3->_arrowTailPiecesLayer, "setMasksToBounds:", 0);
    -[CAShapeLayer setFrame:](v3->_arrowTailPiecesLayer, "setFrame:", v3->_arrowTailRect.origin.x, v3->_arrowTailRect.origin.y, v3->_arrowTailRect.size.width, v3->_arrowTailRect.size.height);
    v20 = v3->_arrowTailPiecesLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", objc_msgSend(v21, "CGColor"));

    -[UIView layer](v3->_arrowTail, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v3->_arrowTailPiecesLayer);

    -[CAMPanoramaArrowView _updateTailWithAnimationDuration:](v3, "_updateTailWithAnimationDuration:", 0.0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_currentTailPiecesPath);
  v3.receiver = self;
  v3.super_class = (Class)CAMPanoramaArrowView;
  -[CAMPanoramaArrowView dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_arrowHead, "intrinsicContentSize");
  v4 = v3;
  v6 = v5 + 20.0;
  -[CAMPanoramaArrowView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v6 + v8 * 3.0;

  v10 = v9;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CAMPanoramaArrowView;
  -[CAMPanoramaArrowView layoutSubviews](&v2, sel_layoutSubviews);
}

- (CGPath)_newTailPiecesPathOfWidth:(double *)a3
{
  CGPath *Mutable;
  double MaxX;
  CGFloat MinY;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  Mutable = CGPathCreateMutable();
  MaxX = CGRectGetMaxX(self->_arrowTailRect);
  MinY = CGRectGetMinY(self->_arrowTailRect);
  v8 = MaxX + -4.0 - self->_tailBiggestDelta;
  v9 = v8 + -3.0 - self->_tailBigDelta;
  v10 = v9 + -2.0 - self->_tailMediumDelta;
  v11 = v10 + -1.0 - self->_tailSmallDelta;
  v12 = MinY + 16.0;
  v13 = CGRectGetHeight(self->_arrowTailRect) + -16.0 + -16.0;
  v16.size.width = 1.0;
  v16.origin.x = v11;
  v16.origin.y = v12;
  v16.size.height = v13;
  CGPathAddRect(Mutable, 0, v16);
  v17.size.width = 2.0;
  v17.origin.x = v10;
  v17.origin.y = v12;
  v17.size.height = v13;
  CGPathAddRect(Mutable, 0, v17);
  v18.size.width = 3.0;
  v18.origin.x = v9;
  v18.origin.y = v12;
  v18.size.height = v13;
  CGPathAddRect(Mutable, 0, v18);
  v19.size.width = 4.0;
  v19.origin.x = v8;
  v19.origin.y = v12;
  v19.size.height = v13;
  CGPathAddRect(Mutable, 0, v19);
  if (a3)
  {
    v20.size.width = 4.0;
    v20.origin.x = v8;
    v20.origin.y = v12;
    v20.size.height = v13;
    v14 = CGRectGetMaxX(v20);
    v21.size.width = 1.0;
    v21.origin.x = v11;
    v21.origin.y = v12;
    v21.size.height = v13;
    *a3 = v14 - CGRectGetMinX(v21);
  }
  return Mutable;
}

- (void)_updateTailWithAnimationDuration:(double)a3
{
  CGPath *v5;
  void *v6;
  void *v7;
  CGPath *currentTailPiecesPath;
  uint64_t v9;

  v9 = 0;
  v5 = -[CAMPanoramaArrowView _newTailPiecesPathOfWidth:](self, "_newTailPiecesPathOfWidth:", &v9);
  if (a3 <= 0.0)
  {
    -[CAShapeLayer setPath:](self->_arrowTailPiecesLayer, "setPath:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", a3);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v7);

    objc_msgSend(v6, "setRemovedOnCompletion:", 0);
    objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v6, "setFromValue:", self->_currentTailPiecesPath);
    objc_msgSend(v6, "setToValue:", v5);
    -[CAShapeLayer addAnimation:forKey:](self->_arrowTailPiecesLayer, "addAnimation:forKey:", v6, CFSTR("pathAnimation"));

  }
  currentTailPiecesPath = self->_currentTailPiecesPath;
  if (currentTailPiecesPath)
    CGPathRelease(currentTailPiecesPath);
  self->_currentTailPiecesPath = v5;
}

- (void)animateWithNormalizedSpeed:(double)a3 duration:(double)a4
{
  double currentNormalizedSpeed;
  _BOOL4 v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;

  currentNormalizedSpeed = self->_currentNormalizedSpeed;
  v7 = a3 >= 1.0;
  if (currentNormalizedSpeed >= 1.0)
    v7 = 0;
  v8 = currentNormalizedSpeed * 1.02 <= a3 || v7;
  if (a3 < 1.0)
  {
    v9 = self->_tailBiggestDelta + -1.0;
    v10 = 0.0;
    if (v9 < 0.0)
      v9 = 0.0;
    v11 = self->_tailBigDelta + -1.0;
    if (v11 < 0.0)
      v11 = 0.0;
    v12 = self->_tailMediumDelta + -1.0;
    if (v12 < 0.0)
      v12 = 0.0;
    v13 = self->_tailSmallDelta + -1.0;
    v14 = v13 < 0.0;
    goto LABEL_14;
  }
  v15 = currentNormalizedSpeed * 0.98;
  if (a3 >= 1.15)
  {
    if (a3 >= 1.3)
    {
      v13 = 0.0;
      if (v8)
      {
        v9 = fmin(self->_tailBiggestDelta + 1.0, 1.0);
        v11 = fmin(self->_tailBigDelta + 1.0, 2.0);
        v12 = fmin(self->_tailMediumDelta + 1.0, 3.0);
        v13 = fmin(self->_tailSmallDelta + 1.0, 4.0);
        goto LABEL_33;
      }
      v14 = v15 < a3;
      v12 = 0.0;
      v11 = 0.0;
      v9 = 0.0;
      if (v14)
        goto LABEL_33;
      v9 = self->_tailBiggestDelta + -1.0;
      if (v9 < 0.0)
        v9 = 0.0;
      v11 = self->_tailBigDelta + -1.0;
      if (v11 < 1.0)
        v11 = 1.0;
      v12 = self->_tailMediumDelta + -1.0;
      if (v12 < 2.0)
        v12 = 2.0;
      v13 = self->_tailSmallDelta + -1.0;
      v10 = 3.0;
    }
    else
    {
      if (v8)
      {
        v11 = fmin(self->_tailBigDelta + 1.0, 1.0);
        v12 = fmin(self->_tailMediumDelta + 1.0, 2.0);
        v13 = fmin(self->_tailSmallDelta + 1.0, 3.0);
        goto LABEL_32;
      }
      v13 = 0.0;
      v14 = v15 < a3;
      v12 = 0.0;
      v11 = 0.0;
      v9 = 0.0;
      if (v14)
        goto LABEL_33;
      v9 = self->_tailBiggestDelta + -1.0;
      if (v9 < 0.0)
        v9 = 0.0;
      if (self->_tailBigDelta + -1.0 >= 0.0)
        v11 = self->_tailBigDelta + -1.0;
      v12 = self->_tailMediumDelta + -1.0;
      if (v12 < 1.0)
        v12 = 1.0;
      v13 = self->_tailSmallDelta + -1.0;
      v10 = 2.0;
    }
  }
  else
  {
    if (v8)
    {
      v12 = fmin(self->_tailMediumDelta + 1.0, 1.0);
      v13 = fmin(self->_tailSmallDelta + 1.0, 2.0);
      v11 = 0.0;
LABEL_32:
      v9 = 0.0;
      goto LABEL_33;
    }
    v13 = 0.0;
    v14 = v15 < a3;
    v12 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    if (v14)
      goto LABEL_33;
    v9 = self->_tailBiggestDelta + -1.0;
    if (v9 < 0.0)
      v9 = 0.0;
    v11 = self->_tailBigDelta + -1.0;
    if (v11 < 0.0)
      v11 = 0.0;
    if (self->_tailMediumDelta + -1.0 >= 0.0)
      v12 = self->_tailMediumDelta + -1.0;
    v13 = self->_tailSmallDelta + -1.0;
    v10 = 1.0;
  }
  v14 = v13 < v10;
LABEL_14:
  if (v14)
    v13 = v10;
LABEL_33:
  if (v9 != self->_tailBiggestDelta
    || v11 != self->_tailBigDelta
    || v12 != self->_tailMediumDelta
    || v13 != self->_tailSmallDelta)
  {
    self->_tailBiggestDelta = v9;
    self->_tailBigDelta = v11;
    self->_tailMediumDelta = v12;
    self->_tailSmallDelta = v13;
    -[CAMPanoramaArrowView _updateTailWithAnimationDuration:](self, "_updateTailWithAnimationDuration:", a4);
  }
  self->_currentNormalizedSpeed = a3;
}

- (void)reset
{
  -[CAShapeLayer removeAllAnimations](self->_arrowTailPiecesLayer, "removeAllAnimations");
  self->_currentNormalizedSpeed = 0.0;
  self->_tailBiggestDelta = 0.0;
  self->_tailBigDelta = 0.0;
  self->_tailMediumDelta = 0.0;
  self->_tailSmallDelta = 0.0;
  -[CAMPanoramaArrowView _updateTailWithAnimationDuration:](self, "_updateTailWithAnimationDuration:", 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowTailPiecesLayer, 0);
  objc_storeStrong((id *)&self->_arrowTail, 0);
  objc_storeStrong((id *)&self->_arrowHead, 0);
}

@end
