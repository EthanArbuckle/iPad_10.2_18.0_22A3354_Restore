@implementation CAMDisabledModeOverlayView

- (CAMDisabledModeOverlayView)initWithFrame:(CGRect)a3
{
  CAMDisabledModeOverlayView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UILabel *messageLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMDisabledModeOverlayView;
  v3 = -[CAMDisabledModeOverlayView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMDisabledModeOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    messageLabel = v3->__messageLabel;
    v3->__messageLabel = (UILabel *)v6;

    -[CAMDisabledModeOverlayView addSubview:](v3, "addSubview:", v3->__messageLabel);
    v8 = v3->__messageLabel;
    +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v3->__messageLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v3->__messageLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->__messageLabel, "setNumberOfLines:", 0);
    -[CAMDisabledModeOverlayView _updateText](v3, "_updateText");
  }
  return v3;
}

- (void)setDisabledModeReason:(int64_t)a3
{
  if (self->_disabledModeReason != a3)
  {
    self->_disabledModeReason = a3;
    -[CAMDisabledModeOverlayView _updateText](self, "_updateText");
  }
}

- (void)_updateText
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[CAMDisabledModeOverlayView disabledModeReason](self, "disabledModeReason");
  if (v3 == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("MODE_DISABLED_CAMERA_TOO_HOT_%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CAMLocalizedFrameworkString(v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    v9 = 0;
  }
  else
  {
    CAMLocalizedFrameworkString(CFSTR("MODE_DISABLED_WHILE_ON_CALL"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CAMDisabledModeOverlayView _messageLabel](self, "_messageLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMDisabledModeOverlayView;
  -[CAMDisabledModeOverlayView layoutSubviews](&v4, sel_layoutSubviews);
  -[CAMDisabledModeOverlayView _messageLabel](self, "_messageLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDisabledModeOverlayView _frameForMessageLabel](self, "_frameForMessageLabel");
  objc_msgSend(v3, "setFrame:");

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMDisabledModeOverlayView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMDisabledModeOverlayView _messageLabel](self, "_messageLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
}

- (CGRect)_frameForMessageLabel
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[CAMDisabledModeOverlayView viewportFrame](self, "viewportFrame");
  v4 = v3 + 15.0;
  v6 = v5 + 0.0;
  v8 = v7 + -30.0;
  result.size.height = v2;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_viewportFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(self->_viewportFrame, a3))
  {
    p_viewportFrame->origin.x = x;
    p_viewportFrame->origin.y = y;
    p_viewportFrame->size.width = width;
    p_viewportFrame->size.height = height;
    -[CAMDisabledModeOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)disabledModeReason
{
  return self->_disabledModeReason;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewportFrame.origin.x;
  y = self->_viewportFrame.origin.y;
  width = self->_viewportFrame.size.width;
  height = self->_viewportFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UILabel)_messageLabel
{
  return self->__messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__messageLabel, 0);
}

@end
