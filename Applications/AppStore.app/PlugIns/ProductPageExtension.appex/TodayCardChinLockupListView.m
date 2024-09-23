@implementation TodayCardChinLockupListView

- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27TodayCardChinLockupListView *)sub_1003267F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27TodayCardChinLockupListView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10032982C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension27TodayCardChinLockupListView *v2;

  v2 = self;
  sub_100327954();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension27TodayCardChinLockupListView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_100327BB8();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_lockupIconViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_lockupIconViewReusePool;
  v4 = sub_10000DAF8(&qword_10081C7B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_impressionsCalculator);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_impressionsUpdateBlock), *(_QWORD *)&self->lockupIconViews[OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_impressionsUpdateBlock]);
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_todayCardStyle;
  v6 = type metadata accessor for TodayCard.Style(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_clickActionHandler), *(_QWORD *)&self->lockupIconViews[OBJC_IVAR____TtC20ProductPageExtension27TodayCardChinLockupListView_clickActionHandler]);
}

@end
