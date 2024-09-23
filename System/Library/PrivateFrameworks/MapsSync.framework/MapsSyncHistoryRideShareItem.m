@implementation MapsSyncHistoryRideShareItem

- (NSString)description
{
  _TtC8MapsSync28MapsSyncHistoryRideShareItem *v2;
  void *v3;

  v2 = self;
  sub_1A421B2A8();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (GEOComposedWaypoint)startWaypoint
{
  return (GEOComposedWaypoint *)sub_1A421B520((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint);
}

- (GEOComposedWaypoint)endWaypoint
{
  return (GEOComposedWaypoint *)sub_1A421B520((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync28MapsSyncHistoryRideShareItem *v4;
  _TtC8MapsSync28MapsSyncHistoryRideShareItem *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A421B6DC((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync28MapsSyncHistoryRideShareItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A421BA8C(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync28MapsSyncHistoryRideShareItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A421C83C;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync28MapsSyncHistoryRideShareItem)initWithObject:(id)a3
{
  id v4;

  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v4 = a3;
  return (_TtC8MapsSync28MapsSyncHistoryRideShareItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint]);
}

@end
