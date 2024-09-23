@implementation TodayListCardLockupContainer

- (void)layoutSubviews
{
  _TtC8AppStore28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100042148();

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8AppStore28TodayListCardLockupContainer *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10004274C(x, y, width, height);

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

- (_TtC8AppStore28TodayListCardLockupContainer)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28TodayListCardLockupContainer *)sub_100017834(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToSuperview
{
  _TtC8AppStore28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_100013F88();

}

- (_TtC8AppStore28TodayListCardLockupContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003019E8();
}

- (void)applySizeCategoryUpdates
{
  _TtC8AppStore28TodayListCardLockupContainer *v2;

  v2 = self;
  sub_10001D558();

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8AppStore28TodayListCardLockupContainer *v5;

  v4 = a3;
  v5 = self;
  sub_100301C34();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1003009F0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100300C0C);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1000E0098(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100300E34);
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_objectGraph);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_artworkLoader);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_impressionsUpdateBlock), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_impressionsUpdateBlock]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_lockups));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_listCells));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_prefetchedLockupImages));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_nearestCollectionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28TodayListCardLockupContainer_currentTouch));
}

@end
