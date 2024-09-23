@implementation MSHistoryDirectionsItem

- (MSHistoryDirectionsItem)initWithNavigationInterrupted:(BOOL)a3 routeRequestStorage:(id)a4 sharedETAData:(id)a5
{
  void *v5;
  _BOOL8 v7;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  MSHistoryDirectionsItem *v16;

  v5 = a5;
  v7 = a3;
  if (a5)
  {
    v9 = a4;
    v10 = v5;
    v5 = (void *)sub_1A423BF54();
    v12 = v11;

  }
  else
  {
    v13 = a4;
    v12 = 0xF000000000000000;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v14 = qword_1ED1AB9F0;
  if (v12 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    sub_1A40D7734((uint64_t)v5, v12);
    v15 = (void *)sub_1A423BF48();
    sub_1A40D7778((uint64_t)v5, v12);
  }
  v16 = -[MSHistoryDirectionsItem initWithStore:navigationInterrupted:routeRequestStorage:sharedETAData:](self, sel_initWithStore_navigationInterrupted_routeRequestStorage_sharedETAData_, v14, v7, a4, v15);
  sub_1A40D7778((uint64_t)v5, v12);

  return v16;
}

- (MSHistoryDirectionsItem)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 routeRequestStorage:(id)a5 sharedETAData:(id)a6
{
  void *v6;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  MSHistoryDirectionsItem *v18;
  void *v19;
  MSHistoryDirectionsItem *v20;

  v6 = a6;
  if (a6)
  {
    v11 = a3;
    v12 = a5;
    v13 = v6;
    v6 = (void *)sub_1A423BF54();
    v15 = v14;

  }
  else
  {
    v16 = a3;
    v17 = a5;
    v15 = 0xF000000000000000;
  }
  v18 = -[MapsSyncObject initWithStore:](self, sel_initWithStore_, a3);
  v19 = *(Class *)((char *)&v18->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v20 = v18;
  objc_msgSend(v19, sel_lock);
  sub_1A41B3B20((int)v19, a4, a5, (uint64_t)v6, v15, (uint64_t)v20);
  objc_msgSend(v19, sel_unlock);

  sub_1A40D7778((uint64_t)v6, v15);
  return v20;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSHistoryDirectionsItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A41B28EC(v6, a4);

}

- (BOOL)navigationInterrupted
{
  void *v2;
  MSHistoryDirectionsItem *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  MSHistoryDirectionsItem *v4;

  v4 = self;
  sub_1A41B2B0C(a3);

}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  MSHistoryDirectionsItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41B2D3C();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  void *v5;
  MSHistoryDirectionsItem *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A41B429C((uint64_t)v5, a3, (uint64_t)v6);
  objc_msgSend(v5, sel_unlock);

}

- (NSData)sharedETAData
{
  MSHistoryDirectionsItem *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A41B329C();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A423BF48();
    sub_1A40D7778(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setSharedETAData:(id)a3
{
  void *v3;
  MSHistoryDirectionsItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSHistoryDirectionsItem *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_1A423BF54();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_1A41B4C54((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (MSHistoryDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage) = xmmword_1A4243680;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData) = xmmword_1A4243680;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  v8 = a3;
  return (MSHistoryDirectionsItem *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage]);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData]);
}

@end
