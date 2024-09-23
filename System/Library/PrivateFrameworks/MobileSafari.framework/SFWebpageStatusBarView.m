@implementation SFWebpageStatusBarView

- (SFWebpageStatusBarView)initWithFrame:(CGRect)a3
{
  SFWebpageStatusBarView *v3;
  SFWebpageStatusBarView *v4;
  UIView *v5;
  UIView *statusBarContentView;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *statusLabel;
  void *v11;
  SFWebPageStatusBarMessage *v12;
  SFWebPageStatusBarMessage *statusMessage;
  SFWebpageStatusBarView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFWebpageStatusBarView;
  v3 = -[SFWebpageStatusBarView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFWebpageStatusBarView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[SFWebpageStatusBarView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    statusBarContentView = v4->_statusBarContentView;
    v4->_statusBarContentView = v5;

    -[UIView setAlpha:](v4->_statusBarContentView, "setAlpha:", 0.0);
    -[SFWebpageStatusBarView addSubview:](v4, "addSubview:", v4->_statusBarContentView);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v8, "_setContinuousCornerRadius:", 8.0);
    -[UIView addSubview:](v4->_statusBarContentView, "addSubview:", v8);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    statusLabel = v4->_statusLabel;
    v4->_statusLabel = v9;

    -[UILabel setNumberOfLines:](v4->_statusLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v4->_statusLabel, "setLineBreakMode:", 5);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_statusLabel, "setFont:", v11);

    -[UIView addSubview:](v4->_statusBarContentView, "addSubview:", v4->_statusLabel);
    v12 = (SFWebPageStatusBarMessage *)objc_alloc_init((Class)objc_opt_self());
    statusMessage = v4->_statusMessage;
    v4->_statusMessage = v12;

    v14 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v14.receiver = self;
  v14.super_class = (Class)SFWebpageStatusBarView;
  -[SFWebpageStatusBarView layoutSubviews](&v14, sel_layoutSubviews);
  if ((-[SFWebPageStatusBarMessage isEmpty](self->_statusMessage, "isEmpty") & 1) == 0)
  {
    -[SFWebpageStatusBarView safeAreaInsets](self, "safeAreaInsets");
    v4 = v3 * 2.0 + 10.0;
    -[UILabel frame](self->_statusLabel, "frame");
    v6 = v5;
    -[SFWebpageStatusBarView bounds](self, "bounds");
    v7 = CGRectGetWidth(v15) + -20.0 - v4;
    -[UILabel bounds](self->_statusLabel, "bounds");
    -[UILabel setFrame:](self->_statusLabel, "setFrame:", 10.0, 10.0, fmin(CGRectGetWidth(v16), v7), v6);
    -[UILabel bounds](self->_statusLabel, "bounds");
    v8 = CGRectGetWidth(v17) + 20.0;
    -[UILabel bounds](self->_statusLabel, "bounds");
    v9 = CGRectGetHeight(v18) + 20.0;
    -[SFWebpageStatusBarView _originForStatusBarContentViewForContentHeight:](self, "_originForStatusBarContentViewForContentHeight:", v9);
    v11 = v10;
    v13 = v12;
    -[UIView frame](self->_statusBarContentView, "frame");
    -[UIView setFrame:](self->_statusBarContentView, "setFrame:", v11, v13, v8, v9);
  }
}

- (CGPoint)_originForStatusBarContentViewForContentHeight:(double)a3
{
  char v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat Height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v24;
  char v25;
  double v26;
  double v27;
  CGPoint result;
  CGRect v29;
  CGRect v30;

  v5 = !-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[SFWebpageStatusBarView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView frame](self->_statusBarContentView, "frame");
  v15 = v14;
  v17 = v16;
  -[SFWebpageStatusBarView safeAreaInsets](self, "safeAreaInsets");
  v19 = v18;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  Height = CGRectGetHeight(v29);
  v30.origin.x = _SFFlipRectInCoordinateSpace(v5, v19 + 5.0, Height - a3 + -5.0 - v19, v15, v17, v7, v9, v11, v13);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  v24 = v30.size.height;
  v25 = CGRectContainsPoint(v30, self->_hoverPoint);
  v26 = _SFFlipRectInCoordinateSpace(v25, x, y, width, v24, v7, v9, v11, v13);
  result.y = v27;
  result.x = v26;
  return result;
}

