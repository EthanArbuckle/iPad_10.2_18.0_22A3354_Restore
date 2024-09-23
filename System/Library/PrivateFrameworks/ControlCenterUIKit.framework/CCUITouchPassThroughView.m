@implementation CCUITouchPassThroughView

- (BOOL)isTouchPassThroughDisabled
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled);
}

- (void)setTouchPassThroughDisabled:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  CCUITouchPassThroughView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  CCUITouchPassThroughView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (CCUITouchPassThroughView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CCUITouchPassThroughView;
  return -[CCUITouchPassThroughView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUITouchPassThroughView)initWithCoder:(id)a3
{
  objc_super v4;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CCUITouchPassThroughView;
  return -[CCUITouchPassThroughView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
