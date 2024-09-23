@implementation CAMSemanticStyleMaskedBadge

- (CAMSemanticStyleMaskedBadge)initWithFrame:(CGRect)a3
{
  CAMSemanticStyleMaskedBadge *v3;
  CAMSemanticStyleMaskedBadge *v4;
  uint64_t v5;
  CEKCaptureStyle *semanticStyle;
  CEKBadgeTextView *v7;
  CEKBadgeTextView *badgeView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMSemanticStyleMaskedBadge;
  v3 = -[CAMSemanticStyleMaskedBadge initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMSemanticStyleMaskedBadge setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[CAMSemanticStyleMaskedBadge setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    +[CAMSemanticStyle standardStyle](CAMSemanticStyle, "standardStyle");
    v5 = objc_claimAutoreleasedReturnValue();
    semanticStyle = v4->_semanticStyle;
    v4->_semanticStyle = (CEKCaptureStyle *)v5;

    v7 = (CEKBadgeTextView *)objc_alloc_init(MEMORY[0x1E0D0D028]);
    badgeView = v4->_badgeView;
    v4->_badgeView = v7;

    -[CAMSemanticStyleMaskedBadge addSubview:](v4, "addSubview:", v4->_badgeView);
    -[CAMSemanticStyleMaskedBadge _requestTextUpdateDelayIfNeeded:](v4, "_requestTextUpdateDelayIfNeeded:", 0);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  int64_t v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  _OWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  v8 = -[CAMSemanticStyleMaskedBadge orientation](self, "orientation");
  if ((unint64_t)(v8 - 3) >= 2)
    v9 = v7;
  else
    v9 = v5;
  if ((unint64_t)(v8 - 3) < 2)
    v5 = v7;
  -[CAMSemanticStyleMaskedBadge badgeLeftInset](self, "badgeLeftInset");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView", CAMViewGeometryForOrientedFrame(-[CAMSemanticStyleMaskedBadge orientation](self, "orientation"), (uint64_t)&v13, v10, 0.0, v5, v9).n128_f64[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v15;
  v12[3] = v16;
  v12[4] = v17;
  v12[5] = v18;
  v12[0] = v13;
  v12[1] = v14;
  CAMApplyAnimationSensitiveGeometryToView((double *)v12, v11);

}

- (void)setSemanticStyle:(id)a3
{
  -[CAMSemanticStyleMaskedBadge setSemanticStyle:delayIfNeeded:](self, "setSemanticStyle:delayIfNeeded:", a3, 0);
}

- (void)setSemanticStyle:(id)a3 delayIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_semanticStyle) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    -[CAMSemanticStyleMaskedBadge _requestTextUpdateDelayIfNeeded:](self, "_requestTextUpdateDelayIfNeeded:", v4);
  }

}

- (void)setBadgeLeftInset:(double)a3
{
  if (self->_badgeLeftInset != a3)
  {
    self->_badgeLeftInset = a3;
    -[CAMSemanticStyleMaskedBadge setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMSemanticStyleMaskedBadge setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_requestTextUpdateDelayIfNeeded:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CAMSemanticStyleMaskedBadge semanticStyle](self, "semanticStyle");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cam_uppercaseStringWithPreferredLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMSemanticStyleMaskedBadge _cachedText](self, "_cachedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    -[CAMSemanticStyleMaskedBadge set_cachedText:](self, "set_cachedText:", v6);
    -[CAMSemanticStyleMaskedBadge _badgeUpdateLockoutTimer](self, "_badgeUpdateLockoutTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || !a3)
    {
      -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setText:", v6);

      -[CAMSemanticStyleMaskedBadge _badgeUpdateLockoutTimer](self, "_badgeUpdateLockoutTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleBadgeUpdateLockoutTimerFired_, 0, 0, 0.3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSemanticStyleMaskedBadge set_badgeUpdateLockoutTimer:](self, "set_badgeUpdateLockoutTimer:", v11);

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSemanticStyleMaskedBadge _badgeUpdateLockoutTimer](self, "_badgeUpdateLockoutTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addTimer:forMode:", v13, *MEMORY[0x1E0C99860]);

    }
    -[CAMSemanticStyleMaskedBadge setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_handleBadgeUpdateLockoutTimerFired:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CAMSemanticStyleMaskedBadge _badgeUpdateLockoutTimer](self, "_badgeUpdateLockoutTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CAMSemanticStyleMaskedBadge set_badgeUpdateLockoutTimer:](self, "set_badgeUpdateLockoutTimer:", 0);
  -[CAMSemanticStyleMaskedBadge _cachedText](self, "_cachedText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleMaskedBadge badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setText:", v6);

}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (CEKCaptureStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (double)badgeLeftInset
{
  return self->_badgeLeftInset;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSTimer)_badgeUpdateLockoutTimer
{
  return self->__badgeUpdateLockoutTimer;
}

- (void)set_badgeUpdateLockoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->__badgeUpdateLockoutTimer, a3);
}

- (NSString)_cachedText
{
  return self->__cachedText;
}

- (void)set_cachedText:(id)a3
{
  objc_storeStrong((id *)&self->__cachedText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedText, 0);
  objc_storeStrong((id *)&self->__badgeUpdateLockoutTimer, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
