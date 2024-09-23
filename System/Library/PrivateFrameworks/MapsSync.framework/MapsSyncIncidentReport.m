@implementation MapsSyncIncidentReport

- (NSString)countryCode
{
  void *v2;

  if (*(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__countryCode])
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

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__type);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync22MapsSyncIncidentReport *v4;
  _TtC8MapsSync22MapsSyncIncidentReport *v5;
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
  v6 = sub_1A41DAE2C((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync22MapsSyncIncidentReport *v5;

  v4 = a3;
  v5 = self;
  sub_1A41DB0DC(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedIncidentReport();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync22MapsSyncIncidentReport *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41DB2BC, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync22MapsSyncIncidentReport)initWithObject:(id)a3
{
  _QWORD *v4;
  id v5;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__countryCode);
  *v4 = 0;
  v4[1] = 0;
  *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncIncidentReport__type) = 0;
  v5 = a3;
  return (_TtC8MapsSync22MapsSyncIncidentReport *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
