@implementation MapsSyncFavoriteItem

- (_TtC8MapsSync20MapsSyncFavoriteItem)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync20MapsSyncFavoriteItem *)sub_1A420AAF4(a3);
}

- (NSString)description
{
  _TtC8MapsSync20MapsSyncFavoriteItem *v2;
  void *v3;

  v2 = self;
  sub_1A420AC78();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSSet)contactHandles
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__contactHandles))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A423C2B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (NSString)customName
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName);
}

- (BOOL)hidden
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden);
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2;
  id v3;
  uint64_t v5;
  id v6;
  _TtC8MapsSync20MapsSyncFavoriteItem *v7;
  void *v8;

  v2 = *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage);
    v6 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
    v7 = self;
    sub_1A40D7720(v5, v2);
    v8 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v2);
    v3 = objc_msgSend(v6, sel_initWithData_, v8);

  }
  return (GEOMapItemStorage *)v3;
}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString);
}

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type);
}

- (signed)source
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source);
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A4115094((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier);
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version);
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid));
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
  _s8MapsSync0aB12FavoriteItemC17fetchNearbyPlaces8latitude9longitude13callbackQueue10completionySd_SdSo17OS_dispatch_queueCySayACGctFZ_0(v11, (uint64_t)sub_1A41A7308, v10, a3, a4);

  swift_release();
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync20MapsSyncFavoriteItem *v4;
  _TtC8MapsSync20MapsSyncFavoriteItem *v5;
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
  v6 = sub_1A420B57C((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync20MapsSyncFavoriteItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A420B980(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync20MapsSyncFavoriteItem *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A420FDFC, v6);

  swift_release();
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage), *(_QWORD *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  void *v13;
  _OWORD v14[2];

  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A421A5DC(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A40CD40C((uint64_t)v14);
}

+ (id)fetchFavoriteItemForIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1A423BFE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BFCC();
  _s8MapsSync0aB12FavoriteItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

+ (id)fetchFavoriteItemForShortcutIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  sub_1A421ACB0(v3, (void (*)(void))sub_1A413CAF4);
  v5 = v4;

  return v5;
}

+ (id)fetchFavoriteItemForOriginatingAddressString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  sub_1A421ACB0(v3, (void (*)(void))sub_1A413CF34);
  v5 = v4;

  return v5;
}

@end
