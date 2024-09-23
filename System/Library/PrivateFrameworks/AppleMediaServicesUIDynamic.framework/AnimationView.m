@implementation AnimationView

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithFrame:(CGRect)a3
{
  return (_TtC27AppleMediaServicesUIDynamic13AnimationView *)AnimationView.init(frame:)();
}

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D4CFB0();
}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic13AnimationView *v2;

  v2 = self;
  AnimationView.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic13AnimationView *v6;
  _TtC27AppleMediaServicesUIDynamic13AnimationView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  AnimationView.traitCollectionDidChange(_:)(v8);

}

- (_TtC27AppleMediaServicesUIDynamic13AnimationView)init
{
  AnimationView.init()();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13AnimationView_animationPlayer));
}

@end
