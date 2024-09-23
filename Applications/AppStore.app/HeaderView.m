@implementation HeaderView

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)init
{
  return (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView *)sub_100014FFC();
}

- (void)layoutSubviews
{
  _TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView *v2;

  v2 = self;
  sub_100521C00();

}

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002DC564();
}

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithFrame:(CGRect)a3
{
  _TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView *result;

  result = (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.HeaderView", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView_gradientBlurView));
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  _TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView *v7;
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
  v9.super_class = (Class)_s8AppStore10HeaderViewCMa_0();
  v7 = -[HeaderView initWithReuseIdentifier:](&v9, "initWithReuseIdentifier:", v6);

  return v7;
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_s8AppStore10HeaderViewCMa_0();
  return -[HeaderView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
