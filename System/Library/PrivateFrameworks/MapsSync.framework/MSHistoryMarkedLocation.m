@implementation MSHistoryMarkedLocation

- (MSHistoryMarkedLocation)initWithCustomName:(id)a3 floorOrdinal:(int)a4 latitude:(id)a5 longitude:(id)a6 mapItemStorage:(id)a7 muid:(id)a8
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  MSHistoryMarkedLocation *v23;

  v12 = *(_QWORD *)&a4;
  if (a3)
  {
    sub_1A423C14C();
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v16 = qword_1ED1AB880;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v16 != -1)
    swift_once();
  v21 = qword_1ED1AB9F0;
  if (v15)
  {
    v22 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = -[MSHistoryMarkedLocation initWithStore:customName:floorOrdinal:latitude:longitude:mapItemStorage:muid:](self, sel_initWithStore_customName_floorOrdinal_latitude_longitude_mapItemStorage_muid_, v21, v22, v12, v17, v18, v19, v20);

  return v23;
}

- (MSHistoryMarkedLocation)initWithStore:(id)a3 customName:(id)a4 floorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemStorage:(id)a8 muid:(id)a9
{
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  MSHistoryMarkedLocation *v19;
  void *v20;
  MSHistoryMarkedLocation *v21;
  uint64_t v23;
  id v24;
  id v25;

  if (a4)
  {
    v23 = sub_1A423C14C();
    v15 = v14;
  }
  else
  {
    v23 = 0;
    v15 = 0;
  }
  v16 = a3;
  v25 = a6;
  v24 = a7;
  v17 = a8;
  v18 = a9;
  v19 = -[MapsSyncObject initWithStore:](self, sel_initWithStore_, v16);
  v20 = *(Class *)((char *)&v19->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v21 = v19;
  objc_msgSend(v20, sel_lock);
  sub_1A40D40E0((uint64_t)v20, v23, v15, a5, a6, a7, a8, a9, (uint64_t)v21);
  objc_msgSend(v20, sel_unlock);

  swift_bridgeObjectRelease();
  return v21;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryMarkedLocation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryMarkedLocation *v7;

  v6 = a3;
  v7 = self;
  sub_1A40D468C(v6, a4);

}

- (NSString)customName
{
  MSHistoryMarkedLocation *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A40D49DC();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setCustomName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSHistoryMarkedLocation *v7;

  if (a3)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1A40D7168(v4, v6);

  swift_bridgeObjectRelease();
}

- (int)floorOrdinal
{
  void *v2;
  MSHistoryMarkedLocation *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryMarkedLocation__floorOrdinal);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setFloorOrdinal:(int)a3
{
  MSHistoryMarkedLocation *v4;

  v4 = self;
  sub_1A40D5134(a3);

}

- (NSNumber)latitude
{
  MSHistoryMarkedLocation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40D53D4();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  MSHistoryMarkedLocation *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40D73AC(a3);

}

- (NSNumber)longitude
{
  MSHistoryMarkedLocation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40D5798();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  MSHistoryMarkedLocation *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40D7580(a3);

}

- (GEOMapItemStorage)mapItemStorage
{
  MSHistoryMarkedLocation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40D5B5C();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  void *v5;
  MSHistoryMarkedLocation *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A40D61E8((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);

}

- (NSNumber)muid
{
  MSHistoryMarkedLocation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40D6890();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  MSHistoryMarkedLocation *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A40D7820(a3);

}

- (MSHistoryMarkedLocation)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSHistoryMarkedLocation *)sub_1A40D6EA8(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMarkedLocation__mapItemStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryMarkedLocation__mapItemStorage]);
}

@end
