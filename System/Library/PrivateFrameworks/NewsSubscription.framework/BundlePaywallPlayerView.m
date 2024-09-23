@implementation BundlePaywallPlayerView

+ (Class)layerClass
{
  sub_1BA37F7C8();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription23BundlePaywallPlayerView *)sub_1BA37F1D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription23BundlePaywallPlayerView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC16NewsSubscription23BundlePaywallPlayerView *result;

  v5 = OBJC_IVAR____TtC16NewsSubscription23BundlePaywallPlayerView_displayStateCoordinator;
  sub_1BA437BB8();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BA437BAC();

  result = (_TtC16NewsSubscription23BundlePaywallPlayerView *)sub_1BA438260();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BundlePaywallPlayerView();
  v2 = v3.receiver;
  -[BundlePaywallPlayerView didMoveToWindow](&v3, sel_didMoveToWindow);
  sub_1BA437B7C();

}

- (void).cxx_destruct
{
  swift_release();
}

@end
