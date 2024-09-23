@implementation HeaderView

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)init
{
  return (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView *)sub_100119E78();
}

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10011B99C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView *v2;

  v2 = self;
  sub_1004023E0();

}

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView *result;

  result = (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.HeaderView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView_gradientBlurView));
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  _TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView *v7;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_s22SubscribePageExtension10HeaderViewCMa_0();
  v7 = -[HeaderView initWithReuseIdentifier:](&v9, "initWithReuseIdentifier:", v6);

  return v7;
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_s22SubscribePageExtension10HeaderViewCMa_0();
  return -[HeaderView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
