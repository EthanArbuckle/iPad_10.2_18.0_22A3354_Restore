@implementation TodayListCardLockupContainer

- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28TodayListCardLockupContainer *)sub_100124CB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001287F0();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TodayListCardLockupContainer();
  -[TodayListCardLockupContainer frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC22SubscribePageExtension28TodayListCardLockupContainer *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100124FB8(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100125260();

}

- (void)applySizeCategoryUpdates
{
  _TtC22SubscribePageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100125954();

}

- (void)didMoveToSuperview
{
  _TtC22SubscribePageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100126450();

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension28TodayListCardLockupContainer *v5;

  v4 = a3;
  v5 = self;
  sub_100128CEC();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100126B18);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100126D34);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100069D8C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100126F5C);
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_objectGraph);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_artworkLoader);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_impressionsUpdateBlock), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_impressionsUpdateBlock]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_lockups));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_listCells));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_prefetchedLockupImages));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_nearestCollectionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28TodayListCardLockupContainer_currentTouch));
}

@end
