@implementation CAMFreeResourcesInstructionLabel

- (CAMFreeResourcesInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMFreeResourcesInstructionLabel *v3;
  CAMFreeResourcesInstructionLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFreeResourcesInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMFreeResourcesInstructionLabel _updateText](v3, "_updateText");
  return v4;
}

- (void)setFreeResourceInstructionState:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_freeResourceInstructionState != a3)
  {
    self->_freeResourceInstructionState = a3;
    -[CAMFreeResourcesInstructionLabel _updateText](self, "_updateText");
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 4)
        v6 = &stru_1EA3325A0;
      else
        v6 = off_1EA329400[a3];
      -[CAMInstructionLabel text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "FreeResourcesInstructionState: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);

    }
    -[CAMFreeResourcesInstructionLabel setNeedsLayout](self, "setNeedsLayout");
    -[CAMFreeResourcesInstructionLabel layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_updateText
{
  unint64_t v3;
  const __CFString *v4;
  __CFString *v5;

  v3 = -[CAMFreeResourcesInstructionLabel freeResourceInstructionState](self, "freeResourceInstructionState");
  if (v3 > 4)
  {
    v4 = &stru_1EA3325A0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_1EA329428[v3], 0);
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (__CFString *)v4;
  -[CAMInstructionLabel setText:](self, "setText:", v4);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[CAMFreeResourcesInstructionLabel bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -11.0, -11.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (UIEdgeInsets)_textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = CAMPixelWidthForView(self);
  v3 = v2 * 2.0 + 2.0;
  v4 = 5.0;
  v5 = 5.0;
  v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (id)_textColor
{
  void *v3;
  unint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMFreeResourcesInstructionLabel freeResourceInstructionState](self, "freeResourceInstructionState");
  if (v4 == 3 || !v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (double)_backgroundAlpha
{
  unint64_t v2;
  double result;

  v2 = -[CAMFreeResourcesInstructionLabel freeResourceInstructionState](self, "freeResourceInstructionState");
  result = 0.5;
  if (v2 == 2)
    return 1.0;
  return result;
}

- (id)_symbolSuffixName
{
  unint64_t v2;

  v2 = -[CAMFreeResourcesInstructionLabel freeResourceInstructionState](self, "freeResourceInstructionState");
  if (v2 > 3)
    return &stru_1EA3325A0;
  else
    return off_1EA329450[v2];
}

- (BOOL)_wantsPrefixActivityIndicatorView
{
  unint64_t v2;

  v2 = -[CAMFreeResourcesInstructionLabel freeResourceInstructionState](self, "freeResourceInstructionState");
  return (v2 < 5) & (0x16u >> v2);
}

- (unint64_t)freeResourceInstructionState
{
  return self->_freeResourceInstructionState;
}

@end
