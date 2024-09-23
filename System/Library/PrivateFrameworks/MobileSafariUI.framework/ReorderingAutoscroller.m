@implementation ReorderingAutoscroller

- (ReorderingAutoscroller)init
{
  ReorderingAutoscroller *v2;
  ReorderingAutoscroller *v3;
  ReorderingAutoscroller *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ReorderingAutoscroller;
  v2 = -[ReorderingAutoscroller init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maximumSpeed = 1.5;
    *(_OWORD *)&v2->_autoscrollInsets.top = defaultAutoscrollInsets;
    *(_OWORD *)&v2->_autoscrollInsets.bottom = *(_OWORD *)&qword_1D7EA8850;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ReorderingAutoscroller;
  -[ReorderingAutoscroller dealloc](&v3, sel_dealloc);
}

- (void)beginInteraction
{
  self->_offsetError = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)updateInteractionAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double maximumSpeed;
  double width;
  double height;
  double v9;
  double *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat MinX;
  double left;
  double v16;
  double v17;
  CGFloat MaxX;
  double v19;
  CGFloat MinY;
  double top;
  double v22;
  double v23;
  CGFloat MaxY;

  y = a3.y;
  x = a3.x;
  maximumSpeed = self->_maximumSpeed;
  width = self->_scrollableRect.size.width;
  height = self->_scrollableRect.size.height;
  v9 = maximumSpeed * width;
  v10 = (double *)MEMORY[0x1E0C9D538];
  if (self->_autoscrollInsets.left > 0.0)
  {
    v11 = self->_scrollableRect.origin.x;
    v12 = self->_scrollableRect.origin.y;
    v13 = self->_scrollableRect.size.height;
    if (x - CGRectGetMinX(*(CGRect *)(&width - 2)) < self->_autoscrollInsets.left)
    {
      MinX = CGRectGetMinX(self->_scrollableRect);
      left = self->_autoscrollInsets.left;
      v16 = x - MinX - left;
LABEL_7:
      v17 = v9 * v16 / left;
      goto LABEL_8;
    }
  }
  v17 = *v10;
  if (self->_autoscrollInsets.right > 0.0 && CGRectGetMaxX(self->_scrollableRect) - x < self->_autoscrollInsets.right)
  {
    MaxX = CGRectGetMaxX(self->_scrollableRect);
    left = self->_autoscrollInsets.right;
    v16 = x - MaxX + left;
    goto LABEL_7;
  }
LABEL_8:
  v19 = maximumSpeed * height;
  if (self->_autoscrollInsets.top > 0.0 && y - CGRectGetMinY(self->_scrollableRect) < self->_autoscrollInsets.top)
  {
    MinY = CGRectGetMinY(self->_scrollableRect);
    top = self->_autoscrollInsets.top;
    v22 = y - MinY - top;
LABEL_14:
    v23 = v19 * v22 / top;
    goto LABEL_15;
  }
  v23 = v10[1];
  if (self->_autoscrollInsets.bottom > 0.0 && CGRectGetMaxY(self->_scrollableRect) - y < self->_autoscrollInsets.bottom)
  {
    MaxY = CGRectGetMaxY(self->_scrollableRect);
    top = self->_autoscrollInsets.bottom;
    v22 = y - MaxY + top;
    goto LABEL_14;
  }
LABEL_15:
  -[ReorderingAutoscroller _setVelocity:](self, "_setVelocity:", v17, v23);
}

- (void)endInteraction
{
  -[ReorderingAutoscroller _setVelocity:](self, "_setVelocity:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_setVelocity:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CADisplayLink *displayLink;
  CADisplayLink *v7;
  CADisplayLink *v8;
  CADisplayLink *v9;
  CADisplayLink *v10;
  void *v11;
  CAFrameRateRange v12;

  y = a3.y;
  x = a3.x;
  displayLink = self->_displayLink;
  if (fabs(a3.x) >= 0.01 || fabs(a3.y) >= 0.01)
  {
    if (!displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__autoscroll_);
      v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayLink;
      self->_displayLink = v8;

      v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
      -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", 1638402);
      v10 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

    }
    self->_velocity.x = x;
    self->_velocity.y = y;
  }
  else
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v7 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)_autoscroll:(id)a3
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double __y;

  objc_msgSend(a3, "duration");
  v5 = self->_offsetError.x + self->_velocity.x * v4;
  v6 = self->_offsetError.y + self->_velocity.y * v4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v11 = 0.0;
  __y = 0.0;
  self->_offsetError.x = modf(v5 * v9, &__y) / v9;
  self->_offsetError.y = modf(v6 * v9, &v11) / v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reorderingAutoscroller:handleScroll:", self, __y / v9, v11 / v9);

}

- (ReorderingAutoscrollerDelegate)delegate
{
  return (ReorderingAutoscrollerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)scrollableRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollableRect.origin.x;
  y = self->_scrollableRect.origin.y;
  width = self->_scrollableRect.size.width;
  height = self->_scrollableRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScrollableRect:(CGRect)a3
{
  self->_scrollableRect = a3;
}

- (UIEdgeInsets)autoscrollInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_autoscrollInsets.top;
  left = self->_autoscrollInsets.left;
  bottom = self->_autoscrollInsets.bottom;
  right = self->_autoscrollInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAutoscrollInsets:(UIEdgeInsets)a3
{
  self->_autoscrollInsets = a3;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
}

- (void)setMaximumSpeed:(double)a3
{
  self->_maximumSpeed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
