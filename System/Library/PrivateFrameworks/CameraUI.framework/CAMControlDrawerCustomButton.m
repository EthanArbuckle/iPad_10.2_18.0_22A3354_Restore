@implementation CAMControlDrawerCustomButton

- (BOOL)isExpandable
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawerCustomButton;
  -[CAMControlDrawerButton layoutSubviews](&v7, sel_layoutSubviews);
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");

    -[CAMControlDrawerCustomButton expansionInsets](self, "expansionInsets");
    -[CAMControlDrawerButton _imageView](self, "_imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerButton _slashView](self, "_slashView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v4, "setCenter:");
    objc_msgSend(v5, "bounds");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v5, "setCenter:");
    objc_msgSend(v6, "bounds");
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v6, "setCenter:");

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  BOOL v17;
  BOOL v18;
  objc_super v20;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    v21.x = x;
    v21.y = y;
    v17 = CGRectContainsPoint(v22, v21);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CAMControlDrawerCustomButton;
    v17 = -[CAMControlDrawerCustomButton pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y);
  }
  v18 = v17;

  return v18;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v6, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", -[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));

  }
  else
  {
    -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", 1);
  }
  -[CAMControlDrawerCustomButton _updateHighlightedView](self, "_updateHighlightedView");
  v15.receiver = self;
  v15.super_class = (Class)CAMControlDrawerCustomButton;
  v13 = -[CAMControlDrawerCustomButton beginTrackingWithTouch:withEvent:](&v15, sel_beginTrackingWithTouch_withEvent_, v6, v7);

  return v13;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", -[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v12, v9, v11));

  -[CAMControlDrawerCustomButton _updateHighlightedView](self, "_updateHighlightedView");
  v14.receiver = self;
  v14.super_class = (Class)CAMControlDrawerCustomButton;
  LOBYTE(self) = -[CAMControlDrawerCustomButton continueTrackingWithTouch:withEvent:](&v14, sel_continueTrackingWithTouch_withEvent_, v7, v6);

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  if (-[CAMControlDrawerCustomButton _isTouchInTrackedView](self, "_isTouchInTrackedView", a3, a4)
    && -[CAMControlDrawerCustomButton isSelfExpanding](self, "isSelfExpanding"))
  {
    -[CAMControlDrawerCustomButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", -[CAMControlDrawerCustomButton isExpanded](self, "isExpanded") ^ 1, 1, 1);
  }
  -[CAMControlDrawerCustomButton _setTouchInTrackedView:](self, "_setTouchInTrackedView:", 0);
  -[CAMControlDrawerCustomButton _updateHighlightedView](self, "_updateHighlightedView");
}

- (BOOL)_shouldTrackView:(id)a3 forTouchAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "origin");
  v16 = v15;

  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  v20 = CGRectInset(v19, -20.0, -v16);
  v18.x = x;
  v18.y = y;
  return CGRectContainsPoint(v20, v18);
}

- (BOOL)_shouldRejectAccessibilityGestureForHUDManager:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _BOOL4 v10;

  v4 = a3;
  if (-[CAMControlDrawerCustomButton isExpanded](self, "isExpanded"))
  {
    objc_msgSend(v4, "locationOfAccessibilityGestureInView:", self);
    v6 = v5;
    v8 = v7;
    -[CAMControlDrawerButton _backgroundView](self, "_backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = !-[CAMControlDrawerCustomButton _shouldTrackView:forTouchAtLocation:](self, "_shouldTrackView:forTouchAtLocation:", v9, v6, v8);

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  return !-[CAMControlDrawerCustomButton _shouldRejectAccessibilityGestureForHUDManager:](self, "_shouldRejectAccessibilityGestureForHUDManager:", a3);
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  if (!-[CAMControlDrawerCustomButton _shouldRejectAccessibilityGestureForHUDManager:](self, "_shouldRejectAccessibilityGestureForHUDManager:", a3))
  {
    -[CAMControlDrawerCustomButton cancelTouchTracking](self, "cancelTouchTracking");
    -[CAMControlDrawerCustomButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    if (-[CAMControlDrawerCustomButton isSelfExpanding](self, "isSelfExpanding"))
      -[CAMControlDrawerCustomButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", -[CAMControlDrawerCustomButton isExpanded](self, "isExpanded") ^ 1, 1, 1);
  }
}

- (void)_updateHighlightedView
{
  -[CAMControlDrawerButton setHighlighted:](self, "setHighlighted:", -[CAMControlDrawerCustomButton _isTouchInTrackedView](self, "_isTouchInTrackedView"));
}

- (BOOL)isSelfExpanding
{
  return 1;
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_expansionInsets.left
    || a3.top != self->_expansionInsets.top
    || a3.right != self->_expansionInsets.right
    || a3.bottom != self->_expansionInsets.bottom)
  {
    self->_expansionInsets = a3;
    -[CAMControlDrawerCustomButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[CAMControlDrawerCustomButton setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  -[CAMControlDrawerCustomButton _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", a3, a4, 0);
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v9;
  _QWORD v10[5];

  if (self->_expanded != a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = a3;
    if (a4)
      -[CAMControlDrawerCustomButton layoutIfNeeded](self, "layoutIfNeeded");
    if (v5)
    {
      -[CAMControlDrawerCustomButton delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "expandableButton:willChangeExpanded:", self, v7);

    }
    self->_expanded = v7;
    -[CAMControlDrawerCustomButton setNeedsLayout](self, "setNeedsLayout");
    if (v6)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __67__CAMControlDrawerCustomButton__setExpanded_animated_shouldNotify___block_invoke;
      v10[3] = &unk_1EA328868;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v10, 0, 0.5, 0.0, 1.0, 1.0);
    }
  }
}

uint64_t __67__CAMControlDrawerCustomButton__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (UIEdgeInsets)expansionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_expansionInsets.top;
  left = self->_expansionInsets.left;
  bottom = self->_expansionInsets.bottom;
  right = self->_expansionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CAMControlDrawerExpandableButtonDelegate)delegate
{
  return (CAMControlDrawerExpandableButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)_isTouchInTrackedView
{
  return self->__touchInTrackedView;
}

- (void)_setTouchInTrackedView:(BOOL)a3
{
  self->__touchInTrackedView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
