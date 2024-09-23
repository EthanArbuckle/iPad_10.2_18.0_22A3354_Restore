@implementation MapsSyncHistoryPlaceItem

- (NSString)description
{
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v2;
  void *v3;

  v2 = self;
  sub_1A418E950();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2;
  id v3;
  uint64_t v5;
  id v6;
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v7;
  void *v8;

  v2 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage);
    v6 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
    v7 = self;
    sub_1A40D7720(v5, v2);
    v8 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v2);
    v3 = objc_msgSend(v6, sel_initWithData_, v8);

  }
  return (GEOMapItemStorage *)v3;
}

- (NSUUID)supersededSearchId
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId;
  swift_beginAccess();
  sub_1A410356C((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
  v7 = sub_1A423BFE4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A423BFC0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid));
}

+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a5;
  _s8MapsSync0aB16HistoryPlaceItemC17fetchNearbyPlaces8latitude9longitude13callbackQueue10completionySd_SdSo17OS_dispatch_queueCySayACGctFZ_0(v11, (uint64_t)sub_1A4191238, v10, a3, a4);

  swift_release();
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v4;
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v5;
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
  v6 = sub_1A418EF80((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A418F5CC(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync24MapsSyncHistoryPlaceItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A4190E90;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A4126A80, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync24MapsSyncHistoryPlaceItem)initWithObject:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;

  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage) = xmmword_1A4243680;
  v5 = (char *)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId;
  v6 = sub_1A423BFE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  v7 = a3;
  return (_TtC8MapsSync24MapsSyncHistoryPlaceItem *)sub_1A41D033C(a3);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage]);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId, (uint64_t *)&unk_1ED1ABCE0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid));
}

@end
