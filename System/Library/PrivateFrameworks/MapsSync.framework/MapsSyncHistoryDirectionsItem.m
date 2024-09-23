@implementation MapsSyncHistoryDirectionsItem

- (NSString)description
{
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v2;
  void *v3;

  v2 = self;
  sub_1A41EF484();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)navigationInterrupted
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  unint64_t v2;
  id v3;
  uint64_t v5;
  id v6;
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v7;
  void *v8;

  v2 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage);
    v6 = objc_allocWithZone(MEMORY[0x1E0D27590]);
    v7 = self;
    sub_1A40D7720(v5, v2);
    v8 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v2);
    v3 = objc_msgSend(v6, sel_initWithData_, v8);

  }
  return (GEOStorageRouteRequestStorage *)v3;
}

- (NSData)sharedETAData
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData);
  v3 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData];
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
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v4;
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v5;
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
  v6 = sub_1A41EF848((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A41EEA28(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync29MapsSyncHistoryDirectionsItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A41EFCF4;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync29MapsSyncHistoryDirectionsItem)initWithObject:(id)a3
{
  id v4;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v4 = a3;
  return (_TtC8MapsSync29MapsSyncHistoryDirectionsItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData]);
}

@end
