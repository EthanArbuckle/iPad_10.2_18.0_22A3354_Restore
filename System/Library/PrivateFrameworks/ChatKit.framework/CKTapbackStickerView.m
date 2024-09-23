@implementation CKTapbackStickerView

- (double)attributionScaleFactor
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_attributionScaleFactor);
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___CKTapbackStickerView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CKTapbackViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackStickerView_delegate;
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)dealloc
{
  void *v3;
  CKTapbackStickerView *v4;
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
  v7.super_class = (Class)type metadata accessor for TapbackStickerView();
  -[CKTapbackStickerView dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackStickerView_delegate);

}

- (CKTapbackStickerView)init
{
  return (CKTapbackStickerView *)TapbackStickerView.init()();
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackStickerView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v5;
  CKTapbackStickerView *v6;

  v5 = (BOOL *)self + OBJC_IVAR___CKTapbackStickerView_isSelected;
  swift_beginAccess();
  *v5 = a3;
  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKTapbackStickerView_isPlaceholderImage) == 1)
  {
    v6 = self;
    sub_18E674CE4();

  }
}

- (CKTapbackStickerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6767C4();
}

- (void)didMoveToWindow
{
  sub_18E6751C4(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow, (void (*)(id))sub_18E6743EC);
}

- (void)layoutSubviews
{
  sub_18E6751C4(self, (uint64_t)a2, (const char **)&selRef_layoutSubviews, (void (*)(id))sub_18E675258);
}

- (void)displayScaleChanged
{
  CKTapbackStickerView *v2;

  v2 = self;
  sub_18E675258();

}

- (CKTapbackStickerView)initWithFrame:(CGRect)a3
{
  CKTapbackStickerView *result;

  result = (CKTapbackStickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)animationTimerFired:(double)a3
{
  CKTapbackStickerView *v4;

  v4 = self;
  TapbackStickerView.animationTimerFired(_:)(a3);

}

- (BOOL)animationExplicitlyResumed
{
  return 0;
}

- (void)configureForTapback:(id)a3 isSelected:(BOOL)a4
{
  id v5;
  CKTapbackStickerView *v6;

  v5 = a3;
  v6 = self;
  _s7ChatKit18TapbackStickerViewC9configure3for10isSelectedySo9IMTapbackC_SbtF_0(v5);

}

@end
