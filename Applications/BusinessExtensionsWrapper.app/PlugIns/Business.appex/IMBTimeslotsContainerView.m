@implementation IMBTimeslotsContainerView

- (NSArray)timeslotViews
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews, v6, 0, 0);
  v3 = *v2;
  if (!v3)
    return (NSArray *)0;
  type metadata accessor for IMBTimeslotView();
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setTimeslotViews:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = a3;
  if (a3)
  {
    v5 = type metadata accessor for IMBTimeslotView();
    v3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews);
  swift_beginAccess(v6, v8, 1, 0);
  v7 = *v6;
  *v6 = (uint64_t)v3;
  swift_bridgeObjectRelease(v7);
}

- (_TtC8Business25IMBTimeslotsContainerView)init
{
  return (_TtC8Business25IMBTimeslotsContainerView *)sub_100071628();
}

- (_TtC8Business25IMBTimeslotsContainerView)initWithCoder:(id)a3
{
  return (_TtC8Business25IMBTimeslotsContainerView *)sub_100071848(a3);
}

- (void)layoutSubviews
{
  _TtC8Business25IMBTimeslotsContainerView *v2;

  v2 = self;
  sub_100071D34();

}

- (_TtC8Business25IMBTimeslotsContainerView)initWithFrame:(CGRect)a3
{
  _TtC8Business25IMBTimeslotsContainerView *result;

  result = (_TtC8Business25IMBTimeslotsContainerView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBTimeslotsContainerView", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViewHeightConstraint));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeSelectionDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslots));
  sub_10007374C((uint64_t)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timezone);
}

@end
