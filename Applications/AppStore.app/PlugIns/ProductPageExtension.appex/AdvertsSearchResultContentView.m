@implementation AdvertsSearchResultContentView

- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30AdvertsSearchResultContentView *)sub_10045E8E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100462230();
}

- (void)disableAdvertRotationTap
{
  char *v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  _TtC20ProductPageExtension30AdvertsSearchResultContentView *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation, v8, 0, 0);
  v4 = *(void (**)(uint64_t))v3;
  if (*(_QWORD *)v3)
  {
    v5 = *((_QWORD *)v3 + 1);
    v6 = self;
    v7 = sub_100018918((uint64_t)v4, v5);
    v4(v7);
    sub_100018908((uint64_t)v4, v5);

  }
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30AdvertsSearchResultContentView *v2;

  v2 = self;
  sub_10045EB38();

}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_preferredImageSizes));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation]);
  swift_release();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_impressionsUpdateBlock]);
}

@end
