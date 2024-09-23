@implementation MapsSyncHistoryTransitItem

- (NSString)description
{
  _TtC8MapsSync26MapsSyncHistoryTransitItem *v2;
  void *v3;

  v2 = self;
  sub_1A417C558();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSData)transitLineItemStorageData
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage);
  v3 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage];
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

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__muid);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync26MapsSyncHistoryTransitItem *v4;
  _TtC8MapsSync26MapsSyncHistoryTransitItem *v5;
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
  v6 = sub_1A417C798((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync26MapsSyncHistoryTransitItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A417C9BC(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryTransitItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync26MapsSyncHistoryTransitItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A417CC24;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync26MapsSyncHistoryTransitItem)initWithObject:(id)a3
{
  id v4;

  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__muid) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v4 = a3;
  return (_TtC8MapsSync26MapsSyncHistoryTransitItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage]);
}

@end
