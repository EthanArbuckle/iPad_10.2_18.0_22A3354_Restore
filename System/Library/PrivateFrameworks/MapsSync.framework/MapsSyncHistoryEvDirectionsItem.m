@implementation MapsSyncHistoryEvDirectionsItem

- (NSString)description
{
  _TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *v2;
  void *v3;

  v2 = self;
  sub_1A4125648();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (double)requiredCharge
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__requiredCharge);
}

- (NSString)vehicleIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->super.super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__vehicleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *v4;
  _TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *v5;
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
  v6 = sub_1A41258A8((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A4125B2C(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *v9;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A4125D94;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1A4126A7C;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v8);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync31MapsSyncHistoryEvDirectionsItem)initWithObject:(id)a3
{
  _QWORD *v4;
  id v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__requiredCharge) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__vehicleIdentifier);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v5 = a3;
  return (_TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
