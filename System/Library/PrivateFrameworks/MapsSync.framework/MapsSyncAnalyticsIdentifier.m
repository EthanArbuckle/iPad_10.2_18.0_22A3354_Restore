@implementation MapsSyncAnalyticsIdentifier

- (NSData)data
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data);
  v3 = *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *v2;
    sub_1A40D7734(*v2, v3);
    v4 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v3);
  }
  return (NSData *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync27MapsSyncAnalyticsIdentifier *v4;
  _TtC8MapsSync27MapsSyncAnalyticsIdentifier *v5;
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
  v6 = sub_1A414FFF4((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync27MapsSyncAnalyticsIdentifier *v5;

  v4 = a3;
  v5 = self;
  sub_1A41502D4(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync27MapsSyncAnalyticsIdentifier *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4150CA8, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync27MapsSyncAnalyticsIdentifier)initWithObject:(id)a3
{
  id v4;

  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data) = xmmword_1A4243680;
  v4 = a3;
  return (_TtC8MapsSync27MapsSyncAnalyticsIdentifier *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncAnalyticsIdentifier__data]);
}

@end
