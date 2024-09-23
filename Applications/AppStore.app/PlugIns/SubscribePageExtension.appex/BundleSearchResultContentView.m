@implementation BundleSearchResultContentView

- (_TtC22SubscribePageExtension29BundleSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29BundleSearchResultContentView *)sub_1005E1078(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29BundleSearchResultContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC22SubscribePageExtension29BundleSearchResultContentView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension29BundleSearchResultContentView_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC22SubscribePageExtension29BundleSearchResultContentView_bundleView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BundleView(0)), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension29BundleSearchResultContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/BundleSearchResultContentView.swift", 58, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29BundleSearchResultContentView *v2;

  v2 = self;
  sub_1005E12CC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29BundleSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29BundleSearchResultContentView_bundleView));
}

@end
