@implementation TodayListCardLockupContainer

- (_TtC20ProductPageExtension28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension28TodayListCardLockupContainer *)sub_100221C94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100225A4C();
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
  _TtC20ProductPageExtension28TodayListCardLockupContainer *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100221F9C(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100222244();

}

- (void)applySizeCategoryUpdates
{
  _TtC20ProductPageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100222938();

}

- (void)didMoveToSuperview
{
  _TtC20ProductPageExtension28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100223434();

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC20ProductPageExtension28TodayListCardLockupContainer *v5;

  v4 = a3;
  v5 = self;
  sub_100225FA0();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100223F40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100223AFC);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100223F40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100223D18);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100223F40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100223FD8);
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_objectGraph);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_artworkLoader);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_impressionsCalculator);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_impressionsUpdateBlock), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_impressionsUpdateBlock]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_lockups));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_listCells));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_prefetchedLockupImages));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_nearestCollectionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28TodayListCardLockupContainer_currentTouch));
}

@end
