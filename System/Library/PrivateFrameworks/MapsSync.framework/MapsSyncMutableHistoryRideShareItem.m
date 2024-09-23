@implementation MapsSyncMutableHistoryRideShareItem

- (_TtC8MapsSync35MapsSyncMutableHistoryRideShareItem)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (GEOComposedWaypoint)startWaypoint
{
  return (GEOComposedWaypoint *)sub_1A421C28C((char *)self, (uint64_t)a2, (SEL *)&selRef_startWaypoint);
}

- (void)setStartWaypoint:(id)a3
{
  id v5;
  _TtC8MapsSync35MapsSyncMutableHistoryRideShareItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A421C1B4(a3);

}

- (GEOComposedWaypoint)endWaypoint
{
  return (GEOComposedWaypoint *)sub_1A421C28C((char *)self, (uint64_t)a2, (SEL *)&selRef_endWaypoint);
}

- (void)setEndWaypoint:(id)a3
{
  id v5;
  _TtC8MapsSync35MapsSyncMutableHistoryRideShareItem *v6;

  v5 = a3;
  v6 = self;
  sub_1A421C430(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory));
}

@end
