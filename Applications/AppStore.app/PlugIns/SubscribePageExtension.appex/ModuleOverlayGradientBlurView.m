@implementation ModuleOverlayGradientBlurView

- (_TtC22SubscribePageExtension29ModuleOverlayGradientBlurView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension29ModuleOverlayGradientBlurView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_effectVisibilityThreshold) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_alignment;
  v6 = enum case for HeroCarouselItemOverlay.DisplayOptions.Placement.leading(_:);
  v7 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  v8 = a3;

  result = (_TtC22SubscribePageExtension29ModuleOverlayGradientBlurView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ModuleOverlayGradientBlurView.swift", 58, 2, 169, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension29ModuleOverlayGradientBlurView *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ModuleOverlayGradientBlurView layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_overlayView);
  v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_plusDarkerView), "setFrame:", LayoutMarginsAware<>.layoutFrame.getter(ObjectType));
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_gradientMaskView), "setFrame:", LayoutMarginsAware<>.layoutFrame.getter(ObjectType));
  sub_10055175C();

}

- (_TtC22SubscribePageExtension29ModuleOverlayGradientBlurView)initWithEffect:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension29ModuleOverlayGradientBlurView *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension29ModuleOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ModuleOverlayGradientBlurView", 52, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_plusDarkerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_gradientMaskView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29ModuleOverlayGradientBlurView_alignment;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
