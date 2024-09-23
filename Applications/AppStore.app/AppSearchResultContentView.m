@implementation AppSearchResultContentView

- (_TtC8AppStore26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26AppSearchResultContentView *)sub_1002C7898(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002CADF4();
}

- (void)layoutSubviews
{
  _TtC8AppStore26AppSearchResultContentView *v2;

  v2 = self;
  sub_1002C7BD4();

}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_preferredImageSizes));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_impressionsCalculator));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore26AppSearchResultContentView_impressionsUpdateBlock]);
}

@end
