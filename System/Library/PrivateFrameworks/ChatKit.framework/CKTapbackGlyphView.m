@implementation CKTapbackGlyphView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackGlyphView_delegate;
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CKTapbackGlyphView)init
{
  return (CKTapbackGlyphView *)TapbackGlyphView.init()();
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackGlyphView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackGlyphView_isSelected;
  swift_beginAccess();
  *v4 = a3;
}

- (CKTapbackGlyphView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v11;
  CKTapbackGlyphView *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_attributionScaleFactor) = (Class)0x3FE6A09E667F3BCDLL;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___CKTapbackGlyphView_platterEdgeInsets);
  __asm
  {
    FMOV            V0.2D, #4.0
    FMOV            V1.2D, #-4.0
  }
  *v4 = _Q0;
  v4[1] = _Q1;
  v11 = a3;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackGlyphView_isSelected) = 0;

  result = (CKTapbackGlyphView *)sub_18E769320();
  __break(1u);
  return result;
}

- (CKTapbackGlyphView)initWithFrame:(CGRect)a3
{
  CKTapbackGlyphView *result;

  result = (CKTapbackGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackGlyphView_delegate);
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  CKTapbackGlyphView *v9;
  id v10;
  id v11;

  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    v10 = objc_msgSend(v7, sel_associatedMessageEmoji);
    sub_18E768984();

    v11 = (id)sub_18E768954();
    -[CKTapbackGlyphView setText:](v9, sel_setText_, v11);

    swift_bridgeObjectRelease();
  }
}

- (void)prepareForAppearingAnimation
{
  -[CKTapbackGlyphView setHidden:](self, sel_setHidden_, 1);
}

- (void)performViewControllerAppearingAnimation
{
  CKTapbackGlyphView *v2;

  v2 = self;
  TapbackGlyphView.performViewControllerAppearingAnimation()();

}

@end