- (void)setStatusMessage:(id)a3
{
  char v5;
  void *v6;
  int v7;
  int v8;
  NSTimer *dismissStatusBarEnabledTimer;
  char v10;
  NSTimer *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = -[SFWebPageStatusBarMessage isEqual:](self->_statusMessage, "isEqual:", v14);
  v6 = v14;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v14, "isEmpty");
    v6 = v14;
    v8 = v7;
    dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
    if (!dismissStatusBarEnabledTimer || (v8 & 1) == 0)
    {
      if (v8)
      {
        v10 = -[SFWebPageStatusBarMessage isEmpty](self->_statusMessage, "isEmpty");
        v6 = v14;
        if ((v10 & 1) != 0)
          goto LABEL_16;
        dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
      }
      if (dismissStatusBarEnabledTimer)
      {
        -[NSTimer invalidate](dismissStatusBarEnabledTimer, "invalidate");
        v11 = self->_dismissStatusBarEnabledTimer;
        self->_dismissStatusBarEnabledTimer = 0;

      }
      objc_storeStrong((id *)&self->_statusMessage, a3);
      if (self->_suppressShowingStatusBar)
        v12 = 1;
      else
        v12 = v8;
      -[SFWebpageStatusBarView _cancelPendingStatusBarHideIfNeeded](self, "_cancelPendingStatusBarHideIfNeeded");
      if (v12 == 1)
      {
        -[SFWebpageStatusBarView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideStatusBar, 0, 0.2);
      }
      else
      {
        objc_msgSend(v14, "attributedMessageString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setAttributedText:](self->_statusLabel, "setAttributedText:", v13);
        -[UILabel sizeToFit](self->_statusLabel, "sizeToFit");
        -[SFWebpageStatusBarView setNeedsLayout](self, "setNeedsLayout");
        -[SFWebpageStatusBarView _showStatusBar](self, "_showStatusBar");

      }
      v6 = v14;
    }
  }
LABEL_16:

}

- (void)clearStatus
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_self());
  -[SFWebpageStatusBarView setStatusMessage:](self, "setStatusMessage:", v3);

}

- (void)setHoverPoint:(CGPoint)a3
{
  CGPoint *p_hoverPoint;
  CGRect v6;

  p_hoverPoint = &self->_hoverPoint;
  if (a3.x != self->_hoverPoint.x || a3.y != self->_hoverPoint.y)
  {
    p_hoverPoint->x = a3.x;
    self->_hoverPoint.y = a3.y;
    if (self->_shouldDodgeHoverPoint)
    {
      -[UIView frame](self->_statusBarContentView, "frame");
      if (CGRectContainsPoint(v6, *p_hoverPoint))
        -[SFWebpageStatusBarView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_showStatusBar
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  self->_shouldDodgeHoverPoint = 1;
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SFWebpageStatusBarView__showStatusBar__block_invoke;
  v5[3] = &unk_1E21E2050;
  v5[4] = self;
  objc_msgSend(v3, "sf_animate:withDuration:delay:options:animations:completion:", v4, 0, v5, 0, 0.25, 0.0);
}

uint64_t __40__SFWebpageStatusBarView__showStatusBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)_hideStatusBar
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  self->_shouldDodgeHoverPoint = 0;
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SFWebpageStatusBarView__hideStatusBar__block_invoke;
  v5[3] = &unk_1E21E2050;
  v5[4] = self;
  objc_msgSend(v3, "sf_animate:withDuration:delay:options:animations:completion:", v4, 0, v5, 0, 0.25, 0.0);
}

uint64_t __40__SFWebpageStatusBarView__hideStatusBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

- (void)_cancelPendingStatusBarHideIfNeeded
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideStatusBar, 0);
}

- (void)displayStatusBarIsEnabledMessage
{
  SFWebpageStatusBarInfoMessage *v3;
  void *v4;
  NSTimer *v5;
  NSTimer *dismissStatusBarEnabledTimer;
  id *v7;

  v3 = [SFWebpageStatusBarInfoMessage alloc];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFWebpageStatusBarInfoMessage initWithString:]((id *)&v3->super.isa, v4);

  -[SFWebpageStatusBarView setStatusMessage:](self, "setStatusMessage:", v7);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__clearStatusBarIsEnabledMessage, 0, 0, 2.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
  self->_dismissStatusBarEnabledTimer = v5;

}

- (void)_clearStatusBarIsEnabledMessage
{
  NSTimer *dismissStatusBarEnabledTimer;

  -[NSTimer invalidate](self->_dismissStatusBarEnabledTimer, "invalidate");
  dismissStatusBarEnabledTimer = self->_dismissStatusBarEnabledTimer;
  self->_dismissStatusBarEnabledTimer = 0;

  -[SFWebpageStatusBarView clearStatus](self, "clearStatus");
}

- (SFWebPageStatusBarMessage)statusMessage
{
  return self->_statusMessage;
}

- (CGPoint)hoverPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_hoverPoint.x;
  y = self->_hoverPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)suppressShowingStatusBar
{
  return self->_suppressShowingStatusBar;
}

- (void)setSuppressShowingStatusBar:(BOOL)a3
{
  self->_suppressShowingStatusBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_dismissStatusBarEnabledTimer, 0);
  objc_storeStrong((id *)&self->_statusBarContentView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
