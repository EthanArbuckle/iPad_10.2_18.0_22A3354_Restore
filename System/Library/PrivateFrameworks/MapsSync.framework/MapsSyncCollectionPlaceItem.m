@implementation MapsSyncCollectionPlaceItem

- (id)copyWithZone:(void *)a3
{
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1A40E2594(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A423C7AC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v2;
  void *v3;

  v2 = self;
  sub_1A40E27B4();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)customName
{
  void *v2;

  if (*(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__customName])
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

- (GEOLatLng)droppedPinCoordinate
{
  unint64_t v3;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v4;
  void *v5;
  uint64_t v6;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v7;
  id v8;

  v3 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate];
  if (v3 >> 60 == 15)
  {
    v4 = self;
    v5 = 0;
  }
  else
  {
    v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate);
    v7 = self;
    sub_1A40D7720(v6, v3);
    v5 = (void *)sub_1A423BF48();
    sub_1A40D7778(v6, v3);
  }
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D27140]), sel_initWithData_, v5);

  return (GEOLatLng *)v8;
}

- (int)droppedPinFloorOrdinal
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinFloorOrdinal);
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2;
  id v3;
  uint64_t v5;
  id v6;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v7;
  void *v8;

  v2 = *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage);
    v6 = objc_allocWithZone(MEMORY[0x1E0D271E8]);
    v7 = self;
    sub_1A40D7720(v5, v2);
    v8 = (void *)sub_1A423BF48();
    sub_1A40D7778(v5, v2);
    v3 = objc_msgSend(v6, sel_initWithData_, v8);

  }
  return (GEOMapItemStorage *)v3;
}

- (signed)origin
{
  return *(_WORD *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__origin);
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__muid));
}

- (BOOL)isDuplicateOfOther:(id)a3
{
  id v4;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A40E2DD0(v4);

  return self & 1;
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
  sub_1A40E30B4(v11, (uint64_t)sub_1A40E758C, v10, a3, a4);

  swift_release();
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v4;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v5;
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
  v6 = sub_1A40E3A20((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A40E3DFC(v4);

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8MapsSync27MapsSyncCollectionPlaceItem *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A40E7080;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A40E7860, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithCollection:(id)a3
{
  return (_TtC8MapsSync27MapsSyncCollectionPlaceItem *)MapsSyncCollectionPlaceItem.init(collection:)(a3);
}

- (_TtC8MapsSync27MapsSyncCollectionPlaceItem)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync27MapsSyncCollectionPlaceItem *)sub_1A40E44F4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__droppedPinCoordinate]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage), *(_QWORD *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__mapItemStorage]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__latitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__longitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync27MapsSyncCollectionPlaceItem__muid));
}

@end
