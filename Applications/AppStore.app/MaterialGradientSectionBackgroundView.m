@implementation MaterialGradientSectionBackgroundView

- (_TtC8AppStore37MaterialGradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37MaterialGradientSectionBackgroundView *)sub_10030D3D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore37MaterialGradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8AppStore37MaterialGradientSectionBackgroundView *result;

  v5 = OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_materialView;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "init");

  result = (_TtC8AppStore37MaterialGradientSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MaterialGradientSectionBackgroundView.swift", 52, 2, 57, 0);
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(id *)&v2[OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_materialView];
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
                     + OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37MaterialGradientSectionBackgroundView_materialView));
}

@end
