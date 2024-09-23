@implementation AppSearchResultContentView

- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26AppSearchResultContentView *)sub_10048963C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10048CB98();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension26AppSearchResultContentView *v2;

  v2 = self;
  sub_100489978();

}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_preferredImageSizes));
  swift_release();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension26AppSearchResultContentView_impressionsUpdateBlock]);
}

@end
