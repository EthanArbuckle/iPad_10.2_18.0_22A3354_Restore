@implementation AppSearchResultContentView

- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26AppSearchResultContentView *)sub_100467C18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10046B174();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension26AppSearchResultContentView *v2;

  v2 = self;
  sub_100467F54();

}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_preferredImageSizes));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_impressionsCalculator));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC22SubscribePageExtension26AppSearchResultContentView_impressionsUpdateBlock]);
}

@end
