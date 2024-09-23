@implementation TodayCardLockupListOverlayView

- (_TtC8AppStore30TodayCardLockupListOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30TodayCardLockupListOverlayView *)sub_100471B14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30TodayCardLockupListOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100474238();
}

- (void)handleClickActionFor:(id)a3
{
  char *v4;
  _TtC8AppStore30TodayCardLockupListOverlayView *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_100472268(v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8AppStore30TodayCardLockupListOverlayView *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  _TtC8AppStore30TodayCardLockupListOverlayView *v16;
  char v17[24];
  CGSize result;

  width = a3.width;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_itemViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_itemViews, v17, 0, 0);
  v6 = *v5;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v15 = v6;
    else
      v15 = v6 & 0xFFFFFFFFFFFFFF8;
    v16 = self;
    swift_bridgeObjectRetain(v6);
    if (_CocoaArrayWrapper.endIndex.getter(v15))
      goto LABEL_3;
LABEL_11:

    swift_bridgeObjectRelease(v6);
    width = 0.0;
    v14 = 0.0;
    goto LABEL_12;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = self;
  *(_QWORD *)&v9 = swift_bridgeObjectRetain(v6).n128_u64[0];
  if (!v7)
    goto LABEL_11;
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v6);
  }
  else
  {
    if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_15;
    }
    v11 = *(id *)(v6 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease(v6);
  sub_100473F60();
  v14 = v13;

LABEL_12:
  v9 = width;
  v10 = v14;
LABEL_15:
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore30TodayCardLockupListOverlayView *v2;

  v2 = self;
  sub_1004725FC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_itemViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_reusePool;
  v4 = sub_10007B804(&qword_100847278);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->itemViews[OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30TodayCardLockupListOverlayView_separatorView));
}

@end
