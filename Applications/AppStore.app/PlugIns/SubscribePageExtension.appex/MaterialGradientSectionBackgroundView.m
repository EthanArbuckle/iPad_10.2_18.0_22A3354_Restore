@implementation MaterialGradientSectionBackgroundView

- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView *)sub_10016C20C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "init");

  result = (_TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/MaterialGradientSectionBackgroundView.swift", 66, 2, 57, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v5.receiver;
  -[MaterialGradientSectionBackgroundView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37MaterialGradientSectionBackgroundView_materialView));
}

@end
