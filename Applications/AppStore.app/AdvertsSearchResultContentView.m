@implementation AdvertsSearchResultContentView

- (_TtC8AppStore30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30AdvertsSearchResultContentView *)sub_10057981C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10057D168();
}

- (void)disableAdvertRotationTap
{
  char *v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  _TtC8AppStore30AdvertsSearchResultContentView *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation, v8, 0, 0);
  v4 = *(void (**)(uint64_t))v3;
  if (*(_QWORD *)v3)
  {
    v5 = *((_QWORD *)v3 + 1);
    v6 = self;
    v7 = sub_10003A340((uint64_t)v4, v5);
    v4(v7);
    sub_10003A350((uint64_t)v4, v5);

  }
}

- (void)layoutSubviews
{
  _TtC8AppStore30AdvertsSearchResultContentView *v2;

  v2 = self;
  sub_100579A70();

}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_preferredImageSizes));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_disableAdvertRotation]);
  swift_release();
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_impressionsUpdateBlock]);
}

@end
