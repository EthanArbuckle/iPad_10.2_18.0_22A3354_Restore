@implementation CAMDepthEffectSuggestionButton

- (CAMDepthEffectSuggestionButton)initWithFrame:(CGRect)a3
{
  CAMDepthEffectSuggestionButton *v3;
  CAMDepthEffectSuggestionButton *v4;
  CAMDepthEffectSuggestionButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDepthEffectSuggestionButton;
  v3 = -[CAMCircleButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMDepthEffectSuggestionButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("DepthEffectSuggestion"));
    v5 = v4;
  }

  return v4;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMDepthEffectSuggestionButton mode](self, "mode") == 2;
}

- (id)imageNameForCurrentState
{
  return CFSTR("f.cursive");
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)(-[CAMDepthEffectSuggestionButton mode](self, "mode") - 1) < 2;
}

- (double)activeTintAlphaForCurrentState
{
  int64_t v2;
  double result;

  v2 = -[CAMDepthEffectSuggestionButton mode](self, "mode");
  result = 1.0;
  if (v2 == 2)
    return 0.5;
  return result;
}

- (void)setMode:(int64_t)a3
{
  -[CAMDepthEffectSuggestionButton setMode:animated:](self, "setMode:animated:", a3, 0);
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_mode != a3)
  {
    v4 = a4;
    self->_mode = a3;
    -[CAMCircleButton updateImage](self, "updateImage");
    -[CAMCircleButton updateTintColors](self, "updateTintColors");
    -[CAMCircleButton updateSlashAnimated:](self, "updateSlashAnimated:", v4);
  }
}

- (int64_t)mode
{
  return self->_mode;
}

@end
