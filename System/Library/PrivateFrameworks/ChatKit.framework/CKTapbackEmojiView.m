@implementation CKTapbackEmojiView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackEmojiView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackEmojiView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackEmojiView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackEmojiView_isSelected;
  swift_beginAccess();
  *v4 = a3;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackEmojiView_delegate;
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CKTapbackEmojiView)init
{
  return (CKTapbackEmojiView *)TapbackEmojiView.init()();
}

- (CKTapbackEmojiView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E72AF90();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackEmojiView();
  v2 = v3.receiver;
  -[CKTapbackEmojiView layoutSubviews](&v3, sel_layoutSubviews);
  sub_18E72A2BC();

}

- (void)displayScaleChanged
{
  CKTapbackEmojiView *v2;

  v2 = self;
  sub_18E72A2BC();

}

- (CKTapbackEmojiView)initWithFrame:(CGRect)a3
{
  CKTapbackEmojiView *result;

  result = (CKTapbackEmojiView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackEmojiView_delegate);

}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v6;
  CKTapbackEmojiView *v7;

  v6 = a3;
  v7 = self;
  TapbackEmojiView.configure(for:isSelected:)(v6, a4);

}

- (void)performSendAnimation
{
  -[CKTapbackEmojiView performViewControllerAppearingAnimation](self, sel_performViewControllerAppearingAnimation);
}

- (void)prepareForAppearingAnimation
{
  -[CKTapbackEmojiView setHidden:](self, sel_setHidden_, 1);
}

- (void)performViewControllerAppearingAnimation
{
  CKTapbackEmojiView *v2;

  v2 = self;
  TapbackEmojiView.performViewControllerAppearingAnimation()();

}

@end
