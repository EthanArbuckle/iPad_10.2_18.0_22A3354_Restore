@implementation CKTapbackClassicView

- (double)attributionScaleFactor
{
  return 0.9;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackClassicView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackClassicView_delegate;
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackClassicView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v5;
  CKTapbackClassicView *v6;

  v5 = (BOOL *)self + OBJC_IVAR___CKTapbackClassicView_isSelected;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_18E6F8194(a3);

}

- (void)dealloc
{
  void *v3;
  CKTapbackClassicView *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedTimer);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_removeAnimationTimerObserver_, v4);

  }
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TapbackClassicView();
  -[CKTapbackClassicView dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackClassicView_delegate);

}

- (CKTapbackClassicView)initWithFrame:(CGRect)a3
{
  return (CKTapbackClassicView *)_s7ChatKit18TapbackClassicViewC5frameACSo6CGRectV_tcfc_0();
}

- (CKTapbackClassicView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6F8ABC();
}

- (void)layoutSubviews
{
  char *v2;
  double x;
  double y;
  double width;
  CGFloat height;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TapbackClassicView();
  v2 = (char *)v9.receiver;
  -[CKTapbackClassicView layoutSubviews](&v9, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v9.receiver, v9.super_class);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v7 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v8 = CGRectGetHeight(v11);
  if (v8 >= v7)
    v8 = v7;
  objc_msgSend(*(id *)&v2[OBJC_IVAR___CKTapbackClassicView_imageView], sel_setFrame_, CGSizeCenteredInRect(v8, v8, x, y, width));

}

- (void)prepareForAppearingAnimation
{
  CKTapbackClassicView *v2;

  v2 = self;
  sub_18E6F7BE4();

}

- (void)performViewControllerAppearingAnimation
{
  CKTapbackClassicView *v2;

  v2 = self;
  sub_18E6F7E24();

}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v6;
  CKTapbackClassicView *v7;

  v6 = a3;
  v7 = self;
  sub_18E6F7B0C((uint64_t)objc_msgSend(v6, sel_associatedMessageType), a4);

}

- (void)animationTimerFired:(double)a3
{
  CKTapbackClassicView *v3;

  v3 = self;
  _s7ChatKit18TapbackClassicViewC19animationTimerFiredyySdF_0();

}

- (BOOL)animationExplicitlyResumed
{
  return 0;
}

@end
