@implementation HeaderView

- (void)layoutSubviews
{
  _TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *v2;

  v2 = self;
  sub_1004758F8();

}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  _TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView *v7;
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
  v9.super_class = (Class)type metadata accessor for HeaderView();
  v7 = -[HeaderView initWithReuseIdentifier:](&v9, "initWithReuseIdentifier:", v6);

  return v7;
}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036110HeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HeaderView();
  return -[HeaderView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)init
{
  return (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *)sub_10047576C();
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100477258();
}

- (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *result;

  result = (_TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.HeaderView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_3DA3DA2AB58A3471A361CB62A7A7354210HeaderView_gradientBlurView));
}

@end
